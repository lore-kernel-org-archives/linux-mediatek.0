Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752E3C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZV/h6vQsdHCKRsoJtSYQORaM3AAsx3HRHL7zmr/VbI=; b=tbuCGQG0ipqgreVaRDAukfcEUR
	X/j8Yub5lb7HZE3tjMpmyhq09QBMOZ/Ao5riSI12E6DQpiE059gCCg9avxop7d4bELoSpsjBVBK3p
	uFjC2BXTjpaDDAlbz4FWYt3ewNBBJ9ojYJ6ZzEwFl1G5w0oCmVTrVgfk+1IXYlRTPAmEFLuzweZRp
	bk5I9Ll7ULKKiwJezOh1BIqYMfTvyFRdASQdEVr3oru39GbhnmWRLYH4MpPySxq80kGrBPZ+jwyBs
	wjHxhGCOybxe7KbeQtDXdWsFEChoKKBdJZtQVQSS/JjPsjxU4lu5WZDwvnhftxJ1kJQ/OHtxtp2ts
	DH1hFccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVBS-0000000E8x9-0NnM;
	Mon, 27 May 2024 07:54:18 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVBQ-0000000E8vu-0WsM
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 07:54:17 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5295eb47b48so3017865e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716796453; x=1717401253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZV/h6vQsdHCKRsoJtSYQORaM3AAsx3HRHL7zmr/VbI=;
        b=gXTqEGkCWoCW6sD7BePNogrsyLOmukCgYBHcTLhzoyutf1JyQgzBKdz8psvDHq82Fd
         kNhaNbnZ69J8+meoZdtkxVg8hvQV9lp4sGfcjp4mluQSth4vDLu2KX046x9j+JhHVNDr
         b0qn7e6GLQM/DhqdZLWq0kVk62MUKd5q7kuuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716796453; x=1717401253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZV/h6vQsdHCKRsoJtSYQORaM3AAsx3HRHL7zmr/VbI=;
        b=iBtd1EiopIVEME4CiOPdpedgP/ch1HzBRGrh6t1OIQ+AwCA1hP801UDbagTFESDNWQ
         Xv7JM8hNfx0KJJTvQWWYq0dm0aMq9NkoRZe9Ld4JJp+4QeMqz53Nnggua14mU3xqVrlh
         59/hDmgIALay/T524NWQZ+j83c1VYgll1xZ5eCWhdwXWOnJWhwwQPOjsLF93TxZVPpDb
         8A/s13NlxFMsa2ElXRePdxvHxMXLqfxeT+uEzNfVLdEYBJvcSD4+eo5iWTOUdSIXEYrI
         lGZKMquckVVLl3RfohKPfSRYYAw76Z9h3ggcrNW1bAaiKYr+2BmrmbnENQ06Qx0pq7TS
         94eQ==
X-Forwarded-Encrypted: i=1; AJvYcCW87JwGeGZfs7oEbC+tG7L2pmo2UGlNpZtK6cGHBF8pDE0tFJmWLw3SEANO++9cWdqkJq//qyptKTH/UYlhNyGpfXL7CSjowIRl2idWo++KT2rr
X-Gm-Message-State: AOJu0YxWHZGY6yhTCnwPkeW6vbZlYHzObd0paLuiNXuP0UXo3d+Fj189
	x76qRvTQeeXpWmfzNhjrrNi4wd+JZaBp61iPIzJ0qJe9crzXVuXtsYAzeRO3EodRP1zMp2rIsmu
	THANxUzI9WDz5rjqjvdf7jq7//t8nQKeWam39
X-Google-Smtp-Source: AGHT+IEr6BRhzwQNd70coArCp9R36H5Sfgvu1jqLEpaNgVYG5JEtSZ3QSk58bvLscssV5LNqg4qreFKps/AUod4hV0I=
X-Received: by 2002:ac2:4548:0:b0:51c:348:3ba9 with SMTP id
 2adb3069b0e04-52964baf3ebmr4816022e87.22.1716796453243; Mon, 27 May 2024
 00:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com> <20240516122102.16379-25-yunfei.dong@mediatek.com>
In-Reply-To: <20240516122102.16379-25-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 15:54:02 +0800
Message-ID: <CAGXv+5EdwQMCPu7ksshCQ_FQZ460TFrxQN4TE2t=LEOK-rNU5g@mail.gmail.com>
Subject: Re: [PATCH v6, 24/24] media: mediatek: vcodec: support vp9 svp
 decoder for mt8188
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_005416_184718_9F3C1F70 
X-CRM114-Status: GOOD (  24.42  )
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

