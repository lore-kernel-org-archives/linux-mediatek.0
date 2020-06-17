Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3CCC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 09:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A2F2078D
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 09:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObKzRgfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92A2F2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=737eNZkuIjDcJB6hpkGRwyWvNoTcjA2389J22hJM0zM=; b=ObKzRgfOnfWAjhIQvB2TAMj2A
	ef9bMX0vuZrH5dh8RpyA9ql/+N2DFhuHl9ZkAXAGf/GaZWvxJ1hulsFyCL7iKuHcS9h7W+21IeDyW
	q8KbMxNI5dcw8YSycgvVsZ4DixE9QfuuMyM9ETqkLoH8YpEW6oPOAVXK3x1DrNJKdRbZ2z0bnTvTp
	aow5RVJyUuOuDePEzVRfbSr6jcv3Q7DScBjEqWNYH4x3AT7iukT6lyUw74Dv7CMXcxoowan7/l26m
	Iyz0t0ZAO/U1dnA+qJMWjMBX6ZTZzR5Arxl8xhy1I1V3xPS+bEkVUQ+GNasHnGegmaUhneecSJMCB
	izGqJX6Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlUCm-0005SY-M8; Wed, 17 Jun 2020 09:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlUCS-0005Aa-5S; Wed, 17 Jun 2020 09:17:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C70BF31B;
 Wed, 17 Jun 2020 02:17:37 -0700 (PDT)
Received: from [10.37.12.67] (unknown [10.37.12.67])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFD4A3F6CF;
 Wed, 17 Jun 2020 02:17:27 -0700 (PDT)
Subject: Re: [PATCH v8 0/8] Add support for devices in the Energy Model
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <8fca24a1-93f7-f859-bd1f-b7bf484737f4@arm.com>
 <CAJZ5v0g5whSUMkd4majCGj0j9TMeO+fCfhxB6FNWoaLpPsi6UA@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <b5811d8d-b658-40b9-acaf-6afe3cf167b7@arm.com>
Date: Wed, 17 Jun 2020 10:17:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0g5whSUMkd4majCGj0j9TMeO+fCfhxB6FNWoaLpPsi6UA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_021740_317608_D93283DD 
X-CRM114-Status: GOOD (  19.89  )
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

Hi Rafael,

On 5/29/20 5:18 PM, Rafael J. Wysocki wrote:
> On Fri, May 29, 2020 at 5:01 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Hi Rafael,
>>
>>
>> On 5/27/20 10:58 AM, Lukasz Luba wrote:
>>> Hi all,
>>>
>>> Background of this version:
>>> This is the v8 of the patch set and is has smaller scope. I had to split
>>> the series into two: EM changes and thermal changes due to devfreq
>>> dependencies. The patches from v7 9-14 which change devfreq cooling are
>>> going to be sent in separate patch series, just after this set get merged
>>> into mainline. These patches related to EM got acks and hopefully can go
>>> through linux-pm tree. The later thermal patches will go through thermal
>>> tree.
>>>
>>> The idea and purpose of the Energy Model framework changes:
>>> This patch set introduces support for devices in the Energy Model (EM)
>>> framework. It will unify the power model for thermal subsystem. It will
>>> make simpler to add support for new devices willing to use more
>>> advanced features (like Intelligent Power Allocation). Now it should
>>> require less knowledge and effort for driver developer to add e.g.
>>> GPU driver with simple energy model. A more sophisticated energy model
>>> in the thermal framework is also possible, driver needs to provide
>>> a dedicated callback function. More information can be found in the
>>> updated documentation file.
>>>
>>> First 7 patches are refactoring Energy Model framework to add support
>>> of other devices that CPUs. They change:
>>> - naming convention from 'capacity' to 'performance' state,
>>> - API arguments adding device pointer and not rely only on cpumask,
>>> - change naming when 'cpu' was used, now it's a 'device'
>>> - internal structure to maintain registered devices
>>> - update users to the new API
>>> Patch 8 updates OPP framework helper function to be more generic, not
>>> CPU specific.
>>>
>>> The patch set is based on linux-pm branch linux-next 813946019dfd.
>>>
>>
>> Could you take the patch set via your linux-pm?
> 
> I can do that, but I didn't realize that it was targeted at me, so I
> need some more time to review the patches.
> 
> Thanks!
> 

Gentle ping.
I've resend the patch 4/8 [1] which addresses your comments and
a comment regarding static analyzes conducted by Dan [2].

Do you need more time for this patch set? Maybe you would like
me to help you with rebasing this series? Then please point me
to the desired branch, I am happy to do this.

Regards,
Lukasz

[1] https://lore.kernel.org/lkml/20200610101223.7152-1-lukasz.luba@arm.com/
[2] 
https://lore.kernel.org/lkml/da0debe1-73da-33f1-c24e-154c2123c522@arm.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
