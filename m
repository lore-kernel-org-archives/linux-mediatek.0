Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD92CC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 22:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vG/lM5Scm6C9fOjiqfUwMglRna/2JcnpcVVOfgMSFA8=; b=RpuPXAON3iGo+sS8AF9Xc9AnsD
	okZ2/BwFvgw7Ziz+QYPIkSTR3GZsfSrmC97ZBY6vfnGYJVUr4ypu7YGjCV4h/qV9jdF74HroDIKgn
	O6Mf0Oi6IRtBuefaykB3sshfXAfw3eD3lGx4zh+DBRNz/GYDnvSbhRYnqg6BukhZA61OaVBDszowA
	ufQ/WkIPNUUeplCbPqdjhZcrQcz1rgpyNsBco7ID3SElxukgZXkKATNrQmtIrrH6P9JVS2R7phG/I
	WgdCweh7PHVbaS1kQyX1O14X3x1RNq/klVavW/ZJkihelm/kTe2Z5L1aF2avq9G2ePKOYrd2yH2Zm
	pQo/4iTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onSn1-007Stx-FD; Tue, 25 Oct 2022 22:52:55 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onSmy-007St0-Gh
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 22:52:54 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13b103a3e5dso17811745fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Oct 2022 15:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG/lM5Scm6C9fOjiqfUwMglRna/2JcnpcVVOfgMSFA8=;
        b=i3Cbr39Yt+rpqMYQCWKh1CYNH+7L2lnNfgytFqlXLPG5zposXg5Oe1V16WUcnk5Lis
         Q+YnfBzH7NbTkfctNNDJlpJfO/sGxtNnSFz0Fv6WlwIV6cpIVihOqA9fRS5yiJwj0MZk
         JH8YYPVZcTTabBrfrCEhpf8SIZCNj6kbsrOfCy8w1FVxMdmczjZdivtf5iGBper2mEC3
         vNbAG66+QpR3+P1Jg7NsAOMnEE5zCntuvnxQtHi3MPYDvT+tsyoT54gt4rQnM8687bVI
         t7RxC0leQJhFgqjfArP55RvSS6ldiHUfX9W4Doq008rBe8Iz73OQnSNXE/g+w4jOsMBo
         +egQ==
X-Gm-Message-State: ACrzQf1q1K/gk8JPMPBtGXTLCDEq61FWrGqemzomb7959l7UTd+ZyKH6
	q/9pcLnIzdwg/y3ucfyHEw==
X-Google-Smtp-Source: AMsMyM7uqt69DYPo5oMYk1VBEOnMyfPkaQavwbL3DqnR48ZxOmOrmki3NBlMxEca4YIAYU4wk/sTMw==
X-Received: by 2002:a05:6870:8306:b0:13c:c80:6cbd with SMTP id p6-20020a056870830600b0013c0c806cbdmr405081oae.68.1666738368011;
        Tue, 25 Oct 2022 15:52:48 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id eo33-20020a056870eca100b0010d5d5c3fc3sm2300105oab.8.2022.10.25.15.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 15:52:47 -0700 (PDT)
Received: (nullmailer pid 3412950 invoked by uid 1000);
	Tue, 25 Oct 2022 22:52:48 -0000
Date: Tue, 25 Oct 2022 17:52:48 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, daniel@makrotopia.org
Subject: Re: [PATCH v2 net-next 2/6] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Message-ID: <20221025225248.GA3405306-robh@kernel.org>
References: <cover.1666549145.git.lorenzo@kernel.org>
 <337ef332ca50e6a40f3fdceeb7262d91165c6323.1666549145.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <337ef332ca50e6a40f3fdceeb7262d91165c6323.1666549145.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_155252_585132_3C61986B 
X-CRM114-Status: GOOD (  22.25  )
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

On Sun, Oct 23, 2022 at 08:28:06PM +0200, Lorenzo Bianconi wrote:
> Document the binding for the RX Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> forwarded to LAN/WAN one.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 91 +++++++++++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-boot.yaml | 46 ++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml | 49 ++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  | 50 ++++++++++
>  4 files changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> index 84fb0a146b6e..8e2905004790 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> @@ -29,6 +29,41 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  memory-region:
> +    minItems: 3
> +    maxItems: 3

