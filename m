Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34954C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQgx0ccNrbrgMsWXsBFX1wv/DhtC8Szp/8K1g/JGfCw=; b=1l2yY8QOttkm21
	33BRLO73lDDYchENPXP+/+xGUnRaYpgMDWLTlhT4m6NdS0eG8NFKEIrgMHa/K0CKkgyFZpTdDiFFy
	mqKbv4v6sVq2t8ylO9YLzQqy8aeNK93rKND3jm5VlBV90psQrnGz8Dm9TjQ9FDCmFAremm7IFgn8u
	hjDT3dss+n9S8pGsgnD0aMaQgnonbg50M7CriY2DN0Adm0lBqrn5ziyOr7Yz1VGU1TA56zz+4hq6r
	0TUjfKWr9H8Q5EumtEkaRVHOcZnfnrqJ0JgydNPmUf1XHUQ0lTI2SDssZsVhxI88FFxbywN04I/0A
	oqoval7tnuz8dMAdUzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSeG-0032vl-DA; Tue, 10 May 2022 16:23:44 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSeC-0032r6-AL
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 16:23:41 +0000
Received: by mail-oi1-f170.google.com with SMTP id i66so6536730oia.11
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 09:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AsmH6qO9HwkmcMOMbobeK/VdQk8dmPZzzT3Cf0QWRWs=;
 b=PnAMPEDlYG8ofl1H71bohM4MxxS9NOZ0pODouxgIK5pcl8Z+poXZ89FxJJ9dZZmAzd
 31zchEzNWxjQIW5/z41b+ynkLvWpRA3EhFbTFh1sQktOEceGibr8UK83HrvVUX9gPlsJ
 QBnU0RguESwJPQoaSTiQvA9S2mp0DBa5BieCe4tosLjq/qsQFbkSAtZtkIy/4HjX1/tn
 /7cpazIKm/Xs1IpSIOMJpul/efvE5wdy651oplOHDcgpRxoFHUPj6i/Kqv5nlF/RVE7k
 sk8qgne/3ZjkunvmlMMSq9pM2Tv8SoIPhpw16M685YMcLDqLo9AaesFdORJK3qI/RXm9
 ZDFQ==
X-Gm-Message-State: AOAM533HUfLEs0Yuyvg+C40WBFWZbk46Nj9UlNSVDlLDIE272tiEdvgd
 SnX73OZ9yJBvU9BrGZiqTQ==
X-Google-Smtp-Source: ABdhPJxrg0B07y3+mX7CtbGGxImTXRMtKDadJvvZD01n75pgpAm1PYwoLukdXANtBtPD9rUYwcPUeQ==
X-Received: by 2002:a05:6808:ec8:b0:2f9:6119:d6ed with SMTP id
 q8-20020a0568080ec800b002f96119d6edmr415268oiv.215.1652199817829; 
 Tue, 10 May 2022 09:23:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m33-20020a056870562100b000edf80be4ecsm5603899oao.58.2022.05.10.09.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:23:37 -0700 (PDT)
Received: (nullmailer pid 2135880 invoked by uid 1000);
 Tue, 10 May 2022 16:23:36 -0000
Date: Tue, 10 May 2022 11:23:36 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 02/14] dt-bindings: net: mediatek,net: add
 mt7986-eth binding
Message-ID: <YnqRiEvS8OV20NSY@robh.at.kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
 <ce9e2975645e81758558201337f50c6693143fd8.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce9e2975645e81758558201337f50c6693143fd8.1651839494.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_092340_422610_18624911 
X-CRM114-Status: GOOD (  18.09  )
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

On Fri, May 06, 2022 at 02:30:19PM +0200, Lorenzo Bianconi wrote:
> Introduce dts bindings for mt7986 soc in mediatek,net.yaml.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 133 +++++++++++++++++-
>  1 file changed, 131 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 43cc4024ef98..da1294083eeb 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -21,6 +21,7 @@ properties:
>        - mediatek,mt7623-eth
>        - mediatek,mt7622-eth
>        - mediatek,mt7629-eth
> +      - mediatek,mt7986-eth
>        - ralink,rt5350-eth
>  
>    reg:
> @@ -28,7 +29,7 @@ properties:
>  
>    interrupts:
>      minItems: 3
> -    maxItems: 3
> +    maxItems: 4

What's the new interrupt? This should describe what each entry is.

If the mt7986-eth must have all 4 interrupts, then the if/then needs a 
'minItems: 4'.

