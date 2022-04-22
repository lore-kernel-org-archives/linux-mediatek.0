Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viV1I41tIXdV7IHelOvNSgye4A0Vse9BcG1m7o9w/A0=; b=M2M2OFo0aTy8sN
	55/RU/Ms2pdXFviS/Blf9nCTgnF6tqPWi0SUvigN1JGxnX/E0ozLGwfoxituKJKJpOGZGhPp0eslr
	MWhey+ZkGzjvwqz8ANRmvHjd5Lnv09vC7Ai0zBwiUilLvhOFexUQFHPWn4AyuHKnUY45VULZU/lj/
	H1b+dUxBlRkMid8ffi6R15n2xD4jEGRHs5rGfmsq/et65wYuBVEVVMM74aPIxKKPKcJy0cQYN+AO3
	pDy5Eo9idaG+YRa50yzD6kGnQSeCpmzdeintMILYx6Pg/9D/+BD8pHvIdglfsJ/DmlAIW/Vtl2R+e
	mVrXEt6HSB0agqB4Xa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvYw-001EJ3-NC; Fri, 22 Apr 2022 15:51:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvXT-001Dig-MA
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 15:49:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id g13so17224012ejb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EbBrf90Se9JVfBrPUX5vB31Mi0cnNfK03HhVmontGZM=;
 b=p9urVnCyqPfWbAeTgSbUtdRfSxObUFNtR0D5eF2v15vU3h8ra7egnDpTofsF4zJKh0
 X22/Y5qYPAJRpQ98ETFprhKBhKvU0zd+geenSx+OqdONFFOEMFm/DETjBqA5zPJYG3E7
 3Lg8/RE2tyAnTpDpXHoPo6ItX60g3EhXtOeJGHEy+8b5wSLVz4ZbOMbCJAf8tWmtENho
 mOLA7uM8bUw5tZoJ0nkYku9LZz1GGHuHyA7elECdI/gtOAwKZMNV3hdtYnSTZkre6Q91
 6JSYJteZeSn4baDRnQZ5J2HyW3VHfsogrGAL8aYAmMtsFSFYn4KCrDxSCBNfcrE5ypDj
 7j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EbBrf90Se9JVfBrPUX5vB31Mi0cnNfK03HhVmontGZM=;
 b=1xKaI0SpzuVrm4mbzmojcRaIXD1UkRXNKuY7iILZfyj7Oy7z4HJgQgcBNK+PDy0Myf
 u393sqR/0WFFxEc1puJ+t2tmHYcFG9NJC1umDO6cymXmXtLWOdH+3xhurDY/FcQ2B6+W
 nshRh6CNP86h63YXnBjpg/hF+n+uTRxpLSl0WY1lB8Dxu/w3GkyojnBo3eiz0hhr2Z8f
 aHV2GZhDGJJKA/hS2g6dUpWNSQ51qoXJlvRYNv25XgmbfKyGwkXNJ5X26fBUt0IQCdWh
 IICtDgO/H/PT4gEdEaHXZJHzkAmuTAr4Zf1ATSYr6KjGXWsyAW2dh/VVUwIA7ErNMs92
 fO1g==
X-Gm-Message-State: AOAM532ub16o6nIpbQvkK/toEf9yd1OFEz4w+u9xDV4DRNKBCnoY3qHx
 syjSZPeLfh9JiqMhawhGPSuWWg==
X-Google-Smtp-Source: ABdhPJwOm7OVQF6vFjjh8qNr+uvEPPGlSIw610XQhQ2Tyyu1bh8vgEPXO+cVxey0E8SMmZLsiUzj1g==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr4726662ejj.767.1650642581658; 
 Fri, 22 Apr 2022 08:49:41 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n10-20020a170906700a00b006efdb748e8dsm864676ejj.88.2022.04.22.08.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:49:40 -0700 (PDT)
Message-ID: <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
Date: Fri, 22 Apr 2022 17:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422071534.15653-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_084943_805980_E4114082 
X-CRM114-Status: GOOD (  18.59  )
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

On 22/04/2022 09:15, Tinghan Shen wrote:
> This patch adds mt8186 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers, clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
> 
> This patch depends on MT8186 clock bindings.
> https://lore.kernel.org/all/20220409132251.31725-2-chun-jie.chen@mediatek.com/
> 
> ---
>  .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> new file mode 100644
> index 000000000000..00a79e880895
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mediatek,mt8186-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek mt8186 DSP core
> +
> +maintainers:
> +  - Tinghan Shen <tinghan.shen@mediatek.com>
> +
> +description: |
> +  MediaTek mt8186 SoC contains a DSP core used for
> +  advanced pre- and post- audio processing.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-dsp
> +
> +  reg:
> +    items:
> +      - description: Address and size of the DSP config registers
> +      - description: Address and size of the DSP SRAM
> +      - description: Address and size of the DSP secure registers
> +      - description: Address and size of the DSP bus registers
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: sram
> +      - const: sec
> +      - const: bus
> +
> +  clocks:
> +    items:
> +      - description: mux for audio dsp clock
> +      - description: mux for audio dsp local bus
> +
> +  clock-names:
> +    items:
> +      - const: audiodsp_sel
> +      - const: adsp_bus_sel

What does the "sel" stands for? Maybe just skip the "_sel" suffixes?

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    items:
> +      - description: ipc reply between host and audio DSP.
> +      - description: ipc request between host and audio DSP.
> +
> +  mbox-names:
> +    items:
> +      - const: mbox0
> +      - const: mbox1

These should be rather some meaningful names, e.g. "rx" and "tx".

> +
> +  memory-region:
> +    items:
> +      - description: dma buffer between host and DSP.
> +      - description: DSP system memory.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - mbox-names
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>

You do not use these headers.

> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    dsp@10680000 {



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
