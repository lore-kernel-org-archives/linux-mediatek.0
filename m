Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57173C4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQQhKweIL/MfaRqaUUsl9viWbACAS6aXTW7gfUp7M7k=; b=Mo7PFILuFMmlSPQCZOnvl/nj2n
	qCVynj8pCwQ+kpRwopsZCIQMZnj4YXG/4dQ8lhZW0mcSwlKU6/bjyStNWfTE1R7xq+dleakRxQCOO
	O7otmZQsPZ4Yyv6RNKt+aTVNXHzdFoxBopIo/Pfs6b8Rq2l1fPi9elwtnEQ4Li7qBdmS1a9Lryj1X
	4NQn5R2fMTaBIjFjSwV0+8IvtDU0z29Ala8QiAX1ZySI2col0VxAqTGdMBPRnHbWv788XPQLv9Dmc
	uJ/YtohR4dJS/rgUH5fBgnS4wP7KnvHBCfqKl+q9khWbs+YRpeeXGmFkC+gFGzaaEULfDndfsBuPP
	rLBx8rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpGo-00AxwZ-2X;
	Mon, 22 Jan 2024 08:03:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpGl-00AxvW-1W;
	Mon, 22 Jan 2024 08:03:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33929364bdaso1266437f8f.2;
        Mon, 22 Jan 2024 00:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705910578; x=1706515378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQQhKweIL/MfaRqaUUsl9viWbACAS6aXTW7gfUp7M7k=;
        b=UVZXX7qQ7sxnszXTA4MN98xrs2+W2hB9sTahiiW4bM0s4kvR1h/tL+qiLTZESDCRDe
         DUoo2cY8wMGvd0qhPfYIPc1JfqF2BgWn+jDrNqS9dwUfnYBZzgnyMxOT+0lZZeJbWd4J
         lf7Z1K5d9jiNOOKe0dYIDGDRS+f7Wj+T1dv8BK73qWOhivBD/7njjeYIcw5wR2x/lrsL
         1n7PYJPa2vvW/zTgez6E0NHh6wwZfR2ujkFx0wvfrsoBykGFshULik/NSDMNX6cv58vI
         RVXZgz9kkC1XLzopRIk9MXjh6YWdB/aJZ3tPrpFXfbk4EksJV4acP8MrVencfn+9JIxi
         8sAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705910578; x=1706515378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQQhKweIL/MfaRqaUUsl9viWbACAS6aXTW7gfUp7M7k=;
        b=f3Olb7CYCpWgiQ9Nf8VpwsvpuN6hpqYmHaFcDCz9C8hnxzaJ4IgY3HdAlKkgeroQrl
         xVm7OFOBN1zbmH1vQIYQ1u7BHJt78YyPEbwBPZJbfbopfB63wfpjjeJGz1yrWICyYLWF
         g/f3gScu+HuUJvoYYgQ1FAemM2f8aKkEacn272OAUNfI3shyuRfuATo34Q+aSYzkPPUJ
         FHkfzoSZS704CcTKV/Hvqx2JM0ntA5539Ppmob5fyY2CLG4emPqNwS+/iC1ZgkeJuwTY
         Qs5nPdDK1oFJf8LAnh9pUmv4tHUmiQFj1DSou1dq9vHnQq6LfpW7Qcwbwc14XftCVGvX
         PcWA==
X-Gm-Message-State: AOJu0Yzd/Lh/v4Wr7/zRbB34/NSByGtNtjXi7bFrGxOquez54Qc3Z5Lb
	qN6s4wN90Jy156KP+JEWPlZIlGHRbEIXMVZIsKe/Qt5FcKpMm8o4
X-Google-Smtp-Source: AGHT+IG9+JuJqbT2TuU8J7qhPDQqp/HN08f8j/6H+CK0ZJJJOenew6gN7m8yBjpTbDcLQA3dWIudrA==
X-Received: by 2002:adf:fa04:0:b0:337:c528:c0e8 with SMTP id m4-20020adffa04000000b00337c528c0e8mr2558951wrr.49.1705910577824;
        Mon, 22 Jan 2024 00:02:57 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600010cd00b003392c1f40acsm4527284wrx.28.2024.01.22.00.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 00:02:56 -0800 (PST)
Message-ID: <d16723a6-5602-4fa8-9cfc-589846b75f5b@gmail.com>
Date: Mon, 22 Jan 2024 09:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: arm: mediatek: Sort entries by SoC
 then board compatibles
Content-Language: en-US, ca-ES, es-ES
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231213150435.4134390-1-wenst@chromium.org>
 <20231213150435.4134390-2-wenst@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20231213150435.4134390-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_000259_510089_D1416BF4 
X-CRM114-Status: GOOD (  14.73  )
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



On 13/12/2023 16:04, Chen-Yu Tsai wrote:
> Some of the new MediaTek board entries were inserted in a chronological
> order, or just randomly. This makes it harder to search for an entry.
> 
> Sort the entries by first grouping by SoC, then sorting by board
> compatible strings. Also add a comment at the top asking people to do
> the same.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Does not apply cleanly, would you mind to rebase the whole series onto v6.8-rc1.

Regards,
Matthias

