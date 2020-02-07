Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B45C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 12:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB23E20838
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 12:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUoofn0k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TSdbH1Ls"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB23E20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sm+MeJT4bfb719RfVDEHQJvSE0SFw2SIqbOrx9tlcEY=; b=eUoofn0k4M5cIx
	LWCMADJu3sPuhzxxYBwkFsw++ptfb1Wcavxi2V//1W9bbXnJ1tPdGBOt5TOdmpYwhexmVDVBczsQ/
	7/f6O+ZVC3LM3D8pI2D+Vdy5kbZI8csvXGt/n/wSP8Wfjaw/uBzjuxacOQS1x366G0v4DlriqkVdo
	Jw00FO9Eh3xXT7wKaMPhMXLNS7X+J1JygdoPm3iIjsbximjbbIwR2sS26Yj3il3tHW4i5GKhSnUzg
	txzdiAIcntHPmotLhfRyMtzJK16yf4ISvIVEDW8+lHRs7AF6rK8tPsKZP5c61wSENCi57sHS9tMpo
	d2mp99Yl6ssx9nIo79UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j02NI-0002Fo-Ik; Fri, 07 Feb 2020 12:04:44 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j02NF-0002EU-Ht
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 12:04:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id a9so2481981wmj.3
 for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2020 04:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R5h5Hhfr0C30ek8CnrJ517u633l7rUglq+J5+Ky2pSU=;
 b=TSdbH1Lsaj15vZh5emaVkjGWlxSCoTfeQeU3gLRTOwpLcnalRwRfArvK9g5tD84AOV
 WzchK0g1R/Nf9Yh7XJ7gZdrKTnE5132QPOMWe1IMFEW1YVOlkqSD6Xq/h4ebN0X5R1uF
 xgcBnxLit2Kbh011VO7HArzZ+pDTDnOJQNDegC5p9Ccon1asad7i++4EikadZCvIR67P
 F4kWIKeFyJtka5J2x1HDSTUR1ygNZKGeEVglBen++7LlgN7+Uo89775vErlaxUjeRIlh
 BbFXlo3pol7vA/SyXDgkEsk6a8HQehBiLNeUS7zEhsloDDmBcf0aVwezLGxLuJJLzy5L
 0U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R5h5Hhfr0C30ek8CnrJ517u633l7rUglq+J5+Ky2pSU=;
 b=F3Uz/CkPD2jaIqTgnGPJOfwh3onMbRFhVGHmwkIF0Xp3tGt4AZGZlXbL2+ZEWGSKgI
 Dm6/0+PAY+MjK4i7vQ6p0dN22VFQH6EJbNxd2T+INPld3fmw71I4MBTII2SZqDxxAuZL
 f5gXiE9ilBc/V0IIkgyHWtD61SD7r71qOeSp5wFnJxyaRoHSzfxE3nB4kpok3z3/iURe
 BTIbcx0ZiVKU+2vDxbYpsWPkrscd3nleN0W8MxxUG9sApwCdriPFECzA8tWJU3BhRTU6
 IrTSP0BNkosV3ET1Xl/sviEwaMXIkXrD3Cw+QjgQvSYlPE6K66fhnmBaAVrEFTe3Y0Hz
 vI9Q==
X-Gm-Message-State: APjAAAWRwAXNk6StTpAXVJ1cLC5meTd5ErwnX71URn98oh8/WsD4Oztp
 hA+mXneppeDOt8kwOl1f+Pc0gg==
X-Google-Smtp-Source: APXvYqwtC2bAQXniWiUc5oiGG0sJlgv9qLGg10xcRaZ8yTuXclNOUd0zGaxgEu16v3Q2wEfpyVEgZw==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr4060275wmg.86.1581077074857;
 Fri, 07 Feb 2020 04:04:34 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id e18sm3052153wrw.70.2020.02.07.04.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 04:04:33 -0800 (PST)
Date: Fri, 7 Feb 2020 12:04:30 +0000
From: Quentin Perret <qperret@google.com>
To: lukasz.luba@arm.com
Subject: Re: [PATCH v2 1/4] PM / EM: add devices to Energy Model
Message-ID: <20200207120430.GA242912@google.com>
References: <20200206134640.11367-1-lukasz.luba@arm.com>
 <20200206134640.11367-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206134640.11367-2-lukasz.luba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_040441_595779_7BCF6154 
X-CRM114-Status: GOOD (  26.08  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 bsegall@google.com, alyssa.rosenzweig@collabora.com, festevam@gmail.com,
 Morten.Rasmussen@arm.com, robh@kernel.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, daniel@ffwll.ch,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thursday 06 Feb 2020 at 13:46:37 (+0000), lukasz.luba@arm.com wrote:
>  2. Core APIs
> @@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
>  Drivers are expected to register performance domains into the EM framework by
>  calling the following API::
>  
> -  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
> -			      struct em_data_callback *cb);
> +  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
> +		struct em_data_callback *cb, cpumask_t *cpus);
>  
> -Drivers must specify the CPUs of the performance domains using the cpumask
> +Drivers must specify the device pointer of the performance domains as first

I find this sentence a little odd no?