>  
>    power-domains:
>      maxItems: 1
> @@ -189,6 +190,43 @@ allOf:
>            minItems: 2
>            maxItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt7986-eth
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 15
> +          maxItems: 15
> +
> +        clock-names:
> +          items:
> +            - const: fe
> +            - const: gp2
> +            - const: gp1
> +            - const: wocpu1
> +            - const: wocpu0
> +            - const: sgmii_tx250m
> +            - const: sgmii_rx250m
> +            - const: sgmii_cdr_ref
> +            - const: sgmii_cdr_fb
> +            - const: sgmii2_tx250m
> +            - const: sgmii2_rx250m
> +            - const: sgmii2_cdr_ref
> +            - const: sgmii2_cdr_fb
> +            - const: netsys0
> +            - const: netsys1
> +
> +        mediatek,sgmiisys:
> +          minItems: 2
> +          maxItems: 2
> +

> +        assigned-clocks: true
> +
> +        assigned-clock-parents: true

These are automatically allowed on any node with 'clocks' (and now 
#clock-cells), so you can drop them.

> +
>  patternProperties:
>    "^mac@[0-1]$":
>      type: object
> @@ -219,7 +257,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - power-domains

Is that because this chip doesn't have power domains, or support for 
them hasn't been added? In the latter case, then you should keep this. 

>    - mediatek,ethsys
>  
>  unevaluatedProperties: false
> @@ -295,3 +332,95 @@ examples:
>          };
>        };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt7622-clk.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      eth: ethernet@15100000 {
> +        #define CLK_ETH_FE_EN            0
> +        #define CLK_ETH_WOCPU1_EN        3
> +        #define CLK_ETH_WOCPU0_EN        4
> +        #define CLK_TOP_NETSYS_SEL      43
> +        #define CLK_TOP_NETSYS_500M_SEL 44
> +        #define CLK_TOP_NETSYS_2X_SEL   46
> +        #define CLK_TOP_SGM_325M_SEL    47
> +        #define CLK_APMIXED_NET2PLL      1
> +        #define CLK_APMIXED_SGMPLL       3
> +
> +        compatible = "mediatek,mt7986-eth";
> +        reg = <0 0x15100000 0 0x80000>;
> +        interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ethsys CLK_ETH_FE_EN>,
> +                 <&ethsys CLK_ETH_GP2_EN>,
> +                 <&ethsys CLK_ETH_GP1_EN>,
> +                 <&ethsys CLK_ETH_WOCPU1_EN>,
> +                 <&ethsys CLK_ETH_WOCPU0_EN>,
> +                 <&sgmiisys0 CLK_SGMII_TX250M_EN>,
> +                 <&sgmiisys0 CLK_SGMII_RX250M_EN>,
> +                 <&sgmiisys0 CLK_SGMII_CDR_REF>,
> +                 <&sgmiisys0 CLK_SGMII_CDR_FB>,
> +                 <&sgmiisys1 CLK_SGMII_TX250M_EN>,
> +                 <&sgmiisys1 CLK_SGMII_RX250M_EN>,
> +                 <&sgmiisys1 CLK_SGMII_CDR_REF>,
> +                 <&sgmiisys1 CLK_SGMII_CDR_FB>,
> +                 <&topckgen CLK_TOP_NETSYS_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_SEL>;
> +        clock-names = "fe", "gp2", "gp1", "wocpu1", "wocpu0",
> +                      "sgmii_tx250m", "sgmii_rx250m",
> +                      "sgmii_cdr_ref", "sgmii_cdr_fb",
> +                      "sgmii2_tx250m", "sgmii2_rx250m",
> +                      "sgmii2_cdr_ref", "sgmii2_cdr_fb",
> +                      "netsys0", "netsys1";
> +        mediatek,ethsys = <&ethsys>;
> +        mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
> +        assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
> +                          <&topckgen CLK_TOP_SGM_325M_SEL>;
> +        assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
> +                                 <&apmixedsys CLK_APMIXED_SGMPLL>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mdio: mdio-bus {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          phy5: ethernet-phy@0 {
> +            compatible = "ethernet-phy-id67c9.de0a";
> +            phy-mode = "2500base-x";
> +            reset-gpios = <&pio 6 1>;
> +            reset-deassert-us = <20000>;
> +            reg = <5>;
> +          };
> +
> +          phy6: ethernet-phy@1 {
> +            compatible = "ethernet-phy-id67c9.de0a";
> +            phy-mode = "2500base-x";
> +            reg = <6>;
> +          };
> +        };
> +
> +        mac0: mac@0 {
> +          compatible = "mediatek,eth-mac";
> +          phy-mode = "2500base-x";
> +          phy-handle = <&phy5>;
> +          reg = <0>;
> +        };
> +
> +        mac1: mac@1 {
> +          compatible = "mediatek,eth-mac";
> +          phy-mode = "2500base-x";
> +          phy-handle = <&phy6>;
> +          reg = <1>;
> +        };
> +      };
> +    };
> -- 
> 2.35.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
