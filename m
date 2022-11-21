Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE91C43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQ34R1ClvRJ30zGsVGp2RiEaSuUp9nthQZpzgznhpr8=; b=tiMqnd+ceuVNtd
	Lr32vw54CE9MSCXXBnEY/e4tFAkYKbV2afaEps3S76O/VPSQhK2yRAc8QXokv3aghHuIhqScWyiRd
	BuKpeg2OE3p5oWaDxXEKc5DjWNrPzazv34f9riJICC2hZdKZrPm8TRP+qmiBEYM3aYjmz8RTC21xT
	QCEFNoBM2MZ2WU+B3VKhmFxwVKGZ75MNb/8sNctryLRKZE6hZQXa8BqAyyuAh4nqe2gGTwfdvM8zf
	4pHZE+fHRbHnoS4sjhaKquUReXY2ynbIzAwY/gSPsHz4bKa9nsWJ45Yq9BVgwkse76yqN/YCsSrAy
	rGaUfuZRwuZVD8k3Uktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAEn-00G9Bt-N4; Mon, 21 Nov 2022 17:05:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAEk-00G97G-G9; Mon, 21 Nov 2022 17:05:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id r10-20020a1c440a000000b003d0283bf132so509481wma.4;
        Mon, 21 Nov 2022 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQ34R1ClvRJ30zGsVGp2RiEaSuUp9nthQZpzgznhpr8=;
        b=aMKwG0neuXdoNBJBy55LDxor41lGbfQMps+JlNnHqgoiOxjrPOtxdSE4RsHOecn/zZ
         UL8K7CG/gfcDLfDwRG2eluolShQ/8EH+mKVLF9yhV+Jd76lhsOyTqeJbI2W5X9IPIxh1
         yHRkJ91sF/u07+Rj0pUzoR3KynwVymat66kmdiUHqPs2Xti/MrOj4ll60J/uCVSR4XnX
         R42niY3I8FM6vWjMH6Wkrj8eqfXqLhk5K0GEyQqhQJVxTKkRONnDELnEBjspckBt68hg
         0Ts0diRaHbiI/L+6P9aSduy/8I64EiyzVkMPsay2JUloz4KcNoCs3RphVpBxd18f8h0D
         xaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ34R1ClvRJ30zGsVGp2RiEaSuUp9nthQZpzgznhpr8=;
        b=d3JgbUQZsPTscRuUs6EWE4DP/hqBowXIB+lxPx/uEYTBdxh2IFr9bg6sjRRtoAjK/0
         1TYx6lw9VEGqKuLQQyE52AwoHnC9A2PHz182y9/FrNiqhQshCsRfD9/mkqYN6HJLn+l2
         ykTQmHlEp4SUYCZDwkqKK4ybtDiY276i8SAOIkRAMjDjKde2/S2KQzVZVSaeVE9xF84Q
         2yuRHOd1T0v9Sfog9VUmk7hT4LdUbpOVx1XtKzbKCP4YoqZLdrmGJhrocosDZH7bLL5r
         BLCN7WYtwpk65d8on1BN+HEL9Qi/ZiGFkxBEFpXl0+Q/XFKkEgXVtweOkbhx5l4dZl5b
         GzxA==
X-Gm-Message-State: ANoB5pmE1Ub9j64f5mFhuOpgNyhyTOT1wSIdTvYBQT2RtQ/C86ar3Z7f
	x10Z0rr5cVyoeu/GaOmnzpc=
X-Google-Smtp-Source: AA0mqf6071ld2DQr5qO+/kKEHgogUnSmTC4vQ9vKrpj5EJuxP+w5Y+6e1Xaod0BnpQlAlpY4LP+xlw==
X-Received: by 2002:a05:600c:6012:b0:3cf:cb16:f242 with SMTP id az18-20020a05600c601200b003cfcb16f242mr5063589wmb.82.1669050334101;
        Mon, 21 Nov 2022 09:05:34 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id w19-20020adfbad3000000b00241c6729c2bsm8621083wrg.26.2022.11.21.09.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:05:32 -0800 (PST)
Message-ID: <53d6f1a2-86c8-409e-6b4a-d4e0f181adde@gmail.com>
Date: Mon, 21 Nov 2022 18:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 04/11] dt-bindings: PCI: mediatek-gen3: add SoC based
 clock config
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-5-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221118190126.100895-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_090538_585349_BE18F3CC 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/11/2022 20:01, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> The PCIe driver covers different SOC which needing different clock
> configs. Define them based on compatible.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v2:
> - fix typo in mediatek,mt8192-pcie
> v3:
> - remove contains to match only if compatible is no fallback
>    tested with series "Add driver nodes for MT8195 SoC" and mt7986
>    pcie-nodes, dtbs_check is now clean
> ---
>   .../bindings/pci/mediatek-pcie-gen3.yaml      | 47 ++++++++++++++-----
>   1 file changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index c00be39af64e..5d7369debff2 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -43,9 +43,6 @@ description: |+
>     each set has its own address for MSI message, and supports 32 MSI vectors
>     to generate interrupt.
>   
> -allOf:
> -  - $ref: /schemas/pci/pci-bus.yaml#
> -
>   properties:
>     compatible:
>       oneOf:
> @@ -84,15 +81,7 @@ properties:
>       maxItems: 6
>   
>     clock-names:
> -    items:
> -      - const: pl_250m
> -      - const: tl_26m
> -      - const: tl_96m
> -      - const: tl_32k
> -      - const: peri_26m
> -      - enum:
> -          - top_133m        # for MT8192
> -          - peri_mem        # for MT8188/MT8195
> +    maxItems: 6
>   
>     assigned-clocks:
>       maxItems: 1
> @@ -138,6 +127,40 @@ required:
>     - '#interrupt-cells'
>     - interrupt-controller
>   
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: mediatek,mt8192-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: tl_96m
> +            - const: tl_32k
> +            - const: peri_26m
> +            - const: top_133m
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8188-pcie
> +              - mediatek,mt8195-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: tl_96m
> +            - const: tl_32k
> +            - const: peri_26m
> +            - const: peri_mem
> +
>   unevaluatedProperties: false
>   
>   examples:

