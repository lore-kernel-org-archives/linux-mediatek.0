Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10082C25B0D
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 02:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/sRlx2IDcnC1FLbFWa0qhonx7WTvZc6hf5MhNRAJ5A=; b=bwi+4GD1+Ti++LURdfbGQDH5M9
	EaGuiITK+t/acqzfM81BngboE+dCnDR1ZBGHZ8bCIQl1vbwLkHK+UtAFqlmeU2AIj5ipE9xC3RRb9
	Srbo41QqVcBLmRzQzBZgj54wAsIGCYrKRt1L1l8rU9t2/cIL/tzLvER/a3kxbNSkC/uahQ5hmz46l
	+ROUcfSJNi9LYf3wzZzeiSXmFLhxk+cMDp1LJW+1OdHHPeEt5SLsf693kPDwqAMriw1mf8aIqiOmW
	DRrb6cXt0p26kmy23EmK5h9bucduNVFN2VDZ9dcF52Xbqx1HHKYbiHLfdfsfYyAepKLBsm2aJmzAY
	Kpa/zsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNm5s-0090hw-G2; Tue, 16 Aug 2022 02:14:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNm5p-0090g6-Lt; Tue, 16 Aug 2022 02:14:11 +0000
X-UUID: 3bdf93cd618043b6950785894a4727e6-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=7/sRlx2IDcnC1FLbFWa0qhonx7WTvZc6hf5MhNRAJ5A=;
	b=GdJDsDs1ATmUURsrGsK3CoOrZIUTXIu1yaFDI/iCXBMIcXejmz/eM+PmFyAnwvVjwPZCkDY7wGER8VM7rDl+o+It+yAvnOPRjIOgsOnTj3F68mSf9KeemURYJ7/F48w9aKJcBVaY6wdtl4sDdDniv2gMAT3ERRGfoBuiDGO0/B4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:c935bd1c-3cea-43e3-9995-1887677346b2,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:9692e8ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3bdf93cd618043b6950785894a4727e6-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 206532323; Mon, 15 Aug 2022 19:14:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 16 Aug 2022 10:14:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 16 Aug 2022 10:14:00 +0800
Message-ID: <ef07b4b95aab756040f980afcc14196c9d6e6f68.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] mailbox: mtk-cmdq: fix gce timeout issue
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu
	<yongqiang.niu@mediatek.corp-partner.google.com>, Allen-kh Cheng
	<allen-kh.cheng@mediatek.corp-partner.google.com>
Date: Tue, 16 Aug 2022 10:14:00 +0800
In-Reply-To: <a1150254b69a06af638272758a895e4932364908.camel@mediatek.com>
References: <20220815030740.28899-1-yongqiang.niu@mediatek.com>
	 <20220815030740.28899-2-yongqiang.niu@mediatek.com>
	 <d2e6147dc342867aba18f71869c9b4d4230f6ccc.camel@mediatek.com>
	 <36abe0f4e45c81f4b6f1e4914f8c19baa0155912.camel@mediatek.com>
	 <312adeb830eb31e81915dd2189b03e5c05ef4155.camel@mediatek.com>
	 <3cce65f17080b0084dd2d56b2d6165778b11d3d4.camel@mediatek.com>
	 <a1150254b69a06af638272758a895e4932364908.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_191409_768070_E7415AEF 
X-CRM114-Status: GOOD (  49.76  )
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

