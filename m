Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA09CE79A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 23:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LJF4TQQlvwx4ojH6z1jq1dM6I4h5d3t3AXqcpM3/xU=; b=pfaZFpQ/ZnqJ/Vo9qyp5VPo2+D
	VWvLi41X+auVTOqAmjJaeTx+w1Uha+p7Y4mW1kkyr1YjZU/HKXrwgm3i3MaAZhirCiR2N+JP2y6oG
	18tIswcn5kEChtzKBnLh6YT/Dk0FV9/aRIzdcNqmJapjc4nps5iwkzL4oaukgNN5rlIvqw8Qth8ym
	qUd+oVMHxSRoZ9lTTU1LwLFe7fBhoF23dEJieO5q4WE10QXs1TdF7fCnVcF6Jn/AfAZDJCD0R9uzu
	ohBn1fhIaCfwYuUvhxeb7spUZ2wHHz7RsjGE8BKXqJSaj39bOhYouJ08xGaJUfrg4CQlIV6+gXam3
	1UD0/RlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qikRA-001Tgo-0R;
	Tue, 19 Sep 2023 23:47:24 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qikR6-001Tg6-31
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 23:47:22 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-34fc9b461b6so32235ab.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 16:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695167239; x=1695772039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LJF4TQQlvwx4ojH6z1jq1dM6I4h5d3t3AXqcpM3/xU=;
        b=MhJHx+SdHyPcuP3ZdKVc8h2SEZN/ykpyPMrmOaLftNd7GAYDFXUXfgAREO5FzKNeUB
         gTLsHIzSpt1QRsxRPetWWZe02mfCBsU7SfTPfrzI08d+pax2iG1r2n2Gj7otUvLYyhdv
         g3GMF1zIHm+FMBnjkyO2Ii1wWRzuNrCCI3410h9mVAKelCAsQOCXPrDud8W9XIQG4JAo
         qcOLREVXUNqo75O7c9sHeyxiq6QZ+9bD0X7mK0Gk+d2A5kQ+czGtvVRNFR4VmKF8KF2y
         shaT+UPdtVh/sCZ7Q1XBw6bYvlPGA4MWwY/dXNXVGLfHXKC9OiqVZchNWSa8TAuCi2Dl
         Zztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695167239; x=1695772039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LJF4TQQlvwx4ojH6z1jq1dM6I4h5d3t3AXqcpM3/xU=;
        b=HYCFH9NA9LT3ndtCanBl83UQJhWuJd/9nA7cGSPJHE5GAgZsB19TSTJDGBUlzAiMhL
         SKfpBP3JmHfZXphYNhZajQegwijl9M72O/d8Q5zH4oTnRHjvRBKhSbFfTCog3gvxp0Xf
         nsbdIOKHm1NMss0E5Coe/mmMaeI5NzdP0mJPSSH63k3SxowTjiUnhN2YVSBTYpA8n5Ok
         NBSb3uOciLDqSiBl+g2VkU7QWT8DT1wT3x5qJLsbzXW036Hh6LbMqgcn+IJe89wDIKOw
         A6F7XdugH4MePcZBV+S5VV0uw6QN+j+uaqzmNA/DxZfqht8OL22Jm0S7rlBYOOKjaJQZ
         w/cQ==
X-Gm-Message-State: AOJu0YyCxaZugpC3OWw7k8GGbbooUqJA6Y5iWTpzPcpAKBNLria4LNvu
	IGPKLq/v4zBTOhKKT9TCBD/DhwK87ZvADbnKFKL5
X-Google-Smtp-Source: AGHT+IGd+oxQSxw85Bd0zjhKfrnCmqrGPjS7bL32Al57eH/zbnuOVcqZXrWXgoYT+h6WDLt9al1FrU7dkwKZqspXE6Q=
X-Received: by 2002:a05:6e02:1c4b:b0:349:2d91:e1a2 with SMTP id
 d11-20020a056e021c4b00b003492d91e1a2mr60657ilg.5.1695167238808; Tue, 19 Sep
 2023 16:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
 <20230911125936.10648-12-yunfei.dong@mediatek.com> <d02953725e7ae17e75bff235acfd30327d0fe9ac.camel@collabora.com>
 <CA+ddPcOFksu6JzXZf0QOFeRDAyX=m0k+t8zwg2DbVmAkweobyg@mail.gmail.com> <1d19be1f21d579b529231882d761554d758db5b4.camel@collabora.com>
In-Reply-To: <1d19be1f21d579b529231882d761554d758db5b4.camel@collabora.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 19 Sep 2023 16:47:03 -0700
Message-ID: <CA+ddPcNSa_nW8Gtjck6bdWKHwN6OoASwwEYadR_9Z7eg=Su2rA@mail.gmail.com>
Subject: Re: [PATCH 11/14] media: medkatek: vcodec: covert secure fd to secure handle
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_164720_998140_AB67229B 
X-CRM114-Status: GOOD (  36.21  )
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

