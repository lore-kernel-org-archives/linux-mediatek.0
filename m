Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DB7C10F05
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXJLPYyl6Xf8EJB98w2kLHC6dz7zDdmjsJDaz1+tWDQ=; b=bJ29WS9EQqs5FDq7BKdEzFDBcq
	91jXWGF8dCSzL4mQJoPzoa3Qv6RDL0bHs8SHZ/dU4rRas09xUCZqSSg1j+O+KP/V+ti1CapvVaM3K
	g9JwT1KU6UiXyoq1x1laB1saYLbVd/kMPwss9XSe2mrW5egLZJBHQNpfhum8AwlJLqVbb4FZeedHF
	TFpcjyNdnI0PNjYCKNQtPBMHxkfAAnF15f8Tgb5a8Wo2sR2/vVGDyIcIzhW4rfgcszaUhaHIGMAj/
	zSQyYB69PeUcwNJpNXsNDIX4MRNBYJOrDwwMa5lvUJEeiWXefRFNZA16MoiPnC2zKuJebBut5CJ6S
	kB+jTw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAs6a-00AP6p-0u;
	Wed, 06 Dec 2023 13:38:24 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAs6W-00AP5D-1J;
	Wed, 06 Dec 2023 13:38:22 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-58e1ddc68b2so3216522eaf.2;
        Wed, 06 Dec 2023 05:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701869898; x=1702474698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXJLPYyl6Xf8EJB98w2kLHC6dz7zDdmjsJDaz1+tWDQ=;
        b=Bntm9pwRoo/VWmDPssY9MOem/qxV5bkoCuWVYcTb/WdoixdK7upZfipP37qYialbky
         E49d2cUQkJv6ymN4Ai4l5fh0zgs+AAJzKMlUwKC/286VZ4qV0cs2ogPVwkGOVxzljXHF
         Iqv2PVYaWSw2ugDgBsBfNSGF05QunoZm0ffXA4/bJb2U3MDcIwlRL0TRDUAiXuV231e/
         RAwGrn7aTgCmBBzgrvQh1Ti2qjhqNsDc5rTiSNKPa79wWJasVC0sDb1fl3Wxa0r4lszO
         fBfuUOx5PpCLwd3WXWyl0uAJAk3QydcN6IIW6D2vX8M8H9ukFT6kB2WxD3pJBDmshEHg
         l19g==
X-Gm-Message-State: AOJu0Yyn7LFf+wh8B2KkwAxs/uogRqCb97u6oaGKEqX7ZVd+gcFZWI+v
	jPCrrg3IjD7NR6GjusnxBg==
X-Google-Smtp-Source: AGHT+IF/LAcnj1J3TR60tozX4/oUnmK8PyZL0iXhjSaODyz/Go3KIoK2mX4OzhZOy/BkcsaB8Zqq1g==
X-Received: by 2002:a4a:9197:0:b0:58e:3275:3e4b with SMTP id d23-20020a4a9197000000b0058e32753e4bmr752179ooh.19.1701869898302;
        Wed, 06 Dec 2023 05:38:18 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v14-20020a4a8c4e000000b005840b5783a1sm2764109ooj.43.2023.12.06.05.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:38:17 -0800 (PST)
Received: (nullmailer pid 1955863 invoked by uid 1000);
	Wed, 06 Dec 2023 13:38:16 -0000
Date: Wed, 6 Dec 2023 07:38:16 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexander Couzens <lynxis@fe80.eu>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v2 7/8] dt-bindings: net: mediatek,net: fix and
 complete mt7988-eth binding
Message-ID: <20231206133816.GA1914715-robh@kernel.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <567c6aaa64ecb4872056bc0105c70153fd9d9b50.1701826319.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <567c6aaa64ecb4872056bc0105c70153fd9d9b50.1701826319.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_053820_444941_840BBD6B 
X-CRM114-Status: GOOD (  21.72  )
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

On Wed, Dec 06, 2023 at 01:45:02AM +0000, Daniel Golle wrote:
> Complete support for MT7988 which comes with 3 MACs, SRAM for DMA
> descriptors and uses a dedicated PCS for the SerDes units.
> 
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 148 +++++++++++++++++-
>  1 file changed, 146 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 030d106bc7d3f..ca0667c51c1c2 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -28,7 +28,10 @@ properties:
>        - ralink,rt5350-eth
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Base of registers used to program the ethernet controller
> +      - description: SRAM region used for DMA descriptors

Is this a dedicated SRAM for this purpose, or a common one partitioned 
up. mmio-sram and a phandle is how to do the latter.

>  
>    clocks: true
>    clock-names: true
> @@ -115,6 +118,9 @@ allOf:
>                - mediatek,mt7623-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 3
>  
> @@ -149,6 +155,9 @@ allOf:
>                - mediatek,mt7621-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 1
>  
> @@ -174,6 +183,9 @@ allOf:
>              const: mediatek,mt7622-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 3
>  
> @@ -215,6 +227,9 @@ allOf:
>              const: mediatek,mt7629-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 3
>  
> @@ -257,6 +272,9 @@ allOf:
>              const: mediatek,mt7981-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            minItems: 4
>  
> @@ -295,6 +313,9 @@ allOf:
>              const: mediatek,mt7986-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            minItems: 4
>  
> @@ -333,8 +354,13 @@ allOf:
>              const: mediatek,mt7988-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 2

Don't need maxItems here. That's already the max.

