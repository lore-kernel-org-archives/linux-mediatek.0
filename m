Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE896C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:31:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA02A2224A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fsa5QnpZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sqx+Iw/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA02A2224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Kt9f0ZlgRJHnzqRGp1glYHkJJIvj49xJflYnCVmNOo=; b=Fsa5QnpZmKDNCq4gx1u87Vn+E
	tk5c/I4WBZcs6gNJIP2uX6jIWZMXtXTqOkwZAlW+9boIPl7Aggmt4DP12Aj4nO8Lx7PLmvEX99ZKa
	D8OCctWCsGTL9HM8Wi6X2UgiqUKMyWyN4MnyX2ymuXVHrGIEyxLtaUGrfkc8vHc/n5bM3nguQDp+S
	t2Efos5sN1F2UyL3ua77oGWSqe76D6fYGQBVVvO8RpE0rJCiHjnV+E/lvTmGwm/chZlnsUGm50Kxm
	IMufjRMpAL4BUSDQMH6dE8O2dBVAGU+Iy2aGcOyjNBYsaZDdvxNa3N5yQ5pv0zS165YQmjU6uE9yT
	4dGshyNIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQk4E-0007LH-10; Fri, 09 Oct 2020 04:31:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQk49-0007Jg-33; Fri, 09 Oct 2020 04:31:40 +0000
X-UUID: 800186016c4e4d7081c0492b69e8c3d2-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YP+nDNjrZMZWHXp2PpX7EfCVxiPYWns32R0xLk03Kyw=; 
 b=sqx+Iw/ijllUffeErGZwKK0JKx8rSJKwuVMUh5tN3pIQl4t8VyaT9YJbPD1icNOaR2qiKxGALsu5tfBYEQaj1ZjSttFp26Vwq7r+Fzwq7I6i95DuuV+zCHnbQzN1y86Mm4Vq7mOGsQ39r2vverEeEn9ojkhosMB4EJ0DnJJQsPs=;
X-UUID: 800186016c4e4d7081c0492b69e8c3d2-20201008
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1616317892; Thu, 08 Oct 2020 20:31:29 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 21:31:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Oct 2020 12:31:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Oct 2020 12:31:25 +0800
Message-ID: <1602217886.21446.48.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] cpufreq: mediatek-hw: Register EM power table
From: Hector Yuan <hector.yuan@mediatek.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Date: Fri, 9 Oct 2020 12:31:26 +0800
In-Reply-To: <7e58516f-a6bf-eac4-9dfb-9a4d7efa7498@arm.com>
References: <1602159204-13756-1-git-send-email-hector.yuan@mediatek.com>
 <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
 <7e58516f-a6bf-eac4-9dfb-9a4d7efa7498@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_003137_939213_F2B6D132 
X-CRM114-Status: GOOD (  26.02  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-10-08 at 13:55 +0100, Lukasz Luba wrote:
> Hi Hector,
> 
> On 10/8/20 1:13 PM, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Register CPU power table to energy model framework
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq-hw.c |   50 +++++++++++++++++++++++++--------
> >   1 file changed, 38 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> > index 8fa12e5..3808ea0 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> > @@ -5,6 +5,7 @@
> >   
> >   #include <linux/bitfield.h>
> >   #include <linux/cpufreq.h>
> > +#include <linux/energy_model.h>
> >   #include <linux/init.h>
> >   #include <linux/kernel.h>
> >   #include <linux/module.h>
> > @@ -17,9 +18,10 @@
> >   #define LUT_ROW_SIZE			0x4
> >   
> >   enum {
> > -	REG_LUT_TABLE,
> > -	REG_ENABLE,
> > -	REG_PERF_STATE,
> > +	REG_FREQ_LUT_TABLE,
> > +	REG_FREQ_ENABLE,
> > +	REG_FREQ_PERF_STATE,
> > +	REG_EM_POWER_TBL,
> >   
> >   	REG_ARRAY_SIZE,
> >   };
> > @@ -27,23 +29,44 @@ enum {
> >   struct cpufreq_mtk {
> >   	struct cpufreq_frequency_table *table;
> >   	void __iomem *reg_bases[REG_ARRAY_SIZE];
> > +	int nr_opp;
> >   	cpumask_t related_cpus;
> >   };
> >   
> >   static const u16 cpufreq_mtk_offsets[REG_ARRAY_SIZE] = {
> > -	[REG_LUT_TABLE]		= 0x0,
> > -	[REG_ENABLE]		= 0x84,
> > -	[REG_PERF_STATE]	= 0x88,
> > +	[REG_FREQ_LUT_TABLE]	= 0x0,
> > +	[REG_FREQ_ENABLE]	= 0x84,
> > +	[REG_FREQ_PERF_STATE]	= 0x88,
> > +	[REG_EM_POWER_TBL]	= 0x3D0,
> >   };
> >   
> >   static struct cpufreq_mtk *mtk_freq_domain_map[NR_CPUS];
> >   
> > +static int mtk_cpufreq_get_cpu_power(unsigned long *mW,
> > +				     unsigned long *KHz, int cpu)
> > +{
> > +	struct cpufreq_mtk *c = mtk_freq_domain_map[cpu];
> > +	int i;
> > +
> > +	for (i = 0; i < c->nr_opp; i++) {
> > +		if (c->table[i].frequency < *KHz)
> > +			break;
> > +	}
> > +	i--;
> > +
> > +	*KHz = c->table[i].frequency;
> > +	*mW = readl_relaxed(c->reg_bases[REG_EM_POWER_TBL] +
> > +			    i * LUT_ROW_SIZE) / 1000;
> > +
> > +	return 0;
> > +}
> > +
> >   static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
> >   				       unsigned int index)
> >   {
> >   	struct cpufreq_mtk *c = policy->driver_data;
> >   
> > -	writel_relaxed(index, c->reg_bases[REG_PERF_STATE]);
> > +	writel_relaxed(index, c->reg_bases[REG_FREQ_PERF_STATE]);
> >   
> >   	return 0;
> >   }
> > @@ -55,7 +78,7 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
> >   
> >   	c = mtk_freq_domain_map[cpu];
> >   
> > -	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
> > +	index = readl_relaxed(c->reg_bases[REG_FREQ_PERF_STATE]);
> >   	index = min(index, LUT_MAX_ENTRIES - 1);
> >   
> >   	return c->table[index].frequency;
> > @@ -64,6 +87,7 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
> >   static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
> >   {
> >   	struct cpufreq_mtk *c;
> > +	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
> >   
> >   	c = mtk_freq_domain_map[policy->cpu];
> >   	if (!c) {
> > @@ -77,7 +101,8 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
> >   	policy->driver_data = c;
> >   
> >   	/* HW should be in enabled state to proceed now */
> > -	writel_relaxed(0x1, c->reg_bases[REG_ENABLE]);
> > +	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
> > +	em_register_perf_domain(policy->cpus, c->nr_opp, &em_cb);
> 
> 
> The function name has changed recently (v5.9-rc1) to:
> em_dev_register_perf_domain()
> 
> Please check your base kernel tree and update.
> 
> Regards,
> Lukasz
> 
OK, will check my base kernel and update this.
Thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
