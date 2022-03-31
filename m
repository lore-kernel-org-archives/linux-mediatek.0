Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD584C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76FQSK9HbIIXVUq4VMyuI/wBkHjiDb+AkCFKvCC5jz4=; b=l7Oo54xc/wwmIT
	NfLfHS8owaZvFtFziWzjzrRew1Pjtk3NJuyK47nZUurAwTCjOANELe2Ckr9suqTu841zclme0j5ci
	hCsppVsdYKzMe4uA2NCFsSsPzX6ayTMd7vh6KIJBxf8zsVsbl7dejZOgCEzutmNjt27GuCyDvHE1t
	emHpCTTXWw+i80FxNpa67oti6HbEOBzh+i3l5j8dyoiIwEYLzOwOz+2jeOQrxtroejwOm+z5dhFHm
	+3mGqJ4xEomOcE+l+zIHvlLAGHJ7Mq3x0T+IhexXl7LNx2egp5x0z6DsMfo8e0tz0xhLrwYX5ajzM
	QkTzSAgu1+uKlGJ31tbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZpIc-0016yw-G2; Thu, 31 Mar 2022 07:32:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZpIL-0016tk-4x; Thu, 31 Mar 2022 07:32:40 +0000
X-UUID: b3eceeb3a5fa4d8cbcdeff7a6e960392-20220331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PeolYf6W+Nvcxnnamol+bdRBF8Y1GRDc5eAX8b+pdhs=; 
 b=QQp9uYKq+YJeSaaZz9+5iNjLhfny7M9Rr62jlTkhSBCtwNhei/ff7MRPbfkbXNZUmIfIzaWZY8uwA8Yl8FPVP1ZLHiix4N2bFh7AFKlrwNF4XYHPgzoJIv9GGOTWOhm1XFQtfmTgxkfh1hTh3s+9RSQyLGWSCx9iQS8mcFcwMhg=;
X-UUID: b3eceeb3a5fa4d8cbcdeff7a6e960392-20220331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 128422678; Thu, 31 Mar 2022 00:32:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 00:30:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 31 Mar 2022 15:29:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 15:29:58 +0800
Message-ID: <58f498a19f6c7be85823b2e2d5955272e78f0176.camel@mediatek.com>
Subject: Re: [PATCH v13 2/2] arm64: dts: Add mediatek SoC mt8195 and
 evaluation board
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, Seiya Wang <seiya.wang@mediatek.com>
Date: Thu, 31 Mar 2022 15:29:58 +0800
In-Reply-To: <20220330094532.21721-3-tinghan.shen@mediatek.com>
References: <20220330094532.21721-1-tinghan.shen@mediatek.com>
 <20220330094532.21721-3-tinghan.shen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_003238_633663_C4AA79EF 
X-CRM114-Status: GOOD (  18.64  )
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

On Wed, 2022-03-30 at 17:45 +0800, Tinghan Shen wrote:
> Add basic chip support for mediatek mt8195.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |    1 +
>  arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  173 +++
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 1045
> +++++++++++++++++++
>  3 files changed, 1219 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> b/arch/arm64/boot/dts/mediatek/Makefile
> index 8c1e18032f9f..5da29e7223e4 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -38,4 +38,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-
> sku0.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> new file mode 100644
> index 000000000000..76b5aaad7263
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Seiya Wang <seiya.wang@mediatek.com>
> + */
> +/dts-v1/;
> +#include "mt8195.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8195 evaluation board";
> +	compatible = "mediatek,mt8195-evb", "mediatek,mt8195";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x80000000>;
> +	};
> +};
> +
> +&auxadc {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pin>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pin>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4_pin>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c6_pin>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&nor_flash {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&nor_pins_default>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <50000000>;
> +	};
> +};
> +
> +&pio {
> +	i2c0_pin: i2c0-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
> +				 <PINMUX_GPIO9__FUNC_SCL0>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +			mediatek,drive-strength-adv = <0>;
> +			drive-strength = <6>;
> +		};
> +	};
> +
> +	i2c1_pin: i2c1-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO10__FUNC_SDA1>,
> +				 <PINMUX_GPIO11__FUNC_SCL1>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +			mediatek,drive-strength-adv = <0>;
> +			drive-strength = <6>;
> +		};
> +	};
> +
> +	i2c4_pin: i2c4-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,
> +				 <PINMUX_GPIO17__FUNC_SCL4>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +			mediatek,drive-strength-adv = <7>;
> +		};
> +	};
> +
> +	i2c6_pin: i2c6-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO25__FUNC_SDA6>,
> +				 <PINMUX_GPIO26__FUNC_SCL6>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +	};
> +
> +	i2c7_pin: i2c7-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO27__FUNC_SCL7>,
> +				 <PINMUX_GPIO28__FUNC_SDA7>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +	};
> +
> +	nor_pins_default: nor-pins {
> +		pins0 {
> +			pinmux = <PINMUX_GPIO142__FUNC_SPINOR_IO0>,
> +				 <PINMUX_GPIO141__FUNC_SPINOR_CK>,
> +				 <PINMUX_GPIO143__FUNC_SPINOR_IO1>;
> +			bias-pull-down;
> +		};
> +
> +		pins1 {
> +			pinmux = <PINMUX_GPIO140__FUNC_SPINOR_CS>,
> +				 <PINMUX_GPIO130__FUNC_SPINOR_IO2>,
> +				 <PINMUX_GPIO131__FUNC_SPINOR_IO3>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	uart0_pin: uart0-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
> +				 <PINMUX_GPIO99__FUNC_URXD0>;
> +		};
> +	};
> +};
> +
> +&u3phy0 {
> +	status="okay";
> +};
> +
> +&u3phy1 {
> +	status="okay";
> +};

Seems forget to enable &phy2/3? due to xhci2/3 are enabled below

> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pin>;
> +	status = "okay";
> +};
> +
> +&xhci0 {
> +	status = "okay";
> +};
> +
> +&xhci1 {
> +	status = "okay";
> +};
> +
> +&xhci2 {
> +	status = "okay";
> +};
> +
> +&xhci3 {
> +	/* This controller is connected with a BT device.
> +	 * Disable usb2 lpm to prevent known issues.
> +	 */
> +	usb2-lpm-disable;
> +	status = "okay";
> +};
> 
[skip]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
