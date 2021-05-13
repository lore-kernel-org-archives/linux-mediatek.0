Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553AEC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 09:22:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B240661438
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 09:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B240661438
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IIUB1Ud9CFrujQCrwz3kWtnIP17paTqlCznofKZ2AlQ=; b=EQwwnwrXQMRLlUwxmoge9gXBL
	SHb3a0YE4JqgNEpUXSLTUfNYH1aHuPsrwfohVamt8K2N6IC51ahtBVXs+R3c6cOsX1V+z9pwzoqlB
	v/Pt+10IlSmqmMoPPtDyZQVS/xL1kAy6Qdye3BIXyePRv8QVK/5fh0zy0DdufbJ3IIk9Pp6Rltz8+
	jLNLovd32CS+Dxcl4//Tb5fBJCnJf1FTYMeRWQ1a22iqiEqfTmyMIGTX8tY/8dm4B9/2TXDU5pq1J
	TH3hbOxs2dJyaUYPNGugfImVtqXmivmkXQjEq7+hVsv55I+3Njc9tgGkhzJJ0KDfLm9iD4scfscNJ
	LMZlDIXcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh7Xd-005Dyi-V6; Thu, 13 May 2021 09:22:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh7Xa-005DyS-Hq
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 09:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=a5TZl7Xv0d/UcN3AO5XRTQ1YNYwxrNRqE46BtHPiztM=; b=yJDVZK7n4xyUDmFnqffUZJJ3ER
 mXE0LZIpF3KzU3f2+fiFC8OcHn5GQyrGzxMc0YSK9U5gaou/yCNFUUpOgEAxbmyQ1MCASxTeX3HqN
 fwrN5smOfHyTqH+139XKi9oKP+YDZr6huY613bZhGFkc+PcI4ecdn7aGZpHy9UnHVmK6pyeSJLvmq
 q+HcM21GIMebe4VrNq8Mpjz4XGFM72ExKQKjts+WAkePyE5D6SsGVSXJ+/mGvmWc8wCY7jLbE4wQu
 nGlkSM/6CoNSxxTt1ieTZFJSCzzpE3LJE79N2i1yjUeGlZMQcFK+DoJuvKNP9hmMec+tKZbhEm447
 0rBX9mBw==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh7XX-00B8H4-7V
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 09:21:56 +0000
Received: by mail-lj1-x22f.google.com with SMTP id f12so20411057ljp.2
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a5TZl7Xv0d/UcN3AO5XRTQ1YNYwxrNRqE46BtHPiztM=;
 b=XkeXKdhBfXmKZtxCw28f6HrDItAc38yiBOaXnF2bXtmEA+UC0Dv9nJpHWX1CqmuNn0
 sNFeTl8+0X/wouKvQPDcIxSa2iDMIaRLI04UnsE6SDl9iDOLQXE7Jo2pQJbNNxmDfetr
 iD8aKYoOw49WyeIvNHFsjzwHT81q8Zw830itc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a5TZl7Xv0d/UcN3AO5XRTQ1YNYwxrNRqE46BtHPiztM=;
 b=nY+a4cO1+fWRa+YOwHXLzXKAFSPOqCgQZoFUvBArrHZ+Xi3aZoC4p8i0fY4WmiVawu
 X4Xx0m3tkg+E7QfmTHH9+u7dSal3bknfUqYX+0NgjuVMBcSDh7jophKz3q8mKnzYbaWC
 tvKJUQcYN8IFFHJ4mha1QqhqM1mJN5DbKVBRbm7JY2uEZZhqob3gROpTazJtuOXNWlZV
 oPPdB7CpeVnHngYtSLyePhZG2efWygqEfFpfuQuMVN1si++QidR/w3Mbz+tkEuydyUUn
 VK/xGjfc81Pru5U1B0J8XTBXqt1CocmxHtS/s/B+xcmCEvDzwQ6D1drAFHnVm6RSUSKB
 g4+Q==
