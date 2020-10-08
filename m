Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B002AC04EBE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 12:55:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41168207DE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 12:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3I9WVHnb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41168207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4GSEA/R/zaWPnUh0Hoa9dCG7xl50G+aK/X+yPT1u6rM=; b=3I9WVHnbN4V/kjG+UpKLQIxLt
	u+CXSfbnD5n1dDCnJl9ntdwZXdSngi+LFlSoRC/3Ym2MzHQxVDDC0ZcUBKWBBwW3AEi2JnlOVtTkV
	XE8lRiaZkfIflQXb555D1ZtGpIcnZlnNJpeGU7L5wZlNBT8gz+P04wsK4NE2asCqXoZ29CqGd0nwV
	Q9s5XC567/NHjtkIXmbT+ZIRAP3GSgyb7ae9echtQ4I511ZXrRpREqngParG+kQXP0SUcDg8kx/OZ
	KTYk5oQ9CyoimO8jgzP8zluEaCNgb6nTY5EgUM4D+3w6qia/oK2RgRvLcr+xCCejgoaIgPj6rntLL
	ibLSmVhkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQVSF-0006HP-SO; Thu, 08 Oct 2020 12:55:32 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQVSB-0006GJ-F1; Thu, 08 Oct 2020 12:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD6BD1063;
 Thu,  8 Oct 2020 05:55:22 -0700 (PDT)
Received: from [10.57.48.204] (unknown [10.57.48.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB7043F71F;
 Thu,  8 Oct 2020 05:55:20 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] cpufreq: mediatek-hw: Register EM power table
To: Hector Yuan <hector.yuan@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <1602159204-13756-1-git-send-email-hector.yuan@mediatek.com>
 <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <7e58516f-a6bf-eac4-9dfb-9a4d7efa7498@arm.com>
Date: Thu, 8 Oct 2020 13:55:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_085527_637342_3B4EE6A7 
X-CRM114-Status: GOOD (  25.67  )
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
Cc: linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hector,

On 10/8/20 1:13 PM, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Register CPU power table to energy model framework
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq-hw.c |   50 +++++++++++++++++++++++++--------
>   1 file changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 8fa12e5..3808ea0 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/bitfield.h>
>   #include <linux/cpufreq.h>
> +#include <linux/energy_model.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> @@ -17,9 +18,10 @@
>   #define LUT_ROW_SIZE			0x4
>   
>   enum {
> -	REG_LUT_TABLE,
> -	REG_ENABLE,
> -	REG_PERF_STATE,
> +	REG_FREQ_LUT_TABLE,
> +	REG_FREQ_ENABLE,
> +	REG_FREQ_PERF_STATE,
> +	REG_EM_POWER_TBL,
>   
>   	REG_ARRAY_SIZE,
>   };
> @@ -27,23 +29,44 @@ enum {
>   struct cpufreq_mtk {
>   	struct cpufreq_frequency_table *table;
>   	void __iomem *reg_bases[REG_ARRAY_SIZE];
> +	int nr_opp;
>   	cpumask_t related_cpus;
>   };
>   
>   static const u16 cpufreq_mtk_offsets[REG_ARRAY_SIZE] = {
> -	[REG_LUT_TABLE]		= 0x0,
> -	[REG_ENABLE]		= 0x84,
> -	[REG_PERF_STATE]	= 0x88,
> +	[REG_FREQ_LUT_TABLE]	= 0x0,
> +	[REG_FREQ_ENABLE]	= 0x84,
> +	[REG_FREQ_PERF_STATE]	= 0x88,
> +	[REG_EM_POWER_TBL]	= 0x3D0,
>   };
>   
>   static struct cpufreq_mtk *mtk_freq_domain_map[NR_CPUS];
>   
> +static int mtk_cpufreq_get_cpu_power(unsigned long *mW,
> +				     unsigned long *KHz, int cpu)
> +{
> +	struct cpufreq_mtk *c = mtk_freq_domain_map[cpu];
> +	int i;
> +
> +	for (i = 0; i < c->nr_opp; i++) {
> +		if (c->table[i].frequency < *KHz)
> +			break;
> +	}
> +	i--;
> +
> +	*KHz = c->table[i].frequency;
> +	*mW = readl_relaxed(c->reg_bases[REG_EM_POWER_TBL] +
> +			    i * LUT_ROW_SIZE) / 1000;
> +
> +	return 0;
> +}
> +
>   static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
>   				       unsigned int index)
>   {
>   	struct cpufreq_mtk *c = policy->driver_data;
>   
> -	writel_relaxed(index, c->reg_bases[REG_PERF_STATE]);
> +	writel_relaxed(index, c->reg_bases[REG_FREQ_PERF_STATE]);
>   
>   	return 0;
>   }
> @@ -55,7 +78,7 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
>   
>   	c = mtk_freq_domain_map[cpu];
>   
> -	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
> +	index = readl_relaxed(c->reg_bases[REG_FREQ_PERF_STATE]);
>   	index = min(index, LUT_MAX_ENTRIES - 1);
>   
>   	return c->table[index].frequency;
> @@ -64,6 +87,7 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
>   static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   {
>   	struct cpufreq_mtk *c;
> +	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
>   
>   	c = mtk_freq_domain_map[policy->cpu];
>   	if (!c) {
> @@ -77,7 +101,8 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   	policy->driver_data = c;
>   
>   	/* HW should be in enabled state to proceed now */
> -	writel_relaxed(0x1, c->reg_bases[REG_ENABLE]);
> +	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
> +	em_register_perf_domain(policy->cpus, c->nr_opp, &em_cb);


The function name has changed recently (v5.9-rc1) to:
em_dev_register_perf_domain()

Please check your base kernel tree and update.

Regards,
Lukasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
