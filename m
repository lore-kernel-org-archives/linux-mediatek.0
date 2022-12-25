Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A8FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2/SmOJW+fkk74tqypiaCsSzjv667+pDRrZxpdHI4jg=; b=cUwRfQi4dLqmra52TBJIDB+jnn
	n5JSty/zvmn/OW0hbo7CeSiMCU5xq9oC7dPb00lC6vyDUvewKDEDdDmEPQq/nQrGPxXEVcMyTnQZc
	ja/46PYM8PBV1Tw3cwmvACD6Gz1edecWUedSx5/lJiTCK8Uf+yJ2jcgSN/qmulntSpZL/mPx5rTa9
	e645JtiQKX3sIB9HCFzXdAFCYIWnaxs4U1wqGiDkAeUWJMYbzp0xSnEdnOM1dI253JxlF/WJmQna6
	HDdYXeYu8Le6SBOy5llIPA8N6natv/Gx/wkF3VIl8ttb6wBy/NCIn4W2/GF+JOw7AOfYiGPG5hA3n
	a294SR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9qTg-005f3f-UK; Mon, 26 Dec 2022 16:37:29 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9PTj-00AdCk-EW; Sun, 25 Dec 2022 11:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1671968822;
	bh=cigTGUVAg3Yj9PBuOXrP7a8GktisvMkb4W/saccjwJQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ma/xkta6H/Vvu8O4rhc4uZyrSkGoLzcj0u3e+4+TsD4ecPjO4RdiTm8nzUIpHBg8t
	 yODU1TLBIFTfdJLVBlQPzfNkaUw4INHVjuJ4gklf1gC+4NS7bQxFhZdLTJComCawxT
	 FoNsX+YKxX2QusrfdnIZzotnf9ovGBKNZvqERLVsG8XKa+QpTP+3jnz5cduXBc6ZJb
	 XDpzyAP8rRElSmXpRYqE6Flyu5JYhkA9jbHoa88IAt8F0oKr/i8WXIlnG/A1H+x37k
	 jIamcERWlvttUqlamw9zawJZdLhlNurOM2MxVzlYyQE7NYgmOINTAzmtKMDzqbr6AT
	 fINsT6KW8DG/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.225.172] ([157.180.225.172]) by web-mail.gmx.net
 (3c-app-gmx-bap38.server.lan [172.19.172.108]) (via HTTP); Sun, 25 Dec 2022
 12:47:02 +0100
MIME-Version: 1.0
Message-ID: <trinity-b51cbf64-8df3-4a0b-883a-dbb7443eb954-1671968822286@3c-app-gmx-bap38>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 linux-usb@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn
 Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org
Subject: Aw: Re: [next v7 8/8] arm64: dts: mt7986: add Bananapi R3
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Dec 2022 12:47:02 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <Y6dMWFy7gChG88j0@makrotopia.org>
References: <20221127114142.156573-1-linux@fw-web.de>
 <20221127114142.156573-9-linux@fw-web.de> <Y6dMWFy7gChG88j0@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:10CT/kHfUVpSwqOqwS7PiCBR0/UkRQWIuyHUPEIPBF4ZQybqHeav5erxkfhPt6CkPU6ev
 P2jwPeR/U1/CsU0cypsmIs4UKNmh6TMGRmE9N8BKS0TbhXVNMX4nifJlVBx0/sT+mC1DTHpe7Lm0
 ZWTvo5zBoXH7rzgei9CR+fXrJGdfl+LYJmaNbBJV9dJV3cfgTHqW/IWi9dXZWuu9PEWsGOdppoeX
 JFIMemszjkAeplliNJluXNK5PmagMPT+eXXsMkTHO3XWdQck6hJrq/ckQvChW3JNDndJB1bzqU4q
 GY=
