Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CC8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 08:14:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77DD207ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 08:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7eM2wC/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kyvH0EUB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77DD207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmLMSnx43kegNlAvli65dy3Fvfcj11dJok4IngonNe8=; b=X7eM2wC/dx074F
	9pUJtHZexWvoRsyhxavuI+vddlsHyB4FwZsaLTUA4wgWlkrzRlQgqDMYqPvFll085JwhIHcTHc+Ll
	7p6lBmL9m+kgR0f6IiqDqo0f6XCjmwSE+7is7QrBYoQR7r+2KaQTE1cMiuIG6O/KZyHSIF+lu0pGN
	z3dw10Tzp+6/YhcfFFiVMLyMC0TDLDrtiT60Gwr54FGWsy4MJAdydpb+u8E0UE7NYz4iOgntMj89r
	omUrx71YEJ+jQK4JmVSuEBEh9TrQKfAlaqKwC84RKwKrROA9gZxTRxiq5xHsyxMj0mm6He1IvdXkR
	ldv3Y/VeVrYvLQSfYE2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjepI-00022H-GI; Fri, 12 Jun 2020 08:14:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjepB-0001x6-7o; Fri, 12 Jun 2020 08:14:06 +0000
X-UUID: 819cc0c09c9948d4884a6de2e721a687-20200612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0GUyHvRF9VSyT75UO1lemvQzocW+/xKvL/7X1JD+e3c=; 
 b=kyvH0EUBv92HPX2ACqV0iGmIsriy/5p9EwSAR3r4T1xcSU5vwKwEtzt9COkq0ShUR8M9thPr/QQ9I5d26rbTQtS7gHAh7GNGONyzcGjpBUtQ/Hluusz7r4KZYYDlIFvp1q+oJolP3loCoYOKwriwq0zoG8DWbE7y64Jmbkg3FZg=;
X-UUID: 819cc0c09c9948d4884a6de2e721a687-20200612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1315875167; Fri, 12 Jun 2020 00:13:54 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 01:13:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 16:13:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Jun 2020 16:13:53 +0800
Message-ID: <1591949635.23595.9.camel@mtkswgap22>
Subject: Re: [PATCH v4 4/4] dmaengine: mediatek-cqdma: add dma mask for
 capability
From: EastL <EastL.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 12 Jun 2020 16:13:55 +0800
In-Reply-To: <ea26fb2c-aec0-c031-ac30-9e5099943d9c@gmail.com>
References: <1590659832-31476-1-git-send-email-EastL.Lee@mediatek.com>
 <1590659832-31476-5-git-send-email-EastL.Lee@mediatek.com>
 <ea26fb2c-aec0-c031-ac30-9e5099943d9c@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_011405_283552_D067F96E 
X-CRM114-Status: GOOD (  17.46  )
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

On Thu, 2020-05-28 at 16:10 +0200, Matthias Brugger wrote:
> 
> On 28/05/2020 11:57, EastL wrote:
> > This patch add dma mask for capability.
> > 
> > Change-Id: I31f4622f9541d769702029532e5f5f185815dda2
> 
> No Change-Id in the commit message please.
> 
> > Signed-off-by: EastL <EastL.Lee@mediatek.com>
> > ---
> >  drivers/dma/mediatek/mtk-cqdma.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> > index bca7118..1805a76 100644
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
> > @@ -549,6 +551,7 @@ static void mtk_cqdma_hw_deinit(struct mtk_cqdma_device *cqdma)
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_cqdma_match);
> >  
> > +static u64 cqdma_dmamask;
> >  static int mtk_cqdma_probe(struct platform_device *pdev)
> >  {
> >  	struct mtk_cqdma_device *cqdma;
> > @@ -607,6 +610,16 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
> >  		cqdma->dma_channels = MTK_CQDMA_NR_PCHANS;
> >  	}
> >  
> > +	if (pdev->dev.of_node && of_property_read_u32(pdev->dev.of_node,
> > +						      "dma-channel-mask",
> > +						      &cqdma->dma_mask)) {
> 
> I'd prefer:
> 
> if (pdev->dev.of_node)
>     ret = of_property_read_u32(pdev->dev.of_node,
>                                "dma-channel-mask",
>                                &cqdma->dma_mask))
> if (ret) {
>     dev_warn(&pdev->dev,
>              "Using 0 as missing dma-channel-mask
>               property\n");
>     cqdma->dma_mask = 0;
> }
> 
> > +		dev_info(&pdev->dev,
> > +			 "Using 0 as missing dma-channel-mask property\n");
> 
> dev_warn should be OK.
> 
> > +	} else {
> > +		cqdma_dmamask = DMA_BIT_MASK(cqdma->dma_mask);
> > +		pdev->dev.dma_mask = &cqdma_dmamask;
> 
> if (dma_set_mask(&pdev->dev,
>     DMA_BIT_MASK(cqdma->dma_mask)) {
>          /* error out */
> }
> 
OK, I'll fix it on next version.

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
