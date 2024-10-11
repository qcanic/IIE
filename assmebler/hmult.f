#include "common.fh"

data:
    poly evk(evknum)(dnum)(2)(L) = &"file1";
    poly p11(L) = &"file2";
    poly p12(L) = &"file3";
    poly p21(L) = &"file4";
    poly p22(L) = &"file5";
    poly Pinv(1)   = &"file6";
    poly pHatInv(L)(L) = &“file7”;

main proc:
    load b1 p11 0:L-1;
    load b2 p12 0:L-1;
    load b3 p21 0:L-1;
    load b4 p22 0:L-1;
    multvv b5 b1 b3 0:L-1;  //(b5,b6,b8)
    multvv b6 b2 b3 0:L-1;
    multvv b7 b1 b4 0:L-1;
    multvv b8 b2 b4 0:L-1;
    addvv b6 b6 b7;
    
    //res = (b5 + keyswitch(b8)1, b6 + keyswitch(b8)2)
    poly res1(3)(L);
    store res1[0] b5 0:L-1;
    store res1[1] b6 0:L-1;
    call keyswitch(b8,L,0) b7,b8;
    load b5 res1[0] 0:L-1;
    load b6 res2[0] 0:L-1;
    addvv b5 b5 b7 0:L-1;
    addvv b6 b6 b8 0:L-1;

keyswitch(l,evkindex) proc:
    int dnum_now = ceil(l/dnum),i;
    intt  b1 b1 0:l-1;
    load  b2 pHatInv[l-1] 0:l-1;
    multvv b1 b1 b2 0:l-1 ;

    for (i in range(0,dnum_now,1)) {

        int nowl = alpha;
        if (i == dnum_now - 1){
            nowl = l - (i-1) * alpha;
        }
        //MODUP(b2)
        bconv b2 b1  0:l-1  (i-1)*alpha:(i-1)*alpha+nowl-1 ;   //????b2里的顺序怎么办;;假设bconv的同时自动调整顺序并且把要合并的b1移到b2中,并且假设不会占用额外资源
        mv    b2 b1  l:l+K-1 (i-1)*alpha:(i-1)*alpha+nowl-1 ;   //不够补0
        ntt   b2 b2 0:l-1;

        //MULTKEY(b5,b6)
        load  b3 evk[evkindex][i][0] 0:l-1;
        multvv b4 b3 b2 0:l+K-1;
        if (i == 0){
            mv b5 b4 0:l+K-1  ;
        }
        else{
            addvv b5 b4 b5 0:l+K-1;
        }

        load  b3 evk[evkindex][i][1] 0:l-1;
        multvv b4 b3 b2 0:l+K-1;
        if (i == 0){
            mv b6 b4 0:l+K-1  ;
        }
        else{
            addvv b6 b4 b6 0:l+K-1;
        }
    }

    //MODDOWN
    intt b5 b5 l:l+K-1;
    bconv b2 b5 0:l-1 l:l+K-1;
    ntt  b2 b2 0:l-1;
    subvv  b5 b5 b2 0:l-1              ;

    intt b6 b6 l:l+K-1;
    bconv b3 b5 0:l-1 l:l+K-1;
    ntt  b3 b3 0:l-1;
    subvv  b6 b6 b3 0:l-1              ;

    load b1 Pinv 0:0;
    multvs b5 b5 b1 0:l-1 0:0;
    multvs b6 b6 b1 0:l-1 0:0;

    return b5 b6;
