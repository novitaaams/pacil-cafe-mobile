# TUGAS 6
##  Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
- Stateless widget adalah widget yang tidak memiliki data atau status internal yang berubah. Mereka digunakan ketika komponen hanya perlu merender tampilan yang tidak akan berubah seiring waktu atau berdasarkan input eksternal. Stateless widget merender tampilan dengan cara yang tidak mempertahankan atau memperbarui status internal. Ini berarti ketika ada perubahan yang mempengaruhi widget ini, Anda harus membuat widget baru untuk menggantikannya. Contoh: Text, Icon, Image.
- Stateful widget adalah widget yang memiliki data atau status internal yang dapat berubah selama masa hidup widget tersebut. Mereka digunakan ketika Anda perlu mengelola perubahan tampilan berdasarkan perubahan data atau input pengguna. Stateful widget memiliki dua bagian utama: widget (yang bersifat stateless) dan objek State terkait yang mengelola status internal. Ketika status berubah, State akan membangun ulang widget untuk merefleksikan perubahan tersebut. Contoh: TextField, Checkbox, Slider.


## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
