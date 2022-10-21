Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456ADC38A2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 22:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ryaf/nHDVcA/eQWFjnz2HeLV82v94Yc8HmkS0sZ9140=; b=yr0OdQjlyIQWsJvp6IqFtiFPi2
	IA2TcKcvdEv8ykKVV9pchWiMe3STsrRjDGLcTq1oXjsXpGsxcO5wDcC8i2u1x67Lj6OEEbH59zVk3
	baLpq9u9OuTQ7urLrpJ85Vy++Je4qIiCnrKQeySteNoIq2P+sT6cdqOiwOFwJA5RILp95UhdDvpVX
	K+ZGisGy1TFpd/rRNujZLGsIxQq3xokDHlqrgHlHnO1rpTqR2CpgbDHjXBL7G4l9kiEDBCB0etKc2
	GL3NV/AN/1nMD6Vqzgjbyn5sUgLg8eFjxVLYHzsC9vuVClqhdDL5zWafUJT4V+MrVe0HDnm1Zdeb9
	urqYJhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0i1-00AGAU-PF; Fri, 21 Oct 2022 22:41:45 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0hy-00AG9p-1G
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 22:41:44 +0000
Received: by mail-oi1-f174.google.com with SMTP id j188so4842190oih.4
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Oct 2022 15:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ryaf/nHDVcA/eQWFjnz2HeLV82v94Yc8HmkS0sZ9140=;
        b=4b7UYGdZ2IqWbgyrc17O2KF/LV5wgctQxKyKTFBx5VKvoQ7uGIAZGZ+14Y3Q3LNfIX
         GH0ZBfgBvG0SL1UH8LtrciLVZOZ7CzBZIrM9Uxhe9q7/b/e66dPMpjbqBtdp84cvPsYu
         flNlbr9PJsCpvBi9HMO6WutEC51ZngDwJsPLezUKrCfZ17EqGNdAABHDzNY2kXcMIhWd
         hZoJNEKB2exwZ9JifTm8b84Fj7WcoGGFpy4uWWpkzGj8WwFntw9myeVZWlq+Zt8KnmLa
         Ui0j12swzbOTcblT7FwK5ksxP4i9u1ttZUL7AFubk5pwpxbOST5SO0xbEuQIUzQBmiTz
         +bdw==
X-Gm-Message-State: ACrzQf0lxUlIOED8HYs0pdzlHQ082GWBD31UCmzP+PyEmk1X7ILRynTz
	Op/KsdY9tGFWRTqV1GDVWA==
X-Google-Smtp-Source: AMsMyM6TS4WdNKukLr6w1bc4tvmj8BCa0q5TVhC669ruBejn8dfeAcDtEB9g0XfM3sKjLIGa7+E5iA==
X-Received: by 2002:a05:6808:2209:b0:354:68e4:fd28 with SMTP id bd9-20020a056808220900b0035468e4fd28mr25458920oib.250.1666392099919;
        Fri, 21 Oct 2022 15:41:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l24-20020a4a3518000000b00432ac97ad09sm9150784ooa.26.2022.10.21.15.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:41:39 -0700 (PDT)
Received: (nullmailer pid 586928 invoked by uid 1000);
	Fri, 21 Oct 2022 22:41:40 -0000
Date: Fri, 21 Oct 2022 17:41:40 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, daniel@makrotopia.org
Subject: Re: [PATCH net-next 2/6] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Message-ID: <20221021224140.GA574155-robh@kernel.org>
References: <cover.1666368566.git.lorenzo@kernel.org>
 <7a454984f0001a71964114b71f353cb47af95ee6.1666368566.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a454984f0001a71964114b71f353cb47af95ee6.1666368566.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_154142_107995_BE3EE767 
X-CRM114-Status: GOOD (  22.24  )
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

On Fri, Oct 21, 2022 at 06:18:32PM +0200, Lorenzo Bianconi wrote:
> Document the binding for the RX Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> forwarded to LAN/WAN one.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 126 ++++++++++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-boot.yaml |  45 +++++++
>  .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml |  49 +++++++
>  .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  |  66 +++++++++
>  4 files changed, 286 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> index 84fb0a146b6e..623f11df5545 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> @@ -29,6 +29,59 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  mediatek,wocpu_emi:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing reserved memory used by mtk wed firmware
> +      (see bindings/reserved-memory/reserved-memory.txt)

What does that file contain?

There's a standard property to refer to reserved-memory nodes, use it.

> +
> +  mediatek,wocpu_data:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing reserved memory used by mtk wed firmware
> +      (see bindings/reserved-memory/reserved-memory.txt)
> +
> +  mediatek,wocpu_ilm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing memory used by mtk wed firmware
> +
> +  mediatek,ap2woccif:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description:
> +      Phandle to the mediatek wed-wo controller.
> +
> +  mediatek,wocpu_boot:

