Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5067CC54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 18:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIbxlgLLMuP8VfnitXafCkNSyw7iQ2+h4YwS7mfda7g=; b=l2CGTYkOaRz1V4a5NaYovZLFZ4
	0PE8kLG7PXx5RFKuPRNeGQV/NCZjcVOu152/YaKhU++/Y5ukgSj/r+9Ve5cWJa3Hvf+wgiRLOmn9z
	pf8M8HN0hoGw9j0C657NqqayIUwaKcpANxa89MaGdyyJim02a+FlAmeXOIxcWHFPLiKp6s4uXqF2q
	FQHBnTQYvB/+mzVj9GT103bKw7h+Aa2pAYdENU9a4jr7ZPXCk+YBqwaysaLdrlCw5gNZ/5fwyyqrP
	H+Hx+0H8oJbp+fwIbiAaJ+FvsF+QJO98dJEfVdpG+TcKHxycI4AC9yzh9wioo3pcvm3DFXvrQJTwd
	wNmMt0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlCfN-00000001EWQ-16Cz;
	Fri, 15 Mar 2024 18:52:29 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlCfG-00000001ETm-2UPk;
	Fri, 15 Mar 2024 18:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710528741;
	bh=SMmJSZ8TCgP0UfFx6uzxM9a+eB5MYJgcY3kQQ1gi0O0=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=1sBa83SUB+7n6wiqDY/CAQCVUpFwnwLT7WyHRMGya0irmAzXk/Q2pBLbJ+/4q2ez2
	 goCFiv1pyPtFTTBsx6zONKvFmfiLLGFj1CdZmD8RjXDU/LnfuU2Hti5wJR7deGtoNm
	 ZoPQcB94jxHgu8GoThSa7D18c5qPdvWzbcbrXBgIBgHnKOW4KurHdonLQWHAvGvH/Z
	 cEoPChilds7pno3j4tXXyV3tlXTDsBJHzlZ0/GYClC38p31j2Iw1ML4iAXbtDhsx+R
	 IME8pnKvsELxUgEnI7OkoDZyefc1RhEhzS6PKKZ87Os83070DjRY+lpuCmC1v9BuL7
	 e7kapDEUyRrsA==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E2FF37820D8;
	Fri, 15 Mar 2024 18:52:15 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2,4/4] media: mediatek: vcodec: replace
 v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240314114452.17532-5-yunfei.dong@mediatek.com>
Date: Fri, 15 Mar 2024 15:52:01 -0300
Cc: =?utf-8?B?Ik7DrWNvbGFzIEYgLiBSIC4gQSAuIFByYWRvIg==?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <69C5D24C-D33A-4F1E-B9A9-6C32AB1951BA@collabora.com>
References: <20240314114452.17532-1-yunfei.dong@mediatek.com>
 <20240314114452.17532-5-yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_115222_844395_A1B99CB8 
X-CRM114-Status: GOOD (  23.99  )
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



