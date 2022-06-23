Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B22AC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzwXHQqkRfK+C1fCKRfEF4VfpORlNvrus74Gvzg+BHQ=; b=GB68DUVZBN/6IcBxj2qnvzaeiw
	xVW0NkUzJl/GWWGQd1dziscehL/rh1HdvB8zUU2iaAH91EDFeT0vBOH9okdenPu/nrxpoQmu1ycTN
	TKpptr0J0PUg7RIx/dpjq69Wt5lsZFWYVChHcHKYHkGnGzUI3kpadCmDFE7m1tBgrsdBkVC9GoB1P
	0xfT60+6lZPnsKWtgf1Csvbs5MDmbjFPXAdTiGWAOD+Kw2XcK56ii5sdUMpyZXx/k3MX1H9Sw0HAH
	Y4aSxBNekgOXJf2GbCTNhYmpTVPQGM99W/uvW9ht6SirBQhKz6Vv8YwTzPs+0bJsXfL+iciXIk0Qm
	5JKiZEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Hbi-00DwcL-Am; Thu, 23 Jun 2022 07:50:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HbW-00DwXr-Py; Thu, 23 Jun 2022 07:50:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FAD612FC;
	Thu, 23 Jun 2022 00:50:15 -0700 (PDT)
Received: from [192.168.33.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0FFB3F792;
	Thu, 23 Jun 2022 00:50:12 -0700 (PDT)
Message-ID: <e9dc0752-269f-bdfc-1036-17f5bfd95680@arm.com>
Date: Thu, 23 Jun 2022 08:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] firmware: arm_scmi: Get detailed power scale from
 perf
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
 viresh.kumar@linaro.org, rafael@kernel.org, dietmar.eggemann@arm.com,
 nm@ti.com, sboyd@kernel.org, cristian.marussi@arm.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <20220622145802.13032-4-lukasz.luba@arm.com>
 <20220622155322.g2idz2623nxi6mu3@bogus>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20220622155322.g2idz2623nxi6mu3@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_005018_938290_5435FCB3 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/22/22 16:53, Sudeep Holla wrote:
> On Wed, Jun 22, 2022 at 03:58:01PM +0100, Lukasz Luba wrote:
>> In SCMI v3.1 the power scale can be in micro-Watts. The upper layers, e.g.
>> cpufreq and EM should handle received power values properly (upscale when
>> needed). Thus, provide an interface which allows to check what is the
>> scale for power values. The old interface allowed to distinguish between
>> bogo-Watts and milli-Watts only (which was good for older SCMI spec).
>>
> 
> Assuming you will take this as a series,
> 
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> 

Thanks Sudeep for the ACKs!

Regards,
Lukasz

