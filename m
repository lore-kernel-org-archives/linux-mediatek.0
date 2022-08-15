Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4BEC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 05:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RUKz6/dLinmtYoBTmwBcPJQ/p2os2LZKzce0dyloVA=; b=KBz3U9ow1ttu99eYYrxVvaMrPy
	COKPVNjgYOSAf6IOSj9TywcpUE0goh7Tg4DxNjs14LXfc0v9W5XzrdyAjB47EY+doCN2SqpC1Oy62
	qry4q2KuOdgZffnutWLPEa4laIolR/zPhaTfOarje7baqwG6eRjw0/b9S8whGXNAQ0CCeB8h1ibvw
	iR1GTXO3UK42EumuYR+44UcrupiK3liFkaS7ixbHZCF7U1T/XlM5Av5nFK022qmX96gR/Hu6hMZbu
	k6F8Qqfh03L8CS0Z9UreesZOyvJ+6f99DxdGLIAttNeNZl4Sykjtp+J8c9qpgaUL+roDLxiHx/7N8
	1csjK1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNT1a-00BdIb-9z; Mon, 15 Aug 2022 05:52:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNT1V-00BdDj-JW; Mon, 15 Aug 2022 05:52:28 +0000
X-UUID: f09d831276db4f91b41630ae0e11e5ce-20220814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3RUKz6/dLinmtYoBTmwBcPJQ/p2os2LZKzce0dyloVA=;
	b=bM3LeLYZZazofGVlg9bSzY0d91q+vkLm06Z8O+udkL7Soc04YVwMPTvB9bzRz7afpVK6/xh3C+QDKq9UZ/hnQflu+i4NBMoLwwFkg5cPqyRRT7QN7Sqw5a84hllONyV54sM6ZnLWe/ST+WVQY8ASemU2hsu20k4drlVyzmcs7Ec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:88c819dc-c4e3-4a36-b95a-b235cafed7db,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:7,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:12
X-CID-META: VersionHash:3d8acc9,CLOUDID:e60b50fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f09d831276db4f91b41630ae0e11e5ce-20220814
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2136802898; Sun, 14 Aug 2022 22:52:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 13:51:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Aug 2022 13:51:51 +0800
Message-ID: <36abe0f4e45c81f4b6f1e4914f8c19baa0155912.camel@mediatek.com>
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
Date: Mon, 15 Aug 2022 13:51:51 +0800
In-Reply-To: <d2e6147dc342867aba18f71869c9b4d4230f6ccc.camel@mediatek.com>
References: <20220815030740.28899-1-yongqiang.niu@mediatek.com>
	 <20220815030740.28899-2-yongqiang.niu@mediatek.com>
	 <d2e6147dc342867aba18f71869c9b4d4230f6ccc.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_225225_946352_F2F2D669 
X-CRM114-Status: GOOD (  26.08  )
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

On Mon, 2022-08-15 at 13:24 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> 
> On Mon, 2022-08-15 at 11:07 +0800, Yongqiang Niu wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com
> > >
> > 
> > 1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18)
> > when
> > gce work,
> > and disable gce ddr enable when gce work job done
> 
> Why need gce ddr enable? I think gce works fine without this.
> Describe
> more about this.
> 
> Regards,
> CK

this is only for some SOC which has flag "control_by_sw".
for this kind of gce, there is a handshake flow between gce and ddr
hardware,
if not set ddr enable flag of gce, ddr will fall into idle mode, 
then gce instructions will not process done.
we need set this flag of gce to tell ddr when gce is idle or busy
controlled by software flow.