> On 14 Mar 2024, at 08:44, Yunfei Dong <yunfei.dong@mediatek.com> =
wrote:
>=20
> There isn't lock to protect source buffer when get next src buffer, if
> the source buffer is removed for some unknown reason before lat work =
queue
> execute done, will lead to remove source buffer or buffer done error.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 +++++++++----
> .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 25 ++++++--------
> .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 33 ++++++++-----------
> 3 files changed, 40 insertions(+), 40 deletions(-)
>=20
> diff --git =
a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.=
c =
b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.=
c
> index 3060768e0ea9..bb2680f3ec5b 100644
> --- =
a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.=
c
> +++ =
b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.=
c
> @@ -328,7 +328,7 @@ static void mtk_vdec_worker(struct work_struct =
*work)
> bool res_chg =3D false;
> int ret;
>=20
> - vb2_v4l2_src =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> + vb2_v4l2_src =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> if (!vb2_v4l2_src) {
> v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
> @@ -363,7 +363,7 @@ static void mtk_vdec_worker(struct work_struct =
*work)
> mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
>=20
> ret =3D vdec_if_decode(ctx, bs_src, NULL, &res_chg);


Can you leave a comment explaining why the !=3D -EAGAIN check was
removed? Doesn=E2=80=99t seem obvious to me.


> - if (ret && ret !=3D -EAGAIN) {
> + if (ret) {
> mtk_v4l2_vdec_err(ctx,
>  "[%d] decode src_buf[%d] sz=3D0x%zx pts=3D%llu ret=3D%d res_chg=3D%d",
>  ctx->id, vb2_src->index, bs_src->size,
> @@ -380,11 +380,21 @@ static void mtk_vdec_worker(struct work_struct =
*work)
>    ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME) {
> if (src_buf_req)
> v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> - v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, =
state);
> - } else {
> - if (ret !=3D -EAGAIN)
> - v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> + if (vb2_v4l2_src)
> + v4l2_m2m_buf_done(vb2_v4l2_src, state);
> +
> v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> + } else {
> + if (!ret) {
> + v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> + } else {
> + if (src_buf_req)
> + v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);

vb2_v4l2_src can=E2=80=99t really be NULL here due to this:

```
	vb2_v4l2_src =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
	if (!vb2_v4l2_src) {
		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source =
buffer", ctx->id);
		return;
	}
```

I must say I find the control flow here a bit confusing, so I wonder if =
this block can=E2=80=99t go
into an inline helper to clean up stuff a bit:

```
			if (src_buf_req)
				v4l2_ctrl_request_complete(src_buf_req, =
&ctx->ctrl_hdl);
			if (vb2_v4l2_src)
				v4l2_m2m_buf_done(vb2_v4l2_src, state);

			v4l2_m2m_job_finish(dev->m2m_dev_dec, =
ctx->m2m_ctx);
```

Also, I dislike that this apparently fails silently if the pointers are =
NULL. It is
not clear at a first glance if you=E2=80=99re just being careful or if =
you legitimately expect
`src_buf_req` to possibly be NULL at this point for whatever reason. The =
lifecycle
of request objects is not trivial, so it=E2=80=99s good to be explicit =
here even if this means
only leaving a comment or similar

=E2=80=94 Daniel

> + if (vb2_v4l2_src)
> + v4l2_m2m_buf_done(vb2_v4l2_src, state);
> +
> + v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> + }
> }
> }
>=20
> diff --git =
a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.=
c =
b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.=
c
> index f277b907c345..339c5c88da1a 100644
> --- =
a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.=
c
> +++ =
b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.=
c
> @@ -1052,23 +1052,18 @@ static inline void =
vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
> memcpy(remote_vsi, vsi, sizeof(*vsi));
> }
>=20
> -static int vdec_av1_slice_setup_lat_from_src_buf(struct =
vdec_av1_slice_instance *instance,
> - struct vdec_av1_slice_vsi *vsi,
> - struct vdec_lat_buf *lat_buf)
> +static int vdec_av1_slice_setup_lat_from_src_buf(struct =
vdec_av1_slice_vsi *vsi,
> + struct vdec_lat_buf *lat_buf,
> + struct mtk_vcodec_mem *bs)
> {
> - struct vb2_v4l2_buffer *src;
> - struct vb2_v4l2_buffer *dst;
> -
> - src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> - if (!src)
> - return -EINVAL;
> + struct mtk_video_dec_buf *src_buf_info;
>=20
> - lat_buf->src_buf_req =3D src->vb2_buf.req_obj.req;
> - lat_buf->vb2_v4l2_src =3D src;
> + src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, =
bs_buffer);
> + lat_buf->src_buf_req =3D =
src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> + lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>=20
> - dst =3D &lat_buf->ts_info;
> - v4l2_m2m_buf_copy_metadata(src, dst, true);
> - vsi->frame.cur_ts =3D dst->vb2_buf.timestamp;
> + v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, =
&lat_buf->ts_info, true);
> + vsi->frame.cur_ts =3D lat_buf->ts_info.vb2_buf.timestamp;
>=20
> return 0;
> }
> @@ -1717,7 +1712,7 @@ static int vdec_av1_slice_setup_lat(struct =
vdec_av1_slice_instance *instance,
> struct vdec_av1_slice_vsi *vsi =3D &pfc->vsi;
> int ret;
>=20
> - ret =3D vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, =
lat_buf);
> + ret =3D vdec_av1_slice_setup_lat_from_src_buf(vsi, lat_buf, bs);
> if (ret)
> return ret;
>=20
> diff --git =
a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.=
c =
b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.=
c
> index 0dedbc3680e8..2697e04f4313 100644
> --- =
a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.=
c
> +++ =
b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.=
c
> @@ -693,39 +693,34 @@ static int vdec_vp9_slice_tile_offset(int idx, =
int mi_num, int tile_log2)
> }
>=20
> static
> -int vdec_vp9_slice_setup_single_from_src_to_dst(struct =
vdec_vp9_slice_instance *instance)
> +int vdec_vp9_slice_setup_single_from_src_to_dst(struct =
vdec_vp9_slice_instance *instance,
> + struct mtk_vcodec_mem *bs)
> {
> - struct vb2_v4l2_buffer *src;
> struct vb2_v4l2_buffer *dst;
> + struct mtk_video_dec_buf *src_buf_info;
>=20
> - src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> - if (!src)
> - return -EINVAL;
> + src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, =
bs_buffer);
>=20
> dst =3D v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
> if (!dst)
> return -EINVAL;
>=20
> - v4l2_m2m_buf_copy_metadata(src, dst, true);
> + v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, dst, true);
>=20
> return 0;
> }
>=20
> -static int vdec_vp9_slice_setup_lat_from_src_buf(struct =
vdec_vp9_slice_instance *instance,
> - struct vdec_lat_buf *lat_buf)
> +static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_lat_buf =
*lat_buf,
> + struct mtk_vcodec_mem *bs)
> {
> - struct vb2_v4l2_buffer *src;
> - struct vb2_v4l2_buffer *dst;
> + struct mtk_video_dec_buf *src_buf_info;
>=20
> - src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> - if (!src)
> - return -EINVAL;
> + src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, =
bs_buffer);
> + lat_buf->src_buf_req =3D =
src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> + lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>=20
> - lat_buf->src_buf_req =3D src->vb2_buf.req_obj.req;
> - lat_buf->vb2_v4l2_src =3D src;
> + v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, =
&lat_buf->ts_info, true);
>=20
> - dst =3D &lat_buf->ts_info;
> - v4l2_m2m_buf_copy_metadata(src, dst, true);
> return 0;
> }
>=20
> @@ -1155,7 +1150,7 @@ static int vdec_vp9_slice_setup_lat(struct =
vdec_vp9_slice_instance *instance,
> struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> int ret;
>=20
> - ret =3D vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
> + ret =3D vdec_vp9_slice_setup_lat_from_src_buf(lat_buf, bs);
> if (ret)
> goto err;
>=20
> @@ -1796,7 +1791,7 @@ static int vdec_vp9_slice_setup_single(struct =
vdec_vp9_slice_instance *instance,
> struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> int ret;
>=20
> - ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance);
> + ret =3D vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs);
> if (ret)
> goto err;
>=20
> --=20
> 2.18.0
>=20
>=20


