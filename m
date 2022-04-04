Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AATcdpzs+KKwLwEPOpeZPOTlZidxADDTyD3AlIg5uAg=; b=jiGIW+b9IZ67tn
	ifYGQRc9RttA6HyLTTes8rHQ12iZ3BghVCp/ZLFB+hjwzagyWl4I0n+xsUEDZh4MULuqpPBdq/OdQ
	GmY3O4Kz09HdVUFW+a8QC/DSieIkVzfKfo20fyfUOxZKS5jPiXuL8qLhx7f7TkKkRm3uJYOcxYjBT
	AFDexKUfOegSMK9iEh1N1cknGQiI7xVMq17F2iRe3SzQR6RBEHnCf8EK4JGYhvBtQnM2TzDCcMZ/p
	0Eh2jbCvhC5wCuDwFOJPZIuPQcCIj78zIn5yefj3xch5Ze1VLUNAgzwwy5gNKUyiWJYq0mNE8ZoJ/
	soKHURBA1ndCUvpB/bpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbP8g-00Ffcd-7z; Mon, 04 Apr 2022 16:01:10 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbP8R-00FfSx-49; Mon, 04 Apr 2022 16:00:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3756D6E;
 Mon,  4 Apr 2022 09:00:49 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 888053F73B;
 Mon,  4 Apr 2022 09:00:49 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:00:47 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: Re: [RESEND][PATCH 1/8] PM: EM: Add .get_cost() callback
Message-ID: <YksWL2cWQDXPCuKv@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321095729.20655-2-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090055_317528_E9ED3D4E 
X-CRM114-Status: GOOD (  28.18  )
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

On Monday 21 Mar 2022 at 09:57:22 (+0000), Lukasz Luba wrote:
> The Energy Model (EM) supports devices which report abstract power scale,
> not only real Watts. The primary goal for EM is to enable the Energy Aware
> Scheduler (EAS) for a given platform. Some of the platforms might not be
> able to deliver proper power values. The only information that they might
> have is the relative efficiency between CPU types.
> 
> Thus, it makes sense to remove some restrictions in the EM framework and
> introduce a mechanism which would support those platforms. What is crucial
> for EAS to operate is the 'cost' field in the EM. The 'cost' is calculated
> internally in EM framework based on knowledge from 'power' values.
> The 'cost' values must be strictly increasing. The existing API with its
> 'power' value size restrictions cannot guarantee that the 'cost' will meet
> this requirement.
> 
> Since the platform is missing this detailed information, but has only
> efficiency details, introduce a new custom callback in the EM framework.
> The new callback would allow to provide the 'cost' values which reflect
> efficiency of the CPUs. This would allow to provide EAS information which
> has different relation than what would be forced by the EM internal
> formulas calculating 'cost' values. Thanks to this new callback it is
> possible to create a system view for EAS which has no overlapping
> performance states across many Performance Domains.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  include/linux/energy_model.h | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
> index 9f3c400bc52d..0a3a5663177b 100644
> --- a/include/linux/energy_model.h
> +++ b/include/linux/energy_model.h
> @@ -114,9 +114,30 @@ struct em_data_callback {
>  	 */
>  	int (*active_power)(unsigned long *power, unsigned long *freq,
>  			    struct device *dev);
> +
> +	/**
> +	 * get_cost() - Provide the cost at the given performance state of
> +	 *		a device
> +	 * @dev		: Device for which we do this operation (can be a CPU)
> +	 * @freq	: Frequency at the performance state in kHz
> +	 * @cost	: The cost value for the performance state
> +	 *		(modified)
> +	 *
> +	 * In case of CPUs, the cost is the one of a single CPU in the domain.
> +	 * It is expected to fit in the [0, EM_MAX_POWER] range due to internal
> +	 * usage in EAS calculation.
> +	 *
> +	 * Return 0 on success, or appropriate error value in case of failure.
> +	 */
> +	int (*get_cost)(struct device *dev, unsigned long freq,
> +			unsigned long *cost);
>  };
> -#define EM_DATA_CB(_active_power_cb) { .active_power = &_active_power_cb }
>  #define EM_SET_ACTIVE_POWER_CB(em_cb, cb) ((em_cb).active_power = cb)
> +#define EM_ADV_DATA_CB(_active_power_cb, _cost_cb)	\
> +	{ .active_power = _active_power_cb,		\
> +	  .get_cost = _cost_cb }
> +#define EM_DATA_CB(_active_power_cb)			\
> +		EM_ADV_DATA_CB(_active_power_cb, NULL)
>  
>  struct em_perf_domain *em_cpu_get(int cpu);
>  struct em_perf_domain *em_pd_get(struct device *dev);
> @@ -264,6 +285,7 @@ static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
>  
>  #else
>  struct em_data_callback {};
> +#define EM_ADV_DATA_CB(_active_power_cb, _cost_cb) { }
>  #define EM_DATA_CB(_active_power_cb) { }
>  #define EM_SET_ACTIVE_POWER_CB(em_cb, cb) do { } while (0)
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
