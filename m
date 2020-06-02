Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1DDC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 11:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3D3207ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 11:31:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fhxMdY4w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E3D3207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M0nWTuCyM8vHgr5EfkjFrdTVcDYMt2c+T6GJthanE6E=; b=fhxMdY4wIu4hEOVFMqExyfHld
	ZuN7Hnq8wBpu0wLADBVzdV0A2AdsOqqIpC9rmYq55wwl7/RAaUVkofgepAwHIggCsQP70/s8lBCO2
	b4fIrha5gL4vjX03ovczKh2xuRnUhfzFyet6Es+VSB2zVYhgpOby9cbPbsB+m9HpTXT2KivM6EKGt
	11rZcS7P4TiUkDjV9Ia8j+T6JWtb8P3dx/PV+kJHzEeRw7yaiQXoEPHqsAdWrBeO1dMB0od1gx0Fw
	8jUO7/qgU9W921Q55I4qIxHwF7OBv1m+8isH1LuJgFOtQYLXxvVT9Et4Q8eTzrY7sfpwbN+4y8O2H
	yI1beAocA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg592-0001Gf-5X; Tue, 02 Jun 2020 11:31:48 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg58v-00019z-Op; Tue, 02 Jun 2020 11:31:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B08A931B;
 Tue,  2 Jun 2020 04:31:37 -0700 (PDT)
Received: from [10.37.12.87] (unknown [10.37.12.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54B5E3F52E;
 Tue,  2 Jun 2020 04:31:27 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
 <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <7201e161-6952-6e28-4036-bd0f0353ec30@arm.com>
Date: Tue, 2 Jun 2020 12:31:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_043141_892605_808441E9 
X-CRM114-Status: GOOD (  18.53  )
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, mka@chromium.org, robh@kernel.org,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Daniel,

On 6/1/20 10:44 PM, Daniel Lezcano wrote:
> On 27/05/2020 11:58, Lukasz Luba wrote:
>> Add support for other devices than CPUs. The registration function
>> does not require a valid cpumask pointer and is ready to handle new
>> devices. Some of the internal structures has been reorganized in order to
>> keep consistent view (like removing per_cpu pd pointers).
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
> 
> [ ... ]
> 
>>   }
>>   EXPORT_SYMBOL_GPL(em_register_perf_domain);
>> +
>> +/**
>> + * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
>> + * @dev		: Device for which the EM is registered
>> + *
>> + * Try to unregister the EM for the specified device (but not a CPU).
>> + */
>> +void em_dev_unregister_perf_domain(struct device *dev)
>> +{
>> +	if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
>> +		return;
>> +
>> +	if (_is_cpu_device(dev))
>> +		return;
>> +
>> +	mutex_lock(&em_pd_mutex);
> 
> Is the mutex really needed?

I just wanted to align this unregister code with register. Since there
is debugfs dir lookup and the device's EM existence checks I thought it
wouldn't harm just to lock for a while and make sure the registration
path is not used. These two paths shouldn't affect each other, but with
modules loading/unloading I wanted to play safe.
I can change it maybe to just dmb() and the end of the function if it's
a big performance problem in this unloading path. What do you think?

> 
> If this function is called that means there is no more user of the
> em_pd, no?

True, that EM users should already be unregistered i.e. thermal cooling.

> 
>> +	em_debug_remove_pd(dev);
>> +
>> +	kfree(dev->em_pd->table);
>> +	kfree(dev->em_pd);
>> +	dev->em_pd = NULL;
>> +	mutex_unlock(&em_pd_mutex);
>> +}
>> +EXPORT_SYMBOL_GPL(em_dev_unregister_perf_domain);
>>
> 
> 

Thank you for reviewing this.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
