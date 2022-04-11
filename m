Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF62CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 03:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVFuckmUC1dyFijllBpJ8bc2ACle9Mx8RwqhvhPafcU=; b=0a1ldRbiSlnPXT
	gyu+cBgNeoStvMIkEgXTPOhVGhxo5fN+RD2R6Aso+tS/cm6zyAWg+3qEA1KsLIYQS0qOsxhza5dmb
	FbBh5jLrC/1ipgkZneIlMwddxa+jYIZxs0w8PyWjtDGGysgyyYeLpVeYsKVy4xkd657aqHgli/Q5F
	GI7dXJhMkXcT5zWT6BdDJ7wmv9aKC+G4fCmaNYMuY0IT+T4vTKUGn6p74BZPMLp7clxclH7OwIUqL
	ZxUP9+z8IQ/oHLTgerWPfoi2lxgQ9usc3ahKQZFK13mtYc5iynawkTNAFKzptujthGGEGueQ0M1vr
	ItXMyuzDUuKyi1xrvy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkhq-006T0q-7r; Mon, 11 Apr 2022 03:27:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndkhe-006SxW-BQ
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 03:26:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id p25so6702213pfn.13
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Apr 2022 20:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iePzAY4s9oNe9r1gZgKsDyZfLq/xq3Wu66mTe2SS1a8=;
 b=cz2urYf9dwqT9+3vV4unBRv44lrda5K2NgGGJn4QFKGmycwHI0lX7CAWFGlSTGL9rL
 OS5fKMUOfs5PnPiPLC/5Z/VnUHIz9oxxdWbBFX9GiK5KFhzeJ0KWDTpxXy3Roj7JDKdC
 JmqiKdOmnmX6dQc4/pkvI+tfj7bMmwGDFjIuPuLS72FmeMk5Yv+cn7rMXGnkVA5LjBAe
 x1o7U2a9JLUPC9brFZGJAnUW1o7504pH7MES2SsFkuDbViqIw9n+Pk7I91+fQEbqEYz+
 bhXhQctiOrrQxVvLNuDmKsQqZpDo99D6u7fxoKouWxtGTcmH5SRGgVtxouIKlOtsH1c1
 jTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iePzAY4s9oNe9r1gZgKsDyZfLq/xq3Wu66mTe2SS1a8=;
 b=7YfjYYQBTI2FPtR1F5dtuFizdW2hZ9n/gGZSdyKIFk5+LweLwgEVDedaWhQfdkjlNQ
 ilnUXuztkMBQ6PmztKY+SEoRrWaEQEdwUCtpPnMjaJA6lzgbuffMTl1Rf5h6FhYSPDSO
 PTUEGcb3RoqKyFae3I9mSGbC3iAAg2jDFtIVD8AZIfvxDnfheOuclpRRqGQZH+JtJr6N
 Od4Y6mwsPwxBdcwEIWdQuPpK6ILWSisxW3LdXVWed+yNf8/ruEeKT0l7MaCdfLvOeioC
 6VjuWcWRoXEkBreHbh0cHl3jpHuI3HAGh3UCndvZIXgjcdNrNbc9DY8Dj1Bhd+ff5m2f
 nQXQ==
X-Gm-Message-State: AOAM533SQuWfLpFdijPGGN1R9dxhFsdtSeBMyexWXSVlfOyvaWnlB18x
 2gL8i7nZxJ6UU9sgVk0u+JqeEA==
X-Google-Smtp-Source: ABdhPJy7iOPr39nrGVdmH8I35PUMwel6TcCkay2LmFP7c9ln6hx9kug3RyhDMEv5UH3EOIemmlc0zA==
X-Received: by 2002:a63:2a92:0:b0:398:a420:4faa with SMTP id
 q140-20020a632a92000000b00398a4204faamr24765350pgq.222.1649647617063; 
 Sun, 10 Apr 2022 20:26:57 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 u5-20020a17090a3fc500b001cb3fec230bsm8849985pjm.14.2022.04.10.20.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 20:26:56 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:56:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH V2 06/15] cpufreq: mediatek: Record previous target vproc
 value
Message-ID: <20220411032654.5tqqivmstqkojfj5@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-7-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408045908.21671-7-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_202658_409668_017C43DD 
X-CRM114-Status: GOOD (  24.32  )
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

On 08-04-22, 12:58, Rex-BC Chen wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> We found the buck voltage may not be exactly the same with what we set
> because CPU may share the same buck with other module.
> Therefore, we need to record the previous desired value instead of reading
> it from regulators.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 31 +++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index dc4a87e68940..472f4de29e5f 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -40,6 +40,7 @@ struct mtk_cpu_dvfs_info {
>  	struct list_head list_head;
>  	int intermediate_voltage;
>  	bool need_voltage_tracking;
> +	int old_vproc;

I like prev_vproc better somehow, but it is up to you to name it :)

>  };
>  
>  static LIST_HEAD(dvfs_info_list);
> @@ -190,11 +191,17 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>  
>  static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
>  {
> +	int ret;
> +
>  	if (info->need_voltage_tracking)
> -		return mtk_cpufreq_voltage_tracking(info, vproc);
> +		ret = mtk_cpufreq_voltage_tracking(info, vproc);
>  	else
> -		return regulator_set_voltage(info->proc_reg, vproc,
> -					     vproc + VOLT_TOL);
> +		ret = regulator_set_voltage(info->proc_reg, vproc,
> +					    MAX_VOLT_LIMIT);
> +	if (!ret)
> +		info->old_vproc = vproc;
> +
> +	return ret;
>  }
>  
>  static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
> @@ -211,15 +218,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  
>  	inter_vproc = info->intermediate_voltage;
>  
> -	old_freq_hz = clk_get_rate(cpu_clk);
> -	old_vproc = regulator_get_voltage(info->proc_reg);
> -	if (old_vproc < 0) {
> -		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
> -		return old_vproc;
> -	}
> -

Why did you move it down from here? I think it was fine to error out
early if voltage isn't available.

>  	freq_hz = freq_table[index].frequency * 1000;
> -
>  	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &freq_hz);
>  	if (IS_ERR(opp)) {
>  		pr_err("cpu%d: failed to find OPP for %ld\n",
> @@ -229,6 +228,16 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  	vproc = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
>  
> +	old_freq_hz = clk_get_rate(cpu_clk);
> +	old_vproc = info->old_vproc;
> +	if (old_vproc == 0)
> +		old_vproc = regulator_get_voltage(info->proc_reg);
> +	if (old_vproc < 0) {
> +		dev_err(cpu_dev, "%s: invalid Vproc value: %d\n",
> +			__func__, old_vproc);
> +		return old_vproc;
> +	}
> +
>  	/*
>  	 * If the new voltage or the intermediate voltage is higher than the
>  	 * current voltage, scale up voltage first.
> -- 
> 2.18.0

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