> 
> > 2. split cmdq clk enable/disable api, and control gce ddr
> > enable/disable
> > in clk enable/disable function to make sure it could protect when
> > cmdq
> > is multiple used by display and mdp
> > 
> > Signed-off-by: Yongqiang Niu <
> > yongqiang.niu@mediatek.corp-partner.google.com>
> > Signed-off-by: Allen-kh Cheng <
> > allen-kh.cheng@mediatek.corp-partner.google.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 57 ++++++++++++++++++++++++++
> > ----
> >  1 file changed, 51 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 2578e5aaa935..64a47470f062 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -81,6 +81,8 @@ struct cmdq {
> >  	u8			shift_pa;
> >  	bool			control_by_sw;
> >  	u32			gce_num;
> > +	atomic_t		usage;
> > +	spinlock_t		lock;
> >  };
> >  
> >  struct gce_plat {
> > @@ -90,6 +92,46 @@ struct gce_plat {
> >  	u32 gce_num;
> >  };
> >  
> > +static s32 cmdq_clk_enable(struct cmdq *cmdq)
> > +{
> > +	s32 usage, ret;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&cmdq->lock, flags);
> > +
> > +	usage = atomic_inc_return(&cmdq->usage);
> > +
> > +	ret = clk_bulk_enable(cmdq->gce_num, cmdq->clocks);
> > +	if (usage <=0 || ret < 0) {
> > +		dev_err(cmdq->mbox.dev, "ref count %d ret %d suspend
> > %d\n",
> > +			usage, ret, cmdq->suspended);
> > +	} else if (usage == 1) {
> > +		if (cmdq->control_by_sw)
> > +			writel((0x7 << 16) + 0x7, cmdq->base +
> > GCE_GCTL_VALUE);
> > +	}
> > +
> > +	spin_unlock_irqrestore(&cmdq->lock, flags);
> > +
> > +	return ret;
> > +}
> > +
> > +static void cmdq_clk_disable(struct cmdq *cmdq)
> > +{
> > +	s32 usage;
> > +
> > +	usage = atomic_dec_return(&cmdq->usage);
> > +
> > +	if (usage < 0) {
> > +		dev_err(cmdq->mbox.dev, "ref count %d suspend %d\n",
> > +			usage, cmdq->suspended);
> > +	} else if (usage == 0) {
> > +		if (cmdq->control_by_sw)
> > +			writel(0x7, cmdq->base + GCE_GCTL_VALUE);
> > +	}
> > +
> > +	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > +}
> > +
> >  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> >  {
> >  	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq,
> > mbox);
> > @@ -271,7 +313,8 @@ static void cmdq_thread_irq_handler(struct cmdq
> > *cmdq,
> >  
> >  	if (list_empty(&thread->task_busy_list)) {
> >  		cmdq_thread_disable(cmdq, thread);
> > -		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > +
> > +		cmdq_clk_disable(cmdq);
> >  	}
> >  }
> >  
> > @@ -360,8 +403,7 @@ static int cmdq_mbox_send_data(struct mbox_chan
> > *chan, void *data)
> >  	task->pkt = pkt;
> >  
> >  	if (list_empty(&thread->task_busy_list)) {
> > -		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> > -
> > +		WARN_ON(cmdq_clk_enable(cmdq) < 0);
> >  		/*
> >  		 * The thread reset will clear thread related register
> > to 0,
> >  		 * including pc, end, priority, irq, suspend and
> > enable. Thus
> > @@ -433,7 +475,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan
> > *chan)
> >  	}
> >  
> >  	cmdq_thread_disable(cmdq, thread);
> > -	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > +	cmdq_clk_disable(cmdq);
> >  
> >  done:
> >  	/*
> > @@ -479,7 +521,8 @@ static int cmdq_mbox_flush(struct mbox_chan
> > *chan, unsigned long timeout)
> >  
> >  	cmdq_thread_resume(thread);
> >  	cmdq_thread_disable(cmdq, thread);
> > -	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > +
> > +	cmdq_clk_disable(cmdq);
> >  
> >  out:
> >  	spin_unlock_irqrestore(&thread->chan->lock, flags);
> > @@ -490,7 +533,8 @@ static int cmdq_mbox_flush(struct mbox_chan
> > *chan, unsigned long timeout)
> >  	spin_unlock_irqrestore(&thread->chan->lock, flags);
> >  	if (readl_poll_timeout_atomic(thread->base +
> > CMDQ_THR_ENABLE_TASK,
> >  				      enable, enable == 0, 1, timeout))
> > {
> > -		dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x
> > done\n",
> > +		dev_err(cmdq->mbox.dev,
> > +			"Fail to wait GCE thread 0x%x done\n",
> >  			(u32)(thread->base - cmdq->base));
> >  
> >  		return -EFAULT;
> > @@ -626,6 +670,7 @@ static int cmdq_probe(struct platform_device
> > *pdev)
> >  
> >  	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
> >  
> > +	spin_lock_init(&cmdq->lock);
> >  	cmdq_init(cmdq);
> >  
> >  	return 0;
> 
> 


