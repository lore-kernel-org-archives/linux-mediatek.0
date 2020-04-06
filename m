Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB70FC2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 13:35:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB07920CC7
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 13:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehmK+oRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB07920CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eLX8C4gr++LNi2+MGyM+1IQS/n6vfWYLJmXHdnMb0Gk=; b=ehmK+oRDvyqHpw+SvioxlLxoZ
	XDK4qZB08ijGKoMCDZhLaFrQPd7Uph/7rF05sD0GFppMUm6JavX+Pwg//DB8MGrNpYBSF1UPDSt/E
	RaO7mH0L31HYtuEStLGJo6NN1eRsPHgu5WjpO58oiTiSfUdFpzZjkfI+9TBIwZft4gw3wzs19uyE0
	OWRhAY7SoOQnNeWJl6sqAX3GACb6VEPCiE6hOabQsA5GgnU0ZtecphvnL+ll6r5eFtcEUYgAD3K2Y
	qy0HlxJpiY/v9+gcoQckf8xhzgkQfkqMIIEnt3eUU0fMSVK+kCLPYXGXqH3LkJyMaZsseQiyOrWyM
	56L7oYYwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLRuQ-000627-VI; Mon, 06 Apr 2020 13:35:26 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLRuI-0005ui-Qc; Mon, 06 Apr 2020 13:35:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEA2F7FA;
 Mon,  6 Apr 2020 06:35:17 -0700 (PDT)
Received: from [10.37.12.4] (unknown [10.37.12.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8230E3F52E;
 Mon,  6 Apr 2020 06:35:07 -0700 (PDT)
Subject: Re: [PATCH v5 4/5] thermal: devfreq_cooling: Refactor code and switch
 to use Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-5-lukasz.luba@arm.com>
 <f3e9f127-47b1-9f30-2148-3c95a5933a92@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <4bf6cc66-8df4-3224-418d-0549026a3672@arm.com>
Date: Mon, 6 Apr 2020 14:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f3e9f127-47b1-9f30-2148-3c95a5933a92@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_063519_204498_C7B2173C 
X-CRM114-Status: GOOD (  18.14  )
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
 bsegall@google.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 4/3/20 6:44 PM, Daniel Lezcano wrote:
> On 18/03/2020 12:45, Lukasz Luba wrote:
>> The overhauled Energy Model (EM) framework support also devfreq devices.
>> The unified API interface of the EM can be used in the thermal subsystem to
>> not duplicate code. The power table now is taken from EM structure and
>> there is no need to maintain calculation for it locally. In case when the
>> EM is not provided by the device a simple interface for cooling device is
>> used.
>>
>> There is also an improvement in code related to enabling/disabling OPPs,
>> which prevents from race condition with devfreq governors.
>>
>> [lkp: Reported the build warning]
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org> # for tracing code
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> 
> The changes are too big, please split this patch into smaller chunks.

OK, I will split it and re-base on top of thermal testing.

> 
>> ---
>>   drivers/thermal/devfreq_cooling.c | 474 ++++++++++++++++--------------
>>   include/linux/devfreq_cooling.h   |  39 +--
>>   include/trace/events/thermal.h    |  19 +-
>>   3 files changed, 277 insertions(+), 255 deletions(-)
>>
>> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
> 
> [ ... ]
> 
>>   struct devfreq_cooling_device {
>>   	int id;
>>   	struct thermal_cooling_device *cdev;
>>   	struct devfreq *devfreq;
>>   	unsigned long cooling_state;
>> -	u32 *power_table;
>>   	u32 *freq_table;
>> -	size_t freq_table_size;
>> +	size_t max_level;
> 
> Could you rename it to 'max_state' ?

Yes.

Thank you for your comments.

Regards,
Lukasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
