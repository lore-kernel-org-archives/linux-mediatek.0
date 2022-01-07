Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10710C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpR5UX5IJcBRJdkLTVQUD711dS5hXXH16SP/HT0tz58=; b=Gc0mLEKtjxJxF6
	Jz5QQroTElOO9l3BvHiNqzQZNRTO4HHBv41O7B/kQOoxRPRbV7fNWwRFTlPikgGT3MjiR29Zute07
	km4NtU+OSaBHReYZDWjx9AeD3aCC65R5GTRRspIC+PLXmcIyIrfEkVERLy66Ko4h4k74sqfcbCJcJ
	IbV5hgTATLNyiEIzmuVar10D7C3RGJXUxfK6rezF8Ttz4EmXz/w5sPM1m+1iVYLy1MdwjOYuF5iwM
	LY/5NIW4rswBG3sd0pdKCaiRbYc3OLlGoZ21O4ah+rQXeDs9vR8Kv/fzFffmQWQuYjfPB1J+iO81z
	SmayziPo3WCqCb5ijA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5i97-002VhO-93; Fri, 07 Jan 2022 05:50:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5i2a-002T5Z-H7; Fri, 07 Jan 2022 05:43:57 +0000
X-UUID: 19a891a42d254fa7bfcb307e30bfc3fc-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cbDgxh+v1y3ibzSaizANVC9o0S2VL95EECWaCYZjG5A=; 
 b=ipWqoMn8uvKweoMBB0tWBdfK/jHRiaNAYZwm3eeE4z7n4huh1Jk2S+uJ8ADQAfUqKeJczx4oAp6f2CTfGKZ0bJOAw92Bv0Hzvp2rny+1Id/hOnG1WRmPpTgoOqB8Hw9KCPwqYK9GiKERxGoa/NDmfPhZjPh5GL9mgOltB/P1dl0=;
X-UUID: 19a891a42d254fa7bfcb307e30bfc3fc-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 576965084; Thu, 06 Jan 2022 22:43:47 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 21:43:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Jan 2022 13:43:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Jan 2022 13:43:37 +0800
Message-ID: <6dd101e4e65ef56dbf81d67496a383a7db8cefb5.camel@mediatek.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: Add mediatek SoC mt8195 and
 evaluation board
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
CC: <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
 <matthias.bgg@gmail.com>, <broonie@kernel.org>, <bgolaszewski@baylibre.com>,
 <sean.wang@mediatek.com>, <bayi.cheng@mediatek.com>, <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Seiya Wang
 <seiya.wang@mediatek.com>
Date: Fri, 7 Jan 2022 13:43:37 +0800
In-Reply-To: <18c342b20ccac520eabe8019562432030ddfe017.camel@mediatek.com>
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-5-tinghan.shen@mediatek.com>
 <CAGXv+5GaFikojqYYv0TfQsz3NSqn7QPmTWyCJY8V2g8UYoV4OA@mail.gmail.com>
 <18c342b20ccac520eabe8019562432030ddfe017.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_214352_692843_C3441290 
