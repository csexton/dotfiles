" ColorSchemeSDK.vim:	Creates HTML table of color schemes to assist
" 					in tweaking the color selection algorithm.
" Maintainer:		Erik Falor <rAjsBnFCybe@tzNnvy.Zpbz g?? - NOSPAM>
" Date:				Sept 14, 2007
" Version:			0.6
" License:			If you copy this, just give me props.
"
" History:
"   Version 0.1:	Created an SDK mode that creates an HTML page
"   				which aids in tweaking the color selection algorithm.
"   				To enable this mode, set the variable
"   				g:ColorSchemeSDKMode to point to the directory where
"   				your plugins are installed: this is used to define a
"   				key mapping that will generate the HTML in the CWD.
"   				
"   				For example, if you
"   					:let g:ColorSchemeSDKMode = '~/.vim'
"   				then the F5 key will execute the following command:
"so ~/.vim/autoload/ColorSchemeSDK.vim | so ~/.vim/plugin/ColorSchemeMenuMaker.vim | call GenHTML() 

" Functions {{{
"You can't return a Dict from VIM::Eval() because (apparently) it would
"be using a Dict as a String, which is a no-no.  This wrapper turns the
"Dict into a List, which can be stringified.
function! ColorSchemeSDK#DictHelper(d) "{{{
	let list = []
	for [k,v] in items(a:d)
		call add(list, k . ':' . v)
	endfor
	return list
endfunction "}}}

"Teh workhorse function... called from within ColorSchemeMenuMaker.vim
function! ColorSchemeSDK#GenHTML(dest, funcs) "{{{
	echom "If this is the only message you can see, there's something wrong with your perl"
	perl <<GenerateHTML
#
#Perl script begin
#
use File::Basename;

#{{{ utility functions
@Colors = qw(white black yellow green cyan blue magenta red grey offwhite);
@ColorNames = @Colors;
%ColorNamesToHex = ( 	white	 => 'FFFFFF',
						black	 => '000000',
						yellow	 => 'FFFF00',
						green	 => '00FF00',
						cyan	 => '00FFFF',
						blue	 => '0000FF',
						magenta	 => 'FF00FF',
						red		 => 'FF0000',
						grey	 => '808080',
						offwhite => 'FFF5EE',
						darkgrey => '1A1A1A',
						unknown  => 'FFFFFF',
						purple	 => '7D26CD',
						orange   => 'FFA500',
					);
%HexToColorNames = ( 	'FFFFFF'	=> 'white',
						'000000'	=> 'black',
						'FFFF00'	=> 'yellow',
						'00FF00'	=> 'green',
						'00FFFF'	=> 'cyan',
						'0000FF'	=> 'blue',
						'FF00FF'	=> 'magenta',
						'FF0000'	=> 'red',
						'808080'	=> 'grey',
						'FFF5EE'	=> 'offwhite',
						'1A1A1A'	=> 'darkgrey',
						'FFFFFF'	=> 'unknown',
						'7D26CD'	=> 'purple',
						'FFA500'	=> 'orange',
					);

#return dict mapping rgb.txt entries to a Hex Triplet
sub Name2RGB {
	#the first item returned in List context is the success of the Eval()'ed function.
	(undef, @vimDict) = VIM::Eval('ColorSchemeSDK#DictHelper(a:funcs["RgbTxt2Hexes"]())');
	%simple = map {split /[:\n]/} @vimDict;
	$simple{none} = '#FFFFFF';
	return \%simple;
}

sub xorColor {
	if ( $_[0] == $_[1] and $_[1] == $_[2] and ($_[0] != 0 and $_[0] != 255)) {
		if ($_[0] >= 128 and $_[0] < 164) {
			#return map { abs(($_ ^ 255 - 128) % 255)  } @_
			return(0, 0, 0);
		}
		elsif ($_[0] < 128 and $_[0] > 92) {
			#return map { abs(($_ - 64) % 255)  } @_
			return(255, 255, 255);
		}
	}
	return map { $_ ^ 255 } @_
}

