Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E952CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWWHYKIx1H/E3uVcEX3XyNcJLAsCE3QSbYqIKkMTaSU=; b=FC7pr59QZEyqsW
	vmVUpWeW2/WraeEjOVbib1cu5LzN4GXe7SsoWZ4lLOuHxqGRimUcJX5oS6DoC6kzviXS8/QZ5H+eQ
	v9CzQ5hk0xX4ZTx9o4NGb1MGnM/96m9P/eVJ3FmqdQ1IIwcWse2W44ttjcWf039IDmlGdaPNMjIs9
	AbC5FO2cIeDfRQH+HZaoMrDh3aix63NW8cTfTb8sRxSqrXlmWBKPG5kTgCyd0bK8CBFt9nXyScO9z
	kXq2uz3aGLEUMwkijTdV+hjEzW+Ats7Q4o73OvKE2Lowd5Zcx0vrgKnfxRPdf+pm2dsYdhjxdHvUR
	TVKvxCjpywRNWBsApG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmX5U-00EnZH-Pj; Thu, 05 May 2022 08:43:52 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmX5Q-00EnWJ-LJ
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:43:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id g3so3146997pgg.3
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JIdmnFxfb9y9uHPy+Bax7qz9vXFbVwF1Bmo9V5O3V2Q=;
 b=v6fe119NMTQTXytrwJqYkuEXKXCwN7r39KRnuTZBCEpJubliaHL/QlzGlxJSXzXI1g
 vyLpUZ7cxn8RbrdU1naRF3Su3yAe4uBSni970hDFDrPQoPM+DiPcFto1uEMsPglQNtS+
 VggCs1/eYFg9WECyAO68n/bccWpSRuawb/HyCZmzwtR9W15qOf/XDuCw9DAba/3qwxZQ
 N4xP/CB5yZx3OhiYnw9vWfgkRnU5EJHk6eHJxRheByaAWZtTV8y7gWtQ2JO+0xveR0RF
 ePaDOiZskAVw6r2r/PuZ+tQmJlSCP80NJiTy8oY+VXra8Yd83GnuiNYzjYJAUIaVip2M
 oB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JIdmnFxfb9y9uHPy+Bax7qz9vXFbVwF1Bmo9V5O3V2Q=;
 b=af6qXUEs6ITmgRm3aRjjzjwv1wDhmoiVqOqmEYI/DQMy0cfCiG6eRnNGq1V+KTQMfM
 TBF8CEx99dWqM8DnRFkhCPCaQERCokMBlbjTcfvxlBW1Q36aPNOzlaiiH65K3PZPTpVr
 2pRYYOsm90ugFATcn6JbGQ2SO29zRAEwbZqpbtho+D7VQNzrpEHNZpk98LaFQjNzySgc
 wBhtcGRd3u0KdsTnU/V7aAk5HUJRWH2J0pO/Kq4e88wpl8OyCrvcxsLWMK+5Tsiu2nE7
 L5zXorrIsYvcDwhxuC4mgi/ZbKquJwzYUKsyCu7psN2UcGtrbK+oA6nyjCebpEvP55+g
 DRLA==
X-Gm-Message-State: AOAM530M4THbYs8OvFI5eWZTQECAgXgRFVNt3bioa5dY5H5fg8lb3aNz
 nRzLlaPZ1MeN4BIotVTkJPe3pA==
X-Google-Smtp-Source: ABdhPJyppwlHO3JoFGsjQtoSnaiRUdjztvdif3JofPWDcB7jlUyARstMHYURp1XYu6MD5ijz5x6ywg==
X-Received: by 2002:a05:6a00:1411:b0:4fd:e594:fac0 with SMTP id
 l17-20020a056a00141100b004fde594fac0mr24945149pfu.79.1651740227677; 
 Thu, 05 May 2022 01:43:47 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 b1-20020a1709027e0100b0015e8d4eb2c8sm891578plm.274.2022.05.05.01.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 01:43:47 -0700 (PDT)
Date: Thu, 5 May 2022 14:13:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH v5 2/9] cpufreq: mediatek: Add opp notification support
Message-ID: <20220505084345.e3qt3ocdft75tbxv@vireshk-i7>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
 <20220504130540.5902-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504130540.5902-3-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_014348_732944_8BFE91CF 
X-CRM114-Status: GOOD (  15.93  )
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

On 04-05-22, 21:05, Rex-BC Chen wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> >From this opp notifier, cpufreq should listen to opp notification and do

What happened with the extra ">" here ?

>  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  {
>  	struct device *cpu_dev;
> @@ -396,6 +458,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
>  
> +	info->opp_cpu = cpu;
> +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
> +	if (ret) {
> +		dev_err(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
> +		goto out_disable_inter_clock;
> +	}
> +
> +	mutex_init(&info->reg_lock);

You should always initialize a resource before its users. The notifier
callback, which can get called right after
dev_pm_opp_register_notifier() returns, will use this mutex.

> +	info->opp_freq = clk_get_rate(info->cpu_clk);
> +
>  	/*
>  	 * If SRAM regulator is present, software "voltage tracking" is needed
>  	 * for this CPU power domain.
> @@ -451,6 +524,9 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
>  	}
>  
>  	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
> +
> +	if (!IS_ERR_OR_NULL(info->cpu_dev))

cpu_dev can never be error here.

> +		dev_pm_opp_unregister_notifier(info->cpu_dev, &info->opp_nb);
>  }
>  
>  static int mtk_cpufreq_init(struct cpufreq_policy *policy)

I also asked you last time to stack things in a order so they are
easier for me to apply. Bugfixes, followed by simple cleanups, which
don't make behavioral changes, followed by real patches.

Now you have sent this patch at an early stage, which blocks me from
applying anything after this.

I can see the earlier comments weren't all considered, and it doesn't
look nice.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
