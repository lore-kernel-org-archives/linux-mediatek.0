Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4457AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxykADAaA/51/gn9YXlQ8yd6NEvpk0uoPMBAfXb104I=; b=nvdt+R61yFcwTo
	ROObdKK8yqehxBoPJXe58nu2YzakoJYHFuIL1xmuer8+CvXlUmOArwwmLVVK9dMj2s85ipSy6R+hw
	f+jVwnpAB2JVnzPKmdfF8ynl9KTgOIWJBZY8RV86iMssS7uzpJsvOPvnYVERHHzIPcXkw8z98NAg7
	R7LQUlPvJJ8diGoybWCAxXE/tjXi61fB4btYpaMJsQ33HfuI1bsUIdCbKC3LtfzcogUquHD7ZtmPO
	ZZFHpuzKFyVm992ZBstewjw3GGFo4Sb1zZgMsG+xlDcXak2QvnYKWu73VYSTgQ2vP2IjAHedvhq/7
	dwwRvnNaEE6GGgHRz9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPCT-00FhjZ-Pj; Mon, 04 Apr 2022 16:05:05 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPAF-00FgXe-0Z; Mon, 04 Apr 2022 16:02:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D8B6D6E;
 Mon,  4 Apr 2022 09:02:46 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7E173F73B;
 Mon,  4 Apr 2022 09:02:45 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:02:44 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: Re: [RESEND][PATCH 6/8] Documentation: EM: Add artificial EM
 registration description
Message-ID: <YksWpIoGa4rbW/XG@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-7-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321095729.20655-7-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090247_131963_EA689021 
X-CRM114-Status: GOOD (  19.22  )
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

Thanks for documenting this as well.

On Monday 21 Mar 2022 at 09:57:27 (+0000), Lukasz Luba wrote:
> Add description about new artificial EM registration and use cases.
> Update also the documentation with the new .get_cost() callback
> description and usage.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  Documentation/power/energy-model.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
> index fd29ed2506c0..feb257b7f350 100644
> --- a/Documentation/power/energy-model.rst
> +++ b/Documentation/power/energy-model.rst
> @@ -123,6 +123,26 @@ allows a platform to register EM power values which are reflecting total power
>  (static + dynamic). These power values might be coming directly from
>  experiments and measurements.
>  
> +Registration of 'artificial' EM
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +There is an option to provide a custom callback for drivers missing detailed
> +knowledge about power value for each performance state. The callback
> +.get_cost() is optional and provides the 'cost' values used by the EAS.
> +This is useful for platforms that only provide information on relative
> +efficiency between CPU types, where one could use the information to
> +create an abstract power model. But even an abstract power model can
> +sometimes be hard to fit in, given the input power value size restrictions.
> +The .get_cost() allows to provide the 'cost' values which reflect the
> +efficiency of the CPUs. This would allow to provide EAS information which
> +has different relation than what would be forced by the EM internal
> +formulas calculating 'cost' values. To register an EM for such platform, the
> +driver must set the flag 'milliwatts' to 0, provide .get_power() callback
> +and provide .get_cost() callback. The EM framework would handle such platform

Maybe it worth adding a note here that the power values provided with
.get_power() are only for information purposes and that they don't have
any functional use.

> +properly during registration. A flag EM_PERF_DOMAIN_ARTIFICIAL is set for such
> +platform. Special care should be taken by other frameworks which are using EM
> +to test and treat this flag properly.
> +
>  Registration of 'simple' EM
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