sub PrintThemeRow { #{{{
	print <<ROW; 
				<tr>
					<td width="20%" bgcolor="$notify">
						<a href="file://$theme">$themeName</a>
					</td>
					<!-- ACTUAL Hex RGB -->
					<td width="10%" align="center" bgcolor="$actual">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @xors)]}; font-weight:bold">
							@{[sprintf('#%.2X%.2X%.2X', $red, $green, $blue ) ]}
						</font>
					</td>
					<!-- ACTUAL Color RGB -->
					<td width="15%" align="center" bgcolor="$actual">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @xors)]}; font-weight:bold">
							@{[sprintf('rgb(%d, %d, %d)', $red, $green, $blue,) ]}
						</font>
					</td>
					<!-- ACTUAL Color HSV -->
					<td width="15%" align="center" bgcolor="$actual">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @xors)]}; font-weight:bold">
							@{[sprintf('hsv(%d, %d, %d)', $h, $s, $v) ]}
						</font>
					</td>
					<!-- ACTUAL Color -->
					<td width="10%" bgcolor="@{[sprintf('#%.2X%.2X%.2X', $red, $green, $blue) ]}"/>
					<!-- GUESSED COLOR 1 -->
					<td width="10%" bgcolor="#@{[$ColorNamesToHex{$guess1{$theme}}]}">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @guessXors)]}; font-weight:bold">$guess1{$theme}</font>
						<!-- <font style="color:#FFFFFF; font-weight:bold">$guess1{$theme}</font> -->
					</td>
					<!-- GUESSED COLOR 2 -->
					<td width="10%" bgcolor="#@{[$ColorNamesToHex{$guess2{$theme}}]}">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @guess2Xors)]}; font-weight:bold">$guess2{$theme}</font>
					</td>
					<!-- GUESSED COLOR 3 -->
					<td width="10%" bgcolor="#@{[$ColorNamesToHex{$guess3{$theme}}]}">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @guess3Xors)]}; font-weight:bold">$guess3{$theme}</font>
					</td>
				</tr>
ROW
} #}}}

sub PrintColorRow { #{{{
	print <<ROW; 
				<tr>
					<td width="20%" bgcolor="$notify">
						<b>$colorName</b>
					</td>
					<!-- ACTUAL Hex RGB -->
					<td width="10%" align="center" bgcolor="$actual">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @xors)]}; font-weight:bold">
							@{[sprintf('#%.2X%.2X%.2X', $red, $green, $blue ) ]}
						</font>
					</td>
					<!-- ACTUAL Color RGB -->
					<td width="15%" align="center" bgcolor="$actual">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @xors)]}; font-weight:bold">
							@{[sprintf('rgb(%d, %d, %d)', $red, $green, $blue,) ]}
						</font>
					</td>
					<!-- ACTUAL Color HSV -->
					<td width="15%" align="center" bgcolor="$actual">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @xors)]}; font-weight:bold">
							@{[sprintf('hsv(%d, %d, %d)', $h, $s, $v) ]}
						</font>
					</td>
					<!-- ACTUAL Color -->
					<td width="10%" bgcolor="@{[sprintf('#%.2X%.2X%.2X', $red, $green, $blue) ]}"/>
					<!-- GUESSED COLOR 1 -->
					<td width="10%" bgcolor="#@{[$ColorNamesToHex{$guess1{$colorName}}]}">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @guessXors)]}; font-weight:bold">$guess1{$colorName}</font>
						<!-- <font style="color:#FFFFFF; font-weight:bold">$guess1{$colorName}</font> -->
					</td>
					<!-- GUESSED COLOR 2 -->
					<td width="10%" bgcolor="#@{[$ColorNamesToHex{$guess2{$colorName}}]}">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @guess2Xors)]}; font-weight:bold">$guess2{$colorName}</font>
					</td>
					<!-- GUESSED COLOR 3 -->
					<td width="10%" bgcolor="#@{[$ColorNamesToHex{$guess3{$colorName}}]}">
						<font style="color:@{[sprintf('#%.2X%.2X%.2X', @guess3Xors)]}; font-weight:bold">$guess3{$colorName}</font>
					</td>
				</tr>
ROW
} #}}}

sub PrintTableTail { #{{{
	print <<TABLETAIL;
				</tbody>
			</table>
TABLETAIL
} #}}}

sub PrintHTMLHead { #{{{
	print <<HTMLHEAD;
<html>
    <head>
        <title>Vim Color Scheme Guessed Background Colors</title>
    </head>
    <body>
    <h1>Vim Color Scheme Guessed Background Colors</h1>
HTMLHEAD
} #}}}

