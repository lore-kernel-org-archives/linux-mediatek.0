Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A33C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjgmrRXt3QhPvJmWzpUVezyqUxb0o5CS3TTkW9tTjLg=; b=l5r/DQJKCMebJo
	HZQqDBfK/JJO1jI05Rvl6exxhSQIKZqC8XYHWPC07TEONYQzLLJ4bWQdBW5B14o7kqPEOA3D60X/T
	dydzX1AvO8d2UACUSvga8n/vyAMm81qxhFJ7POfCouzHZOweh6LyO1KepKvxl/zM7UvGCzJokN6kM
	t0MLgpTVk0GdExBxEyFGCrTKHPo0g1J1GCYCHKbS4+5FfTe0dnuRITMvPY5WWaP14f2TsJyBcc92R
	jgnWjTP9yWWSpfvHI84llopRwToh5h8SKqBKl8MRuHYuJoGVZMy1FLCoiqJva44b4e/JeqBq8qbIq
	yCNZZqgK69NXh5NxLKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5NkY-00GwDn-S2; Thu, 06 Jan 2022 08:03:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5NkM-00GwBh-Pc; Thu, 06 Jan 2022 08:03:45 +0000
X-UUID: 0dc7400dda73450e8fa3bc6faf0e07fd-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sm/2XIHHCueU0DSyvCw471cECDEfouWmLsWpJSCx7jI=; 
 b=fOhKpaGAfogDl0wWhJXqRuG0x8S5EJhaKYwBYTEZYhbP6KceG1z1dV1FlW9tuDdiC3ELKjeofquc1MH2vWZSYxJqTqjSHqN6qAy+ImSZKwALGcnOkb5Ij666WPFbZF3EToXdt+9LFC5ncTe+b+loQO1wj0eAtKzb0s7CVEh1+ig=;
X-UUID: 0dc7400dda73450e8fa3bc6faf0e07fd-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 866713419; Thu, 06 Jan 2022 01:03:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 00:03:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 16:03:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 16:03:35 +0800
Message-ID: <7d1353c3c5e8d621b94341a736a4a781559b69ee.camel@mediatek.com>
Subject: Re: [PATCH V6, 4/5] media: mtk-jpegenc: add jpeg encode worker
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
Date: Thu, 6 Jan 2022 16:03:35 +0800
In-Reply-To: <Yao3z6PZ72Vpr7B0@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-5-git-send-email-kyrie.wu@mediatek.com>
 <Yao3z6PZ72Vpr7B0@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_000342_875729_78DA69E2 
X-CRM114-Status: GOOD (  31.19  )
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

On Fri, 2021-12-03 at 16:29 +0100, Ricardo Ribalda wrote:
> kyrie.wu wrote:
> 
> > Add jpeg encoding worker to ensure that two HWs
> > run in parallel in MT8195.
> 
> Have you considered using a semaphore initialized to two to arbitrate
> this?
I will consider your suggestion. Thanks.
> 
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> > ---
> > V6: no change
> > ---
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 180
> > +++++++++++++++++++---
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  11 ++
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c |  17 ++
> >  3 files changed, 188 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index da7eb84..80a6c1a 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -110,6 +110,9 @@ struct mtk_jpeg_src_buf {
> >  	struct vb2_v4l2_buffer b;
> >  	struct list_head list;
> >  	struct mtk_jpeg_dec_param dec_param;
> > +
> > +	struct mtk_jpeg_ctx *curr_ctx;
> > +	u32 frame_num;
> >  };
> >  
> >  static int debug;
> > @@ -908,38 +911,148 @@ static int mtk_jpeg_set_dec_dst(struct
> > mtk_jpeg_ctx *ctx,
> >  	return 0;
> >  }
> >  
> > -static void mtk_jpeg_enc_device_run(void *priv)
> > +static int mtk_jpegenc_select_hw(struct mtk_jpeg_ctx *ctx)
> >  {
> > -	struct mtk_jpeg_ctx *ctx = priv;
> > +	struct mtk_jpegenc_comp_dev *comp_jpeg;
> >  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +	unsigned long flags;
> > +	int hw_id = -1;
> > +	int i;
> > +
> > +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > +	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> > +		comp_jpeg = jpeg->enc_hw_dev[i];
> > +		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
> > +			hw_id = i;
> > +			comp_jpeg->hw_state = MTK_JPEG_HW_BUSY;
> > +			break;
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> > +
> > +	return hw_id;
> > +}
> > +
> > +static int mtk_jpegenc_set_hw_param(struct mtk_jpeg_ctx *ctx,
> > +	int hw_id,
> > +	struct vb2_v4l2_buffer *src_buf,
> > +	struct vb2_v4l2_buffer *dst_buf)
> > +{
> > +	struct mtk_jpegenc_comp_dev *jpeg = ctx->jpeg-
> > >enc_hw_dev[hw_id];
> > +
> > +	jpeg->hw_param.curr_ctx = ctx;
> > +	jpeg->hw_param.src_buffer = src_buf;
> > +	jpeg->hw_param.dst_buffer = dst_buf;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_jpegenc_deselect_hw(struct mtk_jpeg_dev *jpeg,
> > +	int hw_id)
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > +	jpeg->enc_hw_dev[hw_id]->hw_state = MTK_JPEG_HW_IDLE;
> > +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mtk_jpegenc_worker(struct work_struct *work)
> > +{
> > +	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
> >  	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > +	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
> > +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +	atomic_t *hw_rdy[MTK_JPEGENC_HW_MAX];
> > +	struct clk *jpegenc_clk;
> > +	int ret, i, hw_id = 0;
> >  	unsigned long flags;
> > -	int ret;
> >  
> > +	struct mtk_jpeg_ctx *ctx = container_of(work,
> > +		struct mtk_jpeg_ctx,
> > +		jpeg_work);
> > +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > +
> > +	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> > +		comp_jpeg[i] = jpeg->enc_hw_dev[i];
> > +		hw_rdy[i] = &comp_jpeg[i]->hw_rdy;
> > +	}
> > +
> > +retry_select:
> > +	hw_id = mtk_jpegenc_select_hw(ctx);
> > +	if (hw_id < 0) {
> > +		ret = wait_event_interruptible(jpeg->enc_hw_wq,
> > +			(atomic_read(hw_rdy[0]) ||
> > +			atomic_read(hw_rdy[1])) > 0);
> > +		if (ret != 0) {
> > +			dev_err(jpeg->dev, "%s : %d, all HW are
> > busy\n",
> > +				__func__, __LINE__);
> > +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx-
> > >fh.m2m_ctx);
> > +			return;
> > +		}
> > +
> > +		goto retry_select;
> > +	}
> > +
> > +	atomic_dec(&comp_jpeg[hw_id]->hw_rdy);
> >  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +	if (!src_buf) {
> > +		dev_err(jpeg->dev, "%s : %d, get src_buf fail !!!\n",
> > +			__func__, __LINE__);
> > +		goto getbuf_fail;
> > +	}
> > +
> >  	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +	if (!dst_buf) {
> > +		pr_info("%s : %d, get dst_buf fail !!!\n",
> > +			__func__, __LINE__);
> > +		goto getbuf_fail;
> > +	}
> >  
> > -	ret = pm_runtime_resume_and_get(jpeg->dev);
> > -	if (ret < 0)
> > -		goto enc_end;
> > +	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> > +	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> > +	jpeg_src_buf->curr_ctx = ctx;
> > +	jpeg_src_buf->frame_num = ctx->total_frame_num;
> > +	jpeg_dst_buf->curr_ctx = ctx;
> > +	jpeg_dst_buf->frame_num = ctx->total_frame_num;
> > +	ctx->total_frame_num++;
> >  
> > -	schedule_delayed_work(&jpeg->job_timeout_work,
> > -			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC
> > ));
> > +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +	mtk_jpegenc_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> > +	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->pm.dev);
> > +	if (ret < 0) {
> > +		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail
> > !!!\n",
> > +			__func__, __LINE__);
> > +		goto enc_end;
> > +	}
> >  
> > -	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > +	jpegenc_clk = comp_jpeg[hw_id]->pm.venc_clk.clk_info-
> > >jpegenc_clk;
> > +	ret = clk_prepare_enable(jpegenc_clk);
> > +	if (ret) {
> > +		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable
> > fail\n",
> > +			__func__, __LINE__);
> > +		goto enc_end;
> > +	}
> >  
> > -	/*
> > -	 * Resetting the hardware every frame is to ensure that all the
> > -	 * registers are cleared. This is a hardware requirement.
> > -	 */
> > -	mtk_jpeg_enc_reset(jpeg->reg_base);
> > +	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> > +		msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
> > +
> > +	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> > +	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
> > +	mtk_jpeg_set_enc_dst(ctx,
> > +		comp_jpeg[hw_id]->reg_base,
> > +		&dst_buf->vb2_buf);
> > +	mtk_jpeg_set_enc_src(ctx,
> > +		comp_jpeg[hw_id]->reg_base,
> > +		&src_buf->vb2_buf);
> > +	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> > +	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> > +	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > +	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> >  
> > -	mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
> > -	mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf);
> > -	mtk_jpeg_set_enc_params(ctx, jpeg->reg_base);
> > -	mtk_jpeg_enc_start(jpeg->reg_base);
> > -	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> >  	return;
> >  
> >  enc_end:
> > @@ -947,9 +1060,20 @@ static void mtk_jpeg_enc_device_run(void
> > *priv)
> >  	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> > +getbuf_fail:
> > +	atomic_inc(&comp_jpeg[hw_id]->hw_rdy);
> > +	mtk_jpegenc_deselect_hw(jpeg, hw_id);
> >  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> >  }
> >  
> > +static void mtk_jpeg_enc_device_run(void *priv)
> > +{
> > +	struct mtk_jpeg_ctx *ctx = priv;
> > +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> 
> You are reusing the jpeg_work structure, so if you call multiple
> times
> mtk_jpeg_enc_device_run(), before the old one is completed, you would
> overwrite the old values. Is this what you want?
queue_work only queue jpeg_work to workqueue, and the worker function
will schedule to encode.The encode source data is set in output buffer,
and it would not overwrite.
> > +
> > +	queue_work(jpeg->workqueue, &ctx->jpeg_work);
> > +}
> > +
> >  static void mtk_jpeg_dec_device_run(void *priv)
> >  {
> >  	struct mtk_jpeg_ctx *ctx = priv;
> > @@ -1217,6 +1341,9 @@ static int mtk_jpeg_open(struct file *file)
> >  		goto free;
> >  	}
> >  
> > +	if (jpeg->variant->is_encoder)
> > +		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
> > +
> >  	v4l2_fh_init(&ctx->fh, vfd);
> >  	file->private_data = &ctx->fh;
> >  	v4l2_fh_add(&ctx->fh);
> > @@ -1387,6 +1514,15 @@ static int mtk_jpeg_probe(struct
> > platform_device *pdev)
> >  		}
> >  
> >  		pm_runtime_enable(&pdev->dev);
> > +	} else {
> > +		init_waitqueue_head(&jpeg->enc_hw_wq);
> > +		jpeg->workqueue =
> > alloc_ordered_workqueue(MTK_JPEG_NAME,
> > +			WQ_MEM_RECLAIM | WQ_FREEZABLE);
> > +		if (!jpeg->workqueue) {
> > +			dev_err(&pdev->dev, "Failed to create jpeg
> > workqueue!\n");
> > +			ret = -EINVAL;
> > +			goto err_alloc_workqueue;
> > +		}
> >  	}
> >  
> >  	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
> > @@ -1460,6 +1596,8 @@ static int mtk_jpeg_probe(struct
> > platform_device *pdev)
> >  
> >  err_clk_init:
> >  
> > +err_alloc_workqueue:
> > +
> >  err_req_irq:
> >  
> >  	return ret;
> > @@ -1475,6 +1613,8 @@ static int mtk_jpeg_remove(struct
> > platform_device *pdev)
> >  	v4l2_m2m_release(jpeg->m2m_dev);
> >  	v4l2_device_unregister(&jpeg->v4l2_dev);
> >  	mtk_jpeg_clk_release(jpeg);
> > +	flush_workqueue(jpeg->workqueue);
> > +	destroy_workqueue(jpeg->workqueue);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > index baab305..4c669af 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > @@ -75,6 +75,11 @@ struct mtk_jpeg_variant {
> >  	u32 cap_q_default_fourcc;
> >  };
> >  
> > +enum mtk_jpeg_hw_state {
> > +	MTK_JPEG_HW_IDLE = 0,
> > +	MTK_JPEG_HW_BUSY = 1,
> > +};
> > +
> >  struct mtk_jpeg_hw_param {
> >  	struct vb2_v4l2_buffer *src_buffer;
> >  	struct vb2_v4l2_buffer *dst_buffer;
> > @@ -130,6 +135,9 @@ struct mtk_jpegenc_comp_dev {
> >  	int jpegenc_irq;
> >  	struct delayed_work job_timeout_work;
> >  	struct mtk_jpeg_hw_param hw_param;
> > +	atomic_t hw_rdy;
> > +	enum mtk_jpeg_hw_state hw_state;
> > +	spinlock_t hw_lock;
> >  };
> >  
> >  /**
> > @@ -163,6 +171,7 @@ struct mtk_jpeg_dev {
> >  
> >  	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
> >  	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
> > +	wait_queue_head_t enc_hw_wq;
> >  };
> >  
> >  /**
> > @@ -221,6 +230,8 @@ struct mtk_jpeg_ctx {
> >  	u8 enc_quality;
> >  	u8 restart_interval;
> >  	struct v4l2_ctrl_handler ctrl_hdl;
> > +	struct work_struct jpeg_work;
> > +	u32 total_frame_num;
> >  };
> >  
> >  extern struct platform_driver mtk_jpegenc_hw_driver;
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > index e62b875..244f9f7 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > @@ -190,6 +190,7 @@ static void mtk_jpegenc_timeout_work(struct
> > work_struct *work)
> >  	struct mtk_jpegenc_comp_dev *cjpeg =
> >  		container_of(Pwork, struct mtk_jpegenc_comp_dev,
> >  		job_timeout_work);
> > +	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
> >  	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> >  	struct vb2_v4l2_buffer *src_buf;
> >  
> > @@ -198,6 +199,9 @@ static void mtk_jpegenc_timeout_work(struct
> > work_struct *work)
> >  	mtk_jpeg_enc_reset(cjpeg->reg_base);
> >  	clk_disable_unprepare(cjpeg->pm.venc_clk.clk_info-
> > >jpegenc_clk);
> >  	pm_runtime_put(cjpeg->pm.dev);
> > +	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
> > +	atomic_inc(&cjpeg->hw_rdy);
> > +	wake_up(&master_jpeg->enc_hw_wq);
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  }
> >  
> > @@ -235,7 +239,17 @@ static irqreturn_t
> > mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> >  	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > +	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
> >  	pm_runtime_put(ctx->jpeg->dev);
> > +	if (ctx->fh.m2m_ctx &&
> > +		(!list_empty(&ctx->fh.m2m_ctx->out_q_ctx.rdy_queue) ||
> > +		!list_empty(&ctx->fh.m2m_ctx->cap_q_ctx.rdy_queue))) {
> > +		queue_work(master_jpeg->workqueue, &ctx->jpeg_work);
> > +	}
> > +
> > +	jpeg->hw_state = MTK_JPEG_HW_IDLE;
> > +	wake_up(&master_jpeg->enc_hw_wq);
> > +	atomic_inc(&jpeg->hw_rdy);
> >  
> >  	return IRQ_HANDLED;
> >  }
> > @@ -341,6 +355,9 @@ static int mtk_jpegenc_hw_probe(struct
> > platform_device *pdev)
> >  		return -ENOMEM;
> >  
> >  	dev->plat_dev = pdev;
> > +	atomic_set(&dev->hw_rdy, 1U);
> > +	spin_lock_init(&dev->hw_lock);
> > +	dev->hw_state = MTK_JPEG_HW_IDLE;
> >  
> >  	INIT_DELAYED_WORK(&dev->job_timeout_work,
> >  		mtk_jpegenc_timeout_work);
> > -- 
> > 2.6.4
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
