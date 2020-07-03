Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C76C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 02:40:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423E2206B6
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 02:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x8woZLXq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rU+Qxowk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423E2206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ZaN5aTO04pgAqJp8biEv2lAGbiBfnvsl1/SRCecMJc=; b=x8woZLXqSNstgJIE4ORwGTLOR
	wdxtNrY0EH76fPqVABztaCRhtycfzf7+HS+eLfDbOi04zpSHhiLO3OqzYUoq7+p2urj1BXZ+yckPc
	yZai6Zb63h/6rI3pz6/dYM3JorqLqC4gckdHeJpgtELp9OrR2qpyB5yniOt3UJYwE4/z7ZnlZmywC
	nC/4IAT5UXmLXlM49PFVSrt9Eo6Rd18vI0+koXIn0hwAfaFLrSV3iuExo16w2DFL1nnxdg/yRaehX
	6ftgq7UhzLmzPoeFjGRSqW5voa9lEWwl8UBToceBZChvd5zptloyeZ4izQPZygiC03qOlCZ3bwI1j
	31QF1BFrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrBco-00037T-OT; Fri, 03 Jul 2020 02:40:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrBbr-0002OC-50; Fri, 03 Jul 2020 02:39:28 +0000
X-UUID: 2da78d960a3949fcaf629d147fbb964b-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ubghZLeTNlicdHeDwlIOfrhXL375GKduXj/VbUzsdHM=; 
 b=rU+Qxowk3TNvO24jARAFD+TWLBTgDwEBgBXZ9wvMsf9Xh+LEkqpXi6+chqUa2OGMuJZey3YxnNxq7o1XY8YN4zjuL62B6DALbw2qLRh5OYwq/kwnijl7fo1wn1aPQA2XFM3IfwjjrCe5vxdvez9e7l4uDn74v/GMWyfN+uwCPMg=;
X-UUID: 2da78d960a3949fcaf629d147fbb964b-20200702
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 576224745; Thu, 02 Jul 2020 18:39:16 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 19:39:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 10:39:13 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 10:39:13 +0800
Message-ID: <1593743885.22738.2.camel@mbjsdccf07>
Subject: Re: [PATCH v5 04/10] iommu/mediatek: Setting MISC_CTRL register
From: chao hao <Chao.Hao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 3 Jul 2020 10:38:05 +0800
In-Reply-To: <b9a68cda-bb2e-c9f3-4e44-c201df06c396@gmail.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
 <20200629071310.1557-5-chao.hao@mediatek.com>
 <0e9ceba8-0cc4-44a1-148c-1c9a6b3844ce@gmail.com>
 <1593514398.2581.7.camel@mbjsdccf07>
 <b9a68cda-bb2e-c9f3-4e44-c201df06c396@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3EE8F4A8513308CBFB404D0FBB6A79928236E6EF658504C0F5CE61D2EE0CAC8E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_223927_360698_D8D51B0E 
X-CRM114-Status: GOOD (  33.80  )
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-01 at 16:58 +0200, Matthias Brugger wrote:
> 
> On 30/06/2020 12:53, chao hao wrote:
> > On Mon, 2020-06-29 at 11:28 +0200, Matthias Brugger wrote:
> >>
> >> On 29/06/2020 09:13, Chao Hao wrote:
> >>> Add F_MMU_IN_ORDER_WR_EN and F_MMU_STANDARD_AXI_MODE_BIT definition
> >>> in MISC_CTRL register.
> >>> F_MMU_STANDARD_AXI_MODE_BIT:
> >>>   If we set F_MMU_STANDARD_AXI_MODE_BIT(bit[3][19] = 0, not follow
> >>> standard AXI protocol), iommu will send urgent read command firstly
> >>> compare with normal read command to improve performance.
> >>
> >> Can you please help me to understand the phrase. Sorry I'm not a AXI specialist.
> >> Does this mean that you will send a 'urgent read command' which is not described
> >> in the specifications instead of a normal read command?
> > 
> > ok.
> > iommu sends read command to next bus_node normally(we can name it to
> > cmd1), when cmd1 isn't handled by next bus_node, iommu has a urgent read
> > command is needed to be sent(we can name it to cmd2), iommu will send
> > cmd2 and replace cmd1. So cmd2 is handled by next bus_node firstly and
> > cmd2 will be handled secondly.
> > But for standard AXI protocol, it will ignore the priority of read
> > command and only be handled in order. So cmd2 is handled by next
> > bus_node after cmd1 is done.
> > 
> 
> Thanks. So I propose change this part of the commit message to something like:
> F_MMU_STANDARD_AXI_MODE_BIT:
> If we set F_MMU_STANDARD_AXI_MODE_EN_MASK (bit[3][19] = 0, not follow standard
> AXI protocol), the iommu will priorize sending of urgent read command over a
> normal read command. This improves the performance.
> 
ok, thanks

