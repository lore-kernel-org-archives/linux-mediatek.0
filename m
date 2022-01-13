Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 06:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wq5UyHzL1SdLwmtDyufK6xDQGa37a1Go9QSxkyhgiqU=; b=2piExksnl9FX5m
	W0oE8F2LXaRs1G0G89SZqiojqEZ+XfH64m5hKruViC3HfSRsqem9aK63rGapQphFmwrEStGUKoP5X
	Xdzjk4YK2aFNKM0BnUr3VLDi34zCk7YLfOyx/lBUWTnTbxCMjs4QVsg8P//l095FHIr8fQt/TxSvO
	LCZFLSNjhKOjMcoAF9aqHSgBQFv84Xnrs12YA958xKoA21+52q2TTiPxdt/dHg3rXmEegf1fiU3HW
	e5B4W7/YxqSV1tvIE/aoXPtKmlL7LW7t20+mn+t6jCOM3iatcJfXHpw8j24iEWSo0UF1WtincyfHB
	weA6qSuFI1oBM49yfANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7tCF-004kx2-JO; Thu, 13 Jan 2022 06:02:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7tCA-004kuf-DA; Thu, 13 Jan 2022 06:02:49 +0000
X-UUID: c5fd0de0a2b446c3a2b5079d0bc6a6d8-20220112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jmfz3sTqXZbc4bIBnksyKB1wlrrR8eFrQd7uAQEa++A=; 
 b=p8kV/uKVAglHgym+7JugVygVeQLYbsNw9OwuCsyvZeiOHvQ4UqW+WWjlyx2gwLlBHlNHhaRg5A5PmtwAwCaD7m5O/n9Jb/Jh/x+0OlZxhC17sGR7ejtAEOYD1sy4lMD61geLHAp3wcNgN9n4fwNXuk3EscsZxlsv/YHYqPJzvTE=;
X-UUID: c5fd0de0a2b446c3a2b5079d0bc6a6d8-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1502349384; Wed, 12 Jan 2022 23:02:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 22:02:40 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 14:02:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 14:02:37 +0800
Message-ID: <6d2759f9d2ea74affa040bfec524e87b765c67af.camel@mediatek.com>
Subject: Re: [PATCH v2 5/6] memory: mtk-smi: Add sleep ctrl function
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 13 Jan 2022 14:02:37 +0800
In-Reply-To: <22935ffa-469c-a609-c30b-919ba85b842c@canonical.com>
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-6-yong.wu@mediatek.com>
 <22935ffa-469c-a609-c30b-919ba85b842c@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_220247_852645_26293898 
X-CRM114-Status: GOOD (  28.07  )
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

On Wed, 2022-01-12 at 11:27 +0100, Krzysztof Kozlowski wrote:
> On 11/01/2022 07:39, Yong Wu wrote:
> > Sleep control means that when the larb goes to sleep, we should
> > wait a bit
> > until all the current commands are finished. Thus, when the larb
> > runtime
> > suspends, we need to enable this function to wait until all the
> > existed
> > commands are finished. When the larb resumes, just disable this
> > function.
> > This function only improves the safety of bus. Add a new flag for
> > this
> > function. Prepare for mt8186.
> > 
> > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)

[...]

> > @@ -492,9 +521,13 @@ static int __maybe_unused
> > mtk_smi_larb_resume(struct device *dev)
> >  static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
> >  {
> >  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> > +	int ret = 0;
> > +
> > +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
> > MTK_SMI_FLAG_SLEEP_CTL))
> > +		ret = mtk_smi_larb_sleep_ctrl_enable(larb);
> >  
> >  	clk_bulk_disable_unprepare(larb->smi.clk_num, larb->smi.clks);
> > -	return 0;
> > +	return ret;
> 
> I am wondering whether disabling clocks in error case is a proper
> step.
> On suspend error, the PM core won't run any further callbacks on this
> device. This means, it won't be resumed and your clocks stay
> disabled. I
> think you should return early and leave the device in active state in
> case of error.

oh, Yes. Thanks for pointing this out.

I will fix this in next version.

> 
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
