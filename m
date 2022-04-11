Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC5AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpMADHI0C04ilPn6PbEiaQJ6fUghLjQycJGn9VfD08g=; b=iJ7YzQ42Qq4m75
	HSMI/joIv+ucPn76qdYohx8y6vX7vbrz6uHfP7/B6kDP/ONF9D6pO6h4jy0tHNvZfKhUuSDXb1+zd
	b0vEiYyLypwkPkWu/vxZyUPVUEqq3IBTF2KPU5DapY5jIKiYdmNIuTrvQHIhRsxkKtrPbq1c1ISKY
	fNz20N19SYmFBsQrBJ6cutxVSvTmvT0/s/cQEOssets4uRrJUSA6gRqbEfy+GG+DWvABeeXVJUifr
	wQO8VJW9t3qwCmyLqUuS7/n/5mMaEhUr3DVMoJuOoJmIEvbE81qtiX/g62hhKMWnWaPliQurxE7Dj
	UjbmgCJtG6PtyjteSTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsig-008p7n-Bt; Mon, 11 Apr 2022 12:00:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsiK-008ozh-Bs; Mon, 11 Apr 2022 12:00:14 +0000
X-UUID: 5679adae82874d728d36dc3fe8eb3311-20220411
X-UUID: 5679adae82874d728d36dc3fe8eb3311-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 71562866; Mon, 11 Apr 2022 05:00:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:50:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 19:50:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:50:03 +0800
Message-ID: <7920cc153930ab1e724fe65df370fc70f6cbe3db.camel@mediatek.com>
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 19:50:03 +0800
In-Reply-To: <dc18d877-effb-1286-341d-1792ea6fcc05@collabora.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <dc18d877-effb-1286-341d-1792ea6fcc05@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_050012_444525_44D41711 
X-CRM114-Status: GOOD (  25.11  )
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

On Fri, 2022-04-08 at 15:37 +0200, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > In some MediaTek SoCs, like MT8183, CPU and CCI share the same
> > power
> > supplies. Cpufreq needs to check if CCI devfreq exists and wait
> > until
> > CCI devfreq ready before scaling frequency.
> > 
> > - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will
> > start
> >    DVFS when CCI is ready.
> > - Add platform data for MT8183.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 69
> > +++++++++++++++++++++++++++++-
> >   1 file changed, 68 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index b08ab7c14818..cebe5af2ef5d 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -22,6 +22,7 @@ struct mtk_cpufreq_platform_data {
> >   	int proc_max_volt;
> >   	int sram_min_volt;
> >   	int sram_max_volt;
> > +	bool is_ccifreq_support;
> 
> bool ccifreq_supported; looks better.

Hello Angelo,

Thanks for your review.

OK, I will modify this in next version.

> 
> >   };
> >   
> >   /*
> > @@ -38,6 +39,7 @@ struct mtk_cpufreq_platform_data {
> >   struct mtk_cpu_dvfs_info {
> >   	struct cpumask cpus;
> >   	struct device *cpu_dev;
> > +	struct device *cci_dev;
> >   	struct regulator *proc_reg;
> >   	struct regulator *sram_reg;
> >   	struct clk *cpu_clk;
> > @@ -52,6 +54,7 @@ struct mtk_cpu_dvfs_info {
> >   	int opp_cpu;
> >   	unsigned long opp_freq;
> >   	const struct mtk_cpufreq_platform_data *soc_data;
> > +	bool is_ccifreq_bounded;
> 
> bool ccifreq_bound; looks better.
> 

OK, I will modify this in next version.

> >   };
> >   
> >   static struct platform_device *cpufreq_pdev;
> > @@ -171,6 +174,29 @@ static int mtk_cpufreq_set_voltage(struct
> > mtk_cpu_dvfs_info *info, int vproc)
> >   	return ret;
> >   }
> >   
> > +static bool is_ccifreq_ready(struct mtk_cpu_dvfs_info *info)
> > +{
> > +	struct device_link *sup_link;
> > +
> > +	if (info->is_ccifreq_bounded)
> > +		return true;
> > +
> > +	sup_link = device_link_add(info->cpu_dev, info->cci_dev,
> > +				   DL_FLAG_AUTOREMOVE_CONSUMER);
> > +	if (!sup_link) {
> > +		dev_err(info->cpu_dev, "cpu%d: sup_link is NULL\n",
> > +			info->opp_cpu);
> 
> Please, don't break this line: 84 columns are ok.
> 

OK, I will modify this in next version.

> > +		return false;
> > +	}
> > +
> > +	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
> > +		return false;
> > +
> > +	info->is_ccifreq_bounded = true;
> > +
> > +	return true;
> > +}
> > +
> >   static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
> >   				  unsigned int index)
> >   {
> > @@ -183,6 +209,9 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >   	long freq_hz, old_freq_hz;
> >   	int vproc, old_vproc, inter_vproc, target_vproc, ret;
> >   
> > +	if (info->soc_data->is_ccifreq_support &&
> > !is_ccifreq_ready(info))
> > +		return 0;
> 
> Honestly, I think that pretending that everything is alright and
> faking
> set_target success is *not* a good idea...
> 
> You should return -EAGAIN here, not zero.
> 
> Regards,
> Angelo
> 

As metioneded by Kevin, I will review these three situations.
Thanks for your suggestion.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
