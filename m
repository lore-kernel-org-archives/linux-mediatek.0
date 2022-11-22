Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE5C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AecBzrto7iiXG/YkhUDUlAYZpkE3vdWXEj9FqL/Bks=; b=Cx4R110FeSy2agIq5VJ5GPe+LQ
	TRVdSQl44K+uvYzjiZ0mO57393NviNQObruV/AIYkXBM98CHxDETuWTGM1PdIOiLT5uHlZ2ZaMvUK
	qsw8g0Xl2yLXs2nwz7slalXrl6DRm5r8V5vBui+1Od7sNk7qoJh0N88z0li0eSZziW1qMwf4fLvK9
	tGIvu163iQZaTdUmHzCNljKQqFZi7caAT4C4lmRSDlFE5SC9BJ0uOgIWV+csz46Kn8fD0LHvqpZkY
	wjoye/Zf/D63FpEubxG7rj9hQuk/BUGMCPqOu8V21pcOf04W/X2DpaZR2y826srs2qDMSBCbfEiLV
	kwMhDaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRXA-008PED-MB; Tue, 22 Nov 2022 11:33:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRX8-008PD3-DT
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 11:33:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j16so23105263lfe.12
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Nov 2022 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AecBzrto7iiXG/YkhUDUlAYZpkE3vdWXEj9FqL/Bks=;
        b=kWI4uiyGXOJoWem+WZR1cLHg4R0E/uZdXekLM1H2LYco+HF5lZa4appczftYoI+ed8
         KGGfp8Py8TZkC5UUmo4MxHZHRYpAw22AoEKrgIim0+kkeYUflgPxZ4Hx8bQ7+YpVLsl/
         tzSUgt+uX4DiHJXgeBxK49NEL+zLRaQOsDobnHvIbi0sU2cZB+if5JlM3jNiGaOs+lDN
         Ca+BJDjtkO3bm/UNRcGm/zW3y2uBuVFD1AQIst96/16OuuFYFDjhM4kcEFmeRs8wYBm+
         /2Vl458kyM9oIE7iMAWSBNoqSGyhVwkIhfLL1OmsNPIIALKf6gP+LOYM3uHLOoy+Z7SD
         PXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AecBzrto7iiXG/YkhUDUlAYZpkE3vdWXEj9FqL/Bks=;
        b=TMQRV4th1iOkym3zj5hc/NljwOi7asSelnD5rxEQeDoo0QEW7xO/i6Fai1pAnw1ojV
         sKGjohhzCWkw3ahoOq1dPqrc1IG8n1wUs8Q9o61Q4b9JRIDp5T1xt9Esr6VomOFvBhpO
         PRjxcN4k1nHwsyDGl3U38JyZON58DFqW7uxi1PrC1Vku4gKE6+pYVjVMS2psWtJkdhtw
         hTElFthQT21W6hfS+RMFOQMzLhwESE7LgMHlXOXlpPvPIr06P1vVbM0DbabAMBuBqzpJ
         eLQ/ME1ir0tbGxhJSNix3TYxaW7NKriSGNoPcPjS+64Y4Sl6GnuqWHfzrfIbgvjs28Um
         TZIw==
X-Gm-Message-State: ANoB5pkY/NiuPSTo4uTaBORXnrzIB1iGXnKYS8CzlSlF06eCFRak7h/T
	ddLBBwZgBdNcusVOABOd99VmkA==
X-Google-Smtp-Source: AA0mqf5bC3f0DyiKAPcMWf4Dku34Z4NS2BSMjJSPFXvCykSvblKIrgtSFPaZSw7abqjeQ25GMN0JnQ==
X-Received: by 2002:a05:6512:1505:b0:4af:b5d0:695e with SMTP id bq5-20020a056512150500b004afb5d0695emr7928714lfb.6.1669116824639;
        Tue, 22 Nov 2022 03:33:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u4-20020a2eb804000000b00279742d2b91sm15500ljo.36.2022.11.22.03.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 03:33:44 -0800 (PST)
