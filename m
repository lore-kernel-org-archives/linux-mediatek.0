Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA722C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRlVzvxTghUWpKagHrZgQuOjvLOqO75evAd2w4TagQw=; b=awiBpViHiNRcuh
	bgPSGcrb6rEWlH3vtj9yjf6Pg2lDmAL+CNYn5zChTPkOewCyYkoBsTOZzEJCnxwrNp+C/T2JsvpGD
	p/EIkbU2i5CsCBVoZTcvg5bdZtb9vcZqzX3AQ8iO2MmIYRGQSph5msnKU1Pu3vuAY7Z90qLoOaoMH
	hoQcqosU5uBcireQkhxfUXYkKZ3argV41j2WwePFCLmB0Z6jOJUoyWebYBBPbASUFbJOB3zvW4I75
	rJ5D9/j33CnadliMkirVA9m/GpJ+dM3IwGZuZqraDvanQJznsidRT849QenGFp1wwvwa2WLBOk1/k
	wTFPU4mc1Ue2ULAkP0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsH4-008iEq-FV; Mon, 11 Apr 2022 11:32:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsGs-008i9h-3s; Mon, 11 Apr 2022 11:31:51 +0000
X-UUID: 7143476bac044491b73267219f614777-20220411
X-UUID: 7143476bac044491b73267219f614777-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2014252881; Mon, 11 Apr 2022 04:31:38 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:31:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 11 Apr 2022 19:31:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:31:29 +0800
Message-ID: <61fc07988fb1bf11e090fe52e1b773f6f4fda537.camel@mediatek.com>
Subject: Re: [PATCH V2 07/15] cpufreq: mediatek: Add opp notification for
 SVS support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>
Date: Mon, 11 Apr 2022 19:31:29 +0800
In-Reply-To: <d9f514b6-1116-30d3-274f-11e04a2dc8e9@collabora.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-8-rex-bc.chen@mediatek.com>
 <d9f514b6-1116-30d3-274f-11e04a2dc8e9@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_043150_215044_2AB40DA3 
X-CRM114-Status: GOOD (  22.32  )
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

On Fri, 2022-04-08 at 15:36 +0200, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > The Smart Voltage Scaling (SVS) is a hardware which calculates
> > suitable
> > SVS bank voltages to OPP voltage table.
> > 
> > When the SVS is enabled, cpufreq should listen to opp notification
> > and do
> > proper actions when receiving events of disable and voltage
> > adjustment.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 90
> > +++++++++++++++++++++++++++---
> >   1 file changed, 82 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index 472f4de29e5f..1369da62780a 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> 
> ..snip..
> 
> > +
> >   static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info,
> > int cpu)
> >   {
> >   	struct device *cpu_dev;
> > @@ -392,6 +455,17 @@ static int mtk_cpu_dvfs_info_init(struct
> > mtk_cpu_dvfs_info *info, int cpu)
> >   	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
> >   	dev_pm_opp_put(opp);
> >   
> > +	info->opp_cpu = cpu;
> > +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> > +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
> 
> You are registering this notifier, but never unregistering it.
> Please unregister it in error conditions and also upon runtime
> removal of the
> mediatek-cpufreq module.
> 
> -> dev_pm_opp_unregister_notifier()
> 
> Regards,
> Angelo

Hello Angelo,

Thanks for your review.
I will add this inside mtk_cpu_dvfs_info_release() in next version.

BRs,
Rex

> 
> > +	if (ret) {
> > +		dev_warn(cpu_dev, "cpu%d: failed to register opp
> > notifier\n", cpu);
> > +		goto out_disable_inter_clock;
> > +	}
> > +
> > +	mutex_init(&info->reg_lock);
> > +	info->opp_freq = clk_get_rate(info->cpu_clk);
> > +
> >   	/*
> >   	 * If SRAM regulator is present, software "voltage tracking" is
> > needed
> >   	 * for this CPU power domain.
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
