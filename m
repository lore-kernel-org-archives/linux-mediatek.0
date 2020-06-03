Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAA9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 16:45:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C2C206A2
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 16:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NzCWbyA6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4C2C206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kkzv/eNqrYlouR2Pqgi7/Zfg8PYvIVLhx8NGhdh28Zc=; b=NzCWbyA6bnZNp+6hWFpHBnlDf
	7rKprZgGc7T/LwRkj+0zT4z1nUrtJWYvXoSh7txIIFQ3qQ3vGa7QUTHvNEDjavwy5QCBLfBBWQOKM
	QP58PvudIhn8GNogD4mo6oP1QULhxMA/rRusMWVUfC8AIPzbAXFAMX1NvmQ4j8YCoVo8zdNYUGQbF
	+V3a2tkXoIEiSv5jdWioOOa0kt05PDUvwwbVnm9hGTJocacxr8GGmmWCbn70LFS25p8xGuMFkQSM+
	gUvyJtCAwNmblLFqmklFFBUMuN+Sf7PqFPrZGk8LESsKx0tWy39Fb8v9CIywixUfla/ZK8Y3UOJsv
	FLf5B91Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgWWO-0002ll-Eo; Wed, 03 Jun 2020 16:45:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgWWH-0002g8-2k; Wed, 03 Jun 2020 16:45:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BF0255D;
 Wed,  3 Jun 2020 09:45:35 -0700 (PDT)