Message-ID: <3a2c702b-afc3-0973-b302-f2c652790514@linaro.org>
Date: Tue, 22 Nov 2022 12:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/4] dt-bindings: interrupt-controller: mediatek,cirq:
 Migrate to dt schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 tglx@linutronix.de
Cc: maz@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, youlin.pei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
 <20221118100639.33704-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118100639.33704-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_033346_542624_6AA2AF59 
X-CRM114-Status: GOOD (  26.11  )
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

On 18/11/2022 11:06, AngeloGioacchino Del Regno wrote:
> Migrate mediatek,cirq.txt to dt schema as mediatek,mtk-cirq.yaml.
> While at it, I've also fixed some typos that were present in the
> original txt binding, as it was suggesting that the compatible
> string would have "mediatek,cirq" as compatible but, in reality,
> that's supposed to be "mediatek,mtk-cirq" instead.
> 
> Little rewording on property descriptions also happened for
> them to be more concise.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../interrupt-controller/mediatek,cirq.txt    | 33 ---------
>  .../mediatek,mtk-cirq.yaml                    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> deleted file mode 100644
> index 5865f4f2c69d..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -* Mediatek 27xx cirq
> -
> -In Mediatek SOCs, the CIRQ is a low power interrupt controller designed to
> -work outside MCUSYS which comprises with Cortex-Ax cores,CCI and GIC.
> -The external interrupts (outside MCUSYS) will feed through CIRQ and connect
> -to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
> -interrupts and generate a pulse signal to parent interrupt controller when
> -flush command is executed. With CIRQ, MCUSYS can be completely turned off
> -to improve the system power consumption without losing interrupts.
> -
> -Required properties:
> -- compatible: should be one of
> -  - "mediatek,mt2701-cirq" for mt2701 CIRQ
> -  - "mediatek,mt8135-cirq" for mt8135 CIRQ
> -  - "mediatek,mt8173-cirq" for mt8173 CIRQ
> -  and "mediatek,cirq" as a fallback.
> -- interrupt-controller : Identifies the node as an interrupt controller.
> -- #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
> -- reg: Physical base address of the cirq registers and length of memory
> -  mapped region.
> -- mediatek,ext-irq-range: Identifies external irq number range in different
> -  SOCs.
> -
> -Example:
> -	cirq: interrupt-controller@10204000 {
> -		compatible = "mediatek,mt2701-cirq",
> -			     "mediatek,mtk-cirq";
> -		interrupt-controller;
> -		#interrupt-cells = <3>;
> -		interrupt-parent = <&sysirq>;
> -		reg = <0 0x10204000 0 0x400>;
> -		mediatek,ext-irq-start = <32 200>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
> new file mode 100644
> index 000000000000..21e709169907
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/mediatek,mtk-cirq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Interrupt Controller
> +
> +maintainers:
> +  - Youlin Pei <youlin.pei@mediatek.com>
> +
> +description:
> +  In MediaTek SoCs, the CIRQ is a low power interrupt controller designed to
> +  work outside of MCUSYS which comprises with Cortex-Ax cores, CCI and GIC.
> +  The external interrupts (outside MCUSYS) will feed through CIRQ and connect
> +  to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
> +  interrupts and generate a pulse signal to parent interrupt controller when
> +  flush command is executed. With CIRQ, MCUSYS can be completely turned off
> +  to improve the system power consumption without losing interrupts.
> +
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt2701-cirq
> +          - mediatek,mt8135-cirq
> +          - mediatek,mt8173-cirq
> +      - const: mediatek,mtk-cirq
> +
> +  reg:
> +    maxItems: 1
> +    description: Address and size of the CIRQ registers

Drop description, it's obvious.

> +
> +  '#interrupt-cells':
> +    const: 3
> +
> +  interrupt-controller: true
> +
> +  mediatek,ext-irq-range:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 1

This points it's array..

> +    items:
> +      items:

But this it's matrix.

> +        - description: First CIRQ interrupt
> +        - description: Last CIRQ interrupt

I guess it you should be just array with only one "items:" keyword.

> +    description:
> +      Identifies the range of external interrupts in different SoCs
> +

Best regards,
Krzysztof


