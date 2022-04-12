Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99348C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxMcJdyCFWdiHW8nFtTTxW4GoALObHTaHSgBoK+k5es=; b=TcgT5R4DlyzBmx
	/9XLeDrDWRVrrrRz8dlNrT0vRMBnElFoLBoX91rL1Vw5ehu45LY3kqDqN5zCl4213ngrae5tQycWs
	cMAVyV3cvOWgfB5R+NqOlRLCag/+gbpiNol+mi+MPplVq0y1A051HXUcwKIRQXPE3VwPRKkXLQUiT
	SD94r3YAPgTQuYtQFoRSMwJBYLyUS0cmmD5V6Wlh55ekU6Hr2pe16gWZnnNS3eFedNuvfRbqjoHcX
	J0fETN0fe+VBYvDNi88v1InhuE3V/ycwaiL1eHqZdZJp4tDpeth8KpH+V5O+sbuogh9j0sx4R++4g
	ZCl/ofJqT94vb7exYPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBjP-00CVYM-Hl; Tue, 12 Apr 2022 08:18:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBjD-00CVVF-Hm; Tue, 12 Apr 2022 08:18:25 +0000
X-UUID: 335f0cfb7a10411db59054ccd89bd102-20220412
X-UUID: 335f0cfb7a10411db59054ccd89bd102-20220412
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1506343104; Tue, 12 Apr 2022 01:18:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 01:18:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Apr 2022 16:18:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 16:18:16 +0800
Message-ID: <dfe2d3e3401a6f2a7be9db4e8a0590d3dd9a6969.camel@mediatek.com>
Subject: Re: [PATCH V2 07/15] cpufreq: mediatek: Add opp notification for
 SVS support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Kevin Hilman <khilman@baylibre.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>
Date: Tue, 12 Apr 2022 16:18:16 +0800
In-Reply-To: <7hzgkr4hmc.fsf@baylibre.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-8-rex-bc.chen@mediatek.com>
 <7hsfqn5nft.fsf@baylibre.com>
 <3b7bf25a3da6c8f780c87784c1f796bf1e464238.camel@mediatek.com>
 <7hzgkr4hmc.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_011823_639984_26B72809 
X-CRM114-Status: GOOD (  30.20  )
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

On Mon, 2022-04-11 at 11:09 -0700, Kevin Hilman wrote:
> Hi Rex,
> 
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> 
> > On Fri, 2022-04-08 at 13:29 -0700, Kevin Hilman wrote:
> > > Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> > > 
> > > > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > > > 
> > > > The Smart Voltage Scaling (SVS) is a hardware which calculates
> > > > suitable
> > > > SVS bank voltages to OPP voltage table.
> > > > 
> > > > When the SVS is enabled, cpufreq should listen to opp
> > > > notification
> > > > and do
> > > > proper actions when receiving events of disable and voltage
> > > > adjustment.
> > > 
> > > So listenting for OPP notifications should be done only when SVS
> > > is
> > > enabled...
> > > 
> > 
> > Thanks for your review.
> > Yes, the OPP notification is only called from MediaTek SVS.
> > 
> > > [...]
> > > 
> > > >  static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info
> > > > *info,
> > > > int cpu)
> > > >  {
> > > >  	struct device *cpu_dev;
> > > > @@ -392,6 +455,17 @@ static int mtk_cpu_dvfs_info_init(struct
> > > > mtk_cpu_dvfs_info *info, int cpu)
> > > >  	info->intermediate_voltage =
> > > > dev_pm_opp_get_voltage(opp);
> > > >  	dev_pm_opp_put(opp);
> > > >  
> > > > +	info->opp_cpu = cpu;
> > > > +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> > > > +	ret = dev_pm_opp_register_notifier(cpu_dev, &info-
> > > > >opp_nb);
> > > 
> > > ...but here youlisten to OPP notifications
> > > unconditionally.  Seems
> > > there
> > > should be a check whether SVS is enabled before deciding to
> > > register.
> > > 
> > > Kevin
> > > 
> > 
> > Do you think it's ok that we wrap it with the SVS Kconfig define?
> > like
> > #ifdef CONFIG_MTK_SVS
> > mtk_cpufreq_opp_notifier()
> > ...
> > dev_pm_opp_register_notifier()
> > #endif
> 
> Generally, we don't like to see #ifdefs in C files[1].
> 
> But more importantly, compile-time check is not enough, because SVS
> feature could be compiled into kernel, but not actually enabled for
> an
> SoC (e.g. DT node not enabled, etc.) so checking this at compile time
> is
> not enough.
> 
> Ideally, the SVSdriver should provide a function that allows others
> to
> check if it's enabled.  That function needs to know not only if it's
> compile in, but if it's enabled/running.  If SVS is not compiled in,
> then that function just returns false.
> 
> Kevin
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/4.Coding.html?highlight=ifdef*ifdef-and-preprocessor-use-in-general__;Iw!!CTRNKA9wMg0ARbw!z6SrEcQOLu2u-R1OLedrRUXHYXCzuQoK3F_h9Bhzv8jNFmjV5mdNVy41eND67CuV9uIS$
> 

Hello Kevin,

After our internal discussion, we think the register of notifier should
not be bound for certain module.
If we provide the moethod to adjust voltage/disable opp, we think if
anyone call dev_pm_opp_adjust_voltage and dev_pm_opp_disable, it could
be used.

May I ask what is your concern?

BRs,
Rex



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
