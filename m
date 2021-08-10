Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96F2C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 09:19:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76E9C6056B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 09:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76E9C6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ2SnXjyiT1zAP3ikS9E/IMjzGxhF96Un/iQcheOZe0=; b=cfAS4h/du/bxDuFNrqsYrR0om6
	QRufqBBGUdMB1WUswV8AaPKOLdCqsXR2SCYDtgpIiNCSWEd5EyhYR0t1mYiT1eDcSWlxYpbvfiQ5m
	des60P+nDOv2Wv+hYg94VVJzW6H8tKqOLWu5YJ5G4ChRCgyQxA7bG5VM+Ee7Dz+yp/RXyOrfsWmm+
	V61pQLSyikEpTQVXNigBsVA1hZryQcdnUcU5sFjr+DlcmtHFr7oGKNkt1/969L2e/c+w5w8UY6fnm
	xM/u+N04COTHuDeKkBL2v4p6Cq31pORDUBF9BeFLaMV85AZLnkgDuDacIaEXJdhAQPiPVKn055jsO
	GBcvSC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNuS-003F3A-Cu; Tue, 10 Aug 2021 09:18:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNth-003EnZ-Ff; Tue, 10 Aug 2021 09:18:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78AA6D6E;
 Tue, 10 Aug 2021 02:18:04 -0700 (PDT)
Received: from [10.57.9.181] (unknown [10.57.9.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC2E23F718;
 Tue, 10 Aug 2021 02:17:59 -0700 (PDT)
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
To: Viresh Kumar <viresh.kumar@linaro.org>, Andy Gross <agross@kernel.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
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
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <6449a61f-a5fc-0b81-65b2-7bf77b8a71aa@arm.com>
Date: Tue, 10 Aug 2021 10:17:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1628579170.git.viresh.kumar@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_021809_628618_CFAD9CFA 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Viresh,

I like the idea, only small comments here in the cover letter.

On 8/10/21 8:36 AM, Viresh Kumar wrote:
> Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
> with the EM core on their behalf. This allows us to get rid of duplicated code
> in the drivers and fix the unregistration part as well, which none of the
> drivers have done until now.

The EM is never freed for CPUs by design. The unregister function was
introduced for devfreq devices.

> 
> This would also make the registration with EM core to happen only after policy
> is fully initialized, and the EM core can do other stuff from in there, like
> marking frequencies as inefficient (WIP). Though this patchset is useful without
> that work being done and should be merged nevertheless.
> 
> This doesn't update scmi cpufreq driver for now as it is a special case and need
> to be handled differently. Though we can make it work with this if required.

The scmi cpufreq driver uses direct EM API, which provides flexibility
and should stay as is.

Let me review the patches.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
