Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07376C6FA86
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGtrcvlBsTVEGYQCDRd3nKUBuU6noDgcQR/6UEaicvk=; b=pVNvZZSf4nkoGLSxxcREBYyC3p
	KdK0mOhVlzfh6WezZo3SnZs/PqXAZpO52wDeOmwbjmPYLeJYm6HVK1zDpXPCgbdovRWxdbWYyOFXk
	0Ld3wDocTK2bF/nPvmv2z9YxSwttyZvrLRQp33AhYDfzIfAjWv7BrHcT8/i6li292w+CSa/U0wmuD
	vwTh/rngsEkT89Goz9/MwjUBZ813Ta+rvI3hT43tdbLHkYEzjUqRfAalcoYdAADkCljc6SkRiC5xL
	PZCpll1sQDkecfW4FNCNDwAo9WtE5fYfwEs5WSGWeXU/EzyW2QnXTe/RTSomhJSYJ2Y1UwGPW7Aun
	y1nLpAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6t9-009Xhp-A6; Tue, 27 Sep 2022 09:28:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6pb-009VwY-0C; Tue, 27 Sep 2022 09:24:48 +0000
X-UUID: 4be4675a68c84c05b1b8d5a833b9d896-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=oGtrcvlBsTVEGYQCDRd3nKUBuU6noDgcQR/6UEaicvk=;
	b=W8qZvVnzZtlG2cwkKgy/f8s8dNKz2+N8BWkAe+FWWSwtnbvCN2+ZeeA9ybK1cw4BshkbywnhLXsKVoVriYZZDj6Ogbvop4AOKoBH7YaLzeRIlhO+meSgEnR8qbMCirteBemlDM24kwaM4lQIw1O22yFGAQOyZeDdG1ZAoTYxmP0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c5c8ac03-449e-4c4a-9174-4f02b57f88a9,IP:0,U
	RL:0,TC:0,Content:7,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:7
X-CID-META: VersionHash:39a5ff1,CLOUDID:c02f39a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4be4675a68c84c05b1b8d5a833b9d896-20220927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 852702025; Tue, 27 Sep 2022 02:24:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 16:44:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 16:44:06 +0800
Message-ID: <dc79789d1b8c8c4dde0e38bc7dbcb926a3c7ab6e.camel@mediatek.com>
Subject: Re: [PATCH v4] mailbox: mtk-cmdq: fix gce timeout issue
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
Date: Tue, 27 Sep 2022 16:44:06 +0800
In-Reply-To: <4f028db6f0e1b1b67df68f4adfde1f643d790b42.camel@mediatek.com>
References: <20220927040105.21494-1-yongqiang.niu@mediatek.com>
	 <4f028db6f0e1b1b67df68f4adfde1f643d790b42.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_022447_181159_0613E934 
X-CRM114-Status: GOOD (  40.30  )
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

