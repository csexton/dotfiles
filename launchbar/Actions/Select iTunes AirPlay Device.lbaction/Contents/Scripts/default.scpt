FasdUAS 1.101.10   ��   ��    k             l     ��  ��    = 7 Copyright (c) 2014 Objective Development Software GmbH     � 	 	 n   C o p y r i g h t   ( c )   2 0 1 4   O b j e c t i v e   D e v e l o p m e n t   S o f t w a r e   G m b H   
  
 l     ��  ��      http://www.obdev.at/     �   *   h t t p : / / w w w . o b d e v . a t /      l     ��������  ��  ��        l     ��  ��    < 6 This handler is called when the user runs the action:     �   l   T h i s   h a n d l e r   i s   c a l l e d   w h e n   t h e   u s e r   r u n s   t h e   a c t i o n :      i         I     ������
�� .aevtoappnull  �   � ****��  ��    k     �       r         J     ����    o      ���� 0 
devicelist 
deviceList       l   ��������  ��  ��      ! " ! O    � # $ # k   	 � % %  & ' & r   	  ( ) ( 2  	 ��
�� 
cAPD ) o      ���� 0 _devices   '  * + * l   ��������  ��  ��   +  , - , l   �� . /��   . > 8 Build up a list of all AirPlay devices known to iTunes:    / � 0 0 p   B u i l d   u p   a   l i s t   o f   a l l   A i r P l a y   d e v i c e s   k n o w n   t o   i T u n e s : -  1�� 1 X    � 2�� 3 2 k    � 4 4  5 6 5 r    & 7 8 7 c    $ 9 : 9 l   " ;���� ; n    " < = < 1     "��
�� 
pnam = o     ���� 0 _device  ��  ��   : m   " #��
�� 
TEXT 8 o      ���� 
0 _title   6  > ? > r   ' . @ A @ l  ' , B���� B c   ' , C D C n   ' * E F E 1   ( *��
�� 
pPIS F o   ' (���� 0 _device   D m   * +��
�� 
TEXT��  ��   A o      ���� 0 	_deviceid 	_deviceID ?  G H G r   / 2 I J I m   / 0 K K � L L  u n k n o w n J o      ���� 0 	_subtitle   H  M N M l  3 3��������  ��  ��   N  O P O Z   3 J Q R�� S Q =  3 8 T U T l  3 6 V���� V n   3 6 W X W 1   4 6��
�� 
selc X o   3 4���� 0 _device  ��  ��   U m   6 7��
�� boovtrue R r   ; @ Y Z Y m   ; < [ [ � \ \ $ A i r P l a y A c t i v e . i c n s Z o      ���� 	0 _icon  ��   S r   C J ] ^ ] m   C F _ _ � ` `  A i r P l a y . i c n s ^ o      ���� 	0 _icon   P  a b a l  K K��������  ��  ��   b  c d c Z   K � e f g�� e =  K T h i h l  K P j���� j n   K P k l k 1   L P��
�� 
pKnd l o   K L���� 0 _device  ��  ��   i m   P S��
�� eAPDkAPT f r   W \ m n m m   W Z o o � p p  A p p l e   T V n o      ���� 0 	_subtitle   g  q r q =  _ h s t s l  _ d u���� u n   _ d v w v 1   ` d��
�� 
pKnd w o   _ `���� 0 _device  ��  ��   t m   d g��
�� eAPDkAPC r  x y x r   k p z { z m   k n | | � } }  C o m p u t e r { o      ���� 0 	_subtitle   y  ~  ~ =  s | � � � l  s x ����� � n   s x � � � 1   t x��
�� 
pKnd � o   s t���� 0 _device  ��  ��   � m   x {��
�� eAPDkAPX   � � � r    � � � � m    � � � � � �  A i r P o r t   E x p r e s s � o      ���� 0 	_subtitle   �  � � � =  � � � � � c   � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
pKnd � o   � ����� 0 _device  ��  ��   � m   � ���
�� 
TEXT � m   � � � � � � �  A i r P l a y   d e v i c e �  ��� � r   � � � � � m   � � � � � � �  A i r P l a y   D e v i c e � o      ���� 0 	_subtitle  ��  ��   d  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � q k When the user selects this item, the "selectDevice" handler will be called with _deviceID as the argument:    � � � � �   W h e n   t h e   u s e r   s e l e c t s   t h i s   i t e m ,   t h e   " s e l e c t D e v i c e "   h a n d l e r   w i l l   b e   c a l l e d   w i t h   _ d e v i c e I D   a s   t h e   a r g u m e n t : �  ��� � r   � � � � � b   � � � � � o   � ����� 0 
devicelist 
deviceList � J   � � � �  ��� � K   � � � � �� � ��� 	0 title   � o   � ����� 
0 _title   � �� � ��� 0 subtitle   � o   � ����� 0 	_subtitle   � �� � ��� 
0 action   � m   � � � � � � �  s e l e c t D e v i c e � �� � ���  0 actionargument actionArgument � o   � ����� 0 	_deviceid 	_deviceID � �� ����� 0 icon   � o   � ����� 	0 _icon  ��  ��   � o      ���� 0 
devicelist 
deviceList��  �� 0 _device   3 o    ���� 0 _devices  ��   $ m     � ��                                                                                  hook  alis    P  Macintosh SSD              ��� H+  �:
iTunes.app                                                     r�>�_�        ����  	                Applications    ���      �^�~    �:  &Macintosh SSD:Applications: iTunes.app   
 i T u n e s . a p p    M a c i n t o s h   S S D  Applications/iTunes.app   / ��   "  � � � l  � ���������  ��  ��   �  � � � L   � � � � o   � ����� 0 
devicelist 
deviceList �  ��� � l  � ���������  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � l     �� � ���   � � � This handler is called when the user selects one of the resulting items of the "run" handler and hits enter. The _deviceID argument is the one that was set when the item was created in "run":    � � � ��   T h i s   h a n d l e r   i s   c a l l e d   w h e n   t h e   u s e r   s e l e c t s   o n e   o f   t h e   r e s u l t i n g   i t e m s   o f   t h e   " r u n "   h a n d l e r   a n d   h i t s   e n t e r .   T h e   _ d e v i c e I D   a r g u m e n t   i s   t h e   o n e   t h a t   w a s   s e t   w h e n   t h e   i t e m   w a s   c r e a t e d   i n   " r u n " : �  � � � i     � � � I      �� ����� 0 selectdevice selectDevice �  ��� � o      ���� 0 	_deviceid 	_deviceID��  ��   � O     * � � � k    ) � �  � � � r     � � � l    ����� � 6    � � � 4   �� �
�� 
cAPD � m    ����  � =  	  � � � 1   
 ��
�� 
pPIS � o    ���� 0 	_deviceid 	_deviceID��  ��   � o      ����  0 _airplaydevice _airPlayDevice �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � - ' Select or deselect the AirPlay device:    � � � � N   S e l e c t   o r   d e s e l e c t   t h e   A i r P l a y   d e v i c e : �  ��� � Z    ) � ��� � � l    ����� � =    � � � n     � � � 1    ��
�� 
selc � o    ����  0 _airplaydevice _airPlayDevice � m    �
� boovtrue��  ��   � r    ! � � � m    �~
�~ boovfals � n       � � � 1     �}
�} 
selc � o    �|�|  0 _airplaydevice _airPlayDevice��   � r   $ ) � � � m   $ %�{
�{ boovtrue � n       � � � 1   & (�z
�z 
selc � o   % &�y�y  0 _airplaydevice _airPlayDevice��   � m      � ��                                                                                  hook  alis    P  Macintosh SSD              ��� H+  �:
iTunes.app                                                     r�>�_�        ����  	                Applications    ���      �^�~    �:  &Macintosh SSD:Applications: iTunes.app   
 i T u n e s . a p p    M a c i n t o s h   S S D  Applications/iTunes.app   / ��   �  ��x � l     �w�v�u�w  �v  �u  �x       �t � � ��t   � �s�r
�s .aevtoappnull  �   � ****�r 0 selectdevice selectDevice � �q �p�o � ��n
�q .aevtoappnull  �   � ****�p  �o   � �m�m 0 _device   � "�l ��k�j�i�h�g�f�e�d�c�b K�a�` [�_ _�^�] o�\ |�[ � � ��Z�Y�X ��W�V�U�l 0 
devicelist 
deviceList
�k 
cAPD�j 0 _devices  
�i 
kocl
�h 
cobj
�g .corecnte****       ****
�f 
pnam
�e 
TEXT�d 
0 _title  
�c 
pPIS�b 0 	_deviceid 	_deviceID�a 0 	_subtitle  
�` 
selc�_ 	0 _icon  
�^ 
pKnd
�] eAPDkAPT
�\ eAPDkAPC
�[ eAPDkAPX�Z 	0 title  �Y 0 subtitle  �X 
0 action  �W  0 actionargument actionArgument�V 0 icon  �U 
�n �jvE�O� �*�-E�O ��[��l kh  ��,�&E�O��,�&E�O�E�O��,e  
�E` Y 	a E` O�a ,a   
a E�Y A�a ,a   
a E�Y -�a ,a   
a E�Y �a ,�&a   
a E�Y hO�a �a �a a a �a  _ a !kv%E�[OY�XUO�OP � �T ��S�R � ��Q�T 0 selectdevice selectDevice�S �P ��P  �  �O�O 0 	_deviceid 	_deviceID�R   � �N�M�N 0 	_deviceid 	_deviceID�M  0 _airplaydevice _airPlayDevice �  ��L ��K�J
�L 
cAPD �  
�K 
pPIS
�J 
selc�Q +� '*�k/�[�,\Z�81E�O��,e  
f��,FY e��,FU ascr  ��ޭ