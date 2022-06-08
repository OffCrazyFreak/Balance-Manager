
; This program will allow you to input your money, calculate and store the information in a notepad called records

#MaxMem 1024 ; max size of variable is 1 GB

#SingleInstance Force

SetTitleMatchMode, 3 ; for moving the window (must contain)

Menu, Tray, Icon, %A_ScriptDir%\Icons\Money.ico

;=================================_====================================
;========================= Specs & Coords =============================
;=================================_====================================

euro_to_kuna_conversion_rate := 7.5

;============================== Other =================================

window_w := 440 ; 2 * 30 + 130 + 95 + 95 + 2 * (3 * 10)
window_h := 660 ; 30 + 5 + 2 * 20 + 13 * 35 + 14 * 10

current_w := 0
current_h := 0


controls_h := 35 ; height for all controls


distance_between_controls := 10
distance_to_border := 20

;=================================_====================================
;=============================== Tabs =================================
{
tab_w := window_w - 2 * 10 ; 420
tab_h := window_h - 2 * 10 ; 480

tab_x := 10
tab_y := 10
}


;=================================_====================================
;======================== Currency Controls ===========================
{
currency_text_w := 80 ; fits text

currency_text_x := tab_x + distance_to_border ; 10 + 20 = 30
currency_text_y := tab_y + 20 + distance_to_border ; 10 + 20 + 20 = 50


currency_ddl_w := 70 ; fits text

currency_ddl_x := currency_text_x + currency_text_w + distance_between_controls ; 30 + 80 + 20 = 130
currency_ddl_y := currency_text_y ; 50
}
;=================================_====================================
;========================== Date Control ==============================
{
calendar_w := 195 ; fits calendar

calendar_x := tab_x + tab_w - distance_to_border - calendar_w ; 10 + 680 - 20 - 195 = 495
calendar_y := currency_text_y ; 50


date_ddl_w := 195 ; fits calendar

date_ddl_x := tab_x + tab_w - distance_to_border - date_ddl_w ; 10 + 680 - 20 - 195 = 495
date_ddl_y := currency_text_y ; 50
}
;=================================_====================================
;========================= Bills Controls =============================
{
kuna_bill_200_pic_w := 2 * controls_h ; 70

kuna_bill_200_pic_x := currency_text_x ; 30
kuna_bill_200_pic_y := currency_text_y + controls_h + 3 * distance_between_controls ; 60 + 35 + 2 * 10 = 115


kuna_bill_200_times_text_w := 10 ; fits text

kuna_bill_200_times_text_x := kuna_bill_200_pic_x + kuna_bill_200_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_bill_200_times_text_y := kuna_bill_200_pic_y


kuna_bill_200_edit_w := 30 ; fits text

kuna_bill_200_edit_x := kuna_bill_200_times_text_x + kuna_bill_200_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_bill_200_edit_y := kuna_bill_200_pic_y

;=================================_====================================

kuna_bill_100_pic_w := 2 * controls_h ; 70

kuna_bill_100_pic_x := kuna_bill_200_pic_x ; 30
kuna_bill_100_pic_y := kuna_bill_200_pic_y + controls_h + distance_between_controls ; 105 + 70 + 10 = 185


kuna_bill_100_times_text_w := 10 ; fits text

kuna_bill_100_times_text_x := kuna_bill_100_pic_x + kuna_bill_100_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_bill_100_times_text_y := kuna_bill_100_pic_y


kuna_bill_100_edit_w := 30 ; fits text

kuna_bill_100_edit_x := kuna_bill_100_times_text_x + kuna_bill_100_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_bill_100_edit_y := kuna_bill_100_pic_y

;=================================_====================================

kuna_bill_50_pic_w := 2 * controls_h ; 70

kuna_bill_50_pic_x := kuna_bill_100_pic_x ; 30
kuna_bill_50_pic_y := kuna_bill_100_pic_y + controls_h + distance_between_controls ; 185 + 70 + 10 = 265


kuna_bill_50_times_text_w := 10 ; fits text

kuna_bill_50_times_text_x := kuna_bill_50_pic_x + kuna_bill_50_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_bill_50_times_text_y := kuna_bill_50_pic_y


kuna_bill_50_edit_w := 30 ; fits text

kuna_bill_50_edit_x := kuna_bill_50_times_text_x + kuna_bill_50_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_bill_50_edit_y := kuna_bill_50_pic_y

;=================================_====================================

kuna_bill_20_pic_w := 2 * controls_h ; 70

kuna_bill_20_pic_x := kuna_bill_50_pic_x ; 30
kuna_bill_20_pic_y := kuna_bill_50_pic_y + controls_h + distance_between_controls ; 265 + 70 + 10 = 345


kuna_bill_20_times_text_w := 10 ; fits text

kuna_bill_20_times_text_x := kuna_bill_20_pic_x + kuna_bill_20_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_bill_20_times_text_y := kuna_bill_20_pic_y


kuna_bill_20_edit_w := 30 ; fits text

kuna_bill_20_edit_x := kuna_bill_20_times_text_x + kuna_bill_20_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_bill_20_edit_y := kuna_bill_20_pic_y

;=================================_====================================

kuna_bill_10_pic_w := 2 * controls_h ; 70

kuna_bill_10_pic_x := kuna_bill_20_pic_x ; 30
kuna_bill_10_pic_y := kuna_bill_20_pic_y + controls_h + distance_between_controls ; 345 + 70 + 10 = 425


kuna_bill_10_times_text_w := 10 ; fits text

kuna_bill_10_times_text_x := kuna_bill_10_pic_x + kuna_bill_10_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_bill_10_times_text_y := kuna_bill_10_pic_y


kuna_bill_10_edit_w := 30 ; fits text

kuna_bill_10_edit_x := kuna_bill_10_times_text_x + kuna_bill_10_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_bill_10_edit_y := kuna_bill_10_pic_y

;=================================_====================================

kuna_bills_sum_edit_w := kuna_bill_10_pic_w + kuna_bill_10_times_text_w + kuna_bill_10_edit_w + 2 * distance_between_controls ; 70 + 10 + 30 + 2 * 10 = 130

kuna_bills_sum_edit_x := kuna_bill_10_pic_x ; 30
kuna_bills_sum_edit_y := kuna_bill_10_pic_y + controls_h + distance_between_controls ; 425 + 70 + 10 = 505


;=================================_====================================
;=================================_====================================

euro_bill_100_pic_w := 2 * controls_h ; 70

euro_bill_100_pic_x := currency_text_x ; 30
euro_bill_100_pic_y := currency_text_y + controls_h + 3 * distance_between_controls ; 60 + 35 + 2 * 10 = 115


euro_bill_100_times_text_w := 10 ; fits text

euro_bill_100_times_text_x := euro_bill_100_pic_x + euro_bill_100_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_bill_100_times_text_y := euro_bill_100_pic_y


euro_bill_100_edit_w := 30 ; fits text

euro_bill_100_edit_x := euro_bill_100_times_text_x + euro_bill_100_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_bill_100_edit_y := euro_bill_100_pic_y

;=================================_====================================

euro_bill_50_pic_w := 2 * controls_h ; 70

euro_bill_50_pic_x := euro_bill_100_pic_x ; 30
euro_bill_50_pic_y := euro_bill_100_pic_y + controls_h + distance_between_controls ; 105 + 70 + 10 = 185


euro_bill_50_times_text_w := 10 ; fits text

euro_bill_50_times_text_x := euro_bill_50_pic_x + euro_bill_50_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_bill_50_times_text_y := euro_bill_50_pic_y


euro_bill_50_edit_w := 30 ; fits text

euro_bill_50_edit_x := euro_bill_50_times_text_x + euro_bill_50_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_bill_50_edit_y := euro_bill_50_pic_y

;=================================_====================================

euro_bill_20_pic_w := 2 * controls_h ; 70

euro_bill_20_pic_x := euro_bill_50_pic_x ; 30
euro_bill_20_pic_y := euro_bill_50_pic_y + controls_h + distance_between_controls ; 185 + 70 + 10 = 265


euro_bill_20_times_text_w := 10 ; fits text

euro_bill_20_times_text_x := euro_bill_20_pic_x + euro_bill_20_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_bill_20_times_text_y := euro_bill_20_pic_y


euro_bill_20_edit_w := 30 ; fits text

euro_bill_20_edit_x := euro_bill_20_times_text_x + euro_bill_20_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_bill_20_edit_y := euro_bill_20_pic_y

;=================================_====================================

euro_bill_10_pic_w := 2 * controls_h ; 70

euro_bill_10_pic_x := euro_bill_20_pic_x ; 30
euro_bill_10_pic_y := euro_bill_20_pic_y + controls_h + distance_between_controls ; 265 + 70 + 10 = 345


euro_bill_10_times_text_w := 10 ; fits text

euro_bill_10_times_text_x := euro_bill_10_pic_x + euro_bill_10_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_bill_10_times_text_y := euro_bill_10_pic_y


euro_bill_10_edit_w := 30 ; fits text

euro_bill_10_edit_x := euro_bill_10_times_text_x + euro_bill_10_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_bill_10_edit_y := euro_bill_10_pic_y

;=================================_====================================

euro_bill_5_pic_w := 2 * controls_h ; 70

euro_bill_5_pic_x := euro_bill_10_pic_x ; 30
euro_bill_5_pic_y := euro_bill_10_pic_y + controls_h + distance_between_controls ; 345 + 70 + 10 = 425


euro_bill_5_times_text_w := 10 ; fits text

euro_bill_5_times_text_x := euro_bill_5_pic_x + euro_bill_5_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_bill_5_times_text_y := euro_bill_5_pic_y


euro_bill_5_edit_w := 30 ; fits text

euro_bill_5_edit_x := euro_bill_5_times_text_x + euro_bill_5_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_bill_5_edit_y := euro_bill_5_pic_y

;=================================_====================================

euro_bills_sum_edit_w := euro_bill_5_pic_w + euro_bill_5_times_text_w + euro_bill_5_edit_w + 2 * distance_between_controls ; 70 + 10 + 30 + 2 * 10 = 130

euro_bills_sum_edit_x := euro_bill_5_pic_x ; 30
euro_bills_sum_edit_y := euro_bill_5_pic_y + controls_h + distance_between_controls ; 425 + 70 + 10 = 505
}
;=================================_====================================
;======================== Big Coins Controls ==========================
{
kuna_bigcoin_5_pic_w := controls_h ; 35

kuna_bigcoin_5_pic_x := kuna_bill_200_edit_x + kuna_bill_200_edit_w + 3 * distance_between_controls ; 130 + 30 + 3 * 10 = 190
kuna_bigcoin_5_pic_y := currency_text_y + controls_h + 3 * distance_between_controls + controls_h / 2 + distance_between_controls / 2 ; 50 + 35 + 3 * 10 + 35 / 2 + 10 / 2 = 137


kuna_bigcoin_5_times_text_w := 10 ; fits text

kuna_bigcoin_5_times_text_x := kuna_bigcoin_5_pic_x + kuna_bigcoin_5_pic_w + distance_between_controls ; 190 + 35 + 10 = 235
kuna_bigcoin_5_times_text_y := kuna_bigcoin_5_pic_y


kuna_bigcoin_5_edit_w := 30 ; fits text

kuna_bigcoin_5_edit_x := kuna_bigcoin_5_times_text_x + kuna_bigcoin_5_times_text_w + distance_between_controls ; 235 + 10 + 10 = 255
kuna_bigcoin_5_edit_y := kuna_bigcoin_5_pic_y

;=================================_====================================

kuna_bigcoin_2_pic_w := controls_h ; 35

kuna_bigcoin_2_pic_x := kuna_bigcoin_5_pic_x ; 190
kuna_bigcoin_2_pic_y := kuna_bill_50_pic_y ; 265


kuna_bigcoin_2_times_text_w := 10 ; fits text

kuna_bigcoin_2_times_text_x := kuna_bigcoin_5_times_text_x ; 235
kuna_bigcoin_2_times_text_y := kuna_bigcoin_2_pic_y


kuna_bigcoin_2_edit_w := 30 ; fits text

kuna_bigcoin_2_edit_x := kuna_bigcoin_5_edit_x ; 255
kuna_bigcoin_2_edit_y := kuna_bigcoin_2_pic_y

;=================================_====================================

kuna_bigcoin_1_pic_w := controls_h ; 35

kuna_bigcoin_1_pic_x := kuna_bigcoin_5_pic_x ; 190
kuna_bigcoin_1_pic_y := kuna_bill_20_pic_y + controls_h / 2 + distance_between_controls / 2 ; 345 + 35 / 2 + 10 / 2 = 367


kuna_bigcoin_1_times_text_w := 10 ; fits text

kuna_bigcoin_1_times_text_x := kuna_bigcoin_1_pic_x + kuna_bigcoin_1_pic_w + distance_between_controls ; 190 + 35 + 10 = 235
kuna_bigcoin_1_times_text_y := kuna_bigcoin_1_pic_y


kuna_bigcoin_1_edit_w := 30 ; fits text

kuna_bigcoin_1_edit_x := kuna_bigcoin_1_times_text_x + kuna_bigcoin_1_times_text_w + distance_between_controls ; 235 + 10 + 10 = 211
kuna_bigcoin_1_edit_y := kuna_bigcoin_1_times_text_y

;=================================_====================================

kuna_bigcoins_sum_edit_w := kuna_bigcoin_1_pic_w + kuna_bigcoin_1_times_text_w + kuna_bigcoin_1_edit_w + 2 * distance_between_controls ; 35 + 10 + 30 + 2 * 10 = 95

kuna_bigcoins_sum_edit_x := kuna_bigcoin_1_pic_x ; 190
kuna_bigcoins_sum_edit_y := kuna_bills_sum_edit_y ; 505


;=================================_====================================
;=================================_====================================

euro_bigcoin_2_pic_w := controls_h ; 35

euro_bigcoin_2_pic_x := euro_bill_50_edit_x + euro_bill_50_edit_w + 3 * distance_between_controls ; 130 + 30 + 3 * 10 = 190
euro_bigcoin_2_pic_y := euro_bill_50_pic_y ; 185


euro_bigcoin_2_times_text_w := 10 ; fits text

euro_bigcoin_2_times_text_x := euro_bigcoin_2_pic_x + euro_bigcoin_2_pic_w + distance_between_controls ; 190 + 35 + 10 = 235
euro_bigcoin_2_times_text_y := euro_bigcoin_2_pic_y


euro_bigcoin_2_edit_w := 30 ; fits text

euro_bigcoin_2_edit_x := euro_bigcoin_2_times_text_x + euro_bigcoin_2_times_text_w + distance_between_controls ; 235 + 10 + 10 = 255
euro_bigcoin_2_edit_y := euro_bigcoin_2_pic_y

;=================================_====================================

euro_bigcoin_1_pic_w := controls_h ; 35

euro_bigcoin_1_pic_x := euro_bill_50_edit_x + euro_bill_50_edit_w + 3 * distance_between_controls ; 130 + 30 + 3 * 10 = 190
euro_bigcoin_1_pic_y := euro_bill_10_pic_y ; 185


euro_bigcoin_1_times_text_w := 10 ; fits text

euro_bigcoin_1_times_text_x := euro_bigcoin_1_pic_x + euro_bigcoin_1_pic_w + distance_between_controls ; 190 + 35 + 10 = 235
euro_bigcoin_1_times_text_y := euro_bigcoin_1_pic_y


euro_bigcoin_1_edit_w := 30 ; fits text

euro_bigcoin_1_edit_x := euro_bigcoin_1_times_text_x + euro_bigcoin_1_times_text_w + distance_between_controls ; 235 + 10 + 10 = 211
euro_bigcoin_1_edit_y := euro_bigcoin_1_times_text_y ; 345

;=================================_====================================

euro_bigcoins_sum_edit_w := euro_bigcoin_1_pic_w + euro_bigcoin_1_times_text_w + euro_bigcoin_1_edit_w + 2 * distance_between_controls ; 35 + 10 + 30 + 2 * 10 = 95

euro_bigcoins_sum_edit_x := euro_bigcoin_1_pic_x ; 190
euro_bigcoins_sum_edit_y := euro_bills_sum_edit_y ; 505
}
;=================================_====================================
;====================== Small Coins Controls ==========================
{
kuna_smallcoin_50_pic_w := controls_h ; 35

kuna_smallcoin_50_pic_x := kuna_bigcoin_5_edit_x + kuna_bigcoin_5_edit_w + 3 * distance_between_controls ; 190 + 35 + 3 * 10 = 265
kuna_smallcoin_50_pic_y := currency_text_y + controls_h + 3 * distance_between_controls ; 50 + 35 + 2 * 10 = 105


kuna_smallcoin_50_times_text_w := 10 ; fits text

kuna_smallcoin_50_times_text_x := kuna_smallcoin_50_pic_x + kuna_smallcoin_50_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_smallcoin_50_times_text_y := kuna_smallcoin_50_pic_y


kuna_smallcoin_50_edit_w := 30 ; fits text

kuna_smallcoin_50_edit_x := kuna_smallcoin_50_times_text_x + kuna_smallcoin_50_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_smallcoin_50_edit_y := kuna_smallcoin_50_pic_y

;=================================_====================================

kuna_smallcoin_20_pic_w := controls_h ; 35

kuna_smallcoin_20_pic_x := kuna_smallcoin_50_pic_x ; 265
kuna_smallcoin_20_pic_y := kuna_smallcoin_50_pic_y + controls_h + distance_between_controls ; 105 + 70 + 10 = 185


kuna_smallcoin_20_times_text_w := 10 ; fits text

kuna_smallcoin_20_times_text_x := kuna_smallcoin_20_pic_x + kuna_smallcoin_20_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_smallcoin_20_times_text_y := kuna_smallcoin_20_pic_y


kuna_smallcoin_20_edit_w := 30 ; fits text

kuna_smallcoin_20_edit_x := kuna_smallcoin_20_times_text_x + kuna_smallcoin_20_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_smallcoin_20_edit_y := kuna_smallcoin_20_pic_y

;=================================_====================================

kuna_smallcoin_10_pic_w := controls_h ; 35

kuna_smallcoin_10_pic_x := kuna_smallcoin_20_pic_x ; 265
kuna_smallcoin_10_pic_y := kuna_smallcoin_20_pic_y + controls_h + distance_between_controls ; 185 + 70 + 10 = 265


kuna_smallcoin_10_times_text_w := 10 ; fits text

kuna_smallcoin_10_times_text_x := kuna_smallcoin_10_pic_x + kuna_smallcoin_10_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_smallcoin_10_times_text_y := kuna_smallcoin_10_pic_y


kuna_smallcoin_10_edit_w := 30 ; fits text

kuna_smallcoin_10_edit_x := kuna_smallcoin_10_times_text_x + kuna_smallcoin_10_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_smallcoin_10_edit_y := kuna_smallcoin_10_pic_y

;=================================_====================================

kuna_smallcoin_5_pic_w := controls_h ; 35

kuna_smallcoin_5_pic_x := kuna_smallcoin_10_pic_x ; 265
kuna_smallcoin_5_pic_y := kuna_smallcoin_10_pic_y + controls_h + distance_between_controls ; 265 + 70 + 10 = 345


kuna_smallcoin_5_times_text_w := 10 ; fits text

kuna_smallcoin_5_times_text_x := kuna_smallcoin_5_pic_x + kuna_smallcoin_5_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_smallcoin_5_times_text_y := kuna_smallcoin_5_pic_y


kuna_smallcoin_5_edit_w := 30 ; fits text

kuna_smallcoin_5_edit_x := kuna_smallcoin_5_times_text_x + kuna_smallcoin_5_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_smallcoin_5_edit_y := kuna_smallcoin_5_pic_y

;=================================_====================================

kuna_smallcoin_1_pic_w := controls_h ; 35

kuna_smallcoin_1_pic_x := kuna_smallcoin_5_pic_x ; 265
kuna_smallcoin_1_pic_y := kuna_smallcoin_5_pic_y + controls_h + distance_between_controls ; 345 + 70 + 10 = 425


kuna_smallcoin_1_times_text_w := 10 ; fits text

kuna_smallcoin_1_times_text_x := kuna_smallcoin_1_pic_x + kuna_smallcoin_1_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
kuna_smallcoin_1_times_text_y := kuna_smallcoin_1_pic_y


kuna_smallcoin_1_edit_w := 30 ; fits text

kuna_smallcoin_1_edit_x := kuna_smallcoin_1_times_text_x + kuna_smallcoin_1_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
kuna_smallcoin_1_edit_y := kuna_smallcoin_1_pic_y

;=================================_====================================

kuna_smallcoins_sum_edit_w := kuna_smallcoin_1_pic_w + kuna_smallcoin_1_times_text_w + kuna_smallcoin_1_edit_w + 2 * distance_between_controls ; 35 + 10 + 30 + 2 * 10 = 95

kuna_smallcoins_sum_edit_x := kuna_smallcoin_1_pic_x ; 265
kuna_smallcoins_sum_edit_y := kuna_smallcoin_1_pic_y + controls_h + distance_between_controls ; 425 + 70 + 10 = 505


;=================================_====================================
;=================================_====================================

euro_smallcoin_50_pic_w := controls_h ; 35

euro_smallcoin_50_pic_x := euro_bigcoin_2_edit_x + euro_bigcoin_2_edit_w + 3 * distance_between_controls ; 190 + 35 + 3 * 10 = 265
euro_smallcoin_50_pic_y := currency_text_y + controls_h + 3 * distance_between_controls ; 50 + 35 + 2 * 10 = 105


euro_smallcoin_50_times_text_w := 10 ; fits text

euro_smallcoin_50_times_text_x := euro_smallcoin_50_pic_x + euro_smallcoin_50_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_smallcoin_50_times_text_y := euro_smallcoin_50_pic_y


euro_smallcoin_50_edit_w := 30 ; fits text

euro_smallcoin_50_edit_x := euro_smallcoin_50_times_text_x + euro_smallcoin_50_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_smallcoin_50_edit_y := euro_smallcoin_50_pic_y

;=================================_====================================

euro_smallcoin_20_pic_w := controls_h ; 35

euro_smallcoin_20_pic_x := euro_smallcoin_50_pic_x ; 265
euro_smallcoin_20_pic_y := euro_smallcoin_50_pic_y + controls_h + distance_between_controls ; 105 + 70 + 10 = 185


euro_smallcoin_20_times_text_w := 10 ; fits text

euro_smallcoin_20_times_text_x := euro_smallcoin_20_pic_x + euro_smallcoin_20_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_smallcoin_20_times_text_y := euro_smallcoin_20_pic_y


euro_smallcoin_20_edit_w := 30 ; fits text

euro_smallcoin_20_edit_x := euro_smallcoin_20_times_text_x + euro_smallcoin_20_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_smallcoin_20_edit_y := euro_smallcoin_20_pic_y

;=================================_====================================

euro_smallcoin_10_pic_w := controls_h ; 35

euro_smallcoin_10_pic_x := euro_smallcoin_20_pic_x ; 265
euro_smallcoin_10_pic_y := euro_smallcoin_20_pic_y + controls_h + distance_between_controls ; 185 + 70 + 10 = 265


euro_smallcoin_10_times_text_w := 10 ; fits text

euro_smallcoin_10_times_text_x := euro_smallcoin_10_pic_x + euro_smallcoin_10_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_smallcoin_10_times_text_y := euro_smallcoin_10_pic_y


euro_smallcoin_10_edit_w := 30 ; fits text

euro_smallcoin_10_edit_x := euro_smallcoin_10_times_text_x + euro_smallcoin_10_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_smallcoin_10_edit_y := euro_smallcoin_10_pic_y

;=================================_====================================

euro_smallcoin_5_pic_w := controls_h ; 35

euro_smallcoin_5_pic_x := euro_smallcoin_10_pic_x ; 265
euro_smallcoin_5_pic_y := euro_smallcoin_10_pic_y + controls_h + distance_between_controls ; 265 + 70 + 10 = 345


euro_smallcoin_5_times_text_w := 10 ; fits text

euro_smallcoin_5_times_text_x := euro_smallcoin_5_pic_x + euro_smallcoin_5_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_smallcoin_5_times_text_y := euro_smallcoin_5_pic_y


euro_smallcoin_5_edit_w := 30 ; fits text

euro_smallcoin_5_edit_x := euro_smallcoin_5_times_text_x + euro_smallcoin_5_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_smallcoin_5_edit_y := euro_smallcoin_5_pic_y

;=================================_====================================

euro_smallcoin_1_pic_w := controls_h ; 35

euro_smallcoin_1_pic_x := euro_smallcoin_5_pic_x ; 265
euro_smallcoin_1_pic_y := euro_smallcoin_5_pic_y + controls_h + distance_between_controls ; 345 + 70 + 10 = 425


euro_smallcoin_1_times_text_w := 10 ; fits text

euro_smallcoin_1_times_text_x := euro_smallcoin_1_pic_x + euro_smallcoin_1_pic_w + distance_between_controls ; 30 + 70 + 10 = 110
euro_smallcoin_1_times_text_y := euro_smallcoin_1_pic_y


euro_smallcoin_1_edit_w := 30 ; fits text

euro_smallcoin_1_edit_x := euro_smallcoin_1_times_text_x + euro_smallcoin_1_times_text_w + distance_between_controls ; 110 + 10 + 10 = 130
euro_smallcoin_1_edit_y := euro_smallcoin_1_pic_y

;=================================_====================================

euro_smallcoins_sum_edit_w := euro_smallcoin_1_pic_w + euro_smallcoin_1_times_text_w + euro_smallcoin_1_edit_w + 2 * distance_between_controls ; 35 + 10 + 30 + 2 * 10 = 95

euro_smallcoins_sum_edit_x := euro_smallcoin_1_pic_x ; 265
euro_smallcoins_sum_edit_y := euro_smallcoin_1_pic_y + controls_h + distance_between_controls ; 425 + 70 + 10 = 505
}
;=================================_====================================
;========================== Bank Controls =============================
{
bank_text_w := 50 ; fits text

bank_text_x := currency_text_x ; 30
bank_text_y := kuna_bills_sum_edit_y + controls_h + 2 * distance_between_controls ; 505 + 35 + 2 * 10 = 560


bank_edit_w := 110 ; fits text

bank_edit_x := bank_text_x + bank_text_w + distance_between_controls ; 30 + 50 + 10 = 90
bank_edit_y := bank_text_y ; 560
}
;=================================_====================================
;======================= Calculation Controls =========================
{
kuna_text_w := 50 ; fits text

kuna_text_x := currency_text_x ; 30
kuna_text_y := bank_text_y + controls_h + 2 * distance_between_controls ; 560 + 35 + 2 * 10 = 615


kuna_edit_w := 110 ; fits text

kuna_edit_x := kuna_text_x + kuna_text_w + distance_between_controls ; 30 + 50 + 10 = 90
kuna_edit_y := kuna_text_y ; 615

;=================================_====================================

euro_text_w := 50 ; fits text

euro_text_x := currency_text_x ; 30
euro_text_y := kuna_text_y + controls_h + distance_between_controls ; 615 + 35 + 10 = 660


euro_edit_w := kuna_edit_w ; 110

euro_edit_x := euro_text_x + euro_text_w + distance_between_controls ; 30 + 50 + 10 = 90
euro_edit_y := euro_text_y ; 660
}
;=================================_====================================
;========================== Store Button ==============================
{
store_button_w := 80 ; fits text

store_button_x := tab_x + tab_w - distance_to_border - store_button_w ; 10 + 680 - 20 - 100 ; 570
store_button_y := euro_text_y ; 660
}
;=================================_====================================
;========================== Total Balance =============================
{
balance_edit_w := kuna_edit_w ; 110

balance_edit_x := tab_x + tab_w - distance_to_border - store_button_w - distance_between_controls - balance_edit_w ; 10 + 680 - 20 - 100 - 10 - 85 = 475
balance_edit_y := euro_text_y ; 660
}
;=================================_====================================
;========================= Notes Controls =============================
{
notes_text_w := 50 ; fits text

notes_text_x := currency_text_x ; 30
notes_text_y := euro_text_y + controls_h + distance_between_controls ; 660 + 35 + 10 = 705


notes_edit_w := tab_w - notes_text_x - notes_text_w - distance_to_border ; 420 - 30 - 50 - 20 = 320

notes_edit_x := euro_edit_x ; 90
notes_edit_y := notes_text_y ; 705
}
;=================================_====================================
;=========================== Print Button =============================
{
viewtab_print_button_w := currency_text_w + distance_between_controls + currency_ddl_w ; 80 + 10 + 70 = 160

viewtab_print_button_x := currency_text_x ; 30
viewtab_print_button_y := currency_text_y ; 50
}



;=================================_====================================
;======================== Control Addition ============================
;=================================_====================================


;=================================_====================================
;=============================== Tabs =================================
{
Gui, Font, s12, Segoe UI

Gui, Add, Tab3, Vtabs Gtabs -TabStop w%tab_w% h%tab_h% x%tab_x% y%tab_y%, Input|View|Edit
}


;=================================_====================================
;============================ Input Tab ===============================
{
Gui, Tab, Input, , Exact ; sets the controls in "Input" tab

Gui, Font, s15, Segoe UI
}
;=================================_====================================
;======================== Currency Controls ===========================
{
Gui, Add, Text, Vinputtab_currency_text w%currency_text_w% h%controls_h% x%currency_text_x% y%currency_text_y%, Currency:

Gui, Add, DDL, Vinputtab_currency_ddl Ginputtab_currency_ddl -TabStop Choose1 w%currency_ddl_w% r2 x%currency_ddl_x% y%currency_ddl_y%, Kuna|Euro
}
;=================================_====================================
;========================== Date Control ==============================
{
Gui, Add, DateTime, Vcalendar -TabStop w%calendar_w% h%controls_h% x%calendar_x% y%calendar_y%, 'Date:' dd/MM/yyyy
}
;=================================_====================================
;========================= Bills Controls =============================
{
Gui, Add, Picture, Vinputtab_kuna_bill_200_pic w%kuna_bill_200_pic_w% h%controls_h% x%kuna_bill_200_pic_x% y%kuna_bill_200_pic_y%, %A_ScriptDir%\Pictures\200 Kuna.jpg
Gui, Add, Text, Vinputtab_kuna_bill_200_times_text w%kuna_bill_200_times_text_w% h%controls_h% x%kuna_bill_200_times_text_x% y%kuna_bill_200_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bill_200_edit Ginputtab_autoupdate Number Center w%kuna_bill_200_edit_w% h%controls_h% x%kuna_bill_200_edit_x% y%kuna_bill_200_edit_y%

Gui, Add, Picture, Vinputtab_kuna_bill_100_pic w%kuna_bill_100_pic_w% h%controls_h% x%kuna_bill_100_pic_x% y%kuna_bill_100_pic_y%, %A_ScriptDir%\Pictures\100 Kuna.jpg
Gui, Add, Text, Vinputtab_kuna_bill_100_times_text w%kuna_bill_100_times_text_w% h%controls_h% x%kuna_bill_100_times_text_x% y%kuna_bill_100_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bill_100_edit Ginputtab_autoupdate Number Center w%kuna_bill_100_edit_w% h%controls_h% x%kuna_bill_100_edit_x% y%kuna_bill_100_edit_y%

Gui, Add, Picture, Vinputtab_kuna_bill_50_pic w%kuna_bill_50_pic_w% h%controls_h% x%kuna_bill_50_pic_x% y%kuna_bill_50_pic_y%, %A_ScriptDir%\Pictures\50 Kuna.jpg
Gui, Add, Text, Vinputtab_kuna_bill_50_times_text w%kuna_bill_50_times_text_w% h%controls_h% x%kuna_bill_50_times_text_x% y%kuna_bill_50_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bill_50_edit Ginputtab_autoupdate Number Center w%kuna_bill_50_edit_w% h%controls_h% x%kuna_bill_50_edit_x% y%kuna_bill_50_edit_y%

Gui, Add, Picture, Vinputtab_kuna_bill_20_pic w%kuna_bill_20_pic_w% h%controls_h% x%kuna_bill_20_pic_x% y%kuna_bill_20_pic_y%, %A_ScriptDir%\Pictures\20 Kuna.jpg
Gui, Add, Text, Vinputtab_kuna_bill_20_times_text w%kuna_bill_20_times_text_w% h%controls_h% x%kuna_bill_20_times_text_x% y%kuna_bill_20_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bill_20_edit Ginputtab_autoupdate Number Center w%kuna_bill_20_edit_w% h%controls_h% x%kuna_bill_20_edit_x% y%kuna_bill_20_edit_y%

Gui, Add, Picture, Vinputtab_kuna_bill_10_pic w%kuna_bill_10_pic_w% h%controls_h% x%kuna_bill_10_pic_x% y%kuna_bill_10_pic_y%, %A_ScriptDir%\Pictures\10 Kuna.png
Gui, Add, Text, Vinputtab_kuna_bill_10_times_text w%kuna_bill_10_times_text_w% h%controls_h% x%kuna_bill_10_times_text_x% y%kuna_bill_10_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bill_10_edit Ginputtab_autoupdate Number Center w%kuna_bill_10_edit_w% h%controls_h% x%kuna_bill_10_edit_x% y%kuna_bill_10_edit_y%

Gui, Add, Edit, Vinputtab_kuna_bills_sum_edit ReadOnly -TabStop Center w%kuna_bills_sum_edit_w% h%controls_h% x%kuna_bills_sum_edit_x% y%kuna_bills_sum_edit_y%



Gui, Add, Picture, Vinputtab_euro_bill_100_pic w%euro_bill_100_pic_w% h%controls_h% x%euro_bill_100_pic_x% y%euro_bill_100_pic_y%, %A_ScriptDir%\Pictures\100 Euro.jpg
Gui, Add, Text, Vinputtab_euro_bill_100_times_text w%euro_bill_100_times_text_w% h%controls_h% x%euro_bill_100_times_text_x% y%euro_bill_100_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_bill_100_edit Ginputtab_autoupdate Number Center w%euro_bill_100_edit_w% h%controls_h% x%euro_bill_100_edit_x% y%euro_bill_100_edit_y%

Gui, Add, Picture, Vinputtab_euro_bill_50_pic w%euro_bill_50_pic_w% h%controls_h% x%euro_bill_50_pic_x% y%euro_bill_50_pic_y%, %A_ScriptDir%\Pictures\50 Euro.jpg
Gui, Add, Text, Vinputtab_euro_bill_50_times_text w%euro_bill_50_times_text_w% h%controls_h% x%euro_bill_50_times_text_x% y%euro_bill_50_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_bill_50_edit Ginputtab_autoupdate Number Center w%euro_bill_50_edit_w% h%controls_h% x%euro_bill_50_edit_x% y%euro_bill_50_edit_y%

Gui, Add, Picture, Vinputtab_euro_bill_20_pic w%euro_bill_20_pic_w% h%controls_h% x%euro_bill_20_pic_x% y%euro_bill_20_pic_y%, %A_ScriptDir%\Pictures\20 Euro.jpg
Gui, Add, Text, Vinputtab_euro_bill_20_times_text w%euro_bill_20_times_text_w% h%controls_h% x%euro_bill_20_times_text_x% y%euro_bill_20_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_bill_20_edit Ginputtab_autoupdate Number Center w%euro_bill_20_edit_w% h%controls_h% x%euro_bill_20_edit_x% y%euro_bill_20_edit_y%

Gui, Add, Picture, Vinputtab_euro_bill_10_pic w%euro_bill_10_pic_w% h%controls_h% x%euro_bill_10_pic_x% y%euro_bill_10_pic_y%, %A_ScriptDir%\Pictures\10 Euro.jpg
Gui, Add, Text, Vinputtab_euro_bill_10_times_text w%euro_bill_10_times_text_w% h%controls_h% x%euro_bill_10_times_text_x% y%euro_bill_10_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_bill_10_edit Ginputtab_autoupdate Number Center w%euro_bill_10_edit_w% h%controls_h% x%euro_bill_10_edit_x% y%euro_bill_10_edit_y%

Gui, Add, Picture, Vinputtab_euro_bill_5_pic w%euro_bill_5_pic_w% h%controls_h% x%euro_bill_5_pic_x% y%euro_bill_5_pic_y%, %A_ScriptDir%\Pictures\5 Euro.jpg
Gui, Add, Text, Vinputtab_euro_bill_5_times_text w%euro_bill_5_times_text_w% h%controls_h% x%euro_bill_5_times_text_x% y%euro_bill_5_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_bill_5_edit Ginputtab_autoupdate Number Center w%euro_bill_5_edit_w% h%controls_h% x%euro_bill_5_edit_x% y%euro_bill_5_edit_y%

Gui, Add, Edit, Vinputtab_euro_bills_sum_edit ReadOnly -TabStop Center w%euro_bills_sum_edit_w% h%controls_h% x%euro_bills_sum_edit_x% y%euro_bills_sum_edit_y%
}
;=================================_====================================
;======================== Big Coins Controls ==========================
{
Gui, Add, Picture, Vinputtab_kuna_bigcoin_5_pic w%kuna_bigcoin_5_pic_w% h%controls_h% x%kuna_bigcoin_5_pic_x% y%kuna_bigcoin_5_pic_y%, %A_ScriptDir%\Pictures\5 Kuna.png
Gui, Add, Text, Vinputtab_kuna_bigcoin_5_times_text w%kuna_bigcoin_5_times_text_w% h%controls_h% x%kuna_bigcoin_5_times_text_x% y%kuna_bigcoin_5_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bigcoin_5_edit Ginputtab_autoupdate Number Center w%kuna_bigcoin_5_edit_w% h%controls_h% x%kuna_bigcoin_5_edit_x% y%kuna_bigcoin_5_edit_y%

Gui, Add, Picture, Vinputtab_kuna_bigcoin_2_pic w%kuna_bigcoin_2_pic_w% h%controls_h% x%kuna_bigcoin_2_pic_x% y%kuna_bigcoin_2_pic_y%, %A_ScriptDir%\Pictures\2 Kuna.jpg
Gui, Add, Text, Vinputtab_kuna_bigcoin_2_times_text w%kuna_bigcoin_2_times_text_w% h%controls_h% x%kuna_bigcoin_2_times_text_x% y%kuna_bigcoin_2_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bigcoin_2_edit Ginputtab_autoupdate Number Center w%kuna_bigcoin_2_edit_w% h%controls_h% x%kuna_bigcoin_2_edit_x% y%kuna_bigcoin_2_edit_y%

Gui, Add, Picture, Vinputtab_kuna_bigcoin_1_pic w%kuna_bigcoin_1_pic_w% h%controls_h% x%kuna_bigcoin_1_pic_x% y%kuna_bigcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Kuna.png
Gui, Add, Text, Vinputtab_kuna_bigcoin_1_times_text w%kuna_bigcoin_1_times_text_w% h%controls_h% x%kuna_bigcoin_1_times_text_x% y%kuna_bigcoin_1_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_bigcoin_1_edit Ginputtab_autoupdate Number Center w%kuna_bigcoin_1_edit_w% h%controls_h% x%kuna_bigcoin_1_edit_x% y%kuna_bigcoin_1_edit_y%

Gui, Add, Edit, Vinputtab_kuna_bigcoins_sum_edit ReadOnly -TabStop Center w%kuna_bigcoins_sum_edit_w% h%controls_h% x%kuna_bigcoins_sum_edit_x% y%kuna_bigcoins_sum_edit_y%



Gui, Add, Picture, Vinputtab_euro_bigcoin_2_pic w%euro_bigcoin_2_pic_w% h%controls_h% x%euro_bigcoin_2_pic_x% y%euro_bigcoin_2_pic_y%, %A_ScriptDir%\Pictures\2 Euro.jpg
Gui, Add, Text, Vinputtab_euro_bigcoin_2_times_text w%euro_bigcoin_2_times_text_w% h%controls_h% x%euro_bigcoin_2_times_text_x% y%euro_bigcoin_2_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_bigcoin_2_edit Ginputtab_autoupdate Number Center w%euro_bigcoin_2_edit_w% h%controls_h% x%euro_bigcoin_2_edit_x% y%euro_bigcoin_2_edit_y%

Gui, Add, Picture, Vinputtab_euro_bigcoin_1_pic w%euro_bigcoin_1_pic_w% h%controls_h% x%euro_bigcoin_1_pic_x% y%euro_bigcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Euro.jpg
Gui, Add, Text, Vinputtab_euro_bigcoin_1_times_text w%euro_bigcoin_1_times_text_w% h%controls_h% x%euro_bigcoin_1_times_text_x% y%euro_bigcoin_1_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_bigcoin_1_edit Ginputtab_autoupdate Number Center w%euro_bigcoin_1_edit_w% h%controls_h% x%euro_bigcoin_1_edit_x% y%euro_bigcoin_1_edit_y%

Gui, Add, Edit, Vinputtab_euro_bigcoins_sum_edit ReadOnly -TabStop Center w%euro_bigcoins_sum_edit_w% h%controls_h% x%euro_bigcoins_sum_edit_x% y%euro_bigcoins_sum_edit_y%
}
;=================================_====================================
;======================= Small Coins Controls =========================
{
Gui, Add, Picture, Vinputtab_kuna_smallcoin_50_pic w%kuna_smallcoin_50_pic_w% h%controls_h% x%kuna_smallcoin_50_pic_x% y%kuna_smallcoin_50_pic_y%, %A_ScriptDir%\Pictures\50 Lipa.png
Gui, Add, Text, Vinputtab_kuna_smallcoin_50_times_text w%kuna_smallcoin_50_times_text_w% h%controls_h% x%kuna_smallcoin_50_times_text_x% y%kuna_smallcoin_50_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_smallcoin_50_edit Ginputtab_autoupdate Number Center w%kuna_smallcoin_50_edit_w% h%controls_h% x%kuna_smallcoin_50_edit_x% y%kuna_smallcoin_50_edit_y%

Gui, Add, Picture, Vinputtab_kuna_smallcoin_20_pic w%kuna_smallcoin_20_pic_w% h%controls_h% x%kuna_smallcoin_20_pic_x% y%kuna_smallcoin_20_pic_y%, %A_ScriptDir%\Pictures\20 Lipa.png
Gui, Add, Text, Vinputtab_kuna_smallcoin_20_times_text w%kuna_smallcoin_20_times_text_w% h%controls_h% x%kuna_smallcoin_20_times_text_x% y%kuna_smallcoin_20_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_smallcoin_20_edit Ginputtab_autoupdate Number Center w%kuna_smallcoin_20_edit_w% h%controls_h% x%kuna_smallcoin_20_edit_x% y%kuna_smallcoin_20_edit_y%

Gui, Add, Picture, Vinputtab_kuna_smallcoin_10_pic w%kuna_smallcoin_10_pic_w% h%controls_h% x%kuna_smallcoin_10_pic_x% y%kuna_smallcoin_10_pic_y%, %A_ScriptDir%\Pictures\10 Lipa.jpg
Gui, Add, Text, Vinputtab_kuna_smallcoin_10_times_text w%kuna_smallcoin_10_times_text_w% h%controls_h% x%kuna_smallcoin_10_times_text_x% y%kuna_smallcoin_10_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_smallcoin_10_edit Ginputtab_autoupdate Number Center w%kuna_smallcoin_10_edit_w% h%controls_h% x%kuna_smallcoin_10_edit_x% y%kuna_smallcoin_10_edit_y%

Gui, Add, Picture, Vinputtab_kuna_smallcoin_5_pic w%kuna_smallcoin_5_pic_w% h%controls_h% x%kuna_smallcoin_5_pic_x% y%kuna_smallcoin_5_pic_y%, %A_ScriptDir%\Pictures\5 Lipa.png
Gui, Add, Text, Vinputtab_kuna_smallcoin_5_times_text w%kuna_smallcoin_5_times_text_w% h%controls_h% x%kuna_smallcoin_5_times_text_x% y%kuna_smallcoin_5_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_smallcoin_5_edit Ginputtab_autoupdate Number Center w%kuna_smallcoin_5_edit_w% h%controls_h% x%kuna_smallcoin_5_edit_x% y%kuna_smallcoin_5_edit_y%

Gui, Add, Picture, Vinputtab_kuna_smallcoin_1_pic w%kuna_smallcoin_1_pic_w% h%controls_h% x%kuna_smallcoin_1_pic_x% y%kuna_smallcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Lipa.jpg
Gui, Add, Text, Vinputtab_kuna_smallcoin_1_times_text w%kuna_smallcoin_1_times_text_w% h%controls_h% x%kuna_smallcoin_1_times_text_x% y%kuna_smallcoin_1_times_text_y%, x
Gui, Add, Edit, Vinputtab_kuna_smallcoin_1_edit Ginputtab_autoupdate Number Center w%kuna_smallcoin_1_edit_w% h%controls_h% x%kuna_smallcoin_1_edit_x% y%kuna_smallcoin_1_edit_y%

Gui, Add, Edit, Vinputtab_kuna_smallcoins_sum_edit ReadOnly -TabStop Center w%kuna_smallcoins_sum_edit_w% h%controls_h% x%kuna_smallcoins_sum_edit_x% y%kuna_smallcoins_sum_edit_y%



Gui, Add, Picture, Vinputtab_euro_smallcoin_50_pic w%euro_smallcoin_50_pic_w% h%controls_h% x%euro_smallcoin_50_pic_x% y%euro_smallcoin_50_pic_y%, %A_ScriptDir%\Pictures\50 Cents.jpg
Gui, Add, Text, Vinputtab_euro_smallcoin_50_times_text w%euro_smallcoin_50_times_text_w% h%controls_h% x%euro_smallcoin_50_times_text_x% y%euro_smallcoin_50_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_smallcoin_50_edit Ginputtab_autoupdate Number Center w%euro_smallcoin_50_edit_w% h%controls_h% x%euro_smallcoin_50_edit_x% y%euro_smallcoin_50_edit_y%

Gui, Add, Picture, Vinputtab_euro_smallcoin_20_pic w%euro_smallcoin_20_pic_w% h%controls_h% x%euro_smallcoin_20_pic_x% y%euro_smallcoin_20_pic_y%, %A_ScriptDir%\Pictures\20 Cents.jpg
Gui, Add, Text, Vinputtab_euro_smallcoin_20_times_text w%euro_smallcoin_20_times_text_w% h%controls_h% x%euro_smallcoin_20_times_text_x% y%euro_smallcoin_20_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_smallcoin_20_edit Ginputtab_autoupdate Number Center w%euro_smallcoin_20_edit_w% h%controls_h% x%euro_smallcoin_20_edit_x% y%euro_smallcoin_20_edit_y%

Gui, Add, Picture, Vinputtab_euro_smallcoin_10_pic w%euro_smallcoin_10_pic_w% h%controls_h% x%euro_smallcoin_10_pic_x% y%euro_smallcoin_10_pic_y%, %A_ScriptDir%\Pictures\10 Cents.jpg
Gui, Add, Text, Vinputtab_euro_smallcoin_10_times_text w%euro_smallcoin_10_times_text_w% h%controls_h% x%euro_smallcoin_10_times_text_x% y%euro_smallcoin_10_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_smallcoin_10_edit Ginputtab_autoupdate Number Center w%euro_smallcoin_10_edit_w% h%controls_h% x%euro_smallcoin_10_edit_x% y%euro_smallcoin_10_edit_y%

Gui, Add, Picture, Vinputtab_euro_smallcoin_5_pic w%euro_smallcoin_5_pic_w% h%controls_h% x%euro_smallcoin_5_pic_x% y%euro_smallcoin_5_pic_y%, %A_ScriptDir%\Pictures\5 Cents.jpg
Gui, Add, Text, Vinputtab_euro_smallcoin_5_times_text w%euro_smallcoin_5_times_text_w% h%controls_h% x%euro_smallcoin_5_times_text_x% y%euro_smallcoin_5_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_smallcoin_5_edit Ginputtab_autoupdate Number Center w%euro_smallcoin_5_edit_w% h%controls_h% x%euro_smallcoin_5_edit_x% y%euro_smallcoin_5_edit_y%

Gui, Add, Picture, Vinputtab_euro_smallcoin_1_pic w%euro_smallcoin_1_pic_w% h%controls_h% x%euro_smallcoin_1_pic_x% y%euro_smallcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Cent.jpg
Gui, Add, Text, Vinputtab_euro_smallcoin_1_times_text w%euro_smallcoin_1_times_text_w% h%controls_h% x%euro_smallcoin_1_times_text_x% y%euro_smallcoin_1_times_text_y%, x
Gui, Add, Edit, Vinputtab_euro_smallcoin_1_edit Ginputtab_autoupdate Number Center w%euro_smallcoin_1_edit_w% h%controls_h% x%euro_smallcoin_1_edit_x% y%euro_smallcoin_1_edit_y%

Gui, Add, Edit, Vinputtab_euro_smallcoins_sum_edit ReadOnly -TabStop Center w%euro_smallcoins_sum_edit_w% h%controls_h% x%euro_smallcoins_sum_edit_x% y%euro_smallcoins_sum_edit_y%
}
;=================================_====================================
;========================== Bank Controls =============================
{
Gui, Add, Text, Vinputtab_bank_text w%bank_text_w% h%controls_h% x%bank_text_x% y%bank_text_y%, Bank:

Gui, Add, Edit, Vinputtab_bank_edit Ginputtab_autoupdate Center w%bank_edit_w% h%controls_h% x%bank_edit_x% y%bank_edit_y%
}
;=================================_====================================
;======================= Calculation Controls =========================
{
Gui, Add, Text, Vinputtab_kuna_text w%kuna_text_w% h%controls_h% x%kuna_text_x% y%kuna_text_y%, Kuna:

Gui, Add, Edit, Vinputtab_kuna_edit ReadOnly -TabStop Center w%kuna_edit_w% h%controls_h% x%kuna_edit_x% y%kuna_edit_y%

;=================================_====================================

Gui, Add, Text, Vinputtab_euro_text w%euro_text_w% h%controls_h% x%euro_text_x% y%euro_text_y%, Euro:

Gui, Add, Edit, Vinputtab_euro_edit ReadOnly -TabStop Center w%euro_edit_w% h%controls_h% x%euro_edit_x% y%euro_edit_y%
}
;=================================_====================================
;========================== Store Button ==============================
{
Gui, Add, Button, Vinputtab_store_button Ginputtab_store_information -TabStop Center w%store_button_w% h%controls_h% x%store_button_x% y%store_button_y%, Store
}
;=================================_====================================
;========================== Total Balance =============================
{
Gui, Add, Edit, Vinputtab_balance_edit ReadOnly -TabStop Center w%balance_edit_w% h%controls_h% x%balance_edit_x% y%balance_edit_y%
}
;=================================_====================================
;========================== Notes Control =============================
{
Gui, Add, Text, Vinputtab_notes_text_w w%notes_text_w% h%controls_h% x%notes_text_x% y%notes_text_y%, Note:

Gui, Add, Edit, Vinputtab_notes_edit r3 w%notes_edit_w% h%controls_h% x%notes_edit_x% y%notes_edit_y%
}


