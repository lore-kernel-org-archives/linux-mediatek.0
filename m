Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE842C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFIu1BdXjDbDqWT3ZL2OZhqGmjmApaENQHyIXD7/GkQ=; b=wDmLzXU+6zhzpX
	H6hSBcbRZgi/a3tJQDb/Y8ulcEu3alqCzKrTEaWPs+nwgauSyPMCkebNdcqTGziJaWzfEdlBNNX7E
	bWWMwhZw9VTSXTlHZ4nT2Wh8uDrmnRD9seRebWO4X8vltB/jkuW46JvRHVEQegu55lXMCTLENESRa
	/z9R5afoi7wB/iC8pHqMil1dBdGOC6mGt/qrICxTWqlfgHyX+z8NAXe/wQzxbuaDS6Lc8V23tgvq1
	nzVrzvwyUeIUsbw8dHmHc+//ArwQR+RHRJsAUjdHCmu1rMgIdi2rkGTyafE0O7nApJ/EYMJuQK9Va
	IzEQJvHwUiPZcee2HBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUpf0-00GAeI-FF; Thu, 17 Mar 2022 12:55:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUpex-00GAd2-4L; Thu, 17 Mar 2022 12:55:20 +0000
X-UUID: e6155913c6cc4033954c9e50dbf463c6-20220317
X-UUID: e6155913c6cc4033954c9e50dbf463c6-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1940619776; Thu, 17 Mar 2022 05:55:14 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 05:45:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 20:45:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 20:45:09 +0800
Message-ID: <54d6e58c70dbf8ca258c28b723f90e2a8fad5470.camel@mediatek.com>
Subject: Re: [PATCH v13 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
From: moudy.ho <moudy.ho@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 17 Mar 2022 20:45:09 +0800
In-Reply-To: <00a1b51452d0a8fcdd9807845580678f6739e974.camel@mediatek.com>
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-2-moudy.ho@mediatek.com>
 <00a1b51452d0a8fcdd9807845580678f6739e974.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_055519_186131_6047DDCA 
X-CRM114-Status: GOOD (  22.96  )
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

On Wed, 2022-03-16 at 10:25 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Tue, 2022-03-15 at 14:10 +0800, Moudy Ho wrote:
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
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c       | 122
> > +++++++++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-mutex.h |  33 +++++++
> >  2 files changed, 155 insertions(+)
> > 
> 
> [snip]
> 
> > 
> > diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> > b/include/linux/soc/mediatek/mtk-mutex.h
> > index 6fe4ffbde290..c8355bb0e6d6 100644
> > --- a/include/linux/soc/mediatek/mtk-mutex.h
> > +++ b/include/linux/soc/mediatek/mtk-mutex.h
> > @@ -10,14 +10,47 @@ struct regmap;
> >  struct device;
> >  struct mtk_mutex;
> >  
> > +enum mtk_mutex_table_index {
> > +	MUTEX_TABLE_IDX_NONE = 0,	/* Invalid engine */
> 
> Useless, so remove this.
> 
> > +
> > +	/* MDP table index */
> > +	MUTEX_TABLE_IDX_MDP_RDMA0,
> > +	MUTEX_TABLE_IDX_MDP_RSZ0,
> > +	MUTEX_TABLE_IDX_MDP_RSZ1,
> > +	MUTEX_TABLE_IDX_MDP_TDSHP0,
> > +	MUTEX_TABLE_IDX_MDP_WROT0,
> > +	MUTEX_TABLE_IDX_MDP_WDMA,
> > +	MUTEX_TABLE_IDX_MDP_AAL0,
> > +	MUTEX_TABLE_IDX_MDP_CCORR0,
> > +
> > +	/* DDP table index */
> > +	MUTEX_TABLE_IDX_DDP_DSI0,
> > +	MUTEX_TABLE_IDX_DDP_DSI1,
> > +	MUTEX_TABLE_IDX_DDP_DSI2,
> > +	MUTEX_TABLE_IDX_DDP_DSI3,
> > +	MUTEX_TABLE_IDX_DDP_DPI0,
> > +	MUTEX_TABLE_IDX_DDP_DPI1,
> > +	MUTEX_TABLE_IDX_DDP_DP_INTF0,
> > +	MUTEX_TABLE_IDX_DDP_DP_INTF1,
> 
> If this patch would support DDP, add all DDP index. If this patch
> does
> not support DDP, remove these.
> 
> Regards,
> CK
> 

Hi CK,

Thanks for your review. I will remove those redundant settings.

Thanks,
Moudy
> > +
> > +	MUTEX_TABLE_IDX_MAX		/* ALWAYS keep at the end */
> > +};
> > +
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev);
> >  int mtk_mutex_prepare(struct mtk_mutex *mutex);
> >  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
> >  			enum mtk_ddp_comp_id id);
> > +void mtk_mutex_set_mod(struct mtk_mutex *mutex,
> > +		       enum mtk_mutex_table_index idx);
> > +void mtk_mutex_set_sof(struct mtk_mutex *mutex,
> > +		       enum mtk_mutex_table_index idx);
> >  void mtk_mutex_enable(struct mtk_mutex *mutex);
> >  void mtk_mutex_disable(struct mtk_mutex *mutex);
> >  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
> >  			   enum mtk_ddp_comp_id id);
> > +void mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> > +			 enum mtk_mutex_table_index idx);
> > +void mtk_mutex_clear_sof(struct mtk_mutex *mutex);
> >  void mtk_mutex_unprepare(struct mtk_mutex *mutex);
> >  void mtk_mutex_put(struct mtk_mutex *mutex);
> >  void mtk_mutex_acquire(struct mtk_mutex *mutex);
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
