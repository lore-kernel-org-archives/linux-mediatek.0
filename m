Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xfiidjci5Bqo10omOm3fwYk+jf1ivHoEf8J81WvL/Rw=; b=D+4P8HD58OhtPc
	dRUgPySRXUZOp5PMUFnihFQVx+TTMvOAoJN840Bxmem/a92IRCTtRg6Tf8C11p1QIwcXLfDvpxqVG
	woIiRKVL7/EstKYZG7VjyyRZ+4ZnW5+qaf3U1KRyUcA4fkFfC132zmFKGx9Pj7NZC1FfUpF2UFQYp
	MxKZOLzdM0nDI/EAx87LWRrpInjomUl/L1zrKd8XhXFdQKWlzZH+3HdFN3Cr6c3LC4RlWH1cf5mbL
	suQs0Xs7384HEQkwGi3leaq0xad22LBAIxM5EraBEkTWKiXl9ZMoFNrNonasy7TBGYqx7QEDeqBvf
	uexlZXFfEng8p/Dyg3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ5Tt-00BDNO-1o; Tue, 29 Mar 2022 06:37:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ5Tg-00BDL0-It; Tue, 29 Mar 2022 06:37:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF9223A;
 Mon, 28 Mar 2022 23:37:13 -0700 (PDT)
Received: from [10.57.7.161] (unknown [10.57.7.161])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 829F13F718;
 Mon, 28 Mar 2022 23:37:10 -0700 (PDT)
Message-ID: <8c4ae309-bc3a-2c16-d312-7ae7cc5b3c61@arm.com>
Date: Tue, 29 Mar 2022 07:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND][PATCH 7/8] thermal: cooling: Check Energy Model type in
 cpufreq_cooling and devfreq_cooling
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, ionela.voinescu@arm.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-8-lukasz.luba@arm.com>
 <20220328032729.mutbjailxbmylffs@vireshk-i7>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20220328032729.mutbjailxbmylffs@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_233716_729937_F98551E7 
X-CRM114-Status: GOOD (  18.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 3/28/22 04:27, Viresh Kumar wrote:
> On 21-03-22, 09:57, Lukasz Luba wrote:
>> The Energy Model can now be artificial, which means the power values
>> are mathematically generated to leverage EAS while not expected to be on
>> an uniform scale with other devices providing power information. If this
>> EM type is in use, the thermal governor IPA should not be allowed to
>> operate, since the relation between cooling devices is not properly
>> defined. Thus, it might be possible that big GPU has lower power values
>> than a Little CPU. To mitigate a misbehaviour of the thermal control
>> algorithm, simply do not register the cooling device as IPA's power
>> actor.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>   drivers/thermal/cpufreq_cooling.c | 2 +-
>>   drivers/thermal/devfreq_cooling.c | 8 +++++---
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
>> index 0bfb8eebd126..b8151d95a806 100644
>> --- a/drivers/thermal/cpufreq_cooling.c
>> +++ b/drivers/thermal/cpufreq_cooling.c
>> @@ -328,7 +328,7 @@ static inline bool em_is_sane(struct cpufreq_cooling_device *cpufreq_cdev,
>>   	struct cpufreq_policy *policy;
>>   	unsigned int nr_levels;
>>   
>> -	if (!em)
>> +	if (!em || em_is_artificial(em))
>>   		return false;
>>   
>>   	policy = cpufreq_cdev->policy;
>> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
>> index 4310cb342a9f..b04dcbbf721a 100644
>> --- a/drivers/thermal/devfreq_cooling.c
>> +++ b/drivers/thermal/devfreq_cooling.c
>> @@ -358,6 +358,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>>   	struct thermal_cooling_device *cdev;
>>   	struct device *dev = df->dev.parent;
>>   	struct devfreq_cooling_device *dfc;
>> +	struct em_perf_domain *em;
>>   	char *name;
>>   	int err, num_opps;
>>   
>> @@ -367,8 +368,9 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>>   
>>   	dfc->devfreq = df;
>>   
>> -	dfc->em_pd = em_pd_get(dev);
>> -	if (dfc->em_pd) {
>> +	em = em_pd_get(dev);
>> +	if (em && !em_is_artificial(em)) {
>> +		dfc->em_pd = em;
>>   		devfreq_cooling_ops.get_requested_power =
>>   			devfreq_cooling_get_requested_power;
>>   		devfreq_cooling_ops.state2power = devfreq_cooling_state2power;
>> @@ -379,7 +381,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>>   		num_opps = em_pd_nr_perf_states(dfc->em_pd);
>>   	} else {
>>   		/* Backward compatibility for drivers which do not use IPA */
>> -		dev_dbg(dev, "missing EM for cooling device\n");
>> +		dev_dbg(dev, "missing proper EM for cooling device\n");
>>   
>>   		num_opps = dev_pm_opp_get_opp_count(dev);
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 

Thank you Viresh for the ACK!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