On Tue, 2022-09-27 at 13:19 +0800, CK Hu (胡俊光) wrote:
> Hi, Yongqiang:
> 
> On Tue, 2022-09-27 at 12:01 +0800, Yongqiang Niu wrote:
> > 1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18)
> > when
> > gce work,
> > and disable gce ddr enable when gce work job done
> > 2. add cmdq ddr enable/disable api, and control gce ddr
> > enable/disable
> > to make sure it could protect when cmdq is multiple used by display
> > and mdp
> > 
> > this is only for some SOC which has flag "gce_ddr_en".
> > for this kind of gce, there is a handshake flow between gce and ddr
> > hardware,
> > if not set ddr enable flag of gce, ddr will fall into idle mode,
> > then gce instructions will not process done.
> > we need set this flag of gce to tell ddr when gce is idle or busy
> > controlled by software flow.
> > 
> > ddr problem is a special case.
> > when test suspend/resume case, gce sometimes will pull ddr, and ddr
> > can
> > not go to suspend.
> > if we set gce register 0x48 to 0x7, will fix this gce pull ddr
> > issue,
> > as you have referred [1] and [2] (8192 and 8195)
> > but for mt8186, the gce is more special, except setting of [1] and
> > [2],
> > we need add more setting set gce register 0x48 to (0x7 << 16 | 0x7)
> > when gce working to make sure gce could process all instructions
> > ok.
> > this case just need normal bootup, if we not set this, display cmdq
> > task will timeout, and chrome homescreen will always black screen.
> > 
> > and with this patch, we have done these test on mt8186:
> > 1.suspend/resume
> > 2.boot up to home screen
> > 3.playback video with youtube.
> > 
> > suspend issue is special gce hardware issue, gce client  driver
> > command already process done, but gce still pull ddr.
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > ---
> > change since v3:
> > split cmdq_sw_ddr_enable/cmdq_sw_ddr_disable into single api to
> > control mt8186 gce ddr enable flow
> > ---
> > 
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 61
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 9465f9081515..650a1ed1a579 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -38,6 +38,8 @@
> >  #define CMDQ_THR_PRIORITY		0x40
> >  
> >  #define GCE_GCTL_VALUE			0x48
> > +#define GCE_CTRL_BY_SW				GENMASK(18, 16)
> > +#define GCE_DDR_EN				GENMASK(2, 0)
> >  
> >  #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
> >  #define CMDQ_THR_ENABLED		0x1
> > @@ -80,16 +82,51 @@ struct cmdq {
> >  	bool			suspended;
> >  	u8			shift_pa;
> >  	bool			control_by_sw;
> > +	bool			sw_ddr_en;
> >  	u32			gce_num;
> > +	atomic_t		usage;
> > +	spinlock_t		lock;
> >  };
> >  
> >  struct gce_plat {
> >  	u32 thread_nr;
> >  	u8 shift;
> >  	bool control_by_sw;
> > +	bool sw_ddr_en;
> >  	u32 gce_num;
> >  };
> >  
> > +static void cmdq_sw_ddr_enable(struct cmdq *cmdq)
> > +{
> > +	s32 usage;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&cmdq->lock, flags);
> > +
> > +	usage = atomic_inc_return(&cmdq->usage);
> > +
> > +	if (usage <= 0)
> > +		dev_err(cmdq->mbox.dev, "ref count %d suspend %d\n",
> > +			usage, cmdq->suspended);
> > +	else if (usage == 1)
> > +		writel(GCE_DDR_EN + GCE_CTRL_BY_SW, cmdq->base +
> > GCE_GCTL_VALUE);
> > +
> > +	spin_unlock_irqrestore(&cmdq->lock, flags);
> > +}
> > +
> > +static void cmdq_sw_ddr_disable(struct cmdq *cmdq)
> > +{
> > +	s32 usage;
> > +
> > +	usage = atomic_dec_return(&cmdq->usage);
> > +
> > +	if (usage < 0)
> > +		dev_err(cmdq->mbox.dev, "ref count %d suspend %d\n",
> > +			usage, cmdq->suspended);
> > +	else if (usage == 0)
> > +		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> > +}
> > +
> >  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> >  {
> >  	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq,
> > mbox);
> > @@ -266,6 +303,10 @@ static void cmdq_thread_irq_handler(struct
> > cmdq
> > *cmdq,
> >  
> >  	if (list_empty(&thread->task_busy_list)) {
> >  		cmdq_thread_disable(cmdq, thread);
> > +
> > +		if (cmdq->sw_ddr_en)
> > +			cmdq_sw_ddr_disable(cmdq);
> > +
> >  		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> >  	}
> >  }
> > @@ -357,6 +398,8 @@ static int cmdq_mbox_send_data(struct mbox_chan
> > *chan, void *data)
> >  	if (list_empty(&thread->task_busy_list)) {
> >  		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> >  
> > +		if (cmdq->sw_ddr_en)
> > +			cmdq_sw_ddr_enable(cmdq);
> 
> Why do you dynamically enable/disable it when process every packet?
> Why
> not enable it in cmdq_mbox_startup() and disable it in
> cmdq_mbox_shutdown(), so you don't need an extra lock for spinlock.
> 
> Regards,
> CK
> 

suspend/resume flow will not call cmdq_mbox_shutdown, we need disable 
gce ddr enable after all packet process done(both include mdp and
display packet), to make sure gce will not access dram any more.

move this ddr control flow into suspend/resume flow in next version


> >  		/*
> >  		 * The thread reset will clear thread related register
> > to 0,
> >  		 * including pc, end, priority, irq, suspend and
> > enable. Thus
> > @@ -427,6 +470,9 @@ static void cmdq_mbox_shutdown(struct mbox_chan
> > *chan)
> >  		kfree(task);
> >  	}
> >  
> > +	if (cmdq->sw_ddr_en)
> > +		cmdq_sw_ddr_disable(cmdq);
> > +
> >  	cmdq_thread_disable(cmdq, thread);
> >  	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> >  
> > @@ -468,6 +514,10 @@ static int cmdq_mbox_flush(struct mbox_chan
> > *chan, unsigned long timeout)
> >  
> >  	cmdq_thread_resume(thread);
> >  	cmdq_thread_disable(cmdq, thread);
> > +
> > +	if (cmdq->sw_ddr_en)
> > +		cmdq_sw_ddr_disable(cmdq);
> > +
> >  	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> >  
> >  out:
> > @@ -543,6 +593,7 @@ static int cmdq_probe(struct platform_device
> > *pdev)
> >  	cmdq->thread_nr = plat_data->thread_nr;
> >  	cmdq->shift_pa = plat_data->shift;
> >  	cmdq->control_by_sw = plat_data->control_by_sw;
> > +	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
> >  	cmdq->gce_num = plat_data->gce_num;
> >  	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
> >  	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler,
> > IRQF_SHARED,
> > @@ -615,6 +666,7 @@ static int cmdq_probe(struct platform_device
> > *pdev)
> >  
> >  	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
> >  
> > +	spin_lock_init(&cmdq->lock);
> >  	cmdq_init(cmdq);
> >  
> >  	return 0;
> > @@ -660,9 +712,18 @@ static const struct gce_plat gce_plat_v6 = {
> >  	.gce_num = 2
> >  };
> >  
> > +static const struct gce_plat gce_plat_v7 = {
> > +	.thread_nr = 24,
> > +	.shift = 3,
> > +	.control_by_sw = true,
> > +	.sw_ddr_en = true,
> > +	.gce_num = 1
> > +};
> > +
> >  static const struct of_device_id cmdq_of_ids[] = {
> >  	{.compatible = "mediatek,mt8173-gce", .data = (void
> > *)&gce_plat_v2},
> >  	{.compatible = "mediatek,mt8183-gce", .data = (void
> > *)&gce_plat_v3},
> > +	{.compatible = "mediatek,mt8186-gce", .data = (void
> > *)&gce_plat_v7},
> >  	{.compatible = "mediatek,mt6779-gce", .data = (void
> > *)&gce_plat_v4},
> >  	{.compatible = "mediatek,mt8192-gce", .data = (void
> > *)&gce_plat_v5},
> >  	{.compatible = "mediatek,mt8195-gce", .data = (void
> > *)&gce_plat_v6},


