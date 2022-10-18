Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A501FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM+soasMJzB6uxzurzAYBD4NNpjZ9qTL1sEyE6FK3J8=; b=pea3X55Kiwmb4l/0FSNqlTCVJf
	oNz4HQXeccBHJ09oDscxkd83MH/DsdbLUNEBeQeWjRHXGaCPmseLG9T1hUvIebPy3ridkImJba189
	vsSDgDIRJem5vJrmjZEajgxcSUrgapY8Bn5yvalqohKflvNNW2NQMIMyuj0t/cWQEjreRz+Ig+Vcb
	aJEyixBEa6rwzIQ0H3IKrUhiLlAjSHAb/zqScnahgyvZplTOZhTLZnjhxT86DtzrUFg5C9QKey2bE
	/K5nHzZhk7H6+T3Z7aW1WDYh3oYvCqTaTMA2pB0MwAPRjmf+dDZ7hEcj6e73+KtV3/GmDdMyTQ4t5
	5kmv+4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okh1p-003pCB-MU; Tue, 18 Oct 2022 07:28:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okh1i-003p7f-Be; Tue, 18 Oct 2022 07:28:40 +0000
X-UUID: 72c8339c698b4368a481bed5c2a37d87-20221018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eM+soasMJzB6uxzurzAYBD4NNpjZ9qTL1sEyE6FK3J8=;
	b=WfOuPQb2y10opBmhNbzJD5LV31CgOox0UNaRcXkVQsg8p7K9Cu4C3lPUri1c47FM5KXXk6GwHxmKZwipysdb0E2zcf3vrbR/5qzw6JqqB1pXQ/oKV4NrgilEXcimxTAtwKVio+q+uC0vA9U7Tp4iam4Aqr8Y8RbuQG2NQGm2oBk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ab396457-bd79-4aa5-9ebb-4cd3d413839f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:7bf722a4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 72c8339c698b4368a481bed5c2a37d87-20221018
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743684049; Tue, 18 Oct 2022 00:28:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 18 Oct 2022 14:37:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 18 Oct 2022 14:37:54 +0800
Message-ID: <b5d18b4b631cb19d435f37ccacd296a2282c2a1a.camel@mediatek.com>
Subject: Re: [PATCH] arm64: dts: mt8195: Add Ethernet controller
From: Biao Huang <biao.huang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<macpaul.lin@mediatek.com>
Date: Tue, 18 Oct 2022 14:37:54 +0800
In-Reply-To: <d6bda69e-d331-3e64-2100-d41e84c3fab7@linaro.org>
References: <20221017095834.7675-1-biao.huang@mediatek.com>
	 <d6bda69e-d331-3e64-2100-d41e84c3fab7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_002838_501577_E6B903B0 
X-CRM114-Status: GOOD (  24.07  )
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

Dear Krzysztof,
	Thanks for your comments!

