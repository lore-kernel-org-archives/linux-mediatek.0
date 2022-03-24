Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvJVTg0THYH9RDAah3qwylTlhEvi0eGgpwnywZIhKMc=; b=u0iTqFpMeye8nJ
	zx1ddCTtJLUuvaZSa0e7M7TEpH2tSegMFvf4wiRdAU8ShBgF9H+udshOr6EMuzK9VdwG5R7llCWzR
	VobKDwhF1Ht5KmU4CMo3t69E56riQBl114TM+0reoYWMebuuMxKRaIIIhtfVNrSE+1GwpC/uZ0n7c
	pl+2fYHkMji7+nLJNfF0BvVjNo3CxOy8xesT1q9Y+rB9R4Xvgar6KO0gGNWTvUwISHXvPdG6NPVY/
	NGx7wtRiq/qUeWi/QozPQAH5ny0MI+WmMxqNIdyGKFElxGMXbtxKZ4QiQMLhoCuHUjrLCsdO59mkV
	F/ObViU217FLMvKbwwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXKD6-00GAqt-6U; Thu, 24 Mar 2022 09:56:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXKCu-00GApp-Mu; Thu, 24 Mar 2022 09:56:42 +0000
X-UUID: a857b9745c464144a69ff5f806db9f20-20220324
X-UUID: a857b9745c464144a69ff5f806db9f20-20220324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1246474646; Thu, 24 Mar 2022 02:56:35 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 02:48:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 17:47:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 17:47:47 +0800
Message-ID: <c3b5fc807465c4ed3b01b518c2582069683f5a13.camel@mediatek.com>
Subject: Re: [PATCH 3/4] cpufreq: mediatek: clean up cpufreq driver
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Thu, 24 Mar 2022 17:47:47 +0800
In-Reply-To: <0fa44005-158b-74ee-f4ff-f2694ffce38a@canonical.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-4-jia-wei.chang@mediatek.com>
 <0fa44005-158b-74ee-f4ff-f2694ffce38a@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_025640_784273_DEFDF2C3 
X-CRM114-Status: GOOD (  28.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-03-07 at 20:02 +0100, Krzysztof Kozlowski wrote:
> On 07/03/2022 13:21, Tim Chang wrote:
> > cleanup of naming, print log and comments.
> > 
> > Signed-off-by: Jia-Wei Chang <
> > jia-wei.chang@mediatek.corp-partner.google.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 487 ++++++++++++++-----------
> > ----
> >  1 file changed, 233 insertions(+), 254 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index 8e9d706d8081..3f00c7eb01f1 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -1,7 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (c) 2015 Linaro Ltd.
> > - * Author: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
> > + * Copyright (C) 2022 MediaTek Inc.
> 
> Removal of authorship and existing copyrights does not fit into
> "clean
> up". Please explain this thoroughly.

This is my mistake.
I will keep it as before and add myself as a new author.

> 
> >   */
> >  
> >  #include <linux/clk.h>
> > @@ -22,7 +21,7 @@
> >  #define VOLT_TOL		(10000)
> >  
> >  /*
> > - * The struct mtk_cpu_dvfs_info holds necessary information for
> > doing CPU DVFS
> > + * The struct mtk_cpufreq_drv holds necessary information for
> > doing CPU DVFS
> >   * on each CPU power/clock domain of Mediatek SoCs. Each CPU
> > cluster in
> >   * Mediatek SoCs has two voltage inputs, Vproc and Vsram. In some
> > cases the two
> >   * voltage inputs need to be controlled under a hardware
> > limitation:
> > @@ -32,7 +31,7 @@
> >   * needs to be switched to another stable PLL clock temporarily
> > until
> >   * the original PLL becomes stable at target frequency.
> >   */
> > -struct mtk_cpu_dvfs_info {
> > +struct mtk_cpufreq_drv {
> >  	struct cpumask cpus;
> >  	struct device *cpu_dev;
> >  	struct regulator *proc_reg;
> > @@ -40,45 +39,45 @@ struct mtk_cpu_dvfs_info {
> >  	struct clk *cpu_clk;
> >  	struct clk *inter_clk;
> >  	struct list_head list_head;
> > -	int intermediate_voltage;
> > +	int inter_voltage;
> >  	bool need_voltage_tracking;
> > -	int old_vproc;
> > -	struct mutex lock; /* avoid notify and policy race condition */
> > +	int old_voltage;
> > +	struct mutex lock;  /* avoid notify and policy race condition
> > */
> >  	struct notifier_block opp_nb;
> >  	int opp_cpu;
> >  	unsigned long opp_freq;
> >  };
> >  
> > -static LIST_HEAD(dvfs_info_list);
> > +static LIST_HEAD(drv_list);
> >  
> > -static struct mtk_cpu_dvfs_info *mtk_cpu_dvfs_info_lookup(int cpu)
> > +static struct mtk_cpufreq_drv *mtk_cpufreq_drv_lookup(int cpu)
> >  {
> > -	struct mtk_cpu_dvfs_info *info;
> > +	struct mtk_cpufreq_drv *drv;
> >  
> > -	list_for_each_entry(info, &dvfs_info_list, list_head) {
> > -		if (cpumask_test_cpu(cpu, &info->cpus))
> > -			return info;
> > +	list_for_each_entry(drv, &drv_list, list_head) {
> > +		if (cpumask_test_cpu(cpu, &drv->cpus))
> > +			return drv;>  	}
> >  
> >  	return NULL;
> >  }
> >  
> > -static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info
> > *info,
> > -					int new_vproc)
> > +static int mtk_cpufreq_voltage_tracking(struct mtk_cpufreq_drv
> > *drv,
> > +					int new_voltage)
> >  {
> > -	struct regulator *proc_reg = info->proc_reg;
> > -	struct regulator *sram_reg = info->sram_reg;
> > -	int old_vproc, old_vsram, new_vsram, vsram, vproc, ret;
> > -
> > -	old_vproc = regulator_get_voltage(proc_reg);
> > -	if (old_vproc < 0) {
> > -		pr_err("%s: invalid Vproc value: %d\n", __func__,
> > old_vproc);
> > -		return old_vproc;
> > +	struct regulator *proc_reg = drv->proc_reg;
> > +	struct regulator *sram_reg = drv->sram_reg;
> > +	int old_voltage, old_vsram, new_vsram, vsram, voltage, ret;
> > +
> > +	old_voltage = regulator_get_voltage(proc_reg);
> > +	if (old_voltage < 0) {
> > +		pr_err("%s: invalid vproc value: %d\n", __func__,
> > old_voltage);
> > +		return old_voltage;
> 
> 
> Several different changes in one commit. Please read the document
> "Submitting patches".
> 
> (...)

Sorry for my ignorance.
I will split the changes and send one change in one commit.

> 
> > -MODULE_AUTHOR("Pi-Cheng Chen <pi-cheng.chen@linaro.org>");
> > +MODULE_AUTHOR("Jia-Wei Chang <jia-wei.chang@mediatek.com>");
> 
> Ekhm, why? He was not the author?

This is my mistake.
I will keep it as before and add myself as a new author.

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
