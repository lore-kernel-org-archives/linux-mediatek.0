Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FB7C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 14:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4851522464
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 14:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFgRRTDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4851522464
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jM/tJHw4gY8/oftowDX7gQF9zxgJwBJrz0ynADocvbA=; b=gFgRRTDjPDus6o9jaw/4h5o52
	QRmqjtugyGKxOKDU105mWHLJ3b0dC6lQWoWPJW97iLEA3+QzpCMJwelDRm3+nLY5uidWamGTClQmg
	LY3sMjzktaltlwuuIsXekL7ZbI/MqE6weYjzD2yRMqyimLMiBZ/pzQ5+MGOXtbquOOj26UVBw38CO
	00EqeUKw60k1orxBlvOYlBogC06BkzG8BV1eSqdGm4IMJvvT+yMiLrg4pMQlegNy5uu4VNcXtNkye
	xoWlD1k2KwvrOeX3cVz86ROfsOtibtg+jtqGnO1/jw+rfK7IAdONd78h8hUlyzM5KMOK3yi0usn8i
	WguEPtUYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itYPv-0005Ad-M8; Mon, 20 Jan 2020 14:52:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itYPe-000500-K5; Mon, 20 Jan 2020 14:52:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2545930E;
 Mon, 20 Jan 2020 06:52:20 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D71C33F52E;
 Mon, 20 Jan 2020 06:52:09 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Quentin Perret <qperret@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
Date: Mon, 20 Jan 2020 14:52:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200117105437.GA211774@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_065222_747034_30382638 
X-CRM114-Status: GOOD (  22.40  )
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
 peterz@infradead.org, viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, vincent.guittot@linaro.org,
 khilman@kernel.org, agross@kernel.org, b.zolnierkie@samsung.com,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com,
 linux-imx@nxp.com, rui.zhang@intel.com, kernel-team@android.com,
 mgorman@suse.de, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Quentin,

On 1/17/20 10:54 AM, Quentin Perret wrote:
> Hey Lukasz,
> 
> Still reading through this, but with small changes, this looks pretty
> good to me.
> 
> On Thursday 16 Jan 2020 at 15:20:29 (+0000), lukasz.luba@arm.com wrote:
>> +int em_register_perf_domain(struct device *dev, unsigned int nr_states,
>> +			struct em_data_callback *cb)
>>   {
>>   	unsigned long cap, prev_cap = 0;
>>   	struct em_perf_domain *pd;
>> -	int cpu, ret = 0;
>> +	struct em_device *em_dev;
>> +	cpumask_t *span = NULL;
>> +	int cpu, ret;
>>   
>> -	if (!span || !nr_states || !cb)
>> +	if (!dev || !nr_states || !cb || !cb->active_power)
> 
> Nit: you check !cb->active_power in em_create_pd() too I think, so only
> one of the two is needed.

good point, thanks

> 
>>   		return -EINVAL;
>>   
>> -	/*
>> -	 * Use a mutex to serialize the registration of performance domains and
>> -	 * let the driver-defined callback functions sleep.
>> -	 */
>>   	mutex_lock(&em_pd_mutex);
>>   
>> -	for_each_cpu(cpu, span) {
>> -		/* Make sure we don't register again an existing domain. */
>> -		if (READ_ONCE(per_cpu(em_data, cpu))) {
>> +	if (_is_cpu_device(dev)) {
>> +		span = kzalloc(cpumask_size(), GFP_KERNEL);
>> +		if (!span) {
>> +			mutex_unlock(&em_pd_mutex);
>> +			return -ENOMEM;
>> +		}
>> +
>> +		ret = dev_pm_opp_get_sharing_cpus(dev, span);
>> +		if (ret)
>> +			goto free_cpumask;
> 
> That I think should be changed. This creates some dependency on PM_OPP
> for the EM framework. And in fact, the reason we came up with PM_EM was
> precisely to not depend on PM_OPP which was deemed too Arm-specific.
> 
> Suggested alternative: have two registration functions like so:
> 
> 	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
> 			       struct em_data_callback *cb);
> 	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
> 			       struct em_data_callback *cb);

Interesting, in the internal review Dietmar asked me to remove these two
functions. I had the same idea, which would simplify a bit the
registration and it does not need to check the dev->bus if it is CPU.

Unfortunately, we would need also two function in drivers/opp/of.c:
dev_pm_opp_of_register_cpu_em(policy->cpus);
and
dev_pm_opp_of_register_dev_em(dev);

Thus, I have created only one registration function, which you can see
in this patch set.

What do you think Dietmar?

> 
> where em_register_cpu_pd() does the CPU-specific work and then calls
> em_register_dev_pd() (instead of having that big if (_is_cpu_device(dev))
> as you currently have). Would that work ?

Yes, I think you made a good point with this OPP dependency, which we
could avoid when we implement these two registration functions.

> 
> Another possibility would be to query CPUFreq instead of PM_OPP to get
> the mask, but I'd need to look again at the driver registration path in
> CPUFreq to see if the policy masks have been populated when we enter
> PM_EM ... I am not sure if this is the case, but it's worth having a
> look too.

The policy mask is populated, our registration function is called at
the end of the init code of CPUfreq drivers. I will check this option.

> 
> Thanks,
> Quentin
> 

Thank you for your comments.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
