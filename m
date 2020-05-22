Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158C5C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D25A120738
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ds68DSAB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D25A120738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qjVxF2+/5SU/KISdqiW8TFuc/6g9WySTg60SZaoh3kg=; b=ds68DSABqGfdrwWle1k/EierU
	UFU+ew5ZSJ8UQpciM0bBwjkdsD18gO27irwDxndxJSN767BTYO9g5O8xZzJl09t0SdjZ2sOp25B74
	3MNpAWOdFLOKEMnZZIjSo1Llw084FStTJboxSOAWJdQ5khmU48Ikr28PnX3W73eqXr5r6atKFiDjw
	yx6JG4pzbHTBL9yv43Cihkk0h1NczSQMXRTvLXkBfrS+8EGmTcKSdIbM7n3M4EQ9MjPokalZTKOGq
	DCoF6ut2vSjLXTMbYeVdKIxvgm/IbpETS3jrzso+vxeLixSHWL5C4b/4Gf4V0uexp/mFAcx+PFGY3
	+tQHDUVhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc7G3-0001Kj-1k; Fri, 22 May 2020 12:58:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc7Fs-0001B2-LL; Fri, 22 May 2020 12:58:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07F76D6E;
 Fri, 22 May 2020 05:58:26 -0700 (PDT)
Received: from [10.37.12.7] (unknown [10.37.12.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D8533F68F;
 Fri, 22 May 2020 05:58:13 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] Add support for devices in the Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <3f6652a5-ad9b-15cb-08a8-160becd3f912@arm.com>
Date: Fri, 22 May 2020 13:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_055828_741150_4CEDD92E 
X-CRM114-Status: GOOD (  17.21  )
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

On 5/22/20 11:43 AM, Daniel Lezcano wrote:
> 
> Hi Lukasz,
> 
> On 11/05/2020 13:18, Lukasz Luba wrote:
>> Hi all,
>>
>> This patch set introduces support for devices in the Energy Model (EM)
>> framework. It will unify the power model for thermal subsystem. It will
>> make simpler to add support for new devices willing to use more
>> advanced features (like Intelligent Power Allocation). Now it should
>> require less knowledge and effort for driver developer to add e.g.
>> GPU driver with simple energy model. A more sophisticated energy model
>> in the thermal framework is also possible, driver needs to provide
>> a dedicated callback function. More information can be found in the
>> updated documentation file.
>>
>> First 7 patches are refactoring Energy Model framework to add support
>> of other devices that CPUs. They change:
>> - naming convention from 'capacity' to 'performance' state,
>> - API arguments adding device pointer and not rely only on cpumask,
>> - change naming when 'cpu' was used, now it's a 'device'
>> - internal structure to maintain registered devices
>> - update users to the new API
>> Patch 8 updates OPP framework helper function to be more generic, not
>> CPU specific.
>> Patches 9-14 change devfreq cooling, dropping part of old power model and
>> adding registration with Energy Model via exported GPL function.
>> The last path is a simple change for Panfrost GPU driver.
>>
>> The patch set is based on linux-next tag next-20200508.
> 
> Do you think it is possible to respin against linux-pm next ?

Yes, I will do it and send the v8.

> 
> I wanted to try the series but I'm getting non trivial conflicts with
> the devfreq_cooling changes
> 
> 

Let me take care of this.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
