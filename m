Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81636C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 16:59:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5D1208BA
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 16:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5D1208BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zcUVRqj+iU0KRyEwg53KQ6/zxT+B+1TF84XI/8InQHM=; b=Xj7ryjgnUjWCancDFbDOicmYy
	2gt+otEvxjZ7faqCidKTXtR323uqk6GPBOeLmREFf+PgFZfcHc2rTO7ks+734/IxEyjksW/UiLEFx
	fQvb0BdyQG4ZRkjR2xF5mW1xoKhzUpmxHp0+4mXzQgrKVLT6o+r/jvTJ//KemIxLhZRNXg7bmYq03
	8M52LpY1Lowon3tKOcVPly2kBRTwdPF2sTyVzaqx5e13jnfiVHftidF4DmscGXN7V118Ud8wfgWwR
	VbPQOlZPdwnu8P/LfdNKLNFj1mmXp7xGcsbE5yvKAPy6PuHBzf/XklOn4ZBAPTYqiSNabSsazzYJT
	m2A7rIEDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw6iR-00083w-MX; Sun, 03 Jan 2021 16:58:51 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw6iM-00082L-D2; Sun, 03 Jan 2021 16:58:47 +0000
Received: by mail-il1-f177.google.com with SMTP id n9so23216054ili.0;
 Sun, 03 Jan 2021 08:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J8WEkyhenkl8kYp/bvB9MXeFoGWEOBF4fz0r9rccQxI=;
 b=jjL6czXTz8tIvObes1ytQesEFOlwVhch9Mx3t0l41mpq+hK3fcXp7cMNvUGIYlvN/c
 YTM7jkbGP3vbE8xSjFPRSUOE0/BaL0ou6VYcIqy0noMvSG8iSYfnnkwwl3ZCFvR7NcrY
 BbuUXRJk34pLLTlcJO4w3psfUEy3h6iOWn5gHLFrdD3oYBgWhmgnxyn63e++gwNIi3qk
 eRMq7v6SdvTPDdPRFl7ioBC5PPORtlcg85JwgCqvwApBx0pbnnDUQL4wBZ0N2Q+oPlmD
 48eltoUmsFLhM65+w/7BIFA2qqYr4U70dhdAX+0LqxqkhO23uut7TUAKnDKhN23xOVMS
 fNSA==
X-Gm-Message-State: AOAM530WZAr8XONqSNMHpVYM2yHKDPdDanY9OmhmXhPyTFaNEwVT/iru
 C7xyJA1iUmyynwtq/5IKXA==
X-Google-Smtp-Source: ABdhPJyS+VI5YSOn0FBVtRBwA0IsJCJFN4Xr13kqCrchuR9n5xvQZZih3qMOLRBS/P13N6oiBbZtLg==
X-Received: by 2002:a05:6e02:1b8a:: with SMTP id
 h10mr68652565ili.141.1609693125817; 
 Sun, 03 Jan 2021 08:58:45 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r10sm39086113ilo.34.2021.01.03.08.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 08:58:44 -0800 (PST)
Received: (nullmailer pid 4046180 invoked by uid 1000);
 Sun, 03 Jan 2021 16:58:42 -0000
Date: Sun, 3 Jan 2021 09:58:42 -0700
From: Rob Herring <robh@kernel.org>
To: EastL Lee <EastL.Lee@mediatek.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
Message-ID: <20210103165842.GA4024251@robh.at.kernel.org>
References: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
 <1608715847-28956-2-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608715847-28956-2-git-send-email-EastL.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_115846_528998_3296F9F3 
X-CRM114-Status: GOOD (  21.04  )
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

On Wed, Dec 23, 2020 at 05:30:44PM +0800, EastL Lee wrote:
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6779 SoC or other similar Mediatek SoCs.
> 
> Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> ---
>  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 104 +++++++++++++++++++++

Use compatible string for filename:

mediatek,cqdma.yaml

>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> new file mode 100644
> index 0000000..a76a263
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/mtk-cqdma.yaml#

Don't forget to update this.

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
> +    items:
> +      - enum:
> +          - mediatek,mt6765-cqdma
> +          - mediatek,mt6779-cqdma
> +      - const: mediatek,cqdma
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
> +    description:
> +       For DMA capability, We will know the addressing capability of
> +       MediaTek Command-Queue DMA controller through dma-channel-mask.
> +      minimum: 1
> +      maximum: 63

Indentation is wrong here so this has no effect.

A mask of 63 is 6 channels...

> +
> +  dma-channels:
> +    description:
> +      Number of DMA channels supported by MediaTek Command-Queue DMA
> +      controller, support up to five.
> +      minimum: 1
> +      maximum: 5

Same here.

Do you really need both dma-channels and dma-channel-mask? You should be 
able to get one from the other.

> +
> +  dma-requests:
> +    description:
> +      Number of DMA request (virtual channel) supported by MediaTek
> +      Command-Queue DMA controller, support up to 32.
> +      minimum: 1
> +      maximum: 32

And here.

You are missing '#dma-cells' also.

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

This should fail validation because it doesn't match the schema. You ran 
'make dt_binding_check', right?

> +        reg = <0x10212000 0x80>,
> +            <0x10212080 0x80>,
> +            <0x10212100 0x80>;
> +        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>,
> +            <GIC_SPI 140 IRQ_TYPE_LEVEL_LOW>,
> +            <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&infracfg_ao CLK_INFRA_CQ_DMA>;
> +        clock-names = "cqdma";
> +        dma-channel-mask = <63>;

6 channels or...

> +        dma-channels = <3>;

3?

> +        dma-requests = <32>;
> +        #dma-cells = <1>;
> +    };
> +
> +...
> -- 
> 1.9.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
