Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F5FC3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5NGZ7FBqBdRj1CxmbyFuu09/ZpTa0X+w9fUYiQA4SQ=; b=AXKDrEsi1U7uoT
	HNMiBstOQs9+75JjdO/PdxdOGpWJ4m7nwc/bDnMxKQHEqvacL1DDIV3Gy91IjRLlub25qrgApBsRA
	3sH/v7RpwvlX8H1m63gVzLYGeRpP1xvAcFbK1K3elLUZTThu4G0666wJ8rgjKwN4Ab0vtg3LEz2eQ
	dyb7gZHOu4kP6UwvUfmeE5ZyXLq0WD6yl3vo110IzIBVMEhehF+U3J/nXnDLxEIEq5WkM7o4ujaSS
	dGhACtS64w70iAhOWLlYDiKwKpV9LesYwXliFM511FTBMXM9ATpEVFu0LreB9QrO/JyS9/3NCV0Ga
	UtBXQ8EG/Fu4kWNWvHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmNm-00000009wTv-4B45;
	Thu, 27 Jun 2024 10:29:39 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmNE-00000009wMX-17tk;
	Thu, 27 Jun 2024 10:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1719484137; x=1720088937; i=frank-w@public-files.de;
	bh=D5NGZ7FBqBdRj1CxmbyFuu09/ZpTa0X+w9fUYiQA4SQ=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=n9G7MSQ4uPHWwI+yEE9Pz5PFTD2oI/SBdgyhok0S9hkRLC4Le0GJnGrLmlPHyg1H
	 sThQYQb0HCBHZxETLN8z4vwIJzQbWmtKRCuqVzpo2vnY6w/YvPlgTtLFENLaFve0O
	 7/AXviXqldaRqZSsF6S7hgucpefFWIcxb12la8V01XhA2MkGiNvZqRm+f6NlELsn/
	 +lu7EvZ5K30+nuMjKV1f7hPv+aumVxItPk22W0IvP1CXOauFFNfHasqPd+UFZaP7n
	 xtybmIPqyhkvW8hGwjsBL2loNWruC+slMPXfwuR9Y7Rv9MXqGriC2A+KwRTNF8cxf
	 dshYBf+IKP4hfa3zHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.71.1]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1rqcUn3xm1-00Vo5B; Thu, 27
 Jun 2024 12:28:57 +0200
Date: Thu, 27 Jun 2024 12:28:54 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Wunderlich <linux@fw-web.de>
Subject: =?US-ASCII?Q?Re=3A_Aw=3A_=5BPATCH_v3_1/2=5D_arm64=3A_dts=3A_mt7986=3A?=
 =?US-ASCII?Q?_add_dtbs_with_applied_overlays_for_bpi-r3?=
User-Agent: K-9 Mail for Android
In-Reply-To: <726f2ed3-675f-45e8-94f0-d392181e7f92@collabora.com>
References: <20240608080530.9436-1-linux@fw-web.de> <20240608080530.9436-2-linux@fw-web.de> <trinity-82c94d49-2a78-4470-83cd-3c6747e01849-1719434738199@3c-app-gmx-bs52> <726f2ed3-675f-45e8-94f0-d392181e7f92@collabora.com>
Message-ID: <951E802C-1B53-45C4-B3E6-4A3400F47214@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GQ81Q1zMBThpI//1P+HkTAUBlpTlOxo+qxvTc9TAMiOK9giLFEo
 h3YILAMhlW6igT41eOkAQu5PFe/3tORpWonl/JeUV46oIc4ucqt7Gt3e4lREBAA3+fg+Ef/
 3Kp8dlsKQwlO/ccpitJ7zNC37XnxutY0VPXEMSPkJSL5X1cUeyLpxBVnORhSF8R46/sM+DF
 z3drwJueoPBukzSRyDleA==
UI-OutboundReport: notjunk:1;M01:P0:Zt1rFlEjGSc=;DqDpGYepkvNHUBa8OktHl8cu696
 hNNHFYR4v9cr/X9qvsueO0bEhAelCWcntlu9hUUZlaAwFTuIwlaQQwG5qSk7TSte0l+LLaFxe
 aMvED9wnNU02QiWakFEVKtCAuoSRv6Zey8Xgqzn6KJPhqdbAV/gqI6bJ4IDQeoEZw+qaRmLNR
 KUtn5+rr+dmY1ZvZY14l7n54t17hSI0sXzfDeU7w5wwGzqoBmHaMi+1NRtIjJWhRBLdOnj144
 pTO74Hh7pbGRPYhWqsu68/d5DMGvSRcgIvqsHXYoWJMAX5Xs0eny8heGOEa7n80BZi069wNKz
 rkv8HTrk27LX5vqRn5mNPhO27o6qMo48wqc27sjtSi38vP0Bjr6lVF79I8aNJwqG/VyvFoa5/
 UGDONGw9u2xS9Q+liZh+dqmshGGzVCwDOCwoZrJIg5UM2VJy5E5XK23AMGGnRTe3WTkGXXF4v
 O3B9KJXuJMmmJrVBn0BqXChr+wIqGsj0i6GF7QTEYz/R7SkFqheD0jfX03JIdzg8GnTRVVFr3
 VG7FzMJpiNAPOwUP9DWXXYRCyMicXHmKCFz1wotVQjsna5a5/Zh8ctb17O/1VZXK5Yfal/jB4
 oNO/LIGhg7VdM044uaA81TfFxeoG+w8If74ISzMN700u6yh+FJjlat7WYsEsO6kzUKjI6/jR/
 7Zpg+nzgelZoe+j3dgChRZBqUWwXmL2U+g/jimhnDcQLPh/1zNpc3IqGxZS1mZv5y3QHnp+Rp
 miYqSClYnyLF7B3GJxJbdDmGwREJXPied0/Ql6qXi5HsAk03UrJswtw+aizT93Dqzb+6DEXQE
 /+g5erp4o0fxOaSnuvKLl4GbW07evTXILBh7kGG6C4430=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_032904_846539_BF285162 
X-CRM114-Status: GOOD (  14.55  )
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

Am 27=2E Juni 2024 12:10:17 MESZ schrieb AngeloGioacchino Del Regno <angelo=
gioacchino=2Edelregno@collabora=2Ecom>:
>Il 26/06/24 22:45, Frank Wunderlich ha scritto:
>> any suggestions? hoping it does no laying around so long as v2
>>=20
>
>So you're trying to just test that the overlay is valid and can actually =
be
>overlaid to the base dts?
>
>I'm not sure that this is the right/best way=2E=2E=2E and I honestly have=
 no time
>to check that *exactly right now*, even though that should be=2E
>
>I have to be convinced of what I'm doing before applying patches, and I k=
now
>that this was sent a bit of time ago, but I really didn't have any time t=
o
>dig into that=2E=2E=2E let's see if for some miracle I can do that for th=
is cycle
>otherwise it's going to be the next one=2E
>
>I mean no disrespect to Rob who suggested this change, but I still want t=
o
>check that on my own before picking it=2E
>

>>=20
>>=20
>>> Gesendet: Samstag, 08=2E Juni 2024 um 10:05 Uhr
>>> Von: "Frank Wunderlich" <linux@fw-web=2Ede>

>>> Betreff: [PATCH v3 1/2] arm64: dts: mt7986: add dtbs with applied over=
lays for bpi-r3
>>>=20
>>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>>=20
>>> Build devicetree binaries for testing overlays and providing users
>>> full dtb without using overlays=2E
>>>=20
>>> Suggested-by: Rob Herring <robh+dt@kernel=2Eorg>
 https://lore=2Ekernel=2Eorg/all/CAL_JsqK_3xxD0DFwipXO85P=3Dq=3DEYjUdjE1_8=
g1MKtvw3vVzx5A@mail=2Egmail=2Ecom/
>>> https://lore=2Ekernel=2Eorg/all/CAL_JsqJSi=3DkJSix=3Df3787ULZnaCy_Y26P=
hdhy5y9fat_vkDuUw@mail=2Egmail=2Ecom/
>>>=20
>>> v2:
>>> make full dtbs multiline for better readability
>>> ---
>>>   arch/arm64/boot/dts/mediatek/Makefile | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>=20
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/d=
ts/mediatek/Makefile
>>> index 37b4ca3a87c9=2E=2E0ec5b904d35d 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -15,6 +15,27 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-b=
pi-r3-emmc=2Edtbo
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand=2Edtbo
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd=2Edtbo
>>> +mt7986a-bananapi-bpi-r3-emmc-nand-dtbs :=3D \
>>> +	mt7986a-bananapi-bpi-r3=2Edtb \
>>> +	mt7986a-bananapi-bpi-r3-emmc=2Edtbo \
>>> +	mt7986a-bananapi-bpi-r3-nand=2Edtbo
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nand=2E=
dtb
>>> +mt7986a-bananapi-bpi-r3-emmc-nor-dtbs :=3D \
>>> +	mt7986a-bananapi-bpi-r3=2Edtb \
>>> +	mt7986a-bananapi-bpi-r3-emmc=2Edtbo \
>>> +	mt7986a-bananapi-bpi-r3-nor=2Edtbo
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nor=2Ed=
tb
>>> +mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D \
>>> +	mt7986a-bananapi-bpi-r3=2Edtb \
>>> +	mt7986a-bananapi-bpi-r3-sd=2Edtbo \
>>> +	mt7986a-bananapi-bpi-r3-nand=2Edtbo
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand=2Edt=
b
>>> +mt7986a-bananapi-bpi-r3-sd-nor-dtbs :=3D \
>>> +	mt7986a-bananapi-bpi-r3=2Edtb \
>>> +	mt7986a-bananapi-bpi-r3-sd=2Edtbo \
>>> +	mt7986a-bananapi-bpi-r3-nor=2Edtbo
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nor=2Edtb
>>> +
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb=2Edtb
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb=2Edtb
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4=2Edtb
>>> --
>>> 2=2E34=2E1
>>>=20
>>>=20
>

Yes, 1st reason is to check if overlay can be applied to base dts (the par=
t rob was requested)=2E The second thing that was solved is that some users=
 wanting a "full" dtb without the need to handle overlays in bootloader=2E =
Due to hardware design of the board there are 4 "full" dtb's=2E

So i adressed both in one Patch=2E I myself (and openwrt) still use the ov=
erlays and apply them after probing hardware in uboot=2E=2E=2Eso for me it =
is not needed but requested from others=2E Current state was defined as bro=
ken by rob and for future additions (like mt7988/bpi-r4) we want to have a =
blueprint=2E

I hope you find time to look into it to have it solved soon and avoid disc=
ussions like the 2 links from commit message in future=2E=2E=2Ethen we have=
 a reference for similar situations=2E


regards Frank

