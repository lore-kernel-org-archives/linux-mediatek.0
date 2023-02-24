Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD736C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQvbTmRd0wBclAPG2MPi6CMdsRbzsN7+1DTSz6yCgHs=; b=HAnsz1R7m2UyGdr+mgoUPgzpgr
	kXR40CBkibEIwCCLYfHo5KtLAQHezFi19fmweadJJmOWfbp4BoGYO4CjpFia/k+/ijFP2E4e2KRV3
	AULWoZrujqBuhO72/LytrnqS4wSfNrnztUravblIeUOORDoymxavBd66tM+QQ5+KWs8IYeNIheqw2
	hXDKW3x4ioSgkeYYNrk6XIGU5R2SHP2pLSMN0xxkfYA47Z7hOb0bs/OjNOJV2bYonZD0FsmtARQIJ
	P3S6a44f0u0XiEJDObYPMlE6Kw5kszQzQhrVspTv6/8Rqu00qEnQZpHYN/exbTmJhMc8uYkpH9pJJ
	BMtx/xiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTis-001Ze2-9m; Fri, 24 Feb 2023 08:46:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTih-001ZZ7-5R; Fri, 24 Feb 2023 08:46:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741C4C14;
	Fri, 24 Feb 2023 00:47:00 -0800 (PST)
Received: from [192.168.1.79] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C0093F703;
	Fri, 24 Feb 2023 00:46:15 -0800 (PST)
Message-ID: <4e0673e7-5685-ad1b-2fac-4ae544caefeb@arm.com>
Date: Fri, 24 Feb 2023 08:46:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 11/11] drm/panfrost: Add support for Mali on the MT8186
 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
Cc: daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230223133440.80941-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_004623_292042_935174A6 
X-CRM114-Status: GOOD (  14.39  )
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

On 23/02/2023 13:34, AngeloGioacchino Del Regno wrote:
> MediaTek MT8186 has a Mali-G52 MC2 2EE (Bifrost): add a new compatible
> and platform data using the same supplies list as "mt8183_b" (only one
> regulator), and a new pm_domains list with only two power domains.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 14cdeaeeb5c4..e4053bf84c62 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -679,6 +679,14 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  };
>  
> +static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
> +static const struct panfrost_compatible mediatek_mt8186_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
> +	.pm_domain_names = mediatek_mt8186_pm_domains,
> +};
> +
>  static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
>  static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
>  							   "core3", "core4" };
> @@ -708,6 +716,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "arm,mali-valhall-jm", .data = &default_data, },
>  	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
>  	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
> +	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>  	{}
>  };


