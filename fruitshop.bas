10 poke52,28:poke56,28:clr:rem use ram memory for graphics
20 for i=7168to7679:pokei,peek(i+25600):nexti:poke36869,255
21 rem20 moves char set to selected ram and sets pointer to 7168
105 for y=7384to7423:readz:poke y,z:nexty
106 y=7168:pokey,255:y=y+1:pokey,254:y=y+1:pokey,252:y=y+1:pokey,248
107 y=y+1:pokey,240:y=y+1:pokey,224:y=y+1:pokey,192:y=y+1:pokey,128
500 printchr$(147):x=470:a=7680:b=38400:c=27:poke7680,27:poke38400,2
510 fory=0to21:poke(a+y),28:poke(b+y),8:nexty:ifa=8164thengoto550
520 a=a+44:b=b+44:goto510
550 a=7680:b=38400
553 y=64:gosub590:y=100:gosub590:y=134:gosub590:y=190:gosub590:y=229
555 gosub590:y=265:gosub591:y=324:gosub592:y=356:gosub592:y=415:gosub592
556 y=447:gosub592
589 goto599
590 poke(a+y),30:poke(b+y),7:return
591 poke(a+y),31:poke(b+y),5:return
592 poke(a+y),0:poke(b+y),5:return
599 rem move bananas
701 poke(a+x),c
702 poke(b+x),6
703 n=x
840 geta$
841 ifa$="s"thenx=x+22
842 ifa$="q"thenx=x-22
843 ifa$="l"thenx=x-1
844 ifa$="p"thenx=x+1
845 ifa$="e" then print "dead dead dead dead dead dead dead dead dead":end
910 s=peek(37151)
915 poke37154,127:p=peek(37152):poke37154,255
920 if(sand4)=0then x=x-22
925 if(sand8)=0then x=x+22
930 if(sand16)=0then x=x-1
935 if(pand128)=0then x=x+1
940 if(sand32)=0then print "dead dead dead dead dead dead dead dead dead":end
945 ifn<>xthenpoke(a+n),32
947 ifpeek(a+x)=28thenx=n
950 poke(a+x),c
960 poke(b+x),6
970 if c=27thenc=29:goto980
972 if c=29thenc=27
980 goto703
990 data4,30,45,78,17,18,36,70
991 data204,51,204,51,204,51,204,51
992 data8,28,42,8,20,20,20,10
994 data2,2,6,14,28,60,120,192
995 data16,8,84,254,254,254,124,56
