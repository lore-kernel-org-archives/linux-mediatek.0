Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mG2iQyClcaQUu/TiKUW8Jx3wl//NeJf/kEa7Owz0XNg=; b=Z2/7TDXj9Vlvxv7shzf81Y/Tyt
	clsEldNyb5qun5s+UCwvxCQGXdcfl443fovfWYS41LtgP+ev2kPd9Eu7zmTd0z+cS8frMyYvOXq05
	Jwg9P02awTfDaQDo1oLh1Opo6gDbveWI8QJifYkNI1SFrO3SxRqMvW52YLdl8QqwuUeZCxrPP+d/1
	RhrG0VJrs5T5/pQuGzSrCAKcppJye7Cyn3J+cLCMTS1hJ2JiCEftlHBoeU8NJc0ZU5QKFhAFz3Czg
	Ek5DNjT/C7qTlqE3Ql30wD/eHHmPjLkZU0AqLxiQAuKQPt/E9G5pgWiSlbTmf9Mxj763uNvQTRdOE
	1a3hjfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UOh-00Aojn-FG; Wed, 29 Jun 2022 09:54:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UKL-00AmiA-40; Wed, 29 Jun 2022 09:49:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C684F152B;
	Wed, 29 Jun 2022 02:49:37 -0700 (PDT)
Received: from [192.168.33.8] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C25B3F792;
	Wed, 29 Jun 2022 02:49:35 -0700 (PDT)
Message-ID: <be793e51-0d89-7afd-e122-ec929a1130e9@arm.com>
Date: Wed, 29 Jun 2022 10:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] Energy Model power in micro-Watts and SCMI v3.1
 alignment
Content-Language: en-US
To: linux-pm@vger.kernel.org
Cc: daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
 viresh.kumar@linaro.org, rafael@kernel.org, dietmar.eggemann@arm.com,
 nm@ti.com, sboyd@kernel.org, sudeep.holla@arm.com, cristian.marussi@arm.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220622145802.13032-1-lukasz.luba@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20220622145802.13032-1-lukasz.luba@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_024941_262131_59D0A4E9 
X-CRM114-Status: GOOD (  14.99  )
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

Hi guys,

Are there any objections to these patches?


On 6/22/22 15:57, Lukasz Luba wrote:
> Hi all,
> 
> This is a patch set which changes Energy Model power values scale to
> micro-Watts. It also upgrades the SCMI performance layer + scmi-cpufreq
> driver to leverage the SCMI v3.1 spec and process micro-Watts power values
> coming from FW. The higher precision in EM power field solves an issue
> of a rounding error, which then can be misinterpreted as 'inefficient OPP'.
> An example rounding issue calculation is present in patch 1/4 description.
> 
> Regards,
> Lukasz Luba
> 
> Lukasz Luba (4):
>    PM: EM: convert power field to micro-Watts precision and align drivers
>    Documentation: EM: Switch to micro-Watts scale
>    firmware: arm_scmi: Get detailed power scale from perf
>    cpufreq: scmi: Support the power scale in micro-Watts in SCMI v3.1
> 
>   Documentation/power/energy-model.rst  | 14 +++---
>   drivers/cpufreq/mediatek-cpufreq-hw.c |  7 +--
>   drivers/cpufreq/scmi-cpufreq.c        | 15 ++++++-
>   drivers/firmware/arm_scmi/perf.c      | 18 +++++---
>   drivers/opp/of.c                      | 15 ++++---
>   drivers/powercap/dtpm_cpu.c           |  5 +--
>   drivers/thermal/cpufreq_cooling.c     | 13 +++++-
>   drivers/thermal/devfreq_cooling.c     | 19 ++++++--
>   include/linux/energy_model.h          | 63 ++++++++++++++++++++-------
>   include/linux/scmi_protocol.h         |  8 +++-
>   kernel/power/energy_model.c           | 31 ++++++++-----
>   11 files changed, 146 insertions(+), 62 deletions(-)
> 


I would like to move forward with the micro-Watts in
the Energy Model. We have feedback from our partners
that this is a limitation. Also, as you can see
this uW is part of the new SCMI spec, which we
have support on our roadmap.

Regards,
Lukasz

