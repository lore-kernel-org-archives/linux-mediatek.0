Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAEDC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veZMjBL6yBrRzz5fX9IZPH7sWzpOMSWEz+3cwGrDGMc=; b=JiMHRZogQ//P77YCd6esYIUz8V
	ol/19Fmxf6i3Hzr9sjlVlAPNxtFFib5XfNQXvl9RItD38qrdK3fdFOyEigfI4yKT6737RZh+gthcs
	MDeEr3L6UxNUFuhJVgl5EIeal1/3+MSJwMlpuQeQnL5UIdonVGpBPWydoBuBVUxamJLhxfg2bMR/f
	pUmlw1UgN9bwFs3bUSayJWP/HQYOURZPiDsYmebG8kJaCtBAH3PQxUsnKP/l8V9WJ/tvuuV61xpui
	0EbDVUrFYmFDvCB/CnEf8etGF4i1US2ViPcAKR8Bsxy3DQDJMATwDdGWA4HhRUL2Tjx9XRwqjGYp8
	7p1/XaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCH8B-005uqL-9a; Fri, 15 Jul 2022 08:57:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCH7z-005unD-Nr; Fri, 15 Jul 2022 08:56:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F79C1474;
	Fri, 15 Jul 2022 01:56:46 -0700 (PDT)
Received: from [10.57.11.112] (unknown [10.57.11.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 428F43F792;
	Fri, 15 Jul 2022 01:56:43 -0700 (PDT)
Message-ID: <c334d692-9787-7591-54d7-f152ecbd559e@arm.com>
Date: Fri, 15 Jul 2022 09:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/4] Energy Model power in micro-Watts and SCMI v3.1
 alignment
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
To: rafael@kernel.org
Cc: daniel.lezcano@linaro.org, amitk@kernel.org, linux-pm@vger.kernel.org,
 rui.zhang@intel.com, viresh.kumar@linaro.org, dietmar.eggemann@arm.com,
 nm@ti.com, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20220707071555.10085-1-lukasz.luba@arm.com>
 <41c333e1-2545-f6be-2db2-9061297d0b9a@arm.com>
In-Reply-To: <41c333e1-2545-f6be-2db2-9061297d0b9a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_015651_861810_D8CBD203 
X-CRM114-Status: GOOD (  16.34  )
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

Hi Rafael,

gentle ping.

On 7/7/22 11:46, Lukasz Luba wrote:
> Hi Rafael,
> 
> On 7/7/22 08:15, Lukasz Luba wrote:
>> Hi all,
>>
>> This is a patch set which changes Energy Model power values scale to
>> micro-Watts. It also upgrades the SCMI performance layer + scmi-cpufreq
>> driver to leverage the SCMI v3.1 spec and process micro-Watts power 
>> values
>> coming from FW. The higher precision in EM power field solves an issue
>> of a rounding error, which then can be misinterpreted as 'inefficient 
>> OPP'.
>> An example rounding issue calculation is present in patch 1/4 
>> description.
>>
>> Changes:
>> v2
>> - simplified 32bit checks for max number of CPUs preventing energy
>>    estimation overflow
>> - added Reviewed-by and ACKs
>> v1 [1]
>>
>> Regards,
>> Lukasz Luba
>>
>> [1] 
>> https://lore.kernel.org/lkml/20220622145802.13032-1-lukasz.luba@arm.com/
>>
>> Lukasz Luba (4):
>>    PM: EM: convert power field to micro-Watts precision and align drivers
>>    Documentation: EM: Switch to micro-Watts scale
>>    firmware: arm_scmi: Get detailed power scale from perf
>>    cpufreq: scmi: Support the power scale in micro-Watts in SCMI v3.1
>>
>>   Documentation/power/energy-model.rst  | 14 +++----
>>   drivers/cpufreq/mediatek-cpufreq-hw.c |  7 ++--
>>   drivers/cpufreq/scmi-cpufreq.c        | 15 +++++++-
>>   drivers/firmware/arm_scmi/perf.c      | 18 +++++----
>>   drivers/opp/of.c                      | 15 ++++----
>>   drivers/powercap/dtpm_cpu.c           |  5 +--
>>   drivers/thermal/cpufreq_cooling.c     | 13 ++++++-
>>   drivers/thermal/devfreq_cooling.c     | 19 ++++++++--
>>   include/linux/energy_model.h          | 54 +++++++++++++++++++--------
>>   include/linux/scmi_protocol.h         |  8 +++-
>>   kernel/power/energy_model.c           | 24 ++++++++----
>>   11 files changed, 132 insertions(+), 60 deletions(-)
>>
> 
> I got ACKs (and on Reviewed-by) for this patch set.
> Could you take this via your PM tree, please?

This patch set is on our roadmap and would be good if it could
go as v5.20 material.

There are Acks for these patch set. If you need some
help with this (like rebasing, etc), just ping me.

Could you take them, please?

Regards,
Lukasz

