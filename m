Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B7FC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 09:37:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D83661076
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 09:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D83661076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITTlzLlgSIhGgJqaurAp4dfbZ9S1RTK9uRmKQtRGrLQ=; b=WU/nL6ZfJxc8j+G+sBrGVgqn2a
	I7eSED211yYj4k3ICiOTqWZbpn94fAru/sDcNt13SWOEn6d2M9SQGqL9hDmfdlbDmpQht7Fysx4Lm
	oOOujF2c74edRIeFPhBI5ndiEANEtNDkfoIKHOkSx43qmGc1bcDuC0Eia7kv7rs5IwKI3dI/Wg7Pf
	VJe6nJUSEBsrihEtT31d6qJSSFY3YDFIRyMBBvgGR6gg472QTo6QBWZjD9INYX8r7aBwrl4QAbUK1
	8vfEcaukPo0qqWYqjeutxt5esnLxEOXuw4gQybpc3mK4JPCbYeJ7x+znG9rRVDLm+NxV4WEODnrLE
	JKry7e+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDOC6-003JtG-Gy; Tue, 10 Aug 2021 09:37:10 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDOAX-003J8s-1f; Tue, 10 Aug 2021 09:35:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9611063;
 Tue, 10 Aug 2021 02:35:26 -0700 (PDT)
Received: from [10.57.9.181] (unknown [10.57.9.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F9EB3F718;
 Tue, 10 Aug 2021 02:35:22 -0700 (PDT)
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <6449a61f-a5fc-0b81-65b2-7bf77b8a71aa@arm.com>
 <20210810092705.ctf43hwhzdepmcrv@vireshk-i7>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <765a5fd5-1109-1af1-b339-624561070890@arm.com>
Date: Tue, 10 Aug 2021 10:35:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210810092705.ctf43hwhzdepmcrv@vireshk-i7>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_023533_239181_6811FF2D 
X-CRM114-Status: GOOD (  29.58  )
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



On 8/10/21 10:27 AM, Viresh Kumar wrote:
> On 10-08-21, 10:17, Lukasz Luba wrote:
>> Hi Viresh,
>>
>> I like the idea, only small comments here in the cover letter.
>>
>> On 8/10/21 8:36 AM, Viresh Kumar wrote:
>>> Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
>>> with the EM core on their behalf. This allows us to get rid of duplicated code
>>> in the drivers and fix the unregistration part as well, which none of the
>>> drivers have done until now.
>>
>> The EM is never freed for CPUs by design. The unregister function was
>> introduced for devfreq devices.
> 
> I see. So if a cpufreq driver unregisters and registers again, it will
> be required to use the entries created by the registration itself,
> right ? Technically speaking, it is better to unregister and free any
> related resources and parse everything again.
> 
> Lets say, just for fun, I want to test two copies of a cpufreq driver

It's good that it's just for fun ;)

> (providing different set of freq-tables). I build both of them as
> modules, insert the first version, remove it, insert the second one.
> Ideally, this should just work as expected. But I don't think it will
> in this case as you never parse the EM stuff again.

The EM is directly used by scheduler in the hot-path, there are no
checks even if the EM if for CPUs. We are sure it's is for CPUs and
is always there for all CPUs.

I'm currently working on a EM v2 which would have stronger mechanisms
and do better job in this field. The patches are under internal review
and hopefully ready to post by the end of month.

> 
> Again, since the routine is there already, I think it is better/fine
> to just use it.

True, it doesn't harm, so I commented it in the patch 1/8 that it
could stay.

> 
>>> This would also make the registration with EM core to happen only after policy
>>> is fully initialized, and the EM core can do other stuff from in there, like
>>> marking frequencies as inefficient (WIP). Though this patchset is useful without
>>> that work being done and should be merged nevertheless.
>>>
>>> This doesn't update scmi cpufreq driver for now as it is a special case and need
>>> to be handled differently. Though we can make it work with this if required.
>>
>> The scmi cpufreq driver uses direct EM API, which provides flexibility
>> and should stay as is.
> 
> Right, so I left it as is for now.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
