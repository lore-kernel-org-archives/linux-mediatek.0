Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSGY8U2HHsfWJD2lbHYotz/+maaf+XuKF9nEAtqGQCg=; b=p9mEVgPvAwpA+q
	4lR1auoKAkUlAv03RoWtVkbKpPZ4gRFLlm1RSe2XlMq5iwRzkGuIm+wh0eqitxXqlnNsmJrfATkWT
	hAh+8A+dwIrOFpnY6rElm9LJKNKZywZql2vhV/Gwi9C3mTL8SGDelWwhTbQ+NrFfeCkGOU4nZbmto
	N24nvNL9EnulShC7FoUuMUqOq1diU7TrRFx1IZp/cH6j/ct8MYzaqXeoRzmdPj8ld32IUTvZ6DIzn
	kOLsthHwOyeJxH/C4PHzPJa0Lwi7p4MFoL0/Exn+ZCFqRJGlqeEVlaDRV9CyDH0/Rs5LmU7pWKtju
	aURez2maeeLUmuPkTdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbP9E-00Ffv3-W2; Mon, 04 Apr 2022 16:01:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbP8o-00Ffgc-QC; Mon, 04 Apr 2022 16:01:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B086D6E;
 Mon,  4 Apr 2022 09:01:18 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55ED3F73B;
 Mon,  4 Apr 2022 09:01:17 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:01:16 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: Re: [RESEND][PATCH 2/8] PM: EM: Add artificial EM flag
Message-ID: <YksWTEwcmymS8+zm@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321095729.20655-3-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090118_933634_B36356B1 
X-CRM114-Status: GOOD (  17.08  )
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

On Monday 21 Mar 2022 at 09:57:23 (+0000), Lukasz Luba wrote:
> From: Pierre Gondois <Pierre.Gondois@arm.com>
> 
> The Energy Model (EM) can be used on platforms which are missing real
> power information. Those platforms would implement .get_cost() which
> populates needed values for the Energy Aware Scheduler (EAS). The EAS
> doesn't use 'power' fields from EM, but other frameworks might use them.
> Thus, to avoid miss-usage of this specific type of EM, introduce a new
> flags which can be checked by other frameworks.
> 
> Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  include/linux/energy_model.h | 5 +++++
>  kernel/power/energy_model.c  | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
> index 0a3a5663177b..92e82a322859 100644
> --- a/include/linux/energy_model.h
> +++ b/include/linux/energy_model.h
> @@ -67,11 +67,16 @@ struct em_perf_domain {
>   *
>   *  EM_PERF_DOMAIN_SKIP_INEFFICIENCIES: Skip inefficient states when estimating
>   *  energy consumption.
> + *
> + *  EM_PERF_DOMAIN_ARTIFICIAL: The power values are artificial and might be
> + *  created by platform missing real power information
>   */
>  #define EM_PERF_DOMAIN_MILLIWATTS BIT(0)
>  #define EM_PERF_DOMAIN_SKIP_INEFFICIENCIES BIT(1)
> +#define EM_PERF_DOMAIN_ARTIFICIAL BIT(2)
>  
>  #define em_span_cpus(em) (to_cpumask((em)->cpus))
> +#define em_is_artificial(em) ((em)->flags & EM_PERF_DOMAIN_ARTIFICIAL)
>  
>  #ifdef CONFIG_ENERGY_MODEL
>  #define EM_MAX_POWER 0xFFFF
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index 0153b0ca7b23..6ecee99af842 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -384,6 +384,8 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>  
>  	if (milliwatts)
>  		dev->em_pd->flags |= EM_PERF_DOMAIN_MILLIWATTS;
> +	else if (cb->get_cost)
> +		dev->em_pd->flags |= EM_PERF_DOMAIN_ARTIFICIAL;
>  
>  	em_cpufreq_update_efficiencies(dev);
>  

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
