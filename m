Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C75C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:59:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB5382076A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LM/07CUl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB5382076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L2TC99sopr1LkZwnBCJvNrEyEatUrhO3jJpjLPvBZhI=; b=LM/07CUlLTOyU19xXOH9yGgQD
	HWYi9WsvWEXFe6ZJhWeucmpBg/TD88EMiZTpMbNOREP1WSM5gI9zIoq8ZQniYNOZeHiFhBLq7iCN6
	aBIP4HSJLeguh75YfqvU/6QcQjR2YQpy2DeLCtbLRlW1RzY/oLcYaqJtZ0NNRpDHffS8gejeEHrz4
	IbgX0eWkyEgNNukWibehgKMDSjXktAeEF5gKkFX6YoPmzQLTTDhGESOp33L4qI5LVgI9WNfaJMVo7
	RRsylwQT9F5krzOaTpnZnm4/HMHP9JGpEQ5pejfrgG6QiugEYo+9FMPDKoZvmDLJaKAmL2sIBCOU+
	pAJ/AHHdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtddb-000162-AS; Thu, 09 Jul 2020 20:59:23 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtddW-000153-F1; Thu, 09 Jul 2020 20:59:19 +0000
Received: by mail-io1-f66.google.com with SMTP id i4so3773394iov.11;
 Thu, 09 Jul 2020 13:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=59KG2c36B73L5TCxEaW5iyr7aT9GnhJz2toja/ityzo=;
 b=qOd0Gy+w11fH56YGJQ5FsG82R8ekRDRu5eM1rvgFQzGVFD+PyvjL9wqAQqwQl0ZC7X
 tIxPEjedYcdJPLrCC3G1npF4sTCc1JdTNWGp+O5UOKHCJp33I4fTGxcNx4IOi2KdH40o
 ymcmDrbhJPYdIC8nEbJg7KrihBjNW354d0vNOzC/pk47QCkrFd7hNwAiFl9MmJ84TZTl
 +ezXfmmcmfi9MTpFp4BPMMIG0IlOWOdtDotOikbq6YeWMeGojwtzzu4p3Mbvk/I/JS+j
 /I0pa8nKb20O0Me9XeSQhmyDz9u0t+XD4bewDIszi3jnn8Gubar3LMFjRoi2LkgpXuN2
 9lzg==
X-Gm-Message-State: AOAM5308ApyQC1G1W8yL4kEfmNK/ZJbGi9dgriLI55Jc8a/fYxtNWqYA
 ZeS31T1cPNTDDtIAUWM7jw==
X-Google-Smtp-Source: ABdhPJz1XtipgZZTRvbo4upYYiZEu374WcNQ5YcX9yvzP6F343WQAYYz7MPsvmWiJt7sYOukO69ulw==
X-Received: by 2002:a05:6638:2591:: with SMTP id
 s17mr23248116jat.23.1594328357549; 
 Thu, 09 Jul 2020 13:59:17 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id h11sm2372624ilh.69.2020.07.09.13.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:59:16 -0700 (PDT)
Received: (nullmailer pid 875925 invoked by uid 1000);
 Thu, 09 Jul 2020 20:59:15 -0000
Date: Thu, 9 Jul 2020 14:59:15 -0600
From: Rob Herring <robh@kernel.org>
To: EastL Lee <EastL.Lee@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
Message-ID: <20200709205915.GA865123@bogus>
References: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
 <1593673564-4425-2-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593673564-4425-2-git-send-email-EastL.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_165918_512238_7204BB3B 
X-CRM114-Status: GOOD (  19.62  )
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

On Thu, Jul 02, 2020 at 03:06:01PM +0800, EastL Lee wrote:
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6779 SoC or other similar Mediatek SoCs.
> 
> Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> ---
>  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> new file mode 100644
> index 0000000..83ed742
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> @@ -0,0 +1,113 @@
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
> +  "#dma-cells":
> +    minimum: 1
> +    maximum: 255
> +    description:
> +      Used to provide DMA controller specific information.

No, for a specific binding like this, it should be 1 defined value.

> +
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt6765-cqdma
> +      - const: mediatek,mt6779-cqdma
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
> +  dma-channel-mask:
> +    $ref: /schemas/types.yaml#definitions/uint32

Alreay has a type, don't redefine it here.

> +    description:
> +       For DMA capability, We will know the addressing capability of
> +       MediaTek Command-Queue DMA controller through dma-channel-mask.

This sounds like the kernel's DMA masks which is not what this property 
is.

> +    items:
> +      minItems: 1
> +      maxItems: 63

An array of 63 elements?

I think you want:

minimum: 1
maximum: 63

Or:

enum: [ 1, 3, 7, 0xf, 0x1f, 0x3f ]

(Though if this works, then just 'dma-channels' is enough.)

> +
> +  dma-channels:
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    description:
> +      Number of DMA channels supported by MediaTek Command-Queue DMA
> +      controller, support up to five.

Is it 5 or 6 channels? You're off by one somewhere.

> +    items:
> +      minItems: 1
> +      maxItems: 5
> +
> +  dma-requests:
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    description:
> +      Number of DMA request (virtual channel) supported by MediaTek
> +      Command-Queue DMA controller, support up to 32.
> +    items:
> +      minItems: 1
> +      maxItems: 32

You are describing how many elements in an array and this is a scalar.

> +
> +required:
> +  - "#dma-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dma-channel-mask
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
> +        dma-channel-mask = <63>;
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
