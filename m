Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8F5k9MwudZZIt/A8ZScO94XnCuyPqUmB1DnMOOlEzE=; b=HHgu67n2S4mPwG
	EezRsjW+6UDnL6kvoyaIcOAltFmKLP7zsBRLrC1GX2WjdVCxu7JgJZMXpmRQTSsNZLi1o+0OkLA7e
	xJNoktNkGT3EimlH4E+P3iUjW3DS86TsPDIYusXoARpSLxcI46qaSY9rRLtAg7ylvIryYbCpjemqd
	WjrYtQNKLe0kzoTvqS0DkchS53x+DQ//IjthLfNinpIBNIjv51xFqAiQ7bUymTfj2c7FlWEgiomzw
	XOLygXowcaCCqX8bUUCD+OZZWepL0Ipv4NrPNXOW32EHdDQQTdbQPZLm/tD4Q18UKtGsU+2KqNp+n
	lGrKpjvRh7cx+HxYmonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niwBQ-009A1D-7h; Mon, 25 Apr 2022 10:43:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niwBF-0099zl-Jm; Mon, 25 Apr 2022 10:42:59 +0000
X-UUID: c39a5c63357d4e75b9c555c14e54b4d6-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f1a44989-cad2-4316-94ec-ec270179eb78, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:3
X-CID-META: VersionHash:faefae9, CLOUDID:809506f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c39a5c63357d4e75b9c555c14e54b4d6-20220425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 934508351; Mon, 25 Apr 2022 03:42:51 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 03:39:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 18:38:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 18:38:57 +0800
Message-ID: <5e9b50d05317e45636c0511e62f707a4c7e0c328.camel@mediatek.com>
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
Date: Mon, 25 Apr 2022 18:38:57 +0800
In-Reply-To: <20220425052026.k3xfmmil4ujqeynh@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-6-rex-bc.chen@mediatek.com>
 <20220425052026.k3xfmmil4ujqeynh@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_034257_708359_178254E6 
X-CRM114-Status: GOOD (  27.16  )
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

Hello Viresh,

Sorry that I miss this message.
I will remove it in next version.
Thanks.

BRs,
Rex

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
