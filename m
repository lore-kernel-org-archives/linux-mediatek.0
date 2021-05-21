Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8DFC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 02:16:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2FC60FE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 02:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B2FC60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyuHDFacEtdupJcFe96ghqToc3V2jzqnrN64u/H+aAY=; b=IadSE32QPu3+HGuWhILuaHReJB
	7+iZ5u58hPi5wX5W4NHHSQYuVp9e324SnRS5F7aQXwW0tr7/hglgQ54jBpiex2jeVTATZHIW05ViT
	pMxjihTTpUkHLupiGKw43mee5uYoEtzZ6s0Lw+Owz+BruLhZ7W8TA9vankIeR2gTHxS1Te+BV7QDQ
	xdGrmOveFK3a9dxzD1gKlDFMSh1ZJjElShGsF7LN/Yre4f4T3nx93c3B2BUGVsPGF+YDW0+bKBrul
	SlUGfJ/4B32oMXBYQjbTfWUbD0oRwwKN9w/BCOSYFSOQaPVti+wZpAMg57TvRFp8e+kzjiqDAP1IQ
	BP3n4kGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljui6-003TKU-3Z; Fri, 21 May 2021 02:16:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuYB-003QoV-Kw; Fri, 21 May 2021 02:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0H2GF3uZl9zixyhg0W0KnFuUJPM2Rk1J1IN+ADFK40U=; b=0F9J5q9hxbqaTeXTCPiWwLWXxg
 3cKmdgCkE6p10sRZ46odMNmTUV5GwprxyKFo2iKX3R684AnL6zq41A/PIy73IVjNLK1XAoIsxHwtx
 hdGAJZbcVLJFkXESQzrrEfjit8t1fcwPVVB1b1jZgkH4N1jhbQqzWW8NH3vhLiHJ01fou75vwTCl7
 S18KVAovKoNkI9yiYTmj6xLaqdOT9xxZnyT4uNf7LhCThM232qom8lDUVXR3WwuSJX10XSV7r/WFQ
 oqZYD2IHO4gxm763+LvWd2IwXpBwL7x2So2tLxizNrA6hebAoIvyq2RiIVw48oOp+5ZOPdj8dGUoU
 JT+NdvUg==;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuY8-00GlQr-Eg; Fri, 21 May 2021 02:06:06 +0000
Received: by mail-oi1-f171.google.com with SMTP id c3so18280672oic.8;
 Thu, 20 May 2021 19:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0H2GF3uZl9zixyhg0W0KnFuUJPM2Rk1J1IN+ADFK40U=;
 b=qknuev+gR8vSLzW6/50xCFeGWpeX3LIGOWfy+H6uK5HWr8woBEcPKaQSxotB1fiHRU
 p2SJDbJ+yN9fVapdRR5GJi6O6ICX+yyqHczPVER/R1/8Te9SxFX0TUYAmaiAKQmThCJz
 nalAf7m2ehK3FRgw8gU45yPZXY+hsF2B6X/Lo7X7xdBS5cCBLMTUZO4n8oXkvjm7XSu1
 dNZV3stI6+nKwk0bItycceJoMdFMhxSHJQzzVySOu5AuKSZrYoyJwK72tWsZHAc6zHVN
 z9jIBnA+eue5dvDhZigrbDmRxCnLztFoVpZvSlm8CHk22O7Ms0aFkLcpjLGfw/Stsn+K
 p8wg==
X-Gm-Message-State: AOAM530ERMB524RNtElv9+c3ri3FlnzxFrTlCA3XyljamiGqZFajlvwD
 ejD7a2ZhKklWPwN4/SSzQA==
X-Google-Smtp-Source: ABdhPJz+5f1gkMvE4v4jEv06iH0gUMgzqhdrEaSOKD8ncFB0zOV9GqCmIQY/fouffssoUw73lkgECQ==
X-Received: by 2002:aca:df55:: with SMTP id w82mr346256oig.25.1621562763584;
 Thu, 20 May 2021 19:06:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 19sm870524oiy.11.2021.05.20.19.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:06:02 -0700 (PDT)
Received: (nullmailer pid 2510861 invoked by uid 1000);
 Fri, 21 May 2021 02:06:01 -0000
Date: Thu, 20 May 2021 21:06:01 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mkorpershoek@baylibre.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml
 schema format
