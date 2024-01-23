.model small
.code
org 100h
start:
         jmp mulai
lanjut       db 13,10,'Tekan y untuk lanjut : $'

masukkan  db 13,10,'Silahkan Masukkan No/Kode Menu yang Anda pilih: $'
      

daftar db 13,10,'+-------------------------------------------------+'
       db 13,10,'|                 DAFTAR LIST MENU                |'
       db 13,10,'+-------------------------------------------------+'
       db 13,10,'|NO| NAMA TENDA           | HARGA                 |'
       db 13,10,'+-------------------------------------------------+'
       db 13,10,'|1 | Tenda Montana 3-4P   | RP.20.000/hari        |' 
       db 13,10,'+-------------------------------------------------+'
       db 13,10,'|2 | Consina Magnum 4P    | RP.30.000/hari        |'
       db 13,10,'+-------------------------------------------------+'
       db 13,10,'|3 | Tenda Pramuka 10P    | RP.50.000/hari        |'
       db 13,10,'+-------------------------------------------------+','$'




    mulai:        
     mov ah,09h
	 mov dx,offset daftar
	 int 21h
	 mov ah,09h 
	 mov dx,offset lanjut
	 int 21h
	 mov ah,01h
	 int 21h
	 cmp al,'y'
	 jmp proses
	 jne error_msg



error_msg:
        mov ah,09h
        mov dx,offset error_msg
        int 21h
        int 20h

proses:
        mov ah,09h
        mov dx,offset masukkan
        int 21h

        mov ah,01
        int 21h
        mov bh,al
       
       
        cmp al,'1'
        je hasil1

        
        cmp al,'2'
        je hasil2 
        
        cmp al,'3'
        je hasil3

        
hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h

hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h 

hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h


       
;================================================================

teks1  db 13,10,' '
       db 13,10,'Anda Memilih Tenda Montana Kapasitas 3-4 orang '
       db 13,10,'Harga Yang Harus Anda Bayar : RP.20.000/hari'
       db 13,10,'Terima Kasih $'

teks2  db 13,10,' '
       db 13,10,'Anda Memilih Consina Magnum Kapasitas 4 orang'
       db 13,10,'Harga Yang Harus Anda Bayar : RP.30.000/hari'
       db 13,10,'Terima Kasih $'
       
teks3  db 13,10,' '
       db 13,10,'Anda Memilih Tenda Pramuka Kapasitas 10 orang'
       db 13,10,'Harga Yang Harus Anda Bayar : RP.50.000/hari'
       db 13,10,'Terima Kasih $'

       
