Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A227C33C9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 08:36:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2873620684
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 08:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LjJTtvGG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHpRnVxI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2873620684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFWp86VtDfTterqsTkOY6jmKd8JxJg1DFadsSJR7EYI=; b=LjJTtvGGErl5+F
	iZsbt0pbl07KuQ18f7EQGZ83D8juFkLJ9WXaCPqzYINW1hSOUQvwnP2DgoLZSL2Kc1M1u7RtY5p0L
	eDCDqlkpu6Bk+jBEZamPIpYtbKQK+M/xHPrMY5JMCOxqdEC3f7L7Si10FVdifD7nTNjq+UbTs/9PU
	7hpjlh6kWhRHiOJtK8pygf0uuDoudgAbD4opkqhpRmaJ7zHA+DgZ4A9ZpL6g1jyyVMWRueoAy3gs5
	+YtAD0bJkwQJDU41vtcb5t68VMeqD5HUOURhmq8WIcPKroL3iWqWrBRbzlRDXhSMlwYQ5bBPyYpLm
	ho7QCb668rmyRz0Yj/BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZsoE-0000jE-Mp; Wed, 27 Nov 2019 08:36:26 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZsoC-0000i9-FI
 for linux-mediatek@lists.infradead.org; Wed, 27 Nov 2019 08:36:26 +0000
Received: by mail-pf1-x443.google.com with SMTP id d199so5979265pfd.11
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Nov 2019 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kEWlTxImZpdkwXhGS8325FceSNRBs8VLhunG13s9KAM=;
 b=yHpRnVxIjSPnmIdbMbeu/tYzFBYDtKTTB287cO1KR1bARwSmREn/eQP74Bl7Af9/y8
 a82ewmL2RBQDxl2XmBxTNBAL+KaxJmKAwlKSRl+2cOkk7//wvP6vjlBiIup/h7v2jo8V
 hD3ZtLbo9ZCwivNiTAZq2pUpGLBvhYf0Fvj3PTlMiN0akT2u3kqKvVPIDeYgrbSC2Cb9
 ERUMql/9D07dmErr5NA8VCMA753S+WHPa1jovOmvlhsanFxOuurKFWr5XnitU2n4yk0s
 6g95m1QCflgnf2y6N/vMnCzgc3LucbF8wwRMWAlX49Y/dCTaJfA0G0K6Ehqx6Ay7WAr2
 baJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kEWlTxImZpdkwXhGS8325FceSNRBs8VLhunG13s9KAM=;
 b=PsMiYuxiLATnXPLQdcabXmQWn+4DvXqNS9bXjPBvedszC/yn4jkrwp6WYMrEaMF4/k
 DoA68J5Sl6aLYzOjUd/tXbsZOjH04itwV77Rpon6HyAEXhCd6KSSQiO4xZIc+z+FcJhd
 yS4EoTc8zYnuEIeZmfypBFNQDB2Rl8xt42utAH8VFhsr+rC8Sc+Je7Zu2eJ96N9Ugznj
 vvlZaKwscKK8HIDpGsYra2PjKCFS4pLmJp8HzqQa/Qn+1MFPdADCvfXkO7/df8Sjn3hm
 K5S7swiKlakgA0Xua1ZDbeBqnnq+2SldfsdpdRtcyTr/iE77PwTrZVL1+Q7iIrRBJKXK
 BgYg==
X-Gm-Message-State: APjAAAW8fjj06hBxi878TKrs3MUlpRkl6NqPtrSSOW45IgEQfLDjZInC
 LuQpBcIn4mSNofyEFLxLyzjNqQ==
X-Google-Smtp-Source: APXvYqz6ciA/bE2sIdxV8IrR+vllOp4Mb3eFxMKadK3NK074FLo5rfjIe4sBJET8JrQj229M/EAXpQ==
X-Received: by 2002:a63:1b1f:: with SMTP id b31mr3451053pgb.177.1574843782900; 
 Wed, 27 Nov 2019 00:36:22 -0800 (PST)
Received: from localhost ([122.171.112.123])
 by smtp.gmail.com with ESMTPSA id k24sm15884442pfk.63.2019.11.27.00.36.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Nov 2019 00:36:21 -0800 (PST)
Date: Wed, 27 Nov 2019 14:06:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [v5, PATCH 4/5] cpufreq: mediatek: add opp notification for SVS
 support
