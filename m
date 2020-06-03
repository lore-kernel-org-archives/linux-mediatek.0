Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B852DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 15:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87871207D8
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 15:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mHm61Ocx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87871207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cWVvo/bUVoRhQYa7SSaK3wSPFj8xb8SEWsadLyTs5w8=; b=mHm61Ocx10uPQ6VoAgfw4Vzkm
	HlveTN0OIaig6F4Cm8D/7rbMgeg174EVhGI+72h2wXAsQfZoa8xCD6KytVGSY63Q7i+6OOgzrdb5F
	JXY9UrxlcgPUfZaryVaVkVWnIQ6VC0I3+/vTLT+2fX1OQ55bMB2q6qOJXWL0RZ2DIvs3QqRL4BGb/
	Q9RKE4ssfSWYSLRtFZR2PIxBqDywuaesXrfsVQzPgyqdt8V4mnErx42U/7HWVBAdpbxufnFz7yMUg
	TbLRBK4CSfaYUBAly+OYkNR480Q6Bhu8XrSno7OzrS/DRYX6vEG+0QM7POok6cwOs19661blDiFFM
	BDUnbqE1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgVHR-0003rg-Vk; Wed, 03 Jun 2020 15:26:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgVHJ-0003jc-Ux; Wed, 03 Jun 2020 15:26:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85D2A55D;
 Wed,  3 Jun 2020 08:26:02 -0700 (PDT)
Received: from [10.37.12.87] (unknown [10.37.12.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A4FB3F52E;
 Wed,  3 Jun 2020 08:25:51 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
 <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
 <7201e161-6952-6e28-4036-bd0f0353ec30@arm.com>
 <CAJZ5v0jwoNSYOz3nGqNshd=5btsLxOp-di-Dot+cHqAQZEQVRw@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <d6a0d345-53ef-523c-836d-3bc4ea4c6e66@arm.com>
Date: Wed, 3 Jun 2020 16:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jwoNSYOz3nGqNshd=5btsLxOp-di-Dot+cHqAQZEQVRw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_082606_100312_E35CC15B 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: Nishanth Menon <nm@ti.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benjamin Segall <bsegall@google.com>, alyssa.rosenzweig@collabora.com,
 Fabio Estevam <festevam@gmail.com>, Matthias Kaehlcke <mka@chromium.org>,
 Rob Herring <robh@kernel.org>, Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, steven.price@arm.com,
 Chanwoo Choi <cw00.choi@samsung.com>, Ingo Molnar <mingo@redhat.com>,
 dl-linux-imx <linux-imx@nxp.com>, "Zhang, Rui" <rui.zhang@intel.com>,
 Mel Gorman <mgorman@suse.de>, orjan.eide@arm.com,
 Daniel Vetter <daniel@ffwll.ch>, Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Quentin Perret <qperret@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 patrick.bellasi@matbug.net, Shawn Guo <shawnguo@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/3/20 4:13 PM, Rafael J. Wysocki wrote:
> On Tue, Jun 2, 2020 at 1:31 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Hi Daniel,
>>
>> On 6/1/20 10:44 PM, Daniel Lezcano wrote:
>>> On 27/05/2020 11:58, Lukasz Luba wrote:
>>>> Add support for other devices than CPUs. The registration function
>>>> does not require a valid cpumask pointer and is ready to handle new
>>>> devices. Some of the internal structures has been reorganized in order to
>>>> keep consistent view (like removing per_cpu pd pointers).
>>>>
>>>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>>>> ---
>>>
>>> [ ... ]
>>>
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(em_register_perf_domain);
>>>> +
>>>> +/**
>>>> + * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
>>>> + * @dev             : Device for which the EM is registered
>>>> + *
>>>> + * Try to unregister the EM for the specified device (but not a CPU).
>>>> + */
>>>> +void em_dev_unregister_perf_domain(struct device *dev)
>>>> +{
>>>> +    if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
>>>> +            return;
>>>> +
>>>> +    if (_is_cpu_device(dev))
>>>> +            return;
>>>> +
>>>> +    mutex_lock(&em_pd_mutex);
>>>
>>> Is the mutex really needed?
>>
>> I just wanted to align this unregister code with register. Since there
>> is debugfs dir lookup and the device's EM existence checks I thought it
>> wouldn't harm just to lock for a while and make sure the registration
>> path is not used. These two paths shouldn't affect each other, but with
>> modules loading/unloading I wanted to play safe.
>>
>> I can change it maybe to just dmb() and the end of the function if it's
>> a big performance problem in this unloading path. What do you think?
> 
> I would rather leave the mutex locking as is.
> 
> However, the question to ask is what exactly may go wrong without that
> locking in place?  Is there any specific race condition that you are
> concerned about?
> 

I tried to test this with module loading & unloading with panfrost
driver and CPU hotplug (which should bail out quickly) and was OK.
I don't see any particular race. I don't too much about the
debugfs code, though. That's why I tried to protect from some
scripts/services which try to re-load the driver.

Apart from that, maybe just this dev->em = NULL to be populated to all
CPUs, which mutex_unlock synchronizes for free here.

Regards,
Lukasz



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
