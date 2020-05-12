Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161CEC54E8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 11:39:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98A920722
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 11:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ILHWBpzQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D98A920722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eXnMOK377N8Vzu0uMtez5Oj/r5KFbtWFOhshAM25lQg=; b=ILHWBpzQVvNe4rrkHOhWCur7E
	Co9bcpBW8D6ukxl1fg9O5MGpSLX+CP933wIX1SyYS3TkX+sWSdGvpJV7Gv3jtunBCXAHxXD5CeT/V
	UygCZUgIBgCgi5lSGWXS2Br/HUxht1tn/5d26S5MB4ta8L8ZgSqknrjrHfT4Vvhy6i3O8QlAjEjM4
	p+k7zuvJNCfFiRPR18yW/KtnIrf0WuUT8PwHhK8uvJjcTPPok3StdZ9++7PvcS231hw3hqCE5vUEE
	mBgSMoC+zq3/NLBzjj3YrhWRrnKS7r4OIgBOlfEs8mBDq8+2KvZ6jqey2z23yq8cfEyvQpZPyhrJO
	4SoS705eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYTFa-0000K6-Qz; Tue, 12 May 2020 11:39:06 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYTFR-0000Br-TZ; Tue, 12 May 2020 11:38:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D48E30E;
 Tue, 12 May 2020 04:38:52 -0700 (PDT)
Received: from [10.37.12.83] (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9103F71E;
 Tue, 12 May 2020 04:38:42 -0700 (PDT)
Subject: Re: [PATCH v7 04/15] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Quentin Perret <qperret@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-5-lukasz.luba@arm.com>
 <20200511134319.GA29112@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <270f3e37-8de8-2841-dca3-8d70089f7317@arm.com>
Date: Tue, 12 May 2020 12:38:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200511134319.GA29112@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_043858_044458_09355A08 
X-CRM114-Status: GOOD (  23.60  )
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 5/11/20 2:43 PM, Quentin Perret wrote:
> Hey Lukasz,
> 
> On Monday 11 May 2020 at 12:19:01 (+0100), Lukasz Luba wrote:
> <snip>
>> @@ -27,12 +29,15 @@ struct em_perf_state {
>>    * em_perf_domain - Performance domain
>>    * @table:		List of performance states, in ascending order
>>    * @nr_perf_states:	Number of performance states
>> - * @cpus:		Cpumask covering the CPUs of the domain
>> + * @cpus:		Cpumask covering the CPUs of the domain. It's here
>> + *			for performance reasons to avoid potential cache
>> + *			misses during energy calculations in the scheduler
> 
> And because that saves a pointer, and simplifies allocating/freeing that
> memory region :)

True, I will add this also:
'and simplifies allocating/freeing that memory region'

> 
> <snip>
>> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
>> index 5b8a1566526a..9cc7f2973600 100644
>> --- a/kernel/power/energy_model.c
>> +++ b/kernel/power/energy_model.c
>> @@ -2,8 +2,9 @@
>>   /*
>>    * Energy Model of CPUs
> 
> Should this comment change too?

Yes, indeed. I will adjust it.

> 
> <snip>
>> -static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
>> +static void em_debug_create_pd(struct device *dev)
>>   {
>>   	struct dentry *d;
>> -	char name[8];
>>   	int i;
>>   
>> -	snprintf(name, sizeof(name), "pd%d", cpu);
>> -
>>   	/* Create the directory of the performance domain */
>> -	d = debugfs_create_dir(name, rootdir);
>> +	d = debugfs_create_dir(dev_name(dev), rootdir);
> 
> So what will be the name for the perf domain of CPUs now? cpuX?

yeap, it will be 'cpu0', 'cpu4', etc...

> 
> <snip>
>> @@ -142,8 +149,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
>>   		 */
>>   		opp_eff = freq / power;
>>   		if (opp_eff >= prev_opp_eff)
>> -			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
>> -					cpu, i, i - 1);
>> +			dev_dbg(dev, "EM: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
>> +					i, i - 1);
> 
> It feels like changing from warn to debug doesn't really belong to this
> patch no?

I thought that these prints are not worth to introduce another patch.
This warning is a bit tricky, because we (SW eng) basically are not able
to tweak OPPs, we can only remove them to calm down this warning.

There are platforms, with dozen of OPPs, seeing this. Warnings triggers 
the automated tests scripts, which are sensitive to dmesg log level and
cause developers to spent time and investigate the issue.

Then, what if these OPPs are needed because the thermal was tested OK
with some OPPs which unfortunately are triggering also this warning.
They cannot remove these OPPS, but the warning would stay. We might see
this also for GPUs.

I decided to change it into dbg, due to the reason above.

> 
> <snip>
>> @@ -216,47 +274,50 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>>   	 */
>>   	mutex_lock(&em_pd_mutex);
>>   
>> -	for_each_cpu(cpu, span) {
>> -		/* Make sure we don't register again an existing domain. */
>> -		if (READ_ONCE(per_cpu(em_data, cpu))) {
>> -			ret = -EEXIST;
>> -			goto unlock;
>> -		}
>> +	if (dev->em_pd) {
>> +		ret = -EEXIST;
>> +		goto unlock;
>> +	}
>>   
>> -		/*
>> -		 * All CPUs of a domain must have the same micro-architecture
>> -		 * since they all share the same table.
>> -		 */
>> -		cap = arch_scale_cpu_capacity(cpu);
>> -		if (prev_cap && prev_cap != cap) {
>> -			pr_err("CPUs of %*pbl must have the same capacity\n",
>> -							cpumask_pr_args(span));
>> +	if (_is_cpu_device(dev)) {
> 
> Something like
> 
> 	if (!_is_cpu_device(dev))
> 		goto device;
> 
> would limit the diff a bit, but that may just be personal taste.

Possible

> 
> But appart from these nits, the patch LGTM.

Thank you for the review.

I will wait for Daniel's (because he suggested the em_pd inside
device struct) comments and if there is no other issues I will just
resend the patch with adjusted comment fields in response.

Regards,
Lukasz

> 
> Thanks,
> Quentin
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