> ---
> Changes since v3:
> - Collected reviewed-by from Angelo
> Changes since v2:
> - none
> Changes since v1:
> - Collected ack from Conor
> ---
>   .../devicetree/bindings/arm/mediatek.yaml     | 123 +++++++++---------
>   1 file changed, 62 insertions(+), 61 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index a5999b3afc35..60337b439744 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -17,6 +17,7 @@ properties:
>       const: '/'
>     compatible:
>       oneOf:
> +      # Sort by SoC (last) compatible, then board compatible
>         - items:
>             - enum:
>                 - mediatek,mt2701-evb
> @@ -129,71 +130,10 @@ properties:
>             - enum:
>                 - mediatek,mt8173-evb
>             - const: mediatek,mt8173
> -      - items:
> -          - enum:
> -              - mediatek,mt8183-evb
> -          - const: mediatek,mt8183
> -      - description: Google Hayato rev5
> -        items:
> -          - const: google,hayato-rev5-sku2
> -          - const: google,hayato-sku2
> -          - const: google,hayato
> -          - const: mediatek,mt8192
> -      - description: Google Hayato
> -        items:
> -          - const: google,hayato-rev1
> -          - const: google,hayato
> -          - const: mediatek,mt8192
> -      - description: Google Spherion rev4 (Acer Chromebook 514)
> -        items:
> -          - const: google,spherion-rev4
> -          - const: google,spherion
> -          - const: mediatek,mt8192
> -      - description: Google Spherion (Acer Chromebook 514)
> -        items:
> -          - const: google,spherion-rev3
> -          - const: google,spherion-rev2
> -          - const: google,spherion-rev1
> -          - const: google,spherion-rev0
> -          - const: google,spherion
> -          - const: mediatek,mt8192
> -      - description: Acer Tomato (Acer Chromebook Spin 513 CP513-2H)
> -        items:
> -          - enum:
> -              - google,tomato-rev2
> -              - google,tomato-rev1
> -          - const: google,tomato
> -          - const: mediatek,mt8195
> -      - description: Acer Tomato rev3 - 4 (Acer Chromebook Spin 513 CP513-2H)
> -        items:
> -          - const: google,tomato-rev4
> -          - const: google,tomato-rev3
> -          - const: google,tomato
> -          - const: mediatek,mt8195
> -      - items:
> -          - enum:
> -              - mediatek,mt8186-evb
> -          - const: mediatek,mt8186
> -      - items:
> -          - enum:
> -              - mediatek,mt8192-evb
> -          - const: mediatek,mt8192
> -      - items:
> -          - enum:
> -              - mediatek,mt8195-demo
> -              - mediatek,mt8195-evb
> -          - const: mediatek,mt8195
>         - description: Google Burnet (HP Chromebook x360 11MK G3 EE)
>           items:
>             - const: google,burnet
>             - const: mediatek,mt8183
> -      - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
> -        items:
> -          - enum:
> -              - google,krane-sku0
> -              - google,krane-sku176
> -          - const: google,krane
> -          - const: mediatek,mt8183
>         - description: Google Cozmo (Acer Chromebook 314)
>           items:
>             - const: google,cozmo
> @@ -244,6 +184,13 @@ properties:
>                 - google,kodama-sku32
>             - const: google,kodama
>             - const: mediatek,mt8183
> +      - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
> +        items:
> +          - enum:
> +              - google,krane-sku0
> +              - google,krane-sku176
> +          - const: google,krane
> +          - const: mediatek,mt8183
>         - description: Google Willow (Acer Chromebook 311 C722/C722T)
>           items:
>             - enum:
> @@ -251,10 +198,64 @@ properties:
>                 - google,willow-sku1
>             - const: google,willow
>             - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8183-evb
> +          - const: mediatek,mt8183
>         - items:
>             - enum:
>                 - mediatek,mt8183-pumpkin
>             - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-evb
> +          - const: mediatek,mt8186
> +      - description: Google Hayato
> +        items:
> +          - const: google,hayato-rev1
> +          - const: google,hayato
> +          - const: mediatek,mt8192
> +      - description: Google Hayato rev5
> +        items:
> +          - const: google,hayato-rev5-sku2
> +          - const: google,hayato-sku2
> +          - const: google,hayato
> +          - const: mediatek,mt8192
> +      - description: Google Spherion (Acer Chromebook 514)
> +        items:
> +          - const: google,spherion-rev3
> +          - const: google,spherion-rev2
> +          - const: google,spherion-rev1
> +          - const: google,spherion-rev0
> +          - const: google,spherion
> +          - const: mediatek,mt8192
> +      - description: Google Spherion rev4 (Acer Chromebook 514)
> +        items:
> +          - const: google,spherion-rev4
> +          - const: google,spherion
> +          - const: mediatek,mt8192
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-evb
> +          - const: mediatek,mt8192
> +      - description: Acer Tomato (Acer Chromebook Spin 513 CP513-2H)
> +        items:
> +          - enum:
> +              - google,tomato-rev2
> +              - google,tomato-rev1
> +          - const: google,tomato
> +          - const: mediatek,mt8195
> +      - description: Acer Tomato rev3 - 4 (Acer Chromebook Spin 513 CP513-2H)
> +        items:
> +          - const: google,tomato-rev4
> +          - const: google,tomato-rev3
> +          - const: google,tomato
> +          - const: mediatek,mt8195
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-demo
> +              - mediatek,mt8195-evb
> +          - const: mediatek,mt8195
>         - items:
>             - enum:
>                 - mediatek,mt8365-evk