X-CRM114-Status: GOOD (  29.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-01-06 at 19:14 +0800, Tinghan Shen wrote:
> On Thu, 2021-12-23 at 17:59 +0800, Chen-Yu Tsai wrote:
> > Hi,
> > 
> > On Mon, Dec 20, 2021 at 8:20 PM Tinghan Shen <
> > tinghan.shen@mediatek.com> wrote:
> > > 
> > > Add basic chip support for mediatek mt8195.
> > > 
> > > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/Makefile       |    1 +
> > >  arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  209 ++++
> > >  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 1034
> > > +++++++++++++++++++
> > >  3 files changed, 1244 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> > > b/arch/arm64/boot/dts/mediatek/Makefile
> > > index 4f68ebed2e31..7aa08bb4c078 100644
> > > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > > @@ -32,4 +32,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-
> > > krane-sku0.dtb
> > >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> > >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> > >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> > > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> > >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > > b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > > new file mode 100644
> > > index 000000000000..e581c6bbead6
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > > @@ -0,0 +1,209 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright (C) 2021 MediaTek Inc.
> > > + * Author: Seiya Wang <seiya.wang@mediatek.com>
> > > + */
> > > +/dts-v1/;
> > > +#include "mt8195.dtsi"
> > > +
> > > +/ {
> > > +       model = "MediaTek MT8195 evaluation board";
> > > +       compatible = "mediatek,mt8195-evb", "mediatek,mt8195";
> > > +
> > > +       aliases {
> > > +               serial0 = &uart0;
> > > +       };
> > > +
> > > +       chosen {
> > > +               stdout-path = "serial0:921600n8";
> > > +       };
> > > +
> > > +       memory@40000000 {
> > > +               device_type = "memory";
> > > +               reg = <0 0x40000000 0 0x80000000>;
> > > +       };
> > > +};
> > > +
> > > +&auxadc {
> > > +       status = "okay";
> > > +};
> > > +
> > > +&i2c0 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&i2c0_pin>;
> > > +       clock-frequency = <100000>;
> > > +       status = "okay";
> > > +};
> > > +
> > > +&i2c1 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&i2c1_pin>;
> > > +       clock-frequency = <400000>;
> > > +       status = "okay";
> > > +};
> > > +
> > > +&i2c2 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&i2c2_pin>;
> > > +       status = "disabled";
> > > +};
> > > +
> > > +&i2c3 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&i2c3_pin>;
> > > +       status = "disabled";
> > > +};
> > 
> > Is there any reason in particular to list "disabled" devices here?
> > Are they part of some GPIO header? If they are not accessible, then
> > it's better to not list them. If they are, please leave a comment
> > about it.
> > 
> > > +
> > > +&i2c4 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&i2c4_pin>;
> > > +       clock-frequency = <400000>;
> > > +       status = "okay";
> > > +};
> > > +
> > > +&i2c5 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&i2c5_pin>;
> > > +       status = "disabled";
> > > +};
> > > +
> > > +&i2c6 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&i2c6_pin>;
> > > +       clock-frequency = <400000>;
> > > +       status = "disabled";
> > > +};
> > 
> > Same here.
> > 
> > > +
> > > +&nor_flash {
> > > +       status = "okay";
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&nor_pins_default>;
> > 
> > Please add an empty line between properties and child device nodes.
> > It helps
> > with readability and also fits the style of other parts and other
> > DT
> > files.
> > 
> > > +       flash@0 {
> > > +               compatible = "jedec,spi-nor";
> > > +               reg = <0>;
> > > +               spi-max-frequency = <50000000>;
> > > +       };
> > > +};
> > > +
> > > +&pio {
> > > +       i2c0_pin: i2c0-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
> > > +                                <PINMUX_GPIO9__FUNC_SCL0>;
> > > +                       bias-pull-up = <1>;
> > > +                       mediatek,rsel = <7>;
> > 
> > Please use the MTK_PULL_SET_RSEL_* macros with the bias-pull-*
> > properties.
> > We spent a lot of time defining those.
> > 
> > > +                       mediatek,drive-strength-adv = <0>;
> > 
> > This property is not part of the DT binding.
> > 
> > > +                       drive-strength = <MTK_DRIVE_6mA>;
> > 
> > Please just use raw numbers here. MTK_DRIVE_6mA just translates to
> > 6.
> > The binding already specifies mA as the unit for "drive-strength".
> > 
> > > +               };
> > > +       };
> > 
> > Above comments apply to all the other "pins" nodes.
> > 
> > Please add an empty line between different child device nodes. It
> > helps
> > with readability and also fits the style of other parts and other
> > DT
> > files.
> > 
> > > +       i2c1_pin: i2c1-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO10__FUNC_SDA1>,
> > > +                                <PINMUX_GPIO11__FUNC_SCL1>;
> > > +                       bias-pull-up = <1>;
> > > +                       mediatek,rsel = <7>;
> > > +                       mediatek,drive-strength-adv = <0>;
> > > +                       drive-strength = <MTK_DRIVE_6mA>;
> > > +               };
> > > +       };
> > > +       i2c2_pin: i2c2-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
> > > +                                <PINMUX_GPIO13__FUNC_SCL2>;
> > > +                       bias-pull-up = <1>;
> > > +                       mediatek,rsel = <7>;
> > > +                       mediatek,drive-strength-adv = <7>;
> > > +               };
> > > +       };
> > > +       i2c3_pin: i2c3-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO14__FUNC_SDA3>,
> > > +                                <PINMUX_GPIO15__FUNC_SCL3>;
> > > +                       bias-pull-up = <1>;
> > > +                       mediatek,rsel = <7>;
> > > +                       mediatek,drive-strength-adv = <7>;
> > > +               };
> > > +       };
> > > +       i2c4_pin: i2c4-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO16__FUNC_SDA4>,
> > > +                                <PINMUX_GPIO17__FUNC_SCL4>;
> > > +                       bias-pull-up = <1>;
> > > +                       mediatek,rsel = <7>;
> > > +                       mediatek,drive-strength-adv = <7>;
> > > +               };
> > > +       };
> > > +       i2c5_pin: i2c5-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO29__FUNC_SCL5>,
> > > +                                <PINMUX_GPIO30__FUNC_SDA5>;
> > > +                       bias-pull-up = <1>;
> > > +                       mediatek,rsel = <7>;
> > > +                       mediatek,drive-strength-adv = <7>;
> > > +               };
> > > +       };
> > > +       i2c6_pin: i2c6-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO25__FUNC_SDA6>,
> > > +                                <PINMUX_GPIO26__FUNC_SCL6>;
> > > +                       bias-pull-up = <1>;
> > > +               };
> > > +       };
> > > +       i2c7_pin: i2c7-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO27__FUNC_SCL7>,
> > > +                                <PINMUX_GPIO28__FUNC_SDA7>;
> > > +                       bias-pull-up = <1>;
> > > +               };
> > > +       };
> > > +       nor_pins_default: nor-pins {
> > > +               pins0 {
> > > +                       pinmux =
> > > <PINMUX_GPIO142__FUNC_SPINOR_IO0>,
> > > +                                        <PINMUX_GPIO141__FUNC_SP
> > > IN
> > > OR_CK>,
> > > +                                        <PINMUX_GPIO143__FUNC_SP
> > > IN
> > > OR_IO1>;
> > > +                       bias-pull-down;
> > > +               };
> > > +               pins1 {
> > > +                       pinmux =
> > > <PINMUX_GPIO140__FUNC_SPINOR_CS>,
> > > +                                    <PINMUX_GPIO130__FUNC_SPINOR
> > > _I
> > > O2>,
> > > +                                    <PINMUX_GPIO131__FUNC_SPINOR
> > > _I
> > > O3>;
> > > +                       bias-pull-up;
> > > +               };
> > > +       };
> > > +       uart0_pin: uart0-pins {
> > > +               pins {
> > > +                       pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
> > > +                               <PINMUX_GPIO99__FUNC_URXD0>;
> > > +               };
> > > +       };
> > > +};
> > > +
> > > +&u2port0 {
> > > +       status = "okay";
> > > +};
> > > +
> > > +&u2port1 {
> > > +       status = "okay";
> > > +};
> > > +
> > > +&u3phy0 {
> > > +       status="okay";
> > > +};
> > > +
> > > +&u3phy1 {
> > > +       status="okay";
> > > +};
> > > +
> > > +&u3port0 {
> > > +       status = "okay";
> > > +};
> > > +
> > > +&u3port1 {
> > > +       status = "okay";
> > > +};
No need add status property for those u*port* subnodes, add it in
parent node u*phy* is enough.

Thanks

> > > +
> > > +&uart0 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&uart0_pin>;
> > > +       status = "okay";
> > > +};
> > > 
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
