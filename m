Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 01:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZV29VtkFdUTUFcilzeybHrRxY9fK1tWAeWAeKepM+I0=; b=V1oRzKnuzzLctW
	1YdjgU/XynCZRYuhmHoUSS8vSfEPWaUVflAvQwF/jG49f9LCP39QQaY5peZ18o8/gCxuRLQ4nrODj
	mK4twymtx0k6Me4OJzrMWE6s0Az6/05XiJgtSQPgI667ABCPeKLzI0HwAIGheEWigyXE9dArSuHHM
	XCa3LQkrnD6V2EBcqX1m6QSbCBIN38Jdbsi7CKg5OdS9/7Fea+L9AE735Xa4CJil7i8cJvBx/pvXg
	whbCGJpS2gvVjA/uJn5fUV/OeFZDkmZ8Ew1c/3n5vnllDu56O/lvmy9v/gOz5z9Wjwz9ijOkBLk3q
	GQ9rIzOsoTBLI+61fRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngGUz-00FGRn-0g; Mon, 18 Apr 2022 01:48:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngGUe-00FGMW-Dm; Mon, 18 Apr 2022 01:47:57 +0000
X-UUID: a60bb27f9a8e4b24a71691f94aec54ac-20220417
X-UUID: a60bb27f9a8e4b24a71691f94aec54ac-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 988184809; Sun, 17 Apr 2022 18:47:49 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 18:45:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Apr 2022 09:45:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 09:45:09 +0800
Message-ID: <fb61128ab1534982ed9f8c8d7a141afad04d8fbb.camel@mediatek.com>
Subject: Re: [PATCH V3 11/15] cpufreq: mediatek: Link CCI device to CPU
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 18 Apr 2022 09:45:09 +0800
In-Reply-To: <9fccbb92-1832-bf5d-7804-80dd481663fc@collabora.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-12-rex-bc.chen@mediatek.com>
 <9fccbb92-1832-bf5d-7804-80dd481663fc@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_184756_476098_AC31B9C9 
X-CRM114-Status: GOOD (  33.73  )
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
> > In some MediaTek SoCs, like MT8183, CPU and CCI share the same
> > power
> > supplies. Cpufreq needs to check if CCI devfreq exists and wait
> > until
> > CCI devfreq ready before scaling frequency.
> > 
> > Before CCI devfreq is ready, we record the voltage when booting to
> > kernel and use the max(cpu target voltage, booting voltage) to
> > prevent cpufreq adjust to the lower voltage which will cause the
> > CCI
> > crash because of high frequency and low voltage.
> > 
> > - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will
> > start
> >    DVFS when CCI is ready.
> > - Add platform data for MT8183.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> I am enthusiast to see that the solution that I've proposed was
> welcome!
> 
> I only have one nit on this patch, check below:
> 

Hello Angelo,

Thanks for your advice for this modification.
I also reply to Kevin and describe this solution.
Let's wait for Kevin's feedback and other suggestion.

> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 80
> > +++++++++++++++++++++++++++++-
> >   1 file changed, 79 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index d4c00237e862..dd3f739fede1 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> 
> ..snip..
> 
> > @@ -225,6 +251,14 @@ static int mtk_cpufreq_set_target(struct
> > cpufreq_policy *policy,
> >   	vproc = dev_pm_opp_get_voltage(opp);
> >   	dev_pm_opp_put(opp);
> >   
> > +	/*
> > +	 * If MediaTek cci is supported but is not ready, we will use
> > the value
> > +	 * of max(target cpu voltage, booting voltage) to prevent high
> > freqeuncy
> > +	 * low voltage crash.
> > +	 */
> > +	if (info->soc_data->ccifreq_supported &&
> > !is_ccifreq_ready(info))
> > +		vproc = max(vproc, info->vproc_on_boot);
> > +
> >   	/*
> >   	 * If the new voltage or the intermediate voltage is higher
> > than the
> >   	 * current voltage, scale up voltage first.
> 
> ..snip..
> 
> > @@ -423,6 +484,13 @@ static int mtk_cpu_dvfs_info_init(struct
> > mtk_cpu_dvfs_info *info, int cpu)
> >   	if (ret)
> >   		goto out_disable_mux_clock;
> >   
> > +	info->vproc_on_boot = regulator_get_voltage(info->proc_reg);
> 
> This result is used only if we use ccifreq, so this should be
> enclosed in an if
> condition: this will spare us some (yes, small) time on devices that
> don't use it.
> 
> 	if (info->soc_data->ccifreq_supported) {
> 		info->vproc_on_boot = regulator_get_voltage(info-
> >proc_reg);
> 		if (info->vproc_on_boot < 0) {
> 			dev_err(....
> 			goto ..
> 		}
> 	}
> 
> P.S.: While at it, since the maximum width is 100 columns, the
> dev_err() call fits,
> so don't break that line!
> 
> After the requested change:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

I will add this in next version if there is no any suggestion for this
patch.

Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
