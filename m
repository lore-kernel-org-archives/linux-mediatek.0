Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1981C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFQVPJDoagAI/I3wKeiVw+KZmVF9ESiWTp5fq5ORCiA=; b=LECccBKk95SVwk
	xOICLlvpLdKI9P58GcFVO8LgKNKnGHUtbPJN/rBM7jRKABjnbBF/aHdyaSQymd7dt6fZUlmleLjnO
	NQKpwVyrIXau8L/VgcrQjUPodBj55aQ6E2/MvAI8pBsloxvBlFFybBQE+OdlBT6d+ZCY0Cv5GM+TZ
	rT17p2tqicnIkEFroMVnFw4fbcm+Dsxxvo+avMHouVHnlpXKYs0PPgjGT066SyAunBEFoP9yYOGE2
	YC0C11gwwEfexDNGl2zWsDXHQODIlljQmNUhya9yOWdJmqf0GZ7p5hRMK8WQUj38OzTWKIvL+zyNF
	y/x8FPvqq3LzyTs422nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlPl-003Tab-2u; Fri, 10 Dec 2021 19:18:41 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkxL-003HhF-UF; Fri, 10 Dec 2021 18:49:22 +0000
Received: by mail-oi1-f181.google.com with SMTP id s139so14353706oie.13;
 Fri, 10 Dec 2021 10:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wzMDGzwn5Nsoc2r/s/ie4JgtmCnSWSaA56Wt4W4naT0=;
 b=CVCqcSkDYEh6AuFijPmmn0A2zqDyLL76XoX4QbK8OuIUA+1mZIuZYjIxWwq8hGr4R7
 voUhEIgTH2LnpN4NRrc0+Hw6R72IUrg+zmFHTDSl39qHNNbXij9Sc4yvuXF7pRuZTT+t
 3YOVAFW3o/a3mty4ngEm0ZHk+i7oI6+2ggULGPD5XpgrntIIdjTcPt8FHMVflf+26VUX
 Pviog9fc2lRdztvnpj/8fMBsTU+KORLeF3pk9PvObx8lTwu+ZFk5Cx+E02nsR6rpiweD
 qsgYqsyCjTXOo8YJ+cnkIxF7IVhflXUmTAEwcKjE/SJgeOKVg/RQ4TEeozsMt9FKA3Ma
 l4Iw==
X-Gm-Message-State: AOAM530lo0FwhQcEhtnAw3DcX7zImUyZZzQ/c8c/R8fG21PIJ4Fpyq17
 JfBVZYGwkvFPu6EY9uPhug==
X-Google-Smtp-Source: ABdhPJzs4xfcfZFtBj84L5phzmszkf41vKBp+FLGkOYpH0ubNG70PZJbBIq7RiGy4oqP93u0Hkhd2g==
X-Received: by 2002:a05:6808:2014:: with SMTP id
 q20mr14212985oiw.9.1639162158112; 
 Fri, 10 Dec 2021 10:49:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t14sm657263otr.23.2021.12.10.10.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 10:49:17 -0800 (PST)
Received: (nullmailer pid 1689925 invoked by uid 1000);
 Fri, 10 Dec 2021 18:49:15 -0000
Date: Fri, 10 Dec 2021 12:49:15 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 srv_heupstream@mediatek.com, macpaul.lin@mediatek.com,
 angelogioacchino.delregno@collabora.com, dkirjanov@suse.de
Subject: Re: [PATCH net-next v8 4/6] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Message-ID: <YbOhK6ojiYdHTFFx@robh.at.kernel.org>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-5-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210013129.811-5-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_104920_041430_35CE123A 
X-CRM114-Status: GOOD (  32.42  )
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

