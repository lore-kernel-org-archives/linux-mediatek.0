Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0DFC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dT2bcnW24Ajx396CHuSK6QInA11ZRsnN+Vgh0Zub1vQ=; b=hcW0jKyzz0qbrAD1N7NTsbyIoE
	A4stknrXhs4s87fF9JOlYmReTTuzGQzcnSw0i+fm3pFtznFulJgv/ZxcYYD8QLaMKzk51Smv1tegN
	BinlyayOfkbtpi1FhxSJNtmDVxbs21Q3+MxFRfbB5DhofmOnqve9immTGx5alNqtFvWM7kgCBKxSn
	XOzboWi3gd5shCCsWyHaie6HZlB2NoaT2Xz1bNAaWJVsmR+esIOaGB+MYdbFZsrvVL3S+oHhLlUIV
	htf1UCBcUaumE37cW1f0hE1gXIVekl77NP7Pu50CiAyCIltPdyL/He93vCQy6b8CeX5kmfKSEE4yX
	b7YX67oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jG0-002Uzf-9P; Fri, 08 Jul 2022 08:22:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jEc-002UJt-O8; Fri, 08 Jul 2022 08:21:16 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1865F56D;
	Fri,  8 Jul 2022 10:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1657268464;
	bh=P+n3TvfT3GN8p5M9OatBY5RI0Np6NTZzGy69mHPjD9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cz4tMNFVAiss3mdiETxlmRII+nwFGzSCrxyCGxBWSrctZ1t0VQXf6a826TPUuN5lK
	 luC8Yn9hfmbPvxbXOWfy7c/5xUjuaRFOdRSGXJZk0CHuviaBsR/7vCzolYhsNGT8gk
	 GLSw282eXWY9sjt3G+X6ml5Aiw8Ou1u5Qrsw8xFM=
Date: Fri, 8 Jul 2022 11:20:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Moudy Ho <moudy.ho@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Rob Landley <rob@landley.net>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Courbot <acourbot@chromium.org>, tfiga@chromium.org,
	drinkcat@chromium.org, pihsun@chromium.org, hsinyi@google.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	allen-kh.cheng@mediatek.com, xiandong.wang@mediatek.com,
	randy.wu@mediatek.com, jason-jh.lin@mediatek.com,
	roy-cw.yeh@mediatek.com, river.cheng@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	cellopoint.kai@gmail.com
Subject: Re: [DKIM] [PATCH v21 4/4] media: platform: mtk-mdp3: add Mediatek
 MDP3 driver
Message-ID: <Ysfo1h75vAIUjcmB@pendragon.ideasonboard.com>
References: <20220706075454.15569-1-moudy.ho@mediatek.com>
 <20220706075454.15569-5-moudy.ho@mediatek.com>
 <d93b51b3-9c94-4842-891c-cd3547ae8712@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d93b51b3-9c94-4842-891c-cd3547ae8712@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_012111_396046_F6BB940D 
X-CRM114-Status: GOOD (  36.04  )
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

On Fri, Jul 08, 2022 at 10:08:44AM +0200, Hans Verkuil wrote:
> Hi Moudy,
> 
> Some comments below:

And one more

