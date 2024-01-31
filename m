Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9A4C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SdT+kMMS7pKNh3tITSk53PjT41YklJL6IAyVaGSsU8=; b=qTqWjs/ei86+drGQRV2fhWRC2M
	EaswVXOrJ3q2Lgx5isXmeILtcDsGYnVMIjbmq5z6IvSaPMsir8tqHnVkNduU7ayNHcNKCROP+1rKO
	ZuI8k1/9jRGgmXcikrpeF5O/V3w1OisVyvP9Dov93KevhpfJ79avddWf18AdfrhHwzhxHT4wWyqae
	d/XCmlq9ZYiNBKRR8BnUlqs6h12yzauCQL41kxQSYJKx2Uzn72cJKjPa+jhYq9TRCCf/EZg7tWYuG
	J216jFKtvDHEeJ6/wLkDMok4ycB8gpudi55nkPi6XjLuNkJWRNoTfRbesp+P6t3H8WqEarnuXSuUT
	zfNt3tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4na-00000001kdF-3eTd;
	Wed, 31 Jan 2024 07:14:18 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV4nX-00000001kbH-3c1C
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 07:14:17 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5102a877d50so5428323e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 23:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706685254; x=1707290054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SdT+kMMS7pKNh3tITSk53PjT41YklJL6IAyVaGSsU8=;
        b=bolWsfGj8kL2iaLEPyka6cXx50ciY031FqiwjtXBJVRYaHg+C91Eaab9ZWIdEZSV5g
         C2QYmsv64VzezYRna7Yb2lo5/3pFfjf2sGt4bGaIym+yHBCGyr8wzzh0OzPkXBz7nUJp
         OzxP2i8bLvMBsMosbtOdAZJL+mzYhnTY8KM7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685254; x=1707290054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SdT+kMMS7pKNh3tITSk53PjT41YklJL6IAyVaGSsU8=;
        b=eml+6cP1xwHVjintK4lOGKkY0wMLmrXgwbdkIkAHWTPRFy5M1a3jIN2CPUNtk62XAU
         qf+KJG67VFHgqMetti0T5JTHuNv06ezHa2hTeaTUvCb7cHO7WbiOWokubg0j3zWf8T7l
         6TzbxgWtrVdfV7sipqMr/sfyw0icgVvB7CA0gZTM1B6LbC41mHy0Z++PwDJf7RbTdP53
         sW6vtEaxImmHCRiKZ9X8Te45oh2eFOw4i6kYuqpfAW+3KsbR0giGCqHKCleInA9X0Kuv
         oN1yp7LxirE7oBzLEfpdRC+oeP/1OfTeesB04AebqyAvmkCY6sTEKK7GBymuiVLhAHDw
         UnPA==
X-Gm-Message-State: AOJu0Yzhw50SyRuBnToLT/xhI4/uovy7dmNJAvHWcprw8jSIeck3YJTa
	EN25d89S/kSAtkBHmqlY08GzWIOACvaix/GB2tQCV2U+mdnPVsjZT9G5TyB55ITZK3I11zqb2HD
	J+0ZTS2c2UEu2QiS/xivzfr6H18liOFlc7Yv3
X-Google-Smtp-Source: AGHT+IEGwV67FLONdWIax5SkjacKjnKU7tRRx9CowvW4B3C9QDqVGIhm4ETxaukmN+j6z+ZNnZGb7SS8+h7LvCNH0S8=
X-Received: by 2002:a05:6512:481a:b0:511:19af:f84 with SMTP id
 eo26-20020a056512481a00b0051119af0f84mr522489lfb.25.1706685253595; Tue, 30
 Jan 2024 23:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20240115084336.938426-1-angelogioacchino.delregno@collabora.com> <a79fa347-f42d-49a3-9faf-40fbefb69998@collabora.com>
In-Reply-To: <a79fa347-f42d-49a3-9faf-40fbefb69998@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 31 Jan 2024 15:14:02 +0800
Message-ID: <CAGXv+5F=9iQDo_=PQeNB06Wc-Rav3yODEkwX-h02CpoChCzkOA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add MTU3 nodes and
 correctly describe USB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_231415_918570_00EC2DEF 
X-CRM114-Status: GOOD (  29.52  )
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

On Tue, Jan 30, 2024 at 7:32=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 15/01/24 09:43, AngeloGioacchino Del Regno ha scritto:
> > The MT8195 SoC has four USB controllers: only one is a direct path to
> > a XHCI controller, while the other three (0, 2 and 3) are behind the
> > MTU3 DRD controller instead!
> >
> > Add the missing MTU3 nodes, default disabled, for controllers 0, 2 and
> > 3 and move the related XHCI nodes to be children of their MTU3 DRD to
> > correctly describe the SoC.
> >
> > In order to retain USB functionality on all of the MT8195 and MT8395
> > boards, also move the vusb33 supply and enable the relevant MTU3 nodes
> > with special attention to the MT8195 Cherry Chromebook, where it was
> > necessary to set the dr_mode of all MTU3 controllers to host to avoid
> > interfering with the EC performing DRD on its own.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>
> Hello Chen-Yu,
>
> even though I've carefully tested that on my MT8195 Chromebook, can you p=
lease
> check this one?

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> Four eyes are better than two. :-)
>
> P.S.: Sorry, I forgot to Cc you in the first submission....

No worries. I probably missed it as I was busy working on other devices.

> > ---
> >
> > Depends on [1]
> >
> > This patch was tested on a MT8395 board and on the MT8195 Cherry
> > Tomato Chromebook.
> >
> > [1]: https://lore.kernel.org/all/20240112133222.240038-1-angelogioacchi=
no.delregno@collabora.com
> >
> >   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  26 +++-
> >   arch/arm64/boot/dts/mediatek/mt8195-demo.dts  |  18 ++-
> >   arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  12 ++
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 125 +++++++++++------=
-
> >   .../dts/mediatek/mt8395-genio-1200-evk.dts    |  17 ++-
> >   5 files changed, 140 insertions(+), 58 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8195-cherry.dtsi
> > index a136bea99d9c..e563a2dc4cce 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > @@ -1293,11 +1293,32 @@ &uart0 {
> >       status =3D "okay";
> >   };
> >
> > +/*
> > + * For the USB Type-C ports the role and alternate modes switching is
> > + * done by the EC so we set dr_mode to host to avoid interfering.
> > + */

Actually the USB roles can't be changed. The external ports all connect
to a USB hub. And the internal devices are either the Bluetooth device
or the USB cameras in the lid. So they all only work in host mode.

BTW, I think xhci1 can be disabled. There's nothing connected to it.
And the SS lines are used for PCIe instead.

ChenYu

