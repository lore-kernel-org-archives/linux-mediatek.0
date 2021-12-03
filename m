Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D87C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+JZQdQsTXYJLKZx8/wb8GcUgN8/+S8fsUQpFox2bSM=; b=gSahzQ8efgtjMc
	nbmE3DMT+ARIlSm6LmevvIiHMZBo3ZxV595xrfgCmuP+q+1EURiejDF1jsKUs3mFZum9NVzqZLDKC
	0PSnb9tqwJboZntEJy2jMX+wJ3gSjmqnIhwKHKSSwqSlaXuUJgIw4w+gXmMpscajTojfP8XnfS8ni
	+Tf++wfOG2GushzkrUkcdHXKOL21bj4wndG/tO2RGE8xSm/NiAOLzsd9MBcoVkiB4WblxCrY/cKUL
	i2gQ1GiWZRDBGnL8YrP879ezGSxzyxGk6anpVPj+8RPDtYJl3gErUnq2I/nvVXyMRyvolLj4oGclA
	8cZqU80vqAWTPIxKm1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtApE-00GRLd-9q; Fri, 03 Dec 2021 15:50:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtApA-00GRKL-W7
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 15:50:14 +0000
Received: by mail-ed1-x52a.google.com with SMTP id l25so13189169eda.11
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 07:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xhzT2AVroq8VJRWan/yXvxnkVf1rq+0YhZQ2XSQjofo=;
 b=N8jtmHDIftbug5wgGfKz8p958a1GW+VFyIp37Fh0U3TL7IqyAHAULFo871EmdkopSY
 3JgsSQAGZYDBnW3ptzQx3asgxq0yuumjQAkk4/dl5ArQC0UtDXGDgRkQ4p6JnF0QT3tB
 QlgHupZp2OT/17GMR0SVuo/xMANnHmJZejK2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xhzT2AVroq8VJRWan/yXvxnkVf1rq+0YhZQ2XSQjofo=;
 b=BwrsYHvW4YfRAJI7u7MDONAHnoSOnw4jztucpv6giX8Gq4yaFhK7prAXyS2ODyxfD9
 ZmPvlF0r6lis2go/wOZ6R+5TITvtefEYW1lBREWTyW9dw7s/j0o+Q8D1KxgRTKQ++gaV
 xucFvObqmluIdXarttmFfhgUjHIv8YwLU4XKpqysGS96RDdbBBYLgAaVJOc8anmWkq++
 wOib8zKfb6t7LVHzpNq+K36/EkHcj2y1aMLxYigO3ymZmMP3PAj94BERz50SROVrXP13
 od8Z+XKgs7Knj9QOG4WMzSSKE3vGkmh/HmK6ki6wC6MxzbkHq2B5qU2/ZhoVKPawaIBX
 Pu0w==
X-Gm-Message-State: AOAM530DSVN57i3FDO3aZErMIlr86snFFCayHqfKrw6lf0KshcLOHgoT
 bEc9EY7fhWcbrOyPZlie+EOBig==
X-Google-Smtp-Source: ABdhPJz1dceqQfho8nblNWKj0IiokkYQZtIjpNFh4g0aamm+L8NbGikk3CLnukV/Gj1fbFL6xyBnVQ==
X-Received: by 2002:a17:907:86a1:: with SMTP id
 qa33mr24971828ejc.142.1638546611308; 
 Fri, 03 Dec 2021 07:50:11 -0800 (PST)
Received: from gmail.com ([2620:0:1059:10:5993:f714:eea7:6d6d])
 by smtp.gmail.com with ESMTPSA id e15sm2133814edq.46.2021.12.03.07.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 07:50:11 -0800 (PST)
Date: Fri, 3 Dec 2021 16:50:01 +0100
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
Subject: Re: [PATCH V6, 5/5] media: mtk-jpegenc: add output pic reorder
 interface
Message-ID: <Yao8qYubCJTaGKe0@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-6-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638501230-13417-6-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_075013_067894_9B17B4D4 
X-CRM114-Status: GOOD (  29.22  )
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