;=================================_====================================
;============================ View Tab ================================
{
Gui, Tab, View, , Exact ; sets the controls in "Vviewtab_iew" tab
}
;=================================_====================================
;=========================== Print Button =============================
{
Gui, Add, Button, Vviewtab_print_button Gviewtab_print_information w%viewtab_print_button_w% h%controls_h% x%viewtab_print_button_x% y%viewtab_print_button_y%, Print Selected
}
;=================================_====================================
;======================== Currency Controls ===========================
{
/*
Gui, Add, Text, % "Vviewtab_first_currency_text " " -TabStop" " w" currency_text_w " h" controls_h " x" currency_text_x " y" currency_text_y, Currency:

Gui, Add, DDL, % "Vviewtab_first_currency_ddl " "Gviewtab_currency_ddl " "-TabStop " "Choose"1 " w" currency_ddl_w " r" 2 " x" currency_ddl_x " y" currency_ddl_y, Kuna|Euro
*/
;=================================_====================================

Gui, Add, Text, % "Vviewtab_second_currency_text " " w" currency_text_w " h" controls_h " x" (tab_w + distance_to_border) + currency_text_x " y" currency_text_y, Currency:

Gui, Add, DDL, % "Vviewtab_second_currency_ddl " "Gviewtab_currency_ddl " "Choose" 1 " w" currency_ddl_w " r" 2 " x" (tab_w + distance_to_border) + currency_ddl_x " y" currency_ddl_y, Kuna|Euro
}
;=================================_====================================
;========================== Date Control ==============================
{
Gui, Add, DDL, % "Vviewtab_first_date_ddl " " Gviewtab_first_chosen_date " " w" date_ddl_w " r" 15 " x" date_ddl_x " y" date_ddl_y

;=================================_====================================

Gui, Add, DDL, % "Vviewtab_second_date_ddl " " Gviewtab_second_chosen_date " " w" date_ddl_w " r" 15 " x" (tab_w + distance_to_border) + date_ddl_x " y" date_ddl_y
}
;=================================_====================================
;========================= Bills Controls =============================
{
Gui, Add, Picture, % "Vviewtab_first_kuna_bill_200_pic " "ReadOnly " " -TabStop" " w" kuna_bill_200_pic_w " h" controls_h " x" kuna_bill_200_pic_x " y" kuna_bill_200_pic_y, %A_ScriptDir%\Pictures\200 Kuna.jpg
Gui, Add, Text, % "Vviewtab_first_kuna_bill_200_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_200_times_text_w " h" controls_h " x" kuna_bill_200_times_text_x " y" kuna_bill_200_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bill_200_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_200_edit_w " h" controls_h " x" kuna_bill_200_edit_x " y" kuna_bill_200_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_bill_100_pic " "ReadOnly " " -TabStop" " w" kuna_bill_100_pic_w " h" controls_h " x" kuna_bill_100_pic_x " y" kuna_bill_100_pic_y, %A_ScriptDir%\Pictures\100 Kuna.jpg
Gui, Add, Text, % "Vviewtab_first_kuna_bill_100_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_100_times_text_w " h" controls_h " x" kuna_bill_100_times_text_x " y" kuna_bill_100_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bill_100_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_100_edit_w " h" controls_h " x" kuna_bill_100_edit_x " y" kuna_bill_100_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_bill_50_pic " "ReadOnly " " -TabStop" " w" kuna_bill_50_pic_w " h" controls_h " x" kuna_bill_50_pic_x " y" kuna_bill_50_pic_y, %A_ScriptDir%\Pictures\50 Kuna.jpg
Gui, Add, Text, % "Vviewtab_first_kuna_bill_50_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_50_times_text_w " h" controls_h " x" kuna_bill_50_times_text_x " y" kuna_bill_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bill_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_50_edit_w " h" controls_h " x" kuna_bill_50_edit_x " y" kuna_bill_50_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_bill_20_pic " "ReadOnly " " -TabStop" " w" kuna_bill_20_pic_w " h" controls_h " x" kuna_bill_20_pic_x " y" kuna_bill_20_pic_y, %A_ScriptDir%\Pictures\20 Kuna.jpg
Gui, Add, Text, % "Vviewtab_first_kuna_bill_20_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_20_times_text_w " h" controls_h " x" kuna_bill_20_times_text_x " y" kuna_bill_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bill_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_20_edit_w " h" controls_h " x" kuna_bill_20_edit_x " y" kuna_bill_20_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_bill_10_pic " "ReadOnly " " -TabStop" " w" kuna_bill_10_pic_w " h" controls_h " x" kuna_bill_10_pic_x " y" kuna_bill_10_pic_y, %A_ScriptDir%\Pictures\10 Kuna.png
Gui, Add, Text, % "Vviewtab_first_kuna_bill_10_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_10_times_text_w " h" controls_h " x" kuna_bill_10_times_text_x " y" kuna_bill_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bill_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_10_edit_w " h" controls_h " x" kuna_bill_10_edit_x " y" kuna_bill_10_edit_y

Gui, Add, Edit, % "Vviewtab_first_kuna_bills_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_bills_sum_edit_w " h" controls_h " x" kuna_bills_sum_edit_x " y" kuna_bills_sum_edit_y



Gui, Add, Picture, % "Vviewtab_first_euro_bill_100_pic " "ReadOnly " " -TabStop" " w" euro_bill_100_pic_w " h" controls_h " x" euro_bill_100_pic_x " y" euro_bill_100_pic_y, %A_ScriptDir%\Pictures\100 Euro.jpg
Gui, Add, Text, % "Vviewtab_first_euro_bill_100_times_text " "ReadOnly " " -TabStop" " w" euro_bill_100_times_text_w " h" controls_h " x" euro_bill_100_times_text_x " y" euro_bill_100_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_bill_100_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_100_edit_w " h" controls_h " x" euro_bill_100_edit_x " y" euro_bill_100_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_bill_50_pic " "ReadOnly " " -TabStop" " w" euro_bill_50_pic_w " h" controls_h " x" euro_bill_50_pic_x " y" euro_bill_50_pic_y, %A_ScriptDir%\Pictures\50 Euro.jpg
Gui, Add, Text, % "Vviewtab_first_euro_bill_50_times_text " "ReadOnly " " -TabStop" " w" euro_bill_50_times_text_w " h" controls_h " x" euro_bill_50_times_text_x " y" euro_bill_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_bill_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_50_edit_w " h" controls_h " x" euro_bill_50_edit_x " y" euro_bill_50_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_bill_20_pic " "ReadOnly " " -TabStop" " w" euro_bill_20_pic_w " h" controls_h " x" euro_bill_20_pic_x " y" euro_bill_20_pic_y, %A_ScriptDir%\Pictures\20 Euro.jpg
Gui, Add, Text, % "Vviewtab_first_euro_bill_20_times_text " "ReadOnly " " -TabStop" " w" euro_bill_20_times_text_w " h" controls_h " x" euro_bill_20_times_text_x " y" euro_bill_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_bill_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_20_edit_w " h" controls_h " x" euro_bill_20_edit_x " y" euro_bill_20_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_bill_10_pic " "ReadOnly " " -TabStop" " w" euro_bill_10_pic_w " h" controls_h " x" euro_bill_10_pic_x " y" euro_bill_10_pic_y, %A_ScriptDir%\Pictures\10 Euro.jpg
Gui, Add, Text, % "Vviewtab_first_euro_bill_10_times_text " "ReadOnly " " -TabStop" " w" euro_bill_10_times_text_w " h" controls_h " x" euro_bill_10_times_text_x " y" euro_bill_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_bill_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_10_edit_w " h" controls_h " x" euro_bill_10_edit_x " y" euro_bill_10_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_bill_5_pic " "ReadOnly " " -TabStop" " w" euro_bill_5_pic_w " h" controls_h " x" euro_bill_5_pic_x " y" euro_bill_5_pic_y, %A_ScriptDir%\Pictures\5 Euro.jpg
Gui, Add, Text, % "Vviewtab_first_euro_bill_5_times_text " "ReadOnly " " -TabStop" " w" euro_bill_5_times_text_w " h" controls_h " x" euro_bill_5_times_text_x " y" euro_bill_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_bill_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_5_edit_w " h" controls_h " x" euro_bill_5_edit_x " y" euro_bill_5_edit_y

Gui, Add, Edit, % "Vviewtab_first_euro_bills_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_bills_sum_edit_w " h" controls_h " x" euro_bills_sum_edit_x " y" euro_bills_sum_edit_y

;=================================_====================================

Gui, Add, Picture, % "Vviewtab_second_kuna_bill_200_pic " "ReadOnly " " -TabStop" " w" kuna_bill_200_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_200_pic_x " y" kuna_bill_200_pic_y, %A_ScriptDir%\Pictures\200 Kuna.jpg
Gui, Add, Text, % "Vviewtab_second_kuna_bill_200_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_200_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_200_times_text_x " y" kuna_bill_200_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bill_200_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_200_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_200_edit_x " y" kuna_bill_200_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_bill_100_pic " "ReadOnly " " -TabStop" " w" kuna_bill_100_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_100_pic_x " y" kuna_bill_100_pic_y, %A_ScriptDir%\Pictures\100 Kuna.jpg
Gui, Add, Text, % "Vviewtab_second_kuna_bill_100_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_100_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_100_times_text_x " y" kuna_bill_100_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bill_100_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_100_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_100_edit_x " y" kuna_bill_100_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_bill_50_pic " "ReadOnly " " -TabStop" " w" kuna_bill_50_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_50_pic_x " y" kuna_bill_50_pic_y, %A_ScriptDir%\Pictures\50 Kuna.jpg
Gui, Add, Text, % "Vviewtab_second_kuna_bill_50_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_50_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_50_times_text_x " y" kuna_bill_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bill_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_50_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_50_edit_x " y" kuna_bill_50_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_bill_20_pic " "ReadOnly " " -TabStop" " w" kuna_bill_20_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_20_pic_x " y" kuna_bill_20_pic_y, %A_ScriptDir%\Pictures\20 Kuna.jpg
Gui, Add, Text, % "Vviewtab_second_kuna_bill_20_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_20_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_20_times_text_x " y" kuna_bill_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bill_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_20_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_20_edit_x " y" kuna_bill_20_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_bill_10_pic " "ReadOnly " " -TabStop" " w" kuna_bill_10_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_10_pic_x " y" kuna_bill_10_pic_y, %A_ScriptDir%\Pictures\10 Kuna.png
Gui, Add, Text, % "Vviewtab_second_kuna_bill_10_times_text " "ReadOnly " " -TabStop" " w" kuna_bill_10_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_10_times_text_x " y" kuna_bill_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bill_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bill_10_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bill_10_edit_x " y" kuna_bill_10_edit_y

Gui, Add, Edit, % "Vviewtab_second_kuna_bills_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_bills_sum_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bills_sum_edit_x " y" kuna_bills_sum_edit_y



Gui, Add, Picture, % "Vviewtab_second_euro_bill_100_pic " "ReadOnly " " -TabStop" " w" euro_bill_100_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_100_pic_x " y" euro_bill_100_pic_y, %A_ScriptDir%\Pictures\100 Euro.jpg
Gui, Add, Text, % "Vviewtab_second_euro_bill_100_times_text " "ReadOnly " " -TabStop" " w" euro_bill_100_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_100_times_text_x " y" euro_bill_100_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_bill_100_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_100_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_100_edit_x " y" euro_bill_100_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_bill_50_pic " "ReadOnly " " -TabStop" " w" euro_bill_50_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_50_pic_x " y" euro_bill_50_pic_y, %A_ScriptDir%\Pictures\50 Euro.jpg
Gui, Add, Text, % "Vviewtab_second_euro_bill_50_times_text " "ReadOnly " " -TabStop" " w" euro_bill_50_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_50_times_text_x " y" euro_bill_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_bill_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_50_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_50_edit_x " y" euro_bill_50_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_bill_20_pic " "ReadOnly " " -TabStop" " w" euro_bill_20_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_20_pic_x " y" euro_bill_20_pic_y, %A_ScriptDir%\Pictures\20 Euro.jpg
Gui, Add, Text, % "Vviewtab_second_euro_bill_20_times_text " "ReadOnly " " -TabStop" " w" euro_bill_20_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_20_times_text_x " y" euro_bill_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_bill_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_20_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_20_edit_x " y" euro_bill_20_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_bill_10_pic " "ReadOnly " " -TabStop" " w" euro_bill_10_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_10_pic_x " y" euro_bill_10_pic_y, %A_ScriptDir%\Pictures\10 Euro.jpg
Gui, Add, Text, % "Vviewtab_second_euro_bill_10_times_text " "ReadOnly " " -TabStop" " w" euro_bill_10_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_10_times_text_x " y" euro_bill_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_bill_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_10_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_10_edit_x " y" euro_bill_10_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_bill_5_pic " "ReadOnly " " -TabStop" " w" euro_bill_5_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_5_pic_x " y" euro_bill_5_pic_y, %A_ScriptDir%\Pictures\5 Euro.jpg
Gui, Add, Text, % "Vviewtab_second_euro_bill_5_times_text " "ReadOnly " " -TabStop" " w" euro_bill_5_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_5_times_text_x " y" euro_bill_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_bill_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bill_5_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bill_5_edit_x " y" euro_bill_5_edit_y

Gui, Add, Edit, % "Vviewtab_second_euro_bills_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_bills_sum_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bills_sum_edit_x " y" euro_bills_sum_edit_y
}
;=================================_====================================
;======================== Big Coins Controls ==========================
{
Gui, Add, Picture, % "Vviewtab_first_kuna_bigcoin_5_pic " "ReadOnly " " -TabStop" " w" kuna_bigcoin_5_pic_w " h" controls_h " x" kuna_bigcoin_5_pic_x " y" kuna_bigcoin_5_pic_y, %A_ScriptDir%\Pictures\5 Kuna.png
Gui, Add, Text, % "Vviewtab_first_kuna_bigcoin_5_times_text " "ReadOnly " " -TabStop" " w" kuna_bigcoin_5_times_text_w " h" controls_h " x" kuna_bigcoin_5_times_text_x " y" kuna_bigcoin_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bigcoin_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bigcoin_5_edit_w " h" controls_h " x" kuna_bigcoin_5_edit_x " y" kuna_bigcoin_5_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_bigcoin_2_pic " "ReadOnly " " -TabStop" " w" kuna_bigcoin_2_pic_w " h" controls_h " x" kuna_bigcoin_2_pic_x " y" kuna_bigcoin_2_pic_y, %A_ScriptDir%\Pictures\2 Kuna.jpg
Gui, Add, Text, % "Vviewtab_first_kuna_bigcoin_2_times_text " "ReadOnly " " -TabStop" " w" kuna_bigcoin_2_times_text_w " h" controls_h " x" kuna_bigcoin_2_times_text_x " y" kuna_bigcoin_2_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bigcoin_2_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bigcoin_2_edit_w " h" controls_h " x" kuna_bigcoin_2_edit_x " y" kuna_bigcoin_2_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_bigcoin_1_pic " "ReadOnly " " -TabStop" " w" kuna_bigcoin_1_pic_w " h" controls_h " x" kuna_bigcoin_1_pic_x " y" kuna_bigcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Kuna.png
Gui, Add, Text, % "Vviewtab_first_kuna_bigcoin_1_times_text " "ReadOnly " " -TabStop" " w" kuna_bigcoin_1_times_text_w " h" controls_h " x" kuna_bigcoin_1_times_text_x " y" kuna_bigcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_bigcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bigcoin_1_edit_w " h" controls_h " x" kuna_bigcoin_1_edit_x " y" kuna_bigcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_first_kuna_bigcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_bigcoins_sum_edit_w " h" controls_h " x" kuna_bigcoins_sum_edit_x " y" kuna_bigcoins_sum_edit_y



Gui, Add, Picture, % "Vviewtab_first_euro_bigcoin_2_pic " "ReadOnly " " -TabStop" " w" euro_bigcoin_2_pic_w " h" controls_h " x" euro_bigcoin_2_pic_x " y" euro_bigcoin_2_pic_y, %A_ScriptDir%\Pictures\2 Euro.jpg
Gui, Add, Text, % "Vviewtab_first_euro_bigcoin_2_times_text " "ReadOnly " " -TabStop" " w" euro_bigcoin_2_times_text_w " h" controls_h " x" euro_bigcoin_2_times_text_x " y" euro_bigcoin_2_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_bigcoin_2_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bigcoin_2_edit_w " h" controls_h " x" euro_bigcoin_2_edit_x " y" euro_bigcoin_2_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_bigcoin_1_pic " "ReadOnly " " -TabStop" " w" euro_bigcoin_1_pic_w " h" controls_h " x" euro_bigcoin_1_pic_x " y" euro_bigcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Euro.jpg
Gui, Add, Text, % "Vviewtab_first_euro_bigcoin_1_times_text " "ReadOnly " " -TabStop" " w" euro_bigcoin_1_times_text_w " h" controls_h " x" euro_bigcoin_1_times_text_x " y" euro_bigcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_bigcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bigcoin_1_edit_w " h" controls_h " x" euro_bigcoin_1_edit_x " y" euro_bigcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_first_euro_bigcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_bigcoins_sum_edit_w " h" controls_h " x" euro_bigcoins_sum_edit_x " y" euro_bigcoins_sum_edit_y

;=================================_====================================

Gui, Add, Picture, % "Vviewtab_second_kuna_bigcoin_5_pic " "ReadOnly " " -TabStop" " w" kuna_bigcoin_5_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_5_pic_x " y" kuna_bigcoin_5_pic_y, %A_ScriptDir%\Pictures\5 Kuna.png
Gui, Add, Text, % "Vviewtab_second_kuna_bigcoin_5_times_text " "ReadOnly " " -TabStop" " w" kuna_bigcoin_5_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_5_times_text_x " y" kuna_bigcoin_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bigcoin_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bigcoin_5_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_5_edit_x " y" kuna_bigcoin_5_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_bigcoin_2_pic " "ReadOnly " " -TabStop" " w" kuna_bigcoin_2_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_2_pic_x " y" kuna_bigcoin_2_pic_y, %A_ScriptDir%\Pictures\2 Kuna.jpg
Gui, Add, Text, % "Vviewtab_second_kuna_bigcoin_2_times_text " "ReadOnly " " -TabStop" " w" kuna_bigcoin_2_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_2_times_text_x " y" kuna_bigcoin_2_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bigcoin_2_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bigcoin_2_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_2_edit_x " y" kuna_bigcoin_2_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_bigcoin_1_pic " "ReadOnly " " -TabStop" " w" kuna_bigcoin_1_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_1_pic_x " y" kuna_bigcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Kuna.png
Gui, Add, Text, % "Vviewtab_second_kuna_bigcoin_1_times_text " "ReadOnly " " -TabStop" " w" kuna_bigcoin_1_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_1_times_text_x " y" kuna_bigcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_bigcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_bigcoin_1_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoin_1_edit_x " y" kuna_bigcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_second_kuna_bigcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_bigcoins_sum_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_bigcoins_sum_edit_x " y" kuna_bigcoins_sum_edit_y



Gui, Add, Picture, % "Vviewtab_second_euro_bigcoin_2_pic " "ReadOnly " " -TabStop" " w" euro_bigcoin_2_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bigcoin_2_pic_x " y" euro_bigcoin_2_pic_y, %A_ScriptDir%\Pictures\2 Euro.jpg
Gui, Add, Text, % "Vviewtab_second_euro_bigcoin_2_times_text " "ReadOnly " " -TabStop" " w" euro_bigcoin_2_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bigcoin_2_times_text_x " y" euro_bigcoin_2_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_bigcoin_2_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bigcoin_2_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bigcoin_2_edit_x " y" euro_bigcoin_2_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_bigcoin_1_pic " "ReadOnly " " -TabStop" " w" euro_bigcoin_1_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bigcoin_1_pic_x " y" euro_bigcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Euro.jpg
Gui, Add, Text, % "Vviewtab_second_euro_bigcoin_1_times_text " "ReadOnly " " -TabStop" " w" euro_bigcoin_1_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bigcoin_1_times_text_x " y" euro_bigcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_bigcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_bigcoin_1_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bigcoin_1_edit_x " y" euro_bigcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_second_euro_bigcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_bigcoins_sum_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_bigcoins_sum_edit_x " y" euro_bigcoins_sum_edit_y
}
;=================================_====================================
;======================= Small Coins Controls =========================
{
Gui, Add, Picture, % "Vviewtab_first_kuna_smallcoin_50_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_50_pic_w " h" controls_h " x" kuna_smallcoin_50_pic_x " y" kuna_smallcoin_50_pic_y, %A_ScriptDir%\Pictures\50 Lipa.png
Gui, Add, Text, % "Vviewtab_first_kuna_smallcoin_50_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_50_times_text_w " h" controls_h " x" kuna_smallcoin_50_times_text_x " y" kuna_smallcoin_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_smallcoin_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_50_edit_w " h" controls_h " x" kuna_smallcoin_50_edit_x " y" kuna_smallcoin_50_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_smallcoin_20_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_20_pic_w " h" controls_h " x" kuna_smallcoin_20_pic_x " y" kuna_smallcoin_20_pic_y, %A_ScriptDir%\Pictures\20 Lipa.png
Gui, Add, Text, % "Vviewtab_first_kuna_smallcoin_20_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_20_times_text_w " h" controls_h " x" kuna_smallcoin_20_times_text_x " y" kuna_smallcoin_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_smallcoin_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_20_edit_w " h" controls_h " x" kuna_smallcoin_20_edit_x " y" kuna_smallcoin_20_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_smallcoin_10_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_10_pic_w " h" controls_h " x" kuna_smallcoin_10_pic_x " y" kuna_smallcoin_10_pic_y, %A_ScriptDir%\Pictures\10 Lipa.jpg
Gui, Add, Text, % "Vviewtab_first_kuna_smallcoin_10_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_10_times_text_w " h" controls_h " x" kuna_smallcoin_10_times_text_x " y" kuna_smallcoin_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_smallcoin_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_10_edit_w " h" controls_h " x" kuna_smallcoin_10_edit_x " y" kuna_smallcoin_10_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_smallcoin_5_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_5_pic_w " h" controls_h " x" kuna_smallcoin_5_pic_x " y" kuna_smallcoin_5_pic_y, %A_ScriptDir%\Pictures\5 Lipa.png
Gui, Add, Text, % "Vviewtab_first_kuna_smallcoin_5_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_5_times_text_w " h" controls_h " x" kuna_smallcoin_5_times_text_x " y" kuna_smallcoin_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_smallcoin_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_5_edit_w " h" controls_h " x" kuna_smallcoin_5_edit_x " y" kuna_smallcoin_5_edit_y

Gui, Add, Picture, % "Vviewtab_first_kuna_smallcoin_1_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_1_pic_w " h" controls_h " x" kuna_smallcoin_1_pic_x " y" kuna_smallcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Lipa.jpg
Gui, Add, Text, % "Vviewtab_first_kuna_smallcoin_1_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_1_times_text_w " h" controls_h " x" kuna_smallcoin_1_times_text_x " y" kuna_smallcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_kuna_smallcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_1_edit_w " h" controls_h " x" kuna_smallcoin_1_edit_x " y" kuna_smallcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_first_kuna_smallcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_smallcoins_sum_edit_w " h" controls_h " x" kuna_smallcoins_sum_edit_x " y" kuna_smallcoins_sum_edit_y



Gui, Add, Picture, % "Vviewtab_first_euro_smallcoin_50_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_50_pic_w " h" controls_h " x" euro_smallcoin_50_pic_x " y" euro_smallcoin_50_pic_y, %A_ScriptDir%\Pictures\50 Cents.jpg
Gui, Add, Text, % "Vviewtab_first_euro_smallcoin_50_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_50_times_text_w " h" controls_h " x" euro_smallcoin_50_times_text_x " y" euro_smallcoin_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_smallcoin_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_50_edit_w " h" controls_h " x" euro_smallcoin_50_edit_x " y" euro_smallcoin_50_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_smallcoin_20_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_20_pic_w " h" controls_h " x" euro_smallcoin_20_pic_x " y" euro_smallcoin_20_pic_y, %A_ScriptDir%\Pictures\20 Cents.jpg
Gui, Add, Text, % "Vviewtab_first_euro_smallcoin_20_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_20_times_text_w " h" controls_h " x" euro_smallcoin_20_times_text_x " y" euro_smallcoin_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_smallcoin_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_20_edit_w " h" controls_h " x" euro_smallcoin_20_edit_x " y" euro_smallcoin_20_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_smallcoin_10_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_10_pic_w " h" controls_h " x" euro_smallcoin_10_pic_x " y" euro_smallcoin_10_pic_y, %A_ScriptDir%\Pictures\10 Cents.jpg
Gui, Add, Text, % "Vviewtab_first_euro_smallcoin_10_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_10_times_text_w " h" controls_h " x" euro_smallcoin_10_times_text_x " y" euro_smallcoin_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_smallcoin_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_10_edit_w " h" controls_h " x" euro_smallcoin_10_edit_x " y" euro_smallcoin_10_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_smallcoin_5_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_5_pic_w " h" controls_h " x" euro_smallcoin_5_pic_x " y" euro_smallcoin_5_pic_y, %A_ScriptDir%\Pictures\5 Cents.jpg
Gui, Add, Text, % "Vviewtab_first_euro_smallcoin_5_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_5_times_text_w " h" controls_h " x" euro_smallcoin_5_times_text_x " y" euro_smallcoin_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_smallcoin_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_5_edit_w " h" controls_h " x" euro_smallcoin_5_edit_x " y" euro_smallcoin_5_edit_y

Gui, Add, Picture, % "Vviewtab_first_euro_smallcoin_1_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_1_pic_w " h" controls_h " x" euro_smallcoin_1_pic_x " y" euro_smallcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Cent.jpg
Gui, Add, Text, % "Vviewtab_first_euro_smallcoin_1_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_1_times_text_w " h" controls_h " x" euro_smallcoin_1_times_text_x " y" euro_smallcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_first_euro_smallcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_1_edit_w " h" controls_h " x" euro_smallcoin_1_edit_x " y" euro_smallcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_first_euro_smallcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_smallcoins_sum_edit_w " h" controls_h " x" euro_smallcoins_sum_edit_x " y" euro_smallcoins_sum_edit_y

;=================================_====================================

Gui, Add, Picture, % "Vviewtab_second_kuna_smallcoin_50_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_50_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_50_pic_x " y" kuna_smallcoin_50_pic_y, %A_ScriptDir%\Pictures\50 Lipa.png
Gui, Add, Text, % "Vviewtab_second_kuna_smallcoin_50_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_50_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_50_times_text_x " y" kuna_smallcoin_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_smallcoin_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_50_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_50_edit_x " y" kuna_smallcoin_50_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_smallcoin_20_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_20_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_20_pic_x " y" kuna_smallcoin_20_pic_y, %A_ScriptDir%\Pictures\20 Lipa.png
Gui, Add, Text, % "Vviewtab_second_kuna_smallcoin_20_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_20_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_20_times_text_x " y" kuna_smallcoin_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_smallcoin_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_20_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_20_edit_x " y" kuna_smallcoin_20_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_smallcoin_10_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_10_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_10_pic_x " y" kuna_smallcoin_10_pic_y, %A_ScriptDir%\Pictures\10 Lipa.jpg
Gui, Add, Text, % "Vviewtab_second_kuna_smallcoin_10_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_10_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_10_times_text_x " y" kuna_smallcoin_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_smallcoin_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_10_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_10_edit_x " y" kuna_smallcoin_10_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_smallcoin_5_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_5_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_5_pic_x " y" kuna_smallcoin_5_pic_y, %A_ScriptDir%\Pictures\5 Lipa.png
Gui, Add, Text, % "Vviewtab_second_kuna_smallcoin_5_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_5_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_5_times_text_x " y" kuna_smallcoin_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_smallcoin_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_5_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_5_edit_x " y" kuna_smallcoin_5_edit_y

Gui, Add, Picture, % "Vviewtab_second_kuna_smallcoin_1_pic " "ReadOnly " " -TabStop" " w" kuna_smallcoin_1_pic_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_1_pic_x " y" kuna_smallcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Lipa.jpg
Gui, Add, Text, % "Vviewtab_second_kuna_smallcoin_1_times_text " "ReadOnly " " -TabStop" " w" kuna_smallcoin_1_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_1_times_text_x " y" kuna_smallcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_kuna_smallcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" kuna_smallcoin_1_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoin_1_edit_x " y" kuna_smallcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_second_kuna_smallcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_smallcoins_sum_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_smallcoins_sum_edit_x " y" kuna_smallcoins_sum_edit_y



Gui, Add, Picture, % "Vviewtab_second_euro_smallcoin_50_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_50_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_50_pic_x " y" euro_smallcoin_50_pic_y, %A_ScriptDir%\Pictures\50 Cents.jpg
Gui, Add, Text, % "Vviewtab_second_euro_smallcoin_50_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_50_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_50_times_text_x " y" euro_smallcoin_50_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_smallcoin_50_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_50_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_50_edit_x " y" euro_smallcoin_50_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_smallcoin_20_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_20_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_20_pic_x " y" euro_smallcoin_20_pic_y, %A_ScriptDir%\Pictures\20 Cents.jpg
Gui, Add, Text, % "Vviewtab_second_euro_smallcoin_20_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_20_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_20_times_text_x " y" euro_smallcoin_20_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_smallcoin_20_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_20_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_20_edit_x " y" euro_smallcoin_20_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_smallcoin_10_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_10_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_10_pic_x " y" euro_smallcoin_10_pic_y, %A_ScriptDir%\Pictures\10 Cents.jpg
Gui, Add, Text, % "Vviewtab_second_euro_smallcoin_10_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_10_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_10_times_text_x " y" euro_smallcoin_10_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_smallcoin_10_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_10_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_10_edit_x " y" euro_smallcoin_10_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_smallcoin_5_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_5_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_5_pic_x " y" euro_smallcoin_5_pic_y, %A_ScriptDir%\Pictures\5 Cents.jpg
Gui, Add, Text, % "Vviewtab_second_euro_smallcoin_5_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_5_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_5_times_text_x " y" euro_smallcoin_5_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_smallcoin_5_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_5_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_5_edit_x " y" euro_smallcoin_5_edit_y

Gui, Add, Picture, % "Vviewtab_second_euro_smallcoin_1_pic " "ReadOnly " " -TabStop" " w" euro_smallcoin_1_pic_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_1_pic_x " y" euro_smallcoin_1_pic_y, %A_ScriptDir%\Pictures\1 Cent.jpg
Gui, Add, Text, % "Vviewtab_second_euro_smallcoin_1_times_text " "ReadOnly " " -TabStop" " w" euro_smallcoin_1_times_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_1_times_text_x " y" euro_smallcoin_1_times_text_y, x
Gui, Add, Edit, % "Vviewtab_second_euro_smallcoin_1_edit " "ReadOnly " "Number" " Center" " -TabStop" " w" euro_smallcoin_1_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoin_1_edit_x " y" euro_smallcoin_1_edit_y

Gui, Add, Edit, % "Vviewtab_second_euro_smallcoins_sum_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_smallcoins_sum_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_smallcoins_sum_edit_x " y" euro_smallcoins_sum_edit_y
}
;=================================_====================================
;========================== Bank Controls =============================
{
Gui, Add, Text, % "Vviewtab_first_bank_text " " -TabStop" " w" bank_text_w " h" controls_h " x" bank_text_x " y" bank_text_y, Bank:

Gui, Add, Edit, % "Vviewtab_first_bank_edit " "ReadOnly " "Center" " -TabStop" " w" bank_edit_w " h" controls_h " x" bank_edit_x " y" bank_edit_y

;=================================_====================================

Gui, Add, Text, % "Vviewtab_second_bank_text " " -TabStop" " w" bank_text_w " h" controls_h " x" (tab_w + distance_to_border) + bank_text_x " y" bank_text_y, Bank:

Gui, Add, Edit, % "Vviewtab_second_bank_edit " "ReadOnly " "Center" " -TabStop" " w" bank_edit_w " h" controls_h " x" (tab_w + distance_to_border) + bank_edit_x " y" bank_edit_y
}
;=================================_====================================
;======================= Calculation Controls =========================
{
Gui, Add, Text, % "Vviewtab_first_kuna_text " " -TabStop" " w" kuna_text_w " h" controls_h " x" kuna_text_x " y" kuna_text_y, Kuna:

Gui, Add, Edit, % "Vviewtab_first_kuna_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_edit_w " h" controls_h " x" kuna_edit_x " y" kuna_edit_y


Gui, Add, Text, % "Vviewtab_first_euro_text " " -TabStop" " w" euro_text_w " h" controls_h " x" euro_text_x " y" euro_text_y, Euro:

Gui, Add, Edit, % "Vviewtab_first_euro_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_edit_w " h" controls_h " x" euro_edit_x " y" euro_edit_y

;=================================_====================================

Gui, Add, Text, % "Vviewtab_second_kuna_text " " -TabStop" " w" kuna_text_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_text_x " y" kuna_text_y, Kuna:

Gui, Add, Edit, % "Vviewtab_second_kuna_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" kuna_edit_w " h" controls_h " x" (tab_w + distance_to_border) + kuna_edit_x " y" kuna_edit_y


Gui, Add, Text, % "Vviewtab_second_euro_text " " -TabStop" " w" euro_text_w " h" controls_h " x" (tab_w + distance_to_border) + euro_text_x " y" euro_text_y, Euro:

Gui, Add, Edit, % "Vviewtab_second_euro_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" euro_edit_w " h" controls_h " x" (tab_w + distance_to_border) + euro_edit_x " y" euro_edit_y
}
;=================================_====================================
;========================== Select Button =============================
{
Gui, Add, Checkbox, % "Vviewtab_first_store_button " "0x1000 " "Center" " w" store_button_w " h" controls_h " x" store_button_x " y" store_button_y, Select

;=================================_====================================

Gui, Add, Checkbox, % "Vviewtab_second_store_button " "0x1000 " "Center" " w" store_button_w " h" controls_h " x" (tab_w + distance_to_border) + store_button_x " y" store_button_y, Select
}
;=================================_====================================
;========================== Total Balance =============================
{
Gui, Add, Edit, % "Vviewtab_first_balance_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" balance_edit_w " h" controls_h " x" balance_edit_x " y" balance_edit_y

;=================================_====================================

Gui, Add, Edit, % "Vviewtab_second_balance_edit " "ReadOnly " "-TabStop " "Center" " -TabStop" " w" balance_edit_w " h" controls_h " x" (tab_w + distance_to_border) + balance_edit_x " y" balance_edit_y
}
;=================================_====================================
;========================== Notes Control =============================
{
Gui, Add, Text, % "Vviewtab_first_notes_text " " -TabStop" " w" notes_text_w " h" controls_h " x" notes_text_x " y" notes_text_y, Note:

Gui, Add, Edit, % "Vviewtab_first_notes_edit " " ReadOnly " " -TabStop" " r" 3 " w" notes_edit_w " h" controls_h " x" notes_edit_x " y" notes_edit_y

;=================================_====================================

Gui, Add, Text, % "Vviewtab_second_notes_text " " -TabStop" " w" notes_text_w " h" controls_h " x" (tab_w + distance_to_border) + notes_text_x " y" notes_text_y, Note:

Gui, Add, Edit, % "Vviewtab_second_notes_edit " " ReadOnly " " -TabStop" " r" 3 " w" notes_edit_w " h" controls_h " x" (tab_w + distance_to_border) + notes_edit_x " y" notes_edit_y
}