>  argument, and provide a callback function returning <frequency, power> tuples
> -for each capacity state. The callback function provided by the driver is free
> +for each performance state. The callback function provided by the driver is free
>  to fetch data from any relevant location (DT, firmware, ...), and by any mean
> -deemed necessary. See Section 3. for an example of driver implementing this
> +deemed necessary. For other devices than CPUs the last argumant must be set to

s/argumant/argument

> +NULL. Only for CPUfreq drivers it is obligatory to specify the cpumask.

Please note that as of today nothing mandates the caller to be a CPUFreq
driver -- it could be anything in theory. I'd say 'only for CPU devices'
instead.

<snip>
> @@ -24,51 +27,65 @@ struct em_cap_state {
>  
>  /**
>   * em_perf_domain - Performance domain
> - * @table:		List of capacity states, in ascending order
> - * @nr_cap_states:	Number of capacity states
> - * @cpus:		Cpumask covering the CPUs of the domain
> + * @table:		List of performance states, in ascending order
> + * @nr_perf_states:	Number of performance states
> + * @priv:		In case of EM for CPU device it is a Cpumask
> + *			covering the CPUs of the domain

Could you turn @priv back into 'unsigned long priv[0];' and keep the
allocation as it is today ? That is, append the cpumask to the struct.

This empty pointer for non-CPU devices is just wasted space, and pointer
chasing isn't good for your caches. Given that you pre-allocate the pd
in em_create_pd() you could just have a special case for CPUs there I
suppose. And _is_cpu_em() will have to check the bus like you did in v1.

>   *
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
>  };

<snip>
>  struct em_data_callback {
>  	/**
> -	 * active_power() - Provide power at the next capacity state of a CPU
> -	 * @power	: Active power at the capacity state in mW (modified)
> -	 * @freq	: Frequency at the capacity state in kHz (modified)
> -	 * @cpu		: CPU for which we do this operation
> +	 * active_power() - Provide power at the next performance state of a
> +	 *		    device
> +	 * @power	: Active power at the performance state in mW (modified)
> +	 * @freq	: Frequency at the performance state in kHz (modified)
> +	 * @dev		: Device for which we do this operation (can be a CPU)
>  	 *
> -	 * active_power() must find the lowest capacity state of 'cpu' above
> +	 * active_power() must find the lowest performance state of 'dev' above
>  	 * 'freq' and update 'power' and 'freq' to the matching active power
>  	 * and frequency.
>  	 *
> -	 * The power is the one of a single CPU in the domain, expressed in
> -	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
> -	 * range.
> +	 * In case of CPUs, the power is the one of a single CPU in the domain,
> +	 * expressed in milli-watts. It is expected to fit in the
> +	 * [0, EM_MAX_POWER] range.
>  	 *
>  	 * Return 0 on success.
>  	 */
> -	int (*active_power)(unsigned long *power, unsigned long *freq, int cpu);
> +	int (*active_power)(unsigned long *power, unsigned long *freq,
> +			    struct device *dev);

Given that you've made explicit in the doc of struct em_perf_state that
'power' can be a 'total' value (static + dynamic), this could be renamed
I suppose.

<snip>
>  /**
>   * em_cpu_get() - Return the performance domain for a CPU
>   * @cpu : CPU to find the performance domain for
>   *
> - * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
> + * Returns the performance domain to which 'cpu' belongs, or NULL if it doesn't
>   * exist.
>   */
>  struct em_perf_domain *em_cpu_get(int cpu)
>  {
> -	return READ_ONCE(per_cpu(em_data, cpu));

Since CPU perf domains are guaranteed to never go away, it'd be safe to
keep that per-CPU variable and avoid the locking and list manipulation
below. No strong opinion, though.

> +	struct em_device *em_dev;
> +
> +	mutex_lock(&em_pd_mutex);
> +
> +	if (list_empty(&em_pd_dev_list))
> +		goto unlock;
> +
> +	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
> +		if (!_is_cpu_em(em_dev->em_pd))
> +			continue;
> +
> +		if (cpumask_test_cpu(cpu, em_span_cpus(em_dev->em_pd))) {
> +			mutex_unlock(&em_pd_mutex);
> +			return em_dev->em_pd;
> +		}
> +	}
> +
> +unlock:
> +	mutex_unlock(&em_pd_mutex);
> +	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(em_cpu_get);

<snip>
>  /**
> - * em_register_perf_domain() - Register the Energy Model of a performance domain
> - * @span	: Mask of CPUs in the performance domain
> - * @nr_states	: Number of capacity states to register
> + * em_register_perf_domain() - Register the Energy Model (EM) of a performance
> + *		domain for the device
> + * @dev		: Device for which the EM is to register
> + * @nr_states	: Number of performance states to register
>   * @cb		: Callback functions providing the data of the Energy Model
> + * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
> + *		obligatory. It can be taken from i.e. 'policy->cpus'. For other

It should be policy->related_cpus actually (or 'real_cpus' even) -- PM_EM
ignores hotplug ATM. Perhaps we should document that somewhere ...

> + *		type of devices this should be set to NULL.
>   *
>   * Create Energy Model tables for a performance domain using the callbacks
>   * defined in cb.
> @@ -196,63 +361,129 @@ EXPORT_SYMBOL_GPL(em_cpu_get);

Thanks,
Quentin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
