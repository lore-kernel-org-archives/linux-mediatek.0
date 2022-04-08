Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvlZSpl9W/UjPVm4F3JmLarZbnd30K1l7Kvl/IC5qHQ=; b=gXF238XlrgWx9i
	c/s5yaBDBCcHVFWThirdFsPCdsW/PGw0TV9/iHC/s/gE/deFQ78nQFOSeX5HY49kxPpR1JRhlYkCr
	pY3Ij92e0hi6M1XHw7+cS+DhM14MnuaeBkQ4I06+n7JRasFByZ88zV7KTcTGB/yEPtYZ7QMOct1YX
	Lr+0Xh2d7FNS8IZ1eGiYInIhM5Wqc2nMlXOPkSqJULaKX2H51ve13Q7mxA+OSDOD2QW5V0mDYgPeX
	8BcCSq7s3X4nfjazKDksOChVESzWn0dcUfeGrq09UpgU83Mw91E/lM/fcBMLzXBXOGZQx0K5XyFv+
	6nOmCZ31tphAgkGgplng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncou6-00HSQj-88; Fri, 08 Apr 2022 13:43:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconZ-00HOkQ-N4; Fri, 08 Apr 2022 13:37:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AD1491F471A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425032;
 bh=yvdhlBbyjy2wKA9A8evE3TntodGtErEGfYOGyB6LfFE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=iYZD7QeMXd9KAHItKnzoKM1eJ57GcN9prt4CsNMouqebhtmqQXbmNmF9jotgW5SaC
 C422MS/B1sySj4Ha1EtqUCC4xtxR3khH5RqFV+HcrvQwfwnIGVR23M7dm9oAUgqnk0
 23Qf48eqbTSFASP1MTbyMdkAa9FD23coSlnE4t2aEmjjgOdSgaEmu4jhhfBWEn7oRj
 bqO4A2weB9tPRCvgLgIqE8FE20+wbnVkDjADszYHz6fIz9ApK6ZbRDSIh07gfooOps
 6abAoPfBqVazbGedpjpdAGsGpGYkbmZNO0rYo6hXlsOT5gQhzJU8PzWa1widwy/SoF
 DP6d8kUTPUB/Q==
Message-ID: <dc18d877-effb-1286-341d-1792ea6fcc05@collabora.com>
Date: Fri, 8 Apr 2022 15:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-14-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063713_998805_04D21494 
X-CRM114-Status: GOOD (  20.13  )
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

Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> In some MediaTek SoCs, like MT8183, CPU and CCI share the same power
> supplies. Cpufreq needs to check if CCI devfreq exists and wait until
> CCI devfreq ready before scaling frequency.
> 
> - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will start
>    DVFS when CCI is ready.
> - Add platform data for MT8183.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 69 +++++++++++++++++++++++++++++-
>   1 file changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index b08ab7c14818..cebe5af2ef5d 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -22,6 +22,7 @@ struct mtk_cpufreq_platform_data {
>   	int proc_max_volt;
>   	int sram_min_volt;
>   	int sram_max_volt;
> +	bool is_ccifreq_support;

bool ccifreq_supported; looks better.

>   };
>   
>   /*
> @@ -38,6 +39,7 @@ struct mtk_cpufreq_platform_data {
>   struct mtk_cpu_dvfs_info {
>   	struct cpumask cpus;
>   	struct device *cpu_dev;
> +	struct device *cci_dev;
>   	struct regulator *proc_reg;
>   	struct regulator *sram_reg;
>   	struct clk *cpu_clk;
> @@ -52,6 +54,7 @@ struct mtk_cpu_dvfs_info {
>   	int opp_cpu;
>   	unsigned long opp_freq;
>   	const struct mtk_cpufreq_platform_data *soc_data;
> +	bool is_ccifreq_bounded;

bool ccifreq_bound; looks better.

>   };
>   
>   static struct platform_device *cpufreq_pdev;
> @@ -171,6 +174,29 @@ static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
>   	return ret;
>   }
>   
> +static bool is_ccifreq_ready(struct mtk_cpu_dvfs_info *info)
> +{
> +	struct device_link *sup_link;
> +
> +	if (info->is_ccifreq_bounded)
> +		return true;
> +
> +	sup_link = device_link_add(info->cpu_dev, info->cci_dev,
> +				   DL_FLAG_AUTOREMOVE_CONSUMER);
> +	if (!sup_link) {
> +		dev_err(info->cpu_dev, "cpu%d: sup_link is NULL\n",
> +			info->opp_cpu);

Please, don't break this line: 84 columns are ok.

> +		return false;
> +	}
> +
> +	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
> +		return false;
> +
> +	info->is_ccifreq_bounded = true;
> +
> +	return true;
> +}
> +
>   static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>   				  unsigned int index)
>   {
> @@ -183,6 +209,9 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>   	long freq_hz, old_freq_hz;
>   	int vproc, old_vproc, inter_vproc, target_vproc, ret;
>   
> +	if (info->soc_data->is_ccifreq_support && !is_ccifreq_ready(info))
> +		return 0;

Honestly, I think that pretending that everything is alright and faking
set_target success is *not* a good idea...

You should return -EAGAIN here, not zero.

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
