Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE2EC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 13:26:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC9060EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 13:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CC9060EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8G8RbEldeb2qvyRQwgdDC3OxTDA5viVVErYLnM0z8X4=; b=blF/k+Za9MfBFJANe8qHx+0FBb
	e9pSawIRdwC/El59NPaC8K13MtJjfuU6M5zMD/ehgbe1JIEoD2YZ8AMLAsbi3SE+Ts6eGo2pBftvF
	fiJYGBUzQqGKn7+aBDB1JMXWRW+qAEnhXSpWaxt67oHq9wXUzWQktHG4nE+bJOU4CLAuX+ZCd1vrd
	tjgGCSiDnPMOVSsmwO4kapDYWzHfeYawT1nnQy6pGj4gxDOLecF5shUEk2Ta5DvI/fIcO8oe9OviL
	NqWs7nhyijNqt1+DeDlULK1MfbSIxmh88qboY2oAVkaaO7G/v9xXKuA9Ebmm893OmslfctHyu5P9A
	zcd8h/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDRlT-003xFU-9c; Tue, 10 Aug 2021 13:25:55 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDRkx-003x8T-SC; Tue, 10 Aug 2021 13:25:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 350041FB;
 Tue, 10 Aug 2021 06:25:21 -0700 (PDT)
Received: from [10.57.9.181] (unknown [10.57.9.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EF013F70D;
 Tue, 10 Aug 2021 06:25:16 -0700 (PDT)
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
To: Quentin Perret <qperret@google.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki
 <rjw@rjwysocki.net>, Vincent Donnefort <vincent.donnefort@arm.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Cristian Marussi <cristian.marussi@arm.com>,
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
 <YRJym+Vn4bbwQzzs@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <af06b333-3d8a-807c-9ccb-d491d6a54930@arm.com>
Date: Tue, 10 Aug 2021 14:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YRJym+Vn4bbwQzzs@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_062524_088009_0A69A79E 
X-CRM114-Status: GOOD (  31.94  )
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



On 8/10/21 1:35 PM, Quentin Perret wrote:
> On Tuesday 10 Aug 2021 at 13:06:47 (+0530), Viresh Kumar wrote:
>> Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
>> with the EM core on their behalf.
> 
> Hmm, that's not quite what this does. This asks the cpufreq core to
> use *PM_OPP* to register an EM, which I think is kinda wrong to do from
> there IMO. The decision to use PM_OPP or another mechanism to register
> an EM belongs to platform specific code (drivers), so it is odd for the
> PM_OPP registration to have its own cpufreq flag but not the other ways.
> 
> As mentioned in another thread, the very reason to have PM_EM is to not
> depend on PM_OPP, so I'm worried about the direction of travel with this
> series TBH.
> 
>> This allows us to get rid of duplicated code
>> in the drivers and fix the unregistration part as well, which none of the
>> drivers have done until now.
> 
> This series adds more code than it removes, and the unregistration is
> not a fix as we don't ever remove the EM tables by design, so not sure
> either of these points are valid arguments.
> 
>> This would also make the registration with EM core to happen only after policy
>> is fully initialized, and the EM core can do other stuff from in there, like
>> marking frequencies as inefficient (WIP). Though this patchset is useful without
>> that work being done and should be merged nevertheless.
>>
>> This doesn't update scmi cpufreq driver for now as it is a special case and need
>> to be handled differently. Though we can make it work with this if required.
> 
> Note that we'll have more 'special cases' if other architectures start
> using PM_EM, which is what we have been trying to allow since the
> beginning, so that's worth keeping in mind.
> 

The way I see this is that the flag in cpufreq avoids
mistakes potentially made by driver developer. It will automaticaly
register the *simple* EM model via dev_pm_opp_of_register_em() on behalf
of drivers (which is already done manually by drivers). The developer
would just set the flag similarly to CPUFREQ_IS_COOLING_DEV and be sure
it will register at the right time. Well tested flag approach should be
safer, easier to understand, maintain.

If there is a need for *advanced* EM model, driver developer would
have to care about all these things (order, setup-ready-structures,
fw channels, freeing, etc) while developing custom registration.
The developer won't set this flag in such case, so the core won't
try to auto register the EM for that driver.

I don't see the dependency of PM_EM on PM_OPP in this series.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
