Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0686C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hKSys28+vOcOduvTb7EQgO5gT98369VH35Rxtl/8aM=; b=NmFElFTpLYa8uJ
	fG7MaPVqibulXuzHfhlcGxzaB8GrbKJEssMVwC5YBo69MRMZ85hKAlKZJVRx0DBGzGHl4vFCNFIdh
	lfwPap50x0kQ1wD0Run+99RcxZUuS8goMCzqJ5vTMhaAwem86dEre2hNeZJA2nf9vKFNdtrEMXTtZ
	P07DZuubfrA/oSb8Gs0ToNdksMwPqumFzx3sIVyvtzTl185yR0nbMGCoHwwAs+a9C3quKqcRWHCYa
	xa2RBoeCReRCvHdPQLyQMc0WoU/dBVKw5ydf3+f6GoYPGwyHcGLJawmFMGqTTSWI3VMG3ZCtyqQqP
	aaA8Ow011jYfEhWuGyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMXm-001w3Y-MC; Mon, 07 Mar 2022 23:13:34 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMXR-001vw3-MX; Mon, 07 Mar 2022 23:13:15 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so4090946otq.11; 
 Mon, 07 Mar 2022 15:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2/DahnhrrL/jdB0W/TX4PSLrYdtNRildr05b0KSXkCI=;
 b=rDW4OdGMyDHHftGUef/tKlGJ0jTZpXM0pqfj9Q9gQpulmEsjlYY5oq5lRfGVywCm91
 GlTuOHrwvYJlo3YEDbspPt2pfu27FnYRMpP1UnuiFFiwN5hLzwUxMWm4upFnI5QSp9LD
 Ahj131iLEEgTdEAT54068VmciWoFN/uyHOduRPkCDBNLqadVurGlBrMYCCZschJbJ8Y1
 XjnjlnK150QE/B0FkFWvpwm4SoCZjB1CByx3PnSVDi1yvzC7vmZXVIopNVXoFFIot1or
 i4TJgO/hRGV+cSwbGuyFN3TIN3FcQLXS0wwKQKCaATdMmbSSZRRXaSrFlrkqqklHXY0S
 o6EA==
X-Gm-Message-State: AOAM530sHVB8w609l89f5H85tM9wyOcoZejXwfqVn4uDQIIPORa4MYru
 c5T64B1+MYggS1ndG/0RG3gOcoTYhA==
X-Google-Smtp-Source: ABdhPJz5YrAJp5ahVdp+farn9/jwvddcBMFpjQ8JynmRqN9lTMELxi2ky9lAb04HsWWkxDZTDgMR3A==
X-Received: by 2002:a05:6830:165a:b0:5af:12dc:65e5 with SMTP id
 h26-20020a056830165a00b005af12dc65e5mr6983650otr.30.1646694792187; 
 Mon, 07 Mar 2022 15:13:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 69-20020a9d0bcb000000b005af83322c6asm6917909oth.12.2022.03.07.15.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:13:11 -0800 (PST)
Received: (nullmailer pid 3439393 invoked by uid 1000);
 Mon, 07 Mar 2022 23:13:10 -0000
Date: Mon, 7 Mar 2022 17:13:10 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.or, matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com
Subject: Re: [PATCH v4 1/7] dt bindings: remoteproc: Add bindings for the
 MT8183 APU
Message-ID: <YiaRhu+tSg7+ZH16@robh.at.kernel.org>
References: <20220304161514.994128-1-abailon@baylibre.com>
 <20220304161514.994128-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304161514.994128-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_151313_784222_3F1A7251 
X-CRM114-Status: GOOD (  19.11  )
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

On Fri, Mar 04, 2022 at 05:15:08PM +0100, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> new file mode 100644
> index 000000000000..b640aa96d678
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek AI Processor Unit (APU)
> +
> +description:
> +  This document defines the binding for the APU, a co-processor that could
> +  offload the CPU for machine learning and neural network.
> +
> +maintainers:
> +  - Alexandre Bailon <abailon@bayLibre.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8183-apu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: ipu
> +      - const: jtag
> +
> +  iommus:
> +    maxItems: 3
> +
> +  memory-region:
> +    maxItems: 3
> +
> +  memory-region-da:
> +    description:
> +      Array of APU device address. This is used to map the APU device address
> +      to a physical address.
> +    maxItems: 3

'dma-ranges' should work for this.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  pinctrl:
> +    description: pinctrl handles, required to configure pins for JTAG.
> +
> +  pinctrl-names:
> +    items:
> +      - const: jtag
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - memory-region-da
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8183-larb-port.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +
> +    reserved-memory {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      vdev0buffer: vdev0buffer@52900000 {
> +        compatible = "shared-dma-pool";
> +        reg = <0x52900000 0x4000>;
> +        no-map;
> +      };
> +
> +      vdev0vring0: vdev0vring0@52904000 {
> +        compatible = "shared-dma-pool";
> +        reg = <0x52904000 0x2000>;
> +        no-map;
> +      };
> +
> +      vdev0vring1: vdev0vring1@52906000 {
> +        compatible = "shared-dma-pool";
> +        reg = <0x52906000 0x2000>;
> +        no-map;
> +      };
> +    };
> +
> +    apu0: apu@19100000 {
> +      compatible = "mediatek,mt8183-apu";
> +      reg = <0x19180000 0x14000>;
> +      interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
> +
> +      iommus = <&iommu M4U_PORT_IMG_IPUO>,
> +         <&iommu M4U_PORT_IMG_IPU3O>,
> +         <&iommu M4U_PORT_IMG_IPUI>;
> +
> +      clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
> +         <&ipu_core0 CLK_IPU_CORE0_IPU>,
> +         <&ipu_core0 CLK_IPU_CORE0_JTAG>;
> +
> +      clock-names = "axi", "ipu", "jtag";
> +
> +      power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
> +      memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>;
> +      memory-region-da = <0x6fff8000>, <0x6fffc000>, <0x6fffe000>;
> +    };
> +...
> -- 
> 2.34.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
