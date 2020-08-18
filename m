Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8F4C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:47:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA5F206B5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqW4G+h7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA5F206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L1aCcCyJP1OOqq2EJyOTepNOPaqiDDLX+kXwggib3AU=; b=kqW4G+h7XiO0EF56OxOPqteRA
	YO8M+fArdfZncLIGt/jOlHdVClTtiTtGDZG96PUh71/d3JSlDJ98vS2WDZcQDugh/V/aC38uvKfAS
	WhEi4MM5jYJWgm9HLtrYZM1XpHJzckqWFgxS9TV0v6CvdawC872hKg89qfQ3VBjWNBFqKbVfZL8qd
	3jC5KKmd6dMffnteBW1Sdq/yam5kReK7NYDCi+ljFWBlI+OeSYI0wWL3mI8g93OgqNOwQSRChOkyY
	+wFtGB3j46obmOYLdRyKlf72D/PXYJeIK4qfFKwhDKFc3fNS8owY4QgD2LrWkUzUkSUmnx1+dtU5i
	6jhm4H3Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k84lh-00013y-GJ; Tue, 18 Aug 2020 16:47:25 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k84ld-00012a-1c; Tue, 18 Aug 2020 16:47:22 +0000
Received: by mail-io1-f65.google.com with SMTP id g14so21925875iom.0;
 Tue, 18 Aug 2020 09:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NSMYlwO+VfOjU0V+XqYxs1ZxBo2QTZMze+8ZyPk+OD4=;
 b=LEktNTnH6nh910PHjqQ1UjNCJtJJWdr3XoZP82W8c8PiknGLVpWrKxk9ngtN0EaLGW
 SPqdBR1NGr8pegIVYXuTh0TcSYhOYuJGZeajYwa8hR+oXuXHFZYE/7nZaY6vSN8AFnvF
 DnbtBpjdg5/Hsm8Z4dRbtbQktvCKdOLaYNK0dnHVhsy06wzSj51XKi6f8ciuiUVc4Eo5
 TtEQcCG05V7ZXrC2631H9zgXHr4TXwddkpkaBYTaw18qadaCeA4C0h3HwDwap7c3EzZf
 0sHQIQMKBDs9QrSVvaB5oQz+IYRBpprv/eT4PC3dajBkH/HIcBIsp5CJnNqNSo3d12ch
 YZXA==
X-Gm-Message-State: AOAM531l1IWGXvmNrLUBWoU7y6lCvOLCQ4Md44E/mm75K9K5ZMeSiBpG
 XUblDrdCeGoIVit8nVzcew==
X-Google-Smtp-Source: ABdhPJzvleVEKri4tZ4vGfAE9bIC48yFrtP5qyVVc1nA+KSvxzO5glyEmDkdprx9yso4/nfmuslBNQ==
X-Received: by 2002:a05:6638:2604:: with SMTP id
 m4mr20047427jat.76.1597769239771; 
 Tue, 18 Aug 2020 09:47:19 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id s143sm9945032ilc.14.2020.08.18.09.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 09:47:19 -0700 (PDT)
Received: (nullmailer pid 3601369 invoked by uid 1000);
 Tue, 18 Aug 2020 16:47:18 -0000
Date: Tue, 18 Aug 2020 10:47:18 -0600
From: Rob Herring <robh@kernel.org>
To: EastL Lee <EastL.Lee@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
Message-ID: <20200818164718.GB3596085@bogus>
References: <1597719834-6675-1-git-send-email-EastL.Lee@mediatek.com>
 <1597719834-6675-2-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597719834-6675-2-git-send-email-EastL.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_124721_115980_7C90F42A 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 11:03:51AM +0800, EastL Lee wrote:
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6779 SoC or other similar Mediatek SoCs.
> 
> Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> ---
>  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> new file mode 100644
> index 0000000..fe03081
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/mtk-cqdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Command-Queue DMA controller Device Tree Binding
> +
> +maintainers:
> +  - EastL Lee <EastL.Lee@mediatek.com>
> +
> +description:
> +  MediaTek Command-Queue DMA controller (CQDMA) on Mediatek SoC
> +  is dedicated to memory-to-memory transfer through queue based
> +  descriptor management.
> +
> +allOf:
> +  - $ref: "dma-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt6765-cqdma
> +      - const: mediatek,mt6779-cqdma

Use enum instead of oneOf+const.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 5
> +    description:
> +        A base address of MediaTek Command-Queue DMA controller,
> +        a channel will have a set of base address.
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 5
> +    description:
> +        A interrupt number of MediaTek Command-Queue DMA controller,
> +        one interrupt number per dma-channels.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: cqdma
> +
> +  dma-channels:
> +    $ref: /schemas/types.yaml#definitions/uint32

Common properties already have a type definition.

> +    description:
> +      Number of DMA channels supported by MediaTek Command-Queue DMA
> +      controller, support up to five.
> +    items:

Not an array, so drop 'items'.

> +      minimum: 1
> +      maximum: 5
> +
> +  dma-requests:
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    description:
> +      Number of DMA request (virtual channel) supported by MediaTek
> +      Command-Queue DMA controller, support up to 32.
> +    items:
> +      minimum: 1
> +      maximum: 32

Same issues here.

> +
> +required:
> +  - "#dma-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dma-channel-mask

Need to list in properties to fix the check error:

dma-channel-mask: true

> +  - dma-channels
> +  - dma-requests
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt6779-clk.h>
> +    cqdma: dma-controller@10212000 {
> +        compatible = "mediatek,mt6779-cqdma";
> +        reg = <0x10212000 0x80>,
> +            <0x10212080 0x80>,
> +            <0x10212100 0x80>;
> +        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>,
> +            <GIC_SPI 140 IRQ_TYPE_LEVEL_LOW>,
> +            <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&infracfg_ao CLK_INFRA_CQ_DMA>;
> +        clock-names = "cqdma";
> +        dma-channel-mask = <0x3f>;
> +        dma-channels = <3>;
> +        dma-requests = <32>;
> +        #dma-cells = <1>;
> +    };
> +
> +...
> -- 
> 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
