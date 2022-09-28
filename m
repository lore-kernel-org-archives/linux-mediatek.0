Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C786C07E9D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 01:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haojR7N864LKcOnX+R+/A/65BKCGx3lL6Gy6Rs7WZyY=; b=G7PaXJMyAKfUiIqsBAa/vnPrOn
	WEwz5n+KKE8v9Px3Cjuf+aGBOLhUjs5Wr+08BFzXiK/fRu/iymRYOth2B+bOPCmgFsVfMnZfAW812
	ezNm6L3dTA1M4laFMuWY79/tUCdr8bP8EFt1Ao6IWZeL5AwJBOr1YfO/b1W51rO/KMpqAaI2bgfeD
	1jB1UUc8H89h4xMa0SdOw/SYTsLvEbiQNwK8CTSLNPBAhYQXzeK+z9onG6eshyHuQ1CvrTnQDm1IN
	hIS3DkDa3U5QEB1nuqfuOYlzuU2B/72+xO2ptS4Bm4cU8KDd9n5qBFDMADuNqvPaiX/0ArqUyDs4Q
	ANO+M/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odML4-00DUtu-D2; Wed, 28 Sep 2022 01:58:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odML1-00DUsf-7f; Wed, 28 Sep 2022 01:58:17 +0000
X-UUID: 999de3e5da814c55a620b62775f1c474-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=haojR7N864LKcOnX+R+/A/65BKCGx3lL6Gy6Rs7WZyY=;
	b=CtmReQvtiNA7v2arh5HMOOmEEiyl146dGpSrbR9j8qE4uUJhUKcZooJJT5VPI0v22kFJANr1tZSbxxi27qabwb+/5PDhfvQPK1Y5mg4gmIAXRzH/eGlAF1wQwsePXMh4UvNtotO75MsWR2kQU9DrVbBTMg/4lVCB7OpgQUcYeEo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b19a1ed3-1fd6-4da0-a5cb-5a41a0328f5d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:363f3d07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 999de3e5da814c55a620b62775f1c474-20220927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1213077918; Tue, 27 Sep 2022 18:58:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 09:57:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 28 Sep 2022 09:57:54 +0800
Message-ID: <325c9c728c51dd8270b36c62ef67f972f9a37ef2.camel@mediatek.com>
Subject: Re: [PATCH v5] mailbox: mtk-cmdq: fix gce timeout issue
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
Date: Wed, 28 Sep 2022 09:57:53 +0800
In-Reply-To: <4b6ed7d1-31b7-265b-6f0f-58f0f7015177@collabora.com>
References: <20220927083925.28433-1-yongqiang.niu@mediatek.com>
	 <4b6ed7d1-31b7-265b-6f0f-58f0f7015177@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_185815_324805_DA164B13 
X-CRM114-Status: GOOD (  32.70  )
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

On Tue, 2022-09-27 at 13:14 +0200, AngeloGioacchino Del Regno wrote:
> Il 27/09/22 10:39, Yongqiang Niu ha scritto:
> > 1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18)
> > when gce work,
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
> > ---
> > change since v4:
> > 1. remove spin lock control flow
> > 2. move ddr control into suspend/resume/remove function
> > ---
> > 
> > ---
> >   drivers/mailbox/mtk-cmdq-mailbox.c | 44
> > +++++++++++++++++++++++++++++-
> >   1 file changed, 43 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 9465f9081515..e9ead72b9bd3 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -38,6 +38,8 @@
> >   #define CMDQ_THR_PRIORITY		0x40
> >   
> >   #define GCE_GCTL_VALUE			0x48
> > +#define GCE_CTRL_BY_SW				GENMASK(18, 16)
> > +#define GCE_DDR_EN				GENMASK(2, 0)
> >   
> >   #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
> >   #define CMDQ_THR_ENABLED		0x1
> > @@ -80,6 +82,7 @@ struct cmdq {
> >   	bool			suspended;
> >   	u8			shift_pa;
> >   	bool			control_by_sw;
> > +	bool			sw_ddr_en;
> >   	u32			gce_num;
> >   };
> >   
> > @@ -87,9 +90,25 @@ struct gce_plat {
> >   	u32 thread_nr;
> >   	u8 shift;
> >   	bool control_by_sw;
> > +	bool sw_ddr_en;
> >   	u32 gce_num;
> >   };
> >   
> > +static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
> > +{
> > +	if (!cmdq->sw_ddr_en)
> > +		return;
> > +
> > +	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> > +
> > +	if (enable)
> > +		writel(GCE_DDR_EN + GCE_CTRL_BY_SW, cmdq->base +
> > GCE_GCTL_VALUE);
> 
> Adding up values to activate bits in this case works, but that's
> wrong.
> You want GCE_DDR_EN | GCE_CTRL_BY_SW.
> 
> Regards,
> Angelo

this will be fixed in next version.


