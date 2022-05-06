Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB23C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 04:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+ujvBsbzWasE8wqQztab07xvykCcPcXuHthMPc3oZg=; b=yiK7CgSfQW2IQf
	LNziCng7tVTFKp/l3VU+3zTNZ03BseX7azvaIoiFpp8jCAO2WWc9fcYmar1q6RiWgmSyeVSgPlLun
	9sh5qJZuHZCA/F0Lv8nndIft24OWzyIPU8PNpwjE2eHuy8luR9DSIrZVNJbE1F064uBJMjUQksTmQ
	/p7Ha4wGIGLIU13Wj37PB1yz/t16zJtTr5G9rA9+E8+0KYCiIiHlSeE4vPWpIcQj44NvEt3UcvtZo
	D0fk0LKc78M5gww+jMb5Ckg3yK0prkR6PNCFvqWhe8k2eBaeAIuu3FPqT4i6BzIxAZdsd6TeQdB3R
	uhBrCdRmRao52Jgq74GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmpNF-001IML-ET; Fri, 06 May 2022 04:15:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmpNC-001ILG-RG
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 04:15:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d22so6258684plr.9
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 21:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R/JHLfDAQrV9xOGhzra2h+ainY41c+tt3o0Xd3OLmhw=;
 b=c4fzFuDhsQhD0LdG4dZbWh+NUKlqtf2jrqEoekqkr5CnGWaYf2BpWC31hg9oqK2c0e
 q91xDSAb83uHcs0Uh16R9vRuIqzdQt4zpJfFVJmoSqtqDiWMEbQnlvqJ1uSo5+KCgAoK
 oa5LqI2nct7M+reVdueNvbT6EZB5R325owozcH/prBLXXKAMsMOY0B471IzILPeC0NAX
 NKPzIEyGEuoJouZpY9SbzoKkrYoF27h2KYiTRBm8+QyqonOeiAFu08ALGxUSLmu5YDQ7
 d4DoklmXhMpQMi91NcicCgUHzoG2P0mkTZ6AGCnOsiojCie0UhtjinS0TswK93ZTY1ds
 fHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R/JHLfDAQrV9xOGhzra2h+ainY41c+tt3o0Xd3OLmhw=;
 b=fdXJRxuxWJlfxe8WVQUiQ7mDgtpgrIWiz9Wwfy6bHrVa2OsDO29tnVlxegLVeLMaPA
 ZlliET2f5LC8Mwx426BQsaF/l+/e3fWPKW0rbrQYMX1/Z6o5QQtukiolUo+cIOOuFRA6
 +55NQBGqsHDD9ZmnPBC/zBu/3nHo72KprpA4AGEIhrLeJrfPBP4rqBKCyr3Qvr30fl3u
 QDpt1xBSBXnI9U0bTgPioe/GQMUuxmXPWFrahCDcBQQ6IrGmLTs27N6yQTE9n7FjRcG9
 ctb1dbNMddx9tTDPa2smcXWwRok+XQlRMNQI7bvzr4eBHEcPXwmGf7Dj2gIe7JKxAQla
 yiTw==
X-Gm-Message-State: AOAM530uWCAv2pgARGRr9GTsFt0CZXIjrX9x1NWHDueH//3fBVVsVNYv
 m6/VYugDxOdkLST58alhCBIBAA==
X-Google-Smtp-Source: ABdhPJwk5nWnpNJarUlQBxTVR7h7SYQUnYhBQ5GvBhQ/vYBElXoiYPF/PoTKw8y1FcD9glwduGsdgA==
X-Received: by 2002:a17:90b:d91:b0:1da:35d7:a0c with SMTP id
 bg17-20020a17090b0d9100b001da35d70a0cmr1960385pjb.92.1651810521504; 
 Thu, 05 May 2022 21:15:21 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 s11-20020a170902a50b00b0015e8d4eb2b5sm447141plq.255.2022.05.05.21.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 21:15:20 -0700 (PDT)