What is each entry? Need to define them.

> +    description:
> +      phandles to nodes describing reserved memory used by mt7986-wed firmware
> +      (see bindings/reserved-memory/reserved-memory.txt)

What does that document say?

(You don't need generic descriptions/refs of common properties)

> +
> +  mediatek,wo-ccif:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the mediatek wed-wo controller.
> +
> +  mediatek,wo-boot:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the mediatek wed-wo boot interface.
> +
> +  mediatek,wo-dlm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
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
> +        mediatek,wo-boot: true
> +        mediatek,wo-ccif: true
> +        mediatek,wo-dlm: true
> +        memory-region: true

This does nothing. You need the opposite? Disallow these properties for 
7622?

> +
>  required:
>    - compatible
>    - reg
> @@ -49,3 +84,59 @@ examples:
>          interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
>        };
>      };
> +
> +  - |

Why a new example? 
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        wo_emi: wo-emi@4fd00000 {
> +          reg = <0 0x4fd00000 0 0x40000>;
> +          no-map;
> +        };
> +
> +        wo_data: wo-data@4fd80000 {
> +          reg = <0 0x4fd80000 0 0x240000>;
> +          no-map;
> +        };
> +
> +        wo_ilm: wo-ilm@151e0000 {
> +          reg = <0 0x151e0000 0 0x8000>;
> +          no-map;
> +        };
> +      };

Don't need to show /reserved-memory in examples.

> +
> +      wo_boot: wo-boot@15194000 {
> +        compatible = "mediatek,mt7986-wo-boot","syscon";
> +        reg = <0 0x15194000 0 0x1000>;
> +      };
> +
> +      wo_ccif0: wo-ccif@151a5000 {
> +        compatible = "mediatek,mt7986-wo-ccif","syscon";
> +        reg = <0 0x151a5000 0 0x1000>;
> +        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
> +      };

Don't really need to show these either. You already have them in their 
own schemas and we don't need 2 examples.

Didn't I already say this?

> +
> +      wo_dlm0: wo-dlm@151e8000 {
> +        compatible = "mediatek,mt7986-wo-dlm";
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
> +        memory-region = <&wo_emi>, <&wo_data>, <&wo_ilm>;
> +        mediatek,wo-ccif = <&wo_ccif0>;
> +        mediatek,wo-boot = <&wo_boot>;
> +        mediatek,wo-dlm = <&wo_dlm0>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
> new file mode 100644
> index 000000000000..ce9c971e6604
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boot.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title:
> +  MediaTek Wireless Ethernet Dispatch WO boot controller interface for MT7986
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
> +          - mediatek,mt7986-wo-boot
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
> +      wo_boot: wo-boot@15194000 {
> +        compatible = "mediatek,mt7986-wo-boot","syscon";
> +        reg = <0 0x15194000 0 0x1000>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
> new file mode 100644
> index 000000000000..48cb27bcc4cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-ccif.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Wireless Ethernet Dispatch WO Controller for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek wo-ccif provides a configuration interface for WED WO
> +  controller on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7986-wo-ccif
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
> +      wo_ccif0: wo-ccif@151a5000 {
> +        compatible = "mediatek,mt7986-wo-ccif","syscon";
> +        reg = <0 0x151a5000 0 0x1000>;
> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> new file mode 100644
> index 000000000000..db9252598a42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek wo-dlm provides a configuration interface for WED WO
> +  rx ring on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7986-wo-dlm
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
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      wo_dlm0: wo-dlm@151e8000 {
> +        compatible = "mediatek,mt7986-wo-dlm";
> +        reg = <0 0x151e8000 0 0x2000>;
> +        resets = <&ethsysrst 0>;
> +        reset-names = "wocpu_rst";
> +      };
> +    };
> -- 
> 2.37.3
> 
> 

