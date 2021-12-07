Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA2CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpwUeqwi2Uosw+yzvWGmMeVXOoKUt717vvVHQLaWPXE=; b=W3Ch6hvGrElXN8
	UJXHAy7LmO6TY1LDecdb4O1EPdNgOIAy5AQZET+TZTKLJepOqWhUB7rDflSH/fyIbNF4lvD/CO4mj
	MsIQ8uEZco6uutcH5WaPv9lYDVsR1JZvEU1E5uQQSjkuHDftveqKUPcAeqfr6sxQsDR2wGo4rXZFH
	PubL/6K/tR5kUjblsaK8y9zWiNcz1AEsX9wnDDcEXEePqbRU1rTDYhtetpfXdXhMh/dXcLrZQm1Nb
	qAh7hvzJaXhWqjJF+LDeumL3mHgJqD79Y8yM23Xbqy+FOkaPp7pIbeVCbCGblA6T/a+T2i20ITWeM
	hKeARTtrYHTLsq/FXp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muTyB-0074UI-FD; Tue, 07 Dec 2021 06:28:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muTy8-0074Tn-7Z; Tue, 07 Dec 2021 06:28:53 +0000
X-UUID: c46dc1ea3c7c445aaf8c9d70cc068d31-20211206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=69qaWgeCtoVl4LXqKx5dxuVaxCCi/f31QLGTc1pclR4=; 
 b=bh+PSfggMCrFYUQ7aMLMZc15Or4sTaulKL1h3Qh8Wt3CQGEMuch3SpQMM0vqfcFLIZ/ndKQZifD4THRj79MXMrZadgyXth5dMu+xYCCCDta4ZD40bBuD/zTKmnXcbrIBL3u7lgJ1OTKfwgyi9lbFe5+SRtWVq49UkmKcWEBhneg=;
X-UUID: c46dc1ea3c7c445aaf8c9d70cc068d31-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1231886637; Mon, 06 Dec 2021 23:28:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 22:24:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Dec 2021 14:24:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Dec 2021 14:24:11 +0800
Message-ID: <ebc8e4c0b0519043c5a82c6c967ac6d524e8869a.camel@mediatek.com>
Subject: Re: [PATCH 3/4] memory: mtk-smi: Add sleep ctrl function
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Tue, 7 Dec 2021 14:24:07 +0800
In-Reply-To: <f2ffd08a-44c3-9458-1bd8-68e3c0755611@collabora.com>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-4-yong.wu@mediatek.com>
 <f2ffd08a-44c3-9458-1bd8-68e3c0755611@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_222852_305279_27E3E361 
X-CRM114-Status: GOOD (  33.17  )
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

Hi AngeloGioacchino,

Thanks for your review.

On Mon, 2021-12-06 at 16:08 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 07:40, Yong Wu ha scritto:
> > sleep control means that when the larb go to sleep, we should wait
> > a bit
> > until all the current commands are finished. thus, when the larb
> > runtime
> > suspend, we need enable this function to wait until all the existed
> > command are finished. when the larb resume, just disable this
> > function.
> > This function only improve the safe of bus. Add a new flag for this
> > function. Prepare for mt8186.
> > 
> > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/memory/mtk-smi.c | 39
> > +++++++++++++++++++++++++++++++++++----
> >   1 file changed, 35 insertions(+), 4 deletions(-)

[snip]

> >   static int __maybe_unused mtk_smi_larb_suspend(struct device
> > *dev)
> >   {
> >   	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> > +	int ret = 0;
> > +
> > +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
> > MTK_SMI_FLAG_SLEEP_CTL))
> > +		ret = mtk_smi_larb_sleep_ctrl(dev, true);
> 
> Sorry but what happens if SLP_PROT_RDY is not getting set properly?
>  From what I can understand in the commit description that you wrote,
> if we reach
> the timeout, then the LARB transactions are not over....
> 
> I see that you are indeed returning a failure here, but you are also
> turning off
> the clocks regardless of whether we get a failure or a success; I'm
> not sure that
> this is right, as this may leave the hardware in an unpredictable
> state (since
> there were some more LARB transactions that didn't go through),
> leading to crashes
> at system resume (or when retyring to suspend).

Thanks for this question. In theory you are right. In this case, the
bus already hang.

We only printed a fail log in this patch. If this fail happens, we
should request the master to check which case cause the larb hang.

If the master has a good reason or limitation, the hang is expected, I
think we have to add larb reset in this fail case: Reset the larb when
the larb runtime resume.

Fortunately, we have never got this issue. We could add this reset when
necessary. Is this OK for you?

Thanks.

> 
> >   
> >   	clk_bulk_disable_unprepare(larb->smi.clk_num, larb->smi.clks);
> > -	return 0;
> > +	return ret;
> >   }
> >   
> >   static const struct dev_pm_ops smi_larb_pm_ops = {
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