s/_/-/

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description:
> +      Phandle to the mediatek wed-wo boot interface.
> +
> +  mediatek,wocpu_dlm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description:
> +      Phandle to the mediatek wed-wo rx hw ring.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt7986-wed
> +    then:
> +      properties:
> +        mediatek,wocpu_data: true
> +        mediatek,wocpu_boot: true
> +        mediatek,wocpu_emi: true
> +        mediatek,wocpu_ilm: true
> +        mediatek,ap2woccif: true
> +        mediatek,wocpu_dlm: true
> +
>  required:
>    - compatible
>    - reg
> @@ -49,3 +102,76 @@ examples:
>          interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
>        };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/ti-syscon.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        wocpu0_emi: wocpu0_emi@4fd00000 {
> +          reg = <0 0x4fd00000 0 0x40000>;
> +          no-map;
> +        };
> +
> +        wocpu_data: wocpu_data@4fd80000 {
> +          reg = <0 0x4fd80000 0 0x240000>;
> +          no-map;
> +        };
> +      };
> +
> +      ethsys: syscon@15000000 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "mediatek,mt7986-ethsys", "syscon";
> +        reg = <0 0x15000000 0 0x1000>;
> +
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        ethsysrst: reset-controller {
> +          compatible = "ti,syscon-reset";
> +          #reset-cells = <1>;
> +          ti,reset-bits = <0x34 4 0x34 4 0x34 4 (ASSERT_SET | DEASSERT_CLEAR | STATUS_SET)>;
> +        };

You don't need to show providers in examples. Presumably we already have 
an example of them in their binding.

> +      };
> +
> +      wocpu0_ilm: wocpu0_ilm@151e0000 {
> +        compatible = "mediatek,wocpu0_ilm";
> +        reg = <0 0x151e0000 0 0x8000>;
> +      };
> +
> +      cpu_boot: wocpu_boot@15194000 {
> +        compatible = "mediatek,wocpu_boot", "syscon";
> +        reg = <0 0x15194000 0 0x1000>;
> +      };
> +
> +      ap2woccif0: ap2woccif@151a5000 {
> +        compatible = "mediatek,ap2woccif", "syscon";
> +        reg = <0 0x151a5000 0 0x1000>;
> +        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +
> +      wocpu0_dlm: wocpu_dlm@151e8000 {
> +        compatible = "mediatek,wocpu_dlm";
> +        reg = <0 0x151e8000 0 0x2000>;
> +        resets = <&ethsysrst 0>;
> +        reset-names = "wocpu_rst";
> +      };
> +
> +      wed1: wed@1020a000 {
> +        compatible = "mediatek,mt7986-wed","syscon";
> +        reg = <0 0x15010000 0 0x1000>;
> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        mediatek,wocpu_data = <&wocpu_data>;
> +        mediatek,ap2woccif = <&ap2woccif0>;
> +        mediatek,wocpu_ilm = <&wocpu0_ilm>;
> +        mediatek,wocpu_dlm = <&wocpu0_dlm>;
> +        mediatek,wocpu_emi = <&wocpu_emi>;
> +        mediatek,wocpu_boot = <&cpu_boot>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
> new file mode 100644
> index 000000000000..dc8fdb706960
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boot.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek WED WO boot controller interface for MT7986

What is 'WED'?

> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek wo-boot provides a configuration interface for WED WO
> +  boot controller on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,wocpu_boot

This needs to be SoC specific.

And s/_/-/

> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      cpu_boot: wocpu_boot@15194000 {
> +        compatible = "mediatek,wocpu_boot", "syscon";
> +        reg = <0 0x15194000 0 0x1000>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
> new file mode 100644
> index 000000000000..8fea86425983
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-ccif.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek WED WO Controller for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek WO-ccif provides a configuration interface for WED WO
> +  controller on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,ap2woccif

SoC specific.

> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      ap2woccif0: ap2woccif@151a5000 {
> +        compatible = "mediatek,ap2woccif", "syscon";
> +        reg = <0 0x151a5000 0 0x1000>;
> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> new file mode 100644
> index 000000000000..529343c57e4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek WED WO hw rx ring interface for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek WO-dlm provides a configuration interface for WED WO
> +  rx ring on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    const: mediatek,wocpu_dlm

Soc specific

s/_/-/

> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/ti-syscon.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      ethsys: syscon@15000000 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "mediatek,mt7986-ethsys", "syscon";
> +        reg = <0 0x15000000 0 0x1000>;
> +
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        ethsysrst: reset-controller {
> +          compatible = "ti,syscon-reset";
> +          #reset-cells = <1>;
> +          ti,reset-bits = <0x34 4 0x34 4 0x34 4 (ASSERT_SET | DEASSERT_CLEAR | STATUS_SET)>;
> +        };
> +      };

Again, don't need the provider here.

> +
> +      wocpu0_dlm: wocpu_dlm@151e8000 {
> +        compatible = "mediatek,wocpu_dlm";
> +        reg = <0 0x151e8000 0 0x2000>;
> +        resets = <&ethsysrst 0>;
> +        reset-names = "wocpu_rst";
> +      };
> +    };
> -- 
> 2.37.3
> 
> 

