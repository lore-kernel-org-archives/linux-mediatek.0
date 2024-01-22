Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCDAC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1J14CwoB1zAZcfJ++8H9LLWPoowGUbnVzLpFfhNUg4=; b=a1RWJoL0RCEDjCGLfH/b5AZujt
	2+MjVqEgu2mYp65WZAsA4YerGllPP/sBws7tv24FuUStlIvumBN51rGZeLBKfqVcPX1Lkt3cVY9jN
	eznSa82WpNkK8asfmTlbRe6CTLz0Ud84bHpReeww/4z/n1dN2UpwEKAsKX2BzSmqUSD2IZyo54ICQ
	cmXfvPRBnniJZYGE9YpnYUGE8NWaRCIJdOltPixE4W21K5Ckcp9Qq0j89yTeTtEfiX4r47MIVsh8M
	3TXIQuRGWuRvyoQTgoVWwHDJL6fQtGK4uEI7ANjN5VX1vtqBCm/9ZyONMg4XUaCQVYgcydVrq6iYg
	lQkltciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuDE-00CGe0-1G;
	Mon, 22 Jan 2024 13:19:40 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuD9-00CGbh-34;
	Mon, 22 Jan 2024 13:19:37 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2cd853c159eso35767921fa.2;
        Mon, 22 Jan 2024 05:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705929571; x=1706534371; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1J14CwoB1zAZcfJ++8H9LLWPoowGUbnVzLpFfhNUg4=;
        b=F9l803IRn0Uo0SMFZAoqSg/wwKEaHyviRNo7EIPU954MMHNlqXindb0/mUeF0geY0B
         LhPfecHkActF7iGxErqNyh9ShmT5kDY3HCjGPxTJejF+hLLjuJw2axSQK6pe5Rl7csM+
         lvtwPuXiHw8nI6qdACQ6ktX6yu+tz02tjeAkYqGU8OOf5qFtiJYnnV/gzuYwQkJTuire
         3JsSQYT83ufdiTnIGBjuBIWqdOz3qe7FQdbOuoG2CC92MpTrQP9t1cZ6P5Yxdp8GfJ5a
         yPVRCZIqPr7VhVhelsGW6awpTHZ0L4K8iBfTb7hdStuxjMWaoT9+3tUteTQhN/fFFi0k
         CqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705929571; x=1706534371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1J14CwoB1zAZcfJ++8H9LLWPoowGUbnVzLpFfhNUg4=;
        b=PM+GadcajWDOiNB3NK0QMioIq3tnDtlhikBZ9WN2t7Q4j1k9TQ42bUBvjhTWgSpj4Y
         YlXO0H1tLSSpuOiNegeLDYDvu1Myx/HWxpOEcddn755v0yy2+8Zkh+U4cDVTd/F9p+Dr
         9HTXkD/oC5+UMtQMxdIXKnZ+gEFqgpKgHVU5nYBPqV0swLEN9A6qrKrKDM9Pgurdez0h
         t2NREo0VmFcEvxsl8ez+t3Rwfa0fRw23Uqj1KOrz60DrQ3Fp14B1gEZwb7M2X6nsNl1i
         D7gTC+I+hX6JoNbOpFLpqUelGkQx6R8X3KRSnBfCiNfvzqjwJtDunYvoxb0VAXEoNOfN
         xT8w==
X-Gm-Message-State: AOJu0YxZgeFlE4yCmUF5EpTPMMtpMZTB2GUVYfpSAtkytUGnJ8DmOuBc
	GWBV6OvSKzEng/GG9i1euWEXyE6HOPv9HsgW7mp4dtIxHPze4QS4
X-Google-Smtp-Source: AGHT+IEXao7fglqEEO9wOlw9QcUjQpOzOZASh9wa+irPcp7xzh/6PvDbwKWSC+JfsMh+r5dDOH8O8g==
X-Received: by 2002:a2e:bc13:0:b0:2cc:5c19:d009 with SMTP id b19-20020a2ebc13000000b002cc5c19d009mr2374397ljf.45.1705929570561;
        Mon, 22 Jan 2024 05:19:30 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id a16-20020a056000101000b00337cd6b1890sm11336910wrx.80.2024.01.22.05.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 05:19:29 -0800 (PST)
Message-ID: <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
Date: Mon, 22 Jan 2024 14:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Ran Bi <ran.bi@mediatek.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240122124949.29577-1-zajec5@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240122124949.29577-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_051935_991752_AEFCFA0D 
X-CRM114-Status: GOOD (  16.91  )
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



On 22/01/2024 13:49, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Dropper redundant properties descriptions
> 3. Added required #include and adjusted "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>   .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>   2 files changed, 39 insertions(+), 14 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>   delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml

In this schema can easily fit "mediatek,mt7622-rtc", so how about renaming it 
and add reference for that RTC as well?

Regards,
Matthias


> new file mode 100644
> index 000000000000..75624ddf6d4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mediatek,mt2712-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT2712 on-SoC RTC
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Ran Bi <ran.bi@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt2712-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    rtc@10011000 {
> +        compatible = "mediatek,mt2712-rtc";
> +        reg = <0x10011000 0x1000>;
> +        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
> +    };
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> deleted file mode 100644
> index c33d87e5e753..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Device-Tree bindings for MediaTek SoC based RTC
> -
> -Required properties:
> -- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
> -- reg 		    : Specifies base physical address and size of the registers;
> -- interrupts	    : Should contain the interrupt for RTC alarm;
> -
> -Example:
> -
> -rtc: rtc@10011000 {
> -	compatible = "mediatek,mt2712-rtc";
> -	reg = <0 0x10011000 0 0x1000>;
> -	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
> -};