> On 7/6/22 09:54, Moudy Ho wrote:
> > This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> > It provides the following functions:
> >   color transform, format conversion, resize, crop, rotate, flip
> >   and additional image quality enhancement.
> > 
> > The MDP3 driver is mainly used for Google Chromebook products to
> > import the new architecture to set the HW settings as shown below:
> >   User -> V4L2 framework
> >     -> MDP3 driver -> SCP (setting calculations)
> >       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> > 
> > Each modules' related operation control is sited in mtk-mdp3-comp.c
> > Each modules' register table is defined in file with "mdp_reg_" prefix
> > GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> > V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> > Probe, power, suspend/resume, system level functions are defined in
> > mtk-mdp3-core.c
> > 
> > v4l2-compliance 1.22.1, 32 bits, 32-bit time_t
> > 
> > Compliance test for mtk-mdp3 device /dev/video2:
> > 
> > Driver Info:
> > 	Driver name      : mtk-mdp3
> > 	Card type        : 14001000.mdp3-rdma0
> 
> Card type is expected to be a human readable name, and that's not the case
> here.
> 
> > 	Bus info         : platform:mtk-mdp3
> 
> <snip>
> 
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> > new file mode 100644
> > index 000000000000..9d2b8acc303f
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> > @@ -0,0 +1,769 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > + */
> > +
> > +#include <linux/platform_device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include "mtk-mdp3-m2m.h"
> > +
> > +static inline struct mdp_m2m_ctx *fh_to_ctx(struct v4l2_fh *fh)
> > +{
> > +	return container_of(fh, struct mdp_m2m_ctx, fh);
> > +}
> > +
> > +static inline struct mdp_m2m_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
> > +{
> > +	return container_of(ctrl->handler, struct mdp_m2m_ctx, ctrl_handler);
> > +}
> > +
> > +static inline struct mdp_frame *ctx_get_frame(struct mdp_m2m_ctx *ctx,
> > +					      enum v4l2_buf_type type)
> > +{
> > +	if (V4L2_TYPE_IS_OUTPUT(type))
> > +		return &ctx->curr_param.output;
> > +	else
> > +		return &ctx->curr_param.captures[0];
> > +}
> > +
> > +static void mdp_m2m_ctx_set_state(struct mdp_m2m_ctx *ctx, u32 state)
> > +{
> > +	atomic_or(state, &ctx->curr_param.state);
> > +}
> > +
> > +static bool mdp_m2m_ctx_is_state_set(struct mdp_m2m_ctx *ctx, u32 mask)
> > +{
> > +	bool ret;
> > +
> > +	ret = ((atomic_read(&ctx->curr_param.state) & mask) == mask);
> 
> This can just do 'return' so you can drop the 'ret' variable.
> 
> > +
> > +	return ret;
> > +}
> > +
> > +static void mdp_m2m_process_done(void *priv, int vb_state)
> > +{
> > +	struct mdp_m2m_ctx *ctx = priv;
> > +	struct vb2_v4l2_buffer *src_vbuf, *dst_vbuf;
> > +
> > +	src_vbuf = (struct vb2_v4l2_buffer *)
> > +			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +	dst_vbuf = (struct vb2_v4l2_buffer *)
> > +			v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > +	ctx->curr_param.frame_no = ctx->frame_count[MDP_M2M_SRC];
> > +	src_vbuf->sequence = ctx->frame_count[MDP_M2M_SRC]++;
> > +	dst_vbuf->sequence = ctx->frame_count[MDP_M2M_DST]++;
> > +	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
> > +
> > +	v4l2_m2m_buf_done(src_vbuf, vb_state);
> > +	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> > +	v4l2_m2m_job_finish(ctx->mdp_dev->m2m_dev, ctx->m2m_ctx);
> > +}
> > +
> > +static void mdp_m2m_device_run(void *priv)
> > +{
> > +	struct mdp_m2m_ctx *ctx = priv;
> > +	struct mdp_frame *frame;
> > +	struct vb2_v4l2_buffer *src_vb, *dst_vb;
> > +	struct img_ipi_frameparam param = {0};
> > +	struct mdp_cmdq_param task = {0};
> 
> Just use '= {}', it's cleaner.
> 
> > +	enum vb2_buffer_state vb_state = VB2_BUF_STATE_ERROR;
> > +	int ret;
> > +
> > +	if (mdp_m2m_ctx_is_state_set(ctx, MDP_M2M_CTX_ERROR)) {
> > +		dev_err(&ctx->mdp_dev->pdev->dev,
> > +			"mdp_m2m_ctx is in error state\n");
> > +		goto worker_end;
> > +	}
> > +
> > +	param.frame_no = ctx->curr_param.frame_no;
> > +	param.type = ctx->curr_param.type;
> > +	param.num_inputs = 1;
> > +	param.num_outputs = 1;
> > +
> > +	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> > +	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> > +	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
> > +
> > +	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> > +	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
> > +
> > +	ret = mdp_vpu_process(&ctx->vpu, &param);
> > +	if (ret) {
> > +		dev_err(&ctx->mdp_dev->pdev->dev,
> > +			"VPU MDP process failed: %d\n", ret);
> > +		goto worker_end;
> > +	}
> > +
> > +	task.config = ctx->vpu.config;
> > +	task.param = &param;
> > +	task.composes[0] = &frame->compose;
> > +	task.cmdq_cb = NULL;
> > +	task.cb_data = NULL;
> > +	task.mdp_ctx = ctx;
> > +
> > +	ret = mdp_cmdq_send(ctx->mdp_dev, &task);
> > +	if (ret) {
> > +		dev_err(&ctx->mdp_dev->pdev->dev,
> > +			"CMDQ sendtask failed: %d\n", ret);
> > +		goto worker_end;
> > +	}
> > +
> > +	return;
> > +
> > +worker_end:
> > +	mdp_m2m_process_done(ctx, vb_state);
> > +}
> > +
> > +static int mdp_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
> > +{
> > +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> > +
> > +	ctx->frame_count[MDP_M2M_SRC] = 0;
> > +	ctx->frame_count[MDP_M2M_DST] = 0;
> 
> Don't set both, check which queue it is first.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static struct vb2_v4l2_buffer *mdp_m2m_buf_remove(struct mdp_m2m_ctx *ctx,
> > +						  unsigned int type)
> > +{
> > +	if (V4L2_TYPE_IS_OUTPUT(type))
> > +		return (struct vb2_v4l2_buffer *)
> > +			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +	else
> > +		return (struct vb2_v4l2_buffer *)
> > +			v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > +}
> > +
> > +static void mdp_m2m_stop_streaming(struct vb2_queue *q)
> > +{
> > +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> > +	struct vb2_v4l2_buffer *vb;
> > +
> > +	vb = mdp_m2m_buf_remove(ctx, q->type);
> > +	while (vb) {
> > +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > +		vb = mdp_m2m_buf_remove(ctx, q->type);
> > +	}
> > +}
> > +
> > +static int mdp_m2m_queue_setup(struct vb2_queue *q,
> > +			       unsigned int *num_buffers,
> > +			       unsigned int *num_planes, unsigned int sizes[],
> > +			       struct device *alloc_devs[])
> > +{
> > +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> > +	struct v4l2_pix_format_mplane *pix_mp;
> > +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> > +	u32 i;
> > +
> > +	pix_mp = &ctx_get_frame(ctx, q->type)->format.fmt.pix_mp;
> > +
> > +	/* from VIDIOC_CREATE_BUFS */
> > +	if (*num_planes) {
> > +		if (*num_planes != pix_mp->num_planes)
> > +			return -EINVAL;
> > +		for (i = 0; i < pix_mp->num_planes; ++i)
> > +			if (sizes[i] < pix_mp->plane_fmt[i].sizeimage)
> > +				return -EINVAL;
> > +	} else {/* from VIDIOC_REQBUFS */
> > +		*num_planes = pix_mp->num_planes;
> > +		for (i = 0; i < pix_mp->num_planes; ++i)
> > +			sizes[i] = pix_mp->plane_fmt[i].sizeimage;
> > +	}
> > +
> > +	dev_info(dev, "[%d] type:%d, planes:%u, buffers:%u, size:%u,%u,%u",
> 
> This should be dropped or changed to dev_dbg. You don't want logging
> when doing normal things, that will just spam the kernel log.
> 
> > +		 ctx->id, q->type, *num_planes, *num_buffers,
> > +		 sizes[0], sizes[1], sizes[2]);
> > +	return 0;
> > +}
> > +
> > +static int mdp_m2m_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct v4l2_pix_format_mplane *pix_mp;
> > +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> > +	u32 i;
> > +
> > +	v4l2_buf->field = V4L2_FIELD_NONE;
> > +
> > +	if (!V4L2_TYPE_IS_OUTPUT(vb->type)) {
> > +		pix_mp = &ctx_get_frame(ctx, vb->type)->format.fmt.pix_mp;
> > +		for (i = 0; i < pix_mp->num_planes; ++i) {
> > +			vb2_set_plane_payload(vb, i,
> > +					      pix_mp->plane_fmt[i].sizeimage);
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int mdp_m2m_buf_out_validate(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> > +
> > +	v4l2_buf->field = V4L2_FIELD_NONE;
> > +
> > +	return 0;
> > +}
> > +
> > +static void mdp_m2m_buf_queue(struct vb2_buffer *vb)
> > +{
> > +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> > +
> > +	v4l2_buf->field = V4L2_FIELD_NONE;
> > +
> > +	v4l2_m2m_buf_queue(ctx->m2m_ctx, to_vb2_v4l2_buffer(vb));
> > +}
> > +
> > +static const struct vb2_ops mdp_m2m_qops = {
> > +	.queue_setup	= mdp_m2m_queue_setup,
> > +	.wait_prepare	= vb2_ops_wait_prepare,
> > +	.wait_finish	= vb2_ops_wait_finish,
> > +	.buf_prepare	= mdp_m2m_buf_prepare,
> > +	.start_streaming = mdp_m2m_start_streaming,
> > +	.stop_streaming	= mdp_m2m_stop_streaming,
> > +	.buf_queue	= mdp_m2m_buf_queue,
> > +	.buf_out_validate = mdp_m2m_buf_out_validate,
> > +};
> > +
> > +static int mdp_m2m_querycap(struct file *file, void *fh,
> > +			    struct v4l2_capability *cap)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > +
> > +	strscpy(cap->driver, MDP_MODULE_NAME, sizeof(cap->driver));
> > +	strscpy(cap->card, ctx->mdp_dev->pdev->name, sizeof(cap->card));
> 
> As mentioned at the top, this is not a suitable name for cap->card.
> 
> > +	strscpy(cap->bus_info, "platform:mtk-mdp3", sizeof(cap->bus_info));

And don't override bus_info, the value isn't right. The V4L2 core should
do the right thing for platform devices now.

> > +	return 0;
> > +}
> > +
> > +static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
> > +				   struct v4l2_fmtdesc *f)
> > +{
> > +	return mdp_enum_fmt_mplane(f);
> > +}
> > +
> > +static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
> > +				struct v4l2_format *f)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > +	struct mdp_frame *frame;
> > +	struct v4l2_pix_format_mplane *pix_mp;
> > +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> > +
> > +	frame = ctx_get_frame(ctx, f->type);
> > +	*f = frame->format;
> > +	pix_mp = &f->fmt.pix_mp;
> > +	pix_mp->colorspace = ctx->curr_param.colorspace;
> > +	pix_mp->xfer_func = ctx->curr_param.xfer_func;
> > +	pix_mp->ycbcr_enc = ctx->curr_param.ycbcr_enc;
> > +	pix_mp->quantization = ctx->curr_param.quant;
> > +
> > +	dev_info(dev, "[%d] type:%d, frame:%ux%u colorspace=%d", ctx->id, f->type,
> > +		 f->fmt.pix_mp.width, f->fmt.pix_mp.height,
> > +		 f->fmt.pix_mp.colorspace);
> 
> Drop this, you're returning this info to userspace anyway, so why spam the
> kernel log?
> 
> > +	return 0;
> > +}
> > +
> > +static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
> > +				struct v4l2_format *f)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > +	struct mdp_frame *frame = ctx_get_frame(ctx, f->type);
> > +	struct mdp_frame *capture;
> > +	const struct mdp_format *fmt;
> > +	struct vb2_queue *vq;
> > +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> > +
> > +	dev_info(dev, "[%d] type:%d", ctx->id, f->type);
> 
> dev_dbg. If dev_info is used elsewhere in similar situations, then replace that
> with dev_dbg as well. Regular usage of this driver must not produce kernel logging.
> 
> > +
> > +	fmt = mdp_try_fmt_mplane(f, &ctx->curr_param, ctx->id);
> > +	if (!fmt) {
> > +		dev_info(dev, "[%d] try_fmt failed, type:%d", ctx->id, f->type);
> 
> Drop this, the error code says enough.
> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> > +	if (vb2_is_streaming(vq)) {
> 
> This must be vb2_is_busy(): changing formats is prohibited once buffers are
> allocated (vb2_is_busy() is true in that case).
> 
> > +		dev_info(&ctx->mdp_dev->pdev->dev, "Queue %d busy\n", f->type);
> 
> Drop this, the error code says enough.
> 
> > +		return -EBUSY;
> > +	}
> > +
> > +	frame->format = *f;
> > +	frame->mdp_fmt = fmt;
> > +	frame->ycbcr_prof = mdp_map_ycbcr_prof_mplane(f, fmt->mdp_color);
> > +	frame->usage = V4L2_TYPE_IS_OUTPUT(f->type) ?
> > +		MDP_BUFFER_USAGE_HW_READ : MDP_BUFFER_USAGE_MDP;
> > +
> > +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> > +		capture->crop.c.left = 0;
> > +		capture->crop.c.top = 0;
> > +		capture->crop.c.width = f->fmt.pix_mp.width;
> > +		capture->crop.c.height = f->fmt.pix_mp.height;
> > +		ctx->curr_param.colorspace = f->fmt.pix_mp.colorspace;
> > +		ctx->curr_param.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> > +		ctx->curr_param.quant = f->fmt.pix_mp.quantization;
> > +		ctx->curr_param.xfer_func = f->fmt.pix_mp.xfer_func;
> > +	} else {
> > +		capture->compose.left = 0;
> > +		capture->compose.top = 0;
> > +		capture->compose.width = f->fmt.pix_mp.width;
> > +		capture->compose.height = f->fmt.pix_mp.height;
> > +	}
> > +
> > +	ctx->frame_count[MDP_M2M_SRC] = 0;
> > +	ctx->frame_count[MDP_M2M_DST] = 0;
> 
> Changing the format doesn't mean you need to zero this. Just drop these two
> line.
> 
> > +
> > +	dev_info(dev, "[%d] type:%d, frame:%ux%u", ctx->id, f->type,
> > +		 f->fmt.pix_mp.width, f->fmt.pix_mp.height);
> 
> Drop this.
> 
> > +	return 0;
> > +}
> > +
> > +static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
> > +				  struct v4l2_format *f)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > +
> > +	if (!mdp_try_fmt_mplane(f, &ctx->curr_param, ctx->id))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mdp_m2m_streamon(struct file *file, void *fh,
> > +			    enum v4l2_buf_type type)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > +	struct mdp_frame *capture;
> > +	int ret;
> > +	bool out_streaming, cap_streaming;
> > +
> > +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +	out_streaming = ctx->m2m_ctx->out_q_ctx.q.streaming;
> > +	cap_streaming = ctx->m2m_ctx->cap_q_ctx.q.streaming;
> 
> Use vb2_is_streaming() rather than accessing q.streaming directly.
> 
> > +
> > +	/* Check to see if scaling ratio is within supported range */
> > +	if ((V4L2_TYPE_IS_OUTPUT(type) && cap_streaming) ||
> > +	    (!V4L2_TYPE_IS_OUTPUT(type) && out_streaming)) {
> > +		ret = mdp_check_scaling_ratio(&capture->crop.c,
> > +					      &capture->compose,
> > +					      capture->rotation,
> > +					      ctx->curr_param.limit);
> > +		if (ret) {
> > +			dev_info(&ctx->mdp_dev->pdev->dev,
> > +				 "Out of scaling range\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (!mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT)) {
> > +		ret = mdp_vpu_get_locked(ctx->mdp_dev);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = mdp_vpu_ctx_init(&ctx->vpu, &ctx->mdp_dev->vpu,
> > +				       MDP_DEV_M2M);
> > +		if (ret) {
> > +			dev_err(&ctx->mdp_dev->pdev->dev,
> > +				"VPU init failed %d\n", ret);
> > +			return -EINVAL;
> > +		}
> > +		mdp_m2m_ctx_set_state(ctx, MDP_VPU_INIT);
> > +	}
> > +
> > +	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
> > +}
> 
> There really is no reason to override streamon. You can also do this in
> start_streaming(). I recommend moving these tests there. Internally
> streamon() will call start_streaming(), so any error you return in that
> callback function will be the error return of the streamon as well.
> 
> > +
> > +static int mdp_m2m_g_selection(struct file *file, void *fh,
> > +			       struct v4l2_selection *s)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > +	struct mdp_frame *frame;
> > +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> > +	bool valid = false;
> > +
> > +	if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +		valid = mdp_target_is_crop(s->target);
> > +	else if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +		valid = mdp_target_is_compose(s->target);
> > +
> > +	if (!valid) {
> > +		dev_err(dev, "[%s:%d] invalid type:%u target:%u", __func__, ctx->id,
> > +			s->type, s->target);
> 
> Drop this. User errors should never cause spamming in the kernel log.
> 
> Please check your code: you can use dev_dbg to help debugging, but dev_info
> should be used very sparingly (typically only in probe() and remove()), and
> dev_warn/err only for hardware/driver warnings/errors, and never due to
> userspace inputs.
> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (s->target) {
> > +	case V4L2_SEL_TGT_CROP:
> > +		if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +			frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +			s->r = frame->crop.c;
> > +			return 0;
> > +		}
> 
> It's easier to read if you swap the tests:
> 
> 		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> 			return -EINVAL;
> 		frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> 		s->r = frame->crop.c;
> 		return 0;
> 
> Same below.
> 
> > +		break;
> > +	case V4L2_SEL_TGT_COMPOSE:
> > +		if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > +			frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +			s->r = frame->compose;
> > +			return 0;
> > +		}
> > +		break;
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +			frame = ctx_get_frame(ctx, s->type);
> > +			s->r.left = 0;
> > +			s->r.top = 0;
> > +			s->r.width = frame->format.fmt.pix_mp.width;
> > +			s->r.height = frame->format.fmt.pix_mp.height;
> > +			return 0;
> > +		}
> > +		break;
> > +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > +		if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > +			frame = ctx_get_frame(ctx, s->type);
> > +			s->r.left = 0;
> > +			s->r.top = 0;
> > +			s->r.width = frame->format.fmt.pix_mp.width;
> > +			s->r.height = frame->format.fmt.pix_mp.height;
> > +			return 0;
> > +		}
> > +		break;
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> > +static int mdp_m2m_s_selection(struct file *file, void *fh,
> > +			       struct v4l2_selection *s)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > +	struct mdp_frame *frame = ctx_get_frame(ctx, s->type);
> > +	struct mdp_frame *capture;
> > +	struct v4l2_rect r;
> > +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> > +	bool valid = false;
> > +	int ret;
> > +
> > +	if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +		valid = (s->target == V4L2_SEL_TGT_CROP);
> > +	else if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +		valid = (s->target == V4L2_SEL_TGT_COMPOSE);
> > +
> > +	if (!valid) {
> > +		dev_err(dev, "[%s:%d] invalid type:%u target:%u", __func__, ctx->id,
> > +			s->type, s->target);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = mdp_try_crop(ctx, &r, s, frame);
> > +	if (ret)
> > +		return ret;
> > +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +
> > +	if (mdp_target_is_crop(s->target))
> > +		capture->crop.c = r;
> > +	else
> > +		capture->compose = r;
> > +
> > +	s->r = r;
> > +	memset(s->reserved, 0, sizeof(s->reserved));
> 
> No need for this memset, the v4l2 core will clear this for you.
> 
> > +
> > +	ctx->frame_count[MDP_M2M_SRC] = 0;
> > +	ctx->frame_count[MDP_M2M_DST] = 0;
> 
> Drop this!
> 
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ioctl_ops mdp_m2m_ioctl_ops = {
> > +	.vidioc_querycap		= mdp_m2m_querycap,
> > +	.vidioc_enum_fmt_vid_cap	= mdp_m2m_enum_fmt_mplane,
> > +	.vidioc_enum_fmt_vid_out	= mdp_m2m_enum_fmt_mplane,
> > +	.vidioc_g_fmt_vid_cap_mplane	= mdp_m2m_g_fmt_mplane,
> > +	.vidioc_g_fmt_vid_out_mplane	= mdp_m2m_g_fmt_mplane,
> > +	.vidioc_s_fmt_vid_cap_mplane	= mdp_m2m_s_fmt_mplane,
> > +	.vidioc_s_fmt_vid_out_mplane	= mdp_m2m_s_fmt_mplane,
> > +	.vidioc_try_fmt_vid_cap_mplane	= mdp_m2m_try_fmt_mplane,
> > +	.vidioc_try_fmt_vid_out_mplane	= mdp_m2m_try_fmt_mplane,
> > +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> > +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> > +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> > +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> > +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> > +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> > +	.vidioc_streamon		= mdp_m2m_streamon,
> > +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> > +	.vidioc_g_selection		= mdp_m2m_g_selection,
> > +	.vidioc_s_selection		= mdp_m2m_s_selection,
> > +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> > +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> > +};
> > +
> > +static int mdp_m2m_queue_init(void *priv,
> > +			      struct vb2_queue *src_vq,
> > +			      struct vb2_queue *dst_vq)
> > +{
> > +	struct mdp_m2m_ctx *ctx = priv;
> > +	int ret;
> > +
> > +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	src_vq->ops = &mdp_m2m_qops;
> > +	src_vq->mem_ops = &vb2_dma_contig_memops;
> > +	src_vq->drv_priv = ctx;
> > +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> > +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +	src_vq->dev = &ctx->mdp_dev->pdev->dev;
> > +	src_vq->lock = &ctx->ctx_lock;
> > +
> > +	ret = vb2_queue_init(src_vq);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	dst_vq->ops = &mdp_m2m_qops;
> > +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> > +	dst_vq->drv_priv = ctx;
> > +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> > +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +	dst_vq->dev = &ctx->mdp_dev->pdev->dev;
> > +	dst_vq->lock = &ctx->ctx_lock;
> > +
> > +	return vb2_queue_init(dst_vq);
> > +}
> > +
> > +static int mdp_m2m_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mdp_m2m_ctx *ctx = ctrl_to_ctx(ctrl);
> > +	struct mdp_frame *capture;
> > +
> > +	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
> > +		return 0;
> 
> Why this test? As far as I can tell this flag is never set, so there
> is no need to check against it.
> 
> > +
> > +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_HFLIP:
> > +		capture->hflip = ctrl->val;
> > +		break;
> > +	case V4L2_CID_VFLIP:
> > +		capture->vflip = ctrl->val;
> > +		break;
> > +	case V4L2_CID_ROTATE:
> > +		capture->rotation = ctrl->val;
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mdp_m2m_ctrl_ops = {
> > +	.s_ctrl	= mdp_m2m_s_ctrl,
> > +};
> > +
> > +static int mdp_m2m_ctrls_create(struct mdp_m2m_ctx *ctx)
> > +{
> > +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, MDP_MAX_CTRLS);
> > +	ctx->ctrls.hflip = v4l2_ctrl_new_std(&ctx->ctrl_handler,
> > +					     &mdp_m2m_ctrl_ops, V4L2_CID_HFLIP,
> > +					     0, 1, 1, 0);
> > +	ctx->ctrls.vflip = v4l2_ctrl_new_std(&ctx->ctrl_handler,
> > +					     &mdp_m2m_ctrl_ops, V4L2_CID_VFLIP,
> > +					     0, 1, 1, 0);
> > +	ctx->ctrls.rotate = v4l2_ctrl_new_std(&ctx->ctrl_handler,
> > +					      &mdp_m2m_ctrl_ops,
> > +					      V4L2_CID_ROTATE, 0, 270, 90, 0);
> > +
> > +	if (ctx->ctrl_handler.error) {
> > +		int err = ctx->ctrl_handler.error;
> > +
> > +		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> > +		dev_err(&ctx->mdp_dev->pdev->dev,
> > +			"Failed to register controls\n");
> > +		return err;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int mdp_m2m_open(struct file *file)
> > +{
> > +	struct video_device *vdev = video_devdata(file);
> > +	struct mdp_dev *mdp = video_get_drvdata(vdev);
> > +	struct mdp_m2m_ctx *ctx;
> > +	struct device *dev = &mdp->pdev->dev;
> > +	int ret;
> > +	struct v4l2_format default_format;
> 
> Just add '= {}' to avoid the memset later on.
> 
> > +
> > +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	if (mutex_lock_interruptible(&mdp->m2m_lock)) {
> > +		ret = -ERESTARTSYS;
> > +		goto err_free_ctx;
> > +	}
> > +
> > +	ctx->id = ida_alloc(&mdp->mdp_ida, GFP_KERNEL);
> > +	ctx->mdp_dev = mdp;
> > +
> > +	v4l2_fh_init(&ctx->fh, vdev);
> > +	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> 
> This doesn't belong in open(). It is already done when the video device is registered.
> 
> > +	file->private_data = &ctx->fh;
> > +	ret = mdp_m2m_ctrls_create(ctx);
> > +	if (ret)
> > +		goto err_exit_fh;
> > +
> > +	/* Use separate control handler per file handle */
> > +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
> > +	v4l2_fh_add(&ctx->fh);
> > +
> > +	mutex_init(&ctx->ctx_lock);
> > +	ctx->m2m_ctx = v4l2_m2m_ctx_init(mdp->m2m_dev, ctx, mdp_m2m_queue_init);
> > +	if (IS_ERR(ctx->m2m_ctx)) {
> > +		dev_err(dev, "Failed to initialize m2m context\n");
> > +		ret = PTR_ERR(ctx->m2m_ctx);
> > +		goto err_release_handler;
> > +	}
> > +	ctx->fh.m2m_ctx = ctx->m2m_ctx;
> > +
> > +	ctx->curr_param.ctx = ctx;
> > +	ret = mdp_frameparam_init(&ctx->curr_param);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to initialize mdp parameter\n");
> > +		goto err_release_m2m_ctx;
> > +	}
> > +
> > +	mutex_unlock(&mdp->m2m_lock);
> > +
> > +	/* Default format */
> > +	memset(&default_format, 0, sizeof(default_format));
> 
> This can be dropped if default_format is inited with = {}.
> 
> > +	default_format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > +	default_format.fmt.pix_mp.width = 32;
> > +	default_format.fmt.pix_mp.height = 32;
> > +	default_format.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420M;
> > +	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
> > +	default_format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > +	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
> > +
> > +	dev_dbg(dev, "%s:[%d]", __func__, ctx->id);
> > +
> > +	return 0;
> > +
> > +err_release_m2m_ctx:
> > +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> > +err_release_handler:
> > +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> > +	v4l2_fh_del(&ctx->fh);
> > +err_exit_fh:
> > +	v4l2_fh_exit(&ctx->fh);
> > +	mutex_unlock(&mdp->m2m_lock);
> > +err_free_ctx:
> > +	kfree(ctx);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mdp_m2m_release(struct file *file)
> > +{
> > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(file->private_data);
> > +	struct mdp_dev *mdp = video_drvdata(file);
> > +	struct device *dev = &mdp->pdev->dev;
> > +
> > +	mutex_lock(&mdp->m2m_lock);
> > +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> > +	if (mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT)) {
> > +		mdp_vpu_ctx_deinit(&ctx->vpu);
> > +		mdp_vpu_put_locked(mdp);
> > +	}
> > +
> > +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> > +	v4l2_fh_del(&ctx->fh);
> > +	v4l2_fh_exit(&ctx->fh);
> > +	ida_free(&mdp->mdp_ida, ctx->id);
> > +	mutex_unlock(&mdp->m2m_lock);
> > +
> > +	dev_dbg(dev, "%s:[%d]", __func__, ctx->id);
> > +	kfree(ctx);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_file_operations mdp_m2m_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.poll		= v4l2_m2m_fop_poll,
> > +	.unlocked_ioctl	= video_ioctl2,
> > +	.mmap		= v4l2_m2m_fop_mmap,
> > +	.open		= mdp_m2m_open,
> > +	.release	= mdp_m2m_release,
> > +};
> > +
> > +static const struct v4l2_m2m_ops mdp_m2m_ops = {
> > +	.device_run	= mdp_m2m_device_run,
> > +};
> > +
> > +int mdp_m2m_device_register(struct mdp_dev *mdp)
> > +{
> > +	struct device *dev = &mdp->pdev->dev;
> > +	int ret = 0;
> > +
> > +	mdp->m2m_vdev = video_device_alloc();
> > +	if (!mdp->m2m_vdev) {
> > +		dev_err(dev, "Failed to allocate video device\n");
> > +		ret = -ENOMEM;
> > +		goto err_video_alloc;
> > +	}
> > +	mdp->m2m_vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE |
> > +		V4L2_CAP_STREAMING;
> > +	mdp->m2m_vdev->fops = &mdp_m2m_fops;
> > +	mdp->m2m_vdev->ioctl_ops = &mdp_m2m_ioctl_ops;
> > +	mdp->m2m_vdev->release = mdp_video_device_release;
> > +	mdp->m2m_vdev->lock = &mdp->m2m_lock;
> > +	mdp->m2m_vdev->vfl_dir = VFL_DIR_M2M;
> > +	mdp->m2m_vdev->v4l2_dev = &mdp->v4l2_dev;
> > +	snprintf(mdp->m2m_vdev->name, sizeof(mdp->m2m_vdev->name), "%s:m2m",
> > +		 MDP_MODULE_NAME);
> > +	video_set_drvdata(mdp->m2m_vdev, mdp);
> > +
> > +	mdp->m2m_dev = v4l2_m2m_init(&mdp_m2m_ops);
> > +	if (IS_ERR(mdp->m2m_dev)) {
> > +		dev_err(dev, "Failed to initialize v4l2-m2m device\n");
> > +		ret = PTR_ERR(mdp->m2m_dev);
> > +		goto err_m2m_init;
> > +	}
> > +
> > +	ret = video_register_device(mdp->m2m_vdev, VFL_TYPE_VIDEO, 2);
> 
> Why 2? Just use -1 to pick the first free device number.
> 
> > +	if (ret) {
> > +		dev_err(dev, "Failed to register video device\n");
> > +		goto err_video_register;
> > +	}
> > +
> > +	v4l2_info(&mdp->v4l2_dev, "Driver registered as /dev/video%d",
> > +		  mdp->m2m_vdev->num);
> > +	return 0;
> > +
> > +err_video_register:
> > +	v4l2_m2m_release(mdp->m2m_dev);
> > +err_m2m_init:
> > +	video_device_release(mdp->m2m_vdev);
> > +err_video_alloc:
> > +
> > +	return ret;
> > +}
> > +
> > +void mdp_m2m_device_unregister(struct mdp_dev *mdp)
> > +{
> > +	video_unregister_device(mdp->m2m_vdev);
> > +}
> > +
> > +void mdp_m2m_job_finish(struct mdp_m2m_ctx *ctx)
> > +{
> > +	enum vb2_buffer_state vb_state = VB2_BUF_STATE_DONE;
> > +
> > +	mdp_m2m_process_done(ctx, vb_state);
> > +}
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
> > new file mode 100644
> > index 000000000000..61ddbaf1bf13
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > + */
> > +
> > +#ifndef __MTK_MDP3_M2M_H__
> > +#define __MTK_MDP3_M2M_H__
> > +
> > +#include <media/v4l2-ctrls.h>
> > +#include "mtk-mdp3-core.h"
> > +#include "mtk-mdp3-vpu.h"
> > +#include "mtk-mdp3-regs.h"
> > +
> > +#define MDP_MAX_CTRLS	10
> > +
> > +enum {
> > +	MDP_M2M_SRC = 0,
> > +	MDP_M2M_DST = 1,
> > +	MDP_M2M_MAX,
> > +};
> > +
> > +struct mdp_m2m_ctrls {
> > +	struct v4l2_ctrl	*hflip;
> > +	struct v4l2_ctrl	*vflip;
> > +	struct v4l2_ctrl	*rotate;
> > +};
> > +
> > +struct mdp_m2m_ctx {
> > +	u32				id;
> > +	struct mdp_dev			*mdp_dev;
> > +	struct v4l2_fh			fh;
> > +	struct v4l2_ctrl_handler	ctrl_handler;
> > +	struct mdp_m2m_ctrls		ctrls;
> > +	struct v4l2_m2m_ctx		*m2m_ctx;
> > +	struct mdp_vpu_ctx		vpu;
> > +	u32				frame_count[MDP_M2M_MAX];
> > +
> > +	struct mdp_frameparam		curr_param;
> > +	/* synchronization protect for mdp m2m context */
> > +	struct mutex			ctx_lock;
> > +};
> > +
> > +int mdp_m2m_device_register(struct mdp_dev *mdp);
> > +void mdp_m2m_device_unregister(struct mdp_dev *mdp);
> > +void mdp_m2m_job_finish(struct mdp_m2m_ctx *ctx);
> > +
> > +#endif  /* __MTK_MDP3_M2M_H__ */
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
> > new file mode 100644
> > index 000000000000..18874eb7851c
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
> > @@ -0,0 +1,742 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > + */
> > +
> > +#include <media/v4l2-common.h>
> > +#include <media/videobuf2-v4l2.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include "mtk-mdp3-core.h"
> > +#include "mtk-mdp3-regs.h"
> > +#include "mtk-mdp3-m2m.h"
> > +
> > +/*
> > + * All 10-bit related formats are not added in the basic format list,
> > + * please add the corresponding format settings before use.
> > + */
> > +static const struct mdp_format mdp_formats[] = {
> > +	{
> > +		.pixelformat	= V4L2_PIX_FMT_GREY,
> > +		.mdp_color	= MDP_COLOR_GREY,
> > +		.depth		= { 8 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_RGB565X,
> > +		.mdp_color	= MDP_COLOR_BGR565,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 16 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_RGB565,
> > +		.mdp_color	= MDP_COLOR_RGB565,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 16 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_RGB24,
> > +		.mdp_color	= MDP_COLOR_RGB888,
> > +		.depth		= { 24 },
> > +		.row_depth	= { 24 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_BGR24,
> > +		.mdp_color	= MDP_COLOR_BGR888,
> > +		.depth		= { 24 },
> > +		.row_depth	= { 24 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_ABGR32,
> > +		.mdp_color	= MDP_COLOR_BGRA8888,
> > +		.depth		= { 32 },
> > +		.row_depth	= { 32 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_ARGB32,
> > +		.mdp_color	= MDP_COLOR_ARGB8888,
> > +		.depth		= { 32 },
> > +		.row_depth	= { 32 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_UYVY,
> > +		.mdp_color	= MDP_COLOR_UYVY,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 16 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_VYUY,
> > +		.mdp_color	= MDP_COLOR_VYUY,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 16 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_YUYV,
> > +		.mdp_color	= MDP_COLOR_YUYV,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 16 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_YVYU,
> > +		.mdp_color	= MDP_COLOR_YVYU,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 16 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_YUV420,
> > +		.mdp_color	= MDP_COLOR_I420,
> > +		.depth		= { 12 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_YVU420,
> > +		.mdp_color	= MDP_COLOR_YV12,
> > +		.depth		= { 12 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV12,
> > +		.mdp_color	= MDP_COLOR_NV12,
> > +		.depth		= { 12 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV21,
> > +		.mdp_color	= MDP_COLOR_NV21,
> > +		.depth		= { 12 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV16,
> > +		.mdp_color	= MDP_COLOR_NV16,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV61,
> > +		.mdp_color	= MDP_COLOR_NV61,
> > +		.depth		= { 16 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV24,
> > +		.mdp_color	= MDP_COLOR_NV24,
> > +		.depth		= { 24 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV42,
> > +		.mdp_color	= MDP_COLOR_NV42,
> > +		.depth		= { 24 },
> > +		.row_depth	= { 8 },
> > +		.num_planes	= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_MT21C,
> > +		.mdp_color	= MDP_COLOR_420_BLK_UFO,
> > +		.depth		= { 8, 4 },
> > +		.row_depth	= { 8, 8 },
> > +		.num_planes	= 2,
> > +		.walign		= 4,
> > +		.halign		= 5,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_MM21,
> > +		.mdp_color	= MDP_COLOR_420_BLK,
> > +		.depth		= { 8, 4 },
> > +		.row_depth	= { 8, 8 },
> > +		.num_planes	= 2,
> > +		.walign		= 4,
> > +		.halign		= 5,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV12M,
> > +		.mdp_color	= MDP_COLOR_NV12,
> > +		.depth		= { 8, 4 },
> > +		.row_depth	= { 8, 8 },
> > +		.num_planes	= 2,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV21M,
> > +		.mdp_color	= MDP_COLOR_NV21,
> > +		.depth		= { 8, 4 },
> > +		.row_depth	= { 8, 8 },
> > +		.num_planes	= 2,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV16M,
> > +		.mdp_color	= MDP_COLOR_NV16,
> > +		.depth		= { 8, 8 },
> > +		.row_depth	= { 8, 8 },
> > +		.num_planes	= 2,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_NV61M,
> > +		.mdp_color	= MDP_COLOR_NV61,
> > +		.depth		= { 8, 8 },
> > +		.row_depth	= { 8, 8 },
> > +		.num_planes	= 2,
> > +		.walign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_YUV420M,
> > +		.mdp_color	= MDP_COLOR_I420,
> > +		.depth		= { 8, 2, 2 },
> > +		.row_depth	= { 8, 4, 4 },
> > +		.num_planes	= 3,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}, {
> > +		.pixelformat	= V4L2_PIX_FMT_YVU420M,
> > +		.mdp_color	= MDP_COLOR_YV12,
> > +		.depth		= { 8, 2, 2 },
> > +		.row_depth	= { 8, 4, 4 },
> > +		.num_planes	= 3,
> > +		.walign		= 1,
> > +		.halign		= 1,
> > +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> > +	}
> > +};
> > +
> > +static const struct mdp_limit mdp_def_limit = {
> > +	.out_limit = {
> > +		.wmin	= 16,
> > +		.hmin	= 16,
> > +		.wmax	= 8176,
> > +		.hmax	= 8176,
> > +	},
> > +	.cap_limit = {
> > +		.wmin	= 2,
> > +		.hmin	= 2,
> > +		.wmax	= 8176,
> > +		.hmax	= 8176,
> > +	},
> > +	.h_scale_up_max = 32,
> > +	.v_scale_up_max = 32,
> > +	.h_scale_down_max = 20,
> > +	.v_scale_down_max = 128,
> > +};
> > +
> > +static const struct mdp_format *mdp_find_fmt(u32 pixelformat, u32 type)
> > +{
> > +	u32 i, flag;
> > +
> > +	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
> > +					MDP_FMT_FLAG_CAPTURE;
> > +	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> > +		if (!(mdp_formats[i].flags & flag))
> > +			continue;
> > +		if (mdp_formats[i].pixelformat == pixelformat)
> > +			return &mdp_formats[i];
> > +	}
> > +	return NULL;
> > +}
> > +
> > +static const struct mdp_format *mdp_find_fmt_by_index(u32 index, u32 type)
> > +{
> > +	u32 i, flag, num = 0;
> > +
> > +	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
> > +					MDP_FMT_FLAG_CAPTURE;
> > +	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> > +		if (!(mdp_formats[i].flags & flag))
> > +			continue;
> > +		if (index == num)
> > +			return &mdp_formats[i];
> > +		num++;
> > +	}
> > +	return NULL;
> > +}
> > +
> > +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct v4l2_format *f,
> > +						 u32 mdp_color)
> > +{
> > +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> > +
> > +	if (MDP_COLOR_IS_RGB(mdp_color))
> > +		return MDP_YCBCR_PROFILE_FULL_BT601;
> > +
> > +	switch (pix_mp->colorspace) {
> > +	case V4L2_COLORSPACE_JPEG:
> > +		return MDP_YCBCR_PROFILE_JPEG;
> > +	case V4L2_COLORSPACE_REC709:
> > +	case V4L2_COLORSPACE_DCI_P3:
> > +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +			return MDP_YCBCR_PROFILE_FULL_BT709;
> > +		return MDP_YCBCR_PROFILE_BT709;
> > +	case V4L2_COLORSPACE_BT2020:
> > +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +			return MDP_YCBCR_PROFILE_FULL_BT2020;
> > +		return MDP_YCBCR_PROFILE_BT2020;
> > +	default:
> > +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +			return MDP_YCBCR_PROFILE_FULL_BT601;
> > +		return MDP_YCBCR_PROFILE_BT601;
> > +	}
> > +}
> > +
> > +static void mdp_bound_align_image(u32 *w, u32 *h,
> > +				  struct v4l2_frmsize_stepwise *s,
> > +				  unsigned int salign)
> > +{
> > +	unsigned int org_w, org_h;
> > +
> > +	org_w = *w;
> > +	org_h = *h;
> > +	v4l_bound_align_image(w, s->min_width, s->max_width, s->step_width,
> > +			      h, s->min_height, s->max_height, s->step_height,
> > +			      salign);
> > +
> > +	s->min_width = org_w;
> > +	s->min_height = org_h;
> > +	v4l2_apply_frmsize_constraints(w, h, s);
> > +}
> > +
> > +static int mdp_clamp_align(s32 *x, int min, int max, unsigned int align)
> > +{
> > +	unsigned int mask;
> > +
> > +	if (min < 0 || max < 0)
> > +		return -ERANGE;
> > +
> > +	/* Bits that must be zero to be aligned */
> > +	mask = ~((1 << align) - 1);
> > +
> > +	min = 0 ? 0 : ((min + ~mask) & mask);
> > +	max = max & mask;
> > +	if ((unsigned int)min > (unsigned int)max)
> > +		return -ERANGE;
> > +
> > +	/* Clamp to aligned min and max */
> > +	*x = clamp(*x, min, max);
> > +
> > +	/* Round to nearest aligned value */
> > +	if (align)
> > +		*x = (*x + (1 << (align - 1))) & mask;
> > +	return 0;
> > +}
> > +
> > +int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
> > +{
> > +	const struct mdp_format *fmt;
> > +
> > +	fmt = mdp_find_fmt_by_index(f->index, f->type);
> > +	if (!fmt)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat = fmt->pixelformat;
> > +	return 0;
> > +}
> > +
> > +const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
> > +					    struct mdp_frameparam *param,
> > +					    u32 ctx_id)
> > +{
> > +	struct device *dev = &param->ctx->mdp_dev->pdev->dev;
> > +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> > +	const struct mdp_format *fmt;
> > +	const struct mdp_pix_limit *pix_limit;
> > +	struct v4l2_frmsize_stepwise s;
> > +	u32 org_w, org_h;
> > +	unsigned int i;
> > +
> > +	fmt = mdp_find_fmt(pix_mp->pixelformat, f->type);
> > +	if (!fmt) {
> > +		fmt = mdp_find_fmt_by_index(0, f->type);
> > +		if (!fmt) {
> > +			dev_dbg(dev, "%d: pixelformat %c%c%c%c invalid", ctx_id,
> > +				(pix_mp->pixelformat & 0xff),
> > +				(pix_mp->pixelformat >>  8) & 0xff,
> > +				(pix_mp->pixelformat >> 16) & 0xff,
> > +				(pix_mp->pixelformat >> 24) & 0xff);
> > +			return NULL;
> > +		}
> > +	}
> > +
> > +	pix_mp->field = V4L2_FIELD_NONE;
> > +	pix_mp->flags = 0;
> > +	pix_mp->pixelformat = fmt->pixelformat;
> > +	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
> > +		pix_mp->colorspace = param->colorspace;
> > +		pix_mp->xfer_func = param->xfer_func;
> > +		pix_mp->ycbcr_enc = param->ycbcr_enc;
> > +		pix_mp->quantization = param->quant;
> > +	}
> > +
> > +	pix_limit = V4L2_TYPE_IS_OUTPUT(f->type) ? &param->limit->out_limit :
> > +						&param->limit->cap_limit;
> > +	s.min_width = pix_limit->wmin;
> > +	s.max_width = pix_limit->wmax;
> > +	s.step_width = fmt->walign;
> > +	s.min_height = pix_limit->hmin;
> > +	s.max_height = pix_limit->hmax;
> > +	s.step_height = fmt->halign;
> > +	org_w = pix_mp->width;
> > +	org_h = pix_mp->height;
> > +
> > +	mdp_bound_align_image(&pix_mp->width, &pix_mp->height, &s, fmt->salign);
> > +	if (org_w != pix_mp->width || org_h != pix_mp->height)
> > +		dev_dbg(dev, "%d: size change: %ux%u to %ux%u", ctx_id,
> > +			org_w, org_h, pix_mp->width, pix_mp->height);
> > +
> > +	if (pix_mp->num_planes && pix_mp->num_planes != fmt->num_planes)
> > +		dev_dbg(dev, "%d num of planes change: %u to %u", ctx_id,
> > +			pix_mp->num_planes, fmt->num_planes);
> > +	pix_mp->num_planes = fmt->num_planes;
> > +
> > +	for (i = 0; i < pix_mp->num_planes; ++i) {
> > +		u32 min_bpl = (pix_mp->width * fmt->row_depth[i]) >> 3;
> > +		u32 max_bpl = (pix_limit->wmax * fmt->row_depth[i]) >> 3;
> > +		u32 bpl = pix_mp->plane_fmt[i].bytesperline;
> > +		u32 min_si, max_si;
> > +		u32 si = pix_mp->plane_fmt[i].sizeimage;
> > +
> > +		bpl = clamp(bpl, min_bpl, max_bpl);
> > +		pix_mp->plane_fmt[i].bytesperline = bpl;
> > +
> > +		min_si = (bpl * pix_mp->height * fmt->depth[i]) / fmt->row_depth[i];
> > +		max_si = (bpl * s.max_height * fmt->depth[i]) / fmt->row_depth[i];
> > +
> > +		si = clamp(si, min_si, max_si);
> > +		pix_mp->plane_fmt[i].sizeimage = si;
> > +
> > +		dev_dbg(dev, "%d: p%u, bpl:%u [%u, %u], sizeimage:%u [%u, %u]", ctx_id,
> > +			i, bpl, min_bpl, max_bpl, si, min_si, max_si);
> > +	}
> > +
> > +	return fmt;
> > +}
> > +
> > +static int mdp_clamp_start(s32 *x, int min, int max, unsigned int align,
> > +			   u32 flags)
> > +{
> > +	if (flags & V4L2_SEL_FLAG_GE)
> > +		max = *x;
> > +	if (flags & V4L2_SEL_FLAG_LE)
> > +		min = *x;
> > +	return mdp_clamp_align(x, min, max, align);
> > +}
> > +
> > +static int mdp_clamp_end(s32 *x, int min, int max, unsigned int align,
> > +			 u32 flags)
> > +{
> > +	if (flags & V4L2_SEL_FLAG_GE)
> > +		min = *x;
> > +	if (flags & V4L2_SEL_FLAG_LE)
> > +		max = *x;
> > +	return mdp_clamp_align(x, min, max, align);
> > +}
> > +
> > +int mdp_try_crop(struct mdp_m2m_ctx *ctx, struct v4l2_rect *r,
> > +		 const struct v4l2_selection *s, struct mdp_frame *frame)
> > +{
> > +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> > +	s32 left, top, right, bottom;
> > +	u32 framew, frameh, walign, halign;
> > +	int ret;
> > +
> > +	dev_dbg(dev, "%d target:%d, set:(%d,%d) %ux%u", ctx->id,
> > +		s->target, s->r.left, s->r.top, s->r.width, s->r.height);
> > +
> > +	left = s->r.left;
> > +	top = s->r.top;
> > +	right = s->r.left + s->r.width;
> > +	bottom = s->r.top + s->r.height;
> > +	framew = frame->format.fmt.pix_mp.width;
> > +	frameh = frame->format.fmt.pix_mp.height;
> > +
> > +	if (mdp_target_is_crop(s->target)) {
> > +		walign = 1;
> > +		halign = 1;
> > +	} else {
> > +		walign = frame->mdp_fmt->walign;
> > +		halign = frame->mdp_fmt->halign;
> > +	}
> > +
> > +	dev_dbg(dev, "%d align:%u,%u, bound:%ux%u", ctx->id,
> > +		walign, halign, framew, frameh);
> > +
> > +	ret = mdp_clamp_start(&left, 0, right, walign, s->flags);
> > +	if (ret)
> > +		return ret;
> > +	ret = mdp_clamp_start(&top, 0, bottom, halign, s->flags);
> > +	if (ret)
> > +		return ret;
> > +	ret = mdp_clamp_end(&right, left, framew, walign, s->flags);
> > +	if (ret)
> > +		return ret;
> > +	ret = mdp_clamp_end(&bottom, top, frameh, halign, s->flags);
> > +	if (ret)
> > +		return ret;
> > +
> > +	r->left = left;
> > +	r->top = top;
> > +	r->width = right - left;
> > +	r->height = bottom - top;
> > +
> > +	dev_dbg(dev, "%d crop:(%d,%d) %ux%u", ctx->id,
> > +		r->left, r->top, r->width, r->height);
> > +	return 0;
> > +}
> > +
> > +int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
> > +			    const struct v4l2_rect *compose, s32 rotation,
> > +	const struct mdp_limit *limit)
> > +{
> > +	u32 crop_w, crop_h, comp_w, comp_h;
> > +
> > +	crop_w = crop->width;
> > +	crop_h = crop->height;
> > +	if (90 == rotation || 270 == rotation) {
> > +		comp_w = compose->height;
> > +		comp_h = compose->width;
> > +	} else {
> > +		comp_w = compose->width;
> > +		comp_h = compose->height;
> > +	}
> > +
> > +	if ((crop_w / comp_w) > limit->h_scale_down_max ||
> > +	    (crop_h / comp_h) > limit->v_scale_down_max ||
> > +	    (comp_w / crop_w) > limit->h_scale_up_max ||
> > +	    (comp_h / crop_h) > limit->v_scale_up_max)
> > +		return -ERANGE;
> > +	return 0;
> > +}
> > +
> > +/* Stride that is accepted by MDP HW */
> > +static u32 mdp_fmt_get_stride(const struct mdp_format *fmt,
> > +			      u32 bytesperline, unsigned int plane)
> > +{
> > +	enum mdp_color c = fmt->mdp_color;
> > +	u32 stride;
> > +
> > +	stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
> > +		/ fmt->row_depth[0];
> > +	if (plane == 0)
> > +		return stride;
> > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> > +			stride = stride / 2;
> > +		return stride;
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* Stride that is accepted by MDP HW of format with contiguous planes */
> > +static u32 mdp_fmt_get_stride_contig(const struct mdp_format *fmt,
> > +				     u32 pix_stride, unsigned int plane)
> > +{
> > +	enum mdp_color c = fmt->mdp_color;
> > +	u32 stride = pix_stride;
> > +
> > +	if (plane == 0)
> > +		return stride;
> > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > +		stride = stride >> MDP_COLOR_GET_H_SUBSAMPLE(c);
> > +		if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> > +			stride = stride * 2;
> > +		return stride;
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* Plane size that is accepted by MDP HW */
> > +static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
> > +				  u32 stride, u32 height, unsigned int plane)
> > +{
> > +	enum mdp_color c = fmt->mdp_color;
> > +	u32 bytesperline;
> > +
> > +	bytesperline = (stride * fmt->row_depth[0])
> > +		/ MDP_COLOR_BITS_PER_PIXEL(c);
> > +	if (plane == 0)
> > +		return bytesperline * height;
> > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > +		height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> > +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> > +			bytesperline = bytesperline * 2;
> > +		return bytesperline * height;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void mdp_prepare_buffer(struct img_image_buffer *b,
> > +			       struct mdp_frame *frame, struct vb2_buffer *vb)
> > +{
> > +	struct v4l2_pix_format_mplane *pix_mp = &frame->format.fmt.pix_mp;
> > +	unsigned int i;
> > +
> > +	b->format.colorformat = frame->mdp_fmt->mdp_color;
> > +	b->format.ycbcr_prof = frame->ycbcr_prof;
> > +	for (i = 0; i < pix_mp->num_planes; ++i) {
> > +		u32 stride = mdp_fmt_get_stride(frame->mdp_fmt,
> > +			pix_mp->plane_fmt[i].bytesperline, i);
> > +
> > +		b->format.plane_fmt[i].stride = stride;
> > +		/*
> > +		 * TODO : The way to pass an offset within a DMA-buf
> > +		 * is not defined in V4L2 specification, so we abuse
> > +		 * data_offset for now. Fix it when we have the right interface,
> > +		 * including any necessary validation and potential alignment
> > +		 * issues.
> > +		 */
> > +		b->format.plane_fmt[i].size =
> > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > +					       pix_mp->height, i) -
> > +					       vb->planes[i].data_offset;
> > +		b->iova[i] = vb2_dma_contig_plane_dma_addr(vb, i) +
> > +			     vb->planes[i].data_offset;
> 
> Why do you need data_offset? What is the use case? Obviously I can't
> merge a driver that abuses an API.
> 
> > +	}
> > +	for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
> > +		u32 stride = mdp_fmt_get_stride_contig(frame->mdp_fmt,
> > +			b->format.plane_fmt[0].stride, i);
> > +
> > +		b->format.plane_fmt[i].stride = stride;
> > +		b->format.plane_fmt[i].size =
> > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > +					       pix_mp->height, i);
> > +		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
> > +	}
> > +	b->usage = frame->usage;
> > +}
> > +
> > +void mdp_set_src_config(struct img_input *in,
> > +			struct mdp_frame *frame, struct vb2_buffer *vb)
> > +{
> > +	in->buffer.format.width = frame->format.fmt.pix_mp.width;
> > +	in->buffer.format.height = frame->format.fmt.pix_mp.height;
> > +	mdp_prepare_buffer(&in->buffer, frame, vb);
> > +}
> > +
> > +static u32 mdp_to_fixed(u32 *r, struct v4l2_fract *f)
> > +{
> > +	u32 q;
> > +
> > +	if (f->denominator == 0) {
> > +		*r = 0;
> > +		return 0;
> > +	}
> > +
> > +	q = f->numerator / f->denominator;
> > +	*r = div_u64(((u64)f->numerator - q * f->denominator) <<
> > +		     IMG_SUBPIXEL_SHIFT, f->denominator);
> > +	return q;
> > +}
> > +
> > +static void mdp_set_src_crop(struct img_crop *c, struct mdp_crop *crop)
> > +{
> > +	c->left = crop->c.left
> > +		+ mdp_to_fixed(&c->left_subpix, &crop->left_subpix);
> > +	c->top = crop->c.top
> > +		+ mdp_to_fixed(&c->top_subpix, &crop->top_subpix);
> > +	c->width = crop->c.width
> > +		+ mdp_to_fixed(&c->width_subpix, &crop->width_subpix);
> > +	c->height = crop->c.height
> > +		+ mdp_to_fixed(&c->height_subpix, &crop->height_subpix);
> > +}
> > +
> > +static void mdp_set_orientation(struct img_output *out,
> > +				s32 rotation, bool hflip, bool vflip)
> > +{
> > +	u8 flip = 0;
> > +
> > +	if (hflip)
> > +		flip ^= 1;
> > +	if (vflip) {
> > +		/*
> > +		 * A vertical flip is equivalent to
> > +		 * a 180-degree rotation with a horizontal flip
> > +		 */
> > +		rotation += 180;
> > +		flip ^= 1;
> > +	}
> > +
> > +	out->rotation = rotation % 360;
> > +	if (flip != 0)
> > +		out->flags |= IMG_CTRL_FLAG_HFLIP;
> > +	else
> > +		out->flags &= ~IMG_CTRL_FLAG_HFLIP;
> > +}
> > +
> > +void mdp_set_dst_config(struct img_output *out,
> > +			struct mdp_frame *frame, struct vb2_buffer *vb)
> > +{
> > +	out->buffer.format.width = frame->compose.width;
> > +	out->buffer.format.height = frame->compose.height;
> > +	mdp_prepare_buffer(&out->buffer, frame, vb);
> > +	mdp_set_src_crop(&out->crop, &frame->crop);
> > +	mdp_set_orientation(out, frame->rotation, frame->hflip, frame->vflip);
> > +}
> > +
> > +int mdp_frameparam_init(struct mdp_frameparam *param)
> > +{
> > +	struct mdp_frame *frame;
> > +
> > +	if (!param)
> > +		return -EINVAL;
> > +
> > +	INIT_LIST_HEAD(&param->list);
> > +	param->limit = &mdp_def_limit;
> > +	param->type = MDP_STREAM_TYPE_BITBLT;
> > +
> > +	frame = &param->output;
> > +	frame->format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > +	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
> > +	frame->ycbcr_prof =
> > +		mdp_map_ycbcr_prof_mplane(&frame->format,
> > +					  frame->mdp_fmt->mdp_color);
> > +	frame->usage = MDP_BUFFER_USAGE_HW_READ;
> > +
> > +	param->num_captures = 1;
> > +	frame = &param->captures[0];
> > +	frame->format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > +	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
> > +	frame->ycbcr_prof =
> > +		mdp_map_ycbcr_prof_mplane(&frame->format,
> > +					  frame->mdp_fmt->mdp_color);
> > +	frame->usage = MDP_BUFFER_USAGE_MDP;
> > +	frame->crop.c.width = param->output.format.fmt.pix_mp.width;
> > +	frame->crop.c.height = param->output.format.fmt.pix_mp.height;
> > +	frame->compose.width = frame->format.fmt.pix_mp.width;
> > +	frame->compose.height = frame->format.fmt.pix_mp.height;
> > +
> > +	return 0;
> > +}

-- 
Regards,

Laurent Pinchart