;=================================_====================================
;============================ Edit Tab ================================
{
Gui, Tab, Edit, , Exact ; sets the controls in "Vedittab_iew" tab
}
;=================================_====================================
;======================== Currency Controls ===========================
{
Gui, Add, Text, Vedittab_currency_text w%currency_text_w% h%controls_h% x%currency_text_x% y%currency_text_y%, Currency:

Gui, Add, DDL, Vedittab_currency_ddl Gedittab_currency_ddl -TabStop Choose1 w%currency_ddl_w% r2 x%currency_ddl_x% y%currency_ddl_y%, Kuna|Euro
}
;=================================_====================================
;========================== Date Control ==============================
{
Gui, Add, DDl, Vedittab_date_ddl Gedittab_chosen_date Limit w%date_ddl_w% r15 x%date_ddl_x% y%date_ddl_y%
}
;=================================_====================================
;========================= Bills Controls =============================
{
Gui, Add, Picture, Vedittab_kuna_bill_200_pic w%kuna_bill_200_pic_w% h%controls_h% x%kuna_bill_200_pic_x% y%kuna_bill_200_pic_y%, %A_ScriptDir%\Pictures\200 Kuna.jpg
Gui, Add, Text, Vedittab_kuna_bill_200_times_text w%kuna_bill_200_times_text_w% h%controls_h% x%kuna_bill_200_times_text_x% y%kuna_bill_200_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bill_200_edit Gedittab_autoupdate Number Center w%kuna_bill_200_edit_w% h%controls_h% x%kuna_bill_200_edit_x% y%kuna_bill_200_edit_y%

Gui, Add, Picture, Vedittab_kuna_bill_100_pic w%kuna_bill_100_pic_w% h%controls_h% x%kuna_bill_100_pic_x% y%kuna_bill_100_pic_y%, %A_ScriptDir%\Pictures\100 Kuna.jpg
Gui, Add, Text, Vedittab_kuna_bill_100_times_text w%kuna_bill_100_times_text_w% h%controls_h% x%kuna_bill_100_times_text_x% y%kuna_bill_100_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bill_100_edit Gedittab_autoupdate Number Center w%kuna_bill_100_edit_w% h%controls_h% x%kuna_bill_100_edit_x% y%kuna_bill_100_edit_y%

Gui, Add, Picture, Vedittab_kuna_bill_50_pic w%kuna_bill_50_pic_w% h%controls_h% x%kuna_bill_50_pic_x% y%kuna_bill_50_pic_y%, %A_ScriptDir%\Pictures\50 Kuna.jpg
Gui, Add, Text, Vedittab_kuna_bill_50_times_text w%kuna_bill_50_times_text_w% h%controls_h% x%kuna_bill_50_times_text_x% y%kuna_bill_50_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bill_50_edit Gedittab_autoupdate Number Center w%kuna_bill_50_edit_w% h%controls_h% x%kuna_bill_50_edit_x% y%kuna_bill_50_edit_y%

Gui, Add, Picture, Vedittab_kuna_bill_20_pic w%kuna_bill_20_pic_w% h%controls_h% x%kuna_bill_20_pic_x% y%kuna_bill_20_pic_y%, %A_ScriptDir%\Pictures\20 Kuna.jpg
Gui, Add, Text, Vedittab_kuna_bill_20_times_text w%kuna_bill_20_times_text_w% h%controls_h% x%kuna_bill_20_times_text_x% y%kuna_bill_20_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bill_20_edit Gedittab_autoupdate Number Center w%kuna_bill_20_edit_w% h%controls_h% x%kuna_bill_20_edit_x% y%kuna_bill_20_edit_y%

Gui, Add, Picture, Vedittab_kuna_bill_10_pic w%kuna_bill_10_pic_w% h%controls_h% x%kuna_bill_10_pic_x% y%kuna_bill_10_pic_y%, %A_ScriptDir%\Pictures\10 Kuna.png
Gui, Add, Text, Vedittab_kuna_bill_10_times_text w%kuna_bill_10_times_text_w% h%controls_h% x%kuna_bill_10_times_text_x% y%kuna_bill_10_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bill_10_edit Gedittab_autoupdate Number Center w%kuna_bill_10_edit_w% h%controls_h% x%kuna_bill_10_edit_x% y%kuna_bill_10_edit_y%

Gui, Add, Edit, Vedittab_kuna_bills_sum_edit ReadOnly -TabStop Center w%kuna_bills_sum_edit_w% h%controls_h% x%kuna_bills_sum_edit_x% y%kuna_bills_sum_edit_y%



Gui, Add, Picture, Vedittab_euro_bill_100_pic w%euro_bill_100_pic_w% h%controls_h% x%euro_bill_100_pic_x% y%euro_bill_100_pic_y%, %A_ScriptDir%\Pictures\100 Euro.jpg
Gui, Add, Text, Vedittab_euro_bill_100_times_text w%euro_bill_100_times_text_w% h%controls_h% x%euro_bill_100_times_text_x% y%euro_bill_100_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_bill_100_edit Gedittab_autoupdate Number Center w%euro_bill_100_edit_w% h%controls_h% x%euro_bill_100_edit_x% y%euro_bill_100_edit_y%

Gui, Add, Picture, Vedittab_euro_bill_50_pic w%euro_bill_50_pic_w% h%controls_h% x%euro_bill_50_pic_x% y%euro_bill_50_pic_y%, %A_ScriptDir%\Pictures\50 Euro.jpg
Gui, Add, Text, Vedittab_euro_bill_50_times_text w%euro_bill_50_times_text_w% h%controls_h% x%euro_bill_50_times_text_x% y%euro_bill_50_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_bill_50_edit Gedittab_autoupdate Number Center w%euro_bill_50_edit_w% h%controls_h% x%euro_bill_50_edit_x% y%euro_bill_50_edit_y%

Gui, Add, Picture, Vedittab_euro_bill_20_pic w%euro_bill_20_pic_w% h%controls_h% x%euro_bill_20_pic_x% y%euro_bill_20_pic_y%, %A_ScriptDir%\Pictures\20 Euro.jpg
Gui, Add, Text, Vedittab_euro_bill_20_times_text w%euro_bill_20_times_text_w% h%controls_h% x%euro_bill_20_times_text_x% y%euro_bill_20_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_bill_20_edit Gedittab_autoupdate Number Center w%euro_bill_20_edit_w% h%controls_h% x%euro_bill_20_edit_x% y%euro_bill_20_edit_y%

Gui, Add, Picture, Vedittab_euro_bill_10_pic w%euro_bill_10_pic_w% h%controls_h% x%euro_bill_10_pic_x% y%euro_bill_10_pic_y%, %A_ScriptDir%\Pictures\10 Euro.jpg
Gui, Add, Text, Vedittab_euro_bill_10_times_text w%euro_bill_10_times_text_w% h%controls_h% x%euro_bill_10_times_text_x% y%euro_bill_10_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_bill_10_edit Gedittab_autoupdate Number Center w%euro_bill_10_edit_w% h%controls_h% x%euro_bill_10_edit_x% y%euro_bill_10_edit_y%

Gui, Add, Picture, Vedittab_euro_bill_5_pic w%euro_bill_5_pic_w% h%controls_h% x%euro_bill_5_pic_x% y%euro_bill_5_pic_y%, %A_ScriptDir%\Pictures\5 Euro.jpg
Gui, Add, Text, Vedittab_euro_bill_5_times_text w%euro_bill_5_times_text_w% h%controls_h% x%euro_bill_5_times_text_x% y%euro_bill_5_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_bill_5_edit Gedittab_autoupdate Number Center w%euro_bill_5_edit_w% h%controls_h% x%euro_bill_5_edit_x% y%euro_bill_5_edit_y%

Gui, Add, Edit, Vedittab_euro_bills_sum_edit ReadOnly -TabStop Center w%euro_bills_sum_edit_w% h%controls_h% x%euro_bills_sum_edit_x% y%euro_bills_sum_edit_y%
}
;=================================_====================================
;======================== Big Coins Controls ==========================
{
Gui, Add, Picture, Vedittab_kuna_bigcoin_5_pic w%kuna_bigcoin_5_pic_w% h%controls_h% x%kuna_bigcoin_5_pic_x% y%kuna_bigcoin_5_pic_y%, %A_ScriptDir%\Pictures\5 Kuna.png
Gui, Add, Text, Vedittab_kuna_bigcoin_5_times_text w%kuna_bigcoin_5_times_text_w% h%controls_h% x%kuna_bigcoin_5_times_text_x% y%kuna_bigcoin_5_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bigcoin_5_edit Gedittab_autoupdate Number Center w%kuna_bigcoin_5_edit_w% h%controls_h% x%kuna_bigcoin_5_edit_x% y%kuna_bigcoin_5_edit_y%

Gui, Add, Picture, Vedittab_kuna_bigcoin_2_pic w%kuna_bigcoin_2_pic_w% h%controls_h% x%kuna_bigcoin_2_pic_x% y%kuna_bigcoin_2_pic_y%, %A_ScriptDir%\Pictures\2 Kuna.jpg
Gui, Add, Text, Vedittab_kuna_bigcoin_2_times_text w%kuna_bigcoin_2_times_text_w% h%controls_h% x%kuna_bigcoin_2_times_text_x% y%kuna_bigcoin_2_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bigcoin_2_edit Gedittab_autoupdate Number Center w%kuna_bigcoin_2_edit_w% h%controls_h% x%kuna_bigcoin_2_edit_x% y%kuna_bigcoin_2_edit_y%

Gui, Add, Picture, Vedittab_kuna_bigcoin_1_pic w%kuna_bigcoin_1_pic_w% h%controls_h% x%kuna_bigcoin_1_pic_x% y%kuna_bigcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Kuna.png
Gui, Add, Text, Vedittab_kuna_bigcoin_1_times_text w%kuna_bigcoin_1_times_text_w% h%controls_h% x%kuna_bigcoin_1_times_text_x% y%kuna_bigcoin_1_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_bigcoin_1_edit Gedittab_autoupdate Number Center w%kuna_bigcoin_1_edit_w% h%controls_h% x%kuna_bigcoin_1_edit_x% y%kuna_bigcoin_1_edit_y%

Gui, Add, Edit, Vedittab_kuna_bigcoins_sum_edit ReadOnly -TabStop Center w%kuna_bigcoins_sum_edit_w% h%controls_h% x%kuna_bigcoins_sum_edit_x% y%kuna_bigcoins_sum_edit_y%



Gui, Add, Picture, Vedittab_euro_bigcoin_2_pic w%euro_bigcoin_2_pic_w% h%controls_h% x%euro_bigcoin_2_pic_x% y%euro_bigcoin_2_pic_y%, %A_ScriptDir%\Pictures\2 Euro.jpg
Gui, Add, Text, Vedittab_euro_bigcoin_2_times_text w%euro_bigcoin_2_times_text_w% h%controls_h% x%euro_bigcoin_2_times_text_x% y%euro_bigcoin_2_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_bigcoin_2_edit Gedittab_autoupdate Number Center w%euro_bigcoin_2_edit_w% h%controls_h% x%euro_bigcoin_2_edit_x% y%euro_bigcoin_2_edit_y%

Gui, Add, Picture, Vedittab_euro_bigcoin_1_pic w%euro_bigcoin_1_pic_w% h%controls_h% x%euro_bigcoin_1_pic_x% y%euro_bigcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Euro.jpg
Gui, Add, Text, Vedittab_euro_bigcoin_1_times_text w%euro_bigcoin_1_times_text_w% h%controls_h% x%euro_bigcoin_1_times_text_x% y%euro_bigcoin_1_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_bigcoin_1_edit Gedittab_autoupdate Number Center w%euro_bigcoin_1_edit_w% h%controls_h% x%euro_bigcoin_1_edit_x% y%euro_bigcoin_1_edit_y%

Gui, Add, Edit, Vedittab_euro_bigcoins_sum_edit ReadOnly -TabStop Center w%euro_bigcoins_sum_edit_w% h%controls_h% x%euro_bigcoins_sum_edit_x% y%euro_bigcoins_sum_edit_y%
}
;=================================_====================================
;======================= Small Coins Controls =========================
{
Gui, Add, Picture, Vedittab_kuna_smallcoin_50_pic w%kuna_smallcoin_50_pic_w% h%controls_h% x%kuna_smallcoin_50_pic_x% y%kuna_smallcoin_50_pic_y%, %A_ScriptDir%\Pictures\50 Lipa.png
Gui, Add, Text, Vedittab_kuna_smallcoin_50_times_text w%kuna_smallcoin_50_times_text_w% h%controls_h% x%kuna_smallcoin_50_times_text_x% y%kuna_smallcoin_50_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_smallcoin_50_edit Gedittab_autoupdate Number Center w%kuna_smallcoin_50_edit_w% h%controls_h% x%kuna_smallcoin_50_edit_x% y%kuna_smallcoin_50_edit_y%

Gui, Add, Picture, Vedittab_kuna_smallcoin_20_pic w%kuna_smallcoin_20_pic_w% h%controls_h% x%kuna_smallcoin_20_pic_x% y%kuna_smallcoin_20_pic_y%, %A_ScriptDir%\Pictures\20 Lipa.png
Gui, Add, Text, Vedittab_kuna_smallcoin_20_times_text w%kuna_smallcoin_20_times_text_w% h%controls_h% x%kuna_smallcoin_20_times_text_x% y%kuna_smallcoin_20_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_smallcoin_20_edit Gedittab_autoupdate Number Center w%kuna_smallcoin_20_edit_w% h%controls_h% x%kuna_smallcoin_20_edit_x% y%kuna_smallcoin_20_edit_y%

Gui, Add, Picture, Vedittab_kuna_smallcoin_10_pic w%kuna_smallcoin_10_pic_w% h%controls_h% x%kuna_smallcoin_10_pic_x% y%kuna_smallcoin_10_pic_y%, %A_ScriptDir%\Pictures\10 Lipa.jpg
Gui, Add, Text, Vedittab_kuna_smallcoin_10_times_text w%kuna_smallcoin_10_times_text_w% h%controls_h% x%kuna_smallcoin_10_times_text_x% y%kuna_smallcoin_10_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_smallcoin_10_edit Gedittab_autoupdate Number Center w%kuna_smallcoin_10_edit_w% h%controls_h% x%kuna_smallcoin_10_edit_x% y%kuna_smallcoin_10_edit_y%

Gui, Add, Picture, Vedittab_kuna_smallcoin_5_pic w%kuna_smallcoin_5_pic_w% h%controls_h% x%kuna_smallcoin_5_pic_x% y%kuna_smallcoin_5_pic_y%, %A_ScriptDir%\Pictures\5 Lipa.png
Gui, Add, Text, Vedittab_kuna_smallcoin_5_times_text w%kuna_smallcoin_5_times_text_w% h%controls_h% x%kuna_smallcoin_5_times_text_x% y%kuna_smallcoin_5_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_smallcoin_5_edit Gedittab_autoupdate Number Center w%kuna_smallcoin_5_edit_w% h%controls_h% x%kuna_smallcoin_5_edit_x% y%kuna_smallcoin_5_edit_y%

Gui, Add, Picture, Vedittab_kuna_smallcoin_1_pic w%kuna_smallcoin_1_pic_w% h%controls_h% x%kuna_smallcoin_1_pic_x% y%kuna_smallcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Lipa.jpg
Gui, Add, Text, Vedittab_kuna_smallcoin_1_times_text w%kuna_smallcoin_1_times_text_w% h%controls_h% x%kuna_smallcoin_1_times_text_x% y%kuna_smallcoin_1_times_text_y%, x
Gui, Add, Edit, Vedittab_kuna_smallcoin_1_edit Gedittab_autoupdate Number Center w%kuna_smallcoin_1_edit_w% h%controls_h% x%kuna_smallcoin_1_edit_x% y%kuna_smallcoin_1_edit_y%

Gui, Add, Edit, Vedittab_kuna_smallcoins_sum_edit ReadOnly -TabStop Center w%kuna_smallcoins_sum_edit_w% h%controls_h% x%kuna_smallcoins_sum_edit_x% y%kuna_smallcoins_sum_edit_y%



Gui, Add, Picture, Vedittab_euro_smallcoin_50_pic w%euro_smallcoin_50_pic_w% h%controls_h% x%euro_smallcoin_50_pic_x% y%euro_smallcoin_50_pic_y%, %A_ScriptDir%\Pictures\50 Cents.jpg
Gui, Add, Text, Vedittab_euro_smallcoin_50_times_text w%euro_smallcoin_50_times_text_w% h%controls_h% x%euro_smallcoin_50_times_text_x% y%euro_smallcoin_50_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_smallcoin_50_edit Gedittab_autoupdate Number Center w%euro_smallcoin_50_edit_w% h%controls_h% x%euro_smallcoin_50_edit_x% y%euro_smallcoin_50_edit_y%

Gui, Add, Picture, Vedittab_euro_smallcoin_20_pic w%euro_smallcoin_20_pic_w% h%controls_h% x%euro_smallcoin_20_pic_x% y%euro_smallcoin_20_pic_y%, %A_ScriptDir%\Pictures\20 Cents.jpg
Gui, Add, Text, Vedittab_euro_smallcoin_20_times_text w%euro_smallcoin_20_times_text_w% h%controls_h% x%euro_smallcoin_20_times_text_x% y%euro_smallcoin_20_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_smallcoin_20_edit Gedittab_autoupdate Number Center w%euro_smallcoin_20_edit_w% h%controls_h% x%euro_smallcoin_20_edit_x% y%euro_smallcoin_20_edit_y%

Gui, Add, Picture, Vedittab_euro_smallcoin_10_pic w%euro_smallcoin_10_pic_w% h%controls_h% x%euro_smallcoin_10_pic_x% y%euro_smallcoin_10_pic_y%, %A_ScriptDir%\Pictures\10 Cents.jpg
Gui, Add, Text, Vedittab_euro_smallcoin_10_times_text w%euro_smallcoin_10_times_text_w% h%controls_h% x%euro_smallcoin_10_times_text_x% y%euro_smallcoin_10_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_smallcoin_10_edit Gedittab_autoupdate Number Center w%euro_smallcoin_10_edit_w% h%controls_h% x%euro_smallcoin_10_edit_x% y%euro_smallcoin_10_edit_y%

Gui, Add, Picture, Vedittab_euro_smallcoin_5_pic w%euro_smallcoin_5_pic_w% h%controls_h% x%euro_smallcoin_5_pic_x% y%euro_smallcoin_5_pic_y%, %A_ScriptDir%\Pictures\5 Cents.jpg
Gui, Add, Text, Vedittab_euro_smallcoin_5_times_text w%euro_smallcoin_5_times_text_w% h%controls_h% x%euro_smallcoin_5_times_text_x% y%euro_smallcoin_5_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_smallcoin_5_edit Gedittab_autoupdate Number Center w%euro_smallcoin_5_edit_w% h%controls_h% x%euro_smallcoin_5_edit_x% y%euro_smallcoin_5_edit_y%

Gui, Add, Picture, Vedittab_euro_smallcoin_1_pic w%euro_smallcoin_1_pic_w% h%controls_h% x%euro_smallcoin_1_pic_x% y%euro_smallcoin_1_pic_y%, %A_ScriptDir%\Pictures\1 Cent.jpg
Gui, Add, Text, Vedittab_euro_smallcoin_1_times_text w%euro_smallcoin_1_times_text_w% h%controls_h% x%euro_smallcoin_1_times_text_x% y%euro_smallcoin_1_times_text_y%, x
Gui, Add, Edit, Vedittab_euro_smallcoin_1_edit Gedittab_autoupdate Number Center w%euro_smallcoin_1_edit_w% h%controls_h% x%euro_smallcoin_1_edit_x% y%euro_smallcoin_1_edit_y%

Gui, Add, Edit, Vedittab_euro_smallcoins_sum_edit ReadOnly -TabStop Center w%euro_smallcoins_sum_edit_w% h%controls_h% x%euro_smallcoins_sum_edit_x% y%euro_smallcoins_sum_edit_y%
}
;=================================_====================================
;========================== Bank Controls =============================
{
Gui, Add, Text, Vedittab_bank_text w%bank_text_w% h%controls_h% x%bank_text_x% y%bank_text_y%, Bank:

Gui, Add, Edit, Vedittab_bank_edit Gedittab_autoupdate Center w%bank_edit_w% h%controls_h% x%bank_edit_x% y%bank_edit_y%
}
;=================================_====================================
;======================= Calculation Controls =========================
{
Gui, Add, Text, Vedittab_kuna_text w%kuna_text_w% h%controls_h% x%kuna_text_x% y%kuna_text_y%, Kuna:

Gui, Add, Edit, Vedittab_kuna_edit ReadOnly -TabStop Center w%kuna_edit_w% h%controls_h% x%kuna_edit_x% y%kuna_edit_y%

;=================================_====================================

Gui, Add, Text, Vedittab_euro_text w%euro_text_w% h%controls_h% x%euro_text_x% y%euro_text_y%, Euro:

Gui, Add, Edit, Vedittab_euro_edit ReadOnly -TabStop Center w%euro_edit_w% h%controls_h% x%euro_edit_x% y%euro_edit_y%
}
;=================================_====================================
;=========================== Edit Button ==============================
{
Gui, Add, Button, Vedittab_edit_button Gedittab_edit_information -TabStop Center w%store_button_w% h%controls_h% x%store_button_x% y%store_button_y%, Edit
}
;=================================_====================================
;========================== Total Balance =============================
{
Gui, Add, Edit, Vedittab_balance_edit ReadOnly -TabStop Center w%balance_edit_w% h%controls_h% x%balance_edit_x% y%balance_edit_y%
}
;=================================_====================================
;========================== Notes Control =============================
{
Gui, Add, Text, Vedittab_notes_text_w w%notes_text_w% h%controls_h% x%notes_text_x% y%notes_text_y%, Note:

Gui, Add, Edit, Vedittab_notes_edit r3 w%notes_edit_w% h%controls_h% x%notes_edit_x% y%notes_edit_y%
}


;=================================_====================================
;============================== Start =================================
;=================================_====================================

gosub, inputtab_currency_ddl ; shows chosen currency type

gosub, inputtab_autoupdate ; for calculations


gosub, viewtab_currency_ddl ; shows chosen currency type

gosub, edittab_currency_ddl ; shows chosen currency type


gosub, viable_dates ; show input dates

GuiControl, Choose, viewtab_first_date_ddl, 1 ; chooses last input record
gosub, viewtab_first_chosen_date ; updates gui

GuiControl, Choose, viewtab_second_date_ddl, 2 ; chooses last input record
gosub, viewtab_second_chosen_date ; updates gui

GuiControl, Choose, edittab_date_ddl, 1 ; chooses last input record
gosub, edittab_chosen_date ; updates gui



Gui, -MaximizeBox -MinimizeBox


GuiControl, Hide, Tabs ; rendering issues
Loop, 200 ; show window
{
	current_w := current_w + 2.2
	current_h := current_h + 3.3
	
	current_x := (A_ScreenWidth / 2) - (current_w / 2)
	current_y := (A_ScreenHeight / 2) - (current_h / 2) - 40
	
	
	Gui, Show, w%current_w% h%current_h% x%current_x% y%current_y%, Balance Manager
}

gosub, tabs ; hides controls of "viewtab"

GuiControl, Show, Tabs ; rendering issues


return

;=================================_====================================
;=============================== Tags =================================
;=================================_====================================

tabs: ; expand window for view tab
{
GuiControlGet, current_tab, , tabs


{ ; hide "viewtab" controls

GuiControl, Hide, viewtab_second_currency_text
GuiControl, Hide, viewtab_second_currency_ddl


GuiControl, Hide, viewtab_second_date_ddl
GuiControl, Hide, viewtab_second_bank_text
GuiControl, Hide, viewtab_second_bank_edit
GuiControl, Hide, viewtab_second_kuna_text
GuiControl, Hide, viewtab_second_kuna_edit
GuiControl, Hide, viewtab_second_euro_text
GuiControl, Hide, viewtab_second_euro_edit
GuiControl, Hide, viewtab_second_store_button
GuiControl, Hide, viewtab_second_balance_edit
GuiControl, Hide, viewtab_second_notes_text
GuiControl, Hide, viewtab_second_notes_edit


GuiControl, Hide, viewtab_second_kuna_bill_200_pic
GuiControl, Hide, viewtab_second_kuna_bill_200_times_text
GuiControl, Hide, viewtab_second_kuna_bill_200_edit

GuiControl, Hide, viewtab_second_kuna_bill_100_pic
GuiControl, Hide, viewtab_second_kuna_bill_100_times_text
GuiControl, Hide, viewtab_second_kuna_bill_100_edit

GuiControl, Hide, viewtab_second_kuna_bill_50_pic
GuiControl, Hide, viewtab_second_kuna_bill_50_times_text
GuiControl, Hide, viewtab_second_kuna_bill_50_edit

GuiControl, Hide, viewtab_second_kuna_bill_20_pic
GuiControl, Hide, viewtab_second_kuna_bill_20_times_text
GuiControl, Hide, viewtab_second_kuna_bill_20_edit

GuiControl, Hide, viewtab_second_kuna_bill_10_pic
GuiControl, Hide, viewtab_second_kuna_bill_10_times_text
GuiControl, Hide, viewtab_second_kuna_bill_10_edit

GuiControl, Hide, viewtab_second_kuna_bills_sum_edit


GuiControl, Hide, viewtab_second_kuna_bigcoin_5_pic
GuiControl, Hide, viewtab_second_kuna_bigcoin_5_times_text
GuiControl, Hide, viewtab_second_kuna_bigcoin_5_edit

GuiControl, Hide, viewtab_second_kuna_bigcoin_2_pic
GuiControl, Hide, viewtab_second_kuna_bigcoin_2_times_text
GuiControl, Hide, viewtab_second_kuna_bigcoin_2_edit

GuiControl, Hide, viewtab_second_kuna_bigcoin_1_pic
GuiControl, Hide, viewtab_second_kuna_bigcoin_1_times_text
GuiControl, Hide, viewtab_second_kuna_bigcoin_1_edit

GuiControl, Hide, viewtab_second_kuna_bigcoins_sum_edit


GuiControl, Hide, viewtab_second_kuna_smallcoin_50_pic
GuiControl, Hide, viewtab_second_kuna_smallcoin_50_times_text
GuiControl, Hide, viewtab_second_kuna_smallcoin_50_edit

GuiControl, Hide, viewtab_second_kuna_smallcoin_20_pic
GuiControl, Hide, viewtab_second_kuna_smallcoin_20_times_text
GuiControl, Hide, viewtab_second_kuna_smallcoin_20_edit

GuiControl, Hide, viewtab_second_kuna_smallcoin_10_pic
GuiControl, Hide, viewtab_second_kuna_smallcoin_10_times_text
GuiControl, Hide, viewtab_second_kuna_smallcoin_10_edit

GuiControl, Hide, viewtab_second_kuna_smallcoin_5_pic
GuiControl, Hide, viewtab_second_kuna_smallcoin_5_times_text
GuiControl, Hide, viewtab_second_kuna_smallcoin_5_edit

GuiControl, Hide, viewtab_second_kuna_smallcoin_1_pic
GuiControl, Hide, viewtab_second_kuna_smallcoin_1_times_text
GuiControl, Hide, viewtab_second_kuna_smallcoin_1_edit

GuiControl, Hide, viewtab_second_kuna_smallcoins_sum_edit



GuiControl, Hide, viewtab_second_euro_bill_100_pic
GuiControl, Hide, viewtab_second_euro_bill_100_times_text
GuiControl, Hide, viewtab_second_euro_bill_100_edit

GuiControl, Hide, viewtab_second_euro_bill_50_pic
GuiControl, Hide, viewtab_second_euro_bill_50_times_text
GuiControl, Hide, viewtab_second_euro_bill_50_edit

GuiControl, Hide, viewtab_second_euro_bill_20_pic
GuiControl, Hide, viewtab_second_euro_bill_20_times_text
GuiControl, Hide, viewtab_second_euro_bill_20_edit

GuiControl, Hide, viewtab_second_euro_bill_10_pic
GuiControl, Hide, viewtab_second_euro_bill_10_times_text
GuiControl, Hide, viewtab_second_euro_bill_10_edit

GuiControl, Hide, viewtab_second_euro_bill_5_pic
GuiControl, Hide, viewtab_second_euro_bill_5_times_text
GuiControl, Hide, viewtab_second_euro_bill_5_edit

GuiControl, Hide, viewtab_second_euro_bills_sum_edit


GuiControl, Hide, viewtab_second_euro_bigcoin_2_pic
GuiControl, Hide, viewtab_second_euro_bigcoin_2_times_text
GuiControl, Hide, viewtab_second_euro_bigcoin_2_edit

GuiControl, Hide, viewtab_second_euro_bigcoin_1_pic
GuiControl, Hide, viewtab_second_euro_bigcoin_1_times_text
GuiControl, Hide, viewtab_second_euro_bigcoin_1_edit

GuiControl, Hide, viewtab_second_euro_bigcoins_sum_edit


GuiControl, Hide, viewtab_second_euro_smallcoin_50_pic
GuiControl, Hide, viewtab_second_euro_smallcoin_50_times_text
GuiControl, Hide, viewtab_second_euro_smallcoin_50_edit

GuiControl, Hide, viewtab_second_euro_smallcoin_20_pic
GuiControl, Hide, viewtab_second_euro_smallcoin_20_times_text
GuiControl, Hide, viewtab_second_euro_smallcoin_20_edit

GuiControl, Hide, viewtab_second_euro_smallcoin_10_pic
GuiControl, Hide, viewtab_second_euro_smallcoin_10_times_text
GuiControl, Hide, viewtab_second_euro_smallcoin_10_edit

GuiControl, Hide, viewtab_second_euro_smallcoin_5_pic
GuiControl, Hide, viewtab_second_euro_smallcoin_5_times_text
GuiControl, Hide, viewtab_second_euro_smallcoin_5_edit

GuiControl, Hide, viewtab_second_euro_smallcoin_1_pic
GuiControl, Hide, viewtab_second_euro_smallcoin_1_times_text
GuiControl, Hide, viewtab_second_euro_smallcoin_1_edit

GuiControl, Hide, viewtab_second_euro_smallcoins_sum_edit
}

GuiControl, Disable, tabs ; for anti-spamming


if (current_tab = "View") ; expand window
{
	GuiControl, Move, Tabs, % "w" window_w * 2 - distance_to_border
	
	
	WinGetPos, current_x, , , , Balance Manager ; save position of window when moving
	
	Loop, 100
	{
		current_w := current_w + 4.4
		
		current_x := current_x - (4.4 / 2)
		
		
		Gui, Show, w%current_w% x%current_x%, Balance Manager
	}
	
	GuiControl, Enable, tabs ; for anti-spamming
	
	{ ; show "viewtab" controls
	
	gosub, viewtab_currency_ddl
	
	;=================================_====================================
	
	
	GuiControl, Show, viewtab_second_currency_text
	GuiControl, Show, viewtab_second_currency_ddl
	
	GuiControl, Show, viewtab_second_date_ddl
	GuiControl, Show, viewtab_second_bank_text
	GuiControl, Show, viewtab_second_bank_edit
	GuiControl, Show, viewtab_second_kuna_text
	GuiControl, Show, viewtab_second_kuna_edit
	GuiControl, Show, viewtab_second_euro_text
	GuiControl, Show, viewtab_second_euro_edit
	GuiControl, Show, viewtab_second_store_button
	GuiControl, Show, viewtab_second_balance_edit
	GuiControl, Show, viewtab_second_notes_text
	GuiControl, Show, viewtab_second_notes_edit
	
	}

}
else if (current_w > 440) ; reduce window
{	
	WinGetPos, current_x, , , , Balance Manager ; save position of window when moving
	
	Loop, 100
	{
		current_w := current_w - 4.4
		
		current_x := current_x + (4.4 / 2)
		
		
		Gui, Show, w%current_w% x%current_x%, Balance Manager
	}
	
	if (current_x > A_ScreenWidth) ; in case the windows is outside of its width, center it
	{
		current_x := (A_ScreenWidth / 2) - (current_w / 2)
		Gui, Show, x%current_x%, Balance Manager
	}
	
	GuiControl, Move, Tabs, % "w" window_w - distance_to_border
}


GuiControl, Enable, tabs ; for anti-spamming


if current_tab = Input ; focus controls for easy insta TAB use
	GuiControl, Focus, inputtab_kuna_bill_200_edit

else if current_tab = View
	GuiControl, Focus, viewtab_print_button
	
else if current_tab = Edit
	GuiControl, Focus, edittab_date_ddl


}
return


viable_dates: ; adds dates for viewing
{
date_array := [] ; empties for new dates

GuiControl, , viewtab_first_date_ddl, | ; clear control for new dates
GuiControl, , viewtab_second_date_ddl, | ; clear control for new dates

GuiControl, , edittab_date_ddl, | ; clear control for new dates


Loop, Read, %A_ScriptDir%\Records\Records.txt

	If (A_LoopReadLine) and not (InStr(A_LoopReadLine, "Date:"))
		date_array.Push("Date: " . SubStr(A_LoopReadLine, 1, 10))



reverse_counter := date_array.Length() ; so i can read the latest record first

Loop, % date_array.Length()
{
	GuiControl, , viewtab_first_date_ddl, % date_array[reverse_counter] ; adds dates in reverse order
	GuiControl, , viewtab_second_date_ddl, % date_array[reverse_counter] ; adds dates in reverse order
	
	GuiControl, , edittab_date_ddl, % date_array[reverse_counter] ; adds dates in reverse order
	
	reverse_counter--
}

}
return


GuiClose: ; create copy of "%A_ScriptDir%\Records\Records.txt" file and exit
{
FileRead, file_text, %A_ScriptDir%\Records\Records.txt

If FileExist("Records\Records - Copy.txt")
	FileDelete, %A_ScriptDir%\Records\Records - Copy.txt

FileAppend, % file_text, %A_ScriptDir%\Records\Records - Copy.txt


ExitApp
}
return

;=================================_====================================
;============================ Input Tab ===============================
;=================================_====================================

