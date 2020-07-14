Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088A5C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 17:22:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C778822519
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 17:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HEmOlGhU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C778822519
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pHx25hAGHgWG4fmKpfHoSmAhML/JhQfo2zH5QXKQVoA=; b=HEmOlGhUUVLSUKnPx0XEGRUJI
	XdAet75N4z5r/LuCmiCQmHXRHAh8/xkPcy3RuwfvkLWJc/glQsgzYZW0o4JfxOc4Kx+pnD/EBlf4G
	i/Rk9KBDhjUkZxDqgZtDEYh9jQWEK05ff3kginmj5Zoe2/Cde34oUcJG9HCiBgJGfSlsUIx3r9dre
	hCxITPX3UsdzsxCOziuqMYoOJrPke9Rr6fd44vhIq25NxyPItXw6Omktnj3rSCkd0e9bKyNahgf5v
	UO63f/g2XVqVL5aHfNRS2ZoMOSjhetw/aMy0jVRnJyt/li2AOD14woexWvFh4z8wlQCl70+Pgyckb
	Ckxg4jCfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvOdF-0006wl-Fp; Tue, 14 Jul 2020 17:22:17 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvOdB-0006vr-Qf; Tue, 14 Jul 2020 17:22:14 +0000
Received: by mail-io1-f67.google.com with SMTP id a12so18071844ion.13;
 Tue, 14 Jul 2020 10:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zIt5OZfKObqlXbh9Y2BY80CKEiDpSojHfWV57lWnUjc=;
 b=T9RiCZdHa9rFMiOvdlu62xb7oWM8CfWV/Ub4jBf90h09qpKm3J8BRw+A9uLTGT8VKZ
 w2+PbEzbCnupgea7F93KgqZhv5Xae/CSRXmha3gNTkBZzlwbP6+3AcQxzC4m2AaZX/VH
 YaV71XgqpS463nFMw3Py9WgPfQc0KSDAMA6ERALDHiaJB39lYI1dMh9kzir4MAtSMKpI
 syw20Unyuei9efPAG0pg4DVHcVQH2bsARCSh5o5nOMLEF1q/TUHG2cJSqZNyV8QYcJG9
 pBIgrjhZZd5I9Fi+fu+K8dFV3j7St9iOkYP2DkER8yFF986a16A0FRrr9UoGRLKHVKTV
 IFlA==
X-Gm-Message-State: AOAM531f6baXVxhZNPdTW+L6RiaN3q3/TWv7mlCLeQxmiJV1ZVpuL0Vz
 E3cd4LH4/WOXnImeTtwjkw==
X-Google-Smtp-Source: ABdhPJzL0Eh1erToxXdqHVSulTFB+j8bwTNM76ArDHjnTAymGlqxWHZNJnvdzHTRcwcx65y6vf9Okg==
X-Received: by 2002:a05:6602:2d03:: with SMTP id
 c3mr5933280iow.188.1594747333291; 
 Tue, 14 Jul 2020 10:22:13 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t12sm10207185ilo.80.2020.07.14.10.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 10:22:12 -0700 (PDT)
Received: (nullmailer pid 2562210 invoked by uid 1000);
 Tue, 14 Jul 2020 17:22:11 -0000
Date: Tue, 14 Jul 2020 11:22:11 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH 1/6] dt bindings: remoteproc: Add bindings for MT8183 APU
Message-ID: <20200714172211.GB2551057@bogus>
References: <20200713132927.24925-1-abailon@baylibre.com>
 <20200713132927.24925-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713132927.24925-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_132213_909283_1F032D6B 
X-CRM114-Status: GOOD (  19.13  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2020 at 03:29:22PM +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> new file mode 100644
> index 000000000000..1d5fcc135617
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MT8183 Vision Processor Unit (VPU) devices

APU or VPU?

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
> +    description:
> +      Address ranges of the APU MMIO.

Don't put generic descriptions for standard properties.

> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      The interrupt number used to receive the interrupts from the DSP.
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      "Clocks for co-processor (See: ../clock/clock-bindings.txt)
> +      Three clocks are expected for AXI, IPU and JTAG.
> +      The JTAG clock seems to be required to run the DSP,
> +      even when JTAG is not in use."
> +    maxItems: 3

blank line between properties please.

> +  clock-names:
> +    description:
> +      The name of clocks, must be ipu, axi and jtag

That's what the schema says...

> +    items:
> +      - const: ipu
> +      - const: axi
> +      - const: jtag
> +
> +  iommu:
> +    description: "IOMMU (See: ../iommu/iommu.txt)"
> +    maxItems: 3
> +
> +  memory-region:
> +    description: "Reserved memory (See: ../reserved-memory/reserved-memory.txt)"
> +    maxItems: 1
> +
> +  power-domains:
> +    description: "Power domain (see: ../power/power_domain.txt)"
> +    maxItems: 1
> +
> +  pinctrl:
> +    description: pinctrl handles, required to configure pins for JTAG.
> +    maxItems: 2
> +
> +  pinctrl-names:
> +    description:
> +      pinctrl name, must be "default", "jtag".
> +      "default" must configure the pins when JTAG is disabled.
> +      "jtag" must configure the pins for JTAG operations.
> +    items:
> +      - const: default
> +      - const: jtag
> +    maxItems: 2

Don't need maxItems.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommu
> +  - memory-region
> +  - power-domains

Add:

additionalProperties: false

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
> +      vpu_ram: vpu_ram@0x60000000 {
> +        compatible = "shared-dma-pool";
> +        reg = <0 0x60000000 0 0x040000000>;
> +        no-map;
> +        linux,cma-default;
> +      };
> +    };
> +
> +    vpu0: vpu@0x19100000 {

vpu?

Drop the '0x'

> +      compatible = "mediatek,mt8183-apu";
> +      reg = <0 0x19180000 0 0x14000>;

The default cell size for examples is 1.

> +      reg-names = "mmio";
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

Doesn't match the schema which 'make dt_binding_check' will tell you.

> +
> +      power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
> +      memory-region = <&vpu_ram>;
> +    };
> +...
> -- 
> 2.26.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
