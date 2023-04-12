Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74081C77B71
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPng0uX84C5bAhSzcWmSxhhcnDr0cY7vCS4LxH5PTLI=; b=B1jxdZ3EBIe2Qb722vQ/WGA4yn
	rlZRkoCendVhf083EmEJtPgkbdfs3chdYtFNINb/QWOe3Z59f3uRHifLl5neI9tF/abU16j5OOQFK
	9h5P4/1mpKD9N7urvPT1+MJHS5eZg2GuyVy7XWP/QXnULlgR6SUmDcyX7MpkQDynGdgVbMfw114Tg
	v5sXVVD6YaFb2mtCSfZMnGWh6zti+hn9kuDGhTjclQvrDvDcUBxt8l3gKNRqKGq8Iwbb19AvXoCMI
	fX0WQHvOQwhIvT3hafNwvF38tjivTjDRZU21i1GDAyzSo2L8nx5mHeaDGVsnuP25/G61FaTrIGucc
	2xTHvHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYS1-002lTL-0V;
	Wed, 12 Apr 2023 11:15:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYRy-002lSL-0P;
	Wed, 12 Apr 2023 11:15:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so4145969wmb.3;
        Wed, 12 Apr 2023 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681298140; x=1683890140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPng0uX84C5bAhSzcWmSxhhcnDr0cY7vCS4LxH5PTLI=;
        b=XMKWPnTXpH9z4caj9fCy5PB0e1zEhMyySW6oD0xZZetZbZnufST4PS5xRV2jfQqUSg
         p3yd0lIwS1EfGyta0ASTxPiy4tU4+WFux713j02I4h2hOrysY+HhyHBzOIwr6bI8fO1z
         69Yc88c/Q27Jw+E5429lWcfLo/G51E7s3XvV6EwyWJwk11NUPxc2u9Nh9uCzswbmcwNy
         Zqu+D5SG01MDbSKNCLapa0tp2VE1x5aLJGoUWzKBoO0F6LUUZXyVfb/fDwVlAGbk0VYP
         6Gn4w0xlNyyYXMVH9UbSFns4TSPlDS25AoA6aVkahjCtf35r07PmWj5UGWXHtFOI9UdY
         FX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681298140; x=1683890140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPng0uX84C5bAhSzcWmSxhhcnDr0cY7vCS4LxH5PTLI=;
        b=Z+GnXuvZJpNuEAB1IxAd2o/6mjIesOvxjnBpXV/QHaiPtZ0Gf/SOlwc2kWjJ68dc1a
         bO3vaCXk0SWuolLJa4JJ59yUhbBhzCm8qIYIR5mt6XdFX1zxiB8ByVpcoGDe7semFPCw
         IBfS99ngxNWPaxwOiw7/rt5lR/+Q1+EzJJO7RWPHb7UfXWRRt756/c+giXG6MFtyrhr5
         AgO/zrB5cRg31WvBJ4Yq00M+px2jepZzyw9S59MR7qpiGOrV+dfh1ZuHVi87oVIO1Pxf
         Bf3KZMXQWTHU6+k5C/kTcrP951xZYL7nKh9+mZmEs9PtIy7YPnFNaZiehvtJqA2ZdpWH
         282Q==
X-Gm-Message-State: AAQBX9d2jmrHUYZ0XQt30y2pIjQbPH7AcepCUeHwu1+chW2smlPrKLAI
	Ym/v+LZXO0KY7Nx2GBr8qGE=
X-Google-Smtp-Source: AKy350ZjmuWZhJ+YDUrMDgqUmQgVF1CFmTs2u1hfTFBUXLq1SFrDwQBWBq4Fho3ErVSJ7XpQ1mNbpw==
X-Received: by 2002:a05:600c:3791:b0:3f0:7f07:e617 with SMTP id o17-20020a05600c379100b003f07f07e617mr1727822wmr.8.1681298139560;
        Wed, 12 Apr 2023 04:15:39 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d50cd000000b002c71b4d476asm16866714wrt.106.2023.04.12.04.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 04:15:38 -0700 (PDT)
Message-ID: <f3080105-bb30-3d59-c337-3a4afc6f3518@gmail.com>
Date: Wed, 12 Apr 2023 13:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next 1/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_041542_165240_60DC7516 
X-CRM114-Status: GOOD (  17.10  )
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



On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index b640bc0559e7..03aae9f95606 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -185,7 +185,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_cec *cec;
> -	struct resource *res;
>   	int ret;
>   
>   	cec = devm_kzalloc(dev, sizeof(*cec), GFP_KERNEL);
> @@ -195,8 +194,7 @@ static int mtk_cec_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, cec);
>   	spin_lock_init(&cec->lock);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	cec->regs = devm_ioremap_resource(dev, res);
> +	cec->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(cec->regs)) {
>   		ret = PTR_ERR(cec->regs);
>   		dev_err(dev, "Failed to ioremap cec: %d\n", ret);

