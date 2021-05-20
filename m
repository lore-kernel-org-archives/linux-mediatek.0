Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2776BC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 00:02:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3F6611C2
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 00:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A3F6611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F8hURtbgM21Rd9xXK1o8gTgaOcPMAnPMiThHmOXa8nM=; b=fR+2M2og0GPgDSV8CVUBy1NeR
	9LR9IQKtXH0ubpvpHHZTFe7k3ijRNytGK2J389NUONjJ5OFrkJN+P0X2Ga/xFwG6+Nn5+GIxWY/5y
	RMCOX+icMcQ3Yz3Hi9EREsVHrI2NU7j6ndoz5T0qtcTc6te89EjcPM0TzCmHYN6KYpg2z+GKFHR+4
	npjz7S4AWo5nmKOd1Jc7WvmddIihoNSC15XErwT5bNAx3D3dEYzYGEGgB8YRI71i0m2AwjjjWOxBR
	PZ2RLe+ovkn8VZ93ZqLIPNJw2h01PMv+qQbH9R6fR4pyZDvnjGCkVYEmuDL5qGrnt83sUzQYv49KJ
	VFLRk/GSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljW8O-005OnE-0w; Thu, 20 May 2021 00:01:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljW8A-005OmO-Hs; Thu, 20 May 2021 00:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2U0DOJOGr7PoXGKnZ0Spg2cVP5PlFJxyFrW88+PvagA=; b=0s6Ml0V1WRVS5NMAtwxmvXBG0y
 t4ad02y+6F7R13zeXiuC8dUoh1oeytGv3Fiyu00t7sj3albc5mYKAjF2pht38SAfWfp+g4IFbZKjC
 30bNivbs2KqDmHZrXzIuiWiY4qOSGTNSJxjeHox93jWN4/HirWhKoxcNAwPy9uR7kMlHciIsQmpWh
 ZQpxkRJbH/b9/WrRHyhXdYZFkj0pXqemR8UfXdizU2138ZpC6d/GvMrhio5npROyHMW9SJGlwLgFe
 hSTBGVoPbwua4KMy5gweldSihsa4r2pRUm0f5E2htHOIuTVCJNvfv0NgE162TcyCZNlUz+AK3clcQ
 sgR1inAQ==;
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljW87-00FrAr-9R; Thu, 20 May 2021 00:01:37 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 s20-20020a4ae9940000b02902072d5df239so3405065ood.2; 
 Wed, 19 May 2021 17:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2U0DOJOGr7PoXGKnZ0Spg2cVP5PlFJxyFrW88+PvagA=;
 b=V1a544ERkoZGLgiaGuUfqRWBRMKjnP1pmxt+Rj0tHdziz9D4RBo+fk3fSj6whciwuK
 VpDBjHis0zA4w5pmQNgKRRUIMOpPlK/YzHW8PEfMKissvKcSdeFjSCQDilp9YlNkh9x0
 SRALClBmFr2JV1ZFFTy9SUe7cIDMIBvPbgBN6NQDfGHQ1VcustC/LjYojI3bDcxd/nqF
 Dvzi79QOH6yA9qCnxsyxzx35oBzfSeSQ0bhNA3T2rUBcuws0I0uEnEUke94/SqI2n67T
 dPpUFRqSymYJ4av3B5uTmA/B6DnloSdeVVPAtg87Jh8xP190Xl+bgzDYBGgpS0j3Nl7C
 MvKQ==
X-Gm-Message-State: AOAM531TIb4lGwl8XfZu3YauXuUXEfBlcmSpITq/3TVUuPObIwvKaGSd
 9adefG0OaeyTr8ShbAjPlw==
X-Google-Smtp-Source: ABdhPJyQF5l4eHcp4L7RXu6jr6/fpAFevlq2eho73arvZOu/0DaVFPj7KYJmgNi/dXV6RHYxVKAVUQ==
X-Received: by 2002:a05:6820:100a:: with SMTP id
 v10mr1520942oor.55.1621468894345; 
 Wed, 19 May 2021 17:01:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x65sm287790otb.59.2021.05.19.17.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:01:33 -0700 (PDT)
Received: (nullmailer pid 3920159 invoked by uid 1000);
 Thu, 20 May 2021 00:01:32 -0000
Date: Wed, 19 May 2021 19:01:32 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mkorpershoek@baylibre.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml
 schema format
Message-ID: <20210520000132.GA3914592@robh.at.kernel.org>
References: <20210518145522.2420135-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518145522.2420135-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_170135_362496_E712BEC9 
X-CRM114-Status: GOOD (  27.54  )
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

On Tue, May 18, 2021 at 04:55:20PM +0200, Fabien Parent wrote:
> Convert the binding documentation for i2c-mt65xx driver to the
> YAML schema format.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    | 49 ----------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 49 deletions(-)
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
> index 000000000000..0f445d2ab727
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -0,0 +1,97 @@
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
> +    pattern: "^i2c[0-9]*@[0-9a-f]+$"

Drop '[0-9]*'. The base name should be just 'i2c'. 

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
> +          - const: mediatek,mt2701-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - const: mediatek,mt6797-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - const: mediatek,mt7623-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - const: mediatek,mt7629-i2c
> +          - const: mediatek,mt2712-i2c
> +      - items:
> +          - const: mediatek,mt8516-i2c
> +          - const: mediatek,mt2712-i2c

This can be simplified a bit like the other binding.

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
