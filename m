Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A4AC54FD0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 16:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088CA20781
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 16:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJ0fz7bG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088CA20781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=co1RbUu/IfuquxAzghXOwl495lyBR0g7ZQF1XQfNTaU=; b=NJ0fz7bGt+FvKPNtU0H6Ibwrd
	93a+yQFEga6Z2S1oJMhc7djfvZL5u2N4xKVCRJ4iIk1RPN+fJdPHpFn+PpcRsLp7n1shFWxCvrr7S
	HvA2m7njHq7nhaneXUjjrdEnpNSB9umxh8CUg3a9K5XYfWEChzz+BIo5+GtS5CUUVUQIST1pFMRr+
	scYhUoDrjKrEVTOq7Elo2R0k+Msc4z+5IZlqkJyxEG/JDO5UY9YTQCkieL55UqC0Q8fQBaSqrR3nN
	etYCdcpKrcp8w6NKKP5kuec7jvUyTf7IaASble6IqhzMVjH5ujaNKaPoF+n3GzaXUc1GybTbyICx+
	/OrgHwNjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRfBa-0006IW-LO; Thu, 23 Apr 2020 16:58:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRfB9-00063b-Su; Thu, 23 Apr 2020 16:58:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85EE330E;
 Thu, 23 Apr 2020 09:58:22 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B9B73F68F;
 Thu, 23 Apr 2020 09:57:48 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
 <20200423151250.GB65632@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <ff1c8cc5-f64d-6156-7d30-97b8426c6f99@arm.com>
Date: Thu, 23 Apr 2020 17:57:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200423151250.GB65632@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_095823_996280_1582ACBD 
X-CRM114-Status: GOOD (  17.58  )
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
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 4/23/20 4:12 PM, Daniel Lezcano wrote:
> On Fri, Apr 10, 2020 at 09:42:04AM +0100, Lukasz Luba wrote:
>> Add support for other devices that CPUs. The registration function
>> does not require a valid cpumask pointer and is ready to handle new
>> devices. Some of the internal structures has been reorganized in order to
>> keep consistent view (like removing per_cpu pd pointers). To track usage
>> of the Energy Model structures, they are protected with kref.
> 
> Why not add the energy model structure in the struct device directly?

Do you mean this structure?
https://elixir.bootlin.com/linux/latest/source/include/linux/device.h#L537

and to put something like:
struct device {
...
	struct dev_pm_domain	*pm_domain;
#ifdef CONFIG_ENERGY_MODEL
	struct em_perf_domain	*em_pd;
#endif
...
};

> 
> For instance for the em_cpu_get() function, the cpu id allows to retrieve the
> cpu device and then from there, the energy model instead of browsing another
> list. The em_device life cycle will be tied to the struct device.

That would be perfect.

> 
> Then when the struct device and the em_device are connected, add the debugfs
> with a struct device list for those which are energy aware, so you end up with
> a structure:
> 
> struct em_device {
> 	struct device *dev;
> 	struct list_head em_dev_list;
> };
> 
> (a global single dentry for debugfs to do a recursive delete is enough).
> 
> Locks when inspecting and add/removal called from the struct device release
> function. So no need of an extra refcounting.
> 
> Does it make sense?
> 

Indeed it looks much cleaner/simpler.

I will try to address this idea and get rid of refcounting.

This should be doable in this patch (4/10). In the v7 I will keep your
ACKs for other patches that you have already commented.

Thank you for your suggestions and review.

Regards,
Lukasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