Message-ID: <20191127083619.etocnhpyyut3hzwq@vireshk-i7>
References: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1574769046-28449-5-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574769046-28449-5-git-send-email-andrew-sh.cheng@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_003624_540902_DFEA5416 
X-CRM114-Status: GOOD (  18.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, fan.chen@mediatek.com,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26-11-19, 19:50, Andrew-sh.Cheng wrote:
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 4b0cc50dd93b..7c37ab31230a 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -42,6 +42,10 @@ struct mtk_cpu_dvfs_info {
>  	struct list_head list_head;
>  	int intermediate_voltage;
>  	bool need_voltage_tracking;
> +	struct mutex lock; /* avoid notify and policy race condition */

Will a read-write lock be better suited here for performance reasons ?

> +	struct notifier_block opp_nb;
> +	int opp_cpu;
> +	unsigned long opp_freq;
>  };
>  
>  static LIST_HEAD(dvfs_info_list);
> @@ -231,6 +235,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  	vproc = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
>  
> +	mutex_lock(&info->lock);
>  	/*
>  	 * If the new voltage or the intermediate voltage is higher than the
>  	 * current voltage, scale up voltage first.
> @@ -242,6 +247,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  			pr_err("cpu%d: failed to scale up voltage!\n",
>  			       policy->cpu);
>  			mtk_cpufreq_set_voltage(info, old_vproc);
> +			mutex_unlock(&info->lock);
>  			return ret;
>  		}
>  	}
> @@ -253,6 +259,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  		       policy->cpu);
>  		mtk_cpufreq_set_voltage(info, old_vproc);
>  		WARN_ON(1);
> +		mutex_unlock(&info->lock);
>  		return ret;
>  	}
>  
> @@ -263,6 +270,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  		       policy->cpu);
>  		clk_set_parent(cpu_clk, armpll);
>  		mtk_cpufreq_set_voltage(info, old_vproc);
> +		mutex_unlock(&info->lock);
>  		return ret;
>  	}
>  
> @@ -273,6 +281,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  		       policy->cpu);
>  		mtk_cpufreq_set_voltage(info, inter_vproc);
>  		WARN_ON(1);
> +		mutex_unlock(&info->lock);
>  		return ret;
>  	}
>  
> @@ -288,15 +297,75 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  			clk_set_parent(cpu_clk, info->inter_clk);
>  			clk_set_rate(armpll, old_freq_hz);
>  			clk_set_parent(cpu_clk, armpll);
> +			mutex_unlock(&info->lock);
>  			return ret;
>  		}
>  	}
>  
> +	info->opp_freq = freq_hz;
> +	mutex_unlock(&info->lock);
> +
>  	return 0;
>  }
>  
>  #define DYNAMIC_POWER "dynamic-power-coefficient"
>  
> +static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
> +				    unsigned long event, void *data)
> +{
> +	struct dev_pm_opp *opp = data;
> +	struct dev_pm_opp *opp_item;
> +	struct mtk_cpu_dvfs_info *info =
> +		container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);

Do the assignment after all definitions, instead of awkwardly breaking
the line here.

> +	unsigned long freq, volt;
> +	struct cpufreq_policy *policy;
> +	int ret = 0;
> +
> +	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
> +		freq = dev_pm_opp_get_freq(opp);
> +
> +		mutex_lock(&info->lock);
> +		if (info->opp_freq == freq) {
> +			volt = dev_pm_opp_get_voltage(opp);
> +			ret = mtk_cpufreq_set_voltage(info, volt);
> +			if (ret)
> +				dev_err(info->cpu_dev, "failed to scale voltage: %d\n",
> +					ret);
> +		}
> +		mutex_unlock(&info->lock);
> +	} else if (event == OPP_EVENT_DISABLE) {
> +		freq = info->opp_freq;
> +		opp_item = dev_pm_opp_find_freq_ceil(info->cpu_dev, &freq);

name it new_opp instead of opp_item.

> +		if (!IS_ERR(opp_item))
> +			dev_pm_opp_put(opp_item);
> +		else
> +			freq = 0;
> +

What is the purpose of the above code ?

> +		/* case of current opp is disabled */
> +		if (freq == 0 || freq != info->opp_freq) {
> +			// find an enable opp item

Use proper commenting style please.

> +			freq = 1;
> +			opp_item = dev_pm_opp_find_freq_ceil(info->cpu_dev,
> +							     &freq);
> +			if (!IS_ERR(opp_item)) {
> +				dev_pm_opp_put(opp_item);
> +				policy = cpufreq_cpu_get(info->opp_cpu);
> +				if (policy) {
> +					cpufreq_driver_target(policy,
> +						freq / 1000,
> +						CPUFREQ_RELATION_L);

Why don't you simply call this instead of all the code in the else
block ?

> +					cpufreq_cpu_put(policy);
> +				}
> +			} else {
> +				pr_err("%s: all opp items are disabled\n",
> +				       __func__);
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
> @@ -383,11 +452,21 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
>  
> +	info->opp_cpu = cpu;
> +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
> +	if (ret) {
> +		pr_warn("cannot register opp notification\n");
> +		goto out_free_opp_table;
> +	}
> +
> +	mutex_init(&info->lock);
>  	info->cpu_dev = cpu_dev;
>  	info->proc_reg = proc_reg;
>  	info->sram_reg = IS_ERR(sram_reg) ? NULL : sram_reg;
>  	info->cpu_clk = cpu_clk;
>  	info->inter_clk = inter_clk;
> +	info->opp_freq = clk_get_rate(cpu_clk);
>  
>  	/*
>  	 * If SRAM regulator is present, software "voltage tracking" is needed
> -- 
> 2.12.5

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
