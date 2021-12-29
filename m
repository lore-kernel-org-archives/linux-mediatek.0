Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A65C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvvXIu50mhIq18cLTnActHnawlGzleRi0tz0KO65YlY=; b=jK18sWWJnzONxY
	a7mfdi8E3L9wPkUN5uuFJo2Ec88YunR9otBoUPbTaFX0dqsoiduLIUox0bIHFwZ0y3jsarJizj/Et
	syVxjbkdMPIyM/4JO5jyDBkX2fOpFTFvVV7GJtjw9LfMDjljNAUJGZy6AJAX0fOIO9aeYZlax80Mm
	qD+gFhoxzFpxiP2QUgbTQfmaCX99M8xbPTqf/GtMok7YUqVcJumratxK4VhE2yMIS51JDqgDgfs+k
	OcPtOkwDeN71P0clGtwCtbELe4u96p877TQB4p3qlS9XvhKgc+4bl3NJhb+xhBy3mALWC/N+eaWDa
	6DZzRP0Sa9xvDVxccXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2eos-003M7i-Iv; Wed, 29 Dec 2021 19:41:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2eof-003M5z-P3; Wed, 29 Dec 2021 19:40:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id w20so37317985wra.9;
 Wed, 29 Dec 2021 11:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hGRJ1HYHgx6Z5TD/JKBwqHCaslyKNZyupIsR2i8Poyw=;
 b=YCaq8M0RQ4k5mZfPFoejGPd+TZ2z34WbpOscTPjrml2fkckagkJz9v34SuLJc4qaa4
 yF/31YJvfaIYvysmBWjd0PxW1fL0YnqSCnmOyowAeiSr8wg4XN98O8UVDXbm9rr3kenx
 3DVduU8Kzc1FvSYVdf0xL17Oa6zmJ3LB2boxOTYHtMTKY5RMMNA/B9LZjk2NqCWPUhkc
 h97n+NPbD4pYZIoGPCKaTTHdiGa5ESzMF31bhHAtkwXhJV4LgLRo6IrDvz/J1zy/ibbc
 MQr8cq+RiIzfH8Z26qkpOCjx72xGGTARvSc00ULHXhV607yZW64/mzqAbOOW38IHUXGG
 7dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGRJ1HYHgx6Z5TD/JKBwqHCaslyKNZyupIsR2i8Poyw=;
 b=47GMPlaCM/KETt4sHmqPsGcV037m8XJHmEvbKPrSOkvB/HvVCAMQb4G4GjKet8Y4zI
 oKKRA3O4xsyySV4cEH2H89GXVP175Odc3w6Ibv6nNIEa1iQHm3b6dJQSdAUvT/pPg9zP
 81OKDjYsPS3XnSwanHIrrNzh1IRmsOV4CDstNSIhN/AlbqqODG+gGQ/tSZT/Z6CF2lRD
 58dMthle/giXSyeN6hLuO8qkxOiUXVzw+uFsVY3ZYlDEZSAgxT2uYEqCsGBjc9pDfQps
 7IA4xyueS4icScwmeiSqrUtXLjsNqisSpLMhotvqcS+xV9S1OWG3SxHMc4dM7WPu5uPC
 2OVg==
X-Gm-Message-State: AOAM533wNGiZz3NCFh1nzsmQo5dPMooC/XobGLuH64XMNVDqnY0YoTU7
 g5zJb9ct4kcPGd2SPUFT/1c=
X-Google-Smtp-Source: ABdhPJwXpLlka8AsE24wSg4a1QSRHYJhtq9ZoTOxBuTvDapaJJDktWT/iUH9gkB6MFV6VqhffpiFDQ==
X-Received: by 2002:a5d:58f2:: with SMTP id f18mr22004078wrd.98.1640806852049; 
 Wed, 29 Dec 2021 11:40:52 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id b19sm26799443wmb.38.2021.12.29.11.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 11:40:50 -0800 (PST)
Message-ID: <c2b47f56-ff83-d36a-2c4f-6e1fee439c5b@gmail.com>
Date: Wed, 29 Dec 2021 20:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 2/4] dt-bindings: spi: spi-mtk-nor: add new clock name
 'axi' for spi nor
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, robh+dt@kernel.org,
 linus.walleij@linaro.org, broonie@kernel.org
Cc: bgolaszewski@baylibre.com, sean.wang@mediatek.com,
 bayi.cheng@mediatek.com, gch981213@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-3-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211220121825.6446-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_114053_892068_CD7F0EDC 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 20/12/2021 13:18, Tinghan Shen wrote:
> Some mtk spi nor has dedicated dma(s) inside. Add a new clock name, axi,
> for spi nor dma bus clock.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml       | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> index 7393f30535df..478afebfec9c 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> @@ -43,14 +43,19 @@ properties:
>       maxItems: 1
>   
>     clocks:
> +    minItems: 2
>       items:
>         - description: clock used for spi bus
>         - description: clock used for controller
> +      - description: clock used for nor dma bus. this depends on hardware
> +                     design, so this is optional.
>   
>     clock-names:
> +    minItems: 2
>       items:
>         - const: spi
>         - const: sf
> +      - const: axi
>   
>   required:
>     - compatible
> @@ -84,4 +89,3 @@ examples:
>           };
>         };
>       };
> -
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
