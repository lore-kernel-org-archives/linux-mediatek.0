Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F44C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eVhbmb969NL5RH1GWrIgrnTFdA22X4RgoBh/yx4B2Y=; b=vYJztCxRCpmaPC
	vb+Y7BL0WqoZ+Ouq1/I/YMFcWV2nRWLcuYL63vG4IBMbCfKiKD5nH+ElpBILF0qSuCFL4DNwUpVFi
	oZtCatB2eeaoetP8jqvMGYLYvNEf7Q1/tAt8HyhjBwAa2g1dlY6RYTGqLjd3ynIjSjyj5ZdS/1N8W
	aBoEjlEakF6l6Sv3Hhh6qO4p822id9RW6hi/dF3AIyQwctJl3JKGwuKXSYuS9KcLZ0un3F7igVWaU
	FypEtyNIZh0cT0y1ogcEs7k8ihWRkCoaTNrldhLUmYyRWp0BwVnzSfkDOs2S8HiAznR0gYgLJnOj0
	szPrazJO3mVLj8kQDqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nit9l-008boY-RE; Mon, 25 Apr 2022 07:29:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nit9X-008bnN-NU; Mon, 25 Apr 2022 07:29:03 +0000
X-UUID: e19383fc4182430d980a9b977f10319e-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f4b41087-7421-45f4-aa5c-3f84cfbe74e8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:3
X-CID-META: VersionHash:faefae9, CLOUDID:f3f0ffef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: e19383fc4182430d980a9b977f10319e-20220425
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1400079795; Mon, 25 Apr 2022 00:28:49 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 00:28:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 15:28:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 15:28:44 +0800
Message-ID: <de5df2433da2427e39883cdd17c4770afa42f82d.camel@mediatek.com>
Subject: Re: [PATCH V4 05/14] cpufreq: mediatek: Add opp notification support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>
Date: Mon, 25 Apr 2022 15:28:44 +0800
In-Reply-To: <20220425052026.k3xfmmil4ujqeynh@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-6-rex-bc.chen@mediatek.com>
 <20220425052026.k3xfmmil4ujqeynh@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_002859_821145_9EFCD0D4 
X-CRM114-Status: GOOD (  27.78  )
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

On Mon, 2022-04-25 at 10:50 +0530, Viresh Kumar wrote:
> On 22-04-22, 15:52, Rex-BC Chen wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > > From this opp notifier, cpufreq should listen to opp notification
> > > and do
> 
> Why the extra ">" here ?
> 
> > proper actions when receiving events of disable and voltage
> > adjustment.
> > 
> > One of the user for this opp notifier is MediaTek SVS.
> > The MediaTek Smart Voltage Scaling (SVS) is a hardware which
> > calculates
> > suitable SVS bank voltages to OPP voltage table.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 92
> > +++++++++++++++++++++++++++---
> >  1 file changed, 84 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > +static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
> > +				    unsigned long event, void *data)
> > +{
> > +	struct dev_pm_opp *opp = data;
> > +	struct dev_pm_opp *new_opp;
> > +	struct mtk_cpu_dvfs_info *info;
> > +	unsigned long freq, volt;
> > +	struct cpufreq_policy *policy;
> > +	int ret = 0;
> > +
> > +	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> > +
> > +	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
> 
> I don't see any call to dev_pm_opp_adjust_voltage() for your
> platform, how is
> this ever going to get called ?
> 

Hello Viresh,

Thanks for your review!
These two event OPP_EVENT_ADJUST_VOLTAGE and OPP_EVENT_DISABLE are
basically called by mediatek svs drivers.
It's not merged in mainline kernel and you can reger to [1].

[1]:
https://lore.kernel.org/all/20220420102044.10832-4-roger.lu@mediatek.com/

For OPP_EVENT_ADJUST_VOLTAGE:
mediatek svs will optimize the voltage, so mediatek svs will call
dev_pm_opp_adjust_voltage() to adjust frequency and voltage.

> > +		freq = dev_pm_opp_get_freq(opp);
> > +
> > +		mutex_lock(&info->reg_lock);
> > +		if (info->opp_freq == freq) {
> > +			volt = dev_pm_opp_get_voltage(opp);
> > +			ret = mtk_cpufreq_set_voltage(info, volt);
> > +			if (ret)
> > +				dev_err(info->cpu_dev,
> > +					"failed to scale voltage:
> > %d\n", ret);
> > +		}
> > +		mutex_unlock(&info->reg_lock);
> > +	} else if (event == OPP_EVENT_DISABLE) {
> > +		freq = dev_pm_opp_get_freq(opp);
> > +
> > +		/* case of current opp item is disabled */
> > +		if (info->opp_freq == freq) {
> > +			freq = 1;
> > +			new_opp = dev_pm_opp_find_freq_ceil(info-
> > >cpu_dev,
> > +							    &freq);
> > +			if (IS_ERR(new_opp)) {
> > +				dev_err(info->cpu_dev,
> > +					"all opp items are
> > disabled\n");
> > +				ret = PTR_ERR(new_opp);
> > +				return notifier_from_errno(ret);
> > +			}
> > +
> > +			dev_pm_opp_put(new_opp);
> > +			policy = cpufreq_cpu_get(info->opp_cpu);
> > +			if (policy) {
> > +				cpufreq_driver_target(policy, freq /
> > 1000,
> > +						      CPUFREQ_RELATION_
> > L);
> > +				cpufreq_cpu_put(policy);
> 
> IIUC, then you are trying to change the frequency if a currently used
> OPP is
> getting removed ? In that case, this problem is generic enough not to
> be fixed
> in a end driver. This should be fixed in core somehow.
> 

For OPP_EVENT_DISABLE:
when mediatek svs needs to be disable, the voltage should recover to
original voltage and frequency.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
