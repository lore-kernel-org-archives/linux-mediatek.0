Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E50C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zekpeEff/+i/EArpqXx+oih6WVqDRZFBp29xEaANCJk=; b=xmJziP/8zS//S3
	kWuNvhML/N7V4xgH52DxImO0725CNOSmaoiUQ819gnLotUyabFxbT2sJRUkWF+AH6u49Zo03NxUxY
	7dNqFr3StbVYROf0y1IlHgDIe9mTxgAA3V1BpvLArerc7YyOuAbcsdoNjnBSijISPPtQYleqRwfsr
	Hr5UN/TwThZxKc1V9Z7yMTRRbhd6l9n0HDxfSAhy3qr4M+R32WDmw3+MRYpdIpwZBhZJ1H1Lhkjcv
	RmDcf6BfPHmLewL1hkAzarufgyY3LEXDtsxi7DrqY7etA0/wARE7Hx75RHar4Cl4nGOLxE+V6BaLq
	EpJ/s0phXWAQyPbhf8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5OZO-00H9ga-HI; Thu, 06 Jan 2022 08:56:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5OZB-00H9dq-RG; Thu, 06 Jan 2022 08:56:15 +0000
X-UUID: 9d0a3c45d9c446a88b6e202025951379-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xAkJopjwId3y9Pf73xKCOq2KZocERxBxnBV67cZgFa0=; 
 b=fwKI1rDUCI8MmZObDQB3mwG5yHJFqPB4srsvdgwn3t8mi8Rq8epPsSZDo25joS0witcVpXm83uyBiZCbjXUFpcghSWPTdIE9DKG0kVYat6MYm971e1YqtrgBhERMefPDv6+MEyHhzO/6KUUL3nFJ2fEZMikVZQVWIJIuAz9jQ8A=;
X-UUID: 9d0a3c45d9c446a88b6e202025951379-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1039364050; Thu, 06 Jan 2022 01:56:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 00:56:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 16:56:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 16:56:05 +0800
Message-ID: <2407bcd678f2cc14e4a3ec9204f0137f8d9ebd0c.camel@mediatek.com>
Subject: Re: [PATCH V6, 5/5] media: mtk-jpegenc: add output pic reorder
 interface
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <irui.wang@mediatek.com>, <kyrie.wu@mediatek.com>
Date: Thu, 6 Jan 2022 16:56:06 +0800
In-Reply-To: <Yao8qYubCJTaGKe0@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-6-git-send-email-kyrie.wu@mediatek.com>
 <Yao8qYubCJTaGKe0@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_005613_919314_8D8AA87E 
X-CRM114-Status: GOOD (  33.82  )
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

On Fri, 2021-12-03 at 16:50 +0100, Ricardo Ribalda wrote:
> kyrie.wu wrote:
> 
> > There are two HWs in mt8195. Since the two HWs run
> > in parallel, it is necessary to reorder the output images
> > to ensure that the order is consistent with the input images.
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> > ---
> > V6: no change
> > ---
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 10 +----
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   | 17 +++++++-
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |  1 +
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |  3 +-
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 48
> > ++++++++++++++++++++++-
> >  5 files changed, 65 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index 80a6c1a..9e89629 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -106,15 +106,6 @@ static struct mtk_jpeg_fmt
> > mtk_jpeg_dec_formats[] = {
> >  #define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
> >  #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
> >  
> > -struct mtk_jpeg_src_buf {
> > -	struct vb2_v4l2_buffer b;
> > -	struct list_head list;
> > -	struct mtk_jpeg_dec_param dec_param;
> > -
> > -	struct mtk_jpeg_ctx *curr_ctx;
> > -	u32 frame_num;
> > -};
> > -
> >  static int debug;
> >  module_param(debug, int, 0644);
> >  
> > @@ -1344,6 +1335,7 @@ static int mtk_jpeg_open(struct file *file)
> >  	if (jpeg->variant->is_encoder)
> >  		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
> >  
> > +	INIT_LIST_HEAD(&ctx->dst_done_queue);
> >  	v4l2_fh_init(&ctx->fh, vfd);
> >  	file->private_data = &ctx->fh;
> >  	v4l2_fh_add(&ctx->fh);
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > index 4c669af..f276221 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > @@ -13,10 +13,11 @@
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fh.h>
> > +#include <media/videobuf2-v4l2.h>
> >  
> > -#define MTK_JPEG_NAME		"mtk-jpeg"
> > +#include "mtk_jpeg_dec_hw.h"
> >  
> > -#define MTK_JPEG_COMP_MAX		3
> > +#define MTK_JPEG_NAME		"mtk-jpeg"
> >  
> >  #define MTK_JPEG_FMT_FLAG_OUTPUT	BIT(0)
> >  #define MTK_JPEG_FMT_FLAG_CAPTURE	BIT(1)
> > @@ -75,6 +76,15 @@ struct mtk_jpeg_variant {
> >  	u32 cap_q_default_fourcc;
> >  };
> >  
> > +struct mtk_jpeg_src_buf {
> > +	struct vb2_v4l2_buffer b;
> > +	struct list_head list;
> > +	struct mtk_jpeg_dec_param dec_param;
> > +
> > +	struct mtk_jpeg_ctx *curr_ctx;
> > +	u32 frame_num;
> > +};
> > +
> >  enum mtk_jpeg_hw_state {
> >  	MTK_JPEG_HW_IDLE = 0,
> >  	MTK_JPEG_HW_BUSY = 1,
> > @@ -232,6 +242,9 @@ struct mtk_jpeg_ctx {
> >  	struct v4l2_ctrl_handler ctrl_hdl;
> >  	struct work_struct jpeg_work;
> >  	u32 total_frame_num;
> > +	struct list_head dst_done_queue;
> > +	spinlock_t done_queue_lock;
> > +	u32 last_done_frame_num;
> >  };
> >  
> >  extern struct platform_driver mtk_jpegenc_hw_driver;
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > index afbbfd5..1e38522 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/kernel.h>
> >  #include <media/videobuf2-core.h>
> >  
> > +#include "mtk_jpeg_core.h"
> >  #include "mtk_jpeg_dec_hw.h"
> >  
> >  #define MTK_JPEG_DUNUM_MASK(val)	(((val) - 1) & 0x3)
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> > index fa0d45f..87aaa5c 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> > @@ -11,9 +11,10 @@
> >  
> >  #include <media/videobuf2-core.h>
> >  
> > -#include "mtk_jpeg_core.h"
> >  #include "mtk_jpeg_dec_reg.h"
> >  
> 
> Why are you moving around this define?
this micro defination is only used for jpeg decode, not for common
using, move to it.
> > +#define MTK_JPEG_COMP_MAX		3
> > +
> >  enum {
> >  	MTK_JPEG_DEC_RESULT_EOF_DONE		= 0,
> >  	MTK_JPEG_DEC_RESULT_PAUSE		= 1,
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > index 244f9f7..3383dc0 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > @@ -183,6 +183,50 @@ void mtk_jpeg_set_enc_params(struct
> > mtk_jpeg_ctx *ctx,  void __iomem *base)
> >  	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
> >  }
> >  
> > +void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
> > +{
> > +	struct mtk_jpeg_ctx *ctx;
> > +	struct vb2_v4l2_buffer *dst_buffer;
> > +	struct list_head *temp_entry;
> > +	struct list_head *pos = NULL;
> > +	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
> > +	unsigned long flags;
> > +
> > +	ctx = jpeg->hw_param.curr_ctx;
> > +	if (!ctx) {
> > +		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
> > +		return;
> > +	}
> > +
> > +	dst_buffer = jpeg->hw_param.dst_buffer;
> > +	if (!dst_buffer) {
> > +		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
> > +		return;
> > +	}
> > +
> > +	dst_done_buf = container_of(dst_buffer,
> > +		struct mtk_jpeg_src_buf, b);
> > +
> > +	spin_lock_irqsave(&ctx->done_queue_lock, flags);
> > +	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
> 
> You want to run this until there are only 0 or 1 elements? Did I got
> it
> right?
Yes.
> 
> So this means that when you enter put_buf there is max one element in
> the list. Do you need a list for that or only save one buffer in case
> they have come out of order?
The explaination is shown as below:
1. the put_buf is used to reorder output buffer;
2. the ctx->last_done_frame_num will increase when encode finished
everytime;
3. if the output buffer's frame_num(tmp_dst_done_buf->frame_num) is
equal to ctx->last_done_frame_num, call v4l2_m2m_buf_done to finish
this time encoding.
4. if there is no or only one element, the reordering is not required.

> > +	while (!list_empty(&ctx->dst_done_queue) &&
> > +		(pos != &ctx->dst_done_queue)) {
> > +		list_for_each_prev_safe(pos, temp_entry,
> > +			(&ctx->dst_done_queue)) {
> > +			tmp_dst_done_buf = list_entry(pos,
> > +				struct mtk_jpeg_src_buf, list);
> > +			if (tmp_dst_done_buf->frame_num ==
> > +				ctx->last_done_frame_num) {
> > +				list_del(&tmp_dst_done_buf->list);
> > +				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> > +					VB2_BUF_STATE_DONE);
> > +				ctx->last_done_frame_num++;
> > +			}
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> > +}
> > +
> >  static void mtk_jpegenc_timeout_work(struct work_struct *work)
> >  {
> >  	struct delayed_work *Pwork =
> > @@ -203,6 +247,7 @@ static void mtk_jpegenc_timeout_work(struct
> > work_struct *work)
> >  	atomic_inc(&cjpeg->hw_rdy);
> >  	wake_up(&master_jpeg->enc_hw_wq);
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> > +	mtk_jpegenc_put_buf(cjpeg);
> >  }
> >  
> >  static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> > @@ -237,8 +282,7 @@ static irqreturn_t
> > mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> >  	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> >  	buf_state = VB2_BUF_STATE_DONE;
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> > -	v4l2_m2m_buf_done(dst_buf, buf_state);
> > -	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > +	mtk_jpegenc_put_buf(jpeg);
> >  	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
> >  	pm_runtime_put(ctx->jpeg->dev);
> >  	if (ctx->fh.m2m_ctx &&
> > -- 
> > 2.6.4
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
