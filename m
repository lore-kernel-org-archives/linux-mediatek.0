Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAAEC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dCqPZFjYFrlhQSz6nX7yCSN67+UN7JnjbCCMl4w43E=; b=zMXUEY9YRdxdYTM86IFfkxJsIc
	Sfd+reUU0MD3msXX3618g8lEA6vxY9zkisP2WGncqTQTwD0hBiBWoRi5yLii1Q38Nwam/jDW7XLEK
	ENIRYcAc+HHAXZSs6mjrVb8lWUzG6Sk6AWN0ImRbdkbH1FqGRwtDCLkAJVY/qUxFUFQ5DCZ0z59n/
	0SBr2Rgwdp2nqvezGodf5H8DXNAkB3dxHAo/CfjYwsNIAyToluTyoabCMq+iXQbtYipXibCAiFqM6
	pI8JAf5W4yFmpDDZwPWi1CNYvoaesNctsXNtTMD2p65mZWLVtgyn8E1jT+IDcKjK2/BeKGdAGpPL6
	1rrZN54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofePs-009AiU-19; Tue, 04 Oct 2022 09:40:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofePp-009AgR-Iv; Tue, 04 Oct 2022 09:40:42 +0000
X-UUID: 27e8e28a05d2482a8c034fff331cb542-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6dCqPZFjYFrlhQSz6nX7yCSN67+UN7JnjbCCMl4w43E=;
	b=Cu26uCM8R5D7ywcOi2HWnuc0oVDRBojhblVo0kuI2i2LiKs09sxkKVoeN2I/PRBIt6FY4DrJmxlTe/p1BQUwahWY5OCwCChvocYP59/ySb1XWd2aXT1AmP4w8JHZ51hximbTA8k+QxGlHGEnnkB0tCnUn+WZz7XOLQSTw3uCCLg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b322be83-ddde-4a5a-ae9a-73277f20c3e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e89a0c1f-b96c-4512-b576-5860f4fb25e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 27e8e28a05d2482a8c034fff331cb542-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1656629184; Tue, 04 Oct 2022 02:40:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:39:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 4 Oct 2022 17:39:58 +0800
Message-ID: <af7eb0cacf8657937460287dd3ff9091f9a10f30.camel@mediatek.com>
Subject: Re: [PATCH v8, 3/4] mailbox: mtk-cmdq: add gce ddr enable support
 flow
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
Date: Tue, 4 Oct 2022 17:39:57 +0800
In-Reply-To: <6bcf2f53-ffd1-5159-47a5-b3d7db548158@collabora.com>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
	 <20220930160638.7588-4-yongqiang.niu@mediatek.com>
	 <6bcf2f53-ffd1-5159-47a5-b3d7db548158@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_024041_683883_FAD79661 
X-CRM114-Status: GOOD (  23.53  )
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

On Mon, 2022-10-03 at 16:54 +0200, AngeloGioacchino Del Regno wrote:
> Il 30/09/22 18:06, Yongqiang Niu ha scritto:
> > add gce ddr enable control flow when gce suspend/resume
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >   drivers/mailbox/mtk-cmdq-mailbox.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 04eb44d89119..2db82ff838ed 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -94,6 +94,18 @@ struct gce_plat {
> >   	u32 gce_num;
> >   };
> >   
> > +static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
> > +{
> > +	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> > +
> > +	if (enable)
> > +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base +
> > GCE_GCTL_VALUE);
> 
> My only concern here is about the previous value stored in the
> GCE_GCTL_VALUE
> register, as you're overwriting it in its entirety with
> GCE_DDR_EN | GCE_CTRL_BY_SW.
> 
> Can you guarantee that this register is not pre-initialized with some
> value,
> and that these are the only bits to be `1` in this register?
> 
> Otherwise, you will have to readl and modify the bits instead... by
> the way,
> if this register doesn't get any changes during runtime, you may
> cache it
> at probe time to avoid reading it for every suspend/resume operation.
> 
> Regards,
> Angelo
> 
> 

0x48[2:0] means control by software
0x48[18:16] means ddr enable 
0x48[2:0] is pre-condition of 0x48[18:16].
if we want set 0x48[18:16] ddr enable, 0x48[2:0] must be set at same
time.
and only these bits is useful, other bits is useless bits

we need set 0x48[18:16] to 0 disable gce access ddr when suspend.
and  set 0x48[18:16] to 0x7 enable gce access ddr when resume, there
will be cmdq client send task to process.
this control flow should controlled in suspend/resume flow.



