Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1197FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXWh+AvM9mAkoePtdwxy9C6gOEFneJ2qqqRj2UHVCZo=; b=5ClWVHLP7+bMc+
	UNuYaXQ6+tEgt24oxxECHyk9uNFVBNmFZqWigtcEbrjAocCnYWdvsX5iZjI1vthfipaoGIbTJlkea
	JDhgOgXfGVqURfVXv2NUWF3R3wvt10PNGEv2hwkhkLyahWZTh1PEsCqZwYN+I1JCnxQRyI2QROO5/
	n8MVjay97Ji0TrxGKqP2KVsqXx8/qf4yQFzLz5HYYuUGSwCVi5hJU1HScJalCEbMqwRUkuOPggCCO
	U7YekuL1uq2tXYxal56Dc0ZsEGe+yzuYGjNGb1u7KaZHdfvgL24wbQmC+zeP01t/+ZqAxOAFD1I30
	4kbPb6eh6cXx1y3GVqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrLd-001ZWv-Uq; Fri, 06 May 2022 06:21:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrLS-001ZT5-IY; Fri, 06 May 2022 06:21:44 +0000
X-UUID: 3d6a1a5cb9aa424bb393650b6219f666-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3352b423-5d18-46fc-ac4d-29ec4853d6a7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:dcaccab2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3d6a1a5cb9aa424bb393650b6219f666-20220505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 779807124; Thu, 05 May 2022 23:21:35 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 23:21:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 14:21:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 14:21:31 +0800
Message-ID: <507cf3d3df72923f96e142a74e0ef5fe5b8171e1.camel@mediatek.com>
Subject: Re: [PATCH v6 05/10] cpufreq: mediatek: Add opp notification support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>
Date: Fri, 6 May 2022 14:21:31 +0800
In-Reply-To: <20220506041518.5j5rfakayur64y7e@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-6-rex-bc.chen@mediatek.com>
 <20220506041518.5j5rfakayur64y7e@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_232142_672184_93EE316D 
X-CRM114-Status: GOOD (  28.43  )
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

