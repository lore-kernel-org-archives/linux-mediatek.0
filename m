Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76595C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTLsRpmUFmmbO3TeoeOypPSYUBbCPWtV/biiOsOyT8k=; b=pR0EwSPmLe9Xf/RqvuYulmjFdp
	TOSPAyh9zoGx/Ckp53vJYtUg9vvujG6b7d/kFR27fG4eq3zDIZRF/9bpqpCzzZyCkBUvS2RUGrOur
	SNKSNaKqq9V1Gcqy70HopNGEufO1C8Kbbk4UoJAMCn1jTGfxUn379X8hdWvoaGCANgCN3VRcHATLi
	id7P7cw0LazJn4AujgRy2bpx8rVuBSYELORNVpdcmrxdS/f9cEdJOsU2FW5q1y7AIYfCKBhB40FL7
	sBTmFdJBDwMKyIwPbngxpA06m3likOxdNYa1OX1/Jwk7aTqGUmkxxxduUzDW/8Gid0q3Sg20n/8mx
	WsIT7Acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogcWX-006Z8u-Dg; Fri, 07 Oct 2022 01:51:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogcWT-006Z4C-SR; Fri, 07 Oct 2022 01:51:36 +0000
X-UUID: fa960f8970274a24b5609260784671fc-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vTLsRpmUFmmbO3TeoeOypPSYUBbCPWtV/biiOsOyT8k=;
	b=lIILJNKV+QlfB9LOvuyK/tZn4VgQ1iLIjauc07DdbmViYmdHlv8jXptsSIEy4xsq+gxkBWOxpgg8WhKGAKagrk4xsmLZhG4WEHOI/i3/XfbnBDpcXAbVBEXs2reVziwNYSBvvw0nNs9wSGhDSVtE7wi6jgz86YTByg9yopoT/AI=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:cbdadfff-fe01-469a-bf12-0246c9b00d0c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:54
X-CID-INFO: VERSION:1.1.11,REQID:cbdadfff-fe01-469a-bf12-0246c9b00d0c,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_HamU,ACTION:
	release,TS:54
X-CID-META: VersionHash:39a5ff1,CLOUDID:a966c6b8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:2210061729446FG0DH63,BulkQuantity:138,Recheck:0,SF:38|28|16|19|48|10
	2,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0
X-UUID: fa960f8970274a24b5609260784671fc-20221006
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 312406930; Thu, 06 Oct 2022 18:51:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 7 Oct 2022 09:51:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 7 Oct 2022 09:51:21 +0800
Message-ID: <a4b0e7744f6934dee8f0247492cc399bbf3973bf.camel@mediatek.com>
Subject: Re: [PATCH v9, 2/4] mailbox: mtk-cmdq: add gce software ddr enable
 private data
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
Date: Fri, 7 Oct 2022 09:51:21 +0800
In-Reply-To: <ded0300b-5b54-48eb-038e-102ae91573c5@collabora.com>
References: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
	 <20221006043456.8754-3-yongqiang.niu@mediatek.com>
	 <ded0300b-5b54-48eb-038e-102ae91573c5@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_185134_760239_8236A096 
X-CRM114-Status: GOOD (  27.20  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-10-06 at 11:29 +0200, AngeloGioacchino Del Regno wrote:
> Il 06/10/22 06:34, Yongqiang Niu ha scritto:
> > if gce work control by software, we need set software enable
> > for MT8186 Soc
> > 
> > there is a handshake flow between gce and ddr hardware,
> > if not set ddr enable flag of gce, ddr will fall into idle
> > mode, then gce instructions will not process done.
> > we need set this flag of gce to tell ddr when gce is idle or busy
> > controlled by software flow.
> > 
> > 0x48[2:0] means control by software
> > 0x48[18:16] means ddr enable
> > 0x48[2:0] is pre-condition of 0x48[18:16].
> > if we want set 0x48[18:16] ddr enable, 0x48[2:0] must be set at
> > same
> > time.
> > and only these bits is useful, other bits is useless bits
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >   drivers/mailbox/mtk-cmdq-mailbox.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index c3cb24f51699..04eb44d89119 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -39,6 +39,7 @@
> >   
> >   #define GCE_GCTL_VALUE			0x48
> >   #define GCE_CTRL_BY_SW				GENMASK(2, 0)
> > +#define GCE_DDR_EN				GENMASK(18, 16)
> >   
> >   #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
> >   #define CMDQ_THR_ENABLED		0x1
> > @@ -81,6 +82,7 @@ struct cmdq {
> >   	bool			suspended;
> >   	u8			shift_pa;
> >   	bool			control_by_sw;
> > +	bool			sw_ddr_en;
> >   	u32			gce_num;
> >   };
> >   
> > @@ -88,6 +90,7 @@ struct gce_plat {
> >   	u32 thread_nr;
> >   	u8 shift;
> >   	bool control_by_sw;
> > +	bool sw_ddr_en;
> >   	u32 gce_num;
> >   };
> >   
> > @@ -132,6 +135,9 @@ static void cmdq_init(struct cmdq *cmdq)
> >   	if (cmdq->control_by_sw)
> >   		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> >   
> > +	if (cmdq->sw_ddr_en)
> > +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base +
> > GCE_GCTL_VALUE);
> > +
> 
> No. That's redundant.
> Here's a better way:
> 
> 	u32 gctl_regval = 0;
> 
> 	if (cmdq->control_by_sw)
> 		gctl_regval = GCE_CTRL_BY_SW;
> 	if (cmdq->sw_ddr_en)
> 		gctl_regval |= GCE_DDR_EN;
> 
> 	if (val)
> 		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);
> 
> Regards,
> Angelo

thanks very much for your advise.
shall i separate this into two patches? 
1st one is 
	u32 gctl_regval = 0;
	if (cmdq->control_by_sw)
> 		gctl_regval = GCE_CTRL_BY_SW;
> 	if (val)
> 		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);



2nd just add this
	if (cmdq->sw_ddr_en)
> 		gctl_regval |= GCE_DDR_EN;

or one patch is ok?

> 
> >   	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base +
> > CMDQ_THR_SLOT_CYCLES);
> >   	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
> >   		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> > @@ -545,6 +551,7 @@ static int cmdq_probe(struct platform_device
> > *pdev)
> >   	cmdq->thread_nr = plat_data->thread_nr;
> >   	cmdq->shift_pa = plat_data->shift;
> >   	cmdq->control_by_sw = plat_data->control_by_sw;
> > +	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
> >   	cmdq->gce_num = plat_data->gce_num;
> >   	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
> >   	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler,
> > IRQF_SHARED,
> 
> 
> 