inputtab_autoupdate: ; autoupdates every control in "inputtab"
{
Gui, Submit, NoHide

;=================================_====================================
;========================== Autocalculate =============================

; autocalculate "bills" kuna
if (inputtab_kuna_bill_200_edit = "") or (inputtab_kuna_bill_200_edit = "00")
	inputtab_kuna_bill_200_edit := 0

if (inputtab_kuna_bill_100_edit = "") or (inputtab_kuna_bill_100_edit = "00")
	inputtab_kuna_bill_100_edit := 0

if (inputtab_kuna_bill_50_edit = "") or (inputtab_kuna_bill_50_edit = "00")
	inputtab_kuna_bill_50_edit := 0
	
if (inputtab_kuna_bill_20_edit = "") or (inputtab_kuna_bill_20_edit = "00")
	inputtab_kuna_bill_20_edit := 0
	
if (inputtab_kuna_bill_10_edit = "") or (inputtab_kuna_bill_10_edit = "00")
	inputtab_kuna_bill_10_edit := 0

if inputtab_kuna_bills_sum_edit != (%inputtab_kuna_bill_200_edit% * 200) + (%inputtab_kuna_bill_100_edit% * 100) + (%inputtab_kuna_bill_50_edit% * 50) + (%inputtab_kuna_bill_20_edit% * 20) + (%inputtab_kuna_bill_10_edit% * 10)
	GuiControl, Text, inputtab_kuna_bills_sum_edit, % Format("{1:0.2f}", (inputtab_kuna_bill_200_edit * 200) + (inputtab_kuna_bill_100_edit * 100) + (inputtab_kuna_bill_50_edit * 50) + (inputtab_kuna_bill_20_edit * 20) + (inputtab_kuna_bill_10_edit * 10))
	
;=================================_====================================
	
; autocalculate "bigcoins" kuna
if (inputtab_kuna_bigcoin_5_edit = "") or (inputtab_kuna_bigcoin_5_edit = "00")
	inputtab_kuna_bigcoin_5_edit := 0

if (inputtab_kuna_bigcoin_2_edit = "") or (inputtab_kuna_bigcoin_2_edit = "00")
	inputtab_kuna_bigcoin_2_edit := 0

if (inputtab_kuna_bigcoin_1_edit = "") or (inputtab_kuna_bigcoin_1_edit = "00")
	inputtab_kuna_bigcoin_1_edit := 0

if inputtab_kuna_bigcoins_sum_edit != (%inputtab_kuna_bigcoin_5_edit% * 5) + (%inputtab_kuna_bigcoin_2_edit% * 100) + (%inputtab_kuna_bigcoin_1_edit% * 1)
	GuiControl, Text, inputtab_kuna_bigcoins_sum_edit, % Format("{1:0.2f}", (inputtab_kuna_bigcoin_5_edit * 5) + (inputtab_kuna_bigcoin_2_edit * 2) + (inputtab_kuna_bigcoin_1_edit * 1))

;=================================_====================================

; autocalculate "smallcoins" kuna
if (inputtab_kuna_smallcoin_50_edit = "") or (inputtab_kuna_smallcoin_50_edit = "00")
	inputtab_kuna_smallcoin_50_edit := 0

if (inputtab_kuna_smallcoin_20_edit = "") or (inputtab_kuna_smallcoin_20_edit = "00")
	inputtab_kuna_smallcoin_20_edit := 0

if (inputtab_kuna_smallcoin_10_edit = "") or (inputtab_kuna_smallcoin_10_edit = "00")
	inputtab_kuna_smallcoin_10_edit := 0

if (inputtab_kuna_smallcoin_5_edit = "") or (inputtab_kuna_smallcoin_5_edit = "00")
	inputtab_kuna_smallcoin_5_edit := 0

if (inputtab_kuna_smallcoin_1_edit = "") or (inputtab_kuna_smallcoin_1_edit = "00")
	inputtab_kuna_smallcoin_1_edit := 0

if inputtab_kuna_smallcoins_sum_edit != (%inputtab_kuna_smallcoin_50_edit% * 0.5) + (%inputtab_kuna_smallcoin_20_edit% * 0.2) + (%inputtab_kuna_smallcoin_10_edit% * 0.1) + (%inputtab_kuna_smallcoin_5_edit% * 0.5) + (%inputtab_kuna_smallcoin_1_edit% * 0.01)
	GuiControl, Text, inputtab_kuna_smallcoins_sum_edit, % Format("{1:0.2f}", (inputtab_kuna_smallcoin_50_edit * 0.5) + (inputtab_kuna_smallcoin_20_edit * 0.2) + (inputtab_kuna_smallcoin_10_edit * 0.1) + (inputtab_kuna_smallcoin_5_edit * 0.05) + (inputtab_kuna_smallcoin_1_edit * 0.01))

;=================================_====================================

if (inputtab_bank_edit = "")
	inputtab_bank_edit := 0


; autocalculate total kuna
if inputtab_kuna_edit != ((%inputtab_kuna_bill_200_edit% * 200) + (%inputtab_kuna_bill_100_edit% * 100) + (%inputtab_kuna_bill_50_edit% * 50) + (%inputtab_kuna_bill_20_edit% * 20) + (%inputtab_kuna_bill_10_edit% * 10) + (%inputtab_kuna_bigcoin_5_edit% * 5) + (%inputtab_kuna_bigcoin_2_edit% * 100) + (%inputtab_kuna_bigcoin_1_edit% * 1) + (%inputtab_kuna_smallcoin_50_edit% * 0.5) + (%inputtab_kuna_smallcoin_20_edit% * 0.2) + (%inputtab_kuna_smallcoin_10_edit% * 0.1) + (%inputtab_kuna_smallcoin_5_edit% * 0.5) + (%inputtab_kuna_smallcoin_1_edit% * 0.01) + inputtab_bank_edit)
	GuiControl, Text, inputtab_kuna_edit, % Format("{1:0.2f}", (inputtab_kuna_bill_200_edit * 200) + (inputtab_kuna_bill_100_edit * 100) + (inputtab_kuna_bill_50_edit * 50) + (inputtab_kuna_bill_20_edit * 20) + (inputtab_kuna_bill_10_edit * 10) + (inputtab_kuna_bigcoin_5_edit * 5) + (inputtab_kuna_bigcoin_2_edit * 2) + (inputtab_kuna_bigcoin_1_edit * 1) + (inputtab_kuna_smallcoin_50_edit * 0.5) + (inputtab_kuna_smallcoin_20_edit * 0.2) + (inputtab_kuna_smallcoin_10_edit * 0.1) + (inputtab_kuna_smallcoin_5_edit * 0.05) + (inputtab_kuna_smallcoin_1_edit * 0.01) + inputtab_bank_edit)



;=================================_====================================
;====================== Max amount of currency ========================

; amount of 1 type of currency caped to 99
if (inputtab_kuna_bill_200_edit > 99) or (StrLen(inputtab_kuna_bill_200_edit) > 2)
	GuiControl, Text, inputtab_kuna_bill_200_edit, 99

else if (inputtab_kuna_bill_100_edit > 99) or (StrLen(inputtab_kuna_bill_100_edit) > 2)
	GuiControl, Text, inputtab_kuna_bill_100_edit, 99

else if (inputtab_kuna_bill_50_edit > 99) or (StrLen(inputtab_kuna_bill_50_edit) > 2)
	GuiControl, Text, inputtab_kuna_bill_50_edit, 99

else if (inputtab_kuna_bill_20_edit > 99) or (StrLen(inputtab_kuna_bill_20_edit) > 2)
	GuiControl, Text, inputtab_kuna_bill_20_edit, 99

else if (inputtab_kuna_bill_10_edit > 99) or (StrLen(inputtab_kuna_bill_10_edit) > 2)
	GuiControl, Text, inputtab_kuna_bill_10_edit, 99

;=================================_====================================

else if (inputtab_kuna_bigcoin_5_edit > 99) or (StrLen(inputtab_kuna_bigcoin_5_edit) > 2)
	GuiControl, Text, inputtab_kuna_bigcoin_5_edit, 99

else if (inputtab_kuna_bigcoin_2_edit > 99) or (StrLen(inputtab_kuna_bigcoin_2_edit) > 2)
	GuiControl, Text, inputtab_kuna_bigcoin_2_edit, 99

else if (inputtab_kuna_bigcoin_1_edit > 99) or (StrLen(inputtab_kuna_bigcoin_1_edit) > 2)
	GuiControl, Text, inputtab_kuna_bigcoin_1_edit, 99

;=================================_====================================

else if (inputtab_kuna_smallcoin_50_edit > 99) or (StrLen(inputtab_kuna_smallcoin_50_edit) > 2)
	GuiControl, Text, inputtab_kuna_smallcoin_50_edit, 99

else if (inputtab_kuna_smallcoin_20_edit > 99) or (StrLen(inputtab_kuna_smallcoin_20_edit) > 2)
	GuiControl, Text, inputtab_kuna_smallcoin_20_edit, 99

else if (inputtab_kuna_smallcoin_10_edit > 99) or (StrLen(inputtab_kuna_smallcoin_10_edit) > 2)
	GuiControl, Text, inputtab_kuna_smallcoin_10_edit, 99

else if (inputtab_kuna_smallcoin_5_edit > 99) or (StrLen(inputtab_kuna_smallcoin_5_edit) > 2)
	GuiControl, Text, inputtab_kuna_smallcoin_5_edit, 99

else if (inputtab_kuna_smallcoin_1_edit > 99) or (StrLen(inputtab_kuna_smallcoin_1_edit) > 2)
	GuiControl, Text, inputtab_kuna_smallcoin_1_edit, 99

;=================================_====================================

else if (inputtab_bank_edit >= 100000) or (StrLen(inputtab_bank_edit) > 8)
	GuiControl, Text, inputtab_bank_edit, 99999.99


;=================================_====================================
;============================== Euro ==================================
;=================================_====================================


;=================================_====================================
;========================== Autocalculate =============================

; autocalculate "bills" euro
if (inputtab_euro_bill_100_edit = "") or (inputtab_euro_bill_100_edit = "00")
	inputtab_euro_bill_100_edit := 0

if (inputtab_euro_bill_50_edit = "") or (inputtab_euro_bill_50_edit = "00")
	inputtab_euro_bill_50_edit := 0

if (inputtab_euro_bill_20_edit = "") or (inputtab_euro_bill_20_edit = "00")
	inputtab_euro_bill_20_edit := 0
	
if (inputtab_euro_bill_10_edit = "") or (inputtab_euro_bill_10_edit = "00")
	inputtab_euro_bill_10_edit := 0
	
if (inputtab_euro_bill_5_edit = "") or (inputtab_euro_bill_5_edit = "00")
	inputtab_euro_bill_5_edit := 0

if inputtab_euro_bills_sum_edit != (%inputtab_euro_bill_100_edit% * 100) + (%inputtab_euro_bill_50_edit% * 50) + (%inputtab_euro_bill_20_edit% * 20) + (%inputtab_euro_bill_10_edit% * 10) + (%inputtab_euro_bill_5_edit% * 5)
	GuiControl, Text, inputtab_euro_bills_sum_edit, % Format("{1:0.2f}", (inputtab_euro_bill_100_edit * 100) + (inputtab_euro_bill_50_edit * 50) + (inputtab_euro_bill_20_edit * 20) + (inputtab_euro_bill_10_edit * 10) + (inputtab_euro_bill_5_edit * 5))
	
;=================================_====================================
	
; autocalculate "bigcoins" euro
if (inputtab_euro_bigcoin_2_edit = "") or (inputtab_euro_bigcoin_2_edit = "00")
	inputtab_euro_bigcoin_2_edit := 0

if (inputtab_euro_bigcoin_1_edit = "") or (inputtab_euro_bigcoin_1_edit = "00")
	inputtab_euro_bigcoin_1_edit := 0

if inputtab_euro_bigcoins_sum_edit != (%inputtab_euro_bigcoin_2_edit% * 100) + (%inputtab_euro_bigcoin_1_edit% * 1)
	GuiControl, Text, inputtab_euro_bigcoins_sum_edit, % Format("{1:0.2f}", (inputtab_euro_bigcoin_2_edit * 2) + (inputtab_euro_bigcoin_1_edit * 1))

;=================================_====================================

; autocalculate "smallcoins" euro
if (inputtab_euro_smallcoin_50_edit = "") or (inputtab_euro_smallcoin_50_edit = "00")
	inputtab_euro_smallcoin_50_edit := 0

if (inputtab_euro_smallcoin_20_edit = "") or (inputtab_euro_smallcoin_20_edit = "00")
	inputtab_euro_smallcoin_20_edit := 0

if (inputtab_euro_smallcoin_10_edit = "") or (inputtab_euro_smallcoin_10_edit = "00")
	inputtab_euro_smallcoin_10_edit := 0

if (inputtab_euro_smallcoin_5_edit = "") or (inputtab_euro_smallcoin_5_edit = "00")
	inputtab_euro_smallcoin_5_edit := 0

if (inputtab_euro_smallcoin_1_edit = "") or (inputtab_euro_smallcoin_1_edit = "00")
	inputtab_euro_smallcoin_1_edit := 0

if inputtab_euro_smallcoins_sum_edit != (%inputtab_euro_smallcoin_50_edit% * 0.5) + (%inputtab_euro_smallcoin_20_edit% * 0.2) + (%inputtab_euro_smallcoin_10_edit% * 0.1) + (%inputtab_euro_smallcoin_5_edit% * 0.5) + (%inputtab_euro_smallcoin_1_edit% * 0.01)
	GuiControl, Text, inputtab_euro_smallcoins_sum_edit, % Format("{1:0.2f}", (inputtab_euro_smallcoin_50_edit * 0.5) + (inputtab_euro_smallcoin_20_edit * 0.2) + (inputtab_euro_smallcoin_10_edit * 0.1) + (inputtab_euro_smallcoin_5_edit * 0.05) + (inputtab_euro_smallcoin_1_edit * 0.01))

;=================================_====================================

; autocalculate total euro
if inputtab_euro_edit != ((%inputtab_euro_bill_100_edit% * 100) + (%inputtab_euro_bill_50_edit% * 50) + (%inputtab_euro_bill_20_edit% * 20) + (%inputtab_euro_bill_10_edit% * 10) + (%inputtab_euro_bill_5_edit% * 5) + (%inputtab_euro_bigcoin_2_edit% * 100) + (%inputtab_euro_bigcoin_1_edit% * 1) + (%inputtab_euro_smallcoin_50_edit% * 0.5) + (%inputtab_euro_smallcoin_20_edit% * 0.2) + (%inputtab_euro_smallcoin_10_edit% * 0.1) + (%inputtab_euro_smallcoin_5_edit% * 0.5) + (%inputtab_euro_smallcoin_1_edit% * 0.01))
	GuiControl, Text, inputtab_euro_edit, % Format("{1:0.2f}", (inputtab_euro_bill_100_edit * 100) + (inputtab_euro_bill_50_edit * 50) + (inputtab_euro_bill_20_edit * 20) + (inputtab_euro_bill_10_edit * 10) + (inputtab_euro_bill_5_edit * 5) + (inputtab_euro_bigcoin_2_edit * 2) + (inputtab_euro_bigcoin_1_edit * 1) + (inputtab_euro_smallcoin_50_edit * 0.5) + (inputtab_euro_smallcoin_20_edit * 0.2) + (inputtab_euro_smallcoin_10_edit * 0.1) + (inputtab_euro_smallcoin_5_edit * 0.05) + (inputtab_euro_smallcoin_1_edit * 0.01))



;=================================_====================================
;====================== Max amount of currency ========================

; amount of 1 type of currency caped to 99
if (inputtab_euro_bill_100_edit > 99) or (StrLen(inputtab_euro_bill_100_edit) > 2)
	GuiControl, Text, inputtab_euro_bill_100_edit, 99

else if (inputtab_euro_bill_50_edit > 99) or (StrLen(inputtab_euro_bill_50_edit) > 2)
	GuiControl, Text, inputtab_euro_bill_50_edit, 99

else if (inputtab_euro_bill_20_edit > 99) or (StrLen(inputtab_euro_bill_20_edit) > 2)
	GuiControl, Text, inputtab_euro_bill_20_edit, 99

else if (inputtab_euro_bill_10_edit > 99) or (StrLen(inputtab_euro_bill_10_edit) > 2)
	GuiControl, Text, inputtab_euro_bill_10_edit, 99

else if (inputtab_euro_bill_5_edit > 99) or (StrLen(inputtab_euro_bill_5_edit) > 2)
	GuiControl, Text, inputtab_euro_bill_5_edit, 99

;=================================_====================================

else if (inputtab_euro_bigcoin_2_edit > 99) or (StrLen(inputtab_euro_bigcoin_2_edit) > 2)
	GuiControl, Text, inputtab_euro_bigcoin_2_edit, 99

else if (inputtab_euro_bigcoin_1_edit > 99) or (StrLen(inputtab_euro_bigcoin_1_edit) > 2)
	GuiControl, Text, inputtab_euro_bigcoin_1_edit, 99

;=================================_====================================

else if (inputtab_euro_smallcoin_50_edit > 99) or (StrLen(inputtab_euro_smallcoin_50_edit) > 2)
	GuiControl, Text, inputtab_euro_smallcoin_50_edit, 99

else if (inputtab_euro_smallcoin_20_edit > 99) or (StrLen(inputtab_euro_smallcoin_20_edit) > 2)
	GuiControl, Text, inputtab_euro_smallcoin_20_edit, 99

else if (inputtab_euro_smallcoin_10_edit > 99) or (StrLen(inputtab_euro_smallcoin_10_edit) > 2)
	GuiControl, Text, inputtab_euro_smallcoin_10_edit, 99

else if (inputtab_euro_smallcoin_5_edit > 99) or (StrLen(inputtab_euro_smallcoin_5_edit) > 2)
	GuiControl, Text, inputtab_euro_smallcoin_5_edit, 99

else if (inputtab_euro_smallcoin_1_edit > 99) or (StrLen(inputtab_euro_smallcoin_1_edit) > 2)
	GuiControl, Text, inputtab_euro_smallcoin_1_edit, 99



;=================================_====================================
;========================== Total balance =============================
;=================================_====================================

if inputtab_balance_edit != ((%inputtab_kuna_bill_200_edit% * 200) + (%inputtab_kuna_bill_100_edit% * 100) + (%inputtab_kuna_bill_50_edit% * 50) + (%inputtab_kuna_bill_20_edit% * 20) + (%inputtab_kuna_bill_10_edit% * 10) + (%inputtab_kuna_bigcoin_5_edit% * 5) + (%inputtab_kuna_bigcoin_2_edit% * 100) + (%inputtab_kuna_bigcoin_1_edit% * 1) + (%inputtab_kuna_smallcoin_50_edit% * 0.5) + (%inputtab_kuna_smallcoin_20_edit% * 0.2) + (%inputtab_kuna_smallcoin_10_edit% * 0.1) + (%inputtab_kuna_smallcoin_5_edit% * 0.5) + (%inputtab_kuna_smallcoin_1_edit% * 0.01) + inputtab_bank_edit)	+	((%inputtab_euro_bill_100_edit% * 100) + (%inputtab_euro_bill_50_edit% * 50) + (%inputtab_euro_bill_20_edit% * 20) + (%inputtab_euro_bill_10_edit% * 10) + (%inputtab_euro_bill_5_edit% * 5) + (%inputtab_euro_bigcoin_2_edit% * 100) + (%inputtab_euro_bigcoin_1_edit% * 1) + (%inputtab_euro_smallcoin_50_edit% * 0.5) + (%inputtab_euro_smallcoin_20_edit% * 0.2) + (%inputtab_euro_smallcoin_10_edit% * 0.1) + (%inputtab_euro_smallcoin_5_edit% * 0.5) + (%inputtab_euro_smallcoin_1_edit% * 0.01)) * %euro_to_kuna_conversion_rate%
	GuiControl, Text, inputtab_balance_edit, % Format("{1:0.2f}", ((inputtab_kuna_bill_200_edit * 200) + (inputtab_kuna_bill_100_edit * 100) + (inputtab_kuna_bill_50_edit * 50) + (inputtab_kuna_bill_20_edit * 20) + (inputtab_kuna_bill_10_edit * 10) + (inputtab_kuna_bigcoin_5_edit * 5) + (inputtab_kuna_bigcoin_2_edit * 2) + (inputtab_kuna_bigcoin_1_edit * 1) + (inputtab_kuna_smallcoin_50_edit * 0.5) + (inputtab_kuna_smallcoin_20_edit * 0.2) + (inputtab_kuna_smallcoin_10_edit * 0.1) + (inputtab_kuna_smallcoin_5_edit * 0.05) + (inputtab_kuna_smallcoin_1_edit * 0.01) + inputtab_bank_edit)	+	((inputtab_euro_bill_100_edit * 100) + (inputtab_euro_bill_50_edit * 50) + (inputtab_euro_bill_20_edit * 20) + (inputtab_euro_bill_10_edit * 10) + (inputtab_euro_bill_5_edit * 5) + (inputtab_euro_bigcoin_2_edit * 2) + (inputtab_euro_bigcoin_1_edit * 1) + (inputtab_euro_smallcoin_50_edit * 0.5) + (inputtab_euro_smallcoin_20_edit * 0.2) + (inputtab_euro_smallcoin_10_edit * 0.1) + (inputtab_euro_smallcoin_5_edit * 0.05) + (inputtab_euro_smallcoin_1_edit * 0.01)) * euro_to_kuna_conversion_rate)

}
return


inputtab_currency_ddl: ; changes currency
{
GuiControlGet, inputtab_currency_ddl_option, , inputtab_currency_ddl

GuiControl, Disable, inputtab_currency_ddl ; for spamming

if (inputtab_currency_ddl_option = "Euro")
{
	GuiControl, Hide, inputtab_kuna_bill_200_pic
	GuiControl, Hide, inputtab_kuna_bill_200_times_text
	GuiControl, Hide, inputtab_kuna_bill_200_edit

	GuiControl, Hide, inputtab_kuna_bill_100_pic
	GuiControl, Hide, inputtab_kuna_bill_100_times_text
	GuiControl, Hide, inputtab_kuna_bill_100_edit

	GuiControl, Hide, inputtab_kuna_bill_50_pic
	GuiControl, Hide, inputtab_kuna_bill_50_times_text
	GuiControl, Hide, inputtab_kuna_bill_50_edit

	GuiControl, Hide, inputtab_kuna_bill_20_pic
	GuiControl, Hide, inputtab_kuna_bill_20_times_text
	GuiControl, Hide, inputtab_kuna_bill_20_edit

	GuiControl, Hide, inputtab_kuna_bill_10_pic
	GuiControl, Hide, inputtab_kuna_bill_10_times_text
	GuiControl, Hide, inputtab_kuna_bill_10_edit

	GuiControl, Hide, inputtab_kuna_bills_sum_edit


	GuiControl, Hide, inputtab_kuna_bigcoin_5_pic
	GuiControl, Hide, inputtab_kuna_bigcoin_5_times_text
	GuiControl, Hide, inputtab_kuna_bigcoin_5_edit

	GuiControl, Hide, inputtab_kuna_bigcoin_2_pic
	GuiControl, Hide, inputtab_kuna_bigcoin_2_times_text
	GuiControl, Hide, inputtab_kuna_bigcoin_2_edit

	GuiControl, Hide, inputtab_kuna_bigcoin_1_pic
	GuiControl, Hide, inputtab_kuna_bigcoin_1_times_text
	GuiControl, Hide, inputtab_kuna_bigcoin_1_edit

	GuiControl, Hide, inputtab_kuna_bigcoins_sum_edit


	GuiControl, Hide, inputtab_kuna_smallcoin_50_pic
	GuiControl, Hide, inputtab_kuna_smallcoin_50_times_text
	GuiControl, Hide, inputtab_kuna_smallcoin_50_edit

	GuiControl, Hide, inputtab_kuna_smallcoin_20_pic
	GuiControl, Hide, inputtab_kuna_smallcoin_20_times_text
	GuiControl, Hide, inputtab_kuna_smallcoin_20_edit

	GuiControl, Hide, inputtab_kuna_smallcoin_10_pic
	GuiControl, Hide, inputtab_kuna_smallcoin_10_times_text
	GuiControl, Hide, inputtab_kuna_smallcoin_10_edit

	GuiControl, Hide, inputtab_kuna_smallcoin_5_pic
	GuiControl, Hide, inputtab_kuna_smallcoin_5_times_text
	GuiControl, Hide, inputtab_kuna_smallcoin_5_edit

	GuiControl, Hide, inputtab_kuna_smallcoin_1_pic
	GuiControl, Hide, inputtab_kuna_smallcoin_1_times_text
	GuiControl, Hide, inputtab_kuna_smallcoin_1_edit

	GuiControl, Hide, inputtab_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Show, inputtab_euro_bill_100_pic
	GuiControl, Show, inputtab_euro_bill_100_times_text
	GuiControl, Show, inputtab_euro_bill_100_edit

	GuiControl, Show, inputtab_euro_bill_50_pic
	GuiControl, Show, inputtab_euro_bill_50_times_text
	GuiControl, Show, inputtab_euro_bill_50_edit

	GuiControl, Show, inputtab_euro_bill_20_pic
	GuiControl, Show, inputtab_euro_bill_20_times_text
	GuiControl, Show, inputtab_euro_bill_20_edit

	GuiControl, Show, inputtab_euro_bill_10_pic
	GuiControl, Show, inputtab_euro_bill_10_times_text
	GuiControl, Show, inputtab_euro_bill_10_edit

	GuiControl, Show, inputtab_euro_bill_5_pic
	GuiControl, Show, inputtab_euro_bill_5_times_text
	GuiControl, Show, inputtab_euro_bill_5_edit

	GuiControl, Show, inputtab_euro_bills_sum_edit


	GuiControl, Show, inputtab_euro_bigcoin_2_pic
	GuiControl, Show, inputtab_euro_bigcoin_2_times_text
	GuiControl, Show, inputtab_euro_bigcoin_2_edit

	GuiControl, Show, inputtab_euro_bigcoin_1_pic
	GuiControl, Show, inputtab_euro_bigcoin_1_times_text
	GuiControl, Show, inputtab_euro_bigcoin_1_edit

	GuiControl, Show, inputtab_euro_bigcoins_sum_edit


	GuiControl, Show, inputtab_euro_smallcoin_50_pic
	GuiControl, Show, inputtab_euro_smallcoin_50_times_text
	GuiControl, Show, inputtab_euro_smallcoin_50_edit

	GuiControl, Show, inputtab_euro_smallcoin_20_pic
	GuiControl, Show, inputtab_euro_smallcoin_20_times_text
	GuiControl, Show, inputtab_euro_smallcoin_20_edit

	GuiControl, Show, inputtab_euro_smallcoin_10_pic
	GuiControl, Show, inputtab_euro_smallcoin_10_times_text
	GuiControl, Show, inputtab_euro_smallcoin_10_edit

	GuiControl, Show, inputtab_euro_smallcoin_5_pic
	GuiControl, Show, inputtab_euro_smallcoin_5_times_text
	GuiControl, Show, inputtab_euro_smallcoin_5_edit

	GuiControl, Show, inputtab_euro_smallcoin_1_pic
	GuiControl, Show, inputtab_euro_smallcoin_1_times_text
	GuiControl, Show, inputtab_euro_smallcoin_1_edit

	GuiControl, Show, inputtab_euro_smallcoins_sum_edit
}
else if (inputtab_currency_ddl_option = "Kuna")
{
	GuiControl, Show, inputtab_kuna_bill_200_pic
	GuiControl, Show, inputtab_kuna_bill_200_times_text
	GuiControl, Show, inputtab_kuna_bill_200_edit

	GuiControl, Show, inputtab_kuna_bill_100_pic
	GuiControl, Show, inputtab_kuna_bill_100_times_text
	GuiControl, Show, inputtab_kuna_bill_100_edit

	GuiControl, Show, inputtab_kuna_bill_50_pic
	GuiControl, Show, inputtab_kuna_bill_50_times_text
	GuiControl, Show, inputtab_kuna_bill_50_edit

	GuiControl, Show, inputtab_kuna_bill_20_pic
	GuiControl, Show, inputtab_kuna_bill_20_times_text
	GuiControl, Show, inputtab_kuna_bill_20_edit

	GuiControl, Show, inputtab_kuna_bill_10_pic
	GuiControl, Show, inputtab_kuna_bill_10_times_text
	GuiControl, Show, inputtab_kuna_bill_10_edit

	GuiControl, Show, inputtab_kuna_bills_sum_edit


	GuiControl, Show, inputtab_kuna_bigcoin_5_pic
	GuiControl, Show, inputtab_kuna_bigcoin_5_times_text
	GuiControl, Show, inputtab_kuna_bigcoin_5_edit

	GuiControl, Show, inputtab_kuna_bigcoin_2_pic
	GuiControl, Show, inputtab_kuna_bigcoin_2_times_text
	GuiControl, Show, inputtab_kuna_bigcoin_2_edit

	GuiControl, Show, inputtab_kuna_bigcoin_1_pic
	GuiControl, Show, inputtab_kuna_bigcoin_1_times_text
	GuiControl, Show, inputtab_kuna_bigcoin_1_edit

	GuiControl, Show, inputtab_kuna_bigcoins_sum_edit


	GuiControl, Show, inputtab_kuna_smallcoin_50_pic
	GuiControl, Show, inputtab_kuna_smallcoin_50_times_text
	GuiControl, Show, inputtab_kuna_smallcoin_50_edit

	GuiControl, Show, inputtab_kuna_smallcoin_20_pic
	GuiControl, Show, inputtab_kuna_smallcoin_20_times_text
	GuiControl, Show, inputtab_kuna_smallcoin_20_edit

	GuiControl, Show, inputtab_kuna_smallcoin_10_pic
	GuiControl, Show, inputtab_kuna_smallcoin_10_times_text
	GuiControl, Show, inputtab_kuna_smallcoin_10_edit

	GuiControl, Show, inputtab_kuna_smallcoin_5_pic
	GuiControl, Show, inputtab_kuna_smallcoin_5_times_text
	GuiControl, Show, inputtab_kuna_smallcoin_5_edit

	GuiControl, Show, inputtab_kuna_smallcoin_1_pic
	GuiControl, Show, inputtab_kuna_smallcoin_1_times_text
	GuiControl, Show, inputtab_kuna_smallcoin_1_edit

	GuiControl, Show, inputtab_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Hide, inputtab_euro_bill_100_pic
	GuiControl, Hide, inputtab_euro_bill_100_times_text
	GuiControl, Hide, inputtab_euro_bill_100_edit

	GuiControl, Hide, inputtab_euro_bill_50_pic
	GuiControl, Hide, inputtab_euro_bill_50_times_text
	GuiControl, Hide, inputtab_euro_bill_50_edit

	GuiControl, Hide, inputtab_euro_bill_20_pic
	GuiControl, Hide, inputtab_euro_bill_20_times_text
	GuiControl, Hide, inputtab_euro_bill_20_edit

	GuiControl, Hide, inputtab_euro_bill_10_pic
	GuiControl, Hide, inputtab_euro_bill_10_times_text
	GuiControl, Hide, inputtab_euro_bill_10_edit

	GuiControl, Hide, inputtab_euro_bill_5_pic
	GuiControl, Hide, inputtab_euro_bill_5_times_text
	GuiControl, Hide, inputtab_euro_bill_5_edit

	GuiControl, Hide, inputtab_euro_bills_sum_edit


	GuiControl, Hide, inputtab_euro_bigcoin_2_pic
	GuiControl, Hide, inputtab_euro_bigcoin_2_times_text
	GuiControl, Hide, inputtab_euro_bigcoin_2_edit

	GuiControl, Hide, inputtab_euro_bigcoin_1_pic
	GuiControl, Hide, inputtab_euro_bigcoin_1_times_text
	GuiControl, Hide, inputtab_euro_bigcoin_1_edit

	GuiControl, Hide, inputtab_euro_bigcoins_sum_edit


	GuiControl, Hide, inputtab_euro_smallcoin_50_pic
	GuiControl, Hide, inputtab_euro_smallcoin_50_times_text
	GuiControl, Hide, inputtab_euro_smallcoin_50_edit

	GuiControl, Hide, inputtab_euro_smallcoin_20_pic
	GuiControl, Hide, inputtab_euro_smallcoin_20_times_text
	GuiControl, Hide, inputtab_euro_smallcoin_20_edit

	GuiControl, Hide, inputtab_euro_smallcoin_10_pic
	GuiControl, Hide, inputtab_euro_smallcoin_10_times_text
	GuiControl, Hide, inputtab_euro_smallcoin_10_edit

	GuiControl, Hide, inputtab_euro_smallcoin_5_pic
	GuiControl, Hide, inputtab_euro_smallcoin_5_times_text
	GuiControl, Hide, inputtab_euro_smallcoin_5_edit

	GuiControl, Hide, inputtab_euro_smallcoin_1_pic
	GuiControl, Hide, inputtab_euro_smallcoin_1_times_text
	GuiControl, Hide, inputtab_euro_smallcoin_1_edit

	GuiControl, Hide, inputtab_euro_smallcoins_sum_edit
}

GuiControl, Enable, inputtab_currency_ddl ; for spamming

}
return


