Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61333C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uws7ZBBTv1acYBJZ6w2kSLSiJ9SPBwS66raiWd4kIqM=; b=WQX8hG+d2IlTOyl18n/8B3/Anf
	MEH7Q8zekcotiGC99ESNr2iyey/J+AiVOuwISVBuMnw54EctHYroJHd1b1uBNUP7ypg6PnsvOwsUr
	QgawhtG/irDrK1VUiSt7T5upq8txCEsojAVdVbyvQEsBCoqsc3NqZuCLzdlA/7kCWZLQX2haCoL94
	en28q95E3Fx/o9bNx4Jzi2JO6KzXZ+kcZTamDBOnvRdEizS6ngAggy0uVIcP8+s1W+N6IcOm79Cxg
	uwK2GyTR9ERIJTeesj92gqFqtx4nyr4/YFYGyKOcc9VsqDRT+yjT642ZuIoiJQSSVSD/QdGhIyFXy
	CSHPrixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91vL-00896L-Ie; Wed, 06 Jul 2022 10:06:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91fy-007wao-Oz; Wed, 06 Jul 2022 09:50:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3259A1042;
	Wed,  6 Jul 2022 02:50:30 -0700 (PDT)
Received: from [10.57.42.44] (unknown [10.57.42.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DB933F66F;
	Wed,  6 Jul 2022 02:50:25 -0700 (PDT)
Message-ID: <f545c1f4-0cb5-ec4e-66e8-dbed6b992085@arm.com>
Date: Wed, 6 Jul 2022 10:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V3.1 02/20] OPP: Make dev_pm_opp_set_regulators() accept
 NULL terminated list
Content-Language: en-GB
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Qiang Yu <yuq825@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <9730e011004b7526e79c6f409f5147fb235b414a.1656935522.git.viresh.kumar@linaro.org>
 <bcabb1a90a5158628ee1633c10f8886544723fb9.1657095331.git.viresh.kumar@linaro.org>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <bcabb1a90a5158628ee1633c10f8886544723fb9.1657095331.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_025030_950702_0F9D03D6 
X-CRM114-Status: GOOD (  21.98  )
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

On 06/07/2022 09:18, Viresh Kumar wrote:
> Make dev_pm_opp_set_regulators() accept a NULL terminated list of names
> instead of making the callers keep the two parameters in sync, which
> creates an opportunity for bugs to get in.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V3->V3.1:
> - Update panfrost_drv.c to include the NULL element.
> 
>  drivers/cpufreq/cpufreq-dt.c                |  9 ++++-----
>  drivers/cpufreq/ti-cpufreq.c                |  7 +++----
>  drivers/devfreq/exynos-bus.c                |  4 ++--
>  drivers/gpu/drm/lima/lima_devfreq.c         |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c |  3 +--
>  drivers/gpu/drm/panfrost/panfrost_drv.c     | 15 ++++++++++-----
>  drivers/opp/core.c                          | 18 ++++++++++++------
>  drivers/soc/tegra/pmc.c                     |  4 ++--
>  include/linux/pm_opp.h                      |  9 ++++-----
>  9 files changed, 40 insertions(+), 32 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 194af7f607a6..5110cd9b2425 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -101,8 +101,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  		return 0;
>  	}
>  
> -	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> -					 pfdev->comp->num_supplies);
> +	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names);
>  	if (ret) {
>  		/* Continue if the optional regulator is missing */
>  		if (ret != -ENODEV) {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7fcbc2a5b6cd..8a4bef65d38c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -625,24 +625,29 @@ static int panfrost_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const char * const default_supplies[] = { "mali" };
> +/*
> + * The OPP core wants the supply names to be NULL terminated, but we need the
> + * correct num_supplies value for regulator core. Hence, we NULL terminate here
> + * and then initialize num_supplies with ARRAY_SIZE - 1.
> + */
> +static const char * const default_supplies[] = { "mali", NULL };
>  static const struct panfrost_compatible default_data = {
> -	.num_supplies = ARRAY_SIZE(default_supplies),
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
>  	.num_pm_domains = 1, /* optional */
>  	.pm_domain_names = NULL,
>  };
>  
>  static const struct panfrost_compatible amlogic_data = {
> -	.num_supplies = ARRAY_SIZE(default_supplies),
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
>  
> -static const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
> +static const char * const mediatek_mt8183_supplies[] = { "mali", "sram", NULL };
>  static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies) - 1,
>  	.supply_names = mediatek_mt8183_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks for the rework, much cleaner.

Steve


