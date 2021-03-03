Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3EAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 01:45:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DDE565076
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 01:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DDE565076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rvilnRSZZZsWImAXS8GR6yQfv64WtA2CQE3t/DJG52g=; b=hoXr4ml1+k++xgKnVkJow5q/V
	MsP1ATmcUdBwRgD0g+3rnyzpiv1rDldbHaPKW62qghpnfY5BZr58SXvKdDakGrhlXN/dJNh43pC6+
	GXU05VHoi6/k9vFe1tSm7VHyfCNJA8395MS2AchrrrF9szgUhL7AxrcKuiNym3K9NjN9jBFZWTUMR
	z0CqyUUWxuZ8E3PXI0T6GLbLLiWtOZtZP616wL+YNvpZ2AWYmgODb6VBIFWbVQfNyjC7NCvr+KU3l
	quxcGXzCqcaNwrKIG976YtWPth2AeFCw5dSlmj9pW5eBZ7KCpxsrnBOvKedjF0yM1Rz35ScHfYz5a
	+dgwclZLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHd2e-007NHL-9A; Thu, 04 Mar 2021 01:44:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHZ4d-006bXt-20
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 21:30:51 +0000
Received: by mail-ej1-x632.google.com with SMTP id mj10so25050909ejb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Mar 2021 13:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gz6/fn0MA6ieuQdfGlLO0r7rhZF3LTjYPpwbfwdmdwQ=;
 b=0/BAuiqJixT2tW+jYrcnO5pt2xRPDpV9QCp+A1R2IzaJgxIu4BFJkrie+yVeZzjtTI
 cZfvxJ7SUK0pb1hc9Vl7AaAq8KLl/+6Y0pWIJTJ1kv0rqlC86g8Y/qZtp6qlMALvsC2J
 0Z/SMpAloe64Lghu8e/ZQKg6YwOktzoZqS49wyRMitMyZ8NSgBs+dROcnsER3jygypR6
 4rILBQNOLN3kfMMMa8WI/e9RUsjbht0okpVSYKf0tBfK/PnPDnqgaBcnuQEqmjL9NAIv
 WaxXSGfY41AMctmM7S3iIZMLlfr/wwYmhECOH86QI1MGMtsSRhSya/jJ+RIhTpGr9fG5
 iXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gz6/fn0MA6ieuQdfGlLO0r7rhZF3LTjYPpwbfwdmdwQ=;
 b=SkKVL5NkZ1fKyJZUaQv2T3mbisief2CqCeBkhZwG0yssE8ODK77g895Bl55BgE0qKf
 xJc7QJG+b64vvgyXqLMI0DTskZzsg/2yVLsvE+e0IwRTKfs65yTOjTw/5Lq3RL0M4Y/d
 prYRLkBXdpija0WtnB5Fov56Ug4V4w9R/8bxQrvmPmQzppCIQu3vnFUIsadc0DLAMWHS
 +5QgtoFa8jctjqQ61avu7g+KYEo3ItToKb6QaPlG19RNVpVWAHJ17P1DlFjcjR/kf6Tn
 29IcOL/gTtNW5xA0i+1tYQtsm+lRo3q/o0Dy1RJagAaWZ4DG0aR76KyzCrL7S2cZlZkR
 vFeg==
X-Gm-Message-State: AOAM5325YlMqSF8avJWo8fd6iA1R6/zS9JoT6HbNFFRyFx+Ppbt2kM4e
 zJvOLDEhg6wFV16z94iCBEudPnnzW7Y6CSqEpl53lg==
X-Google-Smtp-Source: ABdhPJx/Ww50xcbxMCXAhqIJNlvSZj5dJOIGwmT9jDly92NvUIWsVDsivQ7xXU33zDPntqx83j2iB/DewF93ye2XQ84=
X-Received: by 2002:a17:906:a3d1:: with SMTP id
 ca17mr765839ejb.92.1614807024886; 
 Wed, 03 Mar 2021 13:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20210226100148.1663389-1-acourbot@chromium.org>
 <20210226100148.1663389-6-acourbot@chromium.org>
In-Reply-To: <20210226100148.1663389-6-acourbot@chromium.org>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 3 Mar 2021 18:30:12 -0300
Message-ID: <CAAEAJfDyHYGf+J6WDHchVATOvj5AJpO8dkAStiNGNobJ9Uz8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] media: mtk-vcodec: vdec: support stateless API
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 linux-media <linux-media@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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

Hello Alex,

Thanks for the patch.

On Fri, 26 Feb 2021 at 07:06, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Support the stateless codec API that will be used by MT8183.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/Makefile    |   1 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 427 ++++++++++++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
>  5 files changed, 503 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>
[..]

> +
> +static const struct mtk_stateless_control mtk_stateless_controls[] = {
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_SPS,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,

This "needed_in_request" is not really required, as controls
are not volatile, and their value is stored per-context (per-fd).

It's perfectly valid for an application to pass the SPS control
at the beginning of the sequence, and then omit it
in further requests.

> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_PPS,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +                       .def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +                       .max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +                       .menu_skip_mask =
> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_DECODE_MODE,
> +                       .min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +                       .def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +                       .max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +       },
> +};