I do agree having a cleaner mechanism for this is better. So ideally
this control is dropped from v4l2 and it becomes another ioctl in
dma-heap instead so there's a uAPI for it. Then for the driver usages
of sg_dma_address to get secure handles, those could be converted into
dma-buf heap kernel APIs so they're not trying to reuse the dma_addr.

On Tue, Sep 19, 2023 at 4:03=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mardi 19 septembre 2023 =C3=A0 15:38 -0700, Jeffrey Kardatzke a =C3=A9=
crit :
> > On Tue, Sep 19, 2023 at 12:43=E2=80=AFPM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Le lundi 11 septembre 2023 =C3=A0 20:59 +0800, Yunfei Dong a =C3=A9cr=
it :
> > > > User driver will fill or parse data in optee-os with secure handle,
> > > > need to covert secure fd to secure handle in kernel.
> > > >
> > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > ---
> > > >  .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  1 +
> > > >  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 54 +++++++++++++++=
+++-
> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 ++
> > > >  include/uapi/linux/v4l2-controls.h            |  4 ++
> > > >  4 files changed, 62 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vco=
dec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_drv.c
> > > > index 0a89ce452ac3..64e006820f43 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_drv.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_drv.c
> > > > @@ -571,3 +571,4 @@ module_platform_driver(mtk_vcodec_dec_driver);
> > > >
> > > >  MODULE_LICENSE("GPL v2");
> > > >  MODULE_DESCRIPTION("Mediatek video codec V4L2 decoder driver");
> > > > +MODULE_IMPORT_NS(DMA_BUF);
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vco=
dec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vc=
odec_dec_stateless.c
> > > > index 2ea517883a86..d2b09ce9f1cf 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_stateless.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_stateless.c
> > > > @@ -426,6 +426,46 @@ static int mtk_vcodec_get_pic_info(struct mtk_=
vcodec_dec_ctx *ctx)
> > > >       return ret;
> > > >  }
> > > >
> > > > +static int mtk_dma_contig_get_secure_handle(struct mtk_vcodec_dec_=
ctx *ctx, int fd)
> > > > +{
> > > > +     int secure_handle =3D 0;
> > > > +     struct dma_buf *buf;
> > > > +     struct dma_buf_attachment *dba;
> > > > +     struct sg_table *sgt;
> > > > +     struct device *dev =3D &ctx->dev->plat_dev->dev;
> > > > +
> > > > +     buf =3D dma_buf_get(fd);
> > > > +     if (IS_ERR(buf)) {
> > > > +             mtk_v4l2_vdec_err(ctx, "dma_buf_get fail fd:%d", fd);
> > > > +             return 0;
> > > > +     }
> > > > +
> > > > +     dba =3D dma_buf_attach(buf, dev);
> > > > +     if (IS_ERR(dba)) {
> > > > +             mtk_v4l2_vdec_err(ctx, "dma_buf_attach fail fd:%d", f=
d);
> > > > +             goto err_attach;
> > > > +     }
> > > > +
> > > > +     sgt =3D dma_buf_map_attachment(dba, DMA_BIDIRECTIONAL);
> > > > +     if (IS_ERR(sgt)) {
> > > > +             mtk_v4l2_vdec_err(ctx, "dma_buf_map_attachment fail f=
d:%d", fd);
> > > > +             goto err_map;
> > > > +     }
> > > > +     secure_handle =3D sg_dma_address(sgt->sgl);
> > >
> > > Does it mean if your secure dmabuf is passed to a driver that didn't =
know it was
> > > secure it will pick the handle as a memory address and program the HW=
 with it ?
> > > That seems unsafe, the handle should be stored in a dedicated place a=
nd mapping
> > > should either fail, or provide a dummy buffer.
> >
> > Since the secure dmabufs don't support any mmap/cpu access to them and
> > return -EPERM in those cases; wouldn't that prevent misuse of them in
> > other places? (so the mmap operation and CPU access will fail, but
> > getting the SG list from the dmabuf succeeds)
>
> My impression is that if userspace can pass this FD to a driver without t=
elling
> the driver it is secure memory, the driver may potentially crash trying t=
o use
> the handle as an memory address.
>
> In my opinion, sg_dma_address() should return addresses, like its name st=
ate. If
> you want to get something else, you should find another way to obtain it.
>
> Nicolas
>
> >
> > >
> > > > +
> > > > +     dma_buf_unmap_attachment(dba, sgt, DMA_BIDIRECTIONAL);
> > > > +     dma_buf_detach(buf, dba);
> > > > +     dma_buf_put(buf);
> > > > +
> > > > +     return secure_handle;
> > > > +err_map:
> > > > +     dma_buf_detach(buf, dba);
> > > > +err_attach:
> > > > +     dma_buf_put(buf);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ctrl)
> > > >  {
> > > >       struct mtk_vcodec_dec_ctx *ctx =3D ctrl_to_dec_ctx(ctrl);
> > > > @@ -436,7 +476,7 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ct=
rl)
> > > >       struct v4l2_ctrl *hdr_ctrl;
> > > >       const struct mtk_vcodec_dec_pdata *dec_pdata =3D ctx->dev->vd=
ec_pdata;
> > > >       const struct mtk_video_fmt *fmt;
> > > > -     int i =3D 0, ret =3D 0;
> > > > +     int i =3D 0, ret =3D 0, sec_fd;
> > > >
> > > >       hdr_ctrl =3D ctrl;
> > > >       if (!hdr_ctrl || !hdr_ctrl->p_new.p)
> > > > @@ -489,6 +529,12 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *c=
trl)
> > > >                       return -EINVAL;
> > > >               }
> > > >               break;
> > > > +     case V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE:
> > > > +             sec_fd =3D ctrl->val;
> > > > +
> > > > +             ctrl->val =3D mtk_dma_contig_get_secure_handle(ctx, c=
trl->val);
> > > > +             mtk_v4l2_vdec_dbg(3, ctx, "get secure handle: %d =3D>=
 0x%x", sec_fd, ctrl->val);
> > > > +             break;
> > > >       default:
> > > >               mtk_v4l2_vdec_dbg(3, ctx, "Not supported to set ctrl =
id: 0x%x\n", hdr_ctrl->id);
> > > >               return ret;
> > > > @@ -525,8 +571,9 @@ static const struct v4l2_ctrl_ops mtk_vcodec_de=
c_ctrl_ops =3D {
> > > >  static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *c=
tx)
> > > >  {
> > > >       unsigned int i;
> > > > +     struct v4l2_ctrl *ctrl;
> > > >
> > > > -     v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS);
> > > > +     v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS + 1);
> > > >       if (ctx->ctrl_hdl.error) {
> > > >               mtk_v4l2_vdec_err(ctx, "v4l2_ctrl_handler_init failed=
\n");
> > > >               return ctx->ctrl_hdl.error;
> > > > @@ -543,6 +590,9 @@ static int mtk_vcodec_dec_ctrls_setup(struct mt=
k_vcodec_dec_ctx *ctx)
> > > >               }
> > > >       }
> > > >
> > > > +     ctrl =3D v4l2_ctrl_new_std(&ctx->ctrl_hdl, &mtk_vcodec_dec_ct=
rl_ops,
> > > > +                              V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE,=
 0, 65535, 1, 0);
> > > > +
> > > >       v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> > > >
> > > >       return 0;
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/me=
dia/v4l2-core/v4l2-ctrls-defs.c
> > > > index 8696eb1cdd61..d8cf01f76aab 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > @@ -1041,6 +1041,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > >       case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:     retur=
n "HEVC Size of Length Field";
> > > >       case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:        retur=
n "Reference Frames for a P-Frame";
> > > >       case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:         retur=
n "Prepend SPS and PPS to IDR";
> > > > +     case V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE:               retur=
n "MediaTek Decoder get secure handle";
> > > >
> > > >       /* AV1 controls */
> > > >       case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:                   retur=
n "AV1 Profile";
> > > > @@ -1437,6 +1438,10 @@ void v4l2_ctrl_fill(u32 id, const char **nam=
e, enum v4l2_ctrl_type *type,
> > > >       case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:
> > > >               *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
> > > >               break;
> > > > +     case V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE:
> > > > +             *type =3D V4L2_CTRL_TYPE_INTEGER;
> > > > +             *flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY;
> > > > +             break;
> > > >       case V4L2_CID_USER_CLASS:
> > > >       case V4L2_CID_CAMERA_CLASS:
> > > >       case V4L2_CID_CODEC_CLASS:
> > > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linu=
x/v4l2-controls.h
> > > > index c3604a0a3e30..7b3694985366 100644
> > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > @@ -954,6 +954,10 @@ enum v4l2_mpeg_mfc51_video_force_frame_type {
> > > >  #define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC         =
   (V4L2_CID_CODEC_MFC51_BASE+53)
> > > >  #define V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P          =
   (V4L2_CID_CODEC_MFC51_BASE+54)
> > > >
> > > > +/*  MPEG-class control IDs specific to the MediaTek Decoder driver=
 as defined by V4L2 */
> > > > +#define V4L2_CID_MPEG_MTK_BASE                       (V4L2_CTRL_CL=
ASS_CODEC | 0x2000)
> > > > +#define V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE  (V4L2_CID_MPEG_MTK_BA=
SE+8)
> > > > +
> > > >  /*  Camera class control IDs */
> > > >
> > > >  #define V4L2_CID_CAMERA_CLASS_BASE   (V4L2_CTRL_CLASS_CAMERA | 0x9=
00)
> > >
>