> There are two HWs in mt8195. Since the two HWs run
> in parallel, it is necessary to reorder the output images
> to ensure that the order is consistent with the input images.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
> V6: no change
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 10 +----
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   | 17 +++++++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |  1 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |  3 +-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 48 ++++++++++++++++++++++-
>  5 files changed, 65 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 80a6c1a..9e89629 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -106,15 +106,6 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
>  #define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
>  #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
>  
> -struct mtk_jpeg_src_buf {
> -	struct vb2_v4l2_buffer b;
> -	struct list_head list;
> -	struct mtk_jpeg_dec_param dec_param;
> -
> -	struct mtk_jpeg_ctx *curr_ctx;
> -	u32 frame_num;
> -};
> -
>  static int debug;
>  module_param(debug, int, 0644);
>  
> @@ -1344,6 +1335,7 @@ static int mtk_jpeg_open(struct file *file)
>  	if (jpeg->variant->is_encoder)
>  		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
>  
> +	INIT_LIST_HEAD(&ctx->dst_done_queue);
>  	v4l2_fh_init(&ctx->fh, vfd);
>  	file->private_data = &ctx->fh;
>  	v4l2_fh_add(&ctx->fh);
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 4c669af..f276221 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -13,10 +13,11 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fh.h>
> +#include <media/videobuf2-v4l2.h>
>  
> -#define MTK_JPEG_NAME		"mtk-jpeg"
> +#include "mtk_jpeg_dec_hw.h"
>  
> -#define MTK_JPEG_COMP_MAX		3
> +#define MTK_JPEG_NAME		"mtk-jpeg"
>  
>  #define MTK_JPEG_FMT_FLAG_OUTPUT	BIT(0)
>  #define MTK_JPEG_FMT_FLAG_CAPTURE	BIT(1)
> @@ -75,6 +76,15 @@ struct mtk_jpeg_variant {
>  	u32 cap_q_default_fourcc;
>  };
>  
> +struct mtk_jpeg_src_buf {
> +	struct vb2_v4l2_buffer b;
> +	struct list_head list;
> +	struct mtk_jpeg_dec_param dec_param;
> +
> +	struct mtk_jpeg_ctx *curr_ctx;
> +	u32 frame_num;
> +};
> +
>  enum mtk_jpeg_hw_state {
>  	MTK_JPEG_HW_IDLE = 0,
>  	MTK_JPEG_HW_BUSY = 1,
> @@ -232,6 +242,9 @@ struct mtk_jpeg_ctx {
>  	struct v4l2_ctrl_handler ctrl_hdl;
>  	struct work_struct jpeg_work;
>  	u32 total_frame_num;
> +	struct list_head dst_done_queue;
> +	spinlock_t done_queue_lock;
> +	u32 last_done_frame_num;
>  };
>  
>  extern struct platform_driver mtk_jpegenc_hw_driver;
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> index afbbfd5..1e38522 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <media/videobuf2-core.h>
>  
> +#include "mtk_jpeg_core.h"
>  #include "mtk_jpeg_dec_hw.h"
>  
>  #define MTK_JPEG_DUNUM_MASK(val)	(((val) - 1) & 0x3)
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> index fa0d45f..87aaa5c 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> @@ -11,9 +11,10 @@
>  
>  #include <media/videobuf2-core.h>
>  
> -#include "mtk_jpeg_core.h"
>  #include "mtk_jpeg_dec_reg.h"
>  
Why are you moving around this define?
> +#define MTK_JPEG_COMP_MAX		3
> +
>  enum {
>  	MTK_JPEG_DEC_RESULT_EOF_DONE		= 0,
>  	MTK_JPEG_DEC_RESULT_PAUSE		= 1,
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> index 244f9f7..3383dc0 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> @@ -183,6 +183,50 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
>  	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
>  }
>  
> +void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
> +{
> +	struct mtk_jpeg_ctx *ctx;
> +	struct vb2_v4l2_buffer *dst_buffer;
> +	struct list_head *temp_entry;
> +	struct list_head *pos = NULL;
> +	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
> +	unsigned long flags;
> +
> +	ctx = jpeg->hw_param.curr_ctx;
> +	if (!ctx) {
> +		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
> +		return;
> +	}
> +
> +	dst_buffer = jpeg->hw_param.dst_buffer;
> +	if (!dst_buffer) {
> +		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
> +		return;
> +	}
> +
> +	dst_done_buf = container_of(dst_buffer,
> +		struct mtk_jpeg_src_buf, b);
> +
> +	spin_lock_irqsave(&ctx->done_queue_lock, flags);
> +	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
You want to run this until there are only 0 or 1 elements? Did I got it
right?

So this means that when you enter put_buf there is max one element in
the list. Do you need a list for that or only save one buffer in case
they have come out of order?
> +	while (!list_empty(&ctx->dst_done_queue) &&
> +		(pos != &ctx->dst_done_queue)) {
> +		list_for_each_prev_safe(pos, temp_entry,
> +			(&ctx->dst_done_queue)) {
> +			tmp_dst_done_buf = list_entry(pos,
> +				struct mtk_jpeg_src_buf, list);
> +			if (tmp_dst_done_buf->frame_num ==
> +				ctx->last_done_frame_num) {
> +				list_del(&tmp_dst_done_buf->list);
> +				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> +					VB2_BUF_STATE_DONE);
> +				ctx->last_done_frame_num++;
> +			}
> +		}
> +	}
> +	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> +}
> +
>  static void mtk_jpegenc_timeout_work(struct work_struct *work)
>  {
>  	struct delayed_work *Pwork =
> @@ -203,6 +247,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
>  	atomic_inc(&cjpeg->hw_rdy);
>  	wake_up(&master_jpeg->enc_hw_wq);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
> +	mtk_jpegenc_put_buf(cjpeg);
>  }
>  
>  static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -237,8 +282,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>  	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
>  	buf_state = VB2_BUF_STATE_DONE;
>  	v4l2_m2m_buf_done(src_buf, buf_state);
> -	v4l2_m2m_buf_done(dst_buf, buf_state);
> -	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	mtk_jpegenc_put_buf(jpeg);
>  	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
>  	pm_runtime_put(ctx->jpeg->dev);
>  	if (ctx->fh.m2m_ctx &&
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
