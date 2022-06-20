Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF71C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuPCzTzhcmOZzHOmk2sFdgEFNoZlfvJu9dKlztxiN/Y=; b=PqoAszcpOA+6cdojfDUxgMtR+r
	whDkAqEnecyECw8/DBjFiTt1pn00bSUqGQgh+t/VvsOnE+RppHpa9oBjfagBApxgbw7fOvNrC6E+p
	fGlmO1lFEnZUbTIX76ASpdsMShdSZFr24S56J07o9kYtE3MDjJ1DyD4scvOEcPIxKy/DLhf1dEj3O
	hwrB4Uo+8tkT1QtdJ6VWCLuedoNYBgP2mX83+joNnjumQS89A/Rcrpnvk1OTi5v5uQDVU7shm7HBh
	chfanDa+jwIqD/g+qn4efLOHQbAWzUFsXu7AIkldqEGRWfc+3VLxV39/kaIDJ6bhMc4fXvG4GT0V7
	PG3mdwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39Fq-00GAed-JQ; Mon, 20 Jun 2022 04:43:14 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39Fg-00GAbf-LJ
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 04:43:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id t21so2910332pfq.1
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 21:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XuPCzTzhcmOZzHOmk2sFdgEFNoZlfvJu9dKlztxiN/Y=;
        b=v2uTas0ITpi6sQ50rCEMiLgEQR9vCoVW8ykoCP10v0VHG7XLW9lbVQXcTERpNEkdBl
         yQGU3U23/U+g3a64sDok8eq+zzWMr1dnUcDpvansrDgbrCg66FWQZYKvva4AkLKbMWoZ
         8dbbX8Fo4bmY8KFxhOYkNuHZ4W/pEwF7wYX3oXNGZOBY+UaVRJxNT2sFIonlJAR7ap7p
         OgV3hh4RJGh+onEG9mQKJvwMGM0HVbp/asqZxsudKFOh9bK3xv/cW+v4aatOIlIzpg4K
         IrpKKR7Yu+MwA/BgE54nYrAlkva2582Ea+Pn9asSrhQCryKo/YKsWFb4cZUuWTPMCA8H
         s8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XuPCzTzhcmOZzHOmk2sFdgEFNoZlfvJu9dKlztxiN/Y=;
        b=rinkEsjojh3X6mWNlyF39AURm0l9HZNAIwg9VT+54PT0C32c2ilow4HupwJBYtuKJI
         H7taLfrmnseInW4sa4xcw+98IlrTQTZhqG8kmnvUSphejaXsY+ZmqgUmSii2EY8bzyC3
         ea/SenJ8GpeHpCXdaR9qfWuUmZIHGtHXndSFk/zNMiRmq5h0pF69PLkzNHbUYtIi4WIH
         963srh7cnMQaEtf9A2xtw07THDS3lURjjGhW73mIhi+qzYwH7rsHWWznAOoWcLmvOSoA
         mWykyXMAEDBbcax6fzSCoMy18mz4tK+JSJa8oK0xjukbDrzqu7HxlkDh6S7oe4/pkT6c
         G/yQ==
X-Gm-Message-State: AJIora8Oz0v8FqyVFsLK+50ExvIoIq2DJsHVI/juYKJ+7rGpG014O1bd
	Lz/MNJBI5BWSk6EHkUuY3NQt/Q==
X-Google-Smtp-Source: AGRyM1u9VfNHrad/tqs9W/bOQOD4E8u6NsMRQEd+0M8Qya2WVZ9s43KSlqXGkWaUUjAwmTx+ToXCLw==
X-Received: by 2002:a05:6a00:198c:b0:51c:7547:58e0 with SMTP id d12-20020a056a00198c00b0051c754758e0mr22239590pfl.82.1655700181896;
        Sun, 19 Jun 2022 21:43:01 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902f70200b0015e8d4eb231sm7527303plo.123.2022.06.19.21.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 21:43:01 -0700 (PDT)
Date: Mon, 20 Jun 2022 10:12:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	jia-wei.chang@mediatek.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] cpufreq: Add MT8186 to cpufreq-dt-platdev blocklist
Message-ID: <20220620044251.ice5qcuw26utmups@vireshk-i7>
References: <20220617110926.90313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617110926.90313-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_214304_723735_8F86B2F1 
X-CRM114-Status: GOOD (  14.46  )
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

On 17-06-22, 13:09, AngeloGioacchino Del Regno wrote:
> This SoC shall use the mediatek-cpufreq driver, or the system will
> crash upon any clock scaling request: add it to the cpufreq-dt-platdev
> blocklist.
> 
> Fixes: 39b360102f3a ("cpufreq: mediatek: Add support for MT8186")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> 
> v2: Moved fixes tag on top of SoB (oops!), added Matthias' R-b
> 
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 96de1536e1cb..2c96de3f2d83 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -127,6 +127,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "mediatek,mt8173", },
>  	{ .compatible = "mediatek,mt8176", },
>  	{ .compatible = "mediatek,mt8183", },
> +	{ .compatible = "mediatek,mt8186", },
>  	{ .compatible = "mediatek,mt8365", },
>  	{ .compatible = "mediatek,mt8516", },

Applied. Thanks.

-- 
viresh