X-Gm-Message-State: AOAM531JkYkcOy55IF6sy4kN2h6OCtpvlEH6bt7Im/oMyE+yEfxdU4Th
 Lmzx3V3Q3xcwLMb0bRiNdFkilAiSJEsfHg==
X-Google-Smtp-Source: ABdhPJyKPKtR1wJhGITT7o8DqGdFrh6vUHW7TDkyQLh+NVLr2En+RT/9fTSZ4pwzXZY6ooIdMbfmwg==
X-Received: by 2002:a2e:9586:: with SMTP id w6mr20885535ljh.131.1620897712832; 
 Thu, 13 May 2021 02:21:52 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id s16sm371609ljd.91.2021.05.13.02.21.52
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 02:21:52 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id e11so19453517ljn.13
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 02:21:52 -0700 (PDT)
X-Received: by 2002:a2e:a58f:: with SMTP id m15mr5926332ljp.212.1620897711807; 
 Thu, 13 May 2021 02:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-6-acourbot@chromium.org>
 <2aa7f058-38b2-2a31-d59b-bba96c39cc29@collabora.com>
In-Reply-To: <2aa7f058-38b2-2a31-d59b-bba96c39cc29@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 13 May 2021 18:21:40 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUOLfZi4YPp=VFdkhrPXKiUwAn-70LrAxG=i-HhmxLnEA@mail.gmail.com>
Message-ID: <CAPBb6MUOLfZi4YPp=VFdkhrPXKiUwAn-70LrAxG=i-HhmxLnEA@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] media: mtk-vcodec: vdec: support stateless API
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_022155_299436_A462B956 
X-CRM114-Status: GOOD (  30.17  )
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

Hi Dafna,

