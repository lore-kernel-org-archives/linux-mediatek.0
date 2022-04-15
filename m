Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A57DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdiODnv/OI3cvoUg4ehqIX5+MlsYmXewaHISFYkbH0M=; b=tP8ZA581XaT5yy
	FQJka62UONp+VReRprj1/j+pfqA0KHEufEPoN6fofM+5PWA8yxmda1ea4asx2dNwoMsXOCY87oVUn
	8lCJIQwblHl7JEz+WZX6efSpjt5qO36FSNu3dwc1w896+40k7j9rWfDjgkxHlGNdOjrP7O2G3dRyp
	hy+kQSe9X7c30+UBXminmjEq27NcQHd7FHrlD7eLq4lKdzgO3sxky1BXOKxnMjKHxYh2M97Ptzio6
	3OYRWgTWnaOaIthVQyZvaAwEVwWJvJD6w+0Szt5sN/If/6XPimc/GD97WDyOQp8vtwI+HUltKD+I4
	2SsLwF8Lln5uNKLcaJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL1n-009xiu-VU; Fri, 15 Apr 2022 12:26:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKzv-009wMv-Ts; Fri, 15 Apr 2022 12:24:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C73A11F47DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025462;
 bh=CgoMr81ngES5EOve3elaYWzsRcAHP5/TfWon8crvZeI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MMkbJocU1xYEPcKtyRt9KlIWzn690WXHgcaVc/H0u5GyfrHo6wLilW8U1eS6y7+MV
 IoxmFFurFRiy1cyLOugkg3lvSNul9MZbfcZELqlpw9x20Hk4nORqD2tXBbdUUg7L67
 2pP9E7k2HTH4joiLrnggpWMTNgxrqaZcGUjaPKex0LzNBntNgihy/ne0ZuxJAj/JKY
 BXJ1OO3aoS1pYyUpg5NVQdNiIjyNajfu3DggcUIjWC/3ZZJmNmlqHyXX58lY6/K9hr
 UHI+eUi1KBNm2A20xcaFPrHbSP+J8ZXIhSoKNL4ZTzNy7HluqdGRAbelvpgV9fRk7o
 /4YbAZS3CXtNw==
Message-ID: <9751622e-f969-c025-2a39-efcc9a612392@collabora.com>
Date: Fri, 15 Apr 2022 14:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 04/15] cpufreq: mediatek: Record previous target vproc
 value
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052424_151182_FB0AAEE4 
X-CRM114-Status: GOOD (  18.92  )
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

Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> We found the buck voltage may not be exactly the same with what we set
> because CPU may share the same buck with other module.
> Therefore, we need to record the previous desired value instead of reading
> it from regulators.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index ff27f77e8ee6..fa8b193bf27b 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -40,6 +40,7 @@ struct mtk_cpu_dvfs_info {
>   	struct list_head list_head;
>   	int intermediate_voltage;
>   	bool need_voltage_tracking;
> +	int pre_vproc;
>   };
>   
>   static LIST_HEAD(dvfs_info_list);
> @@ -191,11 +192,17 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>   
>   static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
>   {
> +	int ret;
> +
>   	if (info->need_voltage_tracking)
> -		return mtk_cpufreq_voltage_tracking(info, vproc);
> +		ret = mtk_cpufreq_voltage_tracking(info, vproc);
>   	else
> -		return regulator_set_voltage(info->proc_reg, vproc,
> -					     vproc + VOLT_TOL);
> +		ret = regulator_set_voltage(info->proc_reg, vproc,
> +					    MAX_VOLT_LIMIT);
> +	if (!ret)
> +		info->pre_vproc = vproc;
> +
> +	return ret;
>   }
>   
>   static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
> @@ -213,7 +220,9 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>   	inter_vproc = info->intermediate_voltage;
>   
>   	pre_freq_hz = clk_get_rate(cpu_clk);
> -	pre_vproc = regulator_get_voltage(info->proc_reg);
> +	pre_vproc = info->pre_vproc;
> +	if (pre_vproc <= 0)
> +		pre_vproc = regulator_get_voltage(info->proc_reg);

I would do it like that, instead:

	if (unlikely(info->pre_vproc <= 0))
		pre_vproc = regulator_get_voltage(info->proc_reg);
	else
		pre_vproc = info->pre_vproc;

....as even though it is indeed possible that info->pre_vproc is <= 0, it is
very unlikely to happen ;-)
This also solves a 'pre_vproc' double assignment issue, by the way.

Cheers,
Angelo




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