sub PrintThemeTableHead { #{{{
	print <<TABLEHEAD;
			<table width="100%" align="center" border="1px solid #AAAAAA">
				<tbody>
					<tr>
						<td width="20%">
							<b>Theme Name</b>
						</td>
						<td width="10%">
							<b>Actual Hex RGB</b>
						</td>
						<td width="15%">
							<b>Actual Color RGB</b>
						</td>
						<td width="15%">
							<b>Actual Color HSV</b>
						</td>
						<td width="10%">
							<b>Actual Color</b>
						</td>
						<td width="10%">
							<b>Guessed Color 1</b>
						</td>
						<td width="10%">
							<b>Guessed Color 2</b>
						</td>
						<td width="10%">
							<b>Guessed Color 3</b>
						</td>
					</tr>
TABLEHEAD
} #}}}

sub PrintColorTableHead { #{{{
	print <<TABLEHEAD;
			<table width="100%" align="center" border="1px solid #AAAAAA">
				<tbody>
					<tr>
						<td width="20%">
							<b>Color Name</b>
						</td>
						<td width="10%">
							<b>Actual Hex RGB</b>
						</td>
						<td width="15%">
							<b>Actual Color RGB</b>
						</td>
						<td width="15%">
							<b>Actual Color HSV</b>
						</td>
						<td width="10%">
							<b>Actual Color</b>
						</td>
						<td width="10%">
							<b>Guessed Color 1</b>
						</td>
						<td width="10%">
							<b>Guessed Color 2</b>
						</td>
						<td width="10%">
							<b>Guessed Color 3</b>
						</td>
					</tr>
TABLEHEAD
} #}}}

sub PrintHTMLTail { #{{{
	print <<HTMLTAIL;
    </body>
</html>
HTMLTAIL
} #}}}

sub RGBHexToHexes {
	return shift =~ /#?([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/
}

sub RGBHexToInts {
	return map {hex} shift =~ /#?([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/
}
#}}}

$name2hex = Name2RGB();
$hostname = VIM::Eval("hostname()");
$destfile = VIM::Eval("a:dest");

%guess3 = %guess2;
%guess2 = %guess1;

open $OUT_HTML, '>', $destfile
	or die "Cannot open '$destfile' for write because !$\n";
select $OUT_HTML;

PrintHTMLHead();

our $oldDir;
our $now = time;