On Tue, 2022-08-16 at 09:49 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Mon, 2022-08-15 at 17:51 +0800, yongqiang.niu wrote:
> > On Mon, 2022-08-15 at 14:23 +0800, CK Hu wrote:
> > > Hi, Yongqiang:
> > > 
> > > On Mon, 2022-08-15 at 13:51 +0800, yongqiang.niu wrote:
> > > > On Mon, 2022-08-15 at 13:24 +0800, CK Hu wrote:
> > > > > Hi, Yongqiang:
> > > > > 
> > > > > 
> > > > > On Mon, 2022-08-15 at 11:07 +0800, Yongqiang Niu wrote:
> > > > > > From: Yongqiang Niu <
> > > > > > yongqiang.niu@mediatek.corp-partner.google.com
> > > > > > > 
> > > > > > 
> > > > > > 1. enable gce ddr enable(gce reigster offset 0x48, bit 16
> > > > > > to
> > > > > > 18)
> > > > > > when
> > > > > > gce work,
> > > > > > and disable gce ddr enable when gce work job done
> > > > > 
> > > > > Why need gce ddr enable? I think gce works fine without this.
> > > > > Describe
> > > > > more about this.
> > > > > 
> > > > > Regards,
> > > > > CK
> > > > 
> > > > this is only for some SOC which has flag "control_by_sw".
> > > > for this kind of gce, there is a handshake flow between gce and
> > > > ddr
> > > > hardware,
> > > > if not set ddr enable flag of gce, ddr will fall into idle
> > > > mode, 
> > > > then gce instructions will not process done.
> > > > we need set this flag of gce to tell ddr when gce is idle or
> > > > busy
> > > > controlled by software flow.
> > > 
> > > You [1] and Jason [2] has already enable control_by_sw and I
> > > believe
> > > you two have test your patch in general. Is the ddr problem a
> > > special
> > > case? How to operate to trigger this bug? Describe more in commit
> > > message to let us know why need this patch.
> > > 
> > > [1] 
> > > 
> > 
> > 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mailbox/mtk-cmdq-mailbox.c?h=v6.0-rc1&id=84fd4201b78b96f8d31f6a2624be27ad6306a9bc
> > > [2] 
> > > 
> > 
> > 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mailbox/mtk-cmdq-mailbox.c?h=v6.0-rc1&id=9388501fbb99a1b6a23f28634d125567a3b45a3d
> > > 
> > 
> > ddr problem is a special case.
> > when test suspend/resume case, gce sometimes will pull ddr, and ddr
> > can
> > not go to suspend.
> > if we set gce register 0x48 to 0x7, will fix this gce pull ddr
> > issue,
> > as you have referred [1] and [2] (8192 and 8195)
> > 
> > but for mt8186, the gce is more special, except setting of [1] and
> > [2],
> > we need add more setting set gce register 0x48 to (0x7 << 16 | 0x7)
> > when gce working to make sure gce could process all instructions
> > ok.
> > this case just need normal bootup, if we not set this, display cmdq
> > task will timeout, and chrome homescreen will always black screen.
> > 
> > and for this patch, we have done these test on mt8186:
> > 1.suspend/resume
> > 2.boot up to home screen
> > 3.playback video with youtube.
> > 
> > mt8195 is under testing
> 
> I seems there are two problem. The first is suspend problem which is
> fixed by [1] and [2]. The second is boot problem which only happen in
> MT8186. So add a new driver private data for the boot problem.
> 
> For the suspend problem, I think the correct suspend flow is:
> 
> 1. Client driver suspend: flush all command in mailbox channel.
> 2. gce driver suspend: Do nothing to gce hardware because all gce
> thread is empty.
> 3. System suspend: suspend the ddr.
> 
> If you find that gce pull the ddr when ddr suspend, that means client
> driver does not flush all command when suspend, so fix the client
> driver and gce would not pull ddr when ddr suspend. 
> 
> Regards,
> CK
> 

1.suspend issue is special gce hardware issue, gce client  driver
command already process done, but gce still pull ddr.

2. I will add new private data for MT8186 boot up issue in next version


