Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D103FC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 06:10:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72141610A2
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 06:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72141610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h8jXcz7PEHPdUb98hEx3ex+IX4XLzW9pGh4M10cOAko=; b=i4jcb45ZfnJjZ3uL83A1tV4lS
	h/+ZVyWEOCzxwAcZwX+L7P6poqt1NoC5heAjUcIDWRTuYwYhPEt+zDYK9pXglfBN7XSALD8qIlHNa
	Tw5U2R0Innyib6uvQGhGWqUxsd2GE40jF+W+gkPIFq4W1Zsf+I/+oB6ITlXa8DFt5ST/4gDiOVlGz
	PABudIoUGspwoJcB4e4qYRYB2TFZe5gq+27A5KzuY10PVydVlHQQG7/L7Z1YhLV75laJTeuF9z5Wn
	Iw+V389CAWPy0lq/Pr0zYA2WdckYRd0LKpqLKRQa1r8v4KohSuWcR/giTf2d8+jslZ0PKHvri+PcA
	2pcSsErYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUNrT-0073H0-4R; Thu, 08 Apr 2021 06:09:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUNrM-0073Fw-Dp; Thu, 08 Apr 2021 06:09:48 +0000
X-UUID: 9fa8749c5daa47fdaa1ab4d8b63f14b4-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EJEGrtJeH59qQNQHwYtSxuFXpFKOfiBvVZE4IMKw+UI=; 
 b=UsTCpPMvfYiOkL2VHzgv6WKbUAMQH6RFhyRvvqDhgiIv6Bi/AAMMH4w3EqIS6isiMjpthY8Ed+UtZ4MxUoiOsqDQBMq5m5P+KCfHesA8/ndodQtV4/QUBrVyxm1TD1FT1A6TVbnxWEgRHG8rZMeQ+0uyq+lVubnCnF50C22Ki5Q=;
X-UUID: 9fa8749c5daa47fdaa1ab4d8b63f14b4-20210407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1496909932; Wed, 07 Apr 2021 23:09:38 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 23:09:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 14:09:28 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 14:09:28 +0800
Message-ID: <1617862168.8874.13.camel@mtksdccf07>
Subject: Re: [PATCH v2 5/6] soc: mediatek: devapc: add debug register for
 new IC support
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Date: Thu, 8 Apr 2021 14:09:28 +0800
In-Reply-To: <23c0d15c-6cc2-dc40-e45a-c2fb749cec1f@gmail.com>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-5-git-send-email-nina-cm.wu@mediatek.com>
 <23c0d15c-6cc2-dc40-e45a-c2fb749cec1f@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7CAFF274F06E74740FF1A0901266ECC9C36F1710CE7BB4806B874DD48507ED1D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_070945_428107_CA0DF711 
X-CRM114-Status: GOOD (  31.24  )
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

Hi, Matthias

On Tue, 2021-04-06 at 15:53 +0200, Matthias Brugger wrote:
> 
> On 01/04/2021 08:38, Nina Wu wrote:
> > From: Nina Wu <Nina-CM.Wu@mediatek.com>
> > 
> > There are 3 debug info registers in new ICs while in legacy ones,
> > we have only 2. When dumping the debug info, we need to check first
> > if the 3rd debug register exists and then we can konw how to decipher
> > the debug info.
> > 
> > Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-devapc.c | 31 +++++++++++++++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> > index bcf6e3c..af55c01 100644
> > --- a/drivers/soc/mediatek/mtk-devapc.c
> > +++ b/drivers/soc/mediatek/mtk-devapc.c
> > @@ -26,9 +26,19 @@ struct mtk_devapc_vio_dbgs {
> >  			u32 addr_h:4;
> >  			u32 resv:4;
> >  		} dbg0_bits;
> > +
> > +		/* Not used, reference only */
> > +		struct {
> > +			u32 dmnid:6;
> > +			u32 vio_w:1;
> > +			u32 vio_r:1;
> > +			u32 addr_h:4;
> > +			u32 resv:20;
> > +		} dbg0_bits_ver2;
> >  	};
> >  
> >  	u32 vio_dbg1;
> > +	u32 vio_dbg2;
> >  };
> >  
> >  struct mtk_devapc_data {
> > @@ -37,6 +47,7 @@ struct mtk_devapc_data {
> >  	u32 vio_sta_offset;
> >  	u32 vio_dbg0_offset;
> >  	u32 vio_dbg1_offset;
> > +	u32 vio_dbg2_offset;
> >  	u32 apc_con_offset;
> >  	u32 vio_shift_sta_offset;
> >  	u32 vio_shift_sel_offset;
> > @@ -158,12 +169,29 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> >  	struct mtk_devapc_vio_dbgs vio_dbgs;
> >  	void __iomem *vio_dbg0_reg;
> >  	void __iomem *vio_dbg1_reg;
> > +	void __iomem *vio_dbg2_reg;
> > +	u32 vio_addr, bus_id;
> >  
> >  	vio_dbg0_reg = ctx->base + ctx->data->vio_dbg0_offset;
> >  	vio_dbg1_reg = ctx->base + ctx->data->vio_dbg1_offset;
> > +	vio_dbg2_reg = ctx->base + ctx->data->vio_dbg2_offset;
> 
> We should read this only if we have version2 of the devapc.
> 

You're right.
It is not good to read vio_dbg2_reg in version one. Even though we will
only get the value from offset 0 (which is not expected) instead of
doing any real harm. (like causing bus hang)


> >  
> >  	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
> >  	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
> > +	vio_dbgs.vio_dbg2 = readl(vio_dbg2_reg);
> > +
> > +	if (!ctx->data->vio_dbg2_offset) {
> 
> I think we should add a version field to mtk_devapc_data to distinguish the two
> of them.

OK.
I will try to add this field in the next version

> 
> > +		/* arch version 1 */
> > +		bus_id = vio_dbgs.dbg0_bits.mstid;
> > +		vio_addr = vio_dbgs.vio_dbg1;
> > +	} else {
> > +		/* arch version 2 */
> > +		bus_id = vio_dbgs.vio_dbg1;
> > +		vio_addr = vio_dbgs.vio_dbg2;
> > +
> > +		/* To align with the bit definition of arch_ver 1 */
> > +		vio_dbgs.vio_dbg0 = (vio_dbgs.vio_dbg0 << 16);
> 
> That's magic, better add another variable domain_id and do here:
> domain_id = vio_dgbs.dbg0_bits_ver2.dmnid;
> 

OK.
I will fix it up in the next version.

Thanks

> > +	}
> >  
> >  	/* Print violation information */
> >  	if (vio_dbgs.dbg0_bits.vio_w)
> > @@ -172,8 +200,7 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
> >  		dev_info(ctx->dev, "Read Violation\n");
> >  
> >  	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
> > -		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
> > -		 vio_dbgs.vio_dbg1);
> > +		 bus_id, vio_dbgs.dbg0_bits.dmnid, vio_addr);
> >  }
> >  
> >  /*
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