foreach our $theme ( split /\n/, VIM::Eval('a:funcs["GlobThemes"]()') ) { #{{{
	our $dir = dirname($theme);

	if ($oldDir ne $dir) { #{{{
		if (defined $oldDir) {
			PrintTableTail();
		}
		$oldDir = $dir;

		print <<NEWPATH;
			<br/>
			<a href="file://$dir"><h2>$dir</h2></a>
NEWPATH
		PrintThemeTableHead();
	}# if ($oldDir ne $dir)  }}}

	(our $themeName) = basename($theme) =~ /([^.]+)/;
	print "<!-- $themeName - $theme -->\n";
	open my $THM, '<', $theme
		or die "Can't open '$theme' for read because: $!\n";

	while ($line = <$THM>) {
		next unless $line;
		next if $line =~ /^\s*$/;
		last if $line =~ /^exe.*\s+Normal/;
		next unless $line =~ /hi.*\s+Normal\s+.*?guibg/;
		($guibg) = $line =~ /guibg=(#?\w+)/;
	}
	our $actual;
	if (defined $guibg and $guibg =~ /^#?[[:xdigit:]]{6}$/) {
		print "<!-- guibg is defined and #xxxxxx-->\n";
		$actual = $guibg;
		$guess1{$theme} = VIM::Eval("a:funcs['RGB2BoyColor'](\"$guibg\")");
	}
	elsif (defined $guibg and $guibg =~ /^\w+$/
			and exists $$name2hex{lc $guibg}) {
		print "<!-- guibg is defined and is in rgb.txt-->\n";
		$actual = $$name2hex{lc $guibg};
		$guess1{$theme} = VIM::Eval("a:funcs['RGB2BoyColor'](\"$actual\")");
	}
	else {
		print "<!-- guibg is NOT defined -->\n";
		$actual = '#FFFFFF';
		$guess1{$theme} = VIM::Eval("a:funcs['RGB2BoyColor'](\"$actual\")");
	}

	our ($Xred, $Xgreen, $Xblue) =
		$actual =~  /#?([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/;
	next if ($Xred eq undef);
	
	our ($red, $green, $blue) = map {hex} ($Xred, $Xgreen, $Xblue);
	our ($h, $s, $v) = split /\n/, VIM::Eval(qq{a:funcs['RGBtoHSV']($red, $green, $blue)});
	print "<!--**$themeName\n" .
		"guess=$guess1{$theme}\n".
		"guibg=$guibg\n".
		"actual=$actual\n".
		"hexes=$Xred$Xgreen$Xblue\n".
		"rgb($red, $green, $blue)\n".
		"hsv($h, $s, $v)**-->\n";

	our @xors = xorColor( $red, $green, $blue );
	our @guessXors = xorColor( map {hex $_} $ColorNamesToHex{$guess1{$theme}} =~ /([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ );

	our @guess2Xors;
	if ( $guess2{$theme} eq 'unknown' ) {
		@guess2Xors = (255, 0, 0)
	}
	else {
		@guess2Xors = xorColor( map {hex $_} $ColorNamesToHex{$guess2{$theme}} =~ /([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ );
	}

	our @guess3Xors;
	if ( $guess3{$theme} eq 'unknown' ) {
		@guess3Xors = (255, 0, 0)
	}
	else {
		@guess3Xors = xorColor( map {hex $_} $ColorNamesToHex{$guess3{$theme}} =~ /([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ );
	}

	our $notify;
	if ( ($guess1{$theme} ne $guess2{$theme} and exists $guess2{$theme})
		or ($guess1{$theme} ne $guess3{$theme} and exists $guess3{$theme}) ) {
		$notify = '#FF0000'
	}
	else {
		$notify = '#FFFFFF'
	}
	PrintThemeRow();

	close $THM
		or die "Can't close '$theme' because: $!\n";
} #}}} foreach our $theme ( split /\n/, VIM::Eval('a:funcs["GlobThemes"]()') )
PrintTableTail();


my $rgbtxt = VIM::Eval('a:funcs["FindRgbTxt"]()');
print <<RGBTXT;
			<br/>
			<a href="file://$rgbtxt"><h2>$rgbtxt</h2></a>
RGBTXT
PrintColorTableHead();
foreach our $colorName ( sort keys %$name2hex ) {
	our $color = $$name2hex{$colorName};
	our $actual;
	if (defined $color and $color =~ /^#?[[:xdigit:]]{6}$/) {
		$actual = $color;
		$guess1{$colorName} = VIM::Eval("a:funcs['RGB2BoyColor'](\"$color\")");
	}
	our ($Xred, $Xgreen, $Xblue) =
		$actual =~  /#?([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/;
	next if ($Xred eq undef);
	our ($red, $green, $blue) = map {hex} ($Xred, $Xgreen, $Xblue);
	our ($h, $s, $v) = split /\n/, VIM::Eval(qq{a:funcs['RGBtoHSV']($red, $green, $blue)});
	print "<!--**$colorName => $color\n" .
		"guess=$guess1{$colorName}\n".
		"actual=$actual\n".
		"hexes=$Xred$Xgreen$Xblue\n".
		"rgb($red, $green, $blue)\n".
		"hsv($h, $s, $v)**-->\n";
	our @xors = xorColor( $red, $green, $blue );
	our @guessXors = xorColor( map {hex $_} $ColorNamesToHex{$guess1{$colorName}} =~ /([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ );

	our @guess2Xors;
	if ( $guess2{$theme} eq 'unknown' ) {
		@guess2Xors = (255, 0, 0)
	}
	else {
		@guess2Xors = xorColor( map {hex $_} $ColorNamesToHex{$guess2{$colorName}} =~ /([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ );
	}

	our @guess3Xors;
	if ( $guess3{$theme} eq 'unknown' ) {
		@guess3Xors = (255, 0, 0)
	}
	else {
		@guess3Xors = xorColor( map {hex $_} $ColorNamesToHex{$guess3{$colorName}} =~ /([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ );
	}

	our $notify;
	if ( ($guess1{$colorName} ne $guess2{$colorName} and exists $guess2{$colorName})
		or ($guess1{$colorName} ne $guess3{$colorName} and exists $guess3{$colorName}) ) {

		$notify = '#FF0000'
	}
	else {
		$notify = '#FFFFFF'
	}
	PrintColorRow();

}
PrintTableTail();

PrintHTMLTail();

VIM::Msg("Created $destfile in " . VIM::Eval("getcwd()") . " on " . $hostname);
close $OUT_HTML;
GenerateHTML
	return "done"
endfunction

"}}}

"}}}
" vim:foldmethod=marker:
