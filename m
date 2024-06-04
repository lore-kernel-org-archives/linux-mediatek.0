Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415DAC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzOGfsxtAbzPaiVG4Wh0M0g2GTonKekwIavduiotSwY=; b=yR0mhxpYLQICV7DmMM7XeoZCf+
	Q/fwwe9RYaH3MhNGKgedwSXMESEGqhhF747fTMFXwI0W0GYnHoLuIM0944y0TmsWuoVrhNPSWWIyB
	vrFlQJv9Co0fV7cFmpKdbgtJ/IDS2P/aP5lMaN7kWZh3Zv+T8GJqC+kPh9n7rfSb0T0G9wy+1ezrB
	RICnDwsNXCAFwraD3idumzy5rS4ztUJ/Go3E3MOt4FItdtQR4XyYIr5HhHUW2iwdGUehwlOZi0+q8
	tqF+12tSB+oPc7ZncJvo9vKgXBiOw8BMfPopWMJg9G4XH64e1rlqY1SuDcd3kb3/msmrfISVhKQkF
	fMfPlKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXXL-00000003E0v-3nbS;
	Tue, 04 Jun 2024 17:01:27 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXXH-00000003Dzz-1UYs;
	Tue, 04 Jun 2024 17:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1717520476; x=1718125276; i=frank-w@public-files.de;
	bh=HzOGfsxtAbzPaiVG4Wh0M0g2GTonKekwIavduiotSwY=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Az0Z7vnOVH+mdpayYy/q9JTsVgSqUFFYhRbCJFajCAYqq0l4cL1H68GhtXgzwEwt
	 QFzRTsi+wXBOzagyesuhXpm4XE75rtMVNS4T3+5dsJV9e2BACOXb+yMLqNLI/AM/o
	 rwFDzIrCQjeoxdtA2ab5DVw56BKwQB9tGFy/mqEFP6snAmz6w5mweq2w3LrxY2ROu
	 QXWWLhRn5qEjoRhfge/A2Rar2P31LrkwzE2w+fHzbgc9LP6Mw1UumfxlLt0DrrOod
	 YcSah8NuT1hHfIp3H/D4n0OwmwHbpYpeHY0XhVCwxxxzyvqiqMVbVVfxwnAF7C1Ci
	 +Gw3WpS/I7QYXH8hCA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.157.72] ([217.61.157.72]) by web-mail.gmx.net
 (3c-app-gmx-bap32.server.lan [172.19.172.102]) (via HTTP); Tue, 4 Jun 2024
 19:01:16 +0200
MIME-Version: 1.0
Message-ID: <trinity-d7335867-6435-44f5-bddd-d825bcef2d33-1717520476265@3c-app-gmx-bap32>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>
Subject: Aw: [PATCH v2 4/5] arm64: dts: mt7986: add dtbs with applied
 overlays for bpi-r3
Content-Type: text/plain; charset=UTF-8
Date: Tue, 4 Jun 2024 19:01:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-a61f3152-8b44-4efb-9176-cc00a9449e63-1702133775512@3c-app-gmx-bs23>
References: <20231025170832.78727-1-linux@fw-web.de>
 <20231025170832.78727-5-linux@fw-web.de>
 <trinity-a61f3152-8b44-4efb-9176-cc00a9449e63-1702133775512@3c-app-gmx-bs23>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:9D0FPugdNo2sfMSNB36s4sPbmzQ//ch9qQ1z7kf35oVBJSWNVj6kMbWcGc9aBiQjzC2SB
 D1Vu1e/qPOaNy0YQ7wBPotozdIB6KVss7NxxSgDCwMNy7l5Ttlr5CQNzDIJt8ytkZQjTS5YmUo8E
 gtZ0YupCJoTVOIh/Vs9ofhiqQYY6gL6/JZJMXjDq3bp7meLn6m5YVanVV2z8hjwx9RRrfi+KX4pG
 Aa0ViS2D2mdGefzxOeNFGm5eh01PGaUap0p4Vs+d2CIbAwaTz9DR+afUDR5NvZx3AJ0Qd4HcfTpb
 s4=
UI-OutboundReport: notjunk:1;M01:P0:I33YQDgclag=;efPVmOXOv1ZURw5hMJZ0SQKXJ6t
 l0gAZiw9iLJzhcMTcqoNArSgjhSaABD9M8NRYYIZ2v1hDD5xfE7eQk0nTpYnaSmFEQRUbDrC4
 8+ozPr8v/NjNh4sOnzZ6fDvdU25YkNzga/9QTz1qwDByef+IQ5cDLAQkYDPXkeqkc3AhZTyST
 GRiy1ZgkXmzqFLqJvrsNN8tFmU948zvl9PVqZSPpkefDIg+qAZmLYf+exxmDyfl5EgLpuIGdA
 wMs8iXVWR3tayyIbG7hiwVAQEpF7zoSMYOA8APv6TgmPYT8OzpjgaPoEW+zHtYrFi1iQRkBoM
 0zsFFMLTciAAjwltCBMoyzTHqf4f3aZGe+D1L2il2t+ZXzmprnyMknBctczSavcY77AnJu8NG
 sUhX8NwV8gv2UiQ+Dk8Xnqxqmz9XvoAqPVNuznGVsXPH9UZJt96hBG+EQNuFBXKqQhX0lfyOc
 ktmBjS0RqHcLGQ8hwE0w/iwgf812zGNACUS3mCTGelpfFSuJc4VZrOlwQrZMgjBs/ouAuZZ7U
 3vcDYZqduYAz/3xf020RQ4GakhzEi51eNTWqmhjNcgoNjH8T78AqVvshkJym/WmCGyCTzGAw9
 EFIvTC6Tq5QFAM1VqYk8iPSiHtFu2j4ZM4UUkuYz1p9J54JKDIFQnq5yWoCj1yl4kgIU/JZE7
 NZCfBoxXcBWRWTtjqV1KUGgx21lBowzqAlkzeRH78kLkDLIoy6UgFJigzXLay1M=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_100123_797318_5E39E572 
X-CRM114-Status: GOOD (  15.88  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

how to proceed here?

regards Frank


> Gesendet: Samstag, 09. Dezember 2023 um 16:56 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> An: "Frank Wunderlich" <linux@fw-web.de>
> Cc: linux-mediatek@lists.infradead.org, "Matthias Brugger" <matthias.bgg=
@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@colla=
bora.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzy=
sztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Dan=
iel Golle" <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-ar=
m-kernel@lists.infradead.org, "Eric Woudstra" <ericwouds@gmail.com>
> Betreff: Aw: [PATCH v2 4/5] arm64: dts: mt7986: add dtbs with applied ov=
erlays for bpi-r3
>
> Hi
>
> Parts 1-3 are applied here, but how to proceed with this? to add further=
 devicetrees like
> for mt7988 we have to fix the "broken" dt-overlays first.
>
> i want to keep to build the dtbo to allow dynamic apply in bootloader, b=
ut they should be checked in
> compiletime too and full dtb should be created for users not wanting to =
handle overlays.
>
> regards Frank
>
>
> > Gesendet: Mittwoch, 25. Oktober 2023 um 18:08 Uhr
> > Von: "Frank Wunderlich" <linux@fw-web.de>
>
> > Build devicetree binaries for testing overlays and providing users
> > full dtb without using overlays.
> >
> > Suggested-by: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=3Dq=3DEYjUdjE1_8g=
1MKtvw3vVzx5A@mail.gmail.com/
> > https://lore.kernel.org/all/CAL_JsqJSi=3DkJSix=3Df3787ULZnaCy_Y26Phdhy=
5y9fat_vkDuUw@mail.gmail.com/
> >
> > v2:
> > make full dtbs multiline for better readability
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/d=
ts/mediatek/Makefile
> > index c99c3372a4b5..24eeba0703ce 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -8,11 +8,33 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
> > +
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtbo
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> > +mt7986a-bananapi-bpi-r3-emmc-nand-dtbs :=3D \
> > +	mt7986a-bananapi-bpi-r3.dtb \
> > +	mt7986a-bananapi-bpi-r3-emmc.dtbo \
> > +	mt7986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nand.dt=
b
> > +mt7986a-bananapi-bpi-r3-emmc-nor-dtbs :=3D \
> > +	mt7986a-bananapi-bpi-r3.dtb \
> > +	mt7986a-bananapi-bpi-r3-emmc.dtbo \
> > +	mt7986a-bananapi-bpi-r3-nor.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nor.dtb
> > +mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D \
> > +	mt7986a-bananapi-bpi-r3.dtb \
> > +	mt7986a-bananapi-bpi-r3-sd.dtbo \
> > +	mt7986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand.dtb
> > +mt7986a-bananapi-bpi-r3-sd-nor-dtbs :=3D \
> > +	mt7986a-bananapi-bpi-r3.dtb \
> > +	mt7986a-bananapi-bpi-r3-sd.dtbo \
> > +	mt7986a-bananapi-bpi-r3-nor.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nor.dtb
> > +
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8167-pumpkin.dtb
>
>
>

