Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4281C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CCfbPDOdKsb51YYQXWDMwbE5MtWrfigs9N7Xjq4k7U=; b=0kSb174IRDtKNH4bnrWkmlOnM9
	enAfMQ4Wk/Dkuloe8+o8Zk4L9MgQUyk7IeMOZwx4kYHvVwxbjd/Fnddmn/IRWRQm8B/HfxKL99j/X
	4YbX/TW9kAqlFIfQT0Aw/2r3oA24WWRVAN03CMeCvZZz2otT5sF+FsCMpIvsjXHBx21yYELnSGwxY
	9F+nVV9QoLQxXMGOWbvnFiSXeQM2GJ+KKyEJi9VAn54JCOPLDKtSioZHj7yLU54QmFlU17dsERfe4
	w5TV44IR/c1ZPT5j3qMAMaN4SZFuA3WeOi1FyE7K0PqxfikDZngxgq+pZ3oeDkSO+J8RDlFbv3dQt
	XL4hucYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNx1D-004f1p-2B;
	Mon, 24 Jul 2023 14:58:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNx19-004ezZ-1c;
	Mon, 24 Jul 2023 14:58:37 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:10:580::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2971A66070F7;
	Mon, 24 Jul 2023 15:58:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690210711;
	bh=eh2oEF+J5oZffvXBl4TeLOtFgXuWus4Ht+BGvLmKiFs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nmbFmwfFglDldVWaISuEQOc2SM5Qz3Dg5xRAiTAA0X8fXt/RVdXav8RAxMAnZt9xE
	 FNi8aMnb9bBHCpyTIDVanWywJEsa+UNuxbUPoyCpfRnQmNcoIA9ExiSLGzY1zHrDq+
	 4pHLsw19pJQr2NyrFdOAgBhetbctNBA7+Upa5AYPCDcH/txc7KR//loFW8xWaAHse4
	 66zbJPjvnWht1DKqDB+I5SpeUwcvEmY7eYoI3neCmF+MzAYmoNMDTv0v2VLDhXb0YR
	 bHIZjjhV72xXqc6Y1T2dj5d3VjWb958b+TJjLn/s6ch0/0OrtI1FgRDo6EA0r8aetx
	 tJzuKf/KyEQ0w==
Message-ID: <a01d1f15542917f0dbc8273bc5bcb41652338841.camel@collabora.com>
Subject: Re: [PATCH v2,1/2] media: mediatek: vcodec: checking decoder ack
 message parameter
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
Date: Mon, 24 Jul 2023 10:58:21 -0400
In-Reply-To: <20230722074608.30766-1-yunfei.dong@mediatek.com>
References: <20230722074608.30766-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_075835_879985_E2F18F81 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Yunfei,

Le samedi 22 juillet 2023 =C3=A0 15:46 +0800, Yunfei Dong a =C3=A9crit=C2=
=A0:
> Need to checking all parameters of msg data are valid or not,
> in case of access null pointer or unreasonable value leading
> to kernel reboot.

May I suggest an alternative commit message ? It would look like:
  =20
  =20
   media: mediatek: vcodec: Fix possible invalid memory access
  =20
   Validate that the context pointer and the vpu instance within this
   context is valid. <please add why it may occur here>


I cannot really provide a full message here, but my understanding is that i=
t is
normal behaviour for the IRQ handler to be called after the context or the =
VPU
instance has been released ? It is unlikely a great programming pattern tho=
ugh,
can't you remove the handler on time instead ?

