Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C069D1CDAB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GJx+ZT8sn+Ws/5kdx+3Lxj4vzq/2VNioyfeeo193Rg=; b=0NsU7ObsDKlq27uf0pxsP9Kklf
	gNYp6bV3MTjPxbuI77LKw5c6OPG5Dy5+OLVpP7U9ISkag9RGb4PihxTQtWSWMIR38iwe+dqBSkHBg
	1kw8I1R7i0F/qoHoc9+ctevSIvrz5/uxjdJDOdUn6ETKSOGsPjMg9Bb9L6LM2d483LMsEohcqdN4T
	LJF+86XB2VaRO76xek8LA10QIMlBA9YB8iwKY7dbCRGrYghTeQ3HLY89qD+88/qCIFbl2GCHECr0/
	A5UtBjgvTy30BcVv8hEN9lWByWVIwla2R/jUXwG5PIqU2xdI9Yy/Oiu1h1OnJ+LWMJbi7AgFkzXZA
	8XK/gPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t391Z-00000009vNi-3jyP;
	Tue, 22 Oct 2024 07:09:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3902-00000009vDA-1AI8
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Oct 2024 07:08:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539fbbadf83so6802631e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Oct 2024 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729580892; x=1730185692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GJx+ZT8sn+Ws/5kdx+3Lxj4vzq/2VNioyfeeo193Rg=;
        b=CrLYPzLREWVs3TL/gUbEWg1O9vBCSsXcJOE5Jg2SROp/aBrvs7gvDNHffr/CGnwOff
         pylwIpZdLcc0ZPwrWnMT3d0CngyTrgbqsGsq+i68kEfRMUe+JV47eMsSQMnR+AAU4Gb8
         accc2ni4KeOjBVwEoJ+o3Xi1hWwmf0K/a7egs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580892; x=1730185692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GJx+ZT8sn+Ws/5kdx+3Lxj4vzq/2VNioyfeeo193Rg=;
        b=YrD9VVhZO80YTZqdIQn7GZ0xbmmKeA0fi2VmNLYOYwsWb4QXlFsOvPLDf8Qpnp4ru6
         8DO6aZ8wqQ2mNsyQ5eCLbGRhjWyOg/lol0azZiqZe/ZqBAowowOG/CxW4TiH7pSH6/ch
         7pfDfcju78sB4Hw36+MobJeIhaZivzo+gKjPlZZWrJcV+sJTOwNzAMwtBE32PlZF8/1I
         /aoRl/3n/Gp+V9y/O9Mhh7n59zRgHBmLwA6/FfbLU0N9ksSPH5gYwf+fNftyDAi4lmfX
         lOZZ1SvH1Dg8KoJoUXgc+C4nUPNVwJ1jJP6fwsBDc42kSu9nJKuq56MRo65L84uLx/4h
         fnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQlulU9RM7oevTI9ViOIMz5pm9osoZu5m4ybN4qHo98/uXT95T0Xp6C+6TYw5rhu4nJLSE/aJv1QdFOGJyog==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBGijJLsQBh0OdpP0fm+8pnNuo19yDIsANscqOg7yRAvetkn8I
	NA6wP+DItjCb1gLWC6aweilCJbNI8Yw/S5lcxleHHH4Vp8rCu75tUvsbe8QHCi30j2f+sNTSQRM
	uxGLwtItoBvlvtVIB3XWETV7s7Qtm7pyZ/V51
X-Google-Smtp-Source: AGHT+IFBIR2fOQnzE+888NEXdINjZ+2gmqT4VQ0hlNh2rB/PJBEbJkPTm9TaYAUp+CxfQDKU9wRUD9ZCh+cVl5p1XlE=
X-Received: by 2002:a05:6512:3b25:b0:539:e65a:8a85 with SMTP id
 2adb3069b0e04-53b13a3a529mr773164e87.55.1729580891929; Tue, 22 Oct 2024
 00:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241016034927.8181-1-yunfei.dong@mediatek.com> <20241016034927.8181-3-yunfei.dong@mediatek.com>
In-Reply-To: <20241016034927.8181-3-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Oct 2024 15:08:00 +0800
Message-ID: <CAGXv+5EnczXVF3AR__OoOKdSWOSv7wciCWZSqzFrNqOoTf-bgg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: mediatek: vcodec: support extend h264 video
 shared information
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_000814_497656_F091EE7B 
X-CRM114-Status: GOOD (  33.88  )
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

