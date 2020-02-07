Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF57C04EB5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 16:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74BF2214AF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 16:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SqYzYhk/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74BF2214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c/9cXm9F1Sh63rgdVPxC5v6Fw7gosyMuxv4R54DA7WA=; b=SqYzYhk/BKx8kc7S1daVx63tb
	J8N5mnrGAQZgFvYI/jDJCY8YiWccSVjj5gQgU158GThlkt9K8NetS0ZMbAWuDtNirgAjLbO0CgwEN
	tAeH6Qqr4aB6ifK/e7rQf8ekInaDqbEnC33MaZop3vjyteVJsEV6L6tiq/gdFUaSKeleExUXbcQSg
	FQkxykdNgg5PK7DTH5ELoed+/2bNLvvasUSfSDLBIJtXzJF1WRct+3wOiKKbDlpKa7lnVN+PYGfQQ
	KJqUZ1tdMOtV7SVCZCsKU3A/pXTlI+OW9yxRAc++0Itz5c7Q302/yFjCy5WVgkwxS8xuJqQ8GeDM0
	H2VplispQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j063E-0005qs-Iz; Fri, 07 Feb 2020 16:00:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j062u-0004Ti-IF; Fri, 07 Feb 2020 15:59:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582151FB;
 Fri,  7 Feb 2020 07:59:54 -0800 (PST)
Received: from [10.37.12.229] (unknown [10.37.12.229])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FC4D3F68E;
 Fri,  7 Feb 2020 07:59:43 -0800 (PST)
Subject: Re: [PATCH v2 1/4] PM / EM: add devices to Energy Model
To: Quentin Perret <qperret@google.com>
References: <20200206134640.11367-1-lukasz.luba@arm.com>
 <20200206134640.11367-2-lukasz.luba@arm.com>
 <20200207120430.GA242912@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <8599944e-160b-c9a9-7cb9-1b88b09c675b@arm.com>
Date: Fri, 7 Feb 2020 15:59:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200207120430.GA242912@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_075956_684374_46806DE0 
X-CRM114-Status: GOOD (  30.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Quentin,


Thank you for the review, please find my comments below.

On 2/7/20 12:04 PM, Quentin Perret wrote:
> On Thursday 06 Feb 2020 at 13:46:37 (+0000), lukasz.luba@arm.com wrote:
>>   2. Core APIs
>> @@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
>>   Drivers are expected to register performance domains into the EM framework by
>>   calling the following API::
>>   
>> -  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
>> -			      struct em_data_callback *cb);
>> +  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
>> +		struct em_data_callback *cb, cpumask_t *cpus);
>>   
>> -Drivers must specify the CPUs of the performance domains using the cpumask
>> +Drivers must specify the device pointer of the performance domains as first
> 
> I find this sentence a little odd no?

Agree, this needs to be redefined.

> 
>>   argument, and provide a callback function returning <frequency, power> tuples
>> -for each capacity state. The callback function provided by the driver is free
>> +for each performance state. The callback function provided by the driver is free
>>   to fetch data from any relevant location (DT, firmware, ...), and by any mean
>> -deemed necessary. See Section 3. for an example of driver implementing this
>> +deemed necessary. For other devices than CPUs the last argumant must be set to
> 
> s/argumant/argument

true

> 
>> +NULL. Only for CPUfreq drivers it is obligatory to specify the cpumask.
> 
> Please note that as of today nothing mandates the caller to be a CPUFreq
> driver -- it could be anything in theory. I'd say 'only for CPU devices'
> instead.

Good point, I will change it into 'only for CPU devices'.

