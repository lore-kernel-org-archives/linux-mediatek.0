Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54046C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C746109E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17C746109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbC9s67MMhcWoLZV8p4Z9fRGnNs8a79ieCibwCjdLbA=; b=cLGW7qmAT5DpF3
	3cepBVgZ0EBXkKMBMISMLh0vftBUfKRnudiBzNMyD3nTbYDV5Noz3HiMoQ2qkzLeLFQ+5BhENuGNN
	B4yhAGCRaSItZ6QJ3zRPD30LvZlhsoinzCyW8QuYcCgHcwu8R36E57nVq39qrmbohF6+6zzBZS30k
	5d/eE4z9KDtDFMHO7muI/td//kd6DmPOZN4kshKFtxhxHNa4jHGpD88PnJzauBzVpgPY1uQ8j5OoN
	GaQlxZP76eqUXa3LfIxqh83kEmSXf35cF7tQYY5LGQdgPj81JlHEVGc30SJLt576CGccYSjO3Skc0
	0wS1huFcE1HgNQnsfVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfhEI-004jrR-KA; Wed, 27 Oct 2021 11:36:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfhE3-004jp7-RL; Wed, 27 Oct 2021 11:36:15 +0000
X-UUID: 8eb20533b5d74104840fc9eae8a65469-20211027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wourjZUYRyV0xBGMtGBk0zWRAYjK9sAZ2Kw4fWXO3ZA=; 
 b=ixPWDFumK0YK1vJvdhFv3olWwd7d8j3kVTaUceWlCHg3aH+fg5iEiQnPdBHqOo901mJIr0yCMeT2xRw2dFTQr3E+rVSoiqyDBMBrnImhvKKmwuk/morduliWB8qkdQ7aJIIFfiH9xkxkHJzl1PIyuZLvFFK4Hkr8IcSZ1vEtKIM=;
X-UUID: 8eb20533b5d74104840fc9eae8a65469-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1941207899; Wed, 27 Oct 2021 04:36:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 04:36:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 27 Oct 2021 19:36:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 19:36:03 +0800
Message-ID: <03df929b4370fefb37dc271f0ac31ca2690b7eab.camel@mediatek.com>
Subject: Re: [PATCH v7, 07/15] media: mtk-vcodec: Add irq interface for
 multi hardware
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Oct 2021 19:36:03 +0800
In-Reply-To: <3f1885cb-fc4e-5832-52a3-ed1766b17add@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-8-yunfei.dong@mediatek.com>
 <3f1885cb-fc4e-5832-52a3-ed1766b17add@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_043611_905977_5047D47B 
X-CRM114-Status: GOOD (  33.25  )
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

Hi AngeloGioacchino,

Thanks for your suggestion.

