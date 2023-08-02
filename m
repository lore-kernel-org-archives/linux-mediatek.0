Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94146C00528
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZQ8vdFGyufXNnXlW+rCVqKmh2maLvHvtc7mVIoMgn0=; b=XZ+lrOlAfgWKAB+jkNxt0SxcWF
	8j3eGDWPRdPL41UW1xd9GiXvSM4iwBdh2GOwS6QiOzd+GFEDHWeXei9HNoG+n/IBarxGpO9g8ipje
	dk8AuTFinulDZbADEAgb+SBCkhsr5JXwz/EwbzCZ+Lv4dutE7Cp3b0hbr2vW2cQtSZVpGFjJ76551
	8ZL+rt7MGiL1Bvn6L93On2ZTkYPgIX/J1pxApGqJhMApzaCEeh6WWPHy8ldA6Hk292BFydV13gaeD
	aDMY7UFuzJWtZ4DtHH7oPmhVA6YnLVRLKkD6dwRIsVI9fgqBZySSlrHKfYgHJDGojWTVqcWI1TPQ9
	vzFh1HUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7Zw-004PjY-1Z;
	Wed, 02 Aug 2023 08:51:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7Zs-004Pij-0g;
	Wed, 02 Aug 2023 08:51:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E24BC6187C;
	Wed,  2 Aug 2023 08:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D5EC433CD;
	Wed,  2 Aug 2023 08:51:26 +0000 (UTC)
Message-ID: <dca6f8c2-7d80-14fb-0090-7b10b1da13c2@xs4all.nl>
Date: Wed, 2 Aug 2023 10:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3,1/2] media: mediatek: vcodec: Fix possible invalid
 memory access for decoder
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230729034735.17213-1-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230729034735.17213-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_015132_353610_8824876E 
X-CRM114-Status: GOOD (  28.93  )
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

On 29/07/2023 05:47, Yunfei Dong wrote:
> The vpu maybe null pointer or unreasonable value when scp crash, need to
> validate that the vpu pointer and the vpu instance within this context is
> valid in case of leading to kernel reboot.
> 
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reported-by: Steve Cho <stevecho@google.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> - compared with v2:
> - rewrite the commit message for patch 01 and 02.
> - add Reported-by and Fixes tag.
> - fix smatch fail for patch 02/2.
> ---
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
>  .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 77 ++++++++++++-------
>  2 files changed, 52 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 6c318de25a55e..7e36b2c69b7d1 100644
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
>  
>  	struct vdec_msg_queue msg_queue;
> +	void *vpu_inst;
>  
>  	bool is_10bit_bitstream;
>  };
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 82c3dc8c41273..23cfe5c6c90b7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -72,6 +72,21 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
>  	}
>  }
>  
> +static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, struct vdec_vpu_inst *vpu)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx;
> +	int ret = false;
> +
> +	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
> +		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
> +			ret = true;
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
> @@ -84,44 +99,51 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
>   */
>  static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
>  {
> +	struct mtk_vcodec_dec_dev *dec_dev;
>  	const struct vdec_vpu_ipi_ack *msg = data;
> -	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
> -					(unsigned long)msg->ap_inst_addr;
> +	struct vdec_vpu_inst *vpu;
>  
> -	if (!vpu) {
> +	dec_dev = (struct mtk_vcodec_dec_dev *)priv;
> +	vpu = (struct vdec_vpu_inst *)(unsigned long)msg->ap_inst_addr;
> +	if (!priv || !vpu) {
>  		mtk_v4l2_vdec_err(vpu->ctx, "ap_inst_addr is NULL, did the SCP hang or crash?");
>  		return;
>  	}

This change results in a smatch error:

drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c:109 vpu_dec_ipi_handler() error: we previously assumed 'vpu' could be null (see line 108)

The same happens in the next patch for vpu_enc_ipi_handler.

Can you post a v4 fixing this?

Thank you!

	Hans

>  
> -	mtk_vdec_debug(vpu->ctx, "+ id=%X", msg->msg_id);
> +	if (!vpu_dec_check_ap_inst(dec_dev, vpu) || msg->msg_id < VPU_IPIMSG_DEC_INIT_ACK ||
> +	    msg->msg_id > VPU_IPIMSG_DEC_GET_PARAM_ACK) {
> +		mtk_v4l2_vdec_err(vpu->ctx, "vdec msg id not correctly => 0x%x", msg->msg_id);
> +		vpu->failure = -EINVAL;
> +		goto error;
> +	}
>  
>  	vpu->failure = msg->status;
> -	vpu->signaled = 1;
> +	if (msg->status != 0)
> +		goto error;
>  
> -	if (msg->status == 0) {
> -		switch (msg->msg_id) {
> -		case VPU_IPIMSG_DEC_INIT_ACK:
> -			handle_init_ack_msg(data);
> -			break;
> +	switch (msg->msg_id) {
> +	case VPU_IPIMSG_DEC_INIT_ACK:
> +		handle_init_ack_msg(data);
> +		break;
>  
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
>  
> -		case VPU_IPIMSG_DEC_GET_PARAM_ACK:
> -			handle_get_param_msg_ack(data);
> -			break;
> -		default:
> -			mtk_vdec_err(vpu->ctx, "invalid msg=%X", msg->msg_id);
> -			break;
> -		}
> +	case VPU_IPIMSG_DEC_GET_PARAM_ACK:
> +		handle_get_param_msg_ack(data);
> +		break;
> +	default:
> +		mtk_vdec_err(vpu->ctx, "invalid msg=%X", msg->msg_id);
> +		break;
>  	}
>  
> -	mtk_vdec_debug(vpu->ctx, "- id=%X", msg->msg_id);
> +error:
> +	vpu->signaled = 1;
>  }
>  
>  static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
> @@ -182,9 +204,10 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>  
>  	init_waitqueue_head(&vpu->wq);
>  	vpu->handler = vpu_dec_ipi_handler;
> +	vpu->ctx->vpu_inst = vpu;
>  
>  	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
> -					 vpu->handler, "vdec", NULL);
> +					 vpu->handler, "vdec", vpu->ctx->dev);
>  	if (err) {
>  		mtk_vdec_err(vpu->ctx, "vpu_ipi_register fail status=%d", err);
>  		return err;
> @@ -193,7 +216,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>  	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
>  		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
>  						 vpu->core_id, vpu->handler,
> -						 "vdec", NULL);
> +						 "vdec", vpu->ctx->dev);
>  		if (err) {
>  			mtk_vdec_err(vpu->ctx, "vpu_ipi_register core fail status=%d", err);
>  			return err;


