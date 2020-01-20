Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BD7C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 15:37:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00FBD21D7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 15:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SFWNBv3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00FBD21D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P2bV8js45LvlefbAfeJvXGkQDsNmaEQSTyzEHxhbbfg=; b=SFWNBv3AAyYwa+/zqfqV70C2v
	lTJTTFM/oHwk8WWsbYZnyQMmWhMMcZi1SLE3/j+8uMzNDkA/EHx5q9cYbkJEnrygIJInpyUfoJ4IB
	hl8efDXtqemf8sEUF1fkD3cGRnzoi2M1hQXDaETh7Q2RfPm7bFqkw3UIx42h5iGUK9wCvJdw+DX7K
	WrGNXyH1gGZqLK1jrSmcf5yDlNie5vhdGPWHWPcGvJ5R02mX3St70EiS6YfLrJjiosnOhcXk+uneZ
	bbVWsSAkrfe46OhNoGOO2Sk23OalchDmLEHWRte88MBtcBtST9dAD+M2k0NjWxbBoRTmgXFuM4m1I
	CFMyqFiNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itZ79-0000g8-UR; Mon, 20 Jan 2020 15:37:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itZ6p-0000UR-DU; Mon, 20 Jan 2020 15:37:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBC2830E;
 Mon, 20 Jan 2020 07:36:58 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 024BF3F52E;
 Mon, 20 Jan 2020 07:36:48 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
 <d0b90b97-3604-d4f4-b873-3879a9221532@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <38307e88-f7ff-bc2a-bbce-5e508e275526@arm.com>
Date: Mon, 20 Jan 2020 15:36:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d0b90b97-3604-d4f4-b873-3879a9221532@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_073659_500469_657148B1 
X-CRM114-Status: GOOD (  12.46  )
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
 viresh.kumar@linaro.org, bjorn.andersson@linaro.org, bsegall@google.com,
 festevam@gmail.com, Morten.Rasmussen@arm.com, robh@kernel.org,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 shawnguo@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 1/20/20 3:11 PM, Dietmar Eggemann wrote:
> On 20/01/2020 15:53, Dietmar Eggemann wrote:
>> On 16/01/2020 16:20, lukasz.luba@arm.com wrote:
>>> From: Lukasz Luba <lukasz.luba@arm.com>
> 
> [...]
> 
>>> +enum em_type {
>>> +	EM_SIMPLE,
>>> +	EM_CPU,
>>> +};
>>
>> s/EM_SIMPLE/EM_DEV ?
>>
>> Right now I only see energy models and _one_ specific type (the CPU EM).
>> So a tag 'is a CPU EM' would suffice. No need for EM_SIMPE ...
> 
> Wait, you even have
> 
> struct em_device {
>          struct em_perf_domain *em_pd;
>          struct device *dev;
>          ...
> }
> 
> static bool _is_cpu_device(struct device *dev)
> 
> Shouldn't this be enough to distinguish between EM and special CPU EM
> under the API? Even when required to use container_of() to get from
> em_perf_domain to device.
> 

Agree, I will remove this em_type related code.

Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
