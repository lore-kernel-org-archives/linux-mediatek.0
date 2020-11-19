Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDFCC63798
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 15:14:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2936722272
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 15:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="StqsNLW+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2936722272
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7u3UAxkThelTOgqKMyhH56/xwOH4ifqfv+XrhaLZtjk=; b=StqsNLW+Y+ynpbyfbKG76Ldzs
	iLEIdDF0zRmWuGs2IUjMMj/WNVXDIdx/z1kJ6hQ4qTWSlSfdkVY6lDft/V84Ve5t77ho+6l6FxI1/
	KTltqTYykMIicZmYysLZN8WWN44lKLw+q2aYKhE+VcK+oQZWPtJSvc86067GYG/FwqwVAv9wdVq7b
	1vgOyMQFY2RPU1M9oigRluJPvM/kH/5T07Gx2op3U2RiAlTgWiaJSeQtnKQBMdB6moVHc4TzOKjMT
	btRTScvAQaNhH7kZdeKaHUoFOk3QrOkbifa0tjQ5sVQjrgppo9l6qEXDTxHaaUfKyDvaCJxNUeedR
	6K9l05fiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfldY-0002KM-6Y; Thu, 19 Nov 2020 15:14:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfldT-0002In-Kg; Thu, 19 Nov 2020 15:14:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A9E211D4;
 Thu, 19 Nov 2020 07:14:10 -0800 (PST)
Received: from [10.57.24.96] (unknown [10.57.24.96])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6F203F719;
 Thu, 19 Nov 2020 07:14:05 -0800 (PST)
Subject: Re: [PATCH v8 1/3] cpufreq: mediatek-hw: Add support for CPUFREQ HW
To: Hector Yuan <hector.yuan@mediatek.com>
References: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
 <1603700349-5922-2-git-send-email-hector.yuan@mediatek.com>
 <9382b917-f20d-c7b5-42e4-46d11465073f@arm.com>
 <1605793218.20463.5.camel@mtkswgap22>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <677bc381-6cab-85ec-8b9f-4c33dfb487fd@arm.com>
Date: Thu, 19 Nov 2020 15:14:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1605793218.20463.5.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_101411_819076_631C0CFE 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 Dave Gerlach <d-gerlach@ti.com>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Amit Kucheria <amit.kucheria@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/19/20 1:40 PM, Hector Yuan wrote:
> On Thu, 2020-11-19 at 12:41 +0000, Lukasz Luba wrote:
>> Hi Hector,
>>
>> On 10/26/20 8:19 AM, Hector Yuan wrote:
>>> From: "Hector.Yuan" <hector.yuan@mediatek.com>
>>>
>>> Add cpufreq HW support.
>>>
>>> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
>>
>> [snip]
>>
>>> +
>>> +static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>>> +{
>>> +	struct cpufreq_mtk *c;
>>> +	struct device *cpu_dev;
>>> +	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
>>> +	struct pm_qos_request *qos_request;
>>> +	int sig, pwr_hw = CPUFREQ_HW_STATUS | SVS_HW_STATUS;
>>> +
>>> +	qos_request = kzalloc(sizeof(*qos_request), GFP_KERNEL);
>>> +	if (!qos_request)
>>> +		return -ENOMEM;
>>> +
>>> +	cpu_dev = get_cpu_device(policy->cpu);
>>> +	if (!cpu_dev) {
>>> +		pr_err("failed to get cpu%d device\n", policy->cpu);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	c = mtk_freq_domain_map[policy->cpu];
>>> +	if (!c) {
>>> +		pr_err("No scaling support for CPU%d\n", policy->cpu);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	cpumask_copy(policy->cpus, &c->related_cpus);
>>> +
>>> +	policy->freq_table = c->table;
>>> +	policy->driver_data = c;
>>
>> To control frequency transition rate in schedutil, you might
>> be interested in setting:
>>
>> policy->cpuinfo.transition_latency = <mtk_value_here>;
>>
>> Example, when this latency value comes from FW [1]
>>
> OK, I will add it in v9.
>>> +
>>> +	/* Let CPUs leave idle-off state for SVS CPU initializing */
>>> +	cpu_latency_qos_add_request(qos_request, 0);
>>> +
>>> +	/* HW should be in enabled state to proceed now */
>>> +	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
>>> +
>>> +	if (readl_poll_timeout(c->reg_bases[REG_FREQ_HW_STATE], sig,
>>> +			       (sig & pwr_hw) == pwr_hw, POLL_USEC,
>>> +			       TIMEOUT_USEC)) {
>>> +		if (!(sig & CPUFREQ_HW_STATUS)) {
>>> +			pr_info("cpufreq hardware of CPU%d is not enabled\n",
>>> +				policy->cpu);
>>> +			return -ENODEV;
>>> +		}
>>> +
>>> +		pr_info("SVS of CPU%d is not enabled\n", policy->cpu);
>>> +	}
>>> +
>>> +	em_dev_register_perf_domain(cpu_dev, c->nr_opp, &em_cb, policy->cpus);
>>
>> Please keep in mind that this is going to be changed soon with a new
>> argument: 'milliwatts'. It's queued in pm/linux-next [2].
>>
> OK, thanks for the remind.
>> Regards,
>> Lukasz
>>
>> [1]
>> https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/scmi-cpufreq.c#L194
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
>>
> 

Also, based on function mtk_cpufreq_hw_target_index(), which looks
really simple, you might consider to have fast_switch enabled.

It will allow SchedUtil governor to change frequency directly
and not create a dedicated deadline thread for it. It pays off.

You have to experiment with something like:

policy->fast_switch_possible  = true;


static struct cpufreq_driver cpufreq_mtk_hw_driver = {
...
	.fast_switch = mtk_cpufreq_hw_fast_switch
...
}

Again, scmi-cpufreq.c would be a good pattern to follow.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
