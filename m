Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0256C4321E
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Nov 2022 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQwB/JBJ/XZPwHF1ARcUG+jD0zAQYuqEQVMirWksyuA=; b=cir7OxGGOVBnGc0Ng/QmyF5gus
	iHhk4VJ3bgJrdNexGoCBoxjReCNU4CMjkVxVJA5QuM/W/IiEYbrmlUeFtcs2iz47+uru895HGC23G
	HP+3AJ724MN+vMunoYzd39yh7m1EvJ/Ft7Z6grkCaQfOc68Qla2tjBk7HRevTo2hfk1cqPn37jQdX
	zos93qUJr33vGo1m5CHloV8V4k3GeDV3XXzeviZkeaNZxTqj0LU0920OS57IrHrLTP3cBnrG894ce
	m1fe3h23E/2ametE9JI0adtgFoUzGfQqz8/QuNewlfH65isX8EB470QxjfrOjYiFftUkPeV1aHNLD
	GlUzMRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oywet-006hTX-HP; Sat, 26 Nov 2022 14:59:59 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyweq-006hQg-1h
	for linux-mediatek@lists.infradead.org; Sat, 26 Nov 2022 14:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1669474784;
	bh=RNSv4SIs2zo1AdfeNU1ksjPBHIIUMlwnY95Zm8eFPUk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fJ8WGFbDDtH0hwtI9xAeYZHmxWoknzI+15B7vGglWUKQFZ6wJocVgz+i4olYifOBZ
	 AChrr/OiBBjhG9scgJc/bfevsNZgQIAxy9+Be1uZBiChJycaesYYP9t4rzCFsCQa4k
	 7A/IdiZ6Dyg7U6kn6WiPulJ8wjFJQ0ISjo5VfI2mwkjIyH3Bfjsxfg4cDFWVG92Ih7
	 YNVIUr6SaqIYTG2ikuS3M49ok18dIge2yvgiY6XVekYm1V9gVdO6SlBj699OlL4/NE
	 W2MIGaqjSVy6ZtScyB/2WtbGqRWBcq109QG/QUqFiW/psfKwB2mO7Qg+kDFwmG8Ohz
	 +PIuNcDYMS/UQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.149.54] ([217.61.149.54]) by web-mail.gmx.net
 (3c-app-gmx-bs18.server.lan [172.19.170.70]) (via HTTP); Sat, 26 Nov 2022
 15:59:44 +0100
MIME-Version: 1.0
Message-ID: <trinity-51c09159-9b2d-44a6-8e9d-3457482a2add-1669474784280@3c-app-gmx-bs18>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor
 overlays
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Nov 2022 15:59:44 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221120161251.GA3133853-robh@kernel.org>
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-12-linux@fw-web.de>
 <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
 <99114D73-22EF-43CD-848E-88A37B29B953@public-files.de>
 <CAL_JsqKz1qQFZnStLnApraJvp=-cQoW6x5=p7-GBcftYKVMErg@mail.gmail.com>
 <192D4414-DC88-4321-BB2A-4345C48E3C12@fw-web.de>
 <20221120161251.GA3133853-robh@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:bE1+R5pth/2o+smspuRfgqVxzZ+8BLUNYuZqCiSo/s/9CEKrcosvBBcHsm2Qec80HsmxD
 F1oOHmdjpBTTbIhjBzkXgaNXpvOg8rtOvqdnxLHyxQf9vvgdYhZ/pknNkfxQHcgLG/Bwlb+vnFyF
 2fF/l6QGLv9nBDjAS7DKQsukY9ktN67wUi6Sdf+pbtfoK+hGx/Fb/vhCXHRN91wwhHXVliilhgyd
 KFRJqiTmafRxrUIsTpvmDMXI8T5GtpJXGgLsCSHByFm5Gl7dQ9g02BZT9vZM5GX7gWoyYDdkgq2y
 U8=
UI-OutboundReport: notjunk:1;M01:P0:yuil9trDw48=;eUWyK+WHv+ulRIx0Xqjpxv13BTX
 rUmUrl4ZMjWFJWNGo1FyDMJoMeCG6HkMxwP8l6N2UFfOE2YYf4bAlAgJWJKFrJxnQehg8byA7
 kFxVNcq5qvXvbiZhNE76YmFrAfl8KyrgyXuKg2NHoc6MR46C05YffQ9XB0dDZvcNbehjwcfQb
 p1TG3f6y1ryVHSOHhsHNe25d3Kp6bcZpHuK4sANU6fgnTOxK6wJl3YzoaflR7kbGz/ACK8JGr
 HyaiFZHdCSYzffDCUWKuJ0wxQFPJ32uPC0c+i7zZ5qHWXeVpjl82pjgvwthK2xn4z/ZADYS8H
 p3bSRAS91JhouUkdSBl/11rA0LyWroeFMbG6i2YqeHiyMu9rwU4zk8MVqyMeiAQ8B4bCUi7Vi
 5Fx8aKThUqXJWLkptuRYS3inm8NRNg3EsQGWpfr4hBRArtOQjrHNwvR72a5AnOO3MYBUATftl
 uKrskO1M2JdAHaiKdlWZEvPaxvkzUuKsqYfiRy7StxNRA1pgnkmoIepgx+n4nsvPC1YjgirKS
 3LA5mGL+XBjAqkPQTexK5DfnkGuOeS7b5h2grdUKz/RsXa2XER1f7SxS37bNUx5JhBjz19LJS
 s3jmlXOPBy6UdVEMrmp62/WKo+T6r+anWa/rk8u4JSlrnma5CYaHo7X5b99eiv3ibHIlV7DQi
 +R6nPobW7omyaIrwzvhMIhIWHPX4YL7fzqkc+V3PxFlpvZwLeV8ehkKVTWD3Op1aOt20rkD8G
 01HKL6yznANnuOUPo5SN4BKVgk5L/orf2bm9KFEFvIVz5+aEOiFF9wQrJLaNc5kcYtsKHf8Mt
 E+kCVF8kK/jGgv/PcF5OS8yA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_065956_490313_8462DA1C 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

> Gesendet: Sonntag, 20. November 2022 um 17:12 Uhr
> Von: "Rob Herring" <robh@kernel.org>

> > Or should these overlays only duplicated and either include sd dts or emmc dts (but this creates again redundant code)?
> > >> >> --- a/arch/arm64/boot/dts/mediatek/Makefile
> > >> >> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > >> >> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> > >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> > >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> > >> >>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
> > >> >> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> > >> >> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> > >> >
> > >> >These need rules to apply them to the base dtb(s). You just need:
> > >> >
> > >> >full.dtb := base.dtb overlay.dtb
> > >> >dtb-y += full.dtb

Hi,

(removed most recipients to not spam all people with this)

have now locally changed sd+emmc to overlays too and renamed to dtso...
tried also this way to (arch/arm64/boot/dts/mediatek/Makefile):

dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo

mt7986a-bananapi-bpi-r3-sd-nand.dtb := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nand.dtb

does not work:

make[3]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb', needed by 'arch/arm64/boot/dts/mediatek/'.  Stop.

any thoughts? but this way i will need all possible combinations, i guess best way it to leave the overlays themselves.

regards Frank

