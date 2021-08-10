Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF52EC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 10:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E5D26101E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 10:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E5D26101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LqVMTYDX82khY52yNMKd+J6x0nuqaMidap4dfZJlDU=; b=KSLsczOCNE9DS7zOcUBb7H6BJJ
	OZi0W3pZmv+WVFCqLyfi5fe5uNU0bwgk2S19znjNtlLO2ZFaXT1LnkLpflDfncGPWtguwUGoFshTW
	xp41Mtmv+abZYq2DVbPcccxzsoj3zLBhJc3koD23G+NoJQUUdtt+slXY1rG94rW7w4xewuOJFWKle
	HdRT5GgNrEUOTA6uOjZCyB1lpPKuS2UOetzXY2VjCbREInfDGsRH16BszSokE4X8NreeP5SuCdXnu
	CZM1wnzZs+TWAAibIleiriTSiOKRYwEWG+2bK6L5CvX5veLcokSqFuskTNYNbKgIjYCNTvQyJqS7u
	rok7QxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDOsg-003UbF-98; Tue, 10 Aug 2021 10:21:10 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDOsU-003UYi-7I; Tue, 10 Aug 2021 10:20:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD9C76D;
 Tue, 10 Aug 2021 03:20:56 -0700 (PDT)
Received: from [10.57.9.181] (unknown [10.57.9.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC5D73F70D;
 Tue, 10 Aug 2021 03:20:54 -0700 (PDT)
Subject: Re: [PATCH 4/8] cpufreq: mediatek: Use auto-registration for energy
 model
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <fe10f291210bfd16620f4be766e6647c8e577995.1628579170.git.viresh.kumar@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <12fc1e9d-bb74-63c2-7905-c0917df1cf5b@arm.com>
Date: Tue, 10 Aug 2021 11:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fe10f291210bfd16620f4be766e6647c8e577995.1628579170.git.viresh.kumar@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_032058_365173_FC4481EC 
X-CRM114-Status: GOOD (  19.24  )
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



On 8/10/21 8:36 AM, Viresh Kumar wrote:
> Use the CPUFREQ_REGISTER_WITH_EM flag to allow cpufreq core to
> automatically register with the energy model.
> 
> This allows removal of boiler plate code from the driver and fixes the
> unregistration part as well.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 87019d5a9547..4743f2e58b97 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -448,8 +448,6 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
>   	policy->driver_data = info;
>   	policy->clk = info->cpu_clk;
>   
> -	dev_pm_opp_of_register_em(info->cpu_dev, policy->cpus);
> -
>   	return 0;
>   }
>   
> @@ -465,7 +463,8 @@ static int mtk_cpufreq_exit(struct cpufreq_policy *policy)
>   static struct cpufreq_driver mtk_cpufreq_driver = {
>   	.flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>   		 CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
> -		 CPUFREQ_IS_COOLING_DEV,
> +		 CPUFREQ_IS_COOLING_DEV |
> +		 CPUFREQ_REGISTER_WITH_EM,
>   	.verify = cpufreq_generic_frequency_table_verify,
>   	.target_index = mtk_cpufreq_set_target,
>   	.get = cpufreq_generic_get,
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
