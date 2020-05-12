Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEB7C54E4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 11:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C9AA206CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 11:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JVu4ZSOV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C9AA206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mVIBOJrpbu+Z6Nppmh0k1HqGh5DP34DHr+NxTSo4/KY=; b=JVu4ZSOVfz+0bSh8kqGXHazVg
	spHm+LnQZ6PBDmkp0H6bCcc5lmO3ZjspGvq5BkVYng3mP2Kc8cOejvzOjvXb1496AIM3itAtD34qs
	fIo8aiUgU9s+Yar/2vdrnuZ5GU3ri6/Q+DRuTRWoPRLe7asNLkHlBoO2WkNFFOmfY2vJuBjNtJKQI
	dHLgevt1v705RNPeDj9bZZWWGLSxpb9Ixfilv8jB+jAuo+6Ra1UftjdPvHa52VMdhmRWaIkDn452m
	ndpI2zfZZQBQypnkW+X0HDnpbbNL+VDeDX0FwshmQ2ctadP408I4eYo67svkE4ORJkBqVcUE84W8o
	wGgNdeOug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYSoq-0007No-5z; Tue, 12 May 2020 11:11:28 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYSoh-0007FC-GJ; Tue, 12 May 2020 11:11:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E0930E;
 Tue, 12 May 2020 04:11:18 -0700 (PDT)
Received: from [10.37.12.83] (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB2703F71E;
 Tue, 12 May 2020 04:11:08 -0700 (PDT)
Subject: Re: [PATCH v7 03/15] PM / EM: update callback structure and add
 device pointer
To: Quentin Perret <qperret@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-4-lukasz.luba@arm.com>
 <20200511115722.GA13741@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <a2c20b82-58e3-a2ef-2d8d-edbaf05277ec@arm.com>
Date: Tue, 12 May 2020 12:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200511115722.GA13741@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_041119_585938_150368EE 
X-CRM114-Status: GOOD (  16.73  )
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

Hi Quentin,

On 5/11/20 12:57 PM, Quentin Perret wrote:
> On Monday 11 May 2020 at 12:19:00 (+0100), Lukasz Luba wrote:
>> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
>> index 61623e2ff149..11ee24e06d12 100644
>> --- a/drivers/cpufreq/scmi-cpufreq.c
>> +++ b/drivers/cpufreq/scmi-cpufreq.c
>> @@ -103,17 +103,12 @@ scmi_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
>>   }
>>   
>>   static int __maybe_unused
>> -scmi_get_cpu_power(unsigned long *power, unsigned long *KHz, int cpu)
>> +scmi_get_cpu_power(unsigned long *power, unsigned long *KHz,
>> +		   struct device *cpu_dev)
>>   {
>> -	struct device *cpu_dev = get_cpu_device(cpu);
>>   	unsigned long Hz;
>>   	int ret, domain;
>>   
>> -	if (!cpu_dev) {
>> -		pr_err("failed to get cpu%d device\n", cpu);
>> -		return -ENODEV;
>> -	}
>> -
>>   	domain = handle->perf_ops->device_domain_id(cpu_dev);
>>   	if (domain < 0)
>>   		return domain;
>> @@ -200,7 +195,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>>   
>>   	policy->fast_switch_possible = true;
>>   
>> -	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
> 
> So this one has no users after this patch right? I suppose you could
> squash patch 05 in this one. But no big deal.

Yes, it was tricky to me to decide the splits suggested by Daniel and
this is the example. I had to introduce the em_dev_register_perf_domain
and make clients of it before I remove the old em_register_perf_domain
completely. I agree it could also go with the patch 5, but it does not
harm to be here.

> 
> Acked-by: Quentin Perret <qperret@google.com>

Thank you for this ACKs and the earlier.

Regards,
Lukasz

> 
>> +	em_dev_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
>>   
>>   	return 0;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
