Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA82C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 05:31:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3185C239EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 05:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3185C239EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bYL/rko7+sJY2CaCksN0oumcohQnN9sTFFK2T9DJIBw=; b=JHWCRfqNAIkpVqLKJ+0SZQQtg
	o1oArnwkmhP4+w8hYHJNOryDqd4S1WQTg6gd8OXn07JrDSCS3XKkU7e1CeVFqe/tuVWK5vebYoyE/
	gS036orUmW2IhmRDVwGg7cdQKWxXU1TUE/SaLVsAPtwfJW7xFREMkXyzdYdv4UjtwUU3wwDmNBSYY
	hAzIzWuxTnvUXC8Ru+iqavCNli+Hegb1eWtoN/c7in+g7XvXZKfdyTd4h14/yAIVa8Wuaya1Qt6lB
	l3LUV70XtCZCUekZb/6gS/7tlhxTd8DQ7UHKSKcuzlZw7M6u/I9JASwZLbBg0RKzGDfy1KfJftUzb
	Q4KP0dkcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0HhB-0001VA-2m; Fri, 15 Jan 2021 05:30:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Hh4-0001Tj-UJ; Fri, 15 Jan 2021 05:30:45 +0000
X-UUID: ffccda5d60164ae591b9571125478c42-20210114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8Xzi4Jk1vwim8FSqpSrcJwUMLUAt5CxpsEAeeSgDR/A=; 
 b=KP0F6rz5HRRpj5ET6flowpLf9ANavMzQNi4XPKpHOvI8JsVItgAlbTbA2ZLVNhz9BJx75oh5fvjdZThGl3uCZAH0WmX12GDYfHyVQ96cfdz5Cxe1s/Qf98XdpUgZ2FF8g59mQlIE0ejU023cxfYoOXhVxqR0uzcNq5eQQ0cnQaU=;
X-UUID: ffccda5d60164ae591b9571125478c42-20210114
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1355738179; Thu, 14 Jan 2021 21:30:35 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Jan 2021 21:30:34 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Jan 2021 13:30:27 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Jan 2021 13:30:26 +0800
Message-ID: <1610688626.4578.1.camel@mhfsdcap03>
Subject: Re: [PATCH v6 06/33] of/device: Move dma_range_map before
 of_iommu_configure
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 15 Jan 2021 13:30:26 +0800
In-Reply-To: <20210114192732.GA3401278@robh.at.kernel.org>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-7-yong.wu@mediatek.com>
 <20210114192732.GA3401278@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84A856FA60FFA5913CE06B0A418092BC787D34670283D643131FDFCEE268D07C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_003043_763380_0B11C1FB 
X-CRM114-Status: GOOD (  19.03  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-14 at 13:27 -0600, Rob Herring wrote:
> On Mon, Jan 11, 2021 at 07:18:47PM +0800, Yong Wu wrote:
> > "dev->dma_range_map" contains the devices' dma_ranges information,
> > This patch moves dma_range_map before of_iommu_configure. The iommu
> > driver may need to know the dma_address requirements of its iommu
> > consumer devices.
> > 
> > CC: Rob Herring <robh+dt@kernel.org>
> > CC: Frank Rowand <frowand.list@gmail.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/of/device.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index aedfaaafd3e7..1d84636149df 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -170,9 +170,11 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >  	dev_dbg(dev, "device is%sdma coherent\n",
> >  		coherent ? " " : " not ");
> >  
> > +	dev->dma_range_map = map;
> >  	iommu = of_iommu_configure(dev, np, id);
> >  	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
> >  		kfree(map);
> > +		dev->dma_range_map = NULL;
> 
> Not really going to matter, but you should probably clear dma_range_map 
> before what it points to is freed.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the review. I will move it before "kfree(map)" in next
version.

> 
> >  		return -EPROBE_DEFER;
> >  	}
> >  
> > @@ -181,7 +183,6 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >  
> >  	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> >  
> > -	dev->dma_range_map = map;
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
