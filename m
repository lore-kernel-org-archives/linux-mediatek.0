Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945B4C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9LAWtj831kWMKnDhUR/s5uWS0/RA0QZisZzAimZKtI=; b=YLkmooRwYHC9EkddH6BzVcFaRt
	/sP3+KBG4bfvp16ALUwSrle11i/rH3QCB6u0P6+SdZspWPKq/jFvWlGz3BK73CC0tJ1eEFiVZJCLZ
	V7Fcy+nE3s6AQVpTq2eozP7zKFZAteTDGGvmHaeIOcRLMHQbu6dSU+ruBQfdA2qZYHIjh88Yx0PO1
	rZbeOIgH0rZ8Qke9p+9qyP/pIsfrcN0f9jhP18GEVxKQKE36LX4wF8zhlsL7JbJRspyYg0DpIZy4O
	oRaXLf+HLyPvmEpCsNqPbqWoCzzdLBeJt9X3b3h8hNJ+Q/BJAtQyP5S542J8CLMrHNc1vEUlgLjyt
	JxG8/b/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjmG-003JJq-FT; Mon, 26 Sep 2022 08:47:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjmD-003JE3-Ba; Mon, 26 Sep 2022 08:47:46 +0000
X-UUID: 1bca25fac7ae46a083d3e795c4034168-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=v9LAWtj831kWMKnDhUR/s5uWS0/RA0QZisZzAimZKtI=;
	b=UWL9iOmQ+r1Ra5/o9oIKRHjYPKcBOXMHqSQzO6FU63/pWb3MnwFQkk1d78Qd1+IcSJZEg/eQwacVdOMQ6DTE/rlqgGQEzW6hDqavMsdxUr19nkL+31M9JkjdYBJb3EfWwBDpciD/AFoOIPnpkkkoXo5TWrfWnlyUa2X9jWB4dSk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f68adc2a-d958-46ee-b073-78b5f40eea0e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e3ed3ae4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1bca25fac7ae46a083d3e795c4034168-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 32777005; Mon, 26 Sep 2022 01:47:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 26 Sep 2022 16:26:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 16:26:55 +0800
Message-ID: <f9380411a43b61752546859f964fa2e75b48981b.camel@mediatek.com>
Subject: Re: [RESEND PATCH v2] mailbox: mtk-cmdq: fix gce timeout issue
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
Date: Mon, 26 Sep 2022 16:26:55 +0800
In-Reply-To: <afa996b6-ee13-5add-9248-9339aa0beb02@collabora.com>
References: <20220919071238.23920-1-yongqiang.niu@mediatek.com>
	 <afa996b6-ee13-5add-9248-9339aa0beb02@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_014745_432978_5C06BBD5 
X-CRM114-Status: GOOD (  41.42  )
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

On Tue, 2022-09-20 at 10:48 +0200, AngeloGioacchino Del Regno wrote:
> Il 19/09/22 09:12, Yongqiang Niu ha scritto:
> > 1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18)
> > when gce work,
> > and disable gce ddr enable when gce work job done
> > 2. split cmdq clk enable/disable api, and control gce ddr
> > enable/disable
> > in clk enable/disable function to make sure it could protect when
> > cmdq
> > is multiple used by display and mdp
> > 
> > this is only for some SOC which has flag "control_by_sw".
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
> > ---
> >   drivers/mailbox/mtk-cmdq-mailbox.c | 66
> > +++++++++++++++++++++++++++---
> >   1 file changed, 61 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 9465f9081515..3a1b11de84be 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -80,16 +80,60 @@ struct cmdq {
> >   	bool			suspended;
> >   	u8			shift_pa;
> >   	bool			control_by_sw;
> > +	bool			sw_ddr_en;
> >   	u32			gce_num;
> > +	atomic_t		usage;
> > +	spinlock_t		lock;
> >   };
> >   
> >   struct gce_plat {
> >   	u32 thread_nr;
> >   	u8 shift;
> >   	bool control_by_sw;
> > +	bool sw_ddr_en;
> >   	u32 gce_num;
> >   };
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
> > +	if (usage <= 0 || ret < 0) {
> > +		dev_err(cmdq->mbox.dev, "ref count %d ret %d suspend
> > %d\n",
> > +			usage, ret, cmdq->suspended);
> > +	} else if (usage == 1) {
> > +		if (cmdq->sw_ddr_en)
> > +			writel((0x7 << 16) + 0x7, cmdq->base +
> > GCE_GCTL_VALUE);
> 
> Can this be used on MT8192/MT8195?
> If yes, you can avoid adding that sw_ddr_en, as you would be able to
> simply
> use `control_by_sw`, which already seems to be doing most of what
> you're adding
> here.

no, this is only for MT8186, MT8192/MT8195 no need this patch

> 
> Also, I dislike all this locking: the point of having MTK CMDQ is to
> improve
> performance (I know it's more than that, but there's no ISP upstream)
> and part
> of that happens because locking is greatly reduced.
> 
> If you add it back up, we're losing part of the point.
> 
> Though, in this driver, we are already tracking the usage of the CMDQ
> threads
> and, when there's no more usage, we're turning off the clocks: this
> is done
> through the usage of `task_busy_list`, so you *do* have a way to
> avoid adding
> more locks around.
> Besides that, you could also add a clock notifier for the same, but
> since
> the state is already tracked, I'd avoid using that.
there are two client of cmdq, both MDP and DISPLAY will use cmdq.
we need this lock to protect MDP and DISPLAY access cmdq at same time.
we need make sure cmdq clock is on when any of it client is work on.
and make sure cmd clock is off when all it's client is work done.

> 
> Moreover, (7 << 16) == GENMASK(18, 16)
> 
> #define GCE_CMD_SOMETHING GENMASK(18, 16)
this will be improve in version3
> 
> Regards,
> Angelo
> 
> 
> 