> >>
> >>> F_MMU_IN_ORDER_WR_EN:
> >>>   If we set F_MMU_IN_ORDER_WR_EN(bit[1][17] = 0, out-of-order write), iommu
> >>> will re-order write command and send more higher priority write command
> >>> instead of sending write command in order. The feature be controlled
> >>> by OUT_ORDER_EN macro definition.
> 
> F_MMU_IN_ORDER_WR_EN:
> If we set F_MMU_IN_ORDER_WR_EN_MASK (bit[1][17] = 0, out-of-order write), the
> iommu will re-order write commands and send the write command with higher
> priority. Otherwise the sending of write commands will be done in order. The
> feature is controlled by OUT_ORDER_WR_EN platform data flag.
> 
> 
> >>>
> >>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> >>> Suggested-by: Yong Wu <yong.wu@mediatek.com>
> >>> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> >>> ---
> >>>  drivers/iommu/mtk_iommu.c | 12 +++++++++++-
> >>>  drivers/iommu/mtk_iommu.h |  1 +
> >>>  2 files changed, 12 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >>> index 8f81df6cbe51..67b46b5d83d9 100644
> >>> --- a/drivers/iommu/mtk_iommu.c
> >>> +++ b/drivers/iommu/mtk_iommu.c
> >>> @@ -42,6 +42,9 @@
> >>>  #define F_INVLD_EN1				BIT(1)
> >>>  
> >>>  #define REG_MMU_MISC_CTRL			0x048
> >>> +#define F_MMU_IN_ORDER_WR_EN			(BIT(1) | BIT(17))
> >>> +#define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
> >>
> >> Wouldn't it make more sense to name it F_MMU_STANDARD_AXI_MODE_EN?
> > ok, you are right.
> > 1'b1: follow standard axi protocol
> > 
> 
> What about
> F_MMU_IN_ORDER_WR_EN_MASK
> F_MMU_STANDARD_AXI_MODE_EN_MASK
> 
> Background is that we have to set/unset two bits to enable or disable the
> feature, so it's a mask we have to apply to the register.
> 

ok, thanks for your advice

> Regards,
> Matthias
> 
> >>
> >>> +
> >>>  #define REG_MMU_DCM_DIS				0x050
> >>>  
> >>>  #define REG_MMU_CTRL_REG			0x110
> >>> @@ -574,10 +577,17 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >>>  	}
> >>>  	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
> >>>  
> >>> +	regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
> >>
> >> We only need to read regval in the else branch.
> > 
> > ok, I got it. thanks
> > 
> >>
> >>>  	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
> >>>  		/* The register is called STANDARD_AXI_MODE in this case */
> >>> -		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
> >>> +		regval = 0;
> >>> +	} else {
> >>> +		/* For mm_iommu, it can improve performance by the setting */
> >>> +		regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
> >>> +		if (MTK_IOMMU_HAS_FLAG(data->plat_data, OUT_ORDER_EN))
> >>> +			regval &= ~F_MMU_IN_ORDER_WR_EN;
> >>>  	}
> >>> +	writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
> >>>  
> >>>  	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
> >>>  			     dev_name(data->dev), (void *)data)) {
> >>> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> >>> index 7cc39f729263..4b780b651ef4 100644
> >>> --- a/drivers/iommu/mtk_iommu.h
> >>> +++ b/drivers/iommu/mtk_iommu.h
> >>> @@ -22,6 +22,7 @@
> >>>  #define HAS_BCLK			BIT(1)
> >>>  #define HAS_VLD_PA_RNG			BIT(2)
> >>>  #define RESET_AXI			BIT(3)
> >>> +#define OUT_ORDER_EN			BIT(4)
> >>
> >> Maybe something like OUT_ORDER_WR_EN, to make clear that it's about the the
> >> write path.
> >>
> > ok, thanks for your advice.
> > 
> >>>  
> >>>  #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
> >>>  		((((pdata)->flags) & (_x)) == (_x))
> >>>
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