On Mon, 2022-10-17 at 22:01 -0400, Krzysztof Kozlowski wrote:
> On 17/10/2022 05:58, Biao Huang wrote:
> > Add Ethernet controller node for mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88
> > ++++++++++++++++++++
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 87
> > +++++++++++++++++++
> >  2 files changed, 175 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > index 4fbd99eb496a..02e04f82a4ae 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > @@ -258,6 +258,72 @@ &mt6359_vsram_others_ldo_reg {
> >  };
> >  
> >  &pio {
> > +	eth_default: eth_default {
> 
> No underscores in node names. Please also be sure your patch does not
> bring new warnings with `dtbs_check` (lack of suffix above could mean
> it
> brings...)
OK, I'll fix the underscores issue in next send.
As to "lack of suffix" issue, do you mean I should write it like:
	eth-default: eth-default@0 {
		...
	}
If yes, other nodes in current file don't have such suffix.
e.g.
	gpio_keys_pins: gpio-keys-pins

Should I keep unified style with other nodes?
> 
> > +		txd_pins {
> 
> No underscores
OK, will fix in next send.
> 
> > +			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
> > +				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
> > +				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
> > +				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
> > +			drive-strength = <MTK_DRIVE_8mA>;
> > +		};
> > +		cc_pins {
> 
> Ditto... and so on.
OK, will fix in next send.
> 
> > +			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
> > +				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
> > +				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
> > +				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
> > +			drive-strength = <MTK_DRIVE_8mA>;
> > +		};
> > +		rxd_pins {
> > +			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
> > +				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
> > +				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
> > +				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
> > +		};
> > +		mdio_pins {
> > +			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
> > +				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
> > +			input-enable;
> > +		};
> > +		power_pins {
> > +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> > +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> > +			output-high;
> > +		};
> > +	};
> > +
> > +	eth_sleep: eth_sleep {
> > +		txd_pins {
> > +			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
> > +				 <PINMUX_GPIO78__FUNC_GPIO78>,
> > +				 <PINMUX_GPIO79__FUNC_GPIO79>,
> > +				 <PINMUX_GPIO80__FUNC_GPIO80>;
> > +		};
> > +		cc_pins {
> > +			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
> > +				 <PINMUX_GPIO88__FUNC_GPIO88>,
> > +				 <PINMUX_GPIO87__FUNC_GPIO87>,
> > +				 <PINMUX_GPIO86__FUNC_GPIO86>;
> > +		};
> > +		rxd_pins {
> > +			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
> > +				 <PINMUX_GPIO82__FUNC_GPIO82>,
> > +				 <PINMUX_GPIO83__FUNC_GPIO83>,
> > +				 <PINMUX_GPIO84__FUNC_GPIO84>;
> > +		};
> > +		mdio_pins {
> > +			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
> > +				 <PINMUX_GPIO90__FUNC_GPIO90>;
> > +			input-disable;
> > +			bias-disable;
> > +		};
> > +		power_pins {
> > +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> > +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> > +			input-disable;
> > +			bias-disable;
> > +		};
> > +	};
> > +
> >  	gpio_keys_pins: gpio-keys-pins {
> >  		pins {
> >  			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
> > @@ -434,6 +500,28 @@ &xhci0 {
> >  	status = "okay";
> >  };
> >  
> > +&eth {
> > +	phy-mode ="rgmii-rxid";
> > +	phy-handle = <&eth_phy0>;
> > +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
> > +	snps,reset-delays-us = <0 10000 10000>;
> > +	mediatek,tx-delay-ps = <2030>;
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&eth_default>;
> > +	pinctrl-1 = <&eth_sleep>;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		compatible = "snps,dwmac-mdio";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		eth_phy0: eth_phy0@1 {
> 
> ethernet-phy@1
OK, will modify in next send.
> 
> > +			compatible = "ethernet-phy-id001c.c916";
> > +			reg = <0x1>;
> > +		};
> > +	};
> > +};
> > +
> >  &xhci1 {
> >  	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> >  	status = "okay";
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 905d1a90b406..aa1fcc3b9cb6 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1042,6 +1042,93 @@ spis1: spi@1101e000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		stmmac_axi_setup: stmmac-axi-config {
> > +			snps,wr_osr_lmt = <0x7>;
> > +			snps,rd_osr_lmt = <0x7>;
> > +			snps,blen = <0 0 0 0 16 8 4>;
> > +		};
> > +
> > +		mtl_rx_setup: rx-queues-config {
> > +			snps,rx-queues-to-use = <4>;
> > +			snps,rx-sched-sp;
> > +			queue0 {
> > +				snps,dcb-algorithm;
> > +				snps,map-to-dma-channel = <0x0>;
> > +			};
> > +			queue1 {
> > +				snps,dcb-algorithm;
> > +				snps,map-to-dma-channel = <0x0>;
> > +			};
> > +			queue2 {
> > +				snps,dcb-algorithm;
> > +				snps,map-to-dma-channel = <0x0>;
> > +			};
> > +			queue3 {
> > +				snps,dcb-algorithm;
> > +				snps,map-to-dma-channel = <0x0>;
> > +			};
> > +		};
> > +
> > +		mtl_tx_setup: tx-queues-config {
> > +			snps,tx-queues-to-use = <4>;
> > +			snps,tx-sched-wrr;
> > +			queue0 {
> > +				snps,weight = <0x10>;
> > +				snps,dcb-algorithm;
> > +				snps,priority = <0x0>;
> > +			};
> > +			queue1 {
> > +				snps,weight = <0x11>;
> > +				snps,dcb-algorithm;
> > +				snps,priority = <0x1>;
> > +			};
> > +			queue2 {
> > +				snps,weight = <0x12>;
> > +				snps,dcb-algorithm;
> > +				snps,priority = <0x2>;
> > +			};
> > +			queue3 {
> > +				snps,weight = <0x13>;
> > +				snps,dcb-algorithm;
> > +				snps,priority = <0x3>;
> > +			};
> > +		};
> > +
> > +		eth: ethernet@11021000 {
> > +			compatible = "mediatek,mt8195-gmac",
> > "snps,dwmac-5.10a";
> > +			reg = <0 0x11021000 0 0x4000>;
> > +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			interrupt-names = "macirq";
> > +			mac-address = [00 55 7b b5 7d f7];
> 
> How is this property of a SoC? Are you saying now that all MT8195
> SoCs
> have the same MAC address?
The mac-address here is taken as a default mac address in eth driver
rather than a randome one.
Actually, there will be a tool to customize eth mac address (e.g
through "ifconfig eth0 hw ether xx:xx:xx:xx:xx:xx"), so every
MT8195 SoCs will get their specified mac address in real product.
> 
> Best regards,
> Krzysztof
> 
Best Regards!
Biao