inputtab_store_information: ; stores the balance in the "%A_ScriptDir%\Records\Records.txt" file, clears "inputtab"
{
gosub, inputtab_autoupdate ; needed cause something does Gui, Submit


GuiControlGet, date, , calendar ; yyyyMMddHHmmss


Loop, % date_array.Length() ; check every date
	if InStr(date_array[A_Index], SubStr(date, 7, 2) . "/" . SubStr(date, 5, 2) . "/" . SubStr(date, 1, 4)) ; if date already input
	{
		MsgBox, 8208, Pre-existing Date, The date you have entered`nwas already input.
		
		GuiControl, Choose, tabs, View ; opens view tab
		gosub, tabs
		
		GuiControl, Choose, viewtab_first_date_ddl, % date_array[A_Index] ; autochooses date for view tab
		gosub, viewtab_first_chosen_date
		
		return ; stops the information input
	}
	

if !FileExist("Records\Records.txt")
	FileAppend, `nDate:        Balance:      Kuna:      Euro:     Bank:   Kuna:  Novèanice:  Kovanice:  Lipe:  200:  100:  50:  20:  10:  5:  2:  1:  0.50:  0.20:  0.10:  0.05:  0.01:   Euro:  Novèanice:  Kovanice:  Centi:  100:  50:  20:  10:  5:  2:  1:  0.50:  0.20:  0.10:  0.05:  0.01:  Note:`n, %A_ScriptDir%\Records\Records.txt


current_string := ""
	
Loop, 37
{
	if A_Index = 1
	{
		pos := 10
		
		control_string := SubStr(date, 7, 2) . "/" . SubStr(date, 5, 2) . "/" . SubStr(date, 1, 4)
	}
	else if A_Index = 2
	{
		pos := 21
		
		control_string := inputtab_balance_edit
	}			
	else if A_Index = 3
	{
		pos := 32
		
		control_string := inputtab_kuna_edit
	}			
	else if A_Index = 4
	{
		pos := 43
		
		control_string := inputtab_euro_edit
	}			
	else if A_Index = 5
	{
		pos := 53
		
		control_string := inputtab_bank_edit
	}			
	else if A_Index = 6
	{
		pos := 73
		
		control_string := inputtab_kuna_bills_sum_edit
	}				
	else if A_Index = 7
	{
		pos := 84
		
		control_string := inputtab_kuna_bigcoins_sum_edit
	}			
	else if A_Index = 8
	{
		pos := 91
		
		control_string := inputtab_kuna_smallcoins_sum_edit
	}			
	else if A_Index = 9
	{
		pos := 97
		
		control_string := inputtab_kuna_bill_200_edit
	}			
	else if A_Index = 10
	{
		pos := 103
		
		control_string := inputtab_kuna_bill_100_edit
	}			
	else if A_Index = 11
	{
		pos := 108
		
		control_string := inputtab_kuna_bill_50_edit
	}			
	else if A_Index = 12
	{
		pos := 113
		
		control_string := inputtab_kuna_bill_20_edit
	}
	else if A_Index = 13
	{
		pos := 118
		
		control_string := inputtab_kuna_bill_10_edit
	}			
	else if A_Index = 14
	{
		pos := 122
		
		control_string := inputtab_kuna_bigcoin_5_edit
	}			
	else if A_Index = 15
	{
		pos := 126
		
		control_string := inputtab_kuna_bigcoin_2_edit
	}			
	else if A_Index = 16
	{
		pos := 130
		
		control_string := inputtab_kuna_bigcoin_1_edit
	}			
	else if A_Index = 17
	{
		pos := 137
		
		control_string := inputtab_kuna_smallcoin_50_edit
	}			
	else if A_Index = 18
	{
		pos := 144
		
		control_string := inputtab_kuna_smallcoin_20_edit
	}			
	else if A_Index = 19
	{
		pos := 151
		
		control_string := inputtab_kuna_smallcoin_10_edit
	}			
	else if A_Index = 20
	{
		pos := 158
		
		control_string := inputtab_kuna_smallcoin_5_edit
	}			
	else if A_Index = 21
	{
		pos := 165
		
		control_string := inputtab_kuna_smallcoin_1_edit
	}			
	else if A_Index = 22
	{
		pos := 185
		
		control_string := inputtab_euro_bills_sum_edit
	}			
	else if A_Index = 23
	{
		pos := 196
		
		control_string := inputtab_euro_bigcoins_sum_edit
	}			
	else if A_Index = 24
	{
		pos := 204
		
		control_string := inputtab_euro_smallcoins_sum_edit
	}			
	else if A_Index = 25
	{
		pos := 210
		
		control_string := inputtab_euro_bill_100_edit
	}			
	else if A_Index = 26
	{
		pos := 216
		
		control_string := inputtab_euro_bill_50_edit
	}			
	else if A_Index = 27
	{
		pos := 221
		
		control_string := inputtab_euro_bill_20_edit
	}			
	else if A_Index = 28
	{
		pos := 226
		
		control_string := inputtab_euro_bill_10_edit
	}			
	else if A_Index = 29
	{
		pos := 231
		
		control_string := inputtab_euro_bill_5_edit
	}			
	else if A_Index = 30
	{
		pos := 235
		
		control_string := inputtab_euro_bigcoin_2_edit
	}			
	else if A_Index = 31
	{
		pos := 239
		
		control_string := inputtab_euro_bigcoin_1_edit
	}			
	else if A_Index = 32
	{
		pos := 243
		
		control_string := inputtab_euro_smallcoin_50_edit
	}			
	else if A_Index = 33
	{
		pos := 250
		
		control_string := inputtab_euro_smallcoin_20_edit
	}			
	else if A_Index = 34
	{
		pos := 257
		
		control_string := inputtab_euro_smallcoin_10_edit
	}			
	else if A_Index = 35
	{
		pos := 264
		
		control_string := inputtab_euro_smallcoin_5_edit
	}			
	else if A_Index = 36
	{
		pos := 271
		
		control_string := inputtab_euro_smallcoin_1_edit
	}			
	else if A_Index = 37
	{
		pos := 274 + StrLen(inputtab_notes_edit) ; no max lenght on note
		
		control_string := inputtab_notes_edit
	}
	
	
	while (StrLen(current_string) + StrLen(control_string) != pos)
		current_string := current_string . A_Space
	
	if (control_string != inputtab_notes_edit)
		current_string := current_string . control_string . ","
	else if (control_string = inputtab_notes_edit)
		current_string := current_string . control_string
	
}



FileAppend, `n`n, %A_ScriptDir%\Records\Records.txt
FileAppend, %current_string%, %A_ScriptDir%\Records\Records.txt

;=================================_====================================

GuiControl, Text, inputtab_notes_edit,


GuiControl, Text, inputtab_bank_edit,


GuiControl, Text, inputtab_kuna_bill_200_edit, 
GuiControl, Text, inputtab_kuna_bill_100_edit, 
GuiControl, Text, inputtab_kuna_bill_50_edit, 
GuiControl, Text, inputtab_kuna_bill_20_edit, 
GuiControl, Text, inputtab_kuna_bill_10_edit, 

GuiControl, Text, inputtab_kuna_bills_sum_edit, 


GuiControl, Text, inputtab_kuna_bigcoin_5_edit, 
GuiControl, Text, inputtab_kuna_bigcoin_2_edit, 
GuiControl, Text, inputtab_kuna_bigcoin_1_edit, 

GuiControl, Text, inputtab_kuna_bigcoins_sum_edit, 


GuiControl, Text, inputtab_kuna_smallcoin_50_edit, 
GuiControl, Text, inputtab_kuna_smallcoin_20_edit, 
GuiControl, Text, inputtab_kuna_smallcoin_10_edit, 
GuiControl, Text, inputtab_kuna_smallcoin_5_edit, 
GuiControl, Text, inputtab_kuna_smallcoin_1_edit, 

GuiControl, Text, inputtab_kuna_smallcoins_sum_edit, 


GuiControl, Text, inputtab_euro_bill_100_edit, 
GuiControl, Text, inputtab_euro_bill_50_edit, 
GuiControl, Text, inputtab_euro_bill_20_edit, 
GuiControl, Text, inputtab_euro_bill_10_edit, 
GuiControl, Text, inputtab_euro_bill_5_edit,

GuiControl, Text, inputtab_euro_bills_sum_edit, 

 
GuiControl, Text, inputtab_euro_bigcoin_2_edit, 
GuiControl, Text, inputtab_euro_bigcoin_1_edit, 

GuiControl, Text, inputtab_euro_bigcoins_sum_edit, 


GuiControl, Text, inputtab_euro_smallcoin_50_edit, 
GuiControl, Text, inputtab_euro_smallcoin_20_edit, 
GuiControl, Text, inputtab_euro_smallcoin_10_edit, 
GuiControl, Text, inputtab_euro_smallcoin_5_edit, 
GuiControl, Text, inputtab_euro_smallcoin_1_edit, 

GuiControl, Text, inputtab_euro_smallcoins_sum_edit, 


GuiControl, Choose, inputtab_currency_ddl, Kuna
gosub, inputtab_currency_ddl

;=================================_====================================

gosub, viable_dates ; adds option to see todays input

if date_array.Length() = 1
	GuiControl, Choose, edittab_date_ddl, 1 ; chooses only input record
	
else if date_array.Length() >= 2
	GuiControl, Choose, edittab_date_ddl, 2 ; chooses last input record before this one
	

GuiControl, Choose, viewtab_first_date_ddl, 1 ; chooses first record
GuiControl, Choose, viewtab_second_date_ddl, 2 ; chooses second record


gosub, viewtab_first_chosen_date ; update gui
gosub, viewtab_second_chosen_date ; update gui

gosub, edittab_chosen_date ; update gui
}
return


;=================================_====================================
;============================= View Tab ===============================
;=================================_====================================

viewtab_currency_ddl: ; changes currency
{
	
GuiControlGet, viewtab_currency_ddl_option, , viewtab_second_currency_ddl

GuiControl, Disable, viewtab_second_currency_ddl ; for spamming

if (viewtab_currency_ddl_option = "Euro")
{
	GuiControl, Hide, viewtab_first_kuna_bill_200_pic
	GuiControl, Hide, viewtab_first_kuna_bill_200_times_text
	GuiControl, Hide, viewtab_first_kuna_bill_200_edit

	GuiControl, Hide, viewtab_first_kuna_bill_100_pic
	GuiControl, Hide, viewtab_first_kuna_bill_100_times_text
	GuiControl, Hide, viewtab_first_kuna_bill_100_edit

	GuiControl, Hide, viewtab_first_kuna_bill_50_pic
	GuiControl, Hide, viewtab_first_kuna_bill_50_times_text
	GuiControl, Hide, viewtab_first_kuna_bill_50_edit

	GuiControl, Hide, viewtab_first_kuna_bill_20_pic
	GuiControl, Hide, viewtab_first_kuna_bill_20_times_text
	GuiControl, Hide, viewtab_first_kuna_bill_20_edit

	GuiControl, Hide, viewtab_first_kuna_bill_10_pic
	GuiControl, Hide, viewtab_first_kuna_bill_10_times_text
	GuiControl, Hide, viewtab_first_kuna_bill_10_edit

	GuiControl, Hide, viewtab_first_kuna_bills_sum_edit


	GuiControl, Hide, viewtab_first_kuna_bigcoin_5_pic
	GuiControl, Hide, viewtab_first_kuna_bigcoin_5_times_text
	GuiControl, Hide, viewtab_first_kuna_bigcoin_5_edit

	GuiControl, Hide, viewtab_first_kuna_bigcoin_2_pic
	GuiControl, Hide, viewtab_first_kuna_bigcoin_2_times_text
	GuiControl, Hide, viewtab_first_kuna_bigcoin_2_edit

	GuiControl, Hide, viewtab_first_kuna_bigcoin_1_pic
	GuiControl, Hide, viewtab_first_kuna_bigcoin_1_times_text
	GuiControl, Hide, viewtab_first_kuna_bigcoin_1_edit

	GuiControl, Hide, viewtab_first_kuna_bigcoins_sum_edit


	GuiControl, Hide, viewtab_first_kuna_smallcoin_50_pic
	GuiControl, Hide, viewtab_first_kuna_smallcoin_50_times_text
	GuiControl, Hide, viewtab_first_kuna_smallcoin_50_edit

	GuiControl, Hide, viewtab_first_kuna_smallcoin_20_pic
	GuiControl, Hide, viewtab_first_kuna_smallcoin_20_times_text
	GuiControl, Hide, viewtab_first_kuna_smallcoin_20_edit

	GuiControl, Hide, viewtab_first_kuna_smallcoin_10_pic
	GuiControl, Hide, viewtab_first_kuna_smallcoin_10_times_text
	GuiControl, Hide, viewtab_first_kuna_smallcoin_10_edit

	GuiControl, Hide, viewtab_first_kuna_smallcoin_5_pic
	GuiControl, Hide, viewtab_first_kuna_smallcoin_5_times_text
	GuiControl, Hide, viewtab_first_kuna_smallcoin_5_edit

	GuiControl, Hide, viewtab_first_kuna_smallcoin_1_pic
	GuiControl, Hide, viewtab_first_kuna_smallcoin_1_times_text
	GuiControl, Hide, viewtab_first_kuna_smallcoin_1_edit

	GuiControl, Hide, viewtab_first_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Show, viewtab_first_euro_bill_100_pic
	GuiControl, Show, viewtab_first_euro_bill_100_times_text
	GuiControl, Show, viewtab_first_euro_bill_100_edit

	GuiControl, Show, viewtab_first_euro_bill_50_pic
	GuiControl, Show, viewtab_first_euro_bill_50_times_text
	GuiControl, Show, viewtab_first_euro_bill_50_edit

	GuiControl, Show, viewtab_first_euro_bill_20_pic
	GuiControl, Show, viewtab_first_euro_bill_20_times_text
	GuiControl, Show, viewtab_first_euro_bill_20_edit

	GuiControl, Show, viewtab_first_euro_bill_10_pic
	GuiControl, Show, viewtab_first_euro_bill_10_times_text
	GuiControl, Show, viewtab_first_euro_bill_10_edit

	GuiControl, Show, viewtab_first_euro_bill_5_pic
	GuiControl, Show, viewtab_first_euro_bill_5_times_text
	GuiControl, Show, viewtab_first_euro_bill_5_edit

	GuiControl, Show, viewtab_first_euro_bills_sum_edit


	GuiControl, Show, viewtab_first_euro_bigcoin_2_pic
	GuiControl, Show, viewtab_first_euro_bigcoin_2_times_text
	GuiControl, Show, viewtab_first_euro_bigcoin_2_edit

	GuiControl, Show, viewtab_first_euro_bigcoin_1_pic
	GuiControl, Show, viewtab_first_euro_bigcoin_1_times_text
	GuiControl, Show, viewtab_first_euro_bigcoin_1_edit

	GuiControl, Show, viewtab_first_euro_bigcoins_sum_edit


	GuiControl, Show, viewtab_first_euro_smallcoin_50_pic
	GuiControl, Show, viewtab_first_euro_smallcoin_50_times_text
	GuiControl, Show, viewtab_first_euro_smallcoin_50_edit

	GuiControl, Show, viewtab_first_euro_smallcoin_20_pic
	GuiControl, Show, viewtab_first_euro_smallcoin_20_times_text
	GuiControl, Show, viewtab_first_euro_smallcoin_20_edit

	GuiControl, Show, viewtab_first_euro_smallcoin_10_pic
	GuiControl, Show, viewtab_first_euro_smallcoin_10_times_text
	GuiControl, Show, viewtab_first_euro_smallcoin_10_edit

	GuiControl, Show, viewtab_first_euro_smallcoin_5_pic
	GuiControl, Show, viewtab_first_euro_smallcoin_5_times_text
	GuiControl, Show, viewtab_first_euro_smallcoin_5_edit

	GuiControl, Show, viewtab_first_euro_smallcoin_1_pic
	GuiControl, Show, viewtab_first_euro_smallcoin_1_times_text
	GuiControl, Show, viewtab_first_euro_smallcoin_1_edit

	GuiControl, Show, viewtab_first_euro_smallcoins_sum_edit
	
	;=================================_====================================
	
	GuiControl, Hide, viewtab_second_kuna_bill_200_pic
	GuiControl, Hide, viewtab_second_kuna_bill_200_times_text
	GuiControl, Hide, viewtab_second_kuna_bill_200_edit

	GuiControl, Hide, viewtab_second_kuna_bill_100_pic
	GuiControl, Hide, viewtab_second_kuna_bill_100_times_text
	GuiControl, Hide, viewtab_second_kuna_bill_100_edit

	GuiControl, Hide, viewtab_second_kuna_bill_50_pic
	GuiControl, Hide, viewtab_second_kuna_bill_50_times_text
	GuiControl, Hide, viewtab_second_kuna_bill_50_edit

	GuiControl, Hide, viewtab_second_kuna_bill_20_pic
	GuiControl, Hide, viewtab_second_kuna_bill_20_times_text
	GuiControl, Hide, viewtab_second_kuna_bill_20_edit

	GuiControl, Hide, viewtab_second_kuna_bill_10_pic
	GuiControl, Hide, viewtab_second_kuna_bill_10_times_text
	GuiControl, Hide, viewtab_second_kuna_bill_10_edit

	GuiControl, Hide, viewtab_second_kuna_bills_sum_edit


	GuiControl, Hide, viewtab_second_kuna_bigcoin_5_pic
	GuiControl, Hide, viewtab_second_kuna_bigcoin_5_times_text
	GuiControl, Hide, viewtab_second_kuna_bigcoin_5_edit

	GuiControl, Hide, viewtab_second_kuna_bigcoin_2_pic
	GuiControl, Hide, viewtab_second_kuna_bigcoin_2_times_text
	GuiControl, Hide, viewtab_second_kuna_bigcoin_2_edit

	GuiControl, Hide, viewtab_second_kuna_bigcoin_1_pic
	GuiControl, Hide, viewtab_second_kuna_bigcoin_1_times_text
	GuiControl, Hide, viewtab_second_kuna_bigcoin_1_edit

	GuiControl, Hide, viewtab_second_kuna_bigcoins_sum_edit


	GuiControl, Hide, viewtab_second_kuna_smallcoin_50_pic
	GuiControl, Hide, viewtab_second_kuna_smallcoin_50_times_text
	GuiControl, Hide, viewtab_second_kuna_smallcoin_50_edit

	GuiControl, Hide, viewtab_second_kuna_smallcoin_20_pic
	GuiControl, Hide, viewtab_second_kuna_smallcoin_20_times_text
	GuiControl, Hide, viewtab_second_kuna_smallcoin_20_edit

	GuiControl, Hide, viewtab_second_kuna_smallcoin_10_pic
	GuiControl, Hide, viewtab_second_kuna_smallcoin_10_times_text
	GuiControl, Hide, viewtab_second_kuna_smallcoin_10_edit

	GuiControl, Hide, viewtab_second_kuna_smallcoin_5_pic
	GuiControl, Hide, viewtab_second_kuna_smallcoin_5_times_text
	GuiControl, Hide, viewtab_second_kuna_smallcoin_5_edit

	GuiControl, Hide, viewtab_second_kuna_smallcoin_1_pic
	GuiControl, Hide, viewtab_second_kuna_smallcoin_1_times_text
	GuiControl, Hide, viewtab_second_kuna_smallcoin_1_edit

	GuiControl, Hide, viewtab_second_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Show, viewtab_second_euro_bill_100_pic
	GuiControl, Show, viewtab_second_euro_bill_100_times_text
	GuiControl, Show, viewtab_second_euro_bill_100_edit

	GuiControl, Show, viewtab_second_euro_bill_50_pic
	GuiControl, Show, viewtab_second_euro_bill_50_times_text
	GuiControl, Show, viewtab_second_euro_bill_50_edit

	GuiControl, Show, viewtab_second_euro_bill_20_pic
	GuiControl, Show, viewtab_second_euro_bill_20_times_text
	GuiControl, Show, viewtab_second_euro_bill_20_edit

	GuiControl, Show, viewtab_second_euro_bill_10_pic
	GuiControl, Show, viewtab_second_euro_bill_10_times_text
	GuiControl, Show, viewtab_second_euro_bill_10_edit

	GuiControl, Show, viewtab_second_euro_bill_5_pic
	GuiControl, Show, viewtab_second_euro_bill_5_times_text
	GuiControl, Show, viewtab_second_euro_bill_5_edit

	GuiControl, Show, viewtab_second_euro_bills_sum_edit


	GuiControl, Show, viewtab_second_euro_bigcoin_2_pic
	GuiControl, Show, viewtab_second_euro_bigcoin_2_times_text
	GuiControl, Show, viewtab_second_euro_bigcoin_2_edit

	GuiControl, Show, viewtab_second_euro_bigcoin_1_pic
	GuiControl, Show, viewtab_second_euro_bigcoin_1_times_text
	GuiControl, Show, viewtab_second_euro_bigcoin_1_edit

	GuiControl, Show, viewtab_second_euro_bigcoins_sum_edit


	GuiControl, Show, viewtab_second_euro_smallcoin_50_pic
	GuiControl, Show, viewtab_second_euro_smallcoin_50_times_text
	GuiControl, Show, viewtab_second_euro_smallcoin_50_edit

	GuiControl, Show, viewtab_second_euro_smallcoin_20_pic
	GuiControl, Show, viewtab_second_euro_smallcoin_20_times_text
	GuiControl, Show, viewtab_second_euro_smallcoin_20_edit

	GuiControl, Show, viewtab_second_euro_smallcoin_10_pic
	GuiControl, Show, viewtab_second_euro_smallcoin_10_times_text
	GuiControl, Show, viewtab_second_euro_smallcoin_10_edit

	GuiControl, Show, viewtab_second_euro_smallcoin_5_pic
	GuiControl, Show, viewtab_second_euro_smallcoin_5_times_text
	GuiControl, Show, viewtab_second_euro_smallcoin_5_edit

	GuiControl, Show, viewtab_second_euro_smallcoin_1_pic
	GuiControl, Show, viewtab_second_euro_smallcoin_1_times_text
	GuiControl, Show, viewtab_second_euro_smallcoin_1_edit

	GuiControl, Show, viewtab_second_euro_smallcoins_sum_edit
	
}
else if (viewtab_currency_ddl_option = "Kuna")
{
	GuiControl, Show, viewtab_first_kuna_bill_200_pic
	GuiControl, Show, viewtab_first_kuna_bill_200_times_text
	GuiControl, Show, viewtab_first_kuna_bill_200_edit

	GuiControl, Show, viewtab_first_kuna_bill_100_pic
	GuiControl, Show, viewtab_first_kuna_bill_100_times_text
	GuiControl, Show, viewtab_first_kuna_bill_100_edit

	GuiControl, Show, viewtab_first_kuna_bill_50_pic
	GuiControl, Show, viewtab_first_kuna_bill_50_times_text
	GuiControl, Show, viewtab_first_kuna_bill_50_edit

	GuiControl, Show, viewtab_first_kuna_bill_20_pic
	GuiControl, Show, viewtab_first_kuna_bill_20_times_text
	GuiControl, Show, viewtab_first_kuna_bill_20_edit

	GuiControl, Show, viewtab_first_kuna_bill_10_pic
	GuiControl, Show, viewtab_first_kuna_bill_10_times_text
	GuiControl, Show, viewtab_first_kuna_bill_10_edit

	GuiControl, Show, viewtab_first_kuna_bills_sum_edit


	GuiControl, Show, viewtab_first_kuna_bigcoin_5_pic
	GuiControl, Show, viewtab_first_kuna_bigcoin_5_times_text
	GuiControl, Show, viewtab_first_kuna_bigcoin_5_edit

	GuiControl, Show, viewtab_first_kuna_bigcoin_2_pic
	GuiControl, Show, viewtab_first_kuna_bigcoin_2_times_text
	GuiControl, Show, viewtab_first_kuna_bigcoin_2_edit

	GuiControl, Show, viewtab_first_kuna_bigcoin_1_pic
	GuiControl, Show, viewtab_first_kuna_bigcoin_1_times_text
	GuiControl, Show, viewtab_first_kuna_bigcoin_1_edit

	GuiControl, Show, viewtab_first_kuna_bigcoins_sum_edit


	GuiControl, Show, viewtab_first_kuna_smallcoin_50_pic
	GuiControl, Show, viewtab_first_kuna_smallcoin_50_times_text
	GuiControl, Show, viewtab_first_kuna_smallcoin_50_edit

	GuiControl, Show, viewtab_first_kuna_smallcoin_20_pic
	GuiControl, Show, viewtab_first_kuna_smallcoin_20_times_text
	GuiControl, Show, viewtab_first_kuna_smallcoin_20_edit

	GuiControl, Show, viewtab_first_kuna_smallcoin_10_pic
	GuiControl, Show, viewtab_first_kuna_smallcoin_10_times_text
	GuiControl, Show, viewtab_first_kuna_smallcoin_10_edit

	GuiControl, Show, viewtab_first_kuna_smallcoin_5_pic
	GuiControl, Show, viewtab_first_kuna_smallcoin_5_times_text
	GuiControl, Show, viewtab_first_kuna_smallcoin_5_edit

	GuiControl, Show, viewtab_first_kuna_smallcoin_1_pic
	GuiControl, Show, viewtab_first_kuna_smallcoin_1_times_text
	GuiControl, Show, viewtab_first_kuna_smallcoin_1_edit

	GuiControl, Show, viewtab_first_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Hide, viewtab_first_euro_bill_100_pic
	GuiControl, Hide, viewtab_first_euro_bill_100_times_text
	GuiControl, Hide, viewtab_first_euro_bill_100_edit

	GuiControl, Hide, viewtab_first_euro_bill_50_pic
	GuiControl, Hide, viewtab_first_euro_bill_50_times_text
	GuiControl, Hide, viewtab_first_euro_bill_50_edit

	GuiControl, Hide, viewtab_first_euro_bill_20_pic
	GuiControl, Hide, viewtab_first_euro_bill_20_times_text
	GuiControl, Hide, viewtab_first_euro_bill_20_edit

	GuiControl, Hide, viewtab_first_euro_bill_10_pic
	GuiControl, Hide, viewtab_first_euro_bill_10_times_text
	GuiControl, Hide, viewtab_first_euro_bill_10_edit

	GuiControl, Hide, viewtab_first_euro_bill_5_pic
	GuiControl, Hide, viewtab_first_euro_bill_5_times_text
	GuiControl, Hide, viewtab_first_euro_bill_5_edit

	GuiControl, Hide, viewtab_first_euro_bills_sum_edit


	GuiControl, Hide, viewtab_first_euro_bigcoin_2_pic
	GuiControl, Hide, viewtab_first_euro_bigcoin_2_times_text
	GuiControl, Hide, viewtab_first_euro_bigcoin_2_edit

	GuiControl, Hide, viewtab_first_euro_bigcoin_1_pic
	GuiControl, Hide, viewtab_first_euro_bigcoin_1_times_text
	GuiControl, Hide, viewtab_first_euro_bigcoin_1_edit

	GuiControl, Hide, viewtab_first_euro_bigcoins_sum_edit


	GuiControl, Hide, viewtab_first_euro_smallcoin_50_pic
	GuiControl, Hide, viewtab_first_euro_smallcoin_50_times_text
	GuiControl, Hide, viewtab_first_euro_smallcoin_50_edit

	GuiControl, Hide, viewtab_first_euro_smallcoin_20_pic
	GuiControl, Hide, viewtab_first_euro_smallcoin_20_times_text
	GuiControl, Hide, viewtab_first_euro_smallcoin_20_edit

	GuiControl, Hide, viewtab_first_euro_smallcoin_10_pic
	GuiControl, Hide, viewtab_first_euro_smallcoin_10_times_text
	GuiControl, Hide, viewtab_first_euro_smallcoin_10_edit

	GuiControl, Hide, viewtab_first_euro_smallcoin_5_pic
	GuiControl, Hide, viewtab_first_euro_smallcoin_5_times_text
	GuiControl, Hide, viewtab_first_euro_smallcoin_5_edit

	GuiControl, Hide, viewtab_first_euro_smallcoin_1_pic
	GuiControl, Hide, viewtab_first_euro_smallcoin_1_times_text
	GuiControl, Hide, viewtab_first_euro_smallcoin_1_edit

	GuiControl, Hide, viewtab_first_euro_smallcoins_sum_edit
	
	;=================================_====================================
	
	GuiControl, Show, viewtab_second_kuna_bill_200_pic
	GuiControl, Show, viewtab_second_kuna_bill_200_times_text
	GuiControl, Show, viewtab_second_kuna_bill_200_edit

	GuiControl, Show, viewtab_second_kuna_bill_100_pic
	GuiControl, Show, viewtab_second_kuna_bill_100_times_text
	GuiControl, Show, viewtab_second_kuna_bill_100_edit

	GuiControl, Show, viewtab_second_kuna_bill_50_pic
	GuiControl, Show, viewtab_second_kuna_bill_50_times_text
	GuiControl, Show, viewtab_second_kuna_bill_50_edit

	GuiControl, Show, viewtab_second_kuna_bill_20_pic
	GuiControl, Show, viewtab_second_kuna_bill_20_times_text
	GuiControl, Show, viewtab_second_kuna_bill_20_edit

	GuiControl, Show, viewtab_second_kuna_bill_10_pic
	GuiControl, Show, viewtab_second_kuna_bill_10_times_text
	GuiControl, Show, viewtab_second_kuna_bill_10_edit

	GuiControl, Show, viewtab_second_kuna_bills_sum_edit


	GuiControl, Show, viewtab_second_kuna_bigcoin_5_pic
	GuiControl, Show, viewtab_second_kuna_bigcoin_5_times_text
	GuiControl, Show, viewtab_second_kuna_bigcoin_5_edit

	GuiControl, Show, viewtab_second_kuna_bigcoin_2_pic
	GuiControl, Show, viewtab_second_kuna_bigcoin_2_times_text
	GuiControl, Show, viewtab_second_kuna_bigcoin_2_edit

	GuiControl, Show, viewtab_second_kuna_bigcoin_1_pic
	GuiControl, Show, viewtab_second_kuna_bigcoin_1_times_text
	GuiControl, Show, viewtab_second_kuna_bigcoin_1_edit

	GuiControl, Show, viewtab_second_kuna_bigcoins_sum_edit


	GuiControl, Show, viewtab_second_kuna_smallcoin_50_pic
	GuiControl, Show, viewtab_second_kuna_smallcoin_50_times_text
	GuiControl, Show, viewtab_second_kuna_smallcoin_50_edit

	GuiControl, Show, viewtab_second_kuna_smallcoin_20_pic
	GuiControl, Show, viewtab_second_kuna_smallcoin_20_times_text
	GuiControl, Show, viewtab_second_kuna_smallcoin_20_edit

	GuiControl, Show, viewtab_second_kuna_smallcoin_10_pic
	GuiControl, Show, viewtab_second_kuna_smallcoin_10_times_text
	GuiControl, Show, viewtab_second_kuna_smallcoin_10_edit

	GuiControl, Show, viewtab_second_kuna_smallcoin_5_pic
	GuiControl, Show, viewtab_second_kuna_smallcoin_5_times_text
	GuiControl, Show, viewtab_second_kuna_smallcoin_5_edit

	GuiControl, Show, viewtab_second_kuna_smallcoin_1_pic
	GuiControl, Show, viewtab_second_kuna_smallcoin_1_times_text
	GuiControl, Show, viewtab_second_kuna_smallcoin_1_edit

	GuiControl, Show, viewtab_second_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Hide, viewtab_second_euro_bill_100_pic
	GuiControl, Hide, viewtab_second_euro_bill_100_times_text
	GuiControl, Hide, viewtab_second_euro_bill_100_edit

	GuiControl, Hide, viewtab_second_euro_bill_50_pic
	GuiControl, Hide, viewtab_second_euro_bill_50_times_text
	GuiControl, Hide, viewtab_second_euro_bill_50_edit

	GuiControl, Hide, viewtab_second_euro_bill_20_pic
	GuiControl, Hide, viewtab_second_euro_bill_20_times_text
	GuiControl, Hide, viewtab_second_euro_bill_20_edit

	GuiControl, Hide, viewtab_second_euro_bill_10_pic
	GuiControl, Hide, viewtab_second_euro_bill_10_times_text
	GuiControl, Hide, viewtab_second_euro_bill_10_edit

	GuiControl, Hide, viewtab_second_euro_bill_5_pic
	GuiControl, Hide, viewtab_second_euro_bill_5_times_text
	GuiControl, Hide, viewtab_second_euro_bill_5_edit

	GuiControl, Hide, viewtab_second_euro_bills_sum_edit


	GuiControl, Hide, viewtab_second_euro_bigcoin_2_pic
	GuiControl, Hide, viewtab_second_euro_bigcoin_2_times_text
	GuiControl, Hide, viewtab_second_euro_bigcoin_2_edit

	GuiControl, Hide, viewtab_second_euro_bigcoin_1_pic
	GuiControl, Hide, viewtab_second_euro_bigcoin_1_times_text
	GuiControl, Hide, viewtab_second_euro_bigcoin_1_edit

	GuiControl, Hide, viewtab_second_euro_bigcoins_sum_edit


	GuiControl, Hide, viewtab_second_euro_smallcoin_50_pic
	GuiControl, Hide, viewtab_second_euro_smallcoin_50_times_text
	GuiControl, Hide, viewtab_second_euro_smallcoin_50_edit

	GuiControl, Hide, viewtab_second_euro_smallcoin_20_pic
	GuiControl, Hide, viewtab_second_euro_smallcoin_20_times_text
	GuiControl, Hide, viewtab_second_euro_smallcoin_20_edit

	GuiControl, Hide, viewtab_second_euro_smallcoin_10_pic
	GuiControl, Hide, viewtab_second_euro_smallcoin_10_times_text
	GuiControl, Hide, viewtab_second_euro_smallcoin_10_edit

	GuiControl, Hide, viewtab_second_euro_smallcoin_5_pic
	GuiControl, Hide, viewtab_second_euro_smallcoin_5_times_text
	GuiControl, Hide, viewtab_second_euro_smallcoin_5_edit

	GuiControl, Hide, viewtab_second_euro_smallcoin_1_pic
	GuiControl, Hide, viewtab_second_euro_smallcoin_1_times_text
	GuiControl, Hide, viewtab_second_euro_smallcoin_1_edit

	GuiControl, Hide, viewtab_second_euro_smallcoins_sum_edit
	
}

GuiControl, Enable, viewtab_second_currency_ddl ; for spamming

}
return


viewtab_first_chosen_date: ; retrieves info from "%A_ScriptDir%\Records\Records.txt" and displays it
{
GuiControl, Disable, viewtab_first_date_ddl ; disabled cause of spamming


GuiControlGet, viewtab_first_chosen_date, , viewtab_first_date_ddl
viewtab_first_chosen_date := StrSplit(viewtab_first_chosen_date, A_Space) ; get date


lock := "Locked"

Loop, Read, %A_ScriptDir%\Records\Records.txt

	If InStr(A_LoopReadLine, viewtab_first_chosen_date[2])
	{
		lock := "Unlocked"
		
		values := StrSplit(A_LoopReadLine, ",", A_Space)
		
		GuiControl, Text, viewtab_first_balance_edit, % values[2]
		GuiControl, Text, viewtab_first_kuna_edit, % values[3]
		GuiControl, Text, viewtab_first_euro_edit, % values[4]
		GuiControl, Text, viewtab_first_notes_edit, % values[37]
		GuiControl, Text, viewtab_first_bank_edit, % values[5]


		GuiControl, Text, viewtab_first_kuna_bill_200_edit, % values[9]
		GuiControl, Text, viewtab_first_kuna_bill_100_edit, % values[10]
		GuiControl, Text, viewtab_first_kuna_bill_50_edit, % values[11]
		GuiControl, Text, viewtab_first_kuna_bill_20_edit, % values[12]
		GuiControl, Text, viewtab_first_kuna_bill_10_edit, % values[13]

		GuiControl, Text, viewtab_first_kuna_bills_sum_edit, % values[6]


		GuiControl, Text, viewtab_first_kuna_bigcoin_5_edit, % values[14]
		GuiControl, Text, viewtab_first_kuna_bigcoin_2_edit, % values[15]
		GuiControl, Text, viewtab_first_kuna_bigcoin_1_edit, % values[16]

		GuiControl, Text, viewtab_first_kuna_bigcoins_sum_edit, % values[7]


		GuiControl, Text, viewtab_first_kuna_smallcoin_50_edit, % values[17]
		GuiControl, Text, viewtab_first_kuna_smallcoin_20_edit, % values[18]
		GuiControl, Text, viewtab_first_kuna_smallcoin_10_edit, % values[19]
		GuiControl, Text, viewtab_first_kuna_smallcoin_5_edit, % values[20]
		GuiControl, Text, viewtab_first_kuna_smallcoin_1_edit, % values[21]

		GuiControl, Text, viewtab_first_kuna_smallcoins_sum_edit, % values[8]



		GuiControl, Text, viewtab_first_euro_bill_100_edit, % values[25]
		GuiControl, Text, viewtab_first_euro_bill_50_edit, % values[26]
		GuiControl, Text, viewtab_first_euro_bill_20_edit, % values[27]
		GuiControl, Text, viewtab_first_euro_bill_10_edit, % values[28]
		GuiControl, Text, viewtab_first_euro_bill_5_edit, % values[29]

		GuiControl, Text, viewtab_first_euro_bills_sum_edit, % values[22]


		GuiControl, Text, viewtab_first_euro_bigcoin_2_edit, % values[30]
		GuiControl, Text, viewtab_first_euro_bigcoin_1_edit, % values[31]

		GuiControl, Text, viewtab_first_euro_bigcoins_sum_edit, % values[23]


		GuiControl, Text, viewtab_first_euro_smallcoin_50_edit, % values[32]
		GuiControl, Text, viewtab_first_euro_smallcoin_20_edit, % values[33]
		GuiControl, Text, viewtab_first_euro_smallcoin_10_edit, % values[34]
		GuiControl, Text, viewtab_first_euro_smallcoin_5_edit, % values[35]
		GuiControl, Text, viewtab_first_euro_smallcoin_1_edit, % values[36]

		GuiControl, Text, viewtab_first_euro_smallcoins_sum_edit, % values[24]
		
		
		break
	}
	
	
If (lock = "Locked") ; clear all 
{
	GuiControl, Text, viewtab_first_balance_edit, 0.00
	GuiControl, Text, viewtab_first_kuna_edit, 0.00
	GuiControl, Text, viewtab_first_euro_edit, 0.00
	GuiControl, Text, viewtab_first_notes_edit, 
	GuiControl, Text, viewtab_first_bank_edit, 


	GuiControl, Text, viewtab_first_kuna_bill_200_edit, 
	GuiControl, Text, viewtab_first_kuna_bill_100_edit, 
	GuiControl, Text, viewtab_first_kuna_bill_50_edit, 
	GuiControl, Text, viewtab_first_kuna_bill_20_edit, 
	GuiControl, Text, viewtab_first_kuna_bill_10_edit, 

	GuiControl, Text, viewtab_first_kuna_bills_sum_edit, 0.00


	GuiControl, Text, viewtab_first_kuna_bigcoin_5_edit, 
	GuiControl, Text, viewtab_first_kuna_bigcoin_2_edit, 
	GuiControl, Text, viewtab_first_kuna_bigcoin_1_edit, 

	GuiControl, Text, viewtab_first_kuna_bigcoins_sum_edit, 0.00


	GuiControl, Text, viewtab_first_kuna_smallcoin_50_edit, 
	GuiControl, Text, viewtab_first_kuna_smallcoin_20_edit, 
	GuiControl, Text, viewtab_first_kuna_smallcoin_10_edit, 
	GuiControl, Text, viewtab_first_kuna_smallcoin_5_edit, 
	GuiControl, Text, viewtab_first_kuna_smallcoin_1_edit, 

	GuiControl, Text, viewtab_first_kuna_smallcoins_sum_edit, 0.00



	GuiControl, Text, viewtab_first_euro_bill_100_edit, 
	GuiControl, Text, viewtab_first_euro_bill_50_edit, 
	GuiControl, Text, viewtab_first_euro_bill_20_edit, 
	GuiControl, Text, viewtab_first_euro_bill_10_edit, 
	GuiControl, Text, viewtab_first_euro_bill_5_edit, 

	GuiControl, Text, viewtab_first_euro_bills_sum_edit, 0.00


	GuiControl, Text, viewtab_first_euro_bigcoin_2_edit, 
	GuiControl, Text, viewtab_first_euro_bigcoin_1_edit, 

	GuiControl, Text, viewtab_first_euro_bigcoins_sum_edit, 0.00


	GuiControl, Text, viewtab_first_euro_smallcoin_50_edit, 
	GuiControl, Text, viewtab_first_euro_smallcoin_20_edit, 
	GuiControl, Text, viewtab_first_euro_smallcoin_10_edit, 
	GuiControl, Text, viewtab_first_euro_smallcoin_5_edit, 
	GuiControl, Text, viewtab_first_euro_smallcoin_1_edit, 

	GuiControl, Text, viewtab_first_euro_smallcoins_sum_edit, 0.00
}


GuiControl, Enable, viewtab_first_date_ddl ; disabled cause of spamming
GuiControl, Focus, viewtab_first_date_ddl ; for continuation
}
return

viewtab_second_chosen_date: ; retrieves info from "%A_ScriptDir%\Records\Records.txt" and displays it
{
GuiControl, Disable, viewtab_second_date_ddl ; disabled cause of spamming


GuiControlGet, viewtab_second_chosen_date, , viewtab_second_date_ddl
viewtab_second_chosen_date := StrSplit(viewtab_second_chosen_date, A_Space) ; get date


lock := "Locked"

Loop, Read, %A_ScriptDir%\Records\Records.txt

	If InStr(A_LoopReadLine, viewtab_second_chosen_date[2])
	{
		lock := "Unlocked"
		
		values := StrSplit(A_LoopReadLine, ",", A_Space)
		
		GuiControl, Text, viewtab_second_balance_edit, % values[2]
		GuiControl, Text, viewtab_second_kuna_edit, % values[3]
		GuiControl, Text, viewtab_second_euro_edit, % values[4]
		GuiControl, Text, viewtab_second_notes_edit, % values[37]
		GuiControl, Text, viewtab_second_bank_edit, % values[5]


		GuiControl, Text, viewtab_second_kuna_bill_200_edit, % values[9]
		GuiControl, Text, viewtab_second_kuna_bill_100_edit, % values[10]
		GuiControl, Text, viewtab_second_kuna_bill_50_edit, % values[11]
		GuiControl, Text, viewtab_second_kuna_bill_20_edit, % values[12]
		GuiControl, Text, viewtab_second_kuna_bill_10_edit, % values[13]

		GuiControl, Text, viewtab_second_kuna_bills_sum_edit, % values[6]


		GuiControl, Text, viewtab_second_kuna_bigcoin_5_edit, % values[14]
		GuiControl, Text, viewtab_second_kuna_bigcoin_2_edit, % values[15]
		GuiControl, Text, viewtab_second_kuna_bigcoin_1_edit, % values[16]

		GuiControl, Text, viewtab_second_kuna_bigcoins_sum_edit, % values[7]


		GuiControl, Text, viewtab_second_kuna_smallcoin_50_edit, % values[17]
		GuiControl, Text, viewtab_second_kuna_smallcoin_20_edit, % values[18]
		GuiControl, Text, viewtab_second_kuna_smallcoin_10_edit, % values[19]
		GuiControl, Text, viewtab_second_kuna_smallcoin_5_edit, % values[20]
		GuiControl, Text, viewtab_second_kuna_smallcoin_1_edit, % values[21]

		GuiControl, Text, viewtab_second_kuna_smallcoins_sum_edit, % values[8]



		GuiControl, Text, viewtab_second_euro_bill_100_edit, % values[25]
		GuiControl, Text, viewtab_second_euro_bill_50_edit, % values[26]
		GuiControl, Text, viewtab_second_euro_bill_20_edit, % values[27]
		GuiControl, Text, viewtab_second_euro_bill_10_edit, % values[28]
		GuiControl, Text, viewtab_second_euro_bill_5_edit, % values[29]

		GuiControl, Text, viewtab_second_euro_bills_sum_edit, % values[22]


		GuiControl, Text, viewtab_second_euro_bigcoin_2_edit, % values[30]
		GuiControl, Text, viewtab_second_euro_bigcoin_1_edit, % values[31]

		GuiControl, Text, viewtab_second_euro_bigcoins_sum_edit, % values[23]


		GuiControl, Text, viewtab_second_euro_smallcoin_50_edit, % values[32]
		GuiControl, Text, viewtab_second_euro_smallcoin_20_edit, % values[33]
		GuiControl, Text, viewtab_second_euro_smallcoin_10_edit, % values[34]
		GuiControl, Text, viewtab_second_euro_smallcoin_5_edit, % values[35]
		GuiControl, Text, viewtab_second_euro_smallcoin_1_edit, % values[36]

		GuiControl, Text, viewtab_second_euro_smallcoins_sum_edit, % values[24]
		
		
		break
	}
	
	
If (lock = "Locked") ; clear all 
{
	GuiControl, Text, viewtab_second_balance_edit, 0.00
	GuiControl, Text, viewtab_second_kuna_edit, 0.00
	GuiControl, Text, viewtab_second_euro_edit, 0.00
	GuiControl, Text, viewtab_second_notes_edit, 
	GuiControl, Text, viewtab_second_bank_edit, 


	GuiControl, Text, viewtab_second_kuna_bill_200_edit, 
	GuiControl, Text, viewtab_second_kuna_bill_100_edit, 
	GuiControl, Text, viewtab_second_kuna_bill_50_edit, 
	GuiControl, Text, viewtab_second_kuna_bill_20_edit, 
	GuiControl, Text, viewtab_second_kuna_bill_10_edit, 

	GuiControl, Text, viewtab_second_kuna_bills_sum_edit, 0.00


	GuiControl, Text, viewtab_second_kuna_bigcoin_5_edit, 
	GuiControl, Text, viewtab_second_kuna_bigcoin_2_edit, 
	GuiControl, Text, viewtab_second_kuna_bigcoin_1_edit, 

	GuiControl, Text, viewtab_second_kuna_bigcoins_sum_edit, 0.00


	GuiControl, Text, viewtab_second_kuna_smallcoin_50_edit, 
	GuiControl, Text, viewtab_second_kuna_smallcoin_20_edit, 
	GuiControl, Text, viewtab_second_kuna_smallcoin_10_edit, 
	GuiControl, Text, viewtab_second_kuna_smallcoin_5_edit, 
	GuiControl, Text, viewtab_second_kuna_smallcoin_1_edit, 

	GuiControl, Text, viewtab_second_kuna_smallcoins_sum_edit, 0.00



	GuiControl, Text, viewtab_second_euro_bill_100_edit, 
	GuiControl, Text, viewtab_second_euro_bill_50_edit, 
	GuiControl, Text, viewtab_second_euro_bill_20_edit, 
	GuiControl, Text, viewtab_second_euro_bill_10_edit, 
	GuiControl, Text, viewtab_second_euro_bill_5_edit, 

	GuiControl, Text, viewtab_second_euro_bills_sum_edit, 0.00


	GuiControl, Text, viewtab_second_euro_bigcoin_2_edit, 
	GuiControl, Text, viewtab_second_euro_bigcoin_1_edit, 

	GuiControl, Text, viewtab_second_euro_bigcoins_sum_edit, 0.00


	GuiControl, Text, viewtab_second_euro_smallcoin_50_edit, 
	GuiControl, Text, viewtab_second_euro_smallcoin_20_edit, 
	GuiControl, Text, viewtab_second_euro_smallcoin_10_edit, 
	GuiControl, Text, viewtab_second_euro_smallcoin_5_edit, 
	GuiControl, Text, viewtab_second_euro_smallcoin_1_edit, 

	GuiControl, Text, viewtab_second_euro_smallcoins_sum_edit, 0.00
}


GuiControl, Enable, viewtab_second_date_ddl ; disabled cause of spamming
GuiControl, Focus, viewtab_second_date_ddl ; for continuation
}
return


viewtab_print_information:
{
GuiControl, Disable, viewtab_print_button ; for anti spamming
	
Gui, Submit, NoHide

if !viewtab_first_store_button and !viewtab_second_store_button
{
	MsgBox, 16, No Files Selected, You haven't selected a file. Please `nselect one or more files to print.
}
else if viewtab_first_store_button and InStr(viewtab_first_date_ddl, "Date:") or viewtab_second_store_button and InStr(viewtab_second_date_ddl, "Date:")
{
	if FileExist("Records\Records - Print.txt")
		FileDelete, %A_ScriptDir%\Records\Records - Print.txt


	FileAppend, `nDate:        Balance:      Kuna:      Euro:     Bank:   Kuna:  Novèanice:  Kovanice:  Lipe:  200:  100:  50:  20:  10:  5:  2:  1:  0.50:  0.20:  0.10:  0.05:  0.01:   Euro:  Novèanice:  Kovanice:  Centi:  100:  50:  20:  10:  5:  2:  1:  0.50:  0.20:  0.10:  0.05:  0.01:  Note:`n, %A_ScriptDir%\Records\Records - Print.txt


	if viewtab_first_store_button and InStr(viewtab_first_date_ddl, "Date:")
	{
		current_string := ""
			
		Loop, 37
		{
			if A_Index = 1
			{
				pos := 10
				
				control_string := viewtab_first_chosen_date[2]
			}
			else if A_Index = 2
			{
				pos := 21
				
				control_string := viewtab_first_balance_edit
			}			
			else if A_Index = 3
			{
				pos := 32
				
				control_string := viewtab_first_kuna_edit
			}			
			else if A_Index = 4
			{
				pos := 43
				
				control_string := viewtab_first_euro_edit
			}			
			else if A_Index = 5
			{
				pos := 53
				
				control_string := viewtab_first_bank_edit
			}			
			else if A_Index = 6
			{
				pos := 73
				
				control_string := viewtab_first_kuna_bills_sum_edit
			}				
			else if A_Index = 7
			{
				pos := 84
				
				control_string := viewtab_first_kuna_bigcoins_sum_edit
			}			
			else if A_Index = 8
			{
				pos := 91
				
				control_string := viewtab_first_kuna_smallcoins_sum_edit
			}			
			else if A_Index = 9
			{
				pos := 97
				
				control_string := viewtab_first_kuna_bill_200_edit
			}			
			else if A_Index = 10
			{
				pos := 103
				
				control_string := viewtab_first_kuna_bill_100_edit
			}			
			else if A_Index = 11
			{
				pos := 108
				
				control_string := viewtab_first_kuna_bill_50_edit
			}			
			else if A_Index = 12
			{
				pos := 113
				
				control_string := viewtab_first_kuna_bill_20_edit
			}
			else if A_Index = 13
			{
				pos := 118
				
				control_string := viewtab_first_kuna_bill_10_edit
			}			
			else if A_Index = 14
			{
				pos := 122
				
				control_string := viewtab_first_kuna_bigcoin_5_edit
			}			
			else if A_Index = 15
			{
				pos := 126
				
				control_string := viewtab_first_kuna_bigcoin_2_edit
			}			
			else if A_Index = 16
			{
				pos := 130
				
				control_string := viewtab_first_kuna_bigcoin_1_edit
			}			
			else if A_Index = 17
			{
				pos := 137
				
				control_string := viewtab_first_kuna_smallcoin_50_edit
			}			
			else if A_Index = 18
			{
				pos := 144
				
				control_string := viewtab_first_kuna_smallcoin_20_edit
			}			
			else if A_Index = 19
			{
				pos := 151
				
				control_string := viewtab_first_kuna_smallcoin_10_edit
			}			
			else if A_Index = 20
			{
				pos := 158
				
				control_string := viewtab_first_kuna_smallcoin_5_edit
			}			
			else if A_Index = 21
			{
				pos := 165
				
				control_string := viewtab_first_kuna_smallcoin_1_edit
			}			
			else if A_Index = 22
			{
				pos := 185
				
				control_string := viewtab_first_euro_bills_sum_edit
			}			
			else if A_Index = 23
			{
				pos := 196
				
				control_string := viewtab_first_euro_bigcoins_sum_edit
			}			
			else if A_Index = 24
			{
				pos := 204
				
				control_string := viewtab_first_euro_smallcoins_sum_edit
			}			
			else if A_Index = 25
			{
				pos := 210
				
				control_string := viewtab_first_euro_bill_100_edit
			}			
			else if A_Index = 26
			{
				pos := 216
				
				control_string := viewtab_first_euro_bill_50_edit
			}			
			else if A_Index = 27
			{
				pos := 221
				
				control_string := viewtab_first_euro_bill_20_edit
			}			
			else if A_Index = 28
			{
				pos := 226
				
				control_string := viewtab_first_euro_bill_10_edit
			}			
			else if A_Index = 29
			{
				pos := 231
				
				control_string := viewtab_first_euro_bill_5_edit
			}			
			else if A_Index = 30
			{
				pos := 235
				
				control_string := viewtab_first_euro_bigcoin_2_edit
			}			
			else if A_Index = 31
			{
				pos := 239
				
				control_string := viewtab_first_euro_bigcoin_1_edit
			}			
			else if A_Index = 32
			{
				pos := 243
				
				control_string := viewtab_first_euro_smallcoin_50_edit
			}			
			else if A_Index = 33
			{
				pos := 250
				
				control_string := viewtab_first_euro_smallcoin_20_edit
			}			
			else if A_Index = 34
			{
				pos := 257
				
				control_string := viewtab_first_euro_smallcoin_10_edit
			}			
			else if A_Index = 35
			{
				pos := 264
				
				control_string := viewtab_first_euro_smallcoin_5_edit
			}			
			else if A_Index = 36
			{
				pos := 271
				
				control_string := viewtab_first_euro_smallcoin_1_edit
			}			
			else if A_Index = 37
			{
				pos := 274 + StrLen(viewtab_first_notes_edit) ; no max lenght on note
				
				control_string := viewtab_first_notes_edit
			}
			
			
			while (StrLen(current_string) + StrLen(control_string) != pos)
				current_string := current_string . A_Space
			
			
			if (control_string != viewtab_first_notes_edit)
				current_string := current_string . control_string . ","
			else if (control_string = viewtab_first_notes_edit)
				current_string := current_string . control_string
			
		}
			
			
		
		FileAppend, `n`n, %A_ScriptDir%\Records\Records - Print.txt
		FileAppend, %current_string%, %A_ScriptDir%\Records\Records - Print.txt
		
	}
	

	if viewtab_second_store_button and InStr(viewtab_second_date_ddl, "Date:")
	{
		current_string := ""
			
		Loop, 37
		{
			if A_Index = 1
			{
				pos := 10
				
				control_string := viewtab_second_chosen_date[2]
			}
			else if A_Index = 2
			{
				pos := 21
				
				control_string := viewtab_second_balance_edit
			}			
			else if A_Index = 3
			{
				pos := 32
				
				control_string := viewtab_second_kuna_edit
			}			
			else if A_Index = 4
			{
				pos := 43
				
				control_string := viewtab_second_euro_edit
			}			
			else if A_Index = 5
			{
				pos := 53
				
				control_string := viewtab_second_bank_edit
			}			
			else if A_Index = 6
			{
				pos := 73
				
				control_string := viewtab_second_kuna_bills_sum_edit
			}				
			else if A_Index = 7
			{
				pos := 84
				
				control_string := viewtab_second_kuna_bigcoins_sum_edit
			}			
			else if A_Index = 8
			{
				pos := 91
				
				control_string := viewtab_second_kuna_smallcoins_sum_edit
			}			
			else if A_Index = 9
			{
				pos := 97
				
				control_string := viewtab_second_kuna_bill_200_edit
			}			
			else if A_Index = 10
			{
				pos := 103
				
				control_string := viewtab_second_kuna_bill_100_edit
			}			
			else if A_Index = 11
			{
				pos := 108
				
				control_string := viewtab_second_kuna_bill_50_edit
			}			
			else if A_Index = 12
			{
				pos := 113
				
				control_string := viewtab_second_kuna_bill_20_edit
			}
			else if A_Index = 13
			{
				pos := 118
				
				control_string := viewtab_second_kuna_bill_10_edit
			}			
			else if A_Index = 14
			{
				pos := 122
				
				control_string := viewtab_second_kuna_bigcoin_5_edit
			}			
			else if A_Index = 15
			{
				pos := 126
				
				control_string := viewtab_second_kuna_bigcoin_2_edit
			}			
			else if A_Index = 16
			{
				pos := 130
				
				control_string := viewtab_second_kuna_bigcoin_1_edit
			}			
			else if A_Index = 17
			{
				pos := 137
				
				control_string := viewtab_second_kuna_smallcoin_50_edit
			}			
			else if A_Index = 18
			{
				pos := 144
				
				control_string := viewtab_second_kuna_smallcoin_20_edit
			}			
			else if A_Index = 19
			{
				pos := 151
				
				control_string := viewtab_second_kuna_smallcoin_10_edit
			}			
			else if A_Index = 20
			{
				pos := 158
				
				control_string := viewtab_second_kuna_smallcoin_5_edit
			}			
			else if A_Index = 21
			{
				pos := 165
				
				control_string := viewtab_second_kuna_smallcoin_1_edit
			}			
			else if A_Index = 22
			{
				pos := 185
				
				control_string := viewtab_second_euro_bills_sum_edit
			}			
			else if A_Index = 23
			{
				pos := 196
				
				control_string := viewtab_second_euro_bigcoins_sum_edit
			}			
			else if A_Index = 24
			{
				pos := 204
				
				control_string := viewtab_second_euro_smallcoins_sum_edit
			}			
			else if A_Index = 25
			{
				pos := 210
				
				control_string := viewtab_second_euro_bill_100_edit
			}			
			else if A_Index = 26
			{
				pos := 216
				
				control_string := viewtab_second_euro_bill_50_edit
			}			
			else if A_Index = 27
			{
				pos := 221
				
				control_string := viewtab_second_euro_bill_20_edit
			}			
			else if A_Index = 28
			{
				pos := 226
				
				control_string := viewtab_second_euro_bill_10_edit
			}			
			else if A_Index = 29
			{
				pos := 231
				
				control_string := viewtab_second_euro_bill_5_edit
			}			
			else if A_Index = 30
			{
				pos := 235
				
				control_string := viewtab_second_euro_bigcoin_2_edit
			}			
			else if A_Index = 31
			{
				pos := 239
				
				control_string := viewtab_second_euro_bigcoin_1_edit
			}			
			else if A_Index = 32
			{
				pos := 243
				
				control_string := viewtab_second_euro_smallcoin_50_edit
			}			
			else if A_Index = 33
			{
				pos := 250
				
				control_string := viewtab_second_euro_smallcoin_20_edit
			}			
			else if A_Index = 34
			{
				pos := 257
				
				control_string := viewtab_second_euro_smallcoin_10_edit
			}			
			else if A_Index = 35
			{
				pos := 264
				
				control_string := viewtab_second_euro_smallcoin_5_edit
			}			
			else if A_Index = 36
			{
				pos := 271
				
				control_string := viewtab_second_euro_smallcoin_1_edit
			}			
			else if A_Index = 37
			{
				pos := 274 + StrLen(viewtab_second_notes_edit) ; no max lenght on note
				
				control_string := viewtab_second_notes_edit
			}
			
			
			while (StrLen(current_string) + StrLen(control_string) != pos)
				current_string := current_string . A_Space
			
			
			if (control_string != viewtab_second_notes_edit)
				current_string := current_string . control_string . ","
			else if (control_string = viewtab_second_notes_edit)
				current_string := current_string . control_string
			
		}
			
			
		
		FileAppend, `n`n, %A_ScriptDir%\Records\Records - Print.txt
		FileAppend, %current_string%, %A_ScriptDir%\Records\Records - Print.txt
		
	}
	
	
	Run, "Records\Records - Print.txt"
}
else if !InStr(viewtab_first_date_ddl, "Date:") and !InStr(viewtab_second_date_ddl, "Date:")
{
	MsgBox, 16, No Date Selected, You haven't selected a date.  Please `nselect one or more dates to print.
}


GuiControl, , viewtab_first_store_button, 0
GuiControl, , viewtab_second_store_button, 0

GuiControl, Enable, viewtab_print_button ; for anti spamming
}
return


