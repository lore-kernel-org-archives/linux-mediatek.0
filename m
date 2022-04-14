Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8849C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMPStW7d6LiGdufRCzCC0Dtsv06W7XJGk8p3JQxtyC8=; b=oW0IWJKxtSaVNc
	EsxUAvZHcUSK1gkl5a+UaSHC4VjnOv1qBL0Li9/BkN274Uy6qbqlftkqv7z0sCMJyahhGziKizoPH
	VAq8c9I/NCxrNh6bw720IrsXrWhgYsoK8+LygxarKBSi9jrXwB0C5VeIwnTf1lydk5GIpTKAyNRSZ
	53sL1wXV/BYH/96nDIfd3tl6kFuU048vNL2bLzcRigqlBLo109/31nJ7GPBBulfhgciWwFkC+B1X6
	CqHNGIZ69yS1eI4Z9l/E2MdnN/Qu4KBL/Xah7scC3+1pun2UyEeX0e+WczNFPHN2MEXIYLpT5aK3K
	sRaIqrglADzhzLLFSwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1netJY-004BvO-5E; Thu, 14 Apr 2022 06:50:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1netIC-004BKD-P1; Thu, 14 Apr 2022 06:49:27 +0000
X-UUID: ac19b778593d4de299f468c17f701d01-20220413
X-UUID: ac19b778593d4de299f468c17f701d01-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1296105323; Wed, 13 Apr 2022 23:49:17 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 23:48:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Apr 2022 14:48:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 14:48:13 +0800
Message-ID: <28247d885762e59439a59cfd01e045a26cead1a1.camel@mediatek.com>
Subject: Re: [PATCH v14 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
From: moudy.ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 "Benjamin Gaignard" <benjamin.gaignard@collabora.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 14 Apr 2022 14:48:12 +0800
In-Reply-To: <0193f6b6-0019-3080-2615-02225eb4bf3b@collabora.com>
References: <20220411072403.24016-1-moudy.ho@mediatek.com>
 <20220411072403.24016-2-moudy.ho@mediatek.com>
 <0193f6b6-0019-3080-2615-02225eb4bf3b@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_234924_845487_1839D86B 
X-CRM114-Status: GOOD (  31.54  )
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

On Wed, 2022-04-13 at 10:27 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/04/22 09:23, Moudy Ho ha scritto:
> > In order to allow multiple modules to operate MUTEX hardware
> > through
> > a common interfrace, a flexible index "mtk_mutex_table_index" needs
> > to
> > be added to replace original component ID so that like DDP and MDP
> > can add their own MUTEX table settings independently.
> > 
> > In addition, 4 generic interface "mtk_mutex_set_mod",
> > "mtk_mutex_set_sof",
> > "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added,
> > which is
> > expected to replace the "mtk_mutex_add_comp" and
> > "mtk_mutex_remove_comp"
> > pair originally dedicated to DDP in the future.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Change-Id: I6a2ab74fccf36248165ce4a6b268d82a1177afc9
> > ---
> >   drivers/soc/mediatek/mtk-mutex.c       | 89
> > ++++++++++++++++++++++++++
> >   include/linux/soc/mediatek/mtk-mutex.h | 21 ++++++
> >   2 files changed, 110 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index aaf8fc1abb43..48a04dce50d5 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -156,6 +156,8 @@ struct mtk_mutex_data {
> >   	const unsigned int *mutex_sof;
> >   	const unsigned int mutex_mod_reg;
> >   	const unsigned int mutex_sof_reg;
> > +	const unsigned int *mutex_table_mod;
> > +	const unsigned int *mutex_table_sof;
> >   	const bool no_clk;
> >   };
> >   
> > @@ -445,6 +447,54 @@ void mtk_mutex_add_comp(struct mtk_mutex
> > *mutex,
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
> >   
> 
Hi Angelo,

Thanks you for helping to point out the deficiencies.

> Hello Moudy,
> 
> Some critical things, and one cleanup.
> 
> First of all, the commit title is very long, and it also contains a
> typo.
> I would go for something like
> "soc: mediatek: mutex: Add common interface for modules setting".
> 

As you said, this modification will make the description more explicit.

> Also, please remove your internal "Change-Id" tag, this is
> meaningless on
> upstream, hence not applicable here.
> 

Thanks for the correction, I also found this error and resent using the
link below:
Message ID = 20220411074925.25539-2-moudy.ho@mediatek.com/
It will be additionally confirmed when the next version is sent out.

> Now for the cleanup: I have an idea to make this a bit shorter (and
> please
> feel free to change function names with something more appropriate,
> if needed):
> 
Appreciate for the good changes.
As suggested, I'll add return values for error handling and simplify
the set and clear MOD/SOF functions.

Thanks,
Moudy

> static int mtk_mutex_write_mod(struct mtk_mutex *mutex,
> 				enum mtk_mutex_table_index idx,
> 				bool clear)
> {
> 
> 
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +	unsigned int reg;
> > +	unsigned int offset;
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> > +	    idx >= MUTEX_TABLE_IDX_MAX) {
> > +		dev_err(mtx->dev, "Not supported MOD table index : %d",
> > idx);
> > +		return;
> 
> 		return -EINVAL;
> 
> > +	}
> > +
> > +	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> > +				    mutex->id);
> > +
> > +	reg = readl_relaxed(mtx->regs + offset);
> 
> if (clear)
> 	reg &= ~BIT(mtx->data->mutex_table_mod[idx])
> else
> 	reg |= BIT(mtx->data->mutex_table_mod[idx])
> 
> > +	reg |= 1 << mtx->data->mutex_table_mod[idx];
> > +	writel_relaxed(reg, mtx->regs + offset);
> > +}
> 
> int mtk_mutex_set_mod(struct mtk_mutex *mutex,
> 		      enum mtk_mutex_table_index idx)
> {
> 	return mtk_mutex_write_mod(mutex, idx, false);
> }
> 
> int mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> 			enum mtk_mutex_table_index idx)
> {
> 	return mtk_mutex_clear_mod(mutex, idx, true);
> }
> 
> > +EXPORT_SYMBOL_GPL(mtk_mutex_set_mod);
> > +
> > +void mtk_mutex_set_sof(struct mtk_mutex *mutex,
> > +		       enum mtk_mutex_table_index idx)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +	unsigned int sof_id;
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> > +	    idx >= MUTEX_TABLE_IDX_MAX) {
> > +		dev_err(mtx->dev, "Not supported SOF table index : %d",
> > idx);
> > +		return;
> > +	}
> > +
> > +	sof_id = mtx->data->mutex_table_sof[idx];
> 
> ... same changes here, except we'd have something like
> 
> if (clear)
> 	val = MUTEX_SOF_SINGLE_MODE;
> else
> 	val = mtx->data->mutex_sof[sof_id];
> 
> 	writel_relaxed(val, ...etc)
> 
> but feel free to give me valid reasons to not use this approach.
> 
> In any case, the code looks ok to me.
> 
> 
> Regards,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
