Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 18:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQa258hWCWyWHveU/H/rwrIhVRykZw2Uo4t6vCmLvOI=; b=bV4f7sMB/ZLDO5
	6/LS8a/3iQLpPoTsA1sxcBrbEbXaK070jaUGGJTC2OMj9HlhMAywAIuIrAP9GmWA4dQ5/MkX0ccPc
	aPFX7AXy3xVVMH0RG68S+LVfayerFp1u3wDIanCAVsWl7XekkhIs+uuGr+FMPDF8UMSALlGkykIxi
	fjf9B9AMfnWLXIiPwo7dIqvxAYQ2POXQ7OAQBKee3WvbNAHk+W+q5+cLSWmhRXbnpE3rxrg1sTsYM
	C1E31Mb9oyXj/yxBykwkHimMpsSOS+UmJ1n22oCpJNveho3+gk57I4Ykl9ejm840AC96a+qDKsktp
	1aJNTsXpgaT3lno8Vs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO1DE-003L8g-Dt; Fri, 03 Feb 2023 18:55:04 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO1D1-003L6C-58; Fri, 03 Feb 2023 18:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1675450476;
	bh=DvKbjnDcDtBC8Q1krS1RzQHgY1E0atPjdQs3SaaBTMY=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=H141Y846HEDpKvFoFP5vOp7ad2/J9xrFeItlr3F8QKKNe6EQtb9DdMoWnllMzIzRA
	 oz2Flwu5IyvpdVHhfivEAWcWCvV+Y51y7fD+/ks+fXMb6CtMnpAva1qrOpO0O4DjQe
	 NULIy8YGpu9cSZWxIEOtYL4jwTIcDfFXVlx3F/lr7TqsbdcL7zCa3Ou/r/dtc0+Zt2
	 nNA/yM7RbxY0POHvAlx6HA/DmzKZ1jCQoV+1a7f/0TmspneBi+EchaBjgbltMf1C3c
	 yI/ILI0QaRdRwWSkYtyR4Cp/733xyIJ0m2auFOTbR/3ArCX3xBlmzft3HaLHSl6959
	 +aq04edNWn9rA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([80.245.79.254]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQiS-1pWJC60Fj4-00AWTN; Fri, 03
 Feb 2023 19:54:36 +0100
Date: Fri, 03 Feb 2023 19:54:35 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 arinc9.unal@gmail.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH v2 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
User-Agent: K-9 Mail for Android
In-Reply-To: <75d3758a-5502-03a4-b3a2-990f9339705b@arinc9.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com> <20230201185656.17164-5-arinc.unal@arinc9.com> <AC473057-266B-4403-9270-8007E0EC257C@public-files.de> <75d3758a-5502-03a4-b3a2-990f9339705b@arinc9.com>
Message-ID: <B3729137-7B3E-4B74-8E9E-E1774F698FAA@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HYdSS8yHcTHvPc/Bi0cez5b2Io8yBM7OpHUOCvzIzEmu/aOEoqh
 aUy/yZ8/D2l9cI6pi33CpfdDs8+vqk5vK9sNxW6Tn9G9WOktiKt7+Z3lc/KaaK+aUBvC+1N
 6iAkSFP2ulofXpuZPItpVsL4+bkoIVxY1d08fbA3wP2Unte4CJRDqcVVHJnDTY92IXoYw34
 Q7ikgZ5THmpQx8WviPtOw==
UI-OutboundReport: notjunk:1;M01:P0:knHDjHqc4ys=;Cf6iKnN1H2Qikktryr+foFfChDp
 xZJaU6Ym4a6bAd7aIRf8vmKGDN+0QG5Hbij1F3kRUH1lwv93XhscT+R21GovLn3m6zGEXbAXf
 MxYmcAgA2XKQo/RseYZ1RbHAguRJtjrbrTPwOx+Z6UVjvPzH6fyj/6dbKCxiPDikQ8edz+E6z
 SYZV/W/sccLTIzU+q6WmHYsLxUE2vJkXSjRVwAYbDmFEsEVRMq+MAXmChfhEIWNg2w/uxAFA7
 KtxFptxOBnlVmXfHIWiHdLmw8px0mhbb/u6ntz7/Yyn0oyjgl3bPrfm24Nhfyudtns3fDKsEw
 vxlDF2GeeGRzfSEeTN3wxj/x/hW6YZ4Md+EPXLR5yoJBykuo6VIC1mksl2eMbcZQwarGjR6pP
 cOJq4YBqJICfWDcls9VOvipwci9EbF0c3M9EMAA1rTXpWYJ/qLSj03EzvnXRv1+IPweVuJ9vZ
 ReWp/GilvR6G21R5naovWfR2rP2TL55hbnKawbu5quxbfzpmHj7IiiAxLLYvbvAu/XuE9vILG
 Yts3FIgD2D2FpA5AYAcW50g0GhoShaKJkyqYl/1WUatkzz+WDQtkm0k7ICF0savCrWLpmmrJU
 nqpA0n717KBtFkOz08lIgGXdiop0jG8jMUNApene7BmseyyjbA5BuiFqLvyMHlRG5FG0aC1Ec
 B2dgzOfCUf53Y/UuO0m8BBIbLX5eaN56uFGpoekVtc8njh3/vhG53gW8LHNugEOh4pX1itb17
 xSMiLJcdRCsigW3xkipTRkSIg6TRF8yXLW0oPE1YFyR8zAUj0CQ3WB3mSE6k598k7udYSc6Ja
 0Qkt8pIPtHDt6hpkbaPC6NazQTazrAVzCC67S+623RjEDJmMkOm3cimsXvi25PX1PmCJyLTvJ
 GiQcNhGahm6pbiLaJp9xef+Ap1vINtG9mtu1npGf7Llj/IyjF3ApLlW55dsXle7utuJvjrFX5
 xy4kDQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_105451_512513_F3B2517E 
X-CRM114-Status: GOOD (  25.46  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 3=2E Februar 2023 19:20:48 MEZ schrieb "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arin=
c=2Eunal@arinc9=2Ecom>:
>On 3=2E02=2E2023 18:36, Frank Wunderlich wrote:
>> Am 1=2E Februar 2023 19:56:55 MEZ schrieb arinc9=2Eunal@gmail=2Ecom:
>>> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc=2Eunal@arinc9=2Ecom>
>>>=20
>>> Mux the MT7530 switch's phy0 to gmac5 which is wired to the SoC's gmac=
1=2E
>>> This achieves 2 Gbps total bandwidth to the CPU using the second RGMII=
=2E
>>>=20
>>> With this, the interface name to access phy0 changes from wan to eth1=
=2E
>>>=20
>>> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc=2Eunal@arinc9=2Ecom>
>>> ---
>>> arch/arm/boot/dts/mt7623n-bananapi-bpi-r2=2Edts | 15 ++++++++++-----
>>> 1 file changed, 10 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2=2Edts b/arch/ar=
m/boot/dts/mt7623n-bananapi-bpi-r2=2Edts
>>> index dc9b4f99eb8b=2E=2E64700253fd35 100644
>>> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2=2Edts
>>> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2=2Edts
>>> @@ -182,6 +182,12 @@ fixed-link {
>>> 	};
>>> };
>>>=20
>>> +&gmac1 {
>>> +	status =3D "okay";
>>> +	phy-mode =3D "rgmii";
>>> +	phy-handle =3D <&ethphy0>;
>>> +};
>>> +
>>> &eth {
>>> 	status =3D "okay";
>>>=20
>>> @@ -189,6 +195,10 @@ mdio-bus {
>>> 		#address-cells =3D <1>;
>>> 		#size-cells =3D <0>;
>>>=20
>>> +		ethphy0: ethernet-phy@0 {
>>> +			reg =3D <0>;
>>> +		};
>>> +
>>> 		switch@1f {
>>> 			compatible =3D "mediatek,mt7530";
>>> 			reg =3D <0x1f>;
>>> @@ -200,11 +210,6 @@ ports {
>>> 				#address-cells =3D <1>;
>>> 				#size-cells =3D <0>;
>>>=20
>>> -				port@0 {
>>> -					reg =3D <0>;
>>> -					label =3D "wan";
>>> -				};
>>> -
>>> 				port@1 {
>>> 					reg =3D <1>;
>>> 					label =3D "lan0";
>>=20
>> Hi
>>=20
>> I still see Problem with "renaming" the wan from users PoV=2E I got ano=
ther way of using second gmac for wan some time ago using vlan-aware bridge=
 (have not tested with recent kernel versions)=2E
>>=20
>> Maybe this works for you too? If yes imho it will be a better way=2E
>>=20
>> https://github=2Ecom/frank-w/BPI-Router-Linux/commit/c92b648bac996b34dc=
75a4fff15d7fb429bfe74b
>
>Frank, the comment section of that page is full of my comments testing it=
 out and chatting with you=2E I don't understand why you're wording it like=
 it's new to me=2E

Not new,but you have not told me the issues you have with this way=2E

>>=20
>> Have same for r64/mt7622 in my tree=2E=2E=2E
>>=20
>> It should use eth1 for wan-traffic too but is full userspace configurat=
ion without breaking userspace for users not wanting it=2E
>
>If your argument is that connecting the wan port to the second mac should=
 stay off mainline and to be left to the individual to do so, to not break =
the existing userspace configuration, this hack will need much more complex=
 changes to the userspace configuration compared to this patch=2E

Yes,userspace config is more complex,but till now i thought both ways had =
same result except that user can decide if he wants interface name changed=
=2E I try to find some time to test your approach this weekend=2E

>On top of this, you still need to change the devicetree to enable gmac1=
=2E And it will cause issues due to the nature of this method=2E Frames wit=
h the same MAC address will appear on different interfaces which will flood=
 the kernel log, if eth1 were to be put in a bridge with other interfaces=
=2E

This information is new to me=2E Had only made some basic tests with the w=
ay in my repo and did not noticed this flooding=2E

>To summarise:
>					This patch	Your method
>Changes to the devicetree		Yes	(-)	Yes	(-)
>Changes to the userspace configuration	Yes	(-)	Yes	(-)
>Changes required in userspace		Simple	(+)	Complex	(-)
>Does it work properly?			Yes	(+)	No	(-)
>
>Using this patch would be the proper way to connect the wan port to the s=
econd mac=2E
>
>I can also argue that I see no good reason to not want this, therefore th=
is should be the default way=2E The UTP port for the wan port is seperated =
from the other 4 ports which already supports that this should've been ther=
e when the DT of this device was added in the first place=2E

There was a hope that dsa will support multiple cpu ports some time and th=
ere are several attempts to get it into mainline=2E

>If someone were to not want this, they could change the devicetree to fit=
 their own purpose=2E
>
>To conclude, in my opinion, gaining 2 Gbps total bandwidth to the CPU at =
the expense of a tiny change in userspace configuration is absolutely worth=
 it=2E You clearly don't think that way and that's fine=2E It's up to the m=
aintainer, Matthias, to decide=2E Matthias can take the remaining patches i=
f they please=2E

I appreciate you efforts to getting better performance here=2E Idk how man=
y users will benefit from it=2E=2E=2Ei have only 25mbit/s connection and ca=
n configure my dt/userspace=2E=2E=2Eonly thought about users not able to do=
 so and may confused by this and do not "need" the change=2E

>Ar=C4=B1n=C3=A7


regards Frank

