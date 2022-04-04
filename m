Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93656C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDhHCx4I9oGZJlHl5XRGk4Ml6wy0vn3tLixUrAhv6kI=; b=4ANlTNeQRXbB3O
	iIILgxUx7cPVQU0/qq8VZvVMousaAqhfooIp+ihuLOam9vxQSdhZqdNNXrekvn39gaAuehih2WT4h
	8AFHXnsxB3qVQQFcBnfh/g6CcgYhDjnEheIPZ51L7uRvhKKrkcOYzUlr7PEoaBctNIMZuYbgBjFYS
	F9tPUVUGr3qFBNGmivi/V2Ks1wdUwZYdEXTS2tb76Y4wW1ZQVREMdspvvX13bciRhwWmW4WtaAylP
	amr4V2sbVN1aosDdMKkr1MDyb3P/xOPbbhyet8iOrDGxo4WcLocJ8t2CzCnwzYrNLtwraqeKLIrnE
	mwJJZG807uaOYobzCtdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbP9o-00FgGF-98; Mon, 04 Apr 2022 16:02:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbP9I-00FfwT-D2; Mon, 04 Apr 2022 16:01:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 423991474;
 Mon,  4 Apr 2022 09:01:47 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC7633F73B;
 Mon,  4 Apr 2022 09:01:46 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:01:45 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: Re: [RESEND][PATCH 3/8] PM: EM: Use the new .get_cost() callback
 while registering EM
Message-ID: <YksWaaskx0YhXFR9@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321095729.20655-4-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090148_650986_65837A39 
X-CRM114-Status: GOOD (  23.26  )
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

Hi Lukasz,

On Monday 21 Mar 2022 at 09:57:24 (+0000), Lukasz Luba wrote:
> The Energy Model (EM) allows to provide the 'cost' values when the device
> driver provides the .get_cost() optional callback. This removes
> restriction which is in the EM calculation function of the 'cost'
> for each performance state. Now, the driver is in charge of providing
> the right values which are then used by Energy Aware Scheduler.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  kernel/power/energy_model.c | 39 ++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index 6ecee99af842..95a3b33001f6 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -121,7 +121,8 @@ static void em_debug_remove_pd(struct device *dev) {}
>  #endif
>  
>  static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
> -				int nr_states, struct em_data_callback *cb)
> +				int nr_states, struct em_data_callback *cb,
> +				unsigned long flags)
>  {
>  	unsigned long power, freq, prev_freq = 0, prev_cost = ULONG_MAX;
>  	struct em_perf_state *table;
> @@ -173,10 +174,22 @@ static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
>  	/* Compute the cost of each performance state. */
>  	fmax = (u64) table[nr_states - 1].frequency;
>  	for (i = nr_states - 1; i >= 0; i--) {
> -		unsigned long power_res = em_scale_power(table[i].power);
> +		unsigned long power_res, cost;
> +
> +		if (flags & EM_PERF_DOMAIN_ARTIFICIAL) {
> +			ret = cb->get_cost(dev, table[i].frequency, &cost);
> +			if (ret || !cost || cost > EM_MAX_POWER) {
> +				dev_err(dev, "EM: invalid cost %lu %d\n",
> +					cost, ret);
> +				goto free_ps_table;
> +			}
> +		} else {
> +			power_res = em_scale_power(table[i].power);
> +			cost = div64_u64(fmax * power_res, table[i].frequency);
> +		}
> +
> +		table[i].cost = cost;
>  
> -		table[i].cost = div64_u64(fmax * power_res,
> -					  table[i].frequency);
>  		if (table[i].cost >= prev_cost) {
>  			table[i].flags = EM_PERF_STATE_INEFFICIENT;
>  			dev_dbg(dev, "EM: OPP:%lu is inefficient\n",
> @@ -197,7 +210,8 @@ static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
>  }
>  
>  static int em_create_pd(struct device *dev, int nr_states,
> -			struct em_data_callback *cb, cpumask_t *cpus)
> +			struct em_data_callback *cb, cpumask_t *cpus,
> +			unsigned long flags)
>  {
>  	struct em_perf_domain *pd;
>  	struct device *cpu_dev;
> @@ -215,7 +229,7 @@ static int em_create_pd(struct device *dev, int nr_states,
>  			return -ENOMEM;
>  	}
>  
> -	ret = em_create_perf_table(dev, pd, nr_states, cb);
> +	ret = em_create_perf_table(dev, pd, nr_states, cb, flags);
>  	if (ret) {
>  		kfree(pd);
>  		return ret;
> @@ -332,6 +346,7 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>  				bool milliwatts)
>  {
>  	unsigned long cap, prev_cap = 0;
> +	unsigned long flags = 0;
>  	int cpu, ret;
>  
>  	if (!dev || !nr_states || !cb)
> @@ -378,14 +393,16 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>  		}
>  	}
>  
> -	ret = em_create_pd(dev, nr_states, cb, cpus);
> +	if (milliwatts)
> +		flags |= EM_PERF_DOMAIN_MILLIWATTS;
> +	else if (cb->get_cost)
> +		flags |= EM_PERF_DOMAIN_ARTIFICIAL;
> +
> +	ret = em_create_pd(dev, nr_states, cb, cpus, flags);
>  	if (ret)
>  		goto unlock;
>  
> -	if (milliwatts)
> -		dev->em_pd->flags |= EM_PERF_DOMAIN_MILLIWATTS;
> -	else if (cb->get_cost)
> -		dev->em_pd->flags |= EM_PERF_DOMAIN_ARTIFICIAL;
> +	dev->em_pd->flags |= flags;
>  

nit: given that there is a designated function to create the PD which
now requires information on flags to initilise the domains properly,
might be better to have dev->em_pd->flags set inside that function,
rather than here.

>  	em_cpufreq_update_efficiencies(dev);
>  

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

Thanks,
Ionela.

> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
