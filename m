Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E09C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRvjInvmcIrWKHXmVHg+NdsA9Dre8UyXbYlR6FVT/M0=; b=uN4oJwNrOtAqEzWHZlHws9yctL
	H1RigrLSMgyPObqiGRRHnSWm+1A+t87EBcTeioU1Xr70LZ0GsEpHcuAKMcwGAFPERhLIFu3jK5X0q
	nd6Xl/qfYYmB6hOmF+1OLYOJDr71Zzv9FPZ0aYSXEPbqvBJ+wwQ+ijhOlOkWVIY5BiU8//FvivPai
	QZ1pB7bLCVDleyllaRdv22zrKPz0M1ZiEkNdT8dYR3f3nSvcWP8guSJ7ujknigfJT2krv95UKrACC
	t+BDpM8JNUjCmn4cfTxpfz7VlZD+YAFRYhYgYBWHS9nipJwYEfeNCd7ynmlZ0rN3vncDmLLXVmw4X
	XXpyB1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofef7-009ErF-Mu; Tue, 04 Oct 2022 09:56:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofef4-009EqA-KZ; Tue, 04 Oct 2022 09:56:28 +0000
X-UUID: 86d96ea9e3494d9eb7127de3b8c2804b-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=IRvjInvmcIrWKHXmVHg+NdsA9Dre8UyXbYlR6FVT/M0=;
	b=qUWObh5RDiGRh6r6XNoQN9cdZw+ehcJ0NR3qE4+uFF+3wlkHCqbDs6ueayQjlrJCxzOp2rDMpzil9i+Ufqqg3sSvEZJcRBwzUN0RE/GUAomtdko/f2cHTb2MgJIWmRbHPQeFVN7mSlX+j/IP915Q1whkP4sPQ6r1kD5EuJX1Y18=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1dff03bc-086d-4344-ad15-19523e36afc8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:407830fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 86d96ea9e3494d9eb7127de3b8c2804b-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 801079065; Tue, 04 Oct 2022 02:56:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:35:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 4 Oct 2022 17:35:46 +0800
Message-ID: <38f315581afa8b42113a931a9009b0688a226bbe.camel@mediatek.com>
Subject: Re: [PATCH v8, 1/4] mailbox: mtk-cmdq: add gce software ddr enable
 private data
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>
Date: Tue, 4 Oct 2022 17:35:46 +0800
In-Reply-To: <ec6f3ea90c3386c55d2894f79c117d9ac508a20d.camel@mediatek.com>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
	 <20220930160638.7588-2-yongqiang.niu@mediatek.com>
	 <ec6f3ea90c3386c55d2894f79c117d9ac508a20d.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_025626_701137_2400AF18 
X-CRM114-Status: GOOD (  26.98  )
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

On Mon, 2022-10-03 at 12:00 +0800, CK Hu (胡俊光) wrote:
> Hi, Yongqiang:
> 
> On Sat, 2022-10-01 at 00:06 +0800, Yongqiang Niu wrote:
> > if gce work control by software, we need set software enable
> > for MT8186 Soc
> > 
> > there is a handshake flow between gce and ddr hardware,
> > if not set ddr enable flag of gce, ddr will fall into idle
> > mode, then gce instructions will not process done.
> > we need set this flag of gce to tell ddr when gce is idle or busy
> > controlled by software flow.
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 9465f9081515..88db6b4642db 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -38,6 +38,8 @@
> >  #define CMDQ_THR_PRIORITY		0x40
> >  
> >  #define GCE_GCTL_VALUE			0x48
> > +#define GCE_CTRL_BY_SW				GENMASK(2, 0)
> > +#define GCE_DDR_EN				GENMASK(18, 16)
> >  
> >  #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
> >  #define CMDQ_THR_ENABLED		0x1
> > @@ -80,6 +82,7 @@ struct cmdq {
> >  	bool			suspended;
> >  	u8			shift_pa;
> >  	bool			control_by_sw;
> > +	bool			sw_ddr_en;
> >  	u32			gce_num;
> >  };
> >  
> > @@ -87,6 +90,7 @@ struct gce_plat {
> >  	u32 thread_nr;
> >  	u8 shift;
> >  	bool control_by_sw;
> > +	bool sw_ddr_en;
> >  	u32 gce_num;
> >  };
> >  
> > @@ -130,6 +134,10 @@ static void cmdq_init(struct cmdq *cmdq)
> >  	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> >  	if (cmdq->control_by_sw)
> >  		writel(0x7, cmdq->base + GCE_GCTL_VALUE);
> > +
> > +	if (cmdq->sw_ddr_en)
> > +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base +
> > GCE_GCTL_VALUE);
> 
> I think 0x48[18:16]0x48[2:0] and 0x48[2:0] control different things
> and fix
> different problem. So for this patch, you should just control
> 0x48[18:16] and the code would be:
> 
> if (cmdq->sw_ddr_en) {
> 	reg = readl(cmdq->base + GCE_GCTL_VALUE);
> 	reg |= GCE_DDR_EN;
> 	writel(reg, cmdq->base + GCE_GCTL_VALUE);
> }
> 
> Regards,
> CK

0x48[2:0] means control by software
0x48[18:16] means ddr enable 
0x48[2:0] is pre-condition of 0x48[18:16].
if we want set 0x48[18:16] ddr enable, 0x48[2:0] must be set at same
time.


> 
> > +
> >  	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base +
> > CMDQ_THR_SLOT_CYCLES);
> >  	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
> >  		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> > @@ -543,6 +551,7 @@ static int cmdq_probe(struct platform_device
> > *pdev)
> >  	cmdq->thread_nr = plat_data->thread_nr;
> >  	cmdq->shift_pa = plat_data->shift;
> >  	cmdq->control_by_sw = plat_data->control_by_sw;
> > +	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
> >  	cmdq->gce_num = plat_data->gce_num;
> >  	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
> >  	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler,
> > IRQF_SHARED,