> > +&ssusb0 {
> > +     dr_mode =3D "host";
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb2 {
> > +     dr_mode =3D "host";
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb3 {
> > +     dr_mode =3D "host";
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> >   &xhci0 {
> >       status =3D "okay";
> >
> >       rx-fifo-depth =3D <3072>;
> > -     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> >       vbus-supply =3D <&usb_vbus>;
> >   };
> >
> > @@ -1311,8 +1332,6 @@ &xhci1 {
> >
> >   &xhci2 {
> >       status =3D "okay";
> > -
> > -     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> >       vbus-supply =3D <&usb_vbus>;
> >   };
> >
> > @@ -1321,7 +1340,6 @@ &xhci3 {
> >
> >       /* MT7921's USB Bluetooth has issues with USB2 LPM */
> >       usb2-lpm-disable;
> > -     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> >       vbus-supply =3D <&usb_vbus>;
> >   };
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/=
boot/dts/mediatek/mt8195-demo.dts
> > index 69c7f3954ae5..9872743f743f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > @@ -528,8 +528,22 @@ &u3phy3 {
> >       status =3D "okay";
> >   };
> >
> > -&xhci0 {
> > +&ssusb0 {
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb2 {
> >       vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb3 {
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&xhci0 {
> >       vbus-supply =3D <&otg_vbus_regulator>;
> >       status =3D "okay";
> >   };
> > @@ -540,11 +554,9 @@ &xhci1 {
> >   };
> >
> >   &xhci2 {
> > -     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> >       status =3D "okay";
> >   };
> >
> >   &xhci3 {
> > -     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> >       status =3D "okay";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/b=
oot/dts/mediatek/mt8195-evb.dts
> > index 690dc7717f2c..341b6e074139 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > @@ -160,6 +160,18 @@ &uart0 {
> >       status =3D "okay";
> >   };
> >
> > +&ssusb0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb2 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb3 {
> > +     status =3D "okay";
> > +};
> > +
> >   &xhci0 {
> >       status =3D "okay";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8195.dtsi
> > index 152cc0b191bb..45f278efd946 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1349,29 +1349,40 @@ queue3 {
> >                       };
> >               };
> >
> > -             xhci0: usb@11200000 {
> > -                     compatible =3D "mediatek,mt8195-xhci",
> > -                                  "mediatek,mtk-xhci";
> > -                     reg =3D <0 0x11200000 0 0x1000>,
> > -                           <0 0x11203e00 0 0x0100>;
> > +             ssusb0: usb@11201000 {
> > +                     compatible =3D "mediatek,mt8195-mtu3", "mediatek,=
mtu3";
> > +                     reg =3D <0 0x11201000 0 0x2dff>, <0 0x11203e00 0 =
0x0100>;
> >                       reg-names =3D "mac", "ippc";
> > -                     interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > -                     phys =3D <&u2port0 PHY_TYPE_USB2>,
> > -                            <&u3port0 PHY_TYPE_USB3>;
> > -                     assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP>,
> > -                                       <&topckgen CLK_TOP_SSUSB_XHCI>;
> > -                     assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>,
> > -                                              <&topckgen CLK_TOP_UNIVP=
LL_D5_D4>;
> > +                     ranges =3D <0 0 0 0x11200000 0 0x3f00>;
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <2>;
> > +                     interrupts =3D <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0=
>;
> >                       clocks =3D <&infracfg_ao CLK_INFRA_AO_SSUSB>,
> >                                <&topckgen CLK_TOP_SSUSB_REF>,
> > -                              <&apmixedsys CLK_APMIXED_USB1PLL>,
> > -                              <&clk26m>,
> >                                <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
> > -                     clock-names =3D "sys_ck", "ref_ck", "mcu_ck", "dm=
a_ck",
> > -                                   "xhci_ck";
> > -                     mediatek,syscon-wakeup =3D <&pericfg 0x400 103>;
> > +                     clock-names =3D "sys_ck", "ref_ck", "mcu_ck";
> > +                     phys =3D <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_=
TYPE_USB3>;
> >                       wakeup-source;
> > +                     mediatek,syscon-wakeup =3D <&pericfg 0x400 103>;
> >                       status =3D "disabled";
> > +
> > +                     xhci0: usb@0 {
> > +                             compatible =3D "mediatek,mt8195-xhci", "m=
ediatek,mtk-xhci";
> > +                             reg =3D <0 0 0 0x1000>;
> > +                             reg-names =3D "mac";
> > +                             interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVE=
L_HIGH 0>;
> > +                             assigned-clocks =3D <&topckgen CLK_TOP_US=
B_TOP>,
> > +                                               <&topckgen CLK_TOP_SSUS=
B_XHCI>;
> > +                             assigned-clock-parents =3D <&topckgen CLK=
_TOP_UNIVPLL_D5_D4>,
> > +                                                      <&topckgen CLK_T=
OP_UNIVPLL_D5_D4>;
> > +                             clocks =3D <&infracfg_ao CLK_INFRA_AO_SSU=
SB>,
> > +                                      <&topckgen CLK_TOP_SSUSB_REF>,
> > +                                      <&apmixedsys CLK_APMIXED_USB1PLL=
>,
> > +                                      <&clk26m>,
> > +                                      <&infracfg_ao CLK_INFRA_AO_SSUSB=
_XHCI>;
> > +                             clock-names =3D "sys_ck", "ref_ck", "mcu_=
ck", "dma_ck", "xhci_ck";
> > +                             status =3D "disabled";
> > +                     };
> >               };
> >
> >               mmc0: mmc@11230000 {
> > @@ -1452,52 +1463,68 @@ xhci1: usb@11290000 {
> >                       status =3D "disabled";
> >               };
> >
> > -             xhci2: usb@112a0000 {
> > -                     compatible =3D "mediatek,mt8195-xhci",
> > -                                  "mediatek,mtk-xhci";
> > -                     reg =3D <0 0x112a0000 0 0x1000>,
> > -                           <0 0x112a3e00 0 0x0100>;
> > +             ssusb2: usb@112a1000 {
> > +                     compatible =3D "mediatek,mt8195-mtu3", "mediatek,=
mtu3";
> > +                     reg =3D <0 0x112a1000 0 0x2dff>, <0 0x112a3e00 0 =
0x0100>;
> >                       reg-names =3D "mac", "ippc";
> > -                     interrupts =3D <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > -                     phys =3D <&u2port2 PHY_TYPE_USB2>;
> > -                     assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP_2P=
>,
> > -                                       <&topckgen CLK_TOP_SSUSB_XHCI_2=
P>;
> > -                     assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>,
> > -                                              <&topckgen CLK_TOP_UNIVP=
LL_D5_D4>;
> > +                     ranges =3D <0 0 0 0x112a0000 0 0x3f00>;
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <2>;
> > +                     interrupts =3D <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > +                     assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP_2P=
>;
> > +                     assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>;
> >                       clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>=
,
> >                                <&topckgen CLK_TOP_SSUSB_P2_REF>,
> > -                              <&clk26m>,
> > -                              <&clk26m>,
> >                                <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
> > -                     clock-names =3D "sys_ck", "ref_ck", "mcu_ck", "dm=
a_ck",
> > -                                   "xhci_ck";
> > -                     mediatek,syscon-wakeup =3D <&pericfg 0x400 105>;
> > +                     clock-names =3D "sys_ck", "ref_ck", "mcu_ck";
> > +                     phys =3D <&u2port2 PHY_TYPE_USB2>;
> >                       wakeup-source;
> > +                     mediatek,syscon-wakeup =3D <&pericfg 0x400 105>;
> >                       status =3D "disabled";
> > +
> > +                     xhci2: usb@0 {
> > +                             compatible =3D "mediatek,mt8195-xhci", "m=
ediatek,mtk-xhci";
> > +                             reg =3D <0 0 0 0x1000>;
> > +                             reg-names =3D "mac";
> > +                             interrupts =3D <GIC_SPI 533 IRQ_TYPE_LEVE=
L_HIGH 0>;
> > +                             assigned-clocks =3D <&topckgen CLK_TOP_SS=
USB_XHCI_2P>;
> > +                             assigned-clock-parents =3D <&topckgen CLK=
_TOP_UNIVPLL_D5_D4>;
> > +                             clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB=
_2P_XHCI>;
> > +                             clock-names =3D "sys_ck";
> > +                             status =3D "disabled";
> > +                     };
> >               };
> >
> > -             xhci3: usb@112b0000 {
> > -                     compatible =3D "mediatek,mt8195-xhci",
> > -                                  "mediatek,mtk-xhci";
> > -                     reg =3D <0 0x112b0000 0 0x1000>,
> > -                           <0 0x112b3e00 0 0x0100>;
> > +             ssusb3: usb@112b1000 {
> > +                     compatible =3D "mediatek,mt8195-mtu3", "mediatek,=
mtu3";
> > +                     reg =3D <0 0x112b1000 0 0x2dff>, <0 0x112b3e00 0 =
0x0100>;
> >                       reg-names =3D "mac", "ippc";
> > -                     interrupts =3D <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > -                     phys =3D <&u2port3 PHY_TYPE_USB2>;
> > -                     assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP_3P=
>,
> > -                                       <&topckgen CLK_TOP_SSUSB_XHCI_3=
P>;
> > -                     assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>,
> > -                                              <&topckgen CLK_TOP_UNIVP=
LL_D5_D4>;
> > +                     ranges =3D <0 0 0 0x112b0000 0 0x3f00>;
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <2>;
> > +                     interrupts =3D <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > +                     assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP_3P=
>;
> > +                     assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>;
> >                       clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>=
,
> >                                <&topckgen CLK_TOP_SSUSB_P3_REF>,
> > -                              <&clk26m>,
> > -                              <&clk26m>,
> >                                <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
> > -                     clock-names =3D "sys_ck", "ref_ck", "mcu_ck", "dm=
a_ck",
> > -                                   "xhci_ck";
> > -                     mediatek,syscon-wakeup =3D <&pericfg 0x400 106>;
> > +                     clock-names =3D "sys_ck", "ref_ck", "mcu_ck";
> > +                     phys =3D <&u2port3 PHY_TYPE_USB2>;
> >                       wakeup-source;
> > +                     mediatek,syscon-wakeup =3D <&pericfg 0x400 106>;
> >                       status =3D "disabled";
> > +
> > +                     xhci3: usb@0 {
> > +                             compatible =3D "mediatek,mt8195-xhci", "m=
ediatek,mtk-xhci";
> > +                             reg =3D <0 0 0 0x1000>;
> > +                             reg-names =3D "mac";
> > +                             interrupts =3D <GIC_SPI 536 IRQ_TYPE_LEVE=
L_HIGH 0>;
> > +                             assigned-clocks =3D <&topckgen CLK_TOP_SS=
USB_XHCI_3P>;
> > +                             assigned-clock-parents =3D <&topckgen CLK=
_TOP_UNIVPLL_D5_D4>;
> > +                             clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB=
_3P_XHCI>;
> > +                             clock-names =3D "sys_ck";
> > +                             status =3D "disabled";
> > +                     };
> >               };
> >
> >               pcie0: pcie@112f0000 {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/a=
rch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> > index 7fc515a07c65..1558649f633c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> > @@ -880,6 +880,21 @@ &ufsphy {
> >       status =3D "disabled";
> >   };
> >
> > +&ssusb0 {
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb2 {
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssusb3 {
> > +     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> > +     status =3D "okay";
> > +};
> > +
> >   &xhci0 {
> >       status =3D "okay";
> >   };
> > @@ -890,11 +905,9 @@ &xhci1 {
> >   };
> >
> >   &xhci2 {
> > -     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> >       status =3D "okay";
> >   };
> >
> >   &xhci3 {
> > -     vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> >       status =3D "okay";
> >   };
>
>

