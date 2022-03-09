Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAAybDPjuKxZZmwbPQ0SbOXzDiTAku/hbwJkwMV4X8c=; b=h/Y6UmyAbUvMwX
	Wl2N99qaAV2Tx/rvsXsW6EYPiNwaItD1a+60vrjcE9jiGqxOuGRc91Og7LJUmFf+gzLJCkT1oyPsb
	P/udaJprVEib4zRvK4ksUbfyI5SYPtWy1UIS9yPCPs4WihwwaAr6gkTx4Rz33cqwYoCgfq+3yZa98
	NuvAmE6s4scuBqyn5l8NzdCHxz5ycqTi2ShvBV8Nn9OjKxeFXqf4fRzGTrBrGBKrweUDEERXguogD
	MDi5Ui7aXo3oqri+OKra6DfdjhqPNzfsBamRRw8RR77JPN8Rj8oVXJpoF7/5wk6mX4MmIQhjvZSS6
	Iy9m/PagdTt9uqelQACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRslB-007wO0-Jx; Wed, 09 Mar 2022 09:37:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRsl8-007wNP-44; Wed, 09 Mar 2022 09:37:31 +0000
X-UUID: 99e92d09b3c34595b5c920d5db7fbbef-20220309
X-UUID: 99e92d09b3c34595b5c920d5db7fbbef-20220309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1035645539; Wed, 09 Mar 2022 02:37:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 01:29:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 17:29:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Mar 2022 17:29:23 +0800
Message-ID: <039b9df58df5cd74293dd57aa23e6c2cc820baa8.camel@mediatek.com>
Subject: Re: [PATCH v12 4/4] soc: mediatek: mutex: add functions that
 operate registers by CMDQ
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
Date: Wed, 9 Mar 2022 17:29:23 +0800
In-Reply-To: <710af1457bd59a017a62ecb8028dae0b94b809b3.camel@mediatek.com>
References: <20220301100246.2153-1-moudy.ho@mediatek.com>
 <20220301100246.2153-5-moudy.ho@mediatek.com>
 <710af1457bd59a017a62ecb8028dae0b94b809b3.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_013730_180087_23118AAD 
X-CRM114-Status: GOOD (  27.14  )
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

On Thu, 2022-03-03 at 18:01 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Tue, 2022-03-01 at 18:02 +0800, Moudy Ho wrote:
> > Considering that some functions have timing requirements
> > in specific situation, this patch adds several interface that
> > operate registers by CMDQ.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c       | 72
> > +++++++++++++++++++++++++-
> >  include/linux/soc/mediatek/mtk-mutex.h |  6 +++
> >  2 files changed, 76 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index a6268ecde240..a45864183cd1 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -7,10 +7,14 @@
(snip)
> > +
> >  void mtk_mutex_enable(struct mtk_mutex *mutex)
> >  {
> >  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -564,6 +591,20 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mutex_enable);
> >  
> > +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> > +			      struct mmsys_cmdq_cmd *cmd)
> 
> There are 10 mutex and you could bind each pipeline to one mutex and
> always enable it. I think it's not necessary to frequently
> enable/disable mutex.

Hi CK,

Due to HW limitations, MDP is necessary to enable MUTEX in each frame
for SOF triggering and cooperate with CMDQ control to reduce the amount
of interrupts generated(also, reduce frame latency).

Thanks & Regards,
Moudy Ho
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys,
> > +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> > +			    MTK_MUTEX_ENABLE, MTK_MUTEX_ENABLE);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> > +
> >  void mtk_mutex_disable(struct mtk_mutex *mutex)
> >  {
> >  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -575,6 +616,20 @@ void mtk_mutex_disable(struct mtk_mutex
> > *mutex)
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mutex_disable);
> >  
> > +void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
> > +			       struct mmsys_cmdq_cmd *cmd)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys,
> > +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> > +			    0x0, MTK_MUTEX_ENABLE);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_disable_by_cmdq);
> > +
> >  void mtk_mutex_acquire(struct mtk_mutex *mutex)
> >  {
> >  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -602,8 +657,8 @@ static int mtk_mutex_probe(struct
> > platform_device
> > *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct mtk_mutex_ctx *mtx;
> > -	struct resource *regs;
> > -	int i;
> > +	struct resource *regs, addr;
> > +	int i, ret;
> >  
> >  	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
> >  	if (!mtx)
> > @@ -623,6 +678,19 @@ static int mtk_mutex_probe(struct
> > platform_device *pdev)
> >  		}
> >  	}
> >  
> > +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
> > +		mtx->addr = 0L;
> > +	else
> > +		mtx->addr = addr.start;
> > +
> > +	if (mtx->data->has_gce_client_reg) {
> > +		ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
> 
> Add gce client reg in binding document [1]
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml?h=next-20220302
> 
> Regards,
> CK

Thanks for the reminder, I will fill in the missing parts in the next
version.

> > +		if (ret) {
> > +			dev_err(dev, "No mediatek,gce-client-reg!\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	mtx->regs = devm_ioremap_resource(dev, regs);
> >  	if (IS_ERR(mtx->regs)) {
> > diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> > b/include/linux/soc/mediatek/mtk-mutex.h
> > index b2608f4220ee..05de7ad4a124 100644
> > --- a/include/linux/soc/mediatek/mtk-mutex.h
> > +++ b/include/linux/soc/mediatek/mtk-mutex.h
> > @@ -17,8 +17,14 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
> >  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
> >  			enum mtk_ddp_comp_id id);
> >  u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum
> > mtk_mdp_comp_id id);
> > +void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
> > +			       struct mmsys_cmdq_cmd *cmd);
> >  void mtk_mutex_enable(struct mtk_mutex *mutex);
> > +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> > +			      struct mmsys_cmdq_cmd *cmd);
> >  void mtk_mutex_disable(struct mtk_mutex *mutex);
> > +void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
> > +			       struct mmsys_cmdq_cmd *cmd);
> >  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
> >  			   enum mtk_ddp_comp_id id);
> >  void mtk_mutex_unprepare(struct mtk_mutex *mutex);
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
