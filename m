Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB97AC4741F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 17:30:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505112075E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 17:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1TwVnnpK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aeynrkEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 505112075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9U7tReCX3cTXl3Yw9J9vH8ilOi4VLqFo30lCsEpxUts=; b=1TwVnnpKesyxLrqNJOXiWv9E6
	laMslW/t+uXmPYO74xx7u9kSzR7XyQliFCeQFzk2zIhPfteXj704RXGsOqC0Ea8eVJYvBV1Er+d8K
	kWrbJUUCJ9vlA6SFdLvZiNS6aD/WQOToqTbMgY/58B4Le65PDIvP3vmoT0QYU3EMuLfob2PmXPYNk
	EjcA5+JfhtoTFmlUM4vR+fJHlIAWLWZcepDHAK5/oXUGrbofZFCoDabZdwtJ00W6fvpoAhcaAyLXI
	9rt5VgaTy9cTIVzPX35WtK9nLne8DW7d9XPNqIljQMhlgBi61xTjpiCml7ugnRJYtur13VRavavbv
	7F/6SEk2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNJS8-00024m-O8; Tue, 29 Sep 2020 17:30:12 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJS5-00023i-N4
 for linux-mediatek@lists.infradead.org; Tue, 29 Sep 2020 17:30:11 +0000
Received: by mail-pg1-x541.google.com with SMTP id x16so4426696pgj.3
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2020 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fFztEzSJ2rV1rMZN9OkJojf3DIgVoZo3w4SHkm4pQyk=;
 b=aeynrkEnHlUKQBiPgnMNPHfg0Nz/g4+4y8462gVE1P3bPzk3sGsp1nXqWgmTcx537r
 K7NYa5MGpJxLWQ/ElST1A5ZqgN+GdxSQwLJiXt3UDJIVJdAR/ChP3fkVCrpIRP+IdFXy
 8Yjieyth0CDInMoo2PGaIxgNGd8tsKCbAjF6QurEsgKr5SrrhLO5GkOZgn/9ePtPy+Q4
 /FAckVwJnbOUDfuknKlAEctofIK3BQaIJOd8FlKw0yn2dIZi0km/l7eBAEuvVvGSyBg7
 FeCjLtaeZjT2Zy52Sjl4EUXfOEO1I6G6g0x3Wkq7HI+szuz9JNYZsByWB7AwNGc+Qz8Q
 hmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fFztEzSJ2rV1rMZN9OkJojf3DIgVoZo3w4SHkm4pQyk=;
 b=l6OY1Dx5opnWKCPF32fzzyRKaQvt6RwuMHEamwbf77ZGYkonfi+Bqp5nBtZtYZT4UF
 OHxiGcoDPcDVNDAtknIsPx/gWooFzEvIdpeaQ1fQ+3X/iuMHYbnmL0KL8KhBklgsFAOq
 y/JiP6XL8EmxgEYt7kwREtdF+RywZjyUZoqp+ifFTcjP8yFECASzr0nKAALZj12Zocsu
 qRh48IfHLqGGLwhzL4tNBlPKWXbNcY86eSH8MAd+ZZ5NXgYTHwuiYsa2DgpzM6KCD6xW
 xYkvaCpv33EETIN+6i4oAHkP2AxsUHjnDHtxsRU/CP/2JrccbVUxPeCWGkJY5Gc2bQUd
 f7NA==
X-Gm-Message-State: AOAM531vyaA+R2UGwUV/MumM5CSu9Pqo/FSKcWzHbsMUMwpyIBpApy+S
 3DfLojSldXifYnbg3022KLwpQw==
X-Google-Smtp-Source: ABdhPJwYRq0qr3kl6y4PgVWlwBb8KVS0Fu4JKWsnWScQjJaKTexwp1yZHfnEDT2p1jBCWeNI6lFv2A==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id
 m184-20020a6226c10000b0290142250135efmr4783468pfm.79.1601400606139; 
 Tue, 29 Sep 2020 10:30:06 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id n72sm6976829pfd.27.2020.09.29.10.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 10:30:05 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:30:03 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt bindings: remoteproc: Add bindings for MT8183
 APU
Message-ID: <20200929173003.GA124290@xps15>
References: <20200910130148.8734-1-abailon@baylibre.com>
 <20200910130148.8734-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910130148.8734-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_133010_072107_3565FF16 
X-CRM114-Status: GOOD (  19.20  )
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
 stephane.leprovost@mediatek.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, gpain@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 03:01:45PM +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> new file mode 100644
> index 000000000000..7a71d2f5c4e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MT8183 AI Processor Unit (APU) a.k.a. Vision Processor Unit (VPU)
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
> +    description:
> +      Three clocks are expected for AXI, IPU and JTAG.
> +      The JTAG clock seems to be required to run the DSP,
> +      even when JTAG is not in use."
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
> +    maxItems: 1
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
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - power-domains
> +
> +additionalProperties: false
> +

What about the pintctrl for the JTAG part?

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
> +      apu_ram: apu_ram@0x60000000 {
> +        compatible = "shared-dma-pool";
> +        reg = <0x60000000 0x040000000>;
> +        no-map;
> +        linux,cma-default;
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
> +      memory-region = <&apu_ram>;
> +    };
> +...
> -- 
> 2.26.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
