Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C77C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:06:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC2E207D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC2E207D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=shog2ViDGMV3bTVHnTPIpp0zGs93L4ftP8nMEIBpT0E=; b=sOpohyTP3j6zPjncsszdH6wpy
	Ev+jEeeaH8FQsOo4K+JJM3Vhwh5yR5Fqwmq8HNXVXZTN5HBGcb/z9Ah+EM22IuWZhHfsSA4LSGF17
	QWeOwzpy2lKdL0Z6ANGKu7CYUV55fDFl/CRRsXxRXYr9sUd7/MS2AxK+YfIqZm61JIobarmEPfM+e
	ox+azh4jb1sWzEgjq8BiBJ8v0KqT4W0Yqcz2Y6i4K8ecqfHquZ+U39UzWi+vCAM+c3XPOxCQe2huB
	Uor9Ixaq/gGOvEUwnspFVYxUKeXtcWG6LFyoVI41m/j/ogOR/ASLUnZ/KIE46aaxBCCIpE551ODX9
	WUoWPXfIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuCpV-0007R7-Jh; Tue, 29 Dec 2020 11:06:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuCpT-0007Px-8Y; Tue, 29 Dec 2020 11:06:16 +0000
X-UUID: 092f8e5f076c4253a31ed3c11551e622-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kBXEFHEYE3UKfnPdFHxODX9PA3xu0wCHnxHyXHF9dIY=; 
 b=sh7NoZ2zW1iX+Oi/6JQckcDnXqqCbJpUxpgCMhjArjmT49D7qqFTaF6g7I3D9mdlaHdSPltPQy6uHiYRmNSP/qIzIjnjI3Fmlez2lOVhmcnepOtzuxiRX6TkcPZF93N1DadconoEB4xpO25jMxO5kK9jyetz+IzkIuGCWwf0F2A=;
X-UUID: 092f8e5f076c4253a31ed3c11551e622-20201229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 256266258; Tue, 29 Dec 2020 03:06:06 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 03:06:04 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 19:06:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 19:06:01 +0800
Message-ID: <1609239960.26323.291.camel@mhfsdcap03>
Subject: Re: [PATCH v5 17/27] iommu/mediatek: Add pm runtime callback
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 29 Dec 2020 19:06:00 +0800
In-Reply-To: <X+MAh87dFsY2p8vF@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-18-yong.wu@mediatek.com>
 <X+MAh87dFsY2p8vF@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6193CBCDE50237FB6220DACC2EDA79262E49C0591F513503724C7571B2EDA9F12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_060615_448663_8DAC66ED 
X-CRM114-Status: GOOD (  28.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Tomasz
 Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 17:32 +0900, Tomasz Figa wrote:
> On Wed, Dec 09, 2020 at 04:00:52PM +0800, Yong Wu wrote:
> > This patch adds pm runtime callback.
> > 
> > In pm runtime case, all the registers backup/restore and bclk are
> > controlled in the pm_runtime callback, then pm_suspend is not needed in
> > this case.
> > 
> > runtime PM is disabled when suspend, thus we call
> > pm_runtime_status_suspended instead of pm_runtime_suspended.
> > 
> > And, m4u doesn't have its special pm runtime domain in previous SoC, in
> > this case dev->power.runtime_status is RPM_SUSPENDED defaultly,
> 
> This sounds wrong and could lead to hard to debug errors when the driver
> is changed in the future. Would it be possible to make the behavior
> consistent across the SoCs instead, so that runtime PM status is ACTIVE
> when needed, even on SoCs without an IOMMU PM domain?

Appreciate the reviewing so detailly.

I have tested this.
a) always call pm_runtime_enable.
b) always add device_link with smi_common.

Then, the runtime PM status meet expectation. 

We don't call pm_runtime_get_sync so often, thus, we don't always touch
dev->power.lock. this is ok for us.

I will use this in the next version.

> 
> > thus add
> > a "dev->pm_domain" checking for the SoC that has pm runtime domain.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 5614015e5b96..6fe3ee2b2bf5 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -808,7 +808,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > -static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> > +static int __maybe_unused mtk_iommu_runtime_suspend(struct device *dev)
> >  {
> >  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
> >  	struct mtk_iommu_suspend_reg *reg = &data->reg;
> > @@ -826,7 +826,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> >  	return 0;
> >  }
> >  
> > -static int __maybe_unused mtk_iommu_resume(struct device *dev)
> > +static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
> >  {
> >  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
> >  	struct mtk_iommu_suspend_reg *reg = &data->reg;
> > @@ -853,7 +853,25 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
> >  	return 0;
> >  }
> >  
> > +static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> > +{
> > +	/* runtime PM is disabled when suspend in pm_runtime case. */
> > +	if (dev->pm_domain && pm_runtime_status_suspended(dev))
> > +		return 0;
> > +
> > +	return mtk_iommu_runtime_suspend(dev);
> > +}
> > +
> > +static int __maybe_unused mtk_iommu_resume(struct device *dev)
> > +{
> > +	if (dev->pm_domain && pm_runtime_status_suspended(dev))
> > +		return 0;
> > +
> > +	return mtk_iommu_runtime_resume(dev);
> > +}
> 
> Wouldn't it be enough to just use pm_runtime_force_suspend() and
> pm_runtime_force_resume() as system sleep ops?

After above solution, this is ok.

Thanks.
> 
> > +
> >  static const struct dev_pm_ops mtk_iommu_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(mtk_iommu_runtime_suspend, mtk_iommu_runtime_resume, NULL)
> >  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_iommu_suspend, mtk_iommu_resume)
> >  };
> >  
> > -- 
> > 2.18.0
> > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