Applications also need to know which V4L2_CID_STATELESS_H264_START_CODE
the driver supports. From a next patch, this case seems to be
V4L2_STATELESS_H264_START_CODE_ANNEX_B.

> +#define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
> +
> +static const struct mtk_video_fmt mtk_video_formats[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
> +               .type = MTK_FMT_DEC,
> +               .num_planes = 1,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_MM21,
> +               .type = MTK_FMT_FRAME,
> +               .num_planes = 2,
> +       },
> +};
> +#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> +#define DEFAULT_OUT_FMT_IDX    0
> +#define DEFAULT_CAP_FMT_IDX    1
> +
> +static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
> +               .stepwise = {
> +                       MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
> +                       MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16,
> +               },
> +       },
> +};
> +
> +#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> +
> +static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
> +                                              struct vdec_fb *fb)
> +{
> +       struct mtk_video_dec_buf *vdec_frame_buf =
> +               container_of(fb, struct mtk_video_dec_buf, frame_buffer);
> +       struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
> +       unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +
> +       vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
> +       if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> +               unsigned int cap_c_size =
> +                       ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +
> +               vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
> +       }
> +}
> +
> +static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
> +                                          struct vb2_v4l2_buffer *vb2_v4l2)
> +{
> +       struct mtk_video_dec_buf *framebuf =
> +               container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
> +       struct vdec_fb *pfb = &framebuf->frame_buffer;
> +       struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
> +
> +       pfb = &framebuf->frame_buffer;
> +       pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);

Are you sure you need a CPU mapping? It seems strange.
I'll comment some more on the next patch(es).

