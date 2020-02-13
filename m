Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAF9C2BA83
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 11:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0922073C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 11:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SuQik2Bs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF0922073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdVs5HRrx9uVWQAkiDFOENqWIzobvxTvzXfLddRb7Tw=; b=SuQik2Bs9TQLwi
	ui81g4VOT9jgkZZz4F1U558eT13SMTzQhYjeHdyc4eqLEu0WTJY+cite8EEOEW+g9JsfFEh2FE+dj
	LDIPbr5KeeuVWFBT9qgzJKuV8UqYiFfg8zxYfut5pj1X1BTbs2lulR9Do75Vmea1WQr5a2C77kG5a
	FTAMFf5eh8DbBNuVK/Uy1DCDCiNyYRJst8lbe2XWeVnbO6TqUpEIO5LPH6+GeyabC+G7vkkDkTD3Z
	DCL0RPU7i5/pUXDhdqd1IOnAWRmwAN03/D9JXwK4xitS12iljs9E+GjA9tEFsXhfAawlLO+b0CvbR
	JM7RnZ934xzNQM6SadOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2CEH-00079o-QX; Thu, 13 Feb 2020 11:00:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2CE7-0006yI-PP; Thu, 13 Feb 2020 11:00:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46A8F1FB;
 Thu, 13 Feb 2020 03:00:07 -0800 (PST)
Received: from [192.168.0.7] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 875E83F6CF;
 Thu, 13 Feb 2020 03:00:00 -0800 (PST)
Subject: Re: [PATCH v2 1/4] PM / EM: add devices to Energy Model
To: lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200206134640.11367-1-lukasz.luba@arm.com>
 <20200206134640.11367-2-lukasz.luba@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <62a54ec9-0491-367d-0a36-7ea32c449acc@arm.com>
Date: Thu, 13 Feb 2020 11:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206134640.11367-2-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_030011_919158_3BB52FD2 
X-CRM114-Status: GOOD (  16.45  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Chris.Redpath@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, shawnguo@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/02/2020 14:46, lukasz.luba@arm.com wrote:
> From: Lukasz Luba <lukasz.luba@arm.com>

[..]

> @@ -26,7 +28,7 @@ framework, and interested clients reading the data from it::

s/::/: ?

>         | Thermal (IPA) |  | Scheduler (EAS) |  |     Other     |
>         +---------------+  +-----------------+  +---------------+
>                 |                   | em_pd_energy()    |
> -               |                   | em_cpu_get()      |
> +               |  em_get_pd()      | em_cpu_get()      |
>                 +---------+         |         +---------+

em_get_pd() and em_cpu_get()? Why not em_pd_get()? em_cpu_get() is a
specific em_get_pd(). right?

[...]

> @@ -85,13 +89,20 @@ API.
>  2.3 Accessing performance domains
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> +There is two API functions which provide the access to the energy model:
> +em_cpu_get() which takes CPU id as an argument and em_get_pd() with device
> +pointer as an argument. It depends on the subsystem which interface it is
> +going to use, but in case of CPU devices both functions return the same
> +performance domain.

There is probably a reason why we need this specific function for CPU
devices? The reason should be described. People might ask why
em_get_pd() is not sufficient.

[...]

> - * A "performance domain" represents a group of CPUs whose performance is
> - * scaled together. All CPUs of a performance domain must have the same
> - * micro-architecture. Performance domains often have a 1-to-1 mapping with
> - * CPUFreq policies.
> + * In case of CPU device, a "performance domain" represents a group of CPUs
> + * whose performance is scaled together. All CPUs of a performance domain
> + * must have the same micro-architecture. Performance domains often have
> + * a 1-to-1 mapping with CPUFreq policies.
> + * In case of other devices the 'priv' field is unused.
>   */
>  struct em_perf_domain {
> -	struct em_cap_state *table;
> -	int nr_cap_states;
> -	unsigned long cpus[0];
> +	struct em_perf_state *table;
> +	int nr_perf_states;
> +	void *priv;

In case you go back to the variable length field plus type field to
distingush EM devices, keep cpus[0] as the name.

[..]

>  /**
> - * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
> + * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf.
> +			domain

Why this change?

[...]

> @@ -141,12 +210,12 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
>  		 */
>  		opp_eff = freq / power;
>  		if (opp_eff >= prev_opp_eff)
> -			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_cap_state %d >= em_cap_state%d\n",
> -					cpu, i, i - 1);
> +			dev_warn(dev, "energy_model: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",

s/energy_model/EM ?

[...]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