On Fri, Dec 10, 2021 at 09:31:27AM +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> And there are some changes in .yaml than .txt, others almost keep the same:
>   1. compatible "const: snps,dwmac-4.20".
>   2. delete "snps,reset-active-low;" in example, since driver remove this
>      property long ago.
>   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
>   4. the example is for rgmii interface, keep related properties only.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 156 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> deleted file mode 100644
> index afbcaebf062e..000000000000
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -MediaTek DWMAC glue layer controller
> -
> -This file documents platform glue layer for stmmac.
> -Please see stmmac.txt for the other unchanged properties.
> -
> -The device node has following properties.
> -
> -Required properties:
> -- compatible:  Should be "mediatek,mt2712-gmac" for MT2712 SoC
> -- reg:  Address and length of the register set for the device
> -- interrupts:  Should contain the MAC interrupts
> -- interrupt-names: Should contain a list of interrupt names corresponding to
> -	the interrupts in the interrupts property, if available.
> -	Should be "macirq" for the main MAC IRQ
> -- clocks: Must contain a phandle for each entry in clock-names.
> -- clock-names: The name of the clock listed in the clocks property. These are
> -	"axi", "apb", "mac_main", "ptp_ref", "rmii_internal" for MT2712 SoC.
> -- mac-address: See ethernet.txt in the same directory
> -- phy-mode: See ethernet.txt in the same directory
> -- mediatek,pericfg: A phandle to the syscon node that control ethernet
> -	interface and timing delay.
> -
> -Optional properties:
> -- mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
> -	It should be defined for RGMII/MII interface.
> -	It should be defined for RMII interface when the reference clock is from MT2712 SoC.
> -- mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
> -	It should be defined for RGMII/MII interface.
> -	It should be defined for RMII interface.
> -Both delay properties need to be a multiple of 170 for RGMII interface,
> -or will round down. Range 0~31*170.
> -Both delay properties need to be a multiple of 550 for MII/RMII interface,
> -or will round down. Range 0~31*550.
> -
> -- mediatek,rmii-rxc: boolean property, if present indicates that the RMII
> -	reference clock, which is from external PHYs, is connected to RXC pin
> -	on MT2712 SoC.
> -	Otherwise, is connected to TXC pin.
> -- mediatek,rmii-clk-from-mac: boolean property, if present indicates that
> -	MT2712 SoC provides the RMII reference clock, which outputs to TXC pin only.
> -- mediatek,txc-inverse: boolean property, if present indicates that
> -	1. tx clock will be inversed in MII/RGMII case,
> -	2. tx clock inside MAC will be inversed relative to reference clock
> -	   which is from external PHYs in RMII case, and it rarely happen.
> -	3. the reference clock, which outputs to TXC pin will be inversed in RMII case
> -	   when the reference clock is from MT2712 SoC.
> -- mediatek,rxc-inverse: boolean property, if present indicates that
> -	1. rx clock will be inversed in MII/RGMII case.
> -	2. reference clock will be inversed when arrived at MAC in RMII case, when
> -	   the reference clock is from external PHYs.
> -	3. the inside clock, which be sent to MAC, will be inversed in RMII case when
> -	   the reference clock is from MT2712 SoC.
> -- assigned-clocks: mac_main and ptp_ref clocks
> -- assigned-clock-parents: parent clocks of the assigned clocks
> -
> -Example:
> -	eth: ethernet@1101c000 {
> -		compatible = "mediatek,mt2712-gmac";
> -		reg = <0 0x1101c000 0 0x1300>;
> -		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> -		interrupt-names = "macirq";
> -		phy-mode ="rgmii-rxid";
> -		mac-address = [00 55 7b b5 7d f7];
> -		clock-names = "axi",
> -			      "apb",
> -			      "mac_main",
> -			      "ptp_ref",
> -			      "rmii_internal";
> -		clocks = <&pericfg CLK_PERI_GMAC>,
> -			 <&pericfg CLK_PERI_GMAC_PCLK>,
> -			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> -			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> -		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> -				  <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> -		assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
> -					 <&topckgen CLK_TOP_APLL1_D3>,
> -					 <&topckgen CLK_TOP_ETHERPLL_50M>;
> -		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> -		mediatek,pericfg = <&pericfg>;
> -		mediatek,tx-delay-ps = <1530>;
> -		mediatek,rx-delay-ps = <1530>;
> -		mediatek,rmii-rxc;
> -		mediatek,txc-inverse;
> -		mediatek,rxc-inverse;
> -		snps,txpbl = <1>;
> -		snps,rxpbl = <1>;
> -		snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> -		snps,reset-active-low;
> -	};
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> new file mode 100644
> index 000000000000..9207266a6e69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -0,0 +1,156 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DWMAC glue layer controller
> +
> +maintainers:
> +  - Biao Huang <biao.huang@mediatek.com>
> +
> +description:
> +  This file documents platform glue layer for stmmac.
> +
> +# We need a select here so we don't match all nodes with 'snps,dwmac'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mediatek,mt2712-gmac
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: "snps,dwmac.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Don't need oneOf for 1 entry.