On Fri, 2022-05-06 at 09:45 +0530, Viresh Kumar wrote:
> On 05-05-22, 19:52, Rex-BC Chen wrote:
> > > From this opp notifier, cpufreq should listen to opp notification
> > > and do
> > 
> > proper actions when receiving events of disable and voltage
> > adjustment.
> > 
> > One of the user for this opp notifier is MediaTek SVS.
> > The MediaTek Smart Voltage Scaling (SVS) is a hardware which
> > calculates
> > suitable SVS bank voltages to OPP voltage table.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 91
> > +++++++++++++++++++++++++++---
> >  1 file changed, 83 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index fe205eca657d..06d80ee06bbf 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -46,6 +46,11 @@ struct mtk_cpu_dvfs_info {
> >  	int intermediate_voltage;
> >  	bool need_voltage_tracking;
> >  	int pre_vproc;
> > +	/* Avoid race condition for regulators between notify and
> > policy */
> > +	struct mutex reg_lock;
> > +	struct notifier_block opp_nb;
> > +	unsigned int opp_cpu;
> > +	unsigned long opp_freq;
> 
> The name opp_freq doesn't fit well, I renamed it to current_freq.
> 
> >  	const struct mtk_cpufreq_platform_data *soc_data;
> >  	int vtrack_max;
> >  };
> > @@ -182,6 +187,8 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  
> >  	pre_freq_hz = clk_get_rate(cpu_clk);
> >  
> > +	mutex_lock(&info->reg_lock);
> > +
> >  	if (unlikely(info->pre_vproc <= 0))
> >  		pre_vproc = regulator_get_voltage(info->proc_reg);
> >  	else
> > @@ -214,7 +221,7 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  			dev_err(cpu_dev,
> >  				"cpu%d: failed to scale up voltage!\n",
> > policy->cpu);
> >  			mtk_cpufreq_set_voltage(info, pre_vproc);
> > -			return ret;
> > +			goto out;
> >  		}
> >  	}
> >  
> > @@ -224,8 +231,7 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  		dev_err(cpu_dev,
> >  			"cpu%d: failed to re-parent cpu clock!\n",
> > policy->cpu);
> >  		mtk_cpufreq_set_voltage(info, pre_vproc);
> > -		WARN_ON(1);
> > -		return ret;
> > +		goto out;
> >  	}
> >  
> >  	/* Set the original PLL to target rate. */
> > @@ -235,7 +241,7 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  			"cpu%d: failed to scale cpu clock rate!\n",
> > policy->cpu);
> >  		clk_set_parent(cpu_clk, armpll);
> >  		mtk_cpufreq_set_voltage(info, pre_vproc);
> > -		return ret;
> > +		goto out;
> >  	}
> >  
> >  	/* Set parent of CPU clock back to the original PLL. */
> > @@ -244,8 +250,7 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  		dev_err(cpu_dev,
> >  			"cpu%d: failed to re-parent cpu clock!\n",
> > policy->cpu);
> >  		mtk_cpufreq_set_voltage(info, inter_vproc);
> > -		WARN_ON(1);
> > -		return ret;
> > +		goto out;
> >  	}
> >  
> >  	/*
> > @@ -260,15 +265,72 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  			clk_set_parent(cpu_clk, info->inter_clk);
> >  			clk_set_rate(armpll, pre_freq_hz);
> >  			clk_set_parent(cpu_clk, armpll);
> > -			return ret;
> > +			goto out;
> >  		}
> >  	}
> >  
> > -	return 0;
> > +	info->opp_freq = freq_hz;
> > +
> > +out:
> > +	mutex_unlock(&info->reg_lock);
> > +
> > +	return ret;
> >  }
> >  
> >  #define DYNAMIC_POWER "dynamic-power-coefficient"
> >  
> > +static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
> > +				    unsigned long event, void *data)
> > +{
> > +	struct dev_pm_opp *opp = data;
> > +	struct dev_pm_opp *new_opp;
> > +	struct mtk_cpu_dvfs_info *info;
> > +	unsigned long freq, volt;
> > +	struct cpufreq_policy *policy;
> > +	int ret = 0;
> > +
> > +	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> > +
> > +	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
> > +		freq = dev_pm_opp_get_freq(opp);
> > +
> > +		mutex_lock(&info->reg_lock);
> > +		if (info->opp_freq == freq) {
> > +			volt = dev_pm_opp_get_voltage(opp);
> > +			ret = mtk_cpufreq_set_voltage(info, volt);
> > +			if (ret)
> > +				dev_err(info->cpu_dev,
> > +					"failed to scale voltage:
> > %d\n", ret);
> > +		}
> > +		mutex_unlock(&info->reg_lock);
> > +	} else if (event == OPP_EVENT_DISABLE) {
> > +		freq = dev_pm_opp_get_freq(opp);
> > +
> > +		/* case of current opp item is disabled */
> > +		if (info->opp_freq == freq) {
> > +			freq = 1;
> > +			new_opp = dev_pm_opp_find_freq_ceil(info-
> > >cpu_dev,
> > +							    &freq);
> > +			if (IS_ERR(new_opp)) {
> > +				dev_err(info->cpu_dev,
> > +					"all opp items are
> > disabled\n");
> > +				ret = PTR_ERR(new_opp);
> > +				return notifier_from_errno(ret);
> > +			}
> > +
> > +			dev_pm_opp_put(new_opp);
> > +			policy = cpufreq_cpu_get(info->opp_cpu);
> > +			if (policy) {
> > +				cpufreq_driver_target(policy, freq /
> > 1000,
> > +						      CPUFREQ_RELATION_
> > L);
> > +				cpufreq_cpu_put(policy);
> > +			}
> > +		}
> > +	}
> > +
> > +	return notifier_from_errno(ret);
> > +}
> > +
> >  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info,
> > int cpu)
> >  {
> >  	struct device *cpu_dev;
> > @@ -357,6 +419,18 @@ static int mtk_cpu_dvfs_info_init(struct
> > mtk_cpu_dvfs_info *info, int cpu)
> >  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
> >  	dev_pm_opp_put(opp);
> >  
> > +	mutex_init(&info->reg_lock);
> > +
> > +	info->opp_cpu = cpu;
> > +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> > +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
> > +	if (ret) {
> > +		dev_err(cpu_dev, "cpu%d: failed to register opp
> > notifier\n", cpu);
> > +		goto out_disable_inter_clock;
> > +	}
> > +
> > +	info->opp_freq = clk_get_rate(info->cpu_clk);
> 
> This is a resource as well, which should have been initialized before
> registering notifier.
> 
> Applied with above changes. Thanks.
> 

Hello Viresh,

Thanks for your help!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
