Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 01:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI7HWWK2Pb/y7GdABdALwri6SkgLlQhbXuKJTxadcCk=; b=gSKviOan48BqyQ
	CkrC0qBg3LboCOtZfsvPvEKnavmnq0osOV40lUwhk2kukoS5VEwafUcYLiUYYepAJUeRcxTnYKsQT
	O69eE6+yT8QvkOdk4eNupL1BK2JbGa+ciBvGqfXep1UCXVKhRIBS3i2IcXujiTwUWqnTG302n3dXP
	VzdyRcHrCCGdZ+OPnCgK4/r8Cpxds+85cxrpzTmeG62Q2AvCM1bkTZKoxafX05jNkLpxT4fnPKmw8
	6xVACygUXXYjpoEbT7oHTFTp62bPB68eAXprNghBnBSsPHkmRHMDbtf0wXWrVdevr6D18g3UuMgWQ
	KVlTiC8QsOtCUl+dyg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngGUx-00FGRD-MA; Mon, 18 Apr 2022 01:48:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngGUd-00FGMZ-Ub; Mon, 18 Apr 2022 01:47:57 +0000
X-UUID: 75ad0254d3654ff6a09273ca8731ea95-20220417
X-UUID: 75ad0254d3654ff6a09273ca8731ea95-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 82805900; Sun, 17 Apr 2022 18:47:49 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 18:37:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Apr 2022 09:37:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 09:37:45 +0800
Message-ID: <3a1fe42adace3a1355b6a95fbd55abc724c1053d.camel@mediatek.com>
Subject: Re: [PATCH V3 04/15] cpufreq: mediatek: Record previous target
 vproc value
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>
Date: Mon, 18 Apr 2022 09:37:45 +0800
In-Reply-To: <9751622e-f969-c025-2a39-efcc9a612392@collabora.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-5-rex-bc.chen@mediatek.com>
 <9751622e-f969-c025-2a39-efcc9a612392@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_184756_016549_7589EEE7 
X-CRM114-Status: GOOD (  24.68  )
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

On Fri, 2022-04-15 at 14:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > We found the buck voltage may not be exactly the same with what we
> > set
> > because CPU may share the same buck with other module.
> > Therefore, we need to record the previous desired value instead of
> > reading
> > it from regulators.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 17 +++++++++++++----
> >   1 file changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index ff27f77e8ee6..fa8b193bf27b 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -40,6 +40,7 @@ struct mtk_cpu_dvfs_info {
> >   	struct list_head list_head;
> >   	int intermediate_voltage;
> >   	bool need_voltage_tracking;
> > +	int pre_vproc;
> >   };
> >   
> >   static LIST_HEAD(dvfs_info_list);
> > @@ -191,11 +192,17 @@ static int
> > mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> >   
> >   static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info
> > *info, int vproc)
> >   {
> > +	int ret;
> > +
> >   	if (info->need_voltage_tracking)
> > -		return mtk_cpufreq_voltage_tracking(info, vproc);
> > +		ret = mtk_cpufreq_voltage_tracking(info, vproc);
> >   	else
> > -		return regulator_set_voltage(info->proc_reg, vproc,
> > -					     vproc + VOLT_TOL);
> > +		ret = regulator_set_voltage(info->proc_reg, vproc,
> > +					    MAX_VOLT_LIMIT);
> > +	if (!ret)
> > +		info->pre_vproc = vproc;
> > +
> > +	return ret;
> >   }
> >   
> >   static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
> > @@ -213,7 +220,9 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >   	inter_vproc = info->intermediate_voltage;
> >   
> >   	pre_freq_hz = clk_get_rate(cpu_clk);
> > -	pre_vproc = regulator_get_voltage(info->proc_reg);
> > +	pre_vproc = info->pre_vproc;
> > +	if (pre_vproc <= 0)
> > +		pre_vproc = regulator_get_voltage(info->proc_reg);
> 
> I would do it like that, instead:
> 
> 	if (unlikely(info->pre_vproc <= 0))
> 		pre_vproc = regulator_get_voltage(info->proc_reg);
> 	else
> 		pre_vproc = info->pre_vproc;
> 
> ....as even though it is indeed possible that info->pre_vproc is <=
> 0, it is
> very unlikely to happen ;-)
> This also solves a 'pre_vproc' double assignment issue, by the way.
> 
> Cheers,
> Angelo
> 
> 
> 

Hello Angelo,

OK, I will add this in next version.
Thanks for your suggestion.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
