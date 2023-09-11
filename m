Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F5DEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo9exag5I6/CGMRNfpPH+nmrnyhmq8CCOcGtLniU7nk=; b=D+tlXl6QrXrcuHczbv/S4cY20A
	dDYvEvQ+HBZkqoynERxouyvSoVZNELFqmVpTSEl2671bMkEJAk7a0QJ7dMUN/FpgFC7yWaUyxABO9
	OaTk3xoPuSn8wkRCvOm4Y0+X8srHP3Ru4bURgjnWr58ufAMhp50tv2RSiox/hwO7iflNxMdvt/Ffm
	v1tnlZj8Km1KosJoCOWc0f7WfCSH9+xf9SIEdnFfhYPrZW2k9NvC3O+coWO1z87WtuID3eqykD7sV
	ILz56sqcPuuf1rYQ2mHwnfu61LrRYrT+1AWuI4kfmfxqVzVU2gBgyy8tYs359B4Gi/pkQc+16sjBo
	ZKR6k16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjF6-000wiM-2r;
	Mon, 11 Sep 2023 15:54:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjF3-000wgi-1B;
	Mon, 11 Sep 2023 15:54:27 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:bae9::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 61C656606F85;
	Mon, 11 Sep 2023 16:54:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694447663;
	bh=eWLSPASCjyGijVC47zrvGFOyHTG4k8kAENH0R7NxTcM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UyUfrPOVxFRaJigHjAhHDgT1CbGBXybqfMEDdYaT3Hv2y4xqCxeNgrNq/JIXeZCus
	 HxU10jMMUA+9csM0/B2DoJGtwrkueHQgReK1bR27lL1TjoKVAY/xtCRdo+YHbyYxZF
	 MkaenK5FjSalz2bQXtzqc31ON5vGgD7iJFQyzMLL2f90Np2jTFlrlCB0gfJem9ffoY
	 S05FJUfDe5H9MQr73CuruZqS9aAIZ4CXQ6bf4gsQpC/iGdpNf6rkwuUTGQQBoJNc+K
	 6iQBCc+rSSr81habwkSz1reaM9LOUnRkAPeehadIIiV4x2MV0hioDvWmVoeR9ijV1n
	 KCrVd/15Hxh5w==
Message-ID: <1df3e79b84933dda0313d0d9719220dbc06c9022.camel@collabora.com>
Subject: Re: [PATCH 12/14] media: medkatek: vcodec: set secure mode to
 decoder driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>,  linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 11 Sep 2023 11:54:14 -0400
In-Reply-To: <20230911125936.10648-13-yunfei.dong@mediatek.com>
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
	 <20230911125936.10648-13-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085425_662177_ADD1A490 
X-CRM114-Status: GOOD (  22.27  )
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

Hi,

Le lundi 11 septembre 2023 =C3=A0 20:59 +0800, Yunfei Dong a =C3=A9crit=C2=
=A0:
> Setting secure mode flag to kernel when trying to play secure video,
> then decoder driver will initialize tee related interface to support
> svp.


This is not what the patch is doing, please rework. This patch is an vendor=
 API
addition introducing V4L2_CID_MPEG_MTK_SET_SECURE_MODE. I should not have t=
o
read your patch to understand this.

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c     | 15 ++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         |  5 +++++
>  include/uapi/linux/v4l2-controls.h                |  1 +
>  3 files changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index d2b09ce9f1cf..a981178c25d9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -535,6 +535,17 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ctrl->val =3D mtk_dma_contig_get_secure_handle(ctx, ctrl->val);
>  		mtk_v4l2_vdec_dbg(3, ctx, "get secure handle: %d =3D> 0x%x", sec_fd, c=
trl->val);
>  		break;
> +	case V4L2_CID_MPEG_MTK_SET_SECURE_MODE:

Stepping back a little and focusing on the API, what makes your driver so
special that it should be the only one having a "secure mode" ? We are touc=
hing
in gap in the media pipeline in Linux, and this should come with considerat=
ion
of the global API.

Why is this API better then let's say Google Android one, were they expose =
2
device nodes in their fork of the MFC driver (a secure and a non secure one=
) ?

regards,
Nicolas

p.s. you forgot to document your control in the RST doc, please do in follo=
wing
release.

> +		ctx->is_svp_mode =3D ctrl->val;
> +
> +		if (ctx->is_svp_mode) {
> +			ret =3D mtk_vcodec_dec_optee_open(ctx->dev->optee_private);
> +			if (ret)
> +				mtk_v4l2_vdec_err(ctx, "open secure mode failed.");
> +			else
> +				mtk_v4l2_vdec_dbg(3, ctx, "decoder in secure mode: %d", ctrl->val);
> +		}
> +		break;
>  	default:
>  		mtk_v4l2_vdec_dbg(3, ctx, "Not supported to set ctrl id: 0x%x\n", hdr_=
ctrl->id);
>  		return ret;
> @@ -573,7 +584,7 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcod=
ec_dec_ctx *ctx)
>  	unsigned int i;
>  	struct v4l2_ctrl *ctrl;
> =20
> -	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS + 1);
> +	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS + 2);
>  	if (ctx->ctrl_hdl.error) {
>  		mtk_v4l2_vdec_err(ctx, "v4l2_ctrl_handler_init failed\n");
>  		return ctx->ctrl_hdl.error;
> @@ -592,6 +603,8 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcod=
ec_dec_ctx *ctx)
> =20
>  	ctrl =3D v4l2_ctrl_new_std(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
>  				 V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE, 0, 65535, 1, 0);
> +	ctrl =3D v4l2_ctrl_new_std(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
> +				 V4L2_CID_MPEG_MTK_SET_SECURE_MODE, 0, 65535, 1, 0);
> =20
>  	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> =20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index d8cf01f76aab..a507045a3f30 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Reference Fram=
es for a P-Frame";
>  	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:		return "Prepend SPS an=
d PPS to IDR";
>  	case V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE:		return "MediaTek Decoder get=
 secure handle";
> +	case V4L2_CID_MPEG_MTK_SET_SECURE_MODE:			return "MediaTek Decoder set =
secure mode";
> =20
>  	/* AV1 controls */
>  	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:			return "AV1 Profile";
> @@ -1442,6 +1443,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enu=
m v4l2_ctrl_type *type,
>  		*type =3D V4L2_CTRL_TYPE_INTEGER;
>  		*flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY;
>  		break;
> +	case V4L2_CID_MPEG_MTK_SET_SECURE_MODE:
> +		*type =3D V4L2_CTRL_TYPE_INTEGER;
> +		*flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY;
> +		break;
>  	case V4L2_CID_USER_CLASS:
>  	case V4L2_CID_CAMERA_CLASS:
>  	case V4L2_CID_CODEC_CLASS:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 7b3694985366..88e90d943e38 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -957,6 +957,7 @@ enum v4l2_mpeg_mfc51_video_force_frame_type {
>  /*  MPEG-class control IDs specific to the MediaTek Decoder driver as de=
fined by V4L2 */
>  #define V4L2_CID_MPEG_MTK_BASE			(V4L2_CTRL_CLASS_CODEC | 0x2000)
>  #define V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE	(V4L2_CID_MPEG_MTK_BASE+8)
> +#define V4L2_CID_MPEG_MTK_SET_SECURE_MODE	(V4L2_CID_MPEG_MTK_BASE+9)
> =20
>  /*  Camera class control IDs */
> =20


