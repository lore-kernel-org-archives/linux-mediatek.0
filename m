Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DDCC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NvKVp9EY1lQLLZ0Uj/3ziHPWB5PBfQnDPktmmL6XEk=; b=QT3+izRwNNGKvvt8x/lTBbcZzJ
	SfLXw4wlnyfAqY87lhqlHWmsvvk0RUcwqdtHjAAKaxGk1AFdaofbDI9Q9E6tHdDO7OFCl4bnwJVlb
	VZf856AsJebpB2zXVckhY9EZFfzpmU5t+NE/IxAttEshlXAfRsqzIVKRPeEmQER60geYppNJhNqyE
	SUzIBPUJ3f3tGJqGqELr48NtJf3/pa2yNXz2cWkzH1ZOt59GdNbzCyElx6C1A66eOynB+5kK+mxHm
	3082+lyFnq8zThTZ4+GqjyOIARHZNSjjMsWPYLLorJGBZmDgOnu7RBV6BG2523d3BSOq4ktKnbBRS
	UZOrhUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wlN-004NOG-4g; Thu, 16 Jun 2022 21:10:49 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wkp-004NBQ-PX
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 21:10:17 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 3-20020a17090a174300b001e426a02ac5so2879072pjm.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 14:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1NvKVp9EY1lQLLZ0Uj/3ziHPWB5PBfQnDPktmmL6XEk=;
        b=Q6kggNEwsYy473XSBdvlOd5aXGi14mWaUXKCRel2oNoa9ukMQEm6VLZ36BSmEzjUw8
         xVjg+yj2Cf7WYniqQWa061j05YQBrlt3J8sWSdxuzyoIGAnHdsSZK0OPY2rgLYkZCGdz
         RGHvnW9PyQpZtnrKN3TNt9/AMOmKe76T+/caN0MOE3lbxICjjK5bFR+Qhp/bDFV7LEnZ
         ygPkdnsJl4x4bJeL8fdqMJEOMIyvVNtRqEeXO2BdN/B+P+LbfjtD4WyGc67vqWXugVv3
         iNbUjj0Z+ZhCSCUDlVRSwcvWTlaYCTp/0ixXT9BwdhOZGpaNiy9JJrytROI9rct/lCCR
         7ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1NvKVp9EY1lQLLZ0Uj/3ziHPWB5PBfQnDPktmmL6XEk=;
        b=tLiiiAJ+kuqBgir4u7xCyehG8A//IiubBeXEGpl8PX8jqP+WRyDGO/0r/Ev7k0q29d
         YXRbksvRYJ4UYs9nV8TPjdiiih6Lwd1Bt30CyATknkC+6R3TvRWVW95CyxLK+6YoJJcE
         DWkMCorum0wKMsdFCBB8mfvmUzHw376eRc4KzqKcpLoh3f+JLFbxUduLFEl0TH/hwhvB
         H+IkDhKoK0HT4nQkcSuxKievnAVbc5EHHmQIxLF2dWSNqoSmdSBsnOZJZAoIMeT8j/Xv
         mLeQ0nTrsrW7qUCOxhSY4a57IRoP+uNbStao/K8hLiFCABnzoCQxR0NMA+1FpNp1BmVC
         M9rw==
X-Gm-Message-State: AJIora+H6S5V+c+jxQazsMEHnwMw74/Png3mkE4driBHk61URdjWAVBQ
	/+FkLUOaAtvkNnOVgng/cvdK9w==
X-Google-Smtp-Source: AGRyM1tx14RVi2zqlwVdwcg3qpvX916m1pZt9IXn7u8YC0Z2HVZLOyuzbvgSYCSqY81bOJn+l9i+nw==
X-Received: by 2002:a17:90b:4c8f:b0:1e6:9bf9:1ab8 with SMTP id my15-20020a17090b4c8f00b001e69bf91ab8mr6904606pjb.215.1655413814235;
        Thu, 16 Jun 2022 14:10:14 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id n46-20020a056a000d6e00b0051868418b06sm2167316pfv.35.2022.06.16.14.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:10:13 -0700 (PDT)
Message-ID: <f230c9b0-6e23-7409-62e8-58f849925e2e@linaro.org>
Date: Thu, 16 Jun 2022 14:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/15] dt-bindings: leds: Add Mediatek MT6370
 flashlight
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 Alice Chen <alice_chen@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-5-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-5-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_141015_844648_199942D6 
X-CRM114-Status: GOOD (  14.82  )
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

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---
>  .../leds/mediatek,mt6370-flashlight.yaml      | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> new file mode 100644
> index 000000000000..13610bc23d0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-flashlight
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-1]$":
> +    type: object
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        enum:
> +          - 0 # Address of LED1
> +          - 1 # Address of LED2

Just: enum: [0, 1]
No need for description.


> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false


Best regards,
Krzysztof

