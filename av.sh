if [ "$1" = "av" ];then
        execab="enc($2)"
elif [ "$1" = "bv" ];then
        execab="dec('$2')"
else
        echo AVNubmer\&BVNumber Converter
        echo Usage：av [AVNumber]
        echo bv [BVString]
        echo Example: ./av.sh av 170001
        echo ./bv.sh bv BV17x411w7KC
        echo TurboHsu Rubbish Script\&MCJX Source Code
        echo =w=
        exit 0
fi
python<<EOF 2>/dev/null
table='fZodR9XQDSUm21yCkr6zBqiveYah8bt4xsWpHnJE7jL5VG3guMTKNPAwcF'
tr={}
for i in range(58):
        tr[table[i]]=i
s=[11,10,3,8,4,6,2,9,5,7]
xor=177451812
add=100618342136696320

def dec(x):
        r=0
        for i in range(10):
                r+=tr[x[s[i]]]*58**i
        return (r-add)^xor

def enc(x):
        x=(x^xor)+add
        r=list('BV          ')
        for i in range(10):
                r[s[i]]=table[x//58**i%58]
        return ''.join(r)

print($execab)
EOF