> > 
> > > 
> > > > 
> > > > > 
> > > > > > 2. split cmdq clk enable/disable api, and control gce ddr
> > > > > > enable/disable
> > > > > > in clk enable/disable function to make sure it could
> > > > > > protect
> > > > > > when
> > > > > > cmdq
> > > > > > is multiple used by display and mdp
> > > > > > 
> > > > > > Signed-off-by: Yongqiang Niu <
> > > > > > yongqiang.niu@mediatek.corp-partner.google.com>
> > > > > > Signed-off-by: Allen-kh Cheng <
> > > > > > allen-kh.cheng@mediatek.corp-partner.google.com>
> > > > > > ---
> > > > > >  drivers/mailbox/mtk-cmdq-mailbox.c | 57
> > > > > > ++++++++++++++++++++++++++
> > > > > > ----
> > > > > >  1 file changed, 51 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > > > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > > > index 2578e5aaa935..64a47470f062 100644
> > > > > > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > > > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > > > @@ -81,6 +81,8 @@ struct cmdq {
> > > > > >  	u8			shift_pa;
> > > > > >  	bool			control_by_sw;
> > > > > >  	u32			gce_num;
> > > > > > +	atomic_t		usage;
> > > > > > +	spinlock_t		lock;
> > > > > >  };
> > > > > >  
> > > > > >  struct gce_plat {
> > > > > > @@ -90,6 +92,46 @@ struct gce_plat {
> > > > > >  	u32 gce_num;
> > > > > >  };
> > > > > >  
> > > > > > +static s32 cmdq_clk_enable(struct cmdq *cmdq)
> > > > > > +{
> > > > > > +	s32 usage, ret;
> > > > > > +	unsigned long flags;
> > > > > > +
> > > > > > +	spin_lock_irqsave(&cmdq->lock, flags);
> > > > > > +
> > > > > > +	usage = atomic_inc_return(&cmdq->usage);
> > > > > > +
> > > > > > +	ret = clk_bulk_enable(cmdq->gce_num, cmdq->clocks);
> > > > > > +	if (usage <=0 || ret < 0) {
> > > > > > +		dev_err(cmdq->mbox.dev, "ref count %d ret %d
> > > > > > suspend
> > > > > > %d\n",
> > > > > > +			usage, ret, cmdq->suspended);
> > > > > > +	} else if (usage == 1) {
> > > > > > +		if (cmdq->control_by_sw)
> > > > > > +			writel((0x7 << 16) + 0x7, cmdq->base +
> > > > > > GCE_GCTL_VALUE);
> > > > > > +	}
> > > > > > +
> > > > > > +	spin_unlock_irqrestore(&cmdq->lock, flags);
> > > > > > +
> > > > > > +	return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static void cmdq_clk_disable(struct cmdq *cmdq)
> > > > > > +{
> > > > > > +	s32 usage;
> > > > > > +
> > > > > > +	usage = atomic_dec_return(&cmdq->usage);
> > > > > > +
> > > > > > +	if (usage < 0) {
> > > > > > +		dev_err(cmdq->mbox.dev, "ref count %d suspend
> > > > > > %d\n",
> > > > > > +			usage, cmdq->suspended);
> > > > > > +	} else if (usage == 0) {
> > > > > > +		if (cmdq->control_by_sw)
> > > > > > +			writel(0x7, cmdq->base +
> > > > > > GCE_GCTL_VALUE);
> > > > > > +	}
> > > > > > +
> > > > > > +	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > > > > > +}
> > > > > > +
> > > > > >  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> > > > > >  {
> > > > > >  	struct cmdq *cmdq = container_of(chan->mbox, struct
> > > > > > cmdq,
> > > > > > mbox);
> > > > > > @@ -271,7 +313,8 @@ static void
> > > > > > cmdq_thread_irq_handler(struct
> > > > > > cmdq
> > > > > > *cmdq,
> > > > > >  
> > > > > >  	if (list_empty(&thread->task_busy_list)) {
> > > > > >  		cmdq_thread_disable(cmdq, thread);
> > > > > > -		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > > > > > +
> > > > > > +		cmdq_clk_disable(cmdq);
> > > > > >  	}
> > > > > >  }
> > > > > >  
> > > > > > @@ -360,8 +403,7 @@ static int cmdq_mbox_send_data(struct
> > > > > > mbox_chan
> > > > > > *chan, void *data)
> > > > > >  	task->pkt = pkt;
> > > > > >  
> > > > > >  	if (list_empty(&thread->task_busy_list)) {
> > > > > > -		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq-
> > > > > > > clocks));
> > > > > > 
> > > > > > -
> > > > > > +		WARN_ON(cmdq_clk_enable(cmdq) < 0);
> > > > > >  		/*
> > > > > >  		 * The thread reset will clear thread related
> > > > > > register
> > > > > > to 0,
> > > > > >  		 * including pc, end, priority, irq, suspend
> > > > > > and
> > > > > > enable. Thus
> > > > > > @@ -433,7 +475,7 @@ static void cmdq_mbox_shutdown(struct
> > > > > > mbox_chan
> > > > > > *chan)
> > > > > >  	}
> > > > > >  
> > > > > >  	cmdq_thread_disable(cmdq, thread);
> > > > > > -	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > > > > > +	cmdq_clk_disable(cmdq);
> > > > > >  
> > > > > >  done:
> > > > > >  	/*
> > > > > > @@ -479,7 +521,8 @@ static int cmdq_mbox_flush(struct
> > > > > > mbox_chan
> > > > > > *chan, unsigned long timeout)
> > > > > >  
> > > > > >  	cmdq_thread_resume(thread);
> > > > > >  	cmdq_thread_disable(cmdq, thread);
> > > > > > -	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > > > > > +
> > > > > > +	cmdq_clk_disable(cmdq);
> > > > > >  
> > > > > >  out:
> > > > > >  	spin_unlock_irqrestore(&thread->chan->lock, flags);
> > > > > > @@ -490,7 +533,8 @@ static int cmdq_mbox_flush(struct
> > > > > > mbox_chan
> > > > > > *chan, unsigned long timeout)
> > > > > >  	spin_unlock_irqrestore(&thread->chan->lock, flags);
> > > > > >  	if (readl_poll_timeout_atomic(thread->base +
> > > > > > CMDQ_THR_ENABLE_TASK,
> > > > > >  				      enable, enable == 0, 1,
> > > > > > timeout))
> > > > > > {
> > > > > > -		dev_err(cmdq->mbox.dev, "Fail to wait GCE
> > > > > > thread 0x%x
> > > > > > done\n",
> > > > > > +		dev_err(cmdq->mbox.dev,
> > > > > > +			"Fail to wait GCE thread 0x%x done\n",
> > > > > >  			(u32)(thread->base - cmdq->base));
> > > > > >  
> > > > > >  		return -EFAULT;
> > > > > > @@ -626,6 +670,7 @@ static int cmdq_probe(struct
> > > > > > platform_device
> > > > > > *pdev)
> > > > > >  
> > > > > >  	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
> > > > > >  
> > > > > > +	spin_lock_init(&cmdq->lock);
> > > > > >  	cmdq_init(cmdq);
> > > > > >  
> > > > > >  	return 0;
> > > > > 
> > > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 