Date: Fri, 6 May 2022 09:45:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH v6 05/10] cpufreq: mediatek: Add opp notification support
Message-ID: <20220506041518.5j5rfakayur64y7e@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-6-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505115226.20130-6-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_211522_928477_B9BC5707 
X-CRM114-Status: GOOD (  25.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05-05-22, 19:52, Rex-BC Chen wrote:
> >From this opp notifier, cpufreq should listen to opp notification and do
> proper actions when receiving events of disable and voltage adjustment.
> 
> One of the user for this opp notifier is MediaTek SVS.
> The MediaTek Smart Voltage Scaling (SVS) is a hardware which calculates
> suitable SVS bank voltages to OPP voltage table.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 91 +++++++++++++++++++++++++++---
>  1 file changed, 83 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index fe205eca657d..06d80ee06bbf 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -46,6 +46,11 @@ struct mtk_cpu_dvfs_info {
>  	int intermediate_voltage;
>  	bool need_voltage_tracking;
>  	int pre_vproc;
> +	/* Avoid race condition for regulators between notify and policy */
> +	struct mutex reg_lock;
> +	struct notifier_block opp_nb;
> +	unsigned int opp_cpu;
> +	unsigned long opp_freq;

The name opp_freq doesn't fit well, I renamed it to current_freq.

>  	const struct mtk_cpufreq_platform_data *soc_data;
>  	int vtrack_max;
>  };
> @@ -182,6 +187,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  
>  	pre_freq_hz = clk_get_rate(cpu_clk);
>  
> +	mutex_lock(&info->reg_lock);
> +
>  	if (unlikely(info->pre_vproc <= 0))
>  		pre_vproc = regulator_get_voltage(info->proc_reg);
>  	else
> @@ -214,7 +221,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  			dev_err(cpu_dev,
>  				"cpu%d: failed to scale up voltage!\n", policy->cpu);
>  			mtk_cpufreq_set_voltage(info, pre_vproc);
> -			return ret;
> +			goto out;
>  		}
>  	}
>  
> @@ -224,8 +231,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  		dev_err(cpu_dev,
>  			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
>  		mtk_cpufreq_set_voltage(info, pre_vproc);
> -		WARN_ON(1);
> -		return ret;
> +		goto out;
>  	}
>  
>  	/* Set the original PLL to target rate. */
> @@ -235,7 +241,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  			"cpu%d: failed to scale cpu clock rate!\n", policy->cpu);
>  		clk_set_parent(cpu_clk, armpll);
>  		mtk_cpufreq_set_voltage(info, pre_vproc);
> -		return ret;
> +		goto out;
>  	}
>  
>  	/* Set parent of CPU clock back to the original PLL. */
> @@ -244,8 +250,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  		dev_err(cpu_dev,
>  			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
>  		mtk_cpufreq_set_voltage(info, inter_vproc);
> -		WARN_ON(1);
> -		return ret;
> +		goto out;
>  	}
>  
>  	/*
> @@ -260,15 +265,72 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  			clk_set_parent(cpu_clk, info->inter_clk);
>  			clk_set_rate(armpll, pre_freq_hz);
>  			clk_set_parent(cpu_clk, armpll);
> -			return ret;
> +			goto out;
>  		}
>  	}
>  
> -	return 0;
> +	info->opp_freq = freq_hz;
> +
> +out:
> +	mutex_unlock(&info->reg_lock);
> +
> +	return ret;
>  }
>  
>  #define DYNAMIC_POWER "dynamic-power-coefficient"
>  
> +static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
> +				    unsigned long event, void *data)
> +{
> +	struct dev_pm_opp *opp = data;
> +	struct dev_pm_opp *new_opp;
> +	struct mtk_cpu_dvfs_info *info;
> +	unsigned long freq, volt;
> +	struct cpufreq_policy *policy;
> +	int ret = 0;
> +
> +	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> +
> +	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
> +		freq = dev_pm_opp_get_freq(opp);
> +
> +		mutex_lock(&info->reg_lock);
> +		if (info->opp_freq == freq) {
> +			volt = dev_pm_opp_get_voltage(opp);
> +			ret = mtk_cpufreq_set_voltage(info, volt);
> +			if (ret)
> +				dev_err(info->cpu_dev,
> +					"failed to scale voltage: %d\n", ret);
> +		}
> +		mutex_unlock(&info->reg_lock);
> +	} else if (event == OPP_EVENT_DISABLE) {
> +		freq = dev_pm_opp_get_freq(opp);
> +
> +		/* case of current opp item is disabled */
> +		if (info->opp_freq == freq) {
> +			freq = 1;
> +			new_opp = dev_pm_opp_find_freq_ceil(info->cpu_dev,
> +							    &freq);
> +			if (IS_ERR(new_opp)) {
> +				dev_err(info->cpu_dev,
> +					"all opp items are disabled\n");
> +				ret = PTR_ERR(new_opp);
> +				return notifier_from_errno(ret);
> +			}
> +
> +			dev_pm_opp_put(new_opp);
> +			policy = cpufreq_cpu_get(info->opp_cpu);
> +			if (policy) {
> +				cpufreq_driver_target(policy, freq / 1000,
> +						      CPUFREQ_RELATION_L);
> +				cpufreq_cpu_put(policy);
> +			}
> +		}
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
>  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  {
>  	struct device *cpu_dev;
> @@ -357,6 +419,18 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
>  
> +	mutex_init(&info->reg_lock);
> +
> +	info->opp_cpu = cpu;
> +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
> +	if (ret) {
> +		dev_err(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
> +		goto out_disable_inter_clock;
> +	}
> +
> +	info->opp_freq = clk_get_rate(info->cpu_clk);

This is a resource as well, which should have been initialized before
registering notifier.

Applied with above changes. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