On Thu, Apr 29, 2021 at 9:10 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 27.04.21 13:15, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > Support the stateless codec API that will be used by MT8183.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 +++-
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
> >   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++++++++++++
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
> >   5 files changed, 446 insertions(+), 3 deletions(-)
> >   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> > index 9c3cbb5b800e..4ba93d838ab6 100644
> > --- a/drivers/media/platform/mtk-vcodec/Makefile
> > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > @@ -12,6 +12,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
> >               vdec_vpu_if.o \
> >               mtk_vcodec_dec.o \
> >               mtk_vcodec_dec_stateful.o \
> > +             mtk_vcodec_dec_stateless.o \
> >               mtk_vcodec_dec_pm.o \
> >
> >   mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > index 4ad2662a43b2..01c5333d6cff 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > @@ -46,6 +46,13 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
> >   static int vidioc_try_decoder_cmd(struct file *file, void *priv,
> >                               struct v4l2_decoder_cmd *cmd)
> >   {
> > +     struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +
> > +     /* Use M2M stateless helper if relevant */
> > +     if (ctx->dev->vdec_pdata->uses_stateless_api)
> > +             return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> > +                                                             cmd);
> > +
> >       switch (cmd->cmd) {
> >       case V4L2_DEC_CMD_STOP:
> >       case V4L2_DEC_CMD_START:
> > @@ -72,6 +79,10 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
> >       if (ret)
> >               return ret;
> >
> > +     /* Use M2M stateless helper if relevant */
> > +     if (ctx->dev->vdec_pdata->uses_stateless_api)
> > +             return v4l2_m2m_ioctl_stateless_decoder_cmd(file, priv, cmd);
> > +
> >       mtk_v4l2_debug(1, "decoder cmd=%u", cmd->cmd);
> >       dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> >                               V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > @@ -414,7 +425,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
> >        * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
> >        * if using the stateful API.
> >        */
> > -     if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
> > +     if (!dec_pdata->uses_stateless_api &&
> > +         (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
> >           vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
> >               mtk_v4l2_err("out_q_ctx buffers already requested");
> >               ret = -EBUSY;
> > @@ -457,6 +469,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
> >               ctx->quantization = pix_mp->quantization;
> >               ctx->xfer_func = pix_mp->xfer_func;
> >
> > +             ctx->current_codec = fmt->fourcc;
> >               if (ctx->state == MTK_STATE_FREE) {
> >                       ret = vdec_if_init(ctx, q_data->fmt->fourcc);
> >                       if (ret) {
> > @@ -468,6 +481,49 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
> >               }
> >       }
> >
> > +     /*
> > +      * If using the stateless API, S_FMT should have the effect of setting
> > +      * the CAPTURE queue resolution no matter which queue it was called on.
> > +      */
> > +     if (dec_pdata->uses_stateless_api) {
> > +             ctx->picinfo.pic_w = pix_mp->width;
> > +             ctx->picinfo.pic_h = pix_mp->height;
> > +
> > +             ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
> > +             if (ret) {
> > +                     mtk_v4l2_err("[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
> > +                             ctx->id);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ctx->last_decoded_picinfo = ctx->picinfo;
> > +
> > +             if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1) {
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
> > +                             ctx->picinfo.fb_sz[0] +
> > +                             ctx->picinfo.fb_sz[1];
> > +                     ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
> > +                             ctx->picinfo.buf_w;
> > +             } else {
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
> > +                             ctx->picinfo.fb_sz[0];
> > +                     ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
> > +                             ctx->picinfo.buf_w;
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[1] =
> > +                             ctx->picinfo.fb_sz[1];
> > +                     ctx->q_data[MTK_Q_DATA_DST].bytesperline[1] =
> > +                             ctx->picinfo.buf_w;
> > +             }
> > +
> > +             ctx->q_data[MTK_Q_DATA_DST].coded_width = ctx->picinfo.buf_w;
> > +             ctx->q_data[MTK_Q_DATA_DST].coded_height = ctx->picinfo.buf_h;
> > +             mtk_v4l2_debug(2, "[%d] vdec_if_init() num_plane = %d wxh=%dx%d pic wxh=%dx%d sz[0]=0x%x sz[1]=0x%x",
> > +                     ctx->id, pix_mp->num_planes,
> > +                     ctx->picinfo.buf_w, ctx->picinfo.buf_h,
> > +                     ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
> > +     }
> >       return 0;
> >   }
> >
> > @@ -765,9 +821,15 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> >               while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
> >                       struct mtk_video_dec_buf *buf_info = container_of(
> >                                src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
> > -                     if (!buf_info->lastframe)
> > +                     if (!buf_info->lastframe) {
> > +                             struct media_request *req =
> > +                                     src_buf->vb2_buf.req_obj.req;
> >                               v4l2_m2m_buf_done(src_buf,
> >                                               VB2_BUF_STATE_ERROR);
> > +                             if (req)
> > +                                     v4l2_ctrl_request_complete(req,
> > +                                                             &ctx->ctrl_hdl);
> > +                     }
> >               }
> >               return;
> >       }
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > index 6a18cb3bfe07..6b29d7d9ae15 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > @@ -45,6 +45,7 @@ struct vdec_fb {
> >    * @lastframe:              Intput buffer is last buffer - EOS
> >    * @error:          An unrecoverable error occurs on this buffer.
> >    * @frame_buffer:   Decode status, and buffer information of Capture buffer
> > + * @bs_buffer:       Output buffer info
> >    *
> >    * Note : These status information help us track and debug buffer state
> >    */
> > @@ -55,12 +56,18 @@ struct mtk_video_dec_buf {
> >       bool    queued_in_vb2;
> >       bool    queued_in_v4l2;
> >       bool    lastframe;
> > +
> >       bool    error;
> > -     struct vdec_fb  frame_buffer;
> > +
> > +     union {
> > +             struct vdec_fb  frame_buffer;
> > +             struct mtk_vcodec_mem   bs_buffer;
> > +     };
> >   };
> >
> >   extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
> >   extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> > +extern const struct media_device_ops mtk_vcodec_media_ops;
> >
> >
> >   /*
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > new file mode 100644
> > index 000000000000..75ddf53e2876
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>
> Hi, when compiling with -DDEBUG flag, I got some compilation errors for this file.

Nice catch, I've made sure the whole driver compiles with -DDEBUG.

Thanks,
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
