   M S B A M L   `   `   `  ����  LdapExample    LdapExample.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  
MainWindow��5   	   $	��350��6   $	��525��6)   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5	      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5        $	��100��5      $��40��6!   $��	10,10,0,0q�6B   .��6U   Test6[   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6I   Path6O   �� 5      -   5        $��PathTextBox��5   "   $	��100��6   $��	10,10,0,0q�65   $��Center=�6H   .��6j   LDAP://192.168.45.114:3896�   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6I   
Username6S   �� 5      -   5        $��UserNameTextBox��5   "   $	��100��6   $��	10,10,0,0q�69   $��Center=�6L   6p   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6J   
Password6T   �� 5      -   5        $��PasswordTextBox��5   "   $	��100��6   $��	10,10,0,0q�69   $��Center=�6L   6p   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6I   Filter6Q   �� 5      -   5        $��FilterTextBox��5   "   $	��100��6   $��	10,10,0,0q�67   $��Center=�6J   .��6l   .,(&(objectCategory=person)(objectClass=user))6�   5      �� 5   
   $ 
Horizontal=�6   $��1��6.   .+�5      �� $��	20,10,0,0q�6   $��Center=�6'   .��6I   
Photo path6U   �� 5      -   5        $��PhotoPathTextBox��5   "   $	��100��6   $��	10,10,0,0q�6:   $��Center=�6M   .��6o   thumbnailPhoto6   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6I   	Name path6T   �� 5      -   5        $��NamePathTextBox��5   "   $	��100��6   $��	10,10,0,0q�69   $��Center=�6L   .��6n   	givenName6y   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6I   Surname path6W   �� 5      -   5        $��SuramePathTextBox��5   "   $	��100��6   $��	10,10,0,0q�6;   $��Center=�6N   .��6p   sn6t   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6J   Description path6\   �� 5      -	   5        $��DescriptionPathTextBox��5   "   $	��100��6   $��	10,10,0,0q�6@   $��Center=�6S   .��6u   description6�   �� 5      $��	20,10,0,0q�6   $��Center=�6'   .��6I   	Guid path6T   �� 5       -
   5        $��GuidPathTextBox��5    "   $	��100��6   $��	10,10,0,0q�69   $��Center=�6L   .��6n   
objectguid6z   5!      &   System.Windows.Controls.DataGrid  5"   
   -   5        $��UsersDataGrid��5"      $��2��6(   $��10q�65      Columns 5#      4  .System.Windows.Controls.DataGridTemplateColumn  5$      ,  &System.Windows.Controls.DataGridColumn   
IsReadOnly .    Header$ Фото��6;      Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6I      CellTemplate 5%      �� 5&      .R�5'      �� $��50��6$   $��50��6/   $��Uniform=�6;   ��6M   �� *Photo+6h   5(      5*      0  *System.Windows.Controls.DataGridTextColumn  5+      $
 Name��6%   $
 Auto 6L   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *Name+6[     5,      $ Surname��6%   $
 Auto 6R    66   �� *	Surname+6a     5-      $ Description��6%   $
 Auto 6Z    6:   �� *Description+6i     5.      $
 Guid��6%   $
 Auto 6L    63   �� *Guid+6[   50      51      52      