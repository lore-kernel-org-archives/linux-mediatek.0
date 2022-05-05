Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E77C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sunSBOKT/Kv2dPzgaV9qlbFZmYNgwV07NaqfTdvpH2Y=; b=gUn/cRmdS1DdXS
	+/Bet0r6Qb/YO0+t0YEIBSBHbm8CR/AFp2NfkDdEWwpa5OID5McCw7zOb+YJF+nkfJy+a6LwU3JD8
	GmloW/qAaUQQZC3Ta/AHzQuqN8EOX87LlHz4UmqJDYPPZH6hOUHVayYlrxpWmbHpM/BT5aEAaVEdX
	mWA+VFNTVL2X0HKXYeOmbvmhBvve9mI/mLg9S3DWO7ayjC8YkkO559PIkwSpb/NG1xi+LbX62jCo9
	o4RqqUGwHWrl4KNpATmjDpoP2rco8pYb/Kw1ZmLOCtiz0si6U64RrAL5jOFtT8JDfK2PLaJ15Uk+X
	6zcoQ5TA9w+ycYickh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmYC7-00F8Oo-My; Thu, 05 May 2022 09:54:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmYBo-00F8Jv-6O; Thu, 05 May 2022 09:54:29 +0000
X-UUID: 7c519a9fd3654da9be8bf7b6c35df38e-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2720dee6-1ce3-4680-9296-081c6e3f2b0c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:bbbeaeb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7c519a9fd3654da9be8bf7b6c35df38e-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1324978869; Thu, 05 May 2022 02:54:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 02:44:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 17:44:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 5 May 2022 17:44:17 +0800
Message-ID: <b2dabd5e33e39fed2efcf458c26670f29ab83233.camel@mediatek.com>
Subject: Re: [PATCH v5 2/9] cpufreq: mediatek: Add opp notification support
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
Date: Thu, 5 May 2022 17:44:17 +0800
In-Reply-To: <20220505084345.e3qt3ocdft75tbxv@vireshk-i7>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
 <20220504130540.5902-3-rex-bc.chen@mediatek.com>
 <20220505084345.e3qt3ocdft75tbxv@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_025428_310926_78D6B887 
X-CRM114-Status: GOOD (  25.62  )
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

On Thu, 2022-05-05 at 14:13 +0530, Viresh Kumar wrote:
> On 04-05-22, 21:05, Rex-BC Chen wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > > From this opp notifier, cpufreq should listen to opp notification
> > > and do
> 
> What happened with the extra ">" here ?
> 

Hello Viresh,

Sorry for this. I don't know why it appear this ">".
In my patch, there is no ">" here.
I will check this..

> >  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info,
> > int cpu)
> >  {
> >  	struct device *cpu_dev;
> > @@ -396,6 +458,17 @@ static int mtk_cpu_dvfs_info_init(struct
> > mtk_cpu_dvfs_info *info, int cpu)
> >  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
> >  	dev_pm_opp_put(opp);
> >  
> > +	info->opp_cpu = cpu;
> > +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> > +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
> > +	if (ret) {
> > +		dev_err(cpu_dev, "cpu%d: failed to register opp
> > notifier\n", cpu);
> > +		goto out_disable_inter_clock;
> > +	}
> > +
> > +	mutex_init(&info->reg_lock);
> 
> You should always initialize a resource before its users. The
> notifier
> callback, which can get called right after
> dev_pm_opp_register_notifier() returns, will use this mutex.
> 

ok, I will move mutex_init(&info->reg_lock) before
dev_pm_opp_register_notifier().

> > +	info->opp_freq = clk_get_rate(info->cpu_clk);
> > +
> >  	/*
> >  	 * If SRAM regulator is present, software "voltage tracking" is
> > needed
> >  	 * for this CPU power domain.
> > @@ -451,6 +524,9 @@ static void mtk_cpu_dvfs_info_release(struct
> > mtk_cpu_dvfs_info *info)
> >  	}
> >  
> >  	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
> > +
> > +	if (!IS_ERR_OR_NULL(info->cpu_dev))
> 
> cpu_dev can never be error here.

ok, I will drop this.

> 
> > +		dev_pm_opp_unregister_notifier(info->cpu_dev, &info-
> > >opp_nb);
> >  }
> >  
> >  static int mtk_cpufreq_init(struct cpufreq_policy *policy)
> 
> I also asked you last time to stack things in a order so they are
> easier for me to apply. Bugfixes, followed by simple cleanups, which
> don't make behavioral changes, followed by real patches.
> 
> Now you have sent this patch at an early stage, which blocks me from
> applying anything after this.
> 
> I can see the earlier comments weren't all considered, and it doesn't
> look nice.
> 

Sorry for inconvenience.
I will move "cpufreq: mediatek: Move voltage limits to platform data"
before this patch.

The order will be:
//cleanup and bug fix
new patch for add "platform_device_unregister(cpufreq_pdev);"
cpufreq: mediatek: Move voltage limits to platform data

//driver refinement
cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()

//new feature
cpufreq: mediatek: Add opp notification support
cpufreq: mediatek: Link CCI device to CPU

//support new soc
cpufreq: mediatek: Add support for MT8186

//dts
arm64: dts: mediatek: Add opp table and clock property for MT8183
cpufreq
arm64: dts: mediatek: Add MediaTek CCI node for MT8183
arm64: dts: mediatek: Add mediatek, cci property for MT8183 cpufreq

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
