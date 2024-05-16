Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0666AC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 May 2024 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7xcYas1mCHPBv2m5841PBt02cH6wnPNq719uEG2i9Q=; b=DqSIm/rn/mWhyIjlfzWTg6Z7+L
	5/Qnw7fjxUIDOxsKupFtecoDvxeOKAaLv8+765nqyNlZkuzmOvdQk8myLin6ZHoQOqMpkQDt0Cgjc
	BzwVBc7hnYvrUiHloqy1FyzpAVU3+jptO9wXvyjd9onKXhfF17c7ZVfbESYtf7WUk+FgLZSBcvwqV
	lwfp4Qq3kufeEANrRew+m3jsvm9znVa4xZki8kTwsyTiCpxDZPRO0aedhjRW9xrUpHLXwIKQ1Tiwa
	grVUTYCn47P6rLAnenfT5YfOpPXqcEX5N+6Oy/wwM+O3H7lVlquNpaDFr0uBHhMe9JOBd10OUyd7m
	nh7TZpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Y5o-00000004RXH-2c3U;
	Thu, 16 May 2024 10:12:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Y5k-00000004RVd-2Y1E;
	Thu, 16 May 2024 10:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715854321;
	bh=fJVijZDsk7G+N5ZyDazIeeDuEW47pTV5GN2yegKbc4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U4jJXRQEQ9NqrEbULaHQIdf6/LNc1tjtq9H0VDDd+AWcnVMH0yoqF1hM9h3BYYsrO
	 jmTs0f+wdu4NNZF8aUQ37jo4tY5jGlupeOt0silOa73/mVBuLZK8fpib56bgU9/mxk
	 hKECjqfE+bnd0ah2bzSZmtNwMw2IVBGDJgHFzw3jH2kB7fM2uMUOK/bYxzpuCDY5ov
	 Y8HmqA03vGqdBQb3FEF7U+CWLdIiecb23ypUyYhLcUUTLP3d6u5vil1hR5Le0RfDb0
	 xXG7jNYW21Qd71b0yl1I2wIH35KRecTOi+qBEOEmh8RRr9kKd+kVOrljGHLE1N0uyF
	 CaqBGh//bGyfQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4A61C3780C13;
	Thu, 16 May 2024 10:12:01 +0000 (UTC)
Message-ID: <671f4976-46e6-4873-98b2-89df896e4a4f@collabora.com>
Date: Thu, 16 May 2024 12:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/mediatek: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <4a64dfbfbcfdf9b7cd46bc8026223e69a4b453b4.1712681770.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4a64dfbfbcfdf9b7cd46bc8026223e69a4b453b4.1712681770.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_031204_802213_77E1BD9B 
X-CRM114-Status: GOOD (  22.43  )
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

Il 09/04/24 19:02, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_padding.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
> index 0d6451c149b6..9f92b720aaae 100644
> --- a/drivers/gpu/drm/mediatek/mtk_padding.c
> +++ b/drivers/gpu/drm/mediatek/mtk_padding.c
> @@ -137,10 +137,9 @@ static int mtk_padding_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int mtk_padding_remove(struct platform_device *pdev)
> +static void mtk_padding_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_padding_component_ops);
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_padding_driver_dt_match[] = {
> @@ -151,7 +150,7 @@ MODULE_DEVICE_TABLE(of, mtk_padding_driver_dt_match);
>   
>   struct platform_driver mtk_padding_driver = {
>   	.probe		= mtk_padding_probe,
> -	.remove		= mtk_padding_remove,
> +	.remove_new	= mtk_padding_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-padding",
>   		.owner	= THIS_MODULE,


