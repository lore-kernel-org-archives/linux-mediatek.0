Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 01:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNbE9kRqjalq40IRTyUCrdqucbuOgfiiX4TW8ofHzno=; b=DScywipwMsJs4q
	IoW2VzVUlnzTAQWZ2vw20U/dVEZZRBwTBq4ESvndQF63AdnZJQWqGT90EKmxs6pahWSH8NEuJa7o+
	58NVw3RzKy/C9so8Q/p36qFa+7y+uWR3tXGi+Vz9eOlIXY6O36bCQmsxbrxHIdMI7ZPb2VsSf+Abx
	YaIPIsQDlH1yWGaEb/pbykNZjCyOuYkKxRS4jxX+E+ThEO/9fYghfLtcD1U8mPeouJPF082bFJtxo
	Cx4951S1jRrk6LVjGiq2YK7hVZV/hbpteHGYMnpIVwVxKDUGPt/Mv0+fhJ8+zm+N9h09pXVwLVb0n
	CXHmwhSZOBFc70KZnlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrViW-00H4P2-B7; Mon, 29 Nov 2021 01:44:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrViS-00H4No-GI; Mon, 29 Nov 2021 01:44:26 +0000
X-UUID: 725d40eb59694e40bb541f952a63ce3c-20211128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BL7hAtZDLSHNeQOx1ENxjxbkS2bfAW2TnRYxPXT90Ks=; 
 b=tk5RpV76NRnPAOS3f5PhRo9sSApPCRA67WNde0VhQUAsU0Z60Z6kPDvWX7hw7GxGylH1mlNBOGpabSSS/HA5jSie+9x0ticyPwaZJmtRWFrmNy9R+ENRSLShv6LivKxOmn3VuVw4suwbJKpmAu3bmazFBYok7bnLO2Q3oYypWkw=;
X-UUID: 725d40eb59694e40bb541f952a63ce3c-20211128
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 797954462; Sun, 28 Nov 2021 18:44:20 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 17:44:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Nov 2021 09:44:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Nov 2021 09:44:16 +0800
Message-ID: <1ac073f11baebd23865ab23379cdafa54b267a36.camel@mediatek.com>
Subject: Re: [PATCH v3 4/7] net-next: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Mon, 29 Nov 2021 09:44:16 +0800
In-Reply-To: <YaQX2N05WsZxXOgX@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
 <YaQX2N05WsZxXOgX@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_174424_589609_88501057 
X-CRM114-Status: GOOD (  35.98  )
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

Dear Rob,
	Thanks for your comments~