On Thu, May 16, 2024 at 8:21=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> From: Yilong Zhou <yilong.zhou@mediatek.com>
>
> Change vp9 driver to support secure video playback(svp) for
> mt8188. Need to map shared memory with optee interface and
> wait interrupt in optee-os.
>
> Signed-off-by: Yilong Zhou <yilong.zhou@mediatek.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 91 ++++++++++++-------
>  1 file changed, 59 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cf48d09b78d7..9f64661800af 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -141,6 +141,7 @@ struct vdec_vp9_slice_frame_counts {
>   * @skip:      skip counts.
>   * @y_mode:    Y prediction mode counts.
>   * @filter:    interpolation filter counts.
> + * @mv_joint:  motion vector joint counts.
>   * @sign:      motion vector sign counts.
>   * @classes:   motion vector class counts.
>   * @class0:    motion vector class0 bit counts.
> @@ -804,6 +805,9 @@ static void vdec_vp9_slice_setup_frame_ctx(struct vde=
c_vp9_slice_instance *insta
>         error_resilient_mode =3D HDR_FLAG(ERROR_RESILIENT);
>         reset_frame_context =3D uh->reset_frame_context;
>
> +       if (instance->ctx->is_secure_playback)
> +               return;
> +
>         /*
>          * according to "6.2 Uncompressed header syntax" in
>          * "VP9 Bitstream & Decoding Process Specification",
> @@ -818,8 +822,7 @@ static void vdec_vp9_slice_setup_frame_ctx(struct vde=
c_vp9_slice_instance *insta
>                  * 2 resets just the context specified in the frame heade=
r
>                  * 3 resets all contexts
>                  */
> -               if (key_frame || error_resilient_mode ||
> -                   reset_frame_context =3D=3D 3) {
> +               if (key_frame || error_resilient_mode || reset_frame_cont=
ext =3D=3D 3) {
>                         /* use default table */
>                         for (i =3D 0; i < 4; i++)
>                                 instance->dirty[i] =3D 0;
> @@ -1042,6 +1045,9 @@ static void vdec_vp9_slice_setup_seg_buffer(struct =
vdec_vp9_slice_instance *inst
>  {
>         struct vdec_vp9_slice_uncompressed_header *uh;
>
> +       if (instance->ctx->is_secure_playback)
> +               return;
> +
>         /* reset segment buffer */
>         uh =3D &vsi->frame.uh;
>         if (uh->frame_type =3D=3D 0 ||
> @@ -1172,15 +1178,16 @@ static int vdec_vp9_slice_setup_lat(struct vdec_v=
p9_slice_instance *instance,
>
>         vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0])=
;
>
> -       /* setup prob/tile buffers for LAT */
> -
> -       ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> -       if (ret)
> -               goto err;
> +       if (!instance->ctx->is_secure_playback) {
> +               /* setup prob/tile buffers for LAT */
> +               ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> +               if (ret)
> +                       goto err;
>
> -       ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> -       if (ret)
> -               goto err;
> +               ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, b=
s);
> +               if (ret)
> +                       goto err;
> +       }
>
>         return 0;
>
> @@ -1599,7 +1606,8 @@ static int vdec_vp9_slice_update_single(struct vdec=
_vp9_slice_instance *instance
>                        pfc->seq, vsi->state.crc[4], vsi->state.crc[5],
>                        vsi->state.crc[6], vsi->state.crc[7]);
>
> -       vdec_vp9_slice_update_prob(instance, vsi);
> +       if (!instance->ctx->is_secure_playback)
> +               vdec_vp9_slice_update_prob(instance, vsi);
>
>         instance->width =3D vsi->frame.uh.frame_width;
>         instance->height =3D vsi->frame.uh.frame_height;
> @@ -1632,7 +1640,8 @@ static int vdec_vp9_slice_update_lat(struct vdec_vp=
9_slice_instance *instance,
>                 return -EAGAIN;
>         }
>
> -       vdec_vp9_slice_update_prob(instance, vsi);
> +       if (!instance->ctx->is_secure_playback)
> +               vdec_vp9_slice_update_prob(instance, vsi);
>
>         instance->width =3D vsi->frame.uh.frame_width;
>         instance->height =3D vsi->frame.uh.frame_height;
> @@ -1694,8 +1703,13 @@ static int vdec_vp9_slice_setup_core_buffer(struct=
 vdec_vp9_slice_instance *inst
>                 return -EINVAL;
>
>         /* update internal buffer's width/height */
> -       instance->dpb[vb->index].width =3D w;
> -       instance->dpb[vb->index].height =3D h;
> +       for (i =3D 0; i < vq->num_buffers; i++) {

Starting in v6.10-rc1 with the introduction of REMOVE_BUFS, vq->num_buffers
was removed. There is now vq->max_num_buffers.

> +               if (vb =3D=3D vq->bufs[i]) {

This should probably use the helper "vb2_get_buffer(vq, i)".

ChenYu

> +                       instance->dpb[i].width =3D w;
> +                       instance->dpb[i].height =3D h;
> +                       break;
> +               }
> +       }
>
>         /*
>          * get buffer's width/height from instance
> @@ -1779,7 +1793,8 @@ static int vdec_vp9_slice_setup_core(struct vdec_vp=
9_slice_instance *instance,
>         if (ret)
>                 goto err;
>
> -       vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[1])=
;
> +       if (!instance->ctx->is_secure_playback)
> +               vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance-=
>seg[1]);
>
>         return 0;
>
> @@ -1874,19 +1889,31 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_=
dec_ctx *ctx)
>                 goto error_vsi;
>         }
>         instance->init_vsi =3D vsi;
> -       instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_han=
dler,
> -                                                      (u32)vsi->core_vsi=
);
> -       if (!instance->core_vsi) {
> -               mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
> -               ret =3D -EINVAL;
> -               goto error_vsi;
> -       }
>
> -       instance->irq =3D 1;
> +       if (ctx->is_secure_playback) {
> +               instance->core_vsi =3D
> +                       mtk_vcodec_dec_get_shm_buffer_va(ctx->dev->optee_=
private, MTK_VDEC_CORE,
> +                                                        OPTEE_DATA_INDEX=
);
> +               if (!instance->core_vsi) {
> +                       mtk_vdec_err(ctx, "failed to get VP9 svp core vsi=
\n");
> +                       ret =3D -EINVAL;
> +                       goto error_vsi;
> +               }
> +               instance->irq =3D 0;
> +       } else {
> +               instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev=
->fw_handler,
> +                                                              (u32)vsi->=
core_vsi);
> +               if (!instance->core_vsi) {
> +                       mtk_vdec_err(ctx, "failed to get VP9 normal core =
vsi\n");
> +                       ret =3D -EINVAL;
> +                       goto error_vsi;
> +               }
> +               instance->irq =3D 1;
>
> -       ret =3D vdec_vp9_slice_init_default_frame_ctx(instance);
> -       if (ret)
> -               goto error_default_frame_ctx;
> +               ret =3D vdec_vp9_slice_init_default_frame_ctx(instance);
> +               if (ret)
> +                       goto error_default_frame_ctx;
> +       }
>
>         ctx->drv_handle =3D instance;
>
> @@ -2101,9 +2128,12 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec,=
 struct mtk_vcodec_mem *bs,
>                        (unsigned long)pfc->vsi.trans.dma_addr,
>                        (unsigned long)pfc->vsi.trans.dma_addr_end);
>
> -       vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
> -                                      vsi->trans.dma_addr_end +
> -                                      ctx->msg_queue.wdma_addr.dma_addr)=
;
> +       if (!instance->ctx->is_secure_playback) {
> +               vsi->trans.dma_addr_end +=3D ctx->msg_queue.wdma_addr.dma=
_addr;
> +               mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
> +                              (unsigned long)pfc->vsi.trans.dma_addr_end=
);
> +       }
> +       vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi->trans.dma_ad=
dr_end);
>         vdec_msg_queue_qbuf(&ctx->msg_queue.core_ctx, lat_buf);
>
>         return 0;
> @@ -2183,9 +2213,6 @@ static int vdec_vp9_slice_core_decode(struct vdec_l=
at_buf *lat_buf)
>                 goto err;
>         }
>
> -       pfc->vsi.trans.dma_addr_end +=3D ctx->msg_queue.wdma_addr.dma_add=
r;
> -       mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
> -                      (unsigned long)pfc->vsi.trans.dma_addr_end);
>         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dm=
a_addr_end);
>         ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
>
> --
> 2.25.1
>

