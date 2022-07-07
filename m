Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4CEC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvY7srQ/LIkAuXQ+h5XZf30EwRZQgjiO+d/pVoZwROw=; b=tZBHJ3exAAL7GDMXPeFN2+m9bF
	N+iJ72zGkD7mOyHqSKa14iMCyYgHyboMRQzZpz6wYKYQAxAP5dG1o4o5tAME4zlJyQ4AwveGMtoWD
	rthGbyI4Y7yh4VNpZ2+zETS/OujWVqFCu0eBoXxBWkvNihIC6gUxB9No75ZCnyDGbDJwiR9SA3UeC
	h0afDz2QIhRebSgzKyHyI0lG9nnPHn/KUizvGXYT3unLaXRqgInZlUb63f0ztGalrs8gZ8yOu/4Du
	rkVEkGk1VsBwzh2YeZskUgbwPVKJKRHDmVNvnXGRFBl5P1xVZ/B2xoTUGaJXLZP7U2Dw1GuTNKn3R
	qVUSgDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P9B-00Fgev-1x; Thu, 07 Jul 2022 10:54:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P8u-00FgWF-FG; Thu, 07 Jul 2022 10:53:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C2E41063;
	Thu,  7 Jul 2022 03:53:55 -0700 (PDT)
Received: from [10.57.11.194] (unknown [10.57.11.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1918F3F66F;
	Thu,  7 Jul 2022 03:53:51 -0700 (PDT)
Message-ID: <85d48b3c-2c13-f0b9-900a-b67471948b38@arm.com>
Date: Thu, 7 Jul 2022 11:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/4] PM: EM: convert power field to micro-Watts
 precision and align drivers
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
 rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20220707071555.10085-1-lukasz.luba@arm.com>
 <20220707071555.10085-2-lukasz.luba@arm.com>
 <20220707105307.wl2pnqbf3j4fo75z@vireshk-i7>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20220707105307.wl2pnqbf3j4fo75z@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_035356_613583_9ECC0B09 
X-CRM114-Status: GOOD (  14.24  )
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



On 7/7/22 11:53, Viresh Kumar wrote:
> On 07-07-22, 08:15, Lukasz Luba wrote:
>> The milli-Watts precision causes rounding errors while calculating
>> efficiency cost for each OPP. This is especially visible in the 'simple'
>> Energy Model (EM), where the power for each OPP is provided from OPP
>> framework. This can cause some OPPs to be marked inefficient, while
>> using micro-Watts precision that might not happen.
>>
>> Update all EM users which access 'power' field and assume the value is
>> in milli-Watts.
>>
>> Solve also an issue with potential overflow in calculation of energy
>> estimation on 32bit machine. It's needed now since the power value
>> (thus the 'cost' as well) are higher.
>>
>> Example calculation which shows the rounding error and impact:
>>
>> power = 'dyn-power-coeff' * volt_mV * volt_mV * freq_MHz
>>
>> power_a_uW = (100 * 600mW * 600mW * 500MHz) / 10^6 = 18000
>> power_a_mW = (100 * 600mW * 600mW * 500MHz) / 10^9 = 18
>>
>> power_b_uW = (100 * 605mW * 605mW * 600MHz) / 10^6 = 21961
>> power_b_mW = (100 * 605mW * 605mW * 600MHz) / 10^9 = 21
>>
>> max_freq = 2000MHz
>>
>> cost_a_mW = 18 * 2000MHz/500MHz = 72
>> cost_a_uW = 18000 * 2000MHz/500MHz = 72000
>>
>> cost_b_mW = 21 * 2000MHz/600MHz = 70 // <- artificially better
>> cost_b_uW = 21961 * 2000MHz/600MHz = 73203
>>
>> The 'cost_b_mW' (which is based on old milli-Watts) is misleadingly
>> better that the 'cost_b_uW' (this patch uses micro-Watts) and such
>> would have impact on the 'inefficient OPPs' information in the Cpufreq
>> framework. This patch set removes the rounding issue.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>   drivers/cpufreq/mediatek-cpufreq-hw.c |  7 ++--
>>   drivers/cpufreq/scmi-cpufreq.c        |  6 +++
>>   drivers/opp/of.c                      | 15 ++++----
>>   drivers/powercap/dtpm_cpu.c           |  5 +--
>>   drivers/thermal/cpufreq_cooling.c     | 13 ++++++-
>>   drivers/thermal/devfreq_cooling.c     | 19 ++++++++--
>>   include/linux/energy_model.h          | 54 +++++++++++++++++++--------
>>   kernel/power/energy_model.c           | 24 ++++++++----
>>   8 files changed, 100 insertions(+), 43 deletions(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 

Thank you Viresh for the ACKs!

