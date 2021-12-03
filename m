Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E1FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GorlWHUuox1S33qZlBF0fHSk9i0DU6ma7hCyWhS+vuM=; b=cHS1w/607Km5q1
	qlTc1ofmnXUHQ6oLcCQli/A/5JOp/P3yrWIxsOEfb+6sn1LAQTJ+2Fq9xdmEAg6KPWY/n+rwgc9bS
	3V+NKrqIc0wl5YcMXZ6V8fJBkVexUw32NLdeIA5VtgzOIhyLTY4g3j2NqKkFDGAaUtgZB3eX2Fnqo
	/azO+xCHisgY91ZTUqApCtGMQDP0Nns701G4PGdyaQF0i3Fvw2yA7ryh3aZEyzyavfJJeuNDq78mv
	bWdXUwlR9sSUDHc3C54AIz8BSEFlvMJqB9PGNn6s4qh1Wiwqyc3pYXggdq+7pIkKLDoC8adDu/EjL
	OH4sBNFbTpQ9y7v6ofTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8L0-00FrX8-S2; Fri, 03 Dec 2021 13:10:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8Ko-00FrTs-Id
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 13:10:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o20so11232616eds.10
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GdSRGY5td8vPwp9xS/sbwnCajPtSv3n6p4NRyUpedYo=;
 b=d2IFjt69mPjyWkfpi/U4ffXzLvCI1gVmoIOUmrhUhlBwzGj2fA7aNr8s6M953oMwGv
 nPrI1D4QQ90qbkshTrO0K4r50/Y1UCecFpT+6IQWmjInipRborBhBwCa/Pztr2YgBfV9
 Wa4TjM0QS30eU3TZ5DtW4Wd4tk0IGzIeWniag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GdSRGY5td8vPwp9xS/sbwnCajPtSv3n6p4NRyUpedYo=;
 b=Plpq8BwWx0V5AThJRmiXGOzlajIaxPeNnVLgnapqkL+WglEqtLHgpx9i4dZvP32Ukk
 +Ut7W4cHYX+a7k4R+XoYWGU59/RNlF9gozyr2DbOxdwSnSuw0AjPypNaVJdFdhMU8+33
 /54f2PBMPMLhRp/LvtK2JyuATzlTisJGygT90irvT/lAPZWEipdVeF2zlaKwbbwz+TZl
 SQSFeQ4ThJj4VKtbwztcqveQCDFWtspOIbXi/dgr0AsUR9X3PhKjycN4XSsy7AOWE3Xy
 7pKPCpASIeMG57R++HJWy99I3jAk2Eq8nc7D35EsbR5aJCkM815HEjaBT8LZ7qV/xsIf
 wymQ==
X-Gm-Message-State: AOAM533o8qhQTByZajq7+4sObK+rfa11OuPK58PdExyUzijAKbnjDTR3
 KFVRIuq2vHTmcCxlS9bz8UM4Ig==
X-Google-Smtp-Source: ABdhPJwMY3oZ8ybpUq8aNSnNvGHlXczOXQCp/iLqDLAP0I4+wLCIoVvmZdQ4sHsbGNc8RIUwIesAOQ==
X-Received: by 2002:a17:907:6e91:: with SMTP id
 sh17mr23858993ejc.86.1638537038671; 
 Fri, 03 Dec 2021 05:10:38 -0800 (PST)
Received: from gmail.com ([2620:0:1059:10:5993:f714:eea7:6d6d])
 by smtp.gmail.com with ESMTPSA id hb36sm1988067ejc.73.2021.12.03.05.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 05:10:38 -0800 (PST)
Date: Fri, 3 Dec 2021 14:10:35 +0100
From: Ricardo Ribalda <ribalda@chromium.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
Subject: Re: [PATCH V1, 4/6] media: mtk-jpegdec: add jpeg decode worker
 interface
Message-ID: <YaoXS/3Dpl50yq2l@gmail.com>
References: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
 <1638509655-14296-5-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638509655-14296-5-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_051042_657302_30707FE3 
X-CRM114-Status: GOOD (  29.88  )
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

kyrie.wu wrote:

> Add jpeg decoding worker to ensure that three HWs
> run in parallel in MT8195.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 190 +++++++++++++++++++---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |   5 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |  17 ++
>  3 files changed, 189 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index f2a5e84..2518660 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1065,57 +1065,187 @@ static void mtk_jpeg_enc_device_run(void *priv)
>  	queue_work(jpeg->workqueue, &ctx->jpeg_work);
>  }
>  
> -static void mtk_jpeg_dec_device_run(void *priv)
> +static int mtk_jpegdec_select_hw(struct mtk_jpeg_ctx *ctx)
>  {
> -	struct mtk_jpeg_ctx *ctx = priv;
> +	struct mtk_jpegdec_comp_dev *comp_jpeg;
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> -	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
>  	unsigned long flags;
> -	struct mtk_jpeg_src_buf *jpeg_src_buf;
> +	int hw_id = -1;
> +	int i;
> +
> +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> +	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +		comp_jpeg = jpeg->dec_hw_dev[i];
> +		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
> +			hw_id = i;
> +			comp_jpeg->hw_state = MTK_JPEG_HW_BUSY;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> +
> +	return hw_id;
> +}
> +
> +static int mtk_jpegdec_deselect_hw(struct mtk_jpeg_dev *jpeg, int hw_id)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> +	jpeg->dec_hw_dev[hw_id]->hw_state =
> +		MTK_JPEG_HW_IDLE;
> +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegdec_set_hw_param(struct mtk_jpeg_ctx *ctx,
> +	int hw_id,
> +	struct vb2_v4l2_buffer *src_buf,
> +	struct vb2_v4l2_buffer *dst_buf)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =
> +		ctx->jpeg->dec_hw_dev[hw_id];
> +
> +	jpeg->hw_param.curr_ctx = ctx;
> +	jpeg->hw_param.src_buffer = src_buf;
> +	jpeg->hw_param.dst_buffer = dst_buf;
> +
> +	return 0;
> +}
> +
> +static void mtk_jpegdec_worker(struct work_struct *work)
> +{
> +	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
> +		jpeg_work);
> +	struct mtk_jpegdec_comp_dev *comp_jpeg[MTK_JPEGDEC_HW_MAX];
> +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +	atomic_t *hw_rdy[MTK_JPEGDEC_HW_MAX];
> +	struct clk *jpegdec_clk;
> +	int ret, i, hw_id = 0;
>  	struct mtk_jpeg_bs bs;
>  	struct mtk_jpeg_fb fb;
> -	int ret;
> +	unsigned long flags;
> +
> +	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +		comp_jpeg[i] = jpeg->dec_hw_dev[i];
> +		hw_rdy[i] = &comp_jpeg[i]->hw_rdy;
> +	}
> +
> +retry_select:
> +	hw_id = mtk_jpegdec_select_hw(ctx);
> +	if (hw_id < 0) {
> +		ret = wait_event_interruptible(jpeg->dec_hw_wq,
> +			(atomic_read(hw_rdy[0]) ||
> +			atomic_read(hw_rdy[1]) ||
> +			atomic_read(hw_rdy[2])) > 0);
> +		if (ret != 0) {
> +			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
> +				__func__, __LINE__);
> +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +			return;
> +		}
> +
> +		dev_err(jpeg->dev, "%s : %d, NEW HW IDLE, please retry selcet!!!\n",
> +			__func__, __LINE__);
> +		goto retry_select;
> +	}
>  
> +	atomic_dec(&comp_jpeg[hw_id]->hw_rdy);
>  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	if (!src_buf) {
> +		dev_err(jpeg->dev, "%s : %d, get src_buf fail !!!\n",
> +			__func__, __LINE__);
> +		goto getbuf_fail;
> +	}
>  	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (!dst_buf) {
> +		dev_err(jpeg->dev, "%s : %d, get dst_buf fail !!!\n",
> +			__func__, __LINE__);
> +		goto getbuf_fail;
> +	}
> +
>  	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> +	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
>  
> -	if (mtk_jpeg_check_resolution_change(ctx, &jpeg_src_buf->dec_param)) {
> +	if (mtk_jpeg_check_resolution_change(ctx,
> +		&jpeg_src_buf->dec_param)) {
>  		mtk_jpeg_queue_src_chg_event(ctx);
>  		ctx->state = MTK_JPEG_SOURCE_CHANGE;
> -		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> -		return;
> +		goto getbuf_fail;
>  	}
>  
> -	ret = pm_runtime_resume_and_get(jpeg->dev);
> -	if (ret < 0)
> +	jpeg_src_buf->curr_ctx = ctx;
> +	jpeg_src_buf->frame_num = ctx->total_frame_num;
> +	jpeg_dst_buf->curr_ctx = ctx;
> +	jpeg_dst_buf->frame_num = ctx->total_frame_num;
> +	ctx->total_frame_num++;
> +
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> +	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->pm.dev);
> +	if (ret < 0) {
> +		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
> +			__func__, __LINE__);
>  		goto dec_end;
> +	}
>  
> -	schedule_delayed_work(&jpeg->job_timeout_work,
> -			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
> +	jpegdec_clk = comp_jpeg[hw_id]->pm.dec_clk.clk_info->jpegdec_clk;
> +	ret = clk_prepare_enable(jpegdec_clk);
> +	if (ret) {
> +		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
> +			__func__, __LINE__);
> +		goto clk_end;
> +	}
> +
> +	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> +		msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
>  
>  	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> -	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
> -		goto dec_end;
> +	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param,
> +		&dst_buf->vb2_buf, &fb)) {
> +		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
> +			__func__, __LINE__);
> +		goto setdst_end;
> +	}
>  
> -	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	mtk_jpeg_dec_reset(jpeg->reg_base);
> +	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> +	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_dec_set_config(jpeg->reg_base,
> -				&jpeg_src_buf->dec_param, &bs, &fb);
> +		&jpeg_src_buf->dec_param,
> +		&bs, &fb);
> +	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
>  
> -	mtk_jpeg_dec_start(jpeg->reg_base);
> -	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
>  	return;
>  
> +setdst_end:
> +	clk_disable_unprepare(jpegdec_clk);
> +clk_end:
> +	pm_runtime_put(comp_jpeg[hw_id]->pm.dev);
>  dec_end:
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
> +getbuf_fail:
> +	atomic_inc(&comp_jpeg[hw_id]->hw_rdy);
> +	mtk_jpegdec_deselect_hw(jpeg, hw_id);
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  }
>  
> +static void mtk_jpeg_dec_device_run(void *priv)
> +{
> +	struct mtk_jpeg_ctx *ctx = priv;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +
> +	queue_work(jpeg->dec_workqueue, &ctx->jpeg_work);
> +}
> +
>  static int mtk_jpeg_dec_job_ready(void *priv)
>  {
>  	struct mtk_jpeg_ctx *ctx = priv;
> @@ -1334,6 +1464,8 @@ static int mtk_jpeg_open(struct file *file)
>  
>  	if (jpeg->variant->is_encoder)
>  		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
> +	else
> +		INIT_WORK(&ctx->jpeg_work, mtk_jpegdec_worker);
>  
>  	INIT_LIST_HEAD(&ctx->dst_done_queue);
>  	v4l2_fh_init(&ctx->fh, vfd);
> @@ -1481,7 +1613,17 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
>  			WQ_MEM_RECLAIM | WQ_FREEZABLE);
>  		if (!jpeg->workqueue) {
> -			dev_err(&pdev->dev, "Failed to create jpeg workqueue!\n");
> +			dev_err(&pdev->dev, "Failed to create jpegenc workqueue!\n");
> +			ret = -EINVAL;
> +			goto err_alloc_workqueue;
> +		}
> +	} else {
> +		init_waitqueue_head(&jpeg->dec_hw_wq);
> +
> +		jpeg->dec_workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE);
> +		if (!jpeg->dec_workqueue) {
> +			dev_err(&pdev->dev, "Failed to create jpegdec workqueue!\n");
>  			ret = -EINVAL;
>  			goto err_alloc_workqueue;
>  		}
> @@ -1571,6 +1713,8 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
>  	mtk_jpeg_clk_release(jpeg);
>  	flush_workqueue(jpeg->workqueue);
>  	destroy_workqueue(jpeg->workqueue);
> +	flush_workqueue(jpeg->dec_workqueue);
> +	destroy_workqueue(jpeg->dec_workqueue);
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index b7102db..d67c49f 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -202,6 +202,9 @@ struct mtk_jpegdec_comp_dev {
>  	int jpegdec_irq;
>  	struct delayed_work job_timeout_work;
>  	struct mtk_jpeg_hw_param hw_param;
> +	atomic_t hw_rdy;
> +	enum mtk_jpeg_hw_state hw_state;
> +	spinlock_t hw_lock;
>  };
>  
>  /**
> @@ -239,6 +242,8 @@ struct mtk_jpeg_dev {
>  
>  	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
>  	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
> +	wait_queue_head_t dec_hw_wq;
> +	struct workqueue_struct	*dec_workqueue;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> index e295576..9138ecb 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> @@ -449,6 +449,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
>  	struct mtk_jpegdec_comp_dev *cjpeg =
>  		container_of(work, struct mtk_jpegdec_comp_dev,
>  		job_timeout_work.work);
> +	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  
>  	src_buf = cjpeg->hw_param.src_buffer;
> @@ -457,6 +458,9 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
>  	mtk_jpeg_dec_reset(cjpeg->reg_base);
>  	clk_disable_unprepare(cjpeg->pm.dec_clk.clk_info->jpegdec_clk);
>  	pm_runtime_put(cjpeg->pm.dev);
> +	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
> +	atomic_inc(&cjpeg->hw_rdy);
> +	wake_up(&master_jpeg->dec_hw_wq);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
>  }
> @@ -557,8 +561,18 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
>  	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	clk_disable_unprepare(jpeg->pm.dec_clk.clk_info->jpegdec_clk);
>  	pm_runtime_put(ctx->jpeg->dev);
>  
> +	if (ctx->fh.m2m_ctx &&
> +		(!list_empty(&ctx->fh.m2m_ctx->out_q_ctx.rdy_queue) ||
> +		!list_empty(&ctx->fh.m2m_ctx->cap_q_ctx.rdy_queue)))
> +		queue_work(master_jpeg->workqueue, &ctx->jpeg_work);
> +
> +	jpeg->hw_state = MTK_JPEG_HW_IDLE;
> +	wake_up(&master_jpeg->dec_hw_wq);
> +	atomic_inc(&jpeg->hw_rdy);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -612,6 +626,9 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	dev->plat_dev = pdev;
> +	atomic_set(&dev->hw_rdy, 1U);
> +	spin_lock_init(&dev->hw_lock);
> +	dev->hw_state = MTK_JPEG_HW_IDLE;
>  
>  	INIT_DELAYED_WORK(&dev->job_timeout_work, mtk_jpegdec_timeout_work);
>  
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