> +          - enum:
> +              - mediatek,mt2712-gmac
> +          - const: snps,dwmac-4.20a
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: APB clock
> +      - description: MAC Main clock
> +      - description: PTP clock
> +      - description: RMII reference clock provided by MAC

Seems you need 'minItems: 4' or are the DT files wrong?

> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: apb
> +      - const: mac_main
> +      - const: ptp_ref
> +      - const: rmii_internal
> +
> +  mediatek,pericfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the syscon node that control ethernet
> +      interface and timing delay.
> +
> +  mediatek,tx-delay-ps:
> +    description:
> +      The internal TX clock delay (provided by this driver) in nanoseconds.
> +      For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
> +      or will round down. Range 0~31*170.
> +      For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
> +      or will round down. Range 0~31*550.
> +
> +  mediatek,rx-delay-ps:
> +    description:
> +      The internal RX clock delay (provided by this driver) in nanoseconds.
> +      For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
> +      or will round down. Range 0~31*170.
> +      For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
> +      or will round down. Range 0~31*550.
> +
> +  mediatek,rmii-rxc:
> +    type: boolean
> +    description:
> +      If present, indicates that the RMII reference clock, which is from external
> +      PHYs, is connected to RXC pin. Otherwise, is connected to TXC pin.
> +
> +  mediatek,rmii-clk-from-mac:
> +    type: boolean
> +    description:
> +      If present, indicates that MAC provides the RMII reference clock, which
> +      outputs to TXC pin only.
> +
> +  mediatek,txc-inverse:
> +    type: boolean
> +    description:
> +      If present, indicates that
> +      1. tx clock will be inversed in MII/RGMII case,
> +      2. tx clock inside MAC will be inversed relative to reference clock
> +         which is from external PHYs in RMII case, and it rarely happen.
> +      3. the reference clock, which outputs to TXC pin will be inversed in RMII case
> +         when the reference clock is from MAC.
> +
> +  mediatek,rxc-inverse:
> +    type: boolean
> +    description:
> +      If present, indicates that
> +      1. rx clock will be inversed in MII/RGMII case.
> +      2. reference clock will be inversed when arrived at MAC in RMII case, when
> +         the reference clock is from external PHYs.
> +      3. the inside clock, which be sent to MAC, will be inversed in RMII case when
> +         the reference clock is from MAC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - phy-mode
> +  - mediatek,pericfg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2712-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt2712-power.h>
> +
> +    eth: ethernet@1101c000 {
> +        compatible = "mediatek,mt2712-gmac", "snps,dwmac-4.20a";
> +        reg = <0x1101c000 0x1300>;
> +        interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-names = "macirq";
> +        phy-mode ="rgmii-rxid";
> +        mac-address = [00 55 7b b5 7d f7];
> +        clock-names = "axi",
> +                      "apb",
> +                      "mac_main",
> +                      "ptp_ref",
> +                      "rmii_internal";
> +        clocks = <&pericfg CLK_PERI_GMAC>,
> +                 <&pericfg CLK_PERI_GMAC_PCLK>,
> +                 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> +                 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +                 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> +        assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> +                          <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +                          <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
> +                                 <&topckgen CLK_TOP_APLL1_D3>,
> +                                 <&topckgen CLK_TOP_ETHERPLL_50M>;
> +        power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
> +        mediatek,pericfg = <&pericfg>;
> +        mediatek,tx-delay-ps = <1530>;
> +        snps,txpbl = <1>;
> +        snps,rxpbl = <1>;
> +        snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> +        snps,reset-delays-us = <0 10000 10000>;
> +    };
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
