Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D13CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:29:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A14520747
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xv7tiHlj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f2/xqBMk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A14520747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9rklaKTWlTHtgosT9sGcIjL8aN5l+LcV/3yS+QuAUTw=; b=Xv7tiHljxW6oSR5yOqRZ+qGhp
	gENEopaAg++adyKACyk8yfZNb1D/gcYyarI67EurHEvk1Y2TttGkGB80O9iC9JLg0F27suq2Ak1kA
	P0C1bM9nnBKnhnmPtT+vvEyy8g9fGiaR5SkpT4MczSANEEZndmg/AIsb9w35RdvfKebZxuOIeWxPW
	O+2iKjFmHx0QbZWCP9/jOBIrPinuRr8PlPkOwBwybNKXPSHdaeOYrjBAbc424/gJfhYp4jIr3YYet
	12byaywhmjh772Fs1cSEy2EiWtlb8f9GjmknLiqZtk3QhsFp4exrwwrmS7b8Mmc8QPSwFYy7hh+69
	IVcmgz+ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZ2w-0005Kb-T3; Wed, 01 Jul 2020 09:28:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYmT-0002oD-F9; Wed, 01 Jul 2020 09:11:50 +0000
X-UUID: 47b29c660f8447cb91640262f2442540-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cp0uXdfNJp8Bg/Ghio0s4ftUhM/JfzKVMysMp8sxB/8=; 
 b=f2/xqBMk1N3YM89VXuPuezYAyapB/EXopcuyJHuxUwbt2lwXwUtsDRS4xR4aX31A8/SR3u54GEq6oB1LzorCROAV17sShAhcPY+jiTBtQXNTHJAeqq9dNFSEOan/jXdRukG41grqsMA2+akRv5ZZJbeALH2xW3zd4DbOw4zaRcY=;
X-UUID: 47b29c660f8447cb91640262f2442540-20200701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1469168185; Wed, 01 Jul 2020 01:11:43 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 02:01:49 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 17:01:47 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 17:01:48 +0800
Message-ID: <1593594109.26931.2.camel@mtkswgap22>
Subject: Re: [PATCH v5 3/4] dmaengine: mediatek-cqdma: add dma mask for
 capability
From: EastL <EastL.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 1 Jul 2020 17:01:49 +0800
In-Reply-To: <54703443-fb01-5aa2-089c-5c7616404b7a@gmail.com>
References: <1592553902-30592-1-git-send-email-EastL.Lee@mediatek.com>
 <1592553902-30592-4-git-send-email-EastL.Lee@mediatek.com>
 <54703443-fb01-5aa2-089c-5c7616404b7a@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_051149_747367_D0E32916 
X-CRM114-Status: GOOD (  18.90  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-19 at 11:39 +0200, Matthias Brugger wrote:
> 
> On 19/06/2020 10:05, EastL wrote:
> > This patch add dma mask for capability.
> > 
> > Signed-off-by: EastL <EastL.Lee@mediatek.com>
> > ---
> >  drivers/dma/mediatek/mtk-cqdma.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> > index 905bbcb..ed33c64 100644
> > --- a/drivers/dma/mediatek/mtk-cqdma.c
> > +++ b/drivers/dma/mediatek/mtk-cqdma.c
> > @@ -117,6 +117,7 @@ struct mtk_cqdma_vchan {
> >   * @clk:                    The clock that device internal is using
> >   * @dma_requests:           The number of VCs the device supports to
> >   * @dma_channels:           The number of PCs the device supports to
> > + * @dma_mask:               A mask for DMA capability
> >   * @vc:                     The pointer to all available VCs
> >   * @pc:                     The pointer to all the underlying PCs
> >   */
> > @@ -126,6 +127,7 @@ struct mtk_cqdma_device {
> >  
> >  	u32 dma_requests;
> >  	u32 dma_channels;
> > +	u32 dma_mask;
> >  	struct mtk_cqdma_vchan *vc;
> >  	struct mtk_cqdma_pchan **pc;
> >  };
> > @@ -607,6 +609,21 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
> >  		cqdma->dma_channels = MTK_CQDMA_NR_PCHANS;
> >  	}
> >  
> > +	if (pdev->dev.of_node)
> > +		err = of_property_read_u32(pdev->dev.of_node,
> > +					   "dma-channel-mask",
> > +					   &cqdma->dma_mask);
> > +	if (err) {
> > +		dev_warn(&pdev->dev,
> > +			 "Using 0 as missing dma-channel-mask property\n");
> > +		cqdma->dma_mask = 0;
> > +	}
> > +
> > +	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(cqdma->dma_mask))) {
> > +		dev_warn(&pdev->dev, "DMA set mask fail\n");
> 
> fail -> failed
> 
> With this:
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

OK.
> 
> > +		return -EINVAL;
> > +	}
> > +
> >  	cqdma->pc = devm_kcalloc(&pdev->dev, cqdma->dma_channels,
> >  				 sizeof(*cqdma->pc), GFP_KERNEL);
> >  	if (!cqdma->pc)
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