;=================================_====================================
;============================= Edit Tab ===============================
;=================================_====================================

edittab_autoupdate: ; autoupdates every control in "edittab"
{
Gui, Submit, NoHide

;=================================_====================================
;========================== Autocalculate =============================

; autocalculate "bills" kuna
if (edittab_kuna_bill_200_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bill_200_edit := 0

if (edittab_kuna_bill_100_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bill_100_edit := 0

if (edittab_kuna_bill_50_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bill_50_edit := 0
	
if (edittab_kuna_bill_20_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bill_20_edit := 0
	
if (edittab_kuna_bill_10_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bill_10_edit := 0

if edittab_kuna_bills_sum_edit != (%edittab_kuna_bill_200_edit% * 200) + (%edittab_kuna_bill_100_edit% * 100) + (%edittab_kuna_bill_50_edit% * 50) + (%edittab_kuna_bill_20_edit% * 20) + (%edittab_kuna_bill_10_edit% * 10)
	GuiControl, Text, edittab_kuna_bills_sum_edit, % Format("{1:0.2f}", (edittab_kuna_bill_200_edit * 200) + (edittab_kuna_bill_100_edit * 100) + (edittab_kuna_bill_50_edit * 50) + (edittab_kuna_bill_20_edit * 20) + (edittab_kuna_bill_10_edit * 10))
	
;=================================_====================================
	
; autocalculate "bigcoins" kuna
if (edittab_kuna_bigcoin_5_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bigcoin_5_edit := 0

if (edittab_kuna_bigcoin_2_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bigcoin_2_edit := 0

if (edittab_kuna_bigcoin_1_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_bigcoin_1_edit := 0

if edittab_kuna_bigcoins_sum_edit != (%edittab_kuna_bigcoin_5_edit% * 5) + (%edittab_kuna_bigcoin_2_edit% * 100) + (%edittab_kuna_bigcoin_1_edit% * 1)
	GuiControl, Text, edittab_kuna_bigcoins_sum_edit, % Format("{1:0.2f}", (edittab_kuna_bigcoin_5_edit * 5) + (edittab_kuna_bigcoin_2_edit * 2) + (edittab_kuna_bigcoin_1_edit * 1))

;=================================_====================================

; autocalculate "smallcoins" kuna
if (edittab_kuna_smallcoin_50_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_smallcoin_50_edit := 0

if (edittab_kuna_smallcoin_20_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_smallcoin_20_edit := 0

if (edittab_kuna_smallcoin_10_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_smallcoin_10_edit := 0

if (edittab_kuna_smallcoin_5_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_smallcoin_5_edit := 0

if (edittab_kuna_smallcoin_1_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_kuna_smallcoin_1_edit := 0

if edittab_kuna_smallcoins_sum_edit != (%edittab_kuna_smallcoin_50_edit% * 0.5) + (%edittab_kuna_smallcoin_20_edit% * 0.2) + (%edittab_kuna_smallcoin_10_edit% * 0.1) + (%edittab_kuna_smallcoin_5_edit% * 0.5) + (%edittab_kuna_smallcoin_1_edit% * 0.01)
	GuiControl, Text, edittab_kuna_smallcoins_sum_edit, % Format("{1:0.2f}", (edittab_kuna_smallcoin_50_edit * 0.5) + (edittab_kuna_smallcoin_20_edit * 0.2) + (edittab_kuna_smallcoin_10_edit * 0.1) + (edittab_kuna_smallcoin_5_edit * 0.05) + (edittab_kuna_smallcoin_1_edit * 0.01))

;=================================_====================================

if (edittab_bank_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_bank_edit := 0


; autocalculate total kuna
if edittab_kuna_edit != ((%edittab_kuna_bill_200_edit% * 200) + (%edittab_kuna_bill_100_edit% * 100) + (%edittab_kuna_bill_50_edit% * 50) + (%edittab_kuna_bill_20_edit% * 20) + (%edittab_kuna_bill_10_edit% * 10) + (%edittab_kuna_bigcoin_5_edit% * 5) + (%edittab_kuna_bigcoin_2_edit% * 100) + (%edittab_kuna_bigcoin_1_edit% * 1) + (%edittab_kuna_smallcoin_50_edit% * 0.5) + (%edittab_kuna_smallcoin_20_edit% * 0.2) + (%edittab_kuna_smallcoin_10_edit% * 0.1) + (%edittab_kuna_smallcoin_5_edit% * 0.5) + (%edittab_kuna_smallcoin_1_edit% * 0.01) + edittab_bank_edit)
	GuiControl, Text, edittab_kuna_edit, % Format("{1:0.2f}", (edittab_kuna_bill_200_edit * 200) + (edittab_kuna_bill_100_edit * 100) + (edittab_kuna_bill_50_edit * 50) + (edittab_kuna_bill_20_edit * 20) + (edittab_kuna_bill_10_edit * 10) + (edittab_kuna_bigcoin_5_edit * 5) + (edittab_kuna_bigcoin_2_edit * 2) + (edittab_kuna_bigcoin_1_edit * 1) + (edittab_kuna_smallcoin_50_edit * 0.5) + (edittab_kuna_smallcoin_20_edit * 0.2) + (edittab_kuna_smallcoin_10_edit * 0.1) + (edittab_kuna_smallcoin_5_edit * 0.05) + (edittab_kuna_smallcoin_1_edit * 0.01) + edittab_bank_edit)



;=================================_====================================
;====================== Max amount of currency ========================

; amount of 1 type of currency caped to 99
if (edittab_kuna_bill_200_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bill_200_edit, 99

else if (edittab_kuna_bill_100_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bill_100_edit, 99

else if (edittab_kuna_bill_50_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bill_50_edit, 99

else if (edittab_kuna_bill_20_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bill_20_edit, 99

else if (edittab_kuna_bill_10_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bill_10_edit, 99

;=================================_====================================

else if (edittab_kuna_bigcoin_5_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bigcoin_5_edit, 99

else if (edittab_kuna_bigcoin_2_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bigcoin_2_edit, 99

else if (edittab_kuna_bigcoin_1_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_bigcoin_1_edit, 99

;=================================_====================================

else if (edittab_kuna_smallcoin_50_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_smallcoin_50_edit, 99

else if (edittab_kuna_smallcoin_20_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_smallcoin_20_edit, 99

else if (edittab_kuna_smallcoin_10_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_smallcoin_10_edit, 99

else if (edittab_kuna_smallcoin_5_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_smallcoin_5_edit, 99

else if (edittab_kuna_smallcoin_1_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_kuna_smallcoin_1_edit, 99

;=================================_====================================

else if (edittab_bank_edit >= 100000) or (StrLen(edittab_bank_edit) > 8)
	GuiControl, Text, inputtab_bank_edit, 99999.99


;=================================_====================================
;============================== Euro ==================================
;=================================_====================================


;=================================_====================================
;========================== Autocalculate =============================

; autocalculate "bills" euro
if (edittab_euro_bill_100_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_bill_100_edit := 0

if (edittab_euro_bill_50_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_bill_50_edit := 0

if (edittab_euro_bill_20_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_bill_20_edit := 0
	
if (edittab_euro_bill_10_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_bill_10_edit := 0
	
if (edittab_euro_bill_5_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_bill_5_edit := 0

if edittab_euro_bills_sum_edit != (%edittab_euro_bill_100_edit% * 100) + (%edittab_euro_bill_50_edit% * 50) + (%edittab_euro_bill_20_edit% * 20) + (%edittab_euro_bill_10_edit% * 10) + (%edittab_euro_bill_5_edit% * 5)
	GuiControl, Text, edittab_euro_bills_sum_edit, % Format("{1:0.2f}", (edittab_euro_bill_100_edit * 100) + (edittab_euro_bill_50_edit * 50) + (edittab_euro_bill_20_edit * 20) + (edittab_euro_bill_10_edit * 10) + (edittab_euro_bill_5_edit * 5))
	
;=================================_====================================
	
; autocalculate "bigcoins" euro
if (edittab_euro_bigcoin_2_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_bigcoin_2_edit := 0

if (edittab_euro_bigcoin_1_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_bigcoin_1_edit := 0

if edittab_euro_bigcoins_sum_edit != (%edittab_euro_bigcoin_2_edit% * 100) + (%edittab_euro_bigcoin_1_edit% * 1)
	GuiControl, Text, edittab_euro_bigcoins_sum_edit, % Format("{1:0.2f}", (edittab_euro_bigcoin_2_edit * 2) + (edittab_euro_bigcoin_1_edit * 1))

;=================================_====================================

; autocalculate "smallcoins" euro
if (edittab_euro_smallcoin_50_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_smallcoin_50_edit := 0

if (edittab_euro_smallcoin_20_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_smallcoin_20_edit := 0

if (edittab_euro_smallcoin_10_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_smallcoin_10_edit := 0

if (edittab_euro_smallcoin_5_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_smallcoin_5_edit := 0

if (edittab_euro_smallcoin_1_edit = "") or (edittab_kuna_bill_200_edit = "00")
	edittab_euro_smallcoin_1_edit := 0

if edittab_euro_smallcoins_sum_edit != (%edittab_euro_smallcoin_50_edit% * 0.5) + (%edittab_euro_smallcoin_20_edit% * 0.2) + (%edittab_euro_smallcoin_10_edit% * 0.1) + (%edittab_euro_smallcoin_5_edit% * 0.5) + (%edittab_euro_smallcoin_1_edit% * 0.01)
	GuiControl, Text, edittab_euro_smallcoins_sum_edit, % Format("{1:0.2f}", (edittab_euro_smallcoin_50_edit * 0.5) + (edittab_euro_smallcoin_20_edit * 0.2) + (edittab_euro_smallcoin_10_edit * 0.1) + (edittab_euro_smallcoin_5_edit * 0.05) + (edittab_euro_smallcoin_1_edit * 0.01))

;=================================_====================================

; autocalculate total euro
if edittab_euro_edit != ((%edittab_euro_bill_100_edit% * 100) + (%edittab_euro_bill_50_edit% * 50) + (%edittab_euro_bill_20_edit% * 20) + (%edittab_euro_bill_10_edit% * 10) + (%edittab_euro_bill_5_edit% * 5) + (%edittab_euro_bigcoin_2_edit% * 100) + (%edittab_euro_bigcoin_1_edit% * 1) + (%edittab_euro_smallcoin_50_edit% * 0.5) + (%edittab_euro_smallcoin_20_edit% * 0.2) + (%edittab_euro_smallcoin_10_edit% * 0.1) + (%edittab_euro_smallcoin_5_edit% * 0.5) + (%edittab_euro_smallcoin_1_edit% * 0.01))
	GuiControl, Text, edittab_euro_edit, % Format("{1:0.2f}", (edittab_euro_bill_100_edit * 100) + (edittab_euro_bill_50_edit * 50) + (edittab_euro_bill_20_edit * 20) + (edittab_euro_bill_10_edit * 10) + (edittab_euro_bill_5_edit * 5) + (edittab_euro_bigcoin_2_edit * 2) + (edittab_euro_bigcoin_1_edit * 1) + (edittab_euro_smallcoin_50_edit * 0.5) + (edittab_euro_smallcoin_20_edit * 0.2) + (edittab_euro_smallcoin_10_edit * 0.1) + (edittab_euro_smallcoin_5_edit * 0.05) + (edittab_euro_smallcoin_1_edit * 0.01))



;=================================_====================================
;====================== Max amount of currency ========================

; amount of 1 type of currency caped to 99
if (edittab_euro_bill_100_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_bill_100_edit, 99

else if (edittab_euro_bill_50_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_bill_50_edit, 99

else if (edittab_euro_bill_20_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_bill_20_edit, 99

else if (edittab_euro_bill_10_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_bill_10_edit, 99

else if (edittab_euro_bill_5_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_bill_5_edit, 99

;=================================_====================================

else if (edittab_euro_bigcoin_2_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_bigcoin_2_edit, 99

else if (edittab_euro_bigcoin_1_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_bigcoin_1_edit, 99

;=================================_====================================

else if (edittab_euro_smallcoin_50_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_smallcoin_50_edit, 99

else if (edittab_euro_smallcoin_20_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_smallcoin_20_edit, 99

else if (edittab_euro_smallcoin_10_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_smallcoin_10_edit, 99

else if (edittab_euro_smallcoin_5_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_smallcoin_5_edit, 99

else if (edittab_euro_smallcoin_1_edit > 99) or (StrLen(edittab_euro_bill_100_edit) > 2)
	GuiControl, Text, edittab_euro_smallcoin_1_edit, 99



;=================================_====================================
;========================== Total balance =============================
;=================================_====================================

if edittab_balance_edit != ((%edittab_kuna_bill_200_edit% * 200) + (%edittab_kuna_bill_100_edit% * 100) + (%edittab_kuna_bill_50_edit% * 50) + (%edittab_kuna_bill_20_edit% * 20) + (%edittab_kuna_bill_10_edit% * 10) + (%edittab_kuna_bigcoin_5_edit% * 5) + (%edittab_kuna_bigcoin_2_edit% * 100) + (%edittab_kuna_bigcoin_1_edit% * 1) + (%edittab_kuna_smallcoin_50_edit% * 0.5) + (%edittab_kuna_smallcoin_20_edit% * 0.2) + (%edittab_kuna_smallcoin_10_edit% * 0.1) + (%edittab_kuna_smallcoin_5_edit% * 0.5) + (%edittab_kuna_smallcoin_1_edit% * 0.01) + edittab_bank_edit)	+	((%edittab_euro_bill_100_edit% * 100) + (%edittab_euro_bill_50_edit% * 50) + (%edittab_euro_bill_20_edit% * 20) + (%edittab_euro_bill_10_edit% * 10) + (%edittab_euro_bill_5_edit% * 5) + (%edittab_euro_bigcoin_2_edit% * 100) + (%edittab_euro_bigcoin_1_edit% * 1) + (%edittab_euro_smallcoin_50_edit% * 0.5) + (%edittab_euro_smallcoin_20_edit% * 0.2) + (%edittab_euro_smallcoin_10_edit% * 0.1) + (%edittab_euro_smallcoin_5_edit% * 0.5) + (%edittab_euro_smallcoin_1_edit% * 0.01)) * %euro_to_kuna_conversion_rate%
	GuiControl, Text, edittab_balance_edit, % Format("{1:0.2f}", ((edittab_kuna_bill_200_edit * 200) + (edittab_kuna_bill_100_edit * 100) + (edittab_kuna_bill_50_edit * 50) + (edittab_kuna_bill_20_edit * 20) + (edittab_kuna_bill_10_edit * 10) + (edittab_kuna_bigcoin_5_edit * 5) + (edittab_kuna_bigcoin_2_edit * 2) + (edittab_kuna_bigcoin_1_edit * 1) + (edittab_kuna_smallcoin_50_edit * 0.5) + (edittab_kuna_smallcoin_20_edit * 0.2) + (edittab_kuna_smallcoin_10_edit * 0.1) + (edittab_kuna_smallcoin_5_edit * 0.05) + (edittab_kuna_smallcoin_1_edit * 0.01) + edittab_bank_edit)	+	((edittab_euro_bill_100_edit * 100) + (edittab_euro_bill_50_edit * 50) + (edittab_euro_bill_20_edit * 20) + (edittab_euro_bill_10_edit * 10) + (edittab_euro_bill_5_edit * 5) + (edittab_euro_bigcoin_2_edit * 2) + (edittab_euro_bigcoin_1_edit * 1) + (edittab_euro_smallcoin_50_edit * 0.5) + (edittab_euro_smallcoin_20_edit * 0.2) + (edittab_euro_smallcoin_10_edit * 0.1) + (edittab_euro_smallcoin_5_edit * 0.05) + (edittab_euro_smallcoin_1_edit * 0.01)) * euro_to_kuna_conversion_rate)

}
return


edittab_currency_ddl: ; changes currency
{
GuiControlGet, edittab_currency_ddl_option, , edittab_currency_ddl

GuiControl, Disable, edittab_currency_ddl ; for spamming

if (edittab_currency_ddl_option = "Euro")
{
	GuiControl, Hide, edittab_kuna_bill_200_pic
	GuiControl, Hide, edittab_kuna_bill_200_times_text
	GuiControl, Hide, edittab_kuna_bill_200_edit

	GuiControl, Hide, edittab_kuna_bill_100_pic
	GuiControl, Hide, edittab_kuna_bill_100_times_text
	GuiControl, Hide, edittab_kuna_bill_100_edit

	GuiControl, Hide, edittab_kuna_bill_50_pic
	GuiControl, Hide, edittab_kuna_bill_50_times_text
	GuiControl, Hide, edittab_kuna_bill_50_edit

	GuiControl, Hide, edittab_kuna_bill_20_pic
	GuiControl, Hide, edittab_kuna_bill_20_times_text
	GuiControl, Hide, edittab_kuna_bill_20_edit

	GuiControl, Hide, edittab_kuna_bill_10_pic
	GuiControl, Hide, edittab_kuna_bill_10_times_text
	GuiControl, Hide, edittab_kuna_bill_10_edit

	GuiControl, Hide, edittab_kuna_bills_sum_edit


	GuiControl, Hide, edittab_kuna_bigcoin_5_pic
	GuiControl, Hide, edittab_kuna_bigcoin_5_times_text
	GuiControl, Hide, edittab_kuna_bigcoin_5_edit

	GuiControl, Hide, edittab_kuna_bigcoin_2_pic
	GuiControl, Hide, edittab_kuna_bigcoin_2_times_text
	GuiControl, Hide, edittab_kuna_bigcoin_2_edit

	GuiControl, Hide, edittab_kuna_bigcoin_1_pic
	GuiControl, Hide, edittab_kuna_bigcoin_1_times_text
	GuiControl, Hide, edittab_kuna_bigcoin_1_edit

	GuiControl, Hide, edittab_kuna_bigcoins_sum_edit


	GuiControl, Hide, edittab_kuna_smallcoin_50_pic
	GuiControl, Hide, edittab_kuna_smallcoin_50_times_text
	GuiControl, Hide, edittab_kuna_smallcoin_50_edit

	GuiControl, Hide, edittab_kuna_smallcoin_20_pic
	GuiControl, Hide, edittab_kuna_smallcoin_20_times_text
	GuiControl, Hide, edittab_kuna_smallcoin_20_edit

	GuiControl, Hide, edittab_kuna_smallcoin_10_pic
	GuiControl, Hide, edittab_kuna_smallcoin_10_times_text
	GuiControl, Hide, edittab_kuna_smallcoin_10_edit

	GuiControl, Hide, edittab_kuna_smallcoin_5_pic
	GuiControl, Hide, edittab_kuna_smallcoin_5_times_text
	GuiControl, Hide, edittab_kuna_smallcoin_5_edit

	GuiControl, Hide, edittab_kuna_smallcoin_1_pic
	GuiControl, Hide, edittab_kuna_smallcoin_1_times_text
	GuiControl, Hide, edittab_kuna_smallcoin_1_edit

	GuiControl, Hide, edittab_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Show, edittab_euro_bill_100_pic
	GuiControl, Show, edittab_euro_bill_100_times_text
	GuiControl, Show, edittab_euro_bill_100_edit

	GuiControl, Show, edittab_euro_bill_50_pic
	GuiControl, Show, edittab_euro_bill_50_times_text
	GuiControl, Show, edittab_euro_bill_50_edit

	GuiControl, Show, edittab_euro_bill_20_pic
	GuiControl, Show, edittab_euro_bill_20_times_text
	GuiControl, Show, edittab_euro_bill_20_edit

	GuiControl, Show, edittab_euro_bill_10_pic
	GuiControl, Show, edittab_euro_bill_10_times_text
	GuiControl, Show, edittab_euro_bill_10_edit

	GuiControl, Show, edittab_euro_bill_5_pic
	GuiControl, Show, edittab_euro_bill_5_times_text
	GuiControl, Show, edittab_euro_bill_5_edit

	GuiControl, Show, edittab_euro_bills_sum_edit


	GuiControl, Show, edittab_euro_bigcoin_2_pic
	GuiControl, Show, edittab_euro_bigcoin_2_times_text
	GuiControl, Show, edittab_euro_bigcoin_2_edit

	GuiControl, Show, edittab_euro_bigcoin_1_pic
	GuiControl, Show, edittab_euro_bigcoin_1_times_text
	GuiControl, Show, edittab_euro_bigcoin_1_edit

	GuiControl, Show, edittab_euro_bigcoins_sum_edit


	GuiControl, Show, edittab_euro_smallcoin_50_pic
	GuiControl, Show, edittab_euro_smallcoin_50_times_text
	GuiControl, Show, edittab_euro_smallcoin_50_edit

	GuiControl, Show, edittab_euro_smallcoin_20_pic
	GuiControl, Show, edittab_euro_smallcoin_20_times_text
	GuiControl, Show, edittab_euro_smallcoin_20_edit

	GuiControl, Show, edittab_euro_smallcoin_10_pic
	GuiControl, Show, edittab_euro_smallcoin_10_times_text
	GuiControl, Show, edittab_euro_smallcoin_10_edit

	GuiControl, Show, edittab_euro_smallcoin_5_pic
	GuiControl, Show, edittab_euro_smallcoin_5_times_text
	GuiControl, Show, edittab_euro_smallcoin_5_edit

	GuiControl, Show, edittab_euro_smallcoin_1_pic
	GuiControl, Show, edittab_euro_smallcoin_1_times_text
	GuiControl, Show, edittab_euro_smallcoin_1_edit

	GuiControl, Show, edittab_euro_smallcoins_sum_edit
}
else if (edittab_currency_ddl_option = "Kuna")
{
	GuiControl, Show, edittab_kuna_bill_200_pic
	GuiControl, Show, edittab_kuna_bill_200_times_text
	GuiControl, Show, edittab_kuna_bill_200_edit

	GuiControl, Show, edittab_kuna_bill_100_pic
	GuiControl, Show, edittab_kuna_bill_100_times_text
	GuiControl, Show, edittab_kuna_bill_100_edit

	GuiControl, Show, edittab_kuna_bill_50_pic
	GuiControl, Show, edittab_kuna_bill_50_times_text
	GuiControl, Show, edittab_kuna_bill_50_edit

	GuiControl, Show, edittab_kuna_bill_20_pic
	GuiControl, Show, edittab_kuna_bill_20_times_text
	GuiControl, Show, edittab_kuna_bill_20_edit

	GuiControl, Show, edittab_kuna_bill_10_pic
	GuiControl, Show, edittab_kuna_bill_10_times_text
	GuiControl, Show, edittab_kuna_bill_10_edit

	GuiControl, Show, edittab_kuna_bills_sum_edit


	GuiControl, Show, edittab_kuna_bigcoin_5_pic
	GuiControl, Show, edittab_kuna_bigcoin_5_times_text
	GuiControl, Show, edittab_kuna_bigcoin_5_edit

	GuiControl, Show, edittab_kuna_bigcoin_2_pic
	GuiControl, Show, edittab_kuna_bigcoin_2_times_text
	GuiControl, Show, edittab_kuna_bigcoin_2_edit

	GuiControl, Show, edittab_kuna_bigcoin_1_pic
	GuiControl, Show, edittab_kuna_bigcoin_1_times_text
	GuiControl, Show, edittab_kuna_bigcoin_1_edit

	GuiControl, Show, edittab_kuna_bigcoins_sum_edit


	GuiControl, Show, edittab_kuna_smallcoin_50_pic
	GuiControl, Show, edittab_kuna_smallcoin_50_times_text
	GuiControl, Show, edittab_kuna_smallcoin_50_edit

	GuiControl, Show, edittab_kuna_smallcoin_20_pic
	GuiControl, Show, edittab_kuna_smallcoin_20_times_text
	GuiControl, Show, edittab_kuna_smallcoin_20_edit

	GuiControl, Show, edittab_kuna_smallcoin_10_pic
	GuiControl, Show, edittab_kuna_smallcoin_10_times_text
	GuiControl, Show, edittab_kuna_smallcoin_10_edit

	GuiControl, Show, edittab_kuna_smallcoin_5_pic
	GuiControl, Show, edittab_kuna_smallcoin_5_times_text
	GuiControl, Show, edittab_kuna_smallcoin_5_edit

	GuiControl, Show, edittab_kuna_smallcoin_1_pic
	GuiControl, Show, edittab_kuna_smallcoin_1_times_text
	GuiControl, Show, edittab_kuna_smallcoin_1_edit

	GuiControl, Show, edittab_kuna_smallcoins_sum_edit
	
	
	
	GuiControl, Hide, edittab_euro_bill_100_pic
	GuiControl, Hide, edittab_euro_bill_100_times_text
	GuiControl, Hide, edittab_euro_bill_100_edit

	GuiControl, Hide, edittab_euro_bill_50_pic
	GuiControl, Hide, edittab_euro_bill_50_times_text
	GuiControl, Hide, edittab_euro_bill_50_edit

	GuiControl, Hide, edittab_euro_bill_20_pic
	GuiControl, Hide, edittab_euro_bill_20_times_text
	GuiControl, Hide, edittab_euro_bill_20_edit

	GuiControl, Hide, edittab_euro_bill_10_pic
	GuiControl, Hide, edittab_euro_bill_10_times_text
	GuiControl, Hide, edittab_euro_bill_10_edit

	GuiControl, Hide, edittab_euro_bill_5_pic
	GuiControl, Hide, edittab_euro_bill_5_times_text
	GuiControl, Hide, edittab_euro_bill_5_edit

	GuiControl, Hide, edittab_euro_bills_sum_edit


	GuiControl, Hide, edittab_euro_bigcoin_2_pic
	GuiControl, Hide, edittab_euro_bigcoin_2_times_text
	GuiControl, Hide, edittab_euro_bigcoin_2_edit

	GuiControl, Hide, edittab_euro_bigcoin_1_pic
	GuiControl, Hide, edittab_euro_bigcoin_1_times_text
	GuiControl, Hide, edittab_euro_bigcoin_1_edit

	GuiControl, Hide, edittab_euro_bigcoins_sum_edit


	GuiControl, Hide, edittab_euro_smallcoin_50_pic
	GuiControl, Hide, edittab_euro_smallcoin_50_times_text
	GuiControl, Hide, edittab_euro_smallcoin_50_edit

	GuiControl, Hide, edittab_euro_smallcoin_20_pic
	GuiControl, Hide, edittab_euro_smallcoin_20_times_text
	GuiControl, Hide, edittab_euro_smallcoin_20_edit

	GuiControl, Hide, edittab_euro_smallcoin_10_pic
	GuiControl, Hide, edittab_euro_smallcoin_10_times_text
	GuiControl, Hide, edittab_euro_smallcoin_10_edit

	GuiControl, Hide, edittab_euro_smallcoin_5_pic
	GuiControl, Hide, edittab_euro_smallcoin_5_times_text
	GuiControl, Hide, edittab_euro_smallcoin_5_edit

	GuiControl, Hide, edittab_euro_smallcoin_1_pic
	GuiControl, Hide, edittab_euro_smallcoin_1_times_text
	GuiControl, Hide, edittab_euro_smallcoin_1_edit

	GuiControl, Hide, edittab_euro_smallcoins_sum_edit
}

GuiControl, Enable, edittab_currency_ddl ; for spamming

}
return


edittab_chosen_date: ; retrieves info from "%A_ScriptDir%\Records\Records.txt" and displays it
{
GuiControl, Disable, edittab_date_ddl ; disabled cause of spamming


GuiControlGet, edittab_chosen_date, , edittab_date_ddl
edittab_chosen_date := StrSplit(edittab_chosen_date, A_Space) ; get date


lock := "Locked"

Loop, Read, %A_ScriptDir%\Records\Records.txt

	If InStr(A_LoopReadLine, edittab_chosen_date[2])
	{
		lock := "Unlocked"
		
		values := StrSplit(A_LoopReadLine, ",", A_Space)
		
		GuiControl, Text, edittab_balance_edit, % values[2]
		GuiControl, Text, edittab_kuna_edit, % values[3]
		GuiControl, Text, edittab_euro_edit, % values[4]
		GuiControl, Text, edittab_notes_edit, % values[37]
		GuiControl, Text, edittab_bank_edit, % values[5]


		GuiControl, Text, edittab_kuna_bill_200_edit, % values[9]
		GuiControl, Text, edittab_kuna_bill_100_edit, % values[10]
		GuiControl, Text, edittab_kuna_bill_50_edit, % values[11]
		GuiControl, Text, edittab_kuna_bill_20_edit, % values[12]
		GuiControl, Text, edittab_kuna_bill_10_edit, % values[13]

		GuiControl, Text, edittab_kuna_bills_sum_edit, % values[6]


		GuiControl, Text, edittab_kuna_bigcoin_5_edit, % values[14]
		GuiControl, Text, edittab_kuna_bigcoin_2_edit, % values[15]
		GuiControl, Text, edittab_kuna_bigcoin_1_edit, % values[16]

		GuiControl, Text, edittab_kuna_bigcoins_sum_edit, % values[7]


		GuiControl, Text, edittab_kuna_smallcoin_50_edit, % values[17]
		GuiControl, Text, edittab_kuna_smallcoin_20_edit, % values[18]
		GuiControl, Text, edittab_kuna_smallcoin_10_edit, % values[19]
		GuiControl, Text, edittab_kuna_smallcoin_5_edit, % values[20]
		GuiControl, Text, edittab_kuna_smallcoin_1_edit, % values[21]

		GuiControl, Text, edittab_kuna_smallcoins_sum_edit, % values[8]



		GuiControl, Text, edittab_euro_bill_100_edit, % values[25]
		GuiControl, Text, edittab_euro_bill_50_edit, % values[26]
		GuiControl, Text, edittab_euro_bill_20_edit, % values[27]
		GuiControl, Text, edittab_euro_bill_10_edit, % values[28]
		GuiControl, Text, edittab_euro_bill_5_edit, % values[29]

		GuiControl, Text, edittab_euro_bills_sum_edit, % values[22]


		GuiControl, Text, edittab_euro_bigcoin_2_edit, % values[30]
		GuiControl, Text, edittab_euro_bigcoin_1_edit, % values[31]

		GuiControl, Text, edittab_euro_bigcoins_sum_edit, % values[23]


		GuiControl, Text, edittab_euro_smallcoin_50_edit, % values[32]
		GuiControl, Text, edittab_euro_smallcoin_20_edit, % values[33]
		GuiControl, Text, edittab_euro_smallcoin_10_edit, % values[34]
		GuiControl, Text, edittab_euro_smallcoin_5_edit, % values[35]
		GuiControl, Text, edittab_euro_smallcoin_1_edit, % values[36]

		GuiControl, Text, edittab_euro_smallcoins_sum_edit, % values[24]
		
		
		break
	}
	
	
If (lock = "Locked") ; clear all 
{
	GuiControl, Text, edittab_balance_edit, 0.00
	GuiControl, Text, edittab_kuna_edit, 0.00
	GuiControl, Text, edittab_euro_edit, 0.00
	GuiControl, Text, edittab_notes_edit, 
	GuiControl, Text, edittab_bank_edit, 


	GuiControl, Text, edittab_kuna_bill_200_edit, 
	GuiControl, Text, edittab_kuna_bill_100_edit, 
	GuiControl, Text, edittab_kuna_bill_50_edit, 
	GuiControl, Text, edittab_kuna_bill_20_edit, 
	GuiControl, Text, edittab_kuna_bill_10_edit, 

	GuiControl, Text, edittab_kuna_bills_sum_edit, 0.00


	GuiControl, Text, edittab_kuna_bigcoin_5_edit, 
	GuiControl, Text, edittab_kuna_bigcoin_2_edit, 
	GuiControl, Text, edittab_kuna_bigcoin_1_edit, 

	GuiControl, Text, edittab_kuna_bigcoins_sum_edit, 0.00


	GuiControl, Text, edittab_kuna_smallcoin_50_edit, 
	GuiControl, Text, edittab_kuna_smallcoin_20_edit, 
	GuiControl, Text, edittab_kuna_smallcoin_10_edit, 
	GuiControl, Text, edittab_kuna_smallcoin_5_edit, 
	GuiControl, Text, edittab_kuna_smallcoin_1_edit, 

	GuiControl, Text, edittab_kuna_smallcoins_sum_edit, 0.00



	GuiControl, Text, edittab_euro_bill_100_edit, 
	GuiControl, Text, edittab_euro_bill_50_edit, 
	GuiControl, Text, edittab_euro_bill_20_edit, 
	GuiControl, Text, edittab_euro_bill_10_edit, 
	GuiControl, Text, edittab_euro_bill_5_edit, 

	GuiControl, Text, edittab_euro_bills_sum_edit, 0.00


	GuiControl, Text, edittab_euro_bigcoin_2_edit, 
	GuiControl, Text, edittab_euro_bigcoin_1_edit, 

	GuiControl, Text, edittab_euro_bigcoins_sum_edit, 0.00


	GuiControl, Text, edittab_euro_smallcoin_50_edit, 
	GuiControl, Text, edittab_euro_smallcoin_20_edit, 
	GuiControl, Text, edittab_euro_smallcoin_10_edit, 
	GuiControl, Text, edittab_euro_smallcoin_5_edit, 
	GuiControl, Text, edittab_euro_smallcoin_1_edit, 

	GuiControl, Text, edittab_euro_smallcoins_sum_edit, 0.00
}


GuiControl, Enable, edittab_date_ddl ; disabled cause of spamming
GuiControl, Focus, edittab_date_ddl ; for continuation
}
return


edittab_edit_information: ; edits the stored information
{

MsgBox, 8244, Edit Records, Are you sure you want to`noverwrite the existing data?

IfMsgBox, Yes
{
	gosub, edittab_autoupdate

	;=================================_====================================
	
	Loop, Read, %A_ScriptDir%\Records\Records.txt ; gets row_number to edit
		
		If InStr(A_LoopReadLine, edittab_chosen_date[2])
		{
			row_number := A_Index
			
			break
		}
		
	;=================================_====================================
	;=================================_====================================
	;=================================_====================================

	Loop, Read, %A_ScriptDir%\Records\Records.txt ; edit data
		
		If (A_Index = row_number) ; replace data
		{
			current_string := ""
			
			Loop, 37
			{
				if A_Index = 1
				{
					pos := 10
					
					control_string := edittab_chosen_date[2]
				}
				else if A_Index = 2
				{
					pos := 21
					
					control_string := edittab_balance_edit
				}			
				else if A_Index = 3
				{
					pos := 32
					
					control_string := edittab_kuna_edit
				}			
				else if A_Index = 4
				{
					pos := 43
					
					control_string := edittab_euro_edit
				}			
				else if A_Index = 5
				{
					pos := 53
					
					control_string := edittab_bank_edit
				}			
				else if A_Index = 6
				{
					pos := 73
					
					control_string := edittab_kuna_bills_sum_edit
				}				
				else if A_Index = 7
				{
					pos := 84
					
					control_string := edittab_kuna_bigcoins_sum_edit
				}			
				else if A_Index = 8
				{
					pos := 91
					
					control_string := edittab_kuna_smallcoins_sum_edit
				}			
				else if A_Index = 9
				{
					pos := 97
					
					control_string := edittab_kuna_bill_200_edit
				}			
				else if A_Index = 10
				{
					pos := 103
					
					control_string := edittab_kuna_bill_100_edit
				}			
				else if A_Index = 11
				{
					pos := 108
					
					control_string := edittab_kuna_bill_50_edit
				}			
				else if A_Index = 12
				{
					pos := 113
					
					control_string := edittab_kuna_bill_20_edit
				}
				else if A_Index = 13
				{
					pos := 118
					
					control_string := edittab_kuna_bill_10_edit
				}			
				else if A_Index = 14
				{
					pos := 122
					
					control_string := edittab_kuna_bigcoin_5_edit
				}			
				else if A_Index = 15
				{
					pos := 126
					
					control_string := edittab_kuna_bigcoin_2_edit
				}			
				else if A_Index = 16
				{
					pos := 130
					
					control_string := edittab_kuna_bigcoin_1_edit
				}			
				else if A_Index = 17
				{
					pos := 137
					
					control_string := edittab_kuna_smallcoin_50_edit
				}			
				else if A_Index = 18
				{
					pos := 144
					
					control_string := edittab_kuna_smallcoin_20_edit
				}			
				else if A_Index = 19
				{
					pos := 151
					
					control_string := edittab_kuna_smallcoin_10_edit
				}			
				else if A_Index = 20
				{
					pos := 158
					
					control_string := edittab_kuna_smallcoin_5_edit
				}			
				else if A_Index = 21
				{
					pos := 165
					
					control_string := edittab_kuna_smallcoin_1_edit
				}			
				else if A_Index = 22
				{
					pos := 185
					
					control_string := edittab_euro_bills_sum_edit
				}			
				else if A_Index = 23
				{
					pos := 196
					
					control_string := edittab_euro_bigcoins_sum_edit
				}			
				else if A_Index = 24
				{
					pos := 204
					
					control_string := edittab_euro_smallcoins_sum_edit
				}			
				else if A_Index = 25
				{
					pos := 210
					
					control_string := edittab_euro_bill_100_edit
				}			
				else if A_Index = 26
				{
					pos := 216
					
					control_string := edittab_euro_bill_50_edit
				}			
				else if A_Index = 27
				{
					pos := 221
					
					control_string := edittab_euro_bill_20_edit
				}			
				else if A_Index = 28
				{
					pos := 226
					
					control_string := edittab_euro_bill_10_edit
				}			
				else if A_Index = 29
				{
					pos := 231
					
					control_string := edittab_euro_bill_5_edit
				}			
				else if A_Index = 30
				{
					pos := 235
					
					control_string := edittab_euro_bigcoin_2_edit
				}			
				else if A_Index = 31
				{
					pos := 239
					
					control_string := edittab_euro_bigcoin_1_edit
				}			
				else if A_Index = 32
				{
					pos := 243
					
					control_string := edittab_euro_smallcoin_50_edit
				}			
				else if A_Index = 33
				{
					pos := 250
					
					control_string := edittab_euro_smallcoin_20_edit
				}			
				else if A_Index = 34
				{
					pos := 257
					
					control_string := edittab_euro_smallcoin_10_edit
				}			
				else if A_Index = 35
				{
					pos := 264
					
					control_string := edittab_euro_smallcoin_5_edit
				}			
				else if A_Index = 36
				{
					pos := 271
					
					control_string := edittab_euro_smallcoin_1_edit
				}			
				else if A_Index = 37
				{
					pos := 274 + StrLen(edittab_notes_edit) ; no max lenght on note
					
					control_string := edittab_notes_edit
				}
				
				
				while (StrLen(current_string) + StrLen(control_string) != pos)
					current_string := current_string . A_Space
				
				if (control_string != viewtab_first_notes_edit)
					current_string := current_string . control_string . ","
				else if (control_string = viewtab_first_notes_edit)
					current_string := current_string . control_string
				
			}
			
			
			data := data . current_string . "`n"
		}
		Else If (A_Index != row_number) ; copy data
			data := data . A_LoopReadLine . "`n"

	;=================================_====================================
	;=================================_====================================
	;=================================_====================================

	FileDelete, %A_ScriptDir%\Records\Records.txt ; delete old file

	;=================================_====================================
	;=================================_====================================
	;=================================_====================================

	FileAppend, %data%, %A_ScriptDir%\Records\Records.txt ; add data to new text file
	
	data := "" ; clear variable for storage

	;=================================_====================================
	;=================================_====================================
	;=================================_====================================

	gosub, viewtab_first_chosen_date ; update gui
	gosub, viewtab_second_chosen_date ; update gui
	
	gosub, edittab_chosen_date ; update gui
}

}
return


;=================================_====================================
;============================= Hotkeys ================================
;=================================_====================================

^R:: ; reload dates
{
	gosub, viable_dates ; reload dates
	
	GuiControl, Choose, viewtab_first_date_ddl, 1 ; chooses last input record
	gosub, viewtab_first_chosen_date ; updates gui

	GuiControl, Choose, viewtab_second_date_ddl, 2 ; chooses last input record
	gosub, viewtab_second_chosen_date ; updates gui
	
	GuiControl, Choose, edittab_date_ddl, 1 ; chooses last input record
	gosub, edittab_chosen_date ; updates gui
}
return