On Wed, Oct 16, 2024 at 11:49=E2=80=AFAM Yunfei Dong <yunfei.dong@mediatek.=
com> wrote:
>
> The address end of working buffer can't be calculated directly
> with buffer size in kernel for some special architecture. Adding
> new extend vsi to calculate the address end in other os.
> Refactoring the driver flow to make the driver looks more reasonable.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../decoder/vdec/vdec_h264_req_multi_if.c     | 355 ++++++++++++------
>  1 file changed, 238 insertions(+), 117 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 57c85af5ffb4..e02ed8dfe0ce 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -48,10 +48,29 @@ struct vdec_h264_slice_lat_dec_param {
>  };
>
>  /**
> - * struct vdec_h264_slice_info - decode information
> + * struct vdec_h264_slice_info_ex - extend decode information

Please move these structs around so that the extended ones are
grouped together.

My suggestion is to keep |struct vdec_h264_slice_lat_dec_param|,
|struct vdec_h264_slice_info| and |struct vdec_h264_slice_vsi| at
the top of the file, and add the new ones below them. That way
the ones related are together, and also git won't produce such
a hard to read diff.

Please also mark every struct that is included in the `vsi` shared
memory struct as "shared interface with firmware" so that they do
not get changed accidentally.

>   *
> + * @wdma_end_addr_offset:      offset from buffer start
>   * @nal_info:          nal info of current picture
>   * @timeout:           Decode timeout: 1 timeout, 0 no timeout
> + * @vdec_fb_va:        VDEC frame buffer struct virtual address
> + * @crc:               Used to check whether hardware's status is right
> + * @reserved:          reserved
> + */
> +struct vdec_h264_slice_info_ex {
> +       u64 wdma_end_addr_offset;
> +       u16 nal_info;
> +       u16 timeout;

There is a 4 byte hole here. Can you make it explicit by adding
an extra reserved field?

> +       u64 vdec_fb_va;
> +       u32 crc[8];
> +       u32 reserved;
> +};
> +
> +/**
> + * struct vdec_h264_slice_info - decode information
> + *
> + * @nal_info:          nal info of current picture
> + * @timeout:           Decode timeout: 1 timeout, 0 no timeount
>   * @bs_buf_size:       bitstream size
>   * @bs_buf_addr:       bitstream buffer dma address
>   * @y_fb_dma:          Y frame buffer dma address
> @@ -70,6 +89,64 @@ struct vdec_h264_slice_info {
>         u32 crc[8];
>  };
>
> +/*
> + * struct vdec_h264_slice_mem - memory address and size
> + */
> +struct vdec_h264_slice_mem {
> +       union {
> +               u64 buf;
> +               u64 dma_addr;
> +       };
> +       union {
> +               size_t size;
> +               u64 dma_addr_end;
> +       };
> +};
> +
> +/**
> + * struct vdec_h264_slice_fb - frame buffer for decoding
> + *
> + * @y:  current y buffer address info
> + * @c:  current c buffer address info
> + */
> +struct vdec_h264_slice_fb {
> +       struct vdec_h264_slice_mem y;
> +       struct vdec_h264_slice_mem c;
> +};
> +
> +/**
> + * struct vdec_h264_slice_vsi_ex - extend shared memory for decode infor=
mation exchange
> + *        between SCP and Host.
> + *
> + * @bs:                input buffer info
> + * @fb:                current y/c buffer
> + *
> + * @ube:               ube buffer
> + * @trans:             transcoded buffer
> + * @row_info:          row info buffer
> + * @err_map:           err map buffer
> + * @slice_bc:          slice buffer
> + *
> + * @mv_buf_dma:                HW working motion vector buffer
> + * @dec:               decode information (AP-R, VPU-W)
> + * @h264_slice_params: decode parameters for hw used
> + */
> +struct vdec_h264_slice_vsi_ex {
> +       /* LAT dec addr */
> +       struct vdec_h264_slice_mem bs;
> +       struct vdec_h264_slice_fb fb;
> +
> +       struct vdec_h264_slice_mem ube;
> +       struct vdec_h264_slice_mem trans;
> +       struct vdec_h264_slice_mem row_info;
> +       struct vdec_h264_slice_mem err_map;
> +       struct vdec_h264_slice_mem slice_bc;
> +
> +       struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
> +       struct vdec_h264_slice_info_ex dec;
> +       struct vdec_h264_slice_lat_dec_param h264_slice_params;
> +};
> +
>  /**
>   * struct vdec_h264_slice_vsi - shared memory for decode information exc=
hange
>   *        between SCP and Host.
> @@ -136,10 +213,10 @@ struct vdec_h264_slice_share_info {
>   * @pred_buf:          HW working prediction buffer
>   * @mv_buf:            HW working motion vector buffer
>   * @vpu:               VPU instance
> - * @vsi:               vsi used for lat
> - * @vsi_core:          vsi used for core
> + * @vsi_ex:            extend vsi used for lat
> + * @vsi_core_ex:       extend vsi used for core
>   *
> - * @vsi_ctx:           Local VSI data for this decoding context
> + * @vsi_ctx_ex:        Local extend vsi data for this decoding context
>   * @h264_slice_param:  the parameters that hardware use to decode
>   *
>   * @resolution_changed:resolution changed
> @@ -156,10 +233,19 @@ struct vdec_h264_slice_inst {
>         struct mtk_vcodec_mem pred_buf;
>         struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
>         struct vdec_vpu_inst vpu;
> -       struct vdec_h264_slice_vsi *vsi;
> -       struct vdec_h264_slice_vsi *vsi_core;
> -
> -       struct vdec_h264_slice_vsi vsi_ctx;
> +       union {
> +               struct vdec_h264_slice_vsi_ex *vsi_ex;
> +               struct vdec_h264_slice_vsi *vsi;
> +       };
> +       union {
> +               struct vdec_h264_slice_vsi_ex *vsi_core_ex;
> +               struct vdec_h264_slice_vsi *vsi_core;
> +       };
> +
> +       union {
> +               struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
> +               struct vdec_h264_slice_vsi vsi_ctx;
> +       };

Code wise I think it would be better to have a union of structs of structs:

    union {
        struct {
            struct vdec_h264_slice_vsi *vsi;
            struct vdec_h264_slice_vsi *vsi_core;
            struct vdec_h264_slice_vsi vsi_ctx;
        };
        struct {
            struct vdec_h264_slice_vsi_ex *vsi_ex;
            struct vdec_h264_slice_vsi_ex *vsi_core_ex;
            struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
        };
    };

This makes it clear that the *_ex variants are used together.
The code compiles down to the same layout.

>         struct vdec_h264_slice_lat_dec_param h264_slice_param;
>
>         unsigned int resolution_changed;
> @@ -389,6 +475,98 @@ static void vdec_h264_slice_get_crop_info(struct vde=
c_h264_slice_inst *inst,
>                        cr->left, cr->top, cr->width, cr->height);
>  }
>
> +static void vdec_h264_slice_setup_lat_buffer(struct vdec_h264_slice_inst=
 *inst,

Please add the "_ex" suffix to mark this function as used for the extended
architecture.

> +                                            struct mtk_vcodec_mem *bs,
> +                                            struct vdec_lat_buf *lat_buf=
)
> +{
> +       struct mtk_vcodec_mem *mem;
> +       int i;
> +
> +       inst->vsi_ex->bs.dma_addr =3D (u64)bs->dma_addr;
> +       inst->vsi_ex->bs.size =3D bs->size;
> +
> +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> +               mem =3D &inst->mv_buf[i];
> +               inst->vsi_ex->mv_buf_dma[i].dma_addr =3D mem->dma_addr;
> +               inst->vsi_ex->mv_buf_dma[i].size =3D mem->size;
> +       }
> +       inst->vsi_ex->ube.dma_addr =3D lat_buf->ctx->msg_queue.wdma_addr.=
dma_addr;
> +       inst->vsi_ex->ube.size =3D lat_buf->ctx->msg_queue.wdma_addr.size=
;
> +
> +       inst->vsi_ex->row_info.dma_addr =3D 0;
> +       inst->vsi_ex->row_info.size =3D 0;
> +
> +       inst->vsi_ex->err_map.dma_addr =3D lat_buf->wdma_err_addr.dma_add=
r;
> +       inst->vsi_ex->err_map.size =3D lat_buf->wdma_err_addr.size;
> +
> +       inst->vsi_ex->slice_bc.dma_addr =3D lat_buf->slice_bc_addr.dma_ad=
dr;
> +       inst->vsi_ex->slice_bc.size =3D lat_buf->slice_bc_addr.size;
> +
> +       inst->vsi_ex->trans.dma_addr_end =3D inst->ctx->msg_queue.wdma_rp=
tr_addr;
> +       inst->vsi_ex->trans.dma_addr =3D inst->ctx->msg_queue.wdma_wptr_a=
ddr;
> +}
> +
> +static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_inst=
 *inst,
> +                                            struct vdec_h264_slice_share=
_info *share_info,
> +                                            struct vdec_lat_buf *lat_buf=
)

Same here.

> +{
> +       struct mtk_vcodec_mem *mem;
> +       struct mtk_vcodec_dec_ctx *ctx =3D inst->ctx;
> +       struct vb2_v4l2_buffer *vb2_v4l2;
> +       struct vdec_fb *fb;
> +       u64 y_fb_dma, c_fb_dma =3D 0;
> +       int i;
> +
> +       fb =3D ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> +       if (!fb) {
> +               mtk_vdec_err(ctx, "fb buffer is NULL");
> +               return -EBUSY;
> +       }
> +
> +       y_fb_dma =3D (u64)fb->base_y.dma_addr;
> +       if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes =3D=3D 1)
> +               c_fb_dma =3D
> +                       y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->=
picinfo.buf_h;
> +       else
> +               c_fb_dma =3D (u64)fb->base_c.dma_addr;
> +
> +       mtk_vdec_debug(ctx, "[h264-core] y/c addr =3D 0x%llx 0x%llx", y_f=
b_dma, c_fb_dma);
> +
> +       inst->vsi_core_ex->fb.y.dma_addr =3D y_fb_dma;
> +       inst->vsi_core_ex->fb.y.size =3D ctx->picinfo.fb_sz[0];
> +       inst->vsi_core_ex->fb.c.dma_addr =3D c_fb_dma;
> +       inst->vsi_core_ex->fb.c.size =3D ctx->picinfo.fb_sz[1];
> +
> +       inst->vsi_core_ex->dec.vdec_fb_va =3D (unsigned long)fb;
> +       inst->vsi_core_ex->dec.nal_info =3D share_info->nal_info;
> +
> +       inst->vsi_core_ex->ube.dma_addr =3D lat_buf->ctx->msg_queue.wdma_=
addr.dma_addr;
> +       inst->vsi_core_ex->ube.size =3D lat_buf->ctx->msg_queue.wdma_addr=
.size;
> +
> +       inst->vsi_core_ex->err_map.dma_addr =3D lat_buf->wdma_err_addr.dm=
a_addr;
> +       inst->vsi_core_ex->err_map.size =3D lat_buf->wdma_err_addr.size;
> +
> +       inst->vsi_core_ex->slice_bc.dma_addr =3D lat_buf->slice_bc_addr.d=
ma_addr;
> +       inst->vsi_core_ex->slice_bc.size =3D lat_buf->slice_bc_addr.size;
> +
> +       inst->vsi_core_ex->row_info.dma_addr =3D 0;
> +       inst->vsi_core_ex->row_info.size =3D 0;
> +
> +       inst->vsi_core_ex->trans.dma_addr =3D share_info->trans_start;
> +       inst->vsi_core_ex->trans.dma_addr_end =3D share_info->trans_end;
> +
> +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> +               mem =3D &inst->mv_buf[i];
> +               inst->vsi_core_ex->mv_buf_dma[i].dma_addr =3D mem->dma_ad=
dr;
> +               inst->vsi_core_ex->mv_buf_dma[i].size =3D mem->size;
> +       }
> +
> +       vb2_v4l2 =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
> +
> +       return 0;
> +}
> +
>  static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>  {
>         struct vdec_h264_slice_inst *inst;
> @@ -412,10 +590,10 @@ static int vdec_h264_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
>                 goto error_free_inst;
>         }
>
> -       vsi_size =3D round_up(sizeof(struct vdec_h264_slice_vsi), VCODEC_=
DEC_ALIGNED_64);
> -       inst->vsi =3D inst->vpu.vsi;
> -       inst->vsi_core =3D
> -               (struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + =
vsi_size);
> +       vsi_size =3D round_up(sizeof(struct vdec_h264_slice_vsi_ex), VCOD=
EC_DEC_ALIGNED_64);
> +       inst->vsi_ex =3D inst->vpu.vsi;
> +       inst->vsi_core_ex =3D
> +               (struct vdec_h264_slice_vsi_ex *)(((char *)inst->vpu.vsi)=
 + vsi_size);

Changing this here without any feature checking will break existing
platforms because the vsi_core pointer now points to the wrong address.

You can't change the existing code path in a non backwards compatible
way in one patch then fix it back up in the next patch. It has to be
done at the same time.

In other words, existing platforms _must_ continue to work throughout
your patch series, i.e. with only patches 1 & 2 applied, MT8192 / MT8195
should continue to work properly.

Looking at this patch more, it seems that it is better to squash patches
2 & 3 together. The two patches are working on the same thing: adding
support for the extended architecture. Having the changes together in
one single patch makes more sense.


ChenYu

