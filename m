Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRwPh1b7Y6tfaQ46UHMXTXRLY2MLY3cBPt3O3onvjEM=; b=T6ujA7VwD3FZC7
	3NK5fXSbVNKC/4V9O+Pa79Y0byi1p6aZPhBBVn5E+Khq9DiutzAzoQUp7ysUn8E1GvNx+DS8PwLtG
	0mG3AeprqJgK+SNeJvatRa6S6dTSc+/MDRIXbORxMkoioedCTwkO/Ib4q5m5Wl47OnXAmvoTHssvc
	R2elloCoLCCDWAaus8giev0W2k38CvcmOni3yixnwEGIkWTjLipa6d+S132ggbwEardPIG9q+Wypu
	YLhWgAf8BH8joTNlSEzABlQn/tIar9FcSNgOuhAV94ktR0rwms5rZ3Pyc0ThauLOImzLYzbR0A0db
	NU47Icg4Gx3smbH6Zvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njb7O-00Hakn-KT; Wed, 27 Apr 2022 06:25:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njb7D-00HaiL-Tj; Wed, 27 Apr 2022 06:25:33 +0000
X-UUID: 09a36c22225d40e5aadab56e2e64b678-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3f2c67b1-8afb-4ef5-a3be-5375ecb2949f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e68ddb2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 09a36c22225d40e5aadab56e2e64b678-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1931306418; Tue, 26 Apr 2022 23:25:27 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 23:25:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 14:25:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 14:25:24 +0800
Message-ID: <c0cf89c05ee708ec3648b267c1c0a0baa1331836.camel@mediatek.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt8195-demo: enable ethernet
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 27 Apr 2022 14:25:23 +0800
In-Reply-To: <20220426134106.242353-6-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
 <20220426134106.242353-6-fparent@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_232532_015258_F856BE24 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, 2022-04-26 at 15:41 +0200, Fabien Parent wrote:
> Enable ethernet on the MT8195 demo board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 108
> +++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 08cab3b3943b..0b7985486e2a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -80,6 +80,30 @@ optee_reserved: optee@43200000 {
>  	};
>  };
>  
> +&eth {
> +	phy-mode = "rgmii-rxid";
> +	phy-handle = <&eth_phy>;
> +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
> +	snps,reset-delays-us = <0 10000 10000>;
> +	mediatek,tx-delay-ps = <2030>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default_pins>;
> +	pinctrl-1 = <&eth_sleep_pins>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		eth_phy: phy@1 {
> +			compatible = "ethernet-phy-id001c.c916";
> +			#phy-cells = <0>;
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
>  &i2c6 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&i2c6_pins>;
> @@ -260,6 +284,90 @@ &mt6359_vsram_others_ldo_reg {
>  };
>  
>  &pio {
> +	eth_default_pins: eth-default-pins {
> +		pins-cc {
> +			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
> +				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
> +				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
> +				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +		};
> +
> +		pins-mdio {
> +			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
> +				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
> +			input-enable;
> +		};
> +
> +		pins-phy-reset {
> +			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
> +		};
> +
> +		pins-power {
> +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> +			output-high;
> +		};
> +
> +		pins-rxd {
> +			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
> +				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
> +				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
> +				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
> +		};
> +
> +		pins-txd {
> +			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
> +				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
> +				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
> +				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +		};
> +	};
> +
> +	eth_sleep_pins: eth-sleep-pins {
> +		pins-cc {
> +			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
> +				 <PINMUX_GPIO88__FUNC_GPIO88>,
> +				 <PINMUX_GPIO87__FUNC_GPIO87>,
> +				 <PINMUX_GPIO86__FUNC_GPIO86>;
> +		};
> +
> +		pins-mdio {
> +			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
> +				 <PINMUX_GPIO90__FUNC_GPIO90>;
> +			input-disable;
> +			bias-disable;
> +		};
> +
> +		pins-phy-reset {
> +			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
> +			input-disable;
> +			bias-disable;
> +		};
> +
> +		pins-power {
> +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> +			input-disable;
> +			bias-disable;
> +		};
> +
> +		pins-rxd {
> +			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
> +				 <PINMUX_GPIO82__FUNC_GPIO82>,
> +				 <PINMUX_GPIO83__FUNC_GPIO83>,
> +				 <PINMUX_GPIO84__FUNC_GPIO84>;
> +		};
> +
> +		pins-txd {
> +			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
> +				 <PINMUX_GPIO78__FUNC_GPIO78>,
> +				 <PINMUX_GPIO79__FUNC_GPIO79>,
> +				 <PINMUX_GPIO80__FUNC_GPIO80>;
> +		};
> +	};
> +
>  	gpio_keys_pins: gpio-keys-pins {
>  		pins {
>  			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;

Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>

Regards,
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