> +          minItems: 2
> +
>          interrupts:
>            minItems: 4
> +          maxItems: 4
>  
>          clocks:
>            minItems: 24
> @@ -368,7 +394,7 @@ allOf:
>              - const: top_netsys_warp_sel
>  
>  patternProperties:
> -  "^mac@[0-1]$":
> +  "^mac@[0-2]$":
>      type: object
>      unevaluatedProperties: false
>      allOf:
> @@ -382,6 +408,9 @@ patternProperties:
>        reg:
>          maxItems: 1
>  
> +      phys:
> +        maxItems: 1
> +
>      required:
>        - reg
>        - compatible
> @@ -559,3 +588,118 @@ examples:
>          };
>        };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt7988-clk.h>


Why is fixing the binding needing a new example? Is this example really 
different enough to justify a whole other example?

> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      ethernet@15100000 {
> +        compatible = "mediatek,mt7988-eth";
> +        reg = <0 0x15100000 0 0x80000>, <0 0x15400000 0 0x380000>;
> +        interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&ethsys CLK_ETHDMA_XGP1_EN>,
> +                 <&ethsys CLK_ETHDMA_XGP2_EN>,
> +                 <&ethsys CLK_ETHDMA_XGP3_EN>,
> +                 <&ethsys CLK_ETHDMA_FE_EN>,
> +                 <&ethsys CLK_ETHDMA_GP2_EN>,
> +                 <&ethsys CLK_ETHDMA_GP1_EN>,
> +                 <&ethsys CLK_ETHDMA_GP3_EN>,
> +                 <&ethsys CLK_ETHDMA_ESW_EN>,
> +                 <&ethsys CLK_ETHDMA_CRYPT0_EN>,
> +                 <&ethwarp CLK_ETHWARP_WOCPU2_EN>,
> +                 <&ethwarp CLK_ETHWARP_WOCPU1_EN>,
> +                 <&ethwarp CLK_ETHWARP_WOCPU0_EN>,
> +                 <&topckgen CLK_TOP_ETH_GMII_SEL>,
> +                 <&topckgen CLK_TOP_ETH_REFCK_50M_SEL>,
> +                 <&topckgen CLK_TOP_ETH_SYS_200M_SEL>,
> +                 <&topckgen CLK_TOP_ETH_SYS_SEL>,
> +                 <&topckgen CLK_TOP_ETH_XGMII_SEL>,
> +                 <&topckgen CLK_TOP_ETH_MII_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_500M_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_PAO_2X_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_SYNC_250M_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_PPEFB_250M_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_WARP_SEL>;
> +
> +        clock-names = "xgp1", "xgp2", "xgp3", "fe", "gp2", "gp1",
> +                      "gp3", "esw", "crypto",
> +                      "ethwarp_wocpu2", "ethwarp_wocpu1",
> +                      "ethwarp_wocpu0", "top_eth_gmii_sel",
> +                      "top_eth_refck_50m_sel", "top_eth_sys_200m_sel",
> +                      "top_eth_sys_sel", "top_eth_xgmii_sel",
> +                      "top_eth_mii_sel", "top_netsys_sel",
> +                      "top_netsys_500m_sel", "top_netsys_pao_2x_sel",
> +                      "top_netsys_sync_250m_sel",
> +                      "top_netsys_ppefb_250m_sel",
> +                      "top_netsys_warp_sel";
> +        assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
> +                          <&topckgen CLK_TOP_NETSYS_GSW_SEL>,
> +                          <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>,
> +                          <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>,
> +                          <&topckgen CLK_TOP_SGM_0_SEL>,
> +                          <&topckgen CLK_TOP_SGM_1_SEL>;
> +        assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
> +                                 <&topckgen CLK_TOP_NET1PLL_D4>,
> +                                 <&topckgen CLK_TOP_NET1PLL_D8_D4>,
> +                                 <&topckgen CLK_TOP_NET1PLL_D8_D4>,
> +                                 <&apmixedsys CLK_APMIXED_SGMPLL>,
> +                                 <&apmixedsys CLK_APMIXED_SGMPLL>;
> +        mediatek,ethsys = <&ethsys>;
> +        mediatek,infracfg = <&topmisc>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mac@0 {
> +          compatible = "mediatek,eth-mac";
> +          reg = <0>;
> +          phy-mode = "internal"; /* CPU port of built-in 1GE switch */
> +
> +          fixed-link {
> +            speed = <10000>;
> +            full-duplex;
> +            pause;
> +          };
> +        };
> +
> +        mac@1 {
> +          compatible = "mediatek,eth-mac";
> +          reg = <1>;
> +          phy-handle = <&int_2p5g_phy>;
> +        };
> +
> +        mac@2 {
> +          compatible = "mediatek,eth-mac";
> +          reg = <2>;
> +          pcs-handle = <&usxgmiisys0>;
> +          phy-handle = <&phy0>;
> +        };
> +
> +        mdio_bus: mdio-bus {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          /* external PHY */
> +          phy0: ethernet-phy@0 {
> +            reg = <0>;
> +            compatible = "ethernet-phy-ieee802.3-c45";
> +          };
> +
> +          /* internal 2.5G PHY */
> +          int_2p5g_phy: ethernet-phy@15 {
> +            reg = <15>;
> +            compatible = "ethernet-phy-ieee802.3-c45";
> +            phy-mode = "internal";
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.43.0

