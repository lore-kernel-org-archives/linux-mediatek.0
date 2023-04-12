Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F53C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oYUJMojD0ryoRHItO91lvPbTnTt0bQOfwf2G2otABA=; b=5A1OnkNvydisWRfAoEMDbLOAwM
	8JlSWwJqvo5BtWd+9FxFhpRpvwXo43n3ON/gd1DF0+ULELpyegw1VHp5lq5SKksSv6qOm2i/VtRNp
	J//wrlrcBwAxsEWvJsew8FtK3dytnAbW2gxd0jrz0JGte8WOrTtUv++WgrtOtRqCb6RBEPRCcxJzG
	+fxFMm1bKF6aAXT6HiJ+On5MCHsU+qAhzlcX4NgJpFtWUlMx9H0w0a7mZfmNPJbY7qKqvHsyrlaBV
	QX4O3Jr+lhi2sEqIiYjoZUODqgljgytvOWKVDpW79gfEh0ZRp7RcTeM2BGmqr2ZfIoaTZNyJFfnsF
	0vN0CEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYSS-002lck-2S;
	Wed, 12 Apr 2023 11:16:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYSQ-002lb8-2O;
	Wed, 12 Apr 2023 11:16:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id gw11-20020a05600c850b00b003f07d305b32so7053663wmb.4;
        Wed, 12 Apr 2023 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681298169; x=1683890169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oYUJMojD0ryoRHItO91lvPbTnTt0bQOfwf2G2otABA=;
        b=UnMwH+JjCQ8EQWQ9vLoNqgyX+7QvrHcuazJ4jFKYqPcDCdxeNDp+x9SPiRVbE70Vre
         9gx+uV/w0WEcVmrtFYxLaxPFlM3lIO7OzjXijSkfmmgoS00nWPPXm7tsNxSzfpnTt8e8
         xfixhDnKWplpU11hkit9j/B5cKVDVE0MIkifuytYOy3jtopZkV6qK3KzEwRn3Mo0qsB5
         u4U/B7/V4kUdX0s7exfVXuW/VaZtM0scyVFrLyyl+9TEDgeKU8uwRLuZ49NDS3rQPpqJ
         TWE4me1IIa3pUaEV31yVYbdz2C2W+/QL7T30NmjtPygbK6JDnbAiezzdZdF6R+RbJPZ2
         +j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681298169; x=1683890169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oYUJMojD0ryoRHItO91lvPbTnTt0bQOfwf2G2otABA=;
        b=gDDB/FntYrTtHMtWsE3FCpsr54VwYdzUNDkBbzZ+HPFts8JmsYA9Qs7dN5oSXy4pVW
         jy8d5G+AZR+iUyHnpBA3OPSLeMR7WkZRVdJ+WJXobeVaD5gi/tG/Q6+6R1q2ay7am8Ta
         eDOaRferyrC2PiELTtS///BBQwcMP7Ht2NTjUATn3iPZphJYM7PNWKhOxPbYfX5WkyjD
         fpki1ocO8pSS7kIlTgkinegwiA191W9VxlLXDtuM2XY2TazOfeYh1XgoVKfykvbOV9Iz
         l5sGQDVRYEypWR2PUSck8OHCek2llcBdH+XqGGWNFWN4785WUi7UmsPRmlV4yU79ISTx
         IpyQ==
X-Gm-Message-State: AAQBX9eMk4xfHdI9t61Gb3ht5S2DqzLJ9/juAjFhChzacv1/cVFpctPR
	s0BKrhw9M4jiMiiBKdN6uQJMjvtfpksixA==
X-Google-Smtp-Source: AKy350Ytb3nPP2kCpTxqr/Xs1qPJNN6qUvMq7Y9nRQ5UQ+DeYLvOYyNhKVCasxGI+ZcqtJSr3tcJjQ==
X-Received: by 2002:a1c:cc17:0:b0:3eb:9822:f0 with SMTP id h23-20020a1ccc17000000b003eb982200f0mr4214599wmb.30.1681298168974;
        Wed, 12 Apr 2023 04:16:08 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n15-20020a1c720f000000b003edc11c2ecbsm2055322wmc.4.2023.04.12.04.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 04:16:07 -0700 (PDT)
Message-ID: <9f42d92c-c111-1ad7-ea5b-c52efb71d15d@gmail.com>
Date: Wed, 12 Apr 2023 13:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next 3/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-3-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412064635.41315-3-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_041610_782591_8E1F1F59 
X-CRM114-Status: GOOD (  17.39  )
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
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 1773379b2439..5cee84cce0be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -159,7 +159,6 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_disp_ccorr *priv;
> -	struct resource *res;
>   	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -172,8 +171,7 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->clk);
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->regs = devm_ioremap_resource(dev, res);
> +	priv->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(priv->regs)) {
>   		dev_err(dev, "failed to ioremap ccorr\n");
>   		return PTR_ERR(priv->regs);

