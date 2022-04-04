Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D86C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Cl8HlFuyr0hABco9QEQWCbXYIhH5klUmBvn8Xv5IHc=; b=XvparLGwgScXWM
	RhMvA8YhqEBVrni4UAal6B+Ncnvxs3PkNaf7rzLnl1vGLyLP5fYFZ4HvToTRkgYEm1h7akg0XrAT8
	CMYw4yJ5YmxzN0HW7xTw611iel5xJrmM8seO1glTBBEOq/PGG7IKbuRDOlSjX8T5Wx8BLeoEzFhVy
	KYb0si/kbSQdoDf/YvfhPjTSMQqmg+xL3e/vXBdBV1A9gwH90wEyiHDv0EFwDj/v/1NtwRRjT+atK
	Gme4bvOBTUGqEAHWgM9DdM2kNu7eCXnw9MzhY/tmlKLJIvW59/F+TlwBociduLRJGKTJlKEqFl97S
	CAOJBoL/L0ioXVEY+5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPBn-00FhNe-24; Mon, 04 Apr 2022 16:04:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbP9u-00FgKF-4t; Mon, 04 Apr 2022 16:02:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44BFFD6E;
 Mon,  4 Apr 2022 09:02:25 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DED9D3F73B;
 Mon,  4 Apr 2022 09:02:24 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:02:23 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: Re: [RESEND][PATCH 5/8] PM: EM: Remove old debugfs files and print
 all 'flags'
Message-ID: <YksWj8GhZWUimF74@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-6-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321095729.20655-6-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090226_366186_1B91D570 
X-CRM114-Status: GOOD (  20.07  )
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

IMO the debugfs files were fine as they were:
 - They offered information on units and inefficiencies without having
   to dig into the code to see which bit is for which flag.
 - I believe the artificial EM power values fit under bogoWatts as unit,
   so that part would still be correct.

On the other hand, your new file offers more information: we'd be able
to see in debugfs whether we're dealing with an artificial EM, despite
needing a bit more looking over the code to understand the output.

I don't have a strong opinion and the code looks fine, so:

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>


On Monday 21 Mar 2022 at 09:57:26 (+0000), Lukasz Luba wrote:
> The Energy Model gets more bits used in 'flags'. Avoid adding another
> debugfs file just to print what is the status of a new flag. Simply
> remove old debugfs files and add one generic which prints all flags
> as a hex value.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  kernel/power/energy_model.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index babefc72085d..092513575e4e 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -54,28 +54,15 @@ static int em_debug_cpus_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(em_debug_cpus);
>  
> -static int em_debug_units_show(struct seq_file *s, void *unused)
> +static int em_debug_flags_show(struct seq_file *s, void *unused)
>  {
>  	struct em_perf_domain *pd = s->private;
> -	char *units = (pd->flags & EM_PERF_DOMAIN_MILLIWATTS) ?
> -		"milliWatts" : "bogoWatts";
>  
> -	seq_printf(s, "%s\n", units);
> +	seq_printf(s, "%#lx\n", pd->flags);
>  
>  	return 0;
>  }
> -DEFINE_SHOW_ATTRIBUTE(em_debug_units);
> -
> -static int em_debug_skip_inefficiencies_show(struct seq_file *s, void *unused)
> -{
> -	struct em_perf_domain *pd = s->private;
> -	int enabled = (pd->flags & EM_PERF_DOMAIN_SKIP_INEFFICIENCIES) ? 1 : 0;
> -
> -	seq_printf(s, "%d\n", enabled);
> -
> -	return 0;
> -}
> -DEFINE_SHOW_ATTRIBUTE(em_debug_skip_inefficiencies);
> +DEFINE_SHOW_ATTRIBUTE(em_debug_flags);
>  
>  static void em_debug_create_pd(struct device *dev)
>  {
> @@ -89,9 +76,8 @@ static void em_debug_create_pd(struct device *dev)
>  		debugfs_create_file("cpus", 0444, d, dev->em_pd->cpus,
>  				    &em_debug_cpus_fops);
>  
> -	debugfs_create_file("units", 0444, d, dev->em_pd, &em_debug_units_fops);
> -	debugfs_create_file("skip-inefficiencies", 0444, d, dev->em_pd,
> -			    &em_debug_skip_inefficiencies_fops);
> +	debugfs_create_file("flags", 0444, d, dev->em_pd,
> +			    &em_debug_flags_fops);
>  
>  	/* Create a sub-directory for each performance state */
>  	for (i = 0; i < dev->em_pd->nr_perf_states; i++)
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