Received: from [10.37.12.87] (unknown [10.37.12.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B64873F52E;
 Wed,  3 Jun 2020 09:45:24 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
 <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
 <7201e161-6952-6e28-4036-bd0f0353ec30@arm.com>
 <CAJZ5v0jwoNSYOz3nGqNshd=5btsLxOp-di-Dot+cHqAQZEQVRw@mail.gmail.com>
 <d6a0d345-53ef-523c-836d-3bc4ea4c6e66@arm.com>
 <CAJZ5v0iDNH7tZmKsYgW1xp-g3WmOod+Wo-AzJmszXuv_wztwwA@mail.gmail.com>
 <d0894383-1362-fdea-f74c-7dd8ecdc33ca@arm.com>
 <CAJZ5v0jL0+TXDGXaO=WfYg6QM3=B83LLZ90xtc2HtX70jdoiYQ@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <6693c594-930b-b28e-58d0-f1b28b6eef58@arm.com>
Date: Wed, 3 Jun 2020 17:45:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jL0+TXDGXaO=WfYg6QM3=B83LLZ90xtc2HtX70jdoiYQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_094537_211351_027E63E4 
X-CRM114-Status: GOOD (  32.80  )
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



On 6/3/20 5:22 PM, Rafael J. Wysocki wrote:
> On Wed, Jun 3, 2020 at 6:12 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>>
>>
>> On 6/3/20 4:40 PM, Rafael J. Wysocki wrote:
>>> On Wed, Jun 3, 2020 at 5:26 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/3/20 4:13 PM, Rafael J. Wysocki wrote:
>>>>> On Tue, Jun 2, 2020 at 1:31 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>>>>>
>>>>>> Hi Daniel,
>>>>>>
>>>>>> On 6/1/20 10:44 PM, Daniel Lezcano wrote:
>>>>>>> On 27/05/2020 11:58, Lukasz Luba wrote:
>>>>>>>> Add support for other devices than CPUs. The registration function
>>>>>>>> does not require a valid cpumask pointer and is ready to handle new
>>>>>>>> devices. Some of the internal structures has been reorganized in order to
>>>>>>>> keep consistent view (like removing per_cpu pd pointers).
>>>>>>>>
>>>>>>>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> [ ... ]
>>>>>>>
>>>>>>>>      }
>>>>>>>>      EXPORT_SYMBOL_GPL(em_register_perf_domain);
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
>>>>>>>> + * @dev             : Device for which the EM is registered
>>>>>>>> + *
>>>>>>>> + * Try to unregister the EM for the specified device (but not a CPU).
>>>>>>>> + */
>>>>>>>> +void em_dev_unregister_perf_domain(struct device *dev)
>>>>>>>> +{
>>>>>>>> +    if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
>>>>>>>> +            return;
>>>>>>>> +
>>>>>>>> +    if (_is_cpu_device(dev))
>>>>>>>> +            return;
>>>>>>>> +
>>>>>>>> +    mutex_lock(&em_pd_mutex);
>>>>>>>
>>>>>>> Is the mutex really needed?
>>>>>>
>>>>>> I just wanted to align this unregister code with register. Since there
>>>>>> is debugfs dir lookup and the device's EM existence checks I thought it
>>>>>> wouldn't harm just to lock for a while and make sure the registration
>>>>>> path is not used. These two paths shouldn't affect each other, but with
>>>>>> modules loading/unloading I wanted to play safe.
>>>>>>
>>>>>> I can change it maybe to just dmb() and the end of the function if it's
>>>>>> a big performance problem in this unloading path. What do you think?
>>>>>
>>>>> I would rather leave the mutex locking as is.
>>>>>
>>>>> However, the question to ask is what exactly may go wrong without that
>>>>> locking in place?  Is there any specific race condition that you are
>>>>> concerned about?
>>>>>
>>>>
>>>> I tried to test this with module loading & unloading with panfrost
>>>> driver and CPU hotplug (which should bail out quickly) and was OK.
>>>> I don't see any particular race. I don't too much about the
>>>> debugfs code, though. That's why I tried to protect from some
>>>> scripts/services which try to re-load the driver.
>>>>
>>>> Apart from that, maybe just this dev->em = NULL to be populated to all
>>>> CPUs, which mutex_unlock synchronizes for free here.
>>>
>>> If it may run concurrently with the registration for the same device,
>>> the locking is necessary, but in that case the !dev->em_pd check needs
>>> to go under the mutex too IMO, or you may end up leaking the pd if the
>>> registration can run between that check and the point at which the
>>> mutex is taken.
>>
>> They don't run concurrently for the same device and users of that EM are
>> already gone.
>> I just wanted to be sure that everything is cleaned and synced properly.
>> Here is some example of the directories under
>> /sys/kernel/debug/energy_model
>> cpu0, cpu4, gpu, dsp, etc
>>
>> The only worry that I had was the debugfs dir name, which is a
>> string from dev_name() and will be the same for the next registration
>> if module is re-loaded.
> 
> OK, so that needs to be explained in a comment.

OK, I will add it.

> 
>> So the 'name' is reused and debugfs_create_dir()
>> and debugfs_remove_recursive() uses this fsnotify, but they are
>> operating under inode_lock/unlock() on the parent dir 'energy_model'.
>> Then there is also this debugfs_lookup() which is slightly different.
>>
>> That's why I put a mutex to separate all registration and unregistration
>> for all devices.
>> It should work without the mutex in unregister path, but I think it does
>> not harm to take
> 
> Well, fair enough, but I still think that the !dev->em_pd check should
> be done under the mutex or it will be confusing.
> 
>> it just in case and also have the CPU variable sync for free.
> 
> I'm not sure what you mean by the last part here?

The mutex_unlock for me also means dmb() took place. ARM has slightly
different memory model than x86 and I just wanted to be sure that
this new values reach memory and become visible to other cores.
mutex_unlock just guaranties this for me.

> 
>>>
>>> Apart from this your kerneldoc comments might me improved IMO.
>>>
>>> First of all, you can use @dev inside of a kerneldoc (if @dev
>>> represents an argument of the documented function) and that will
>>> produce the right output automatically.
>>
>> OK
>>
>>>
>>> Second, it is better to avoid saying things like "Try to unregister
>>> ..." in kerneldoc comments (the "Try to" part is redundant).  Simply
>>> say "Unregister ..." instead.
>>
>> Good point, thanks, I will use "Unregister ..." then.
>>
>>>
>>> Thanks!
>>>
>>
>> Shell I send a 'resend patch' which changes these @dev and
>> 'unregister' comments?
> 
> Yes, please, but see the comments above too.

Saw it

> 
>> Or wait for you to finish reviewing the other patches and send v9?
> 
> That is not necessary, unless you want to make kerneldoc improvements
> in the other patches.

I will check them, but if they are OKish then I will just resend this
one.


Thank you for the review.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