> 
> <snip>
>> @@ -24,51 +27,65 @@ struct em_cap_state {
>>   
>>   /**
>>    * em_perf_domain - Performance domain
>> - * @table:		List of capacity states, in ascending order
>> - * @nr_cap_states:	Number of capacity states
>> - * @cpus:		Cpumask covering the CPUs of the domain
>> + * @table:		List of performance states, in ascending order
>> + * @nr_perf_states:	Number of performance states
>> + * @priv:		In case of EM for CPU device it is a Cpumask
>> + *			covering the CPUs of the domain
> 
> Could you turn @priv back into 'unsigned long priv[0];' and keep the
> allocation as it is today ? That is, append the cpumask to the struct.
> 
> This empty pointer for non-CPU devices is just wasted space, and pointer
> chasing isn't good for your caches. Given that you pre-allocate the pd
> in em_create_pd() you could just have a special case for CPUs there I
> suppose. And _is_cpu_em() will have to check the bus like you did in v1.

OK, I will change it to 'unsigned long priv[0];'. The argument of stall 
because of missing cpumask when we probably already missed for 'em_pd'
in the scheduler code, is good for me.

> 
>>    *
>> - * A "performance domain" represents a group of CPUs whose performance is
>> - * scaled together. All CPUs of a performance domain must have the same
>> - * micro-architecture. Performance domains often have a 1-to-1 mapping with
>> - * CPUFreq policies.
>> + * In case of CPU device, a "performance domain" represents a group of CPUs
>> + * whose performance is scaled together. All CPUs of a performance domain
>> + * must have the same micro-architecture. Performance domains often have
>> + * a 1-to-1 mapping with CPUFreq policies.
>> + * In case of other devices the 'priv' field is unused.
>>    */
>>   struct em_perf_domain {
>> -	struct em_cap_state *table;
>> -	int nr_cap_states;
>> -	unsigned long cpus[0];
>> +	struct em_perf_state *table;
>> +	int nr_perf_states;
>> +	void *priv;
>>   };
> 
> <snip>
>>   struct em_data_callback {
>>   	/**
>> -	 * active_power() - Provide power at the next capacity state of a CPU
>> -	 * @power	: Active power at the capacity state in mW (modified)
>> -	 * @freq	: Frequency at the capacity state in kHz (modified)
>> -	 * @cpu		: CPU for which we do this operation
>> +	 * active_power() - Provide power at the next performance state of a
>> +	 *		    device
>> +	 * @power	: Active power at the performance state in mW (modified)
>> +	 * @freq	: Frequency at the performance state in kHz (modified)
>> +	 * @dev		: Device for which we do this operation (can be a CPU)
>>   	 *
>> -	 * active_power() must find the lowest capacity state of 'cpu' above
>> +	 * active_power() must find the lowest performance state of 'dev' above
>>   	 * 'freq' and update 'power' and 'freq' to the matching active power
>>   	 * and frequency.
>>   	 *
>> -	 * The power is the one of a single CPU in the domain, expressed in
>> -	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
>> -	 * range.
>> +	 * In case of CPUs, the power is the one of a single CPU in the domain,
>> +	 * expressed in milli-watts. It is expected to fit in the
>> +	 * [0, EM_MAX_POWER] range.
>>   	 *
>>   	 * Return 0 on success.
>>   	 */
>> -	int (*active_power)(unsigned long *power, unsigned long *freq, int cpu);
>> +	int (*active_power)(unsigned long *power, unsigned long *freq,
>> +			    struct device *dev);
> 
> Given that you've made explicit in the doc of struct em_perf_state that
> 'power' can be a 'total' value (static + dynamic), this could be renamed
> I suppose.

I have check some literature and indeed 'active power' is not present,
but I could find 'active energy' and 'standby energy'. So we could
use 'active power' when we are talking in context of active energy.
In some other place I found 'Operating power (dynamic + leakage)' and
'Standby power' measurements for different architectures.

So I would prefer to keep 'active_power' which would mean the power
when a device was running (active).

> 
> <snip>
>>   /**
>>    * em_cpu_get() - Return the performance domain for a CPU
>>    * @cpu : CPU to find the performance domain for
>>    *
>> - * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
>> + * Returns the performance domain to which 'cpu' belongs, or NULL if it doesn't
>>    * exist.
>>    */
>>   struct em_perf_domain *em_cpu_get(int cpu)
>>   {
>> -	return READ_ONCE(per_cpu(em_data, cpu));
> 
> Since CPU perf domains are guaranteed to never go away, it'd be safe to
> keep that per-CPU variable and avoid the locking and list manipulation
> below. No strong opinion, though.

The functions em_cpu_get() and em_get_pd() are called only during
start phase (topology initialization or thermal setup). After that
these subsystems carry on with the returned pointer in their private
structures. So I would prefer to keep implementation clean and have all
EM structures in one list (avoiding the per-cpu).

> 
>> +	struct em_device *em_dev;
>> +
>> +	mutex_lock(&em_pd_mutex);
>> +
>> +	if (list_empty(&em_pd_dev_list))
>> +		goto unlock;
>> +
>> +	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
>> +		if (!_is_cpu_em(em_dev->em_pd))
>> +			continue;
>> +
>> +		if (cpumask_test_cpu(cpu, em_span_cpus(em_dev->em_pd))) {
>> +			mutex_unlock(&em_pd_mutex);
>> +			return em_dev->em_pd;
>> +		}
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&em_pd_mutex);
>> +	return NULL;
>>   }
>>   EXPORT_SYMBOL_GPL(em_cpu_get);
> 
> <snip>
>>   /**
>> - * em_register_perf_domain() - Register the Energy Model of a performance domain
>> - * @span	: Mask of CPUs in the performance domain
>> - * @nr_states	: Number of capacity states to register
>> + * em_register_perf_domain() - Register the Energy Model (EM) of a performance
>> + *		domain for the device
>> + * @dev		: Device for which the EM is to register
>> + * @nr_states	: Number of performance states to register
>>    * @cb		: Callback functions providing the data of the Energy Model
>> + * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
>> + *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
> 
> It should be policy->related_cpus actually (or 'real_cpus' even) -- PM_EM
> ignores hotplug ATM. Perhaps we should document that somewhere ...

I also had this feeling until I have checked the cpufreq_online().
In that function after a call to driver's init function, the
'related_cpus' is set, not before (based on policy->cpus).
So I think it is safe to say 'policy->cpus' here.

https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1344

> 
>> + *		type of devices this should be set to NULL.
>>    *
>>    * Create Energy Model tables for a performance domain using the callbacks
>>    * defined in cb.
>> @@ -196,63 +361,129 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
> 
> Thanks,
> Quentin
> 

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