Nicolas

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
>  .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 77 ++++++++++++-------
>  2 files changed, 52 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index 6c318de25a55..7e36b2c69b7d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -161,6 +161,7 @@ struct mtk_vcodec_dec_pdata {
>   * @hw_id: hardware index used to identify different hardware.
>   *
>   * @msg_queue: msg queue used to store lat buffer information.
> + * @vpu_inst: vpu instance pointer.
>   *
>   * @is_10bit_bitstream: set to true if it's 10bit bitstream
>   */
> @@ -205,6 +206,7 @@ struct mtk_vcodec_dec_ctx {
>  	int hw_id;
> =20
>  	struct vdec_msg_queue msg_queue;
> +	void *vpu_inst;
> =20
>  	bool is_10bit_bitstream;
>  };
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 82c3dc8c4127..23cfe5c6c90b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -72,6 +72,21 @@ static void handle_get_param_msg_ack(const struct vdec=
_vpu_ipi_get_param_ack *ms
>  	}
>  }
> =20
> +static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, st=
ruct vdec_vpu_inst *vpu)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx;
> +	int ret =3D false;
> +
> +	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
> +		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
> +			ret =3D true;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * vpu_dec_ipi_handler - Handler for VPU ipi message.
>   *
> @@ -84,44 +99,51 @@ static void handle_get_param_msg_ack(const struct vde=
c_vpu_ipi_get_param_ack *ms
>   */
>  static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv=
)
>  {
> +	struct mtk_vcodec_dec_dev *dec_dev;
>  	const struct vdec_vpu_ipi_ack *msg =3D data;
> -	struct vdec_vpu_inst *vpu =3D (struct vdec_vpu_inst *)
> -					(unsigned long)msg->ap_inst_addr;
> +	struct vdec_vpu_inst *vpu;
> =20
> -	if (!vpu) {
> +	dec_dev =3D (struct mtk_vcodec_dec_dev *)priv;
> +	vpu =3D (struct vdec_vpu_inst *)(unsigned long)msg->ap_inst_addr;
> +	if (!priv || !vpu) {
>  		mtk_v4l2_vdec_err(vpu->ctx, "ap_inst_addr is NULL, did the SCP hang or=
 crash?");
>  		return;
>  	}
> =20
> -	mtk_vdec_debug(vpu->ctx, "+ id=3D%X", msg->msg_id);
> +	if (!vpu_dec_check_ap_inst(dec_dev, vpu) || msg->msg_id < VPU_IPIMSG_DE=
C_INIT_ACK ||
> +	    msg->msg_id > VPU_IPIMSG_DEC_GET_PARAM_ACK) {
> +		mtk_v4l2_vdec_err(vpu->ctx, "vdec msg id not correctly =3D> 0x%x", msg=
->msg_id);
> +		vpu->failure =3D -EINVAL;
> +		goto error;
> +	}
> =20
>  	vpu->failure =3D msg->status;
> -	vpu->signaled =3D 1;
> +	if (msg->status !=3D 0)
> +		goto error;
> =20
> -	if (msg->status =3D=3D 0) {
> -		switch (msg->msg_id) {
> -		case VPU_IPIMSG_DEC_INIT_ACK:
> -			handle_init_ack_msg(data);
> -			break;
> +	switch (msg->msg_id) {
> +	case VPU_IPIMSG_DEC_INIT_ACK:
> +		handle_init_ack_msg(data);
> +		break;
> =20
> -		case VPU_IPIMSG_DEC_START_ACK:
> -		case VPU_IPIMSG_DEC_END_ACK:
> -		case VPU_IPIMSG_DEC_DEINIT_ACK:
> -		case VPU_IPIMSG_DEC_RESET_ACK:
> -		case VPU_IPIMSG_DEC_CORE_ACK:
> -		case VPU_IPIMSG_DEC_CORE_END_ACK:
> -			break;
> +	case VPU_IPIMSG_DEC_START_ACK:
> +	case VPU_IPIMSG_DEC_END_ACK:
> +	case VPU_IPIMSG_DEC_DEINIT_ACK:
> +	case VPU_IPIMSG_DEC_RESET_ACK:
> +	case VPU_IPIMSG_DEC_CORE_ACK:
> +	case VPU_IPIMSG_DEC_CORE_END_ACK:
> +		break;
> =20
> -		case VPU_IPIMSG_DEC_GET_PARAM_ACK:
> -			handle_get_param_msg_ack(data);
> -			break;
> -		default:
> -			mtk_vdec_err(vpu->ctx, "invalid msg=3D%X", msg->msg_id);
> -			break;
> -		}
> +	case VPU_IPIMSG_DEC_GET_PARAM_ACK:
> +		handle_get_param_msg_ack(data);
> +		break;
> +	default:
> +		mtk_vdec_err(vpu->ctx, "invalid msg=3D%X", msg->msg_id);
> +		break;
>  	}
> =20
> -	mtk_vdec_debug(vpu->ctx, "- id=3D%X", msg->msg_id);
> +error:
> +	vpu->signaled =3D 1;
>  }
> =20
>  static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int=
 len)
> @@ -182,9 +204,10 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =20
>  	init_waitqueue_head(&vpu->wq);
>  	vpu->handler =3D vpu_dec_ipi_handler;
> +	vpu->ctx->vpu_inst =3D vpu;
> =20
>  	err =3D mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
> -					 vpu->handler, "vdec", NULL);
> +					 vpu->handler, "vdec", vpu->ctx->dev);
>  	if (err) {
>  		mtk_vdec_err(vpu->ctx, "vpu_ipi_register fail status=3D%d", err);
>  		return err;
> @@ -193,7 +216,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>  	if (vpu->ctx->dev->vdec_pdata->hw_arch =3D=3D MTK_VDEC_LAT_SINGLE_CORE)=
 {
>  		err =3D mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
>  						 vpu->core_id, vpu->handler,
> -						 "vdec", NULL);
> +						 "vdec", vpu->ctx->dev);
>  		if (err) {
>  			mtk_vdec_err(vpu->ctx, "vpu_ipi_register core fail status=3D%d", err)=
;
>  			return err;