Message-ID: <20210521020601.GA2507824@robh.at.kernel.org>
References: <20210520112106.77190-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520112106.77190-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_190604_531765_CA3B12DB 
X-CRM114-Status: GOOD (  26.74  )
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

On Thu, May 20, 2021 at 01:21:02PM +0200, Fabien Parent wrote:
> Convert the binding documentation for i2c-mt65xx driver to the
> YAML schema format.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v2:
> 	* write compatibles in a more compact way
> 	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
> 		"^i2c[0-9]*@[0-9a-f]+"$
> 
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    | 49 ----------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> deleted file mode 100644
> index 7f0194fdd0cc..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -* MediaTek's I2C controller
> -
> -The MediaTek's I2C controller is used to interface with I2C devices.
> -
> -Required properties:
> -  - compatible: value should be either of the following.
> -      "mediatek,mt2701-i2c", "mediatek,mt6577-i2c": for MediaTek MT2701
> -      "mediatek,mt2712-i2c": for MediaTek MT2712
> -      "mediatek,mt6577-i2c": for MediaTek MT6577
> -      "mediatek,mt6589-i2c": for MediaTek MT6589
> -      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
> -      "mediatek,mt7622-i2c": for MediaTek MT7622
> -      "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
> -      "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
> -      "mediatek,mt8173-i2c": for MediaTek MT8173
> -      "mediatek,mt8183-i2c": for MediaTek MT8183
> -      "mediatek,mt8192-i2c": for MediaTek MT8192
> -      "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
> -  - reg: physical base address of the controller and dma base, length of memory
> -    mapped region.
> -  - interrupts: interrupt number to the cpu.
> -  - clock-div: the fixed value for frequency divider of clock source in i2c
> -    module. Each IC may be different.
> -  - clocks: clock name from clock manager
> -  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
> -    one bus has more than two i2c controllers, if enable have-pmic need include
> -    "pmic" extra.
> -
> -Optional properties:
> -  - clock-frequency: Frequency in Hz of the bus when transfer, the default value
> -    is 100000.
> -  - mediatek,have-pmic: platform can control i2c form special pmic side.
> -    Only mt6589 and mt8135 support this feature.
> -  - mediatek,use-push-pull: IO config use push-pull mode.
> -
> -Example:
> -
> -	i2c0: i2c@1100d000 {
> -			compatible = "mediatek,mt6577-i2c";
> -			reg = <0x1100d000 0x70>,
> -			      <0x11000300 0x80>;
> -			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> -			clock-frequency = <400000>;
> -			mediatek,have-pmic;
> -			clock-div = <16>;
> -			clocks = <&i2c0_ck>, <&ap_dma_ck>;
> -			clock-names = "main", "dma";
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> new file mode 100644
> index 000000000000..41cedb4930de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek I2C Controller
> +
> +maintainers:
> +  - Qii Wang <qii.wang@mediatek.com>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^i2c@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2712-i2c
> +          - mediatek,mt6577-i2c
> +          - mediatek,mt6589-i2c
> +          - mediatek,mt7622-i2c
> +          - mediatek,mt8173-i2c
> +          - mediatek,mt8183-i2c
> +          - mediatek,mt8192-i2c
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-i2c
> +              - mediatek,mt6797-i2c
> +              - mediatek,mt7623-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - enum:
> +              - mediatek,mt7629-i2c
> +              - mediatek,mt8516-i2c
> +          - const: mediatek,mt2712-i2c
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - description: Controller clock
> +      - description: DMA clock
> +      - description: ARB clock for multi-master when a bus has more than
> +          one i2c controllers
> +      - description: PMIC clock. Only when mediatek,have-pmic is set.
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - const: main
> +      - const: dma
> +      - const: arb
> +      - const: pmic
> +
> +  mediatek,have-pmic:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Platform can control I2C from the PMIC
> +
> +  mediatek,use-push-pull:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: IO config use push-pull mode.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - clock-div

This isn't documented.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c0: i2c@1100d000 {
> +            compatible = "mediatek,mt6577-i2c";
> +            reg = <0x1100d000 0x70>,
> +                  <0x11000300 0x80>;
> +            interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> +            clock-frequency = <400000>;
> +            mediatek,have-pmic;
> +            clock-div = <16>;
> +            clocks = <&i2c0_ck>, <&ap_dma_ck>;
> +            clock-names = "main", "dma";
> +    };
> -- 
> 2.31.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