On Thu, 2021-10-14 at 12:04 +0200, AngeloGioacchino Del Regno wrote:
> > Adds irq interface for multi hardware.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 33
> > +++++++++++++++++--
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 25 ++++++++++----
> >   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  4 +--
> >   .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 27 +++++++-------
> > -
> >   .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  4 +--
> >   .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |  2 +-
> >   .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  2 +-
> >   .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |  2 +-
> >   .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  2 +-
> >   .../platform/mtk-vcodec/venc/venc_h264_if.c   |  2 +-
> >   .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  2 +-
> >   12 files changed, 71 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 17cb3e3519eb..ff70fa5b34e3 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -73,6 +73,20 @@ static int mtk_vcodec_comp_device_check(struct
> > mtk_vcodec_ctx *ctx)
> >   	return 0;
> >   }
> >   
> > +static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
> > +{
> > +	switch (dev->vdec_pdata->hw_arch) {
> > +	case MTK_VDEC_PURE_SINGLE_CORE:
> > +		 return MTK_VDEC_ONE_CORE;
> > +	case MTK_VDEC_LAT_SINGLE_CORE:
> > +		return MTK_VDEC_ONE_LAT_ONE_CORE;
> > +	default:
> > +		mtk_v4l2_err("not support hw arch:%d",
> > +			dev->vdec_pdata->hw_arch);
> > +		return MTK_VDEC_NO_HW;
> > +	}
> > +}
> > +
> >   static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void
> > *priv)
> >   {
> >   	struct mtk_vcodec_dev *dev = priv;
> > @@ -104,7 +118,7 @@ static irqreturn_t
> > mtk_vcodec_dec_irq_handler(int irq, void *priv)
> >   	writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
> >   		dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
> >   
> > -	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> > +	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
> >   
> >   	mtk_v4l2_debug(3,
> >   			"mtk_vcodec_dec_irq_handler :wake up ctx %d,
> > dec_done_status=%x",
> > @@ -176,7 +190,7 @@ static int fops_vcodec_open(struct file *file)
> >   {
> >   	struct mtk_vcodec_dev *dev = video_drvdata(file);
> >   	struct mtk_vcodec_ctx *ctx = NULL;
> > -	int ret = 0;
> > +	int ret = 0, i, hw_count;
> >   	struct vb2_queue *src_vq;
> >   
> >   	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> > @@ -190,7 +204,19 @@ static int fops_vcodec_open(struct file *file)
> >   	v4l2_fh_add(&ctx->fh);
> >   	INIT_LIST_HEAD(&ctx->list);
> >   	ctx->dev = dev;
> > -	init_waitqueue_head(&ctx->queue);
> > +
> > +	if (ctx->dev->vdec_pdata->is_comp_supported) {
> 
> As pointed out in the review for patch 04/15 of this series,
> is_comp_supported
> is always false since you moved away from the component framework.
> 
> That means that this code can be removed, as nothing ever hits that.
> 
> Please note that other patches in this series are following
> similar/same patterns,
> so this comment applies to the entire series.
> 
> > +		hw_count = mtk_vcodec_get_hw_count(dev);
> > +		if (!hw_count) {
> > +			ret = -EINVAL;
> > +			goto err_init_queue;
> > +		}
> > +		for (i = 0; i < hw_count; i++)
> > +			init_waitqueue_head(&ctx->queue[i]);
> > +	} else {
> > +			init_waitqueue_head(&ctx->queue[0]);
> > +	}
> > +
> >   	mutex_init(&ctx->lock);
> >   
> >   	ret = mtk_vcodec_comp_device_check(ctx);
> > @@ -253,6 +279,7 @@ static int fops_vcodec_open(struct file *file)
> >   err_m2m_ctx_init:
> >   	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> >   err_ctrls_setup:
> > +err_init_queue:
> 
> ...and if that unused component code gets removed, this label can
> also be removed.
> 
For add 8192 to support component, these code need to keep.
> >   	v4l2_fh_del(&ctx->fh);
> >   	v4l2_fh_exit(&ctx->fh);
> >   	kfree(ctx);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > index 3752ccaea284..0997a5a08156 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > @@ -56,7 +56,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int
> > irq, void *priv)
> >   	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
> >   	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
> >   
> > -	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> > +	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->comp_idx);
> >   
> >   	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
> >   		ctx->id, dec_done_status);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 140f1a761942..f8e8b5ba408b 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -104,6 +104,16 @@ enum mtk_vdec_hw_id {
> >   	MTK_VDEC_HW_MAX,
> >   };
> >   
> > +/**
> > + * struct mtk_vdec_hw_count - Supported hardware count
> > + */
> > +enum mtk_vdec_hw_count {
> > +	MTK_VDEC_NO_HW = 0,
> > +	MTK_VDEC_ONE_CORE,
> > +	MTK_VDEC_ONE_LAT_ONE_CORE,
> > +	MTK_VDEC_MAX_HW_COUNT,
> > +};
> > +
> >   /*
> >    * struct mtk_video_fmt - Structure used to store information
> > about pixelformats
> >    */
> > @@ -293,9 +303,9 @@ struct mtk_vcodec_ctx {
> >   	struct vdec_pic_info picinfo;
> >   	int dpb_size;
> >   
> > -	int int_cond;
> > -	int int_type;
> > -	wait_queue_head_t queue;
> > +	int int_cond[MTK_VDEC_HW_MAX];
> > +	int int_type[MTK_VDEC_HW_MAX];
> > +	wait_queue_head_t queue[MTK_VDEC_HW_MAX];
> >   	unsigned int irq_status;
> >   
> >   	struct v4l2_ctrl_handler ctrl_hdl;
> > @@ -505,11 +515,12 @@ static inline struct mtk_vcodec_ctx
> > *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
> >   }
> >   
> >   /* Wake up context wait_queue */
> > -static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx,
> > unsigned int reason)
> > +static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx,
> > unsigned int reason,
> > +	unsigned int hw_id)
> >   {
> > -	ctx->int_cond = 1;
> > -	ctx->int_type = reason;
> > -	wake_up_interruptible(&ctx->queue);
> > +	ctx->int_cond[hw_id] = 1;
> > +	ctx->int_type[hw_id] = reason;
> > +	wake_up_interruptible(&ctx->queue[hw_id]);
> >   }
> >   
> >   #endif /* _MTK_VCODEC_DRV_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index 2828df77020c..c7540c0cdcea 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -114,7 +114,7 @@ static irqreturn_t
> > mtk_vcodec_enc_irq_handler(int irq, void *priv)
> >   
> >   	clean_irq_status(ctx->irq_status, addr);
> >   
> > -	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> > +	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
> >   	return IRQ_HANDLED;
> >   }
> >   
> > @@ -140,7 +140,7 @@ static int fops_vcodec_open(struct file *file)
> >   	v4l2_fh_add(&ctx->fh);
> >   	INIT_LIST_HEAD(&ctx->list);
> >   	ctx->dev = dev;
> > -	init_waitqueue_head(&ctx->queue);
> > +	init_waitqueue_head(&ctx->queue[0]);
> >   
> >   	ctx->type = MTK_INST_ENCODER;
> >   	ret = mtk_vcodec_enc_ctrls_setup(ctx);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> > index 70580c2525ba..8147533da98b 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> > @@ -11,34 +11,31 @@
> >   #include "mtk_vcodec_intr.h"
> >   #include "mtk_vcodec_util.h"
> >   
> > -int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int
> > command,
> > -				 unsigned int timeout_ms)
> > +int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
> > +	int command, unsigned int timeout_ms, unsigned hw_id)
> >   {
> > -	wait_queue_head_t *waitqueue;
> >   	long timeout_jiff, ret;
> >   	int status = 0;
> >   
> > -	waitqueue = (wait_queue_head_t *)&ctx->queue;
> >   	timeout_jiff = msecs_to_jiffies(timeout_ms);
> > -
> > -	ret = wait_event_interruptible_timeout(*waitqueue,
> > -				ctx->int_cond,
> > +	ret = wait_event_interruptible_timeout(ctx->queue[hw_id],
> > +				ctx->int_cond[hw_id],
> >   				timeout_jiff);
> >   
> >   	if (!ret) {
> >   		status = -1;	/* timeout */
> > -		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d,
> > wait_event_interruptible_timeout time=%ums out %d %d!",
> > -			     ctx->id, ctx->type, command, timeout_ms,
> > -			     ctx->int_cond, ctx->int_type);
> > +		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec timeout=%ums
> > (%d %d)",
> > +				ctx->id, command, ctx->type,
> > timeout_ms,
> > +				ctx->int_cond[hw_id], ctx-
> > >int_type[hw_id]);
> >   	} else if (-ERESTARTSYS == ret) {
> > -		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d,
> > wait_event_interruptible_timeout interrupted by a signal %d %d",
> > -			     ctx->id, ctx->type, command, ctx-
> > >int_cond,
> > -			     ctx->int_type);
> >   		status = -1;
> > +		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec inter fail (%d
> > %d)",
> > +				ctx->id, command, ctx->type,
> > +				ctx->int_cond[hw_id], ctx-
> > >int_type[hw_id]);
> >   	}
> >   
> > -	ctx->int_cond = 0;
> > -	ctx->int_type = 0;
> > +	ctx->int_cond[hw_id] = 0;
> > +	ctx->int_type[hw_id] = 0;
> >   
> >   	return status;
> >   }
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> > index 638cd1f3526a..2bf4cabfaa43 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> > @@ -12,7 +12,7 @@
> >   struct mtk_vcodec_ctx;
> >   
> >   /* timeout is ms */
> > -int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int
> > command,
> > -				unsigned int timeout_ms);
> > +int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
> > +				int command, unsigned int timeout_ms,
> > unsigned int hw_id);
> >   
> >   #endif /* _MTK_VCODEC_INTR_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> > b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> > index 40d6e6c5ac7a..481655bb6016 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> > @@ -413,7 +413,7 @@ static int vdec_h264_decode(void *h_vdec,
> > struct mtk_vcodec_mem *bs,
> >   		/* wait decoder done interrupt */
> >   		err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
> >   						   MTK_INST_IRQ_RECEIVE
> > D,
> > -						   WAIT_INTR_TIMEOUT_MS
> > );
> > +						   WAIT_INTR_TIMEOUT_MS
> > , 0);
> >   		if (err)
> >   			goto err_free_fb_out;
> >   
> > diff --git a/drivers/media/platform/mtk-
> > vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-
> > vcodec/vdec/vdec_h264_req_if.c
> > index 4dde9ee786b4..d23baa364246 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > @@ -724,7 +724,7 @@ static int vdec_h264_slice_decode(void *h_vdec,
> > struct mtk_vcodec_mem *bs,
> >   	/* wait decoder done interrupt */
> >   	err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
> >   					   MTK_INST_IRQ_RECEIVED,
> > -					   WAIT_INTR_TIMEOUT_MS);
> > +					   WAIT_INTR_TIMEOUT_MS, 0);
> >   	if (err)
> >   		goto err_free_fb_out;
> >   	vpu_dec_end(vpu);
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> > b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> > index e5393f841080..88c046731754 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> > @@ -488,7 +488,7 @@ static int vdec_vp8_decode(void *h_vdec, struct
> > mtk_vcodec_mem *bs,
> >   
> >   	/* wait decoder done interrupt */
> >   	mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
> > -				     WAIT_INTR_TIMEOUT_MS);
> > +				     WAIT_INTR_TIMEOUT_MS, 0);
> >   
> >   	if (inst->vsi->load_data)
> >   		load_dec_table(inst);
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > index 71cdc3ddafcb..70b8383f7c8e 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > @@ -539,7 +539,7 @@ static bool vp9_wait_dec_end(struct
> > vdec_vp9_inst *inst)
> >   
> >   	mtk_vcodec_wait_for_done_ctx(inst->ctx,
> >   			MTK_INST_IRQ_RECEIVED,
> > -			WAIT_INTR_TIMEOUT_MS);
> > +			WAIT_INTR_TIMEOUT_MS, 0);
> >   
> >   	if (ctx->irq_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
> >   		return true;
> > diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > index b6a4f2074fa5..9ae1bd8dbc32 100644
> > --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > @@ -335,7 +335,7 @@ static unsigned int
> > h264_enc_wait_venc_done(struct venc_h264_inst *inst)
> >   	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst-
> > >ctx;
> >   
> >   	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> > -					  WAIT_INTR_TIMEOUT_MS)) {
> > +					  WAIT_INTR_TIMEOUT_MS, 0)) {
> >   		irq_status = ctx->irq_status;
> >   		mtk_vcodec_debug(inst, "irq_status %x <-", irq_status);
> >   	}
> > diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> > b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> > index 8267a9c4fd25..f96564277577 100644
> > --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> > @@ -222,7 +222,7 @@ static unsigned int
> > vp8_enc_wait_venc_done(struct venc_vp8_inst *inst)
> >   	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst-
> > >ctx;
> >   
> >   	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> > -					  WAIT_INTR_TIMEOUT_MS)) {
> > +					  WAIT_INTR_TIMEOUT_MS, 0)) {
> >   		irq_status = ctx->irq_status;
> >   		mtk_vcodec_debug(inst, "isr return %x", irq_status);
> >   	}
> > 
Thanks,
Yunfei Dong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
