Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09584C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 18:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D413322314
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 18:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRibTLIf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D413322314
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bu2pTEQjStuTLpKD4gEIlkBd8j2X1Ykw732V7rLRyDE=; b=CRibTLIfmZe46b3tZWKvRnU0s
	OMyCl5K8ofQu0TOEMK4prpAh+RVDgfIpWHF7cAIoJh/jFfwxQFifh+KZTCCRQogZtT1e+Zw4Duf2j
	D0H7VZiNwrertkJWpw7LhFVMFQWdQxZVCGpzKGDXgUDZvHZKmjAmA/D32hII/5tmi6I0ycRxxwyeb
	TOOFWtEThjTSV5UTSJCb8H7hJn23Zhvyd5pBi0jkK+wYr8Hi9DTrExnaERR+azuSd/12PU3fG2GJv
	Zi68qmtWWbqCDEeGg66AXsUVlk2JkMn/PUKiJfFHILD7HhukhBkowAorAEyzC61otoTP49ZV6nty8
	PkI/W9ESA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itbx2-0000DV-9m; Mon, 20 Jan 2020 18:39:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itbws-0008RV-QW; Mon, 20 Jan 2020 18:38:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D770E31B;
 Mon, 20 Jan 2020 10:38:53 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B943B3F68E;
 Mon, 20 Jan 2020 10:38:43 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Quentin Perret <qperret@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
 <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
Date: Mon, 20 Jan 2020 18:38:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_103854_947322_C85928C2 
X-CRM114-Status: GOOD (  17.29  )
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
 viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, vincent.guittot@linaro.org,
 khilman@kernel.org, agross@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com,
 linux-imx@nxp.com, rui.zhang@intel.com, kernel-team@android.com,
 mgorman@suse.de, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 1/20/20 6:27 PM, Dietmar Eggemann wrote:
> On 20/01/2020 16:09, Quentin Perret wrote:
>> Hey Lukasz,
>>
>> On Monday 20 Jan 2020 at 14:52:07 (+0000), Lukasz Luba wrote:
>>> On 1/17/20 10:54 AM, Quentin Perret wrote:
>>>> Suggested alternative: have two registration functions like so:
>>>>
>>>> 	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
>>>> 			       struct em_data_callback *cb);
>>>> 	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
>>>> 			       struct em_data_callback *cb);
>>>
>>> Interesting, in the internal review Dietmar asked me to remove these two
>>> functions. I had the same idea, which would simplify a bit the
>>> registration and it does not need to check the dev->bus if it is CPU.
>>>
>>> Unfortunately, we would need also two function in drivers/opp/of.c:
>>> dev_pm_opp_of_register_cpu_em(policy->cpus);
>>> and
>>> dev_pm_opp_of_register_dev_em(dev);
>>>
>>> Thus, I have created only one registration function, which you can see
>>> in this patch set.
>>
>> Right, I can see how having a unified API would be appealing, but the
>> OPP dependency is a nono, so we'll need to work around one way or
>> another.
>>
>> FWIW, I don't think having separate APIs for CPUs and other devices is
>> that bad given that we already have entirely different frameworks to
>> drive their respective frequencies. And the _cpu variants are basically
>> just wrappers around the _dev ones, so not too bad either IMO :).
> 
> It's true that we need the policy->cpus cpumask only for cpu devices and
> we have it available when we call em_register_perf_domain()
> [scmi-cpufreq.c driver] or the OPP wrapper dev_pm_opp_of_register_em()
> [e.g. cpufreq-dt.c driver].
> 
> And we shouldn't make EM code dependent on OPP.
> 
> But can't we add 'struct cpumask *mask' as an additional argument to
> both which can be set to NULL for (devfreq) devices?
> 
> We can check in em_register_perf_domain() that we got a valid cpumask
> for a cpu device and ignore it for (devfreq) devices.
> 

I think we could avoid this additional argument 'cpumask'. I have
checked the cpufreq_cpu_get function, which should do be good for this:

---------->8-------------------------
static int _get_sharing_cpus(struct device *cpu_dev, struct cpumask *span)
{
         struct cpufreq_policy *policy;

         policy = cpufreq_cpu_get(cpu_dev->id);
         if (policy) {
                 cpumask_copy(span, policy->cpus);
                 cpufreq_cpu_put(policy);
                 return 0;
         } else {
                 return -EINVAL;
         }
}
--------------------------8<-------------------------------

It would be a replacement for:
ret = dev_pm_opp_get_sharing_cpus(dev, span);

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