> +       pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +       pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +
> +       if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> +               pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
> +               pfb->base_c.dma_addr =
> +                       vb2_dma_contig_plane_dma_addr(dst_buf, 1);
> +               pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +       }
> +       mtk_v4l2_debug(1,
> +               "id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx frame_count = %d",
> +               dst_buf->index, pfb,
> +               pfb->base_y.va, &pfb->base_y.dma_addr,
> +               &pfb->base_c.dma_addr, pfb->base_y.size,
> +               ctx->decoded_frame_cnt);
> +
> +       return pfb;
> +}
> +
> +static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
> +{
> +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +       v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +}
> +
> +static int fops_media_request_validate(struct media_request *mreq)
> +{
> +       const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
> +       struct mtk_vcodec_ctx *ctx = NULL;
> +       struct media_request_object *req_obj;
> +       struct v4l2_ctrl_handler *parent_hdl, *hdl;
> +       struct v4l2_ctrl *ctrl;
> +       unsigned int i;
> +
> +       switch (buffer_cnt) {
> +       case 1:
> +               /* We expect exactly one buffer with the request */
> +               break;
> +       case 0:
> +               mtk_v4l2_err("No buffer provided with the request");
> +               return -ENOENT;
> +       default:
> +               mtk_v4l2_err("Too many buffers (%d) provided with the request",
> +                            buffer_cnt);
> +               return -EINVAL;
> +       }
> +
> +       list_for_each_entry(req_obj, &mreq->objects, list) {
> +               struct vb2_buffer *vb;
> +
> +               if (vb2_request_object_is_buffer(req_obj)) {
> +                       vb = container_of(req_obj, struct vb2_buffer, req_obj);
> +                       ctx = vb2_get_drv_priv(vb->vb2_queue);
> +                       break;
> +               }
> +       }
> +
> +       if (!ctx) {
> +               mtk_v4l2_err("Cannot find buffer for request");
> +               return -ENOENT;
> +       }
> +
> +       parent_hdl = &ctx->ctrl_hdl;
> +
> +       hdl = v4l2_ctrl_request_hdl_find(mreq, parent_hdl);
> +       if (!hdl) {
> +               mtk_v4l2_err("Cannot find control handler for request\n");
> +               return -ENOENT;
> +       }
> +
> +       for (i = 0; i < NUM_CTRLS; i++) {
> +               if (mtk_stateless_controls[i].codec_type != ctx->current_codec)
> +                       continue;
> +               if (!mtk_stateless_controls[i].needed_in_request)
> +                       continue;
> +
> +               ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
> +                                         mtk_stateless_controls[i].cfg.id);
> +               if (!ctrl) {
> +                       mtk_v4l2_err("Missing required codec control\n");
> +                       return -ENOENT;
> +               }
> +       }
> +
> +       v4l2_ctrl_request_hdl_put(hdl);
> +
> +       return vb2_request_validate(mreq);
> +}
> +
> +static void mtk_vdec_worker(struct work_struct *work)
> +{
> +       struct mtk_vcodec_ctx *ctx =
> +               container_of(work, struct mtk_vcodec_ctx, decode_work);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
> +       struct vb2_buffer *vb2_src;
> +       struct mtk_vcodec_mem *bs_src;
> +       struct mtk_video_dec_buf *dec_buf_src;
> +       struct media_request *src_buf_req;
> +       struct vdec_fb *dst_buf;
> +       bool res_chg = false;
> +       int ret;
> +
> +       vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_src == NULL) {
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               mtk_v4l2_debug(1, "[%d] no available source buffer", ctx->id);
> +               return;
> +       }
> +
> +       vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_dst == NULL) {
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
> +               return;
> +       }
> +
> +       vb2_src = &vb2_v4l2_src->vb2_buf;
> +       dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
> +                                  m2m_buf.vb);
> +       bs_src = &dec_buf_src->bs_buffer;
> +
> +       mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p buf_info = %p",
> +                       ctx->id, src_buf->vb2_queue->type,
> +                       src_buf->index, src_buf, src_buf_info);
> +
> +       bs_src->va = vb2_plane_vaddr(vb2_src, 0);
> +       bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
> +       bs_src->size = (size_t)vb2_src->planes[0].bytesused;
> +       if (!bs_src->va) {
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               mtk_v4l2_err("[%d] id=%d source buffer is NULL", ctx->id,
> +                            vb2_src->index);
> +               return;
> +       }
> +
> +       mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
> +                       ctx->id, buf->va, &buf->dma_addr, buf->size, src_buf);
> +       /* Apply request controls. */
> +       src_buf_req = vb2_src->req_obj.req;
> +       if (src_buf_req)
> +               v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> +       else
> +               mtk_v4l2_err("vb2 buffer media request is NULL");
> +
> +       dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
> +       v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
> +       ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
> +       if (ret) {
> +               mtk_v4l2_err(
> +                       " <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
> +                       ctx->id, vb2_src->index, bs_src->size,
> +                       vb2_src->timestamp, ret, res_chg);
> +               if (ret == -EIO) {
> +                       mutex_lock(&ctx->lock);
> +                       dec_buf_src->error = true;
> +                       mutex_unlock(&ctx->lock);
> +               }
> +       }
> +
> +       mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
> +
> +       v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> +               ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> +
> +       v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +}
> +
> +static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
> +
> +       mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
> +                       ctx->id, vb->vb2_queue->type,
> +                       vb->index, vb);
> +
> +       mutex_lock(&ctx->lock);
> +       v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
> +       mutex_unlock(&ctx->lock);
> +       if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return;
> +
> +       mtk_v4l2_debug(3, "(%d) id=%d, bs=%p",
> +               vb->vb2_queue->type, vb->index, src_buf);
> +
> +       /* If an OUTPUT buffer, we may need to update the state */
> +       if (ctx->state == MTK_STATE_INIT) {
> +               ctx->state = MTK_STATE_HEADER;
> +               mtk_v4l2_debug(1, "Init driver from init to header.");

This state thing seems just something to make the rest
of the stateful-based driver happy, right?

Makes me wonder a bit if just splitting the stateless part to its
own driver, wouldn't make your maintenance easier.

What's the motivation for sharing the driver?

> +       } else {
> +               mtk_v4l2_debug(3, "[%d] already init driver %d",
> +                               ctx->id, ctx->state);
> +       }
> +}
> +
> +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> +{
> +       bool res_chg;
> +
> +       return vdec_if_decode(ctx, NULL, NULL, &res_chg);
> +}
> +
> +static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
> +       .g_volatile_ctrl = mtk_vdec_g_v_ctrl,
> +};
> +
> +static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct v4l2_ctrl *ctrl;
> +       unsigned int i;
> +
> +       v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS);
> +       if (ctx->ctrl_hdl.error) {
> +               mtk_v4l2_err("v4l2_ctrl_handler_init failed\n");
> +               return ctx->ctrl_hdl.error;
> +       }
> +
> +       ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl,
> +                               &mtk_vcodec_dec_ctrl_ops,
> +                               V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> +                               0, 32, 1, 1);
> +       ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;

Hm, this volatile control for MIN_BUFFERS_FOR_CAPTURE seems
to return the DPB size. However, isn't this something userspace already knows?

> +
> +       for (i = 0; i < NUM_CTRLS; i++) {
> +               struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
> +
> +               v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
> +               if (ctx->ctrl_hdl.error) {
> +                       mtk_v4l2_err("Adding control %d failed %d",
> +                                       i, ctx->ctrl_hdl.error);
> +                       return ctx->ctrl_hdl.error;
> +               }
> +       }
> +
> +       v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +
> +       return 0;
> +}
> +
> +const struct media_device_ops mtk_vcodec_media_ops = {
> +       .req_validate   = fops_media_request_validate,
> +       .req_queue      = v4l2_m2m_request_queue,
> +};
> +
> +static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vb2_queue *src_vq;
> +
> +       src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> +                                V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +       /* Support request api for output plane */
> +       src_vq->supports_requests = true;
> +       src_vq->requires_requests = true;
> +}
> +
> +static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
> +{

I have to admit I do not remember exactly the reason,
but this should set the buffer field to V4L2_FIELD_NONE.

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