On Sun, 2021-11-28 at 17:59 -0600, Rob Herring wrote:
> On Fri, Nov 12, 2021 at 05:39:15PM +0800, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
> >  .../bindings/net/mediatek-dwmac.yaml          | 157
> > ++++++++++++++++++
> >  2 files changed, 157 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> > deleted file mode 100644
> > index afbcaebf062e..000000000000
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> > +++ /dev/null
> > @@ -1,91 +0,0 @@
> > -MediaTek DWMAC glue layer controller
> > -
> > -This file documents platform glue layer for stmmac.
> > -Please see stmmac.txt for the other unchanged properties.
> > -
> > -The device node has following properties.
> > -
> > -Required properties:
> > -- compatible:  Should be "mediatek,mt2712-gmac" for MT2712 SoC
> > -- reg:  Address and length of the register set for the device
> > -- interrupts:  Should contain the MAC interrupts
> > -- interrupt-names: Should contain a list of interrupt names
> > corresponding to
> > -	the interrupts in the interrupts property, if available.
> > -	Should be "macirq" for the main MAC IRQ
> > -- clocks: Must contain a phandle for each entry in clock-names.
> > -- clock-names: The name of the clock listed in the clocks
> > property. These are
> > -	"axi", "apb", "mac_main", "ptp_ref", "rmii_internal" for MT2712
> > SoC.
> > -- mac-address: See ethernet.txt in the same directory
> > -- phy-mode: See ethernet.txt in the same directory
> > -- mediatek,pericfg: A phandle to the syscon node that control
> > ethernet
> > -	interface and timing delay.
> > -
> > -Optional properties:
> > -- mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
> > -	It should be defined for RGMII/MII interface.
> > -	It should be defined for RMII interface when the reference
> > clock is from MT2712 SoC.
> > -- mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
> > -	It should be defined for RGMII/MII interface.
> > -	It should be defined for RMII interface.
> > -Both delay properties need to be a multiple of 170 for RGMII
> > interface,
> > -or will round down. Range 0~31*170.
> > -Both delay properties need to be a multiple of 550 for MII/RMII
> > interface,
> > -or will round down. Range 0~31*550.
> > -
> > -- mediatek,rmii-rxc: boolean property, if present indicates that
> > the RMII
> > -	reference clock, which is from external PHYs, is connected to
> > RXC pin
> > -	on MT2712 SoC.
> > -	Otherwise, is connected to TXC pin.
> > -- mediatek,rmii-clk-from-mac: boolean property, if present
> > indicates that
> > -	MT2712 SoC provides the RMII reference clock, which outputs to
> > TXC pin only.
> > -- mediatek,txc-inverse: boolean property, if present indicates
> > that
> > -	1. tx clock will be inversed in MII/RGMII case,
> > -	2. tx clock inside MAC will be inversed relative to reference
> > clock
> > -	   which is from external PHYs in RMII case, and it rarely
> > happen.
> > -	3. the reference clock, which outputs to TXC pin will be
> > inversed in RMII case
> > -	   when the reference clock is from MT2712 SoC.
> > -- mediatek,rxc-inverse: boolean property, if present indicates
> > that
> > -	1. rx clock will be inversed in MII/RGMII case.
> > -	2. reference clock will be inversed when arrived at MAC in RMII
> > case, when
> > -	   the reference clock is from external PHYs.
> > -	3. the inside clock, which be sent to MAC, will be inversed in
> > RMII case when
> > -	   the reference clock is from MT2712 SoC.
> > -- assigned-clocks: mac_main and ptp_ref clocks
> > -- assigned-clock-parents: parent clocks of the assigned clocks
> > -
> > -Example:
> > -	eth: ethernet@1101c000 {
> > -		compatible = "mediatek,mt2712-gmac";
> > -		reg = <0 0x1101c000 0 0x1300>;
> > -		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> > -		interrupt-names = "macirq";
> > -		phy-mode ="rgmii-rxid";
> > -		mac-address = [00 55 7b b5 7d f7];
> > -		clock-names = "axi",
> > -			      "apb",
> > -			      "mac_main",
> > -			      "ptp_ref",
> > -			      "rmii_internal";
> > -		clocks = <&pericfg CLK_PERI_GMAC>,
> > -			 <&pericfg CLK_PERI_GMAC_PCLK>,
> > -			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > -			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> > -		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > -				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > -				  <&topckgen
> > CLK_TOP_ETHER_50M_RMII_SEL>;
> > -		assigned-clock-parents = <&topckgen
> > CLK_TOP_ETHERPLL_125M>,
> > -					 <&topckgen CLK_TOP_APLL1_D3>,
> > -					 <&topckgen
> > CLK_TOP_ETHERPLL_50M>;
> > -		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> > -		mediatek,pericfg = <&pericfg>;
> > -		mediatek,tx-delay-ps = <1530>;
> > -		mediatek,rx-delay-ps = <1530>;
> > -		mediatek,rmii-rxc;
> > -		mediatek,txc-inverse;
> > -		mediatek,rxc-inverse;
> > -		snps,txpbl = <1>;
> > -		snps,rxpbl = <1>;
> > -		snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> > -		snps,reset-active-low;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > new file mode 100644
> > index 000000000000..2eb4781536f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -0,0 +1,157 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek DWMAC glue layer controller
> > +
> > +maintainers:
> > +  - Biao Huang <biao.huang@mediatek.com>
> > +
> > +description:
> > +  This file documents platform glue layer for stmmac.
> > +
> > +# We need a select here so we don't match all nodes with
> > 'snps,dwmac'
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - mediatek,mt2712-gmac
> > +  required:
> > +    - compatible
> > +
> > +allOf:
> > +  - $ref: "snps,dwmac.yaml#"
> > +  - $ref: "ethernet-controller.yaml#"
> 
> Doesn't snps,dwmac.yaml already reference ethernet-controller.yaml?
Yes, I'll remove ethernet-controller.yaml in next send.
Thanks~
> 
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2712-gmac
> > +          - const: snps,dwmac-4.20a
> > +
> > +  clocks:
> > +    items:
> > +      - description: AXI clock
> > +      - description: APB clock
> > +      - description: MAC Main clock
> > +      - description: PTP clock
> > +      - description: RMII reference clock provided by MAC
> > +
> > +  clock-names:
> > +    items:
> > +      - const: axi
> > +      - const: apb
> > +      - const: mac_main
> > +      - const: ptp_ref
> > +      - const: rmii_internal
> > +
> > +  mediatek,pericfg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle to the syscon node that control ethernet
> > +      interface and timing delay.
> > +
> > +  mediatek,tx-delay-ps:
> > +    description:
> > +      The internal TX clock delay (provided by this driver) in
> > nanoseconds.
> > +      For MT2712 RGMII interface, Allowed value need to be a
> > multiple of 170,
> > +      or will round down. Range 0~31*170.
> > +      For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> > +      or will round down. Range 0~31*550.
> > +
> > +  mediatek,rx-delay-ps:
> > +    description:
> > +      The internal RX clock delay (provided by this driver) in
> > nanoseconds.
> > +      For MT2712 RGMII interface, Allowed value need to be a
> > multiple of 170,
> > +      or will round down. Range 0~31*170.
> > +      For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> > +      or will round down. Range 0~31*550.
> > +
> > +  mediatek,rmii-rxc:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that the RMII reference clock, which
> > is from external
> > +      PHYs, is connected to RXC pin. Otherwise, is connected to
> > TXC pin.
> > +
> > +  mediatek,rmii-clk-from-mac:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that MAC provides the RMII reference
> > clock, which
> > +      outputs to TXC pin only.
> > +
> > +  mediatek,txc-inverse:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that
> > +      1. tx clock will be inversed in MII/RGMII case,
> > +      2. tx clock inside MAC will be inversed relative to
> > reference clock
> > +         which is from external PHYs in RMII case, and it rarely
> > happen.
> > +      3. the reference clock, which outputs to TXC pin will be
> > inversed in RMII case
> > +         when the reference clock is from MAC.
> > +
> > +  mediatek,rxc-inverse:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that
> > +      1. rx clock will be inversed in MII/RGMII case.
> > +      2. reference clock will be inversed when arrived at MAC in
> > RMII case, when
> > +         the reference clock is from external PHYs.
> > +      3. the inside clock, which be sent to MAC, will be inversed
> > in RMII case when
> > +         the reference clock is from MAC.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - phy-mode
> > +  - mediatek,pericfg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt2712-clk.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt2712-power.h>
> > +
> > +    eth: ethernet@1101c000 {
> > +        compatible = "mediatek,mt2712-gmac", "snps,dwmac-4.20a";
> > +        reg = <0x1101c000 0x1300>;
> > +        interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> > +        interrupt-names = "macirq";
> > +        phy-mode ="rgmii-rxid";
> > +        mac-address = [00 55 7b b5 7d f7];
> > +        clock-names = "axi",
> > +                      "apb",
> > +                      "mac_main",
> > +                      "ptp_ref",
> > +                      "rmii_internal";
> > +        clocks = <&pericfg CLK_PERI_GMAC>,
> > +                 <&pericfg CLK_PERI_GMAC_PCLK>,
> > +                 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > +                 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +                 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> > +        assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> > +                          <&topckgen CLK_TOP_ETHER_50M_SEL>,
> > +                          <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> > +        assigned-clock-parents = <&topckgen
> > CLK_TOP_ETHERPLL_125M>,
> > +                                 <&topckgen CLK_TOP_APLL1_D3>,
> > +                                 <&topckgen CLK_TOP_ETHERPLL_50M>;
> > +        power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> > +        mediatek,pericfg = <&pericfg>;
> > +        mediatek,tx-delay-ps = <1530>;
> > +        snps,txpbl = <1>;
> > +        snps,rxpbl = <1>;
> > +        snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> > +        snps,reset-delays-us = <0 10000 10000>;
> > +    };
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