UI-OutboundReport: notjunk:1;M01:P0:pwFcvI8EngI=;Xzb4kTlhYwuChZI1qpgA1uiBqPU
 0VRdCykSt9KTXu8yY9kmRrx7TUx5EFBj/CWBFLhFCAuUvqO+4VGvbUWKt0/ui4Stz591phL4x
 V6D2S/PlSOoK+x7PH/19JEuZKEr5cZZhv/LAaLdmWxmbQ6Ch8dMf/wUp1jZ/eXMG6DQ5sj46p
 EXO5bAt6xkRITCny9gY4QR1XL7ITdV97qUPfmQRubcACLurNRiTr1QjoIHgepkenO2tKABFEZ
 aJlUCiDQm5KNF8h4qRZgm+UrvL87097zlMkEmBYS0EhImEM4apgdFixunpgiN9VC0tE6hKIN0
 RulXsPDMfJyIbonqk8r0HLhEzVeqs6enS34vIqnFEbe8J51x8eU6Jg6NdGPFevExob8aDMeA5
 r4qRPKfr7LrlcIZgNnTPkmGZlLHG8op2cuELClFACNBxSYklDi61bGdcrGZ7zgWk3QN5sMjFd
 KlKgPUWpw5/2Ky/5xfMK3GT7p3vDoQsfCHWpotsshwNqzEVX7wneqQHwqgxD//E/bDFOw5OMa
 ok4obFcCNMkLzPS+ofYi4/P0dL4DeC2uH2WDbe3VoYjcV/6sH3jn/5XmyqldDIs+E5Djrt7LP
 QLVtrJzCxdBJwNbpDlCK6jlqsRSUyIk7Auv2qYiSoTNGfBqQuwpHW2LI5G2C0x3uOnx2kkzUP
 sFzbOVN9r/dTxS9JeWVf4mH3r5urzdXFrMvBaujgNVJ3jt6wvufj84Ejbe88doESaimya4+QF
 +jTNS8V4hj1DozC05FKDuBggiU2hqUxx5Q6lGPoMFa94cU4cBp5hYxx4dU5WsG6eYssc0MUJe
 v7pKBoXRZTACH/SOAAOVa4uzu3j406KqJjqu430gP7Hiw=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_034906_907866_3750B9C6 
X-CRM114-Status: GOOD (  18.53  )
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

Hi

> Gesendet: Samstag, 24. Dezember 2022 um 20:00 Uhr
> Von: "Daniel Golle" <daniel@makrotopia.org>

> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + * Author: Sam.Shih <sam.shih@mediatek.com>
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +	compatible =3D "bananapi,bpi-r3", "mediatek,mt7986a";
> > +	model =3D "Bananapi BPI-R3 (emmc)";
>
> Why do you set the model string here?

seems to be a left over from testing where i wanted to see which base-dtb =
was
loaded without comparing mmc-node settings. Was easier to see with model-s=
tring :)

> > +
> > +	fragment@0 {
> > +		target-path =3D "/soc/mmc@11230000";
> > +		__overlay__ {
> > +			bus-width =3D <8>;
> > +			max-frequency =3D <200000000>;
> > +			cap-mmc-highspeed;
> > +			mmc-hs200-1_8v;
> > +			mmc-hs400-1_8v;
> > +			hs400-ds-delay =3D <0x14014>;
> > +			non-removable;
> > +			no-sd;
> > +			no-sdio;
> > +			status =3D "okay";
> > +		};
> > +	};
> > +};

> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts =
b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> > new file mode 100644
> > index 000000000000..618d3bb2f32f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts

> > +&mdio {
> > +	switch: switch@31 {
> > +		compatible =3D "mediatek,mt7531";
> > +		reg =3D <31>;
> > +		reset-gpios =3D <&pio 5 GPIO_ACTIVE_HIGH>;
>
> Please add:
>
>                 interrupt-controller;
>                 #interrupt-cells =3D <1>;
>                 interrupt-parent =3D <&pio>;
>                 interrupts =3D <66 IRQ_TYPE_LEVEL_HIGH>;
>
> to have IRQ driven phy status instead of having to poll the link status
> of the 5x rj-45 ports.
> The value comes from schematics (pin AD24, GPIO66, 7531_INT) and I've
> tested this on my board.

ok, if you have it tested i add these properties in next version (and test=
 it too).
I wait for tphy-binding to be applied to next (pcie and xhci already in to=
rvalds/master).

> > +	};
> > +};
> > +

> > +&spi0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&spi_flash_pins>;
> > +	cs-gpios =3D <0>, <0>;
>
> I don't think those bogus cs-gpios here and for spi1 below are needed.

can drop them in next version

> > +	status =3D "okay";
> > +};
> > +
> > +&spi1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&spic_pins>;
> > +	cs-gpios =3D <0>, <0>;
> > +	status =3D "okay";
> > +};
> > +

regards Frank

