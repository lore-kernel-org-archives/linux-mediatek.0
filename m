Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACD8C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43F1ZTLPiqe+cv2qbDm4+FaV5NDuRvFzDPa+xH6mSGw=; b=eiqT4kegjwHC3r
	31xy5FeMvvaTe7Vx4Rs5eEvuWGJDBVfota6daUfV/fdFEyI/L7EtQwCTforUqEBTgaWTGMuRDgZV8
	BWYAqe/cYYfLyDd2kNiWMA0HJ56tdanx3s/DIk45wbCaj9QziUsYnsDzuffzPYSpH4yGJ7+nLqcJj
	zgLCBRQE+Hiv6G7JeTztHtdLfaheZUYms/XIMDR/lr26g8INsHSZxnF1BlppdmVijRFcV6kmYJeru
	d39BsGPf0mTuA0PHAs83b0uZ9ao+/hiXZl1sHgm03y1nHUsMz5pXXGxhc6YLlXQ+IaslcNmU37X5N
	fQpPvio+44Fzg5SPMsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsIV-008ivH-QH; Mon, 11 Apr 2022 11:33:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsII-008iqb-2G; Mon, 11 Apr 2022 11:33:19 +0000
X-UUID: 3982c1262b724b1ca888535626603fd7-20220411
X-UUID: 3982c1262b724b1ca888535626603fd7-20220411
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1327956062; Mon, 11 Apr 2022 04:33:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:33:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 19:33:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:33:11 +0800
Message-ID: <0fad4560d167ed7f063e3e597b772bd440791b43.camel@mediatek.com>
Subject: Re: [PATCH V2 06/15] cpufreq: mediatek: Record previous target
 vproc value
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>
Date: Mon, 11 Apr 2022 19:33:10 +0800
In-Reply-To: <20220411032654.5tqqivmstqkojfj5@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-7-rex-bc.chen@mediatek.com>
 <20220411032654.5tqqivmstqkojfj5@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_043318_165672_09FA58A7 
X-CRM114-Status: GOOD (  27.19  )
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

On Mon, 2022-04-11 at 08:56 +0530, Viresh Kumar wrote:
> On 08-04-22, 12:58, Rex-BC Chen wrote:
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
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 31 +++++++++++++++++++-------
> > ----
> >  1 file changed, 20 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index dc4a87e68940..472f4de29e5f 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -40,6 +40,7 @@ struct mtk_cpu_dvfs_info {
> >  	struct list_head list_head;
> >  	int intermediate_voltage;
> >  	bool need_voltage_tracking;
> > +	int old_vproc;
> 
> I like prev_vproc better somehow, but it is up to you to name it :)

Hello Viresh,

Thanks for your review.
I will modify this as prev_vproc in next version.

> 
> >  };
> >  
> >  static LIST_HEAD(dvfs_info_list);
> > @@ -190,11 +191,17 @@ static int
> > mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> >  
> >  static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info,
> > int vproc)
> >  {
> > +	int ret;
> > +
> >  	if (info->need_voltage_tracking)
> > -		return mtk_cpufreq_voltage_tracking(info, vproc);
> > +		ret = mtk_cpufreq_voltage_tracking(info, vproc);
> >  	else
> > -		return regulator_set_voltage(info->proc_reg, vproc,
> > -					     vproc + VOLT_TOL);
> > +		ret = regulator_set_voltage(info->proc_reg, vproc,
> > +					    MAX_VOLT_LIMIT);
> > +	if (!ret)
> > +		info->old_vproc = vproc;
> > +
> > +	return ret;
> >  }
> >  
> >  static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
> > @@ -211,15 +218,7 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  
> >  	inter_vproc = info->intermediate_voltage;
> >  
> > -	old_freq_hz = clk_get_rate(cpu_clk);
> > -	old_vproc = regulator_get_voltage(info->proc_reg);
> > -	if (old_vproc < 0) {
> > -		pr_err("%s: invalid Vproc value: %d\n", __func__,
> > old_vproc);
> > -		return old_vproc;
> > -	}
> > -
> 
> Why did you move it down from here? I think it was fine to error out
> early if voltage isn't available.

I will move them to original position in next version.

Thanks!

BRs,
Rex

> 
> >  	freq_hz = freq_table[index].frequency * 1000;
> > -
> >  	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &freq_hz);
> >  	if (IS_ERR(opp)) {
> >  		pr_err("cpu%d: failed to find OPP for %ld\n",
> > @@ -229,6 +228,16 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >  	vproc = dev_pm_opp_get_voltage(opp);
> >  	dev_pm_opp_put(opp);
> >  
> > +	old_freq_hz = clk_get_rate(cpu_clk);
> > +	old_vproc = info->old_vproc;
> > +	if (old_vproc == 0)
> > +		old_vproc = regulator_get_voltage(info->proc_reg);
> > +	if (old_vproc < 0) {
> > +		dev_err(cpu_dev, "%s: invalid Vproc value: %d\n",
> > +			__func__, old_vproc);
> > +		return old_vproc;
> > +	}
> > +
> >  	/*
> >  	 * If the new voltage or the intermediate voltage is higher
> > than the
> >  	 * current voltage, scale up voltage first.
> > -- 
> > 2.18.0
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
