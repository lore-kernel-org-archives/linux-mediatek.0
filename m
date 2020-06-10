Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EE1C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 07:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547C12064C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 07:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YjZw6FAC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XxFv/go/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547C12064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuN0eA3HprO8rGhhV3qxcY98bZU7bXKgbN8W5bkCrIs=; b=YjZw6FAC6g8frM
	3O2qKYJF63f3bqgDJlkesK9jr2xSOZykteReepvF5IchMeNidyFneXpR4uYO/BD5OrRHTv2/G3AMS
	SSmkVGVz858u91xfpUpQJFZRYE5Lzoq0JRhTkbPAWqs2LICluV6HYYD+ic7jLQDmKwdI61+L9d8b0
	rvPeLMVWksJ6gfFOav7oXES8fm9qe/JS0cGE9jqZFos9jq1cUrOcL1waPOkDgc6/xNYhmxPR6aq/R
	tTAmEu2YXGHWVJYfoby2IDYXKk3t357dWhTbQMXmP/dR3WAaomQxkMxkTzRB5FRaEqHTZzt819SBV
	c8iVAdsvYy/VJ4gYEiIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiv4c-0001Wp-0M; Wed, 10 Jun 2020 07:22:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiv4Y-0001WG-Vj
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 07:22:57 +0000
X-UUID: 2fb6e35b2fa841a0ab9ed2b369052e5d-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yxZyzQ4N4/uG8IYK4Zubs37Msgse0LpyCm7ATH5DYgw=; 
 b=XxFv/go/1A8NV0PbUInAZXPHv2Nwrz0dzMkBe1YcuN5erHiO16NRjSwYXXTD+ddnQBdjAAkTvWREOlKZXsyxlvC7XwKSdwNsyKtDPWVP3pNw/FCt3CjOaSOiT1GVc1vwT4hoTpuvSMNJ3ikAdtF3tfA/DlbE9gW/I6bN+ZboteE=;
X-UUID: 2fb6e35b2fa841a0ab9ed2b369052e5d-20200609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1517506864; Tue, 09 Jun 2020 23:22:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 00:22:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 15:22:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Jun 2020 15:22:42 +0800
Message-ID: <1591773763.21260.2.camel@mtksdaap41>
Subject: Re: [PATCH 03/10] media: mtk-vcodec: venc: support SCP firmware
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 10 Jun 2020 15:22:43 +0800
In-Reply-To: <20200520082723.96136-4-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-4-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_002255_041750_CB21E841 
X-CRM114-Status: GOOD (  19.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Pi-Hsun
 Shih <pihsun@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Support the new extended firmware used by MT8183's encoder.
> 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 12 +++
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 34 ++++---
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   | 65 +++++++++++--
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  3 +-
>  .../media/platform/mtk-vcodec/venc_drv_if.h   |  6 ++
>  .../media/platform/mtk-vcodec/venc_ipi_msg.h  | 15 ++-
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 97 +++++++++++++------
>  .../media/platform/mtk-vcodec/venc_vpu_if.h   |  3 +-
>  8 files changed, 181 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index e132c4ec463a..45c8adfc6a0c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -300,6 +300,17 @@ struct mtk_vcodec_ctx {
>  
>  };
>  
> +/**
> + * struct mtk_vcodec_enc_pdata - compatible data for each IC
> + *
> + * @uses_ext: whether the encoder uses the extended firmware messaging format
> + * @has_lt_irq: whether the encoder uses the LT irq
> + */
> +struct mtk_vcodec_enc_pdata {
> +	bool uses_ext;
> +	bool has_lt_irq;
> +};
> +
>  /**
>   * struct mtk_vcodec_dev - driver data
>   * @v4l2_dev: V4L2 device to register video devices for.
> @@ -348,6 +359,7 @@ struct mtk_vcodec_dev {
>  	spinlock_t irqlock;
>  	struct mtk_vcodec_ctx *curr_ctx;
>  	void __iomem *reg_base[NUM_MAX_VCODEC_REG_BASE];
> +	const struct mtk_vcodec_enc_pdata *venc_pdata;
>  
>  	struct mtk_vcodec_fw *fw_handler;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 42530cd01a30..922bc8883811 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -244,6 +244,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	if (IS_ERR(dev->fw_handler))
>  		return PTR_ERR(dev->fw_handler);
>  
> +	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
>  	ret = mtk_vcodec_init_enc_pm(dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to get mt vcodec clock source!");
> @@ -278,21 +279,24 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		ret = -EINVAL;
>  		goto err_res;
>  	}
> +	disable_irq(dev->enc_irq);
>  
> -	dev->enc_lt_irq = platform_get_irq(pdev, 1);
> -	ret = devm_request_irq(&pdev->dev,
> -			       dev->enc_lt_irq, mtk_vcodec_enc_lt_irq_handler,
> -			       0, pdev->name, dev);
> -	if (ret) {
> -		dev_err(&pdev->dev,
> -			"Failed to install dev->enc_lt_irq %d (%d)",
> -			dev->enc_lt_irq, ret);
> -		ret = -EINVAL;
> -		goto err_res;
> +	if (dev->venc_pdata->has_lt_irq) {
> +		dev->enc_lt_irq = platform_get_irq(pdev, 1);
> +		ret = devm_request_irq(&pdev->dev,
> +				       dev->enc_lt_irq,
> +				       mtk_vcodec_enc_lt_irq_handler,
> +				       0, pdev->name, dev);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"Failed to install dev->enc_lt_irq %d (%d)",
> +				dev->enc_lt_irq, ret);
> +			ret = -EINVAL;
> +			goto err_res;
> +		}
> +		disable_irq(dev->enc_lt_irq); /* VENC_LT */
>  	}
>  
> -	disable_irq(dev->enc_irq);
> -	disable_irq(dev->enc_lt_irq); /* VENC_LT */
>  	mutex_init(&dev->enc_mutex);
>  	mutex_init(&dev->dev_mutex);
>  	spin_lock_init(&dev->irqlock);
> @@ -373,8 +377,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
> +	.has_lt_irq = true,
> +};
> +
>  static const struct of_device_id mtk_vcodec_enc_match[] = {
> -	{.compatible = "mediatek,mt8173-vcodec-enc",},
> +	{.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index 7a00f050ec36..050787b2896c 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -24,6 +24,16 @@ static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
>  #define H264_FILLER_MARKER_SIZE ARRAY_SIZE(h264_filler_marker)
>  #define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
>  
> +/*
> + * enum venc_h264_frame_type - h264 encoder output bitstream frame type
> + */
> +enum venc_h264_frame_type {
> +	VENC_H264_IDR_FRM,
> +	VENC_H264_I_FRM,
> +	VENC_H264_P_FRM,
> +	VENC_H264_B_FRM,
> +};
> +
>  /*
>   * enum venc_h264_vpu_work_buf - h264 encoder buffer index
>   */
> @@ -137,7 +147,8 @@ struct venc_h264_inst {
>  	struct mtk_vcodec_mem work_bufs[VENC_H264_VPU_WORK_BUF_MAX];
>  	struct mtk_vcodec_mem pps_buf;
>  	bool work_buf_allocated;
> -	unsigned int frm_cnt;
> +	u32 frm_cnt;	/* declared as u32 to properly overflow */
> +	unsigned int skip_frm_cnt;
>  	unsigned int prepend_hdr;
>  	struct venc_vpu_inst vpu_inst;
>  	struct venc_h264_vsi *vsi;
> @@ -327,6 +338,22 @@ static unsigned int h264_enc_wait_venc_done(struct venc_h264_inst *inst)
>  	return irq_status;
>  }
>  
> +static int h264_frame_type(struct venc_h264_inst *inst)
> +{
> +	if ((inst->vsi->config.gop_size != 0 &&
> +		(inst->frm_cnt % inst->vsi->config.gop_size) == 0) ||
> +		(inst->frm_cnt == 0 && inst->vsi->config.gop_size == 0)) {
> +		/* IDR frame */
> +		return VENC_H264_IDR_FRM;
> +	} else if ((inst->vsi->config.intra_period != 0 &&
> +		(inst->frm_cnt % inst->vsi->config.intra_period) == 0) ||
> +		(inst->frm_cnt == 0 && inst->vsi->config.intra_period == 0)) {
> +		/* I frame */
> +		return VENC_H264_I_FRM;
> +	} else {
> +		return VENC_H264_P_FRM;  /* Note: B frames are not supported */
> +	}
> +}
>  static int h264_encode_sps(struct venc_h264_inst *inst,
>  			   struct mtk_vcodec_mem *bs_buf,
>  			   unsigned int *bs_size)
> @@ -337,7 +364,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
>  	mtk_vcodec_debug_enter(inst);
>  
>  	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
> -			     bs_buf, bs_size);
> +			     bs_buf, bs_size, NULL);
>  	if (ret)
>  		return ret;
>  
> @@ -364,7 +391,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
>  	mtk_vcodec_debug_enter(inst);
>  
>  	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
> -			     bs_buf, bs_size);
> +			     bs_buf, bs_size, NULL);
>  	if (ret)
>  		return ret;
>  
> @@ -410,13 +437,24 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>  {
>  	int ret = 0;
>  	unsigned int irq_status;
> +	struct venc_frame_info frame_info;
>  
>  	mtk_vcodec_debug_enter(inst);
> -
> +	/* Overflowing back to 0 is ok and expected here */
> +	inst->frm_cnt++;
> +	mtk_vcodec_debug(inst, "frm_cnt++ = %d\n ", inst->frm_cnt);
> +	frame_info.frm_cnt = inst->frm_cnt;
> +	frame_info.skip_frm_cnt = inst->skip_frm_cnt;
> +	frame_info.frm_type = h264_frame_type(inst);
> +	mtk_vcodec_debug(inst, "frm_cnt++ = %d,skip_frm_cnt =%d,frm_type=%d.\n",
> +		frame_info.frm_cnt, frame_info.skip_frm_cnt,
> +		frame_info.frm_type);
>  	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
> -			     bs_buf, bs_size);
> -	if (ret)
> +			     bs_buf, bs_size, &frame_info);
> +	if (ret) {
> +		inst->frm_cnt--;
>  		return ret;
> +	}
>  
>  	/*
>  	 * skip frame case: The skip frame buffer is composed by vpu side only,
> @@ -427,19 +465,19 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>  		memcpy(bs_buf->va,
>  		       inst->work_bufs[VENC_H264_VPU_WORK_BUF_SKIP_FRAME].va,
>  		       *bs_size);
> -		++inst->frm_cnt;
> +		++inst->skip_frm_cnt;
>  		return ret;
>  	}
>  
>  	irq_status = h264_enc_wait_venc_done(inst);
>  	if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
>  		mtk_vcodec_err(inst, "irq_status=%d failed", irq_status);
> +		inst->frm_cnt--;
>  		return -EIO;
>  	}
>  
>  	*bs_size = h264_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
>  
> -	++inst->frm_cnt;
>  	mtk_vcodec_debug(inst, "frm %d bs_size %d key_frm %d <-",
>  			 inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
>  
> @@ -464,6 +502,7 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
>  
>  static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
>  {
> +	const bool is_ext = ctx->dev->venc_pdata->uses_ext;
>  	int ret = 0;
>  	struct venc_h264_inst *inst;
>  
> @@ -473,8 +512,9 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
>  
>  	inst->ctx = ctx;
>  	inst->vpu_inst.ctx = ctx;
> -	inst->vpu_inst.id = IPI_VENC_H264;
> +	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
>  	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_SYS);
> +	inst->frm_cnt = 0xffffffff;
>  
>  	mtk_vcodec_debug_enter(inst);
>  
> @@ -629,7 +669,12 @@ static int h264_enc_set_param(void *handle,
>  		inst->prepend_hdr = 1;
>  		mtk_vcodec_debug(inst, "set prepend header mode");
>  		break;
> -
> +	case VENC_SET_PARAM_FORCE_INTRA:
> +	case VENC_SET_PARAM_GOP_SIZE:
> +	case VENC_SET_PARAM_INTRA_PERIOD:
> +		inst->frm_cnt = 0xffffffff;
> +		inst->skip_frm_cnt = 0;
> +		fallthrough;
>  	default:
>  		ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
>  		break;
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 6426af514526..11abb191ada5 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -302,7 +302,8 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
>  
>  	mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
>  
> -	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size);
> +	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
> +			     NULL);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> index 52fc9cc812fc..51b52625ca22 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> @@ -92,6 +92,12 @@ struct venc_enc_param {
>  	unsigned int gop_size;
>  };
>  
> +struct venc_frame_info {
> +	unsigned int frm_cnt;		/* per frame update */
> +	unsigned int skip_frm_cnt;	/* per frame update */
> +	unsigned int frm_type;		/* per frame update */
> +};
> +
>  /*
>   * struct venc_frm_buf - frame buffer information used in venc_if_encode()
>   * @fb_addr: plane frame buffer addresses
> diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> index 28ee04ca6241..4cafbf92d9cd 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> @@ -51,17 +51,22 @@ struct venc_ap_ipi_msg_init {
>   * @vpu_inst_addr:	VPU encoder instance addr
>   *			(struct venc_vp8_vsi/venc_h264_vsi *)
>   * @param_id:	parameter id (venc_set_param_type)
> - * @data_item:	number of items in the data array
> + * @num_data:	number of items in the data array
>   * @data[8]:	data array to store the set parameters
>   */
>  struct venc_ap_ipi_msg_set_param {
>  	uint32_t msg_id;
>  	uint32_t vpu_inst_addr;
>  	uint32_t param_id;
> -	uint32_t data_item;
> +	uint32_t num_data;
>  	uint32_t data[8];
>  };
>  
> +struct venc_ap_ipi_msg_set_param_ext {
> +	struct venc_ap_ipi_msg_set_param base;
> +	uint32_t data_ext[24];
> +};
> +
>  /**
>   * struct venc_ap_ipi_msg_enc - AP to VPU enc cmd structure
>   * @msg_id:	message id (AP_IPIMSG_XXX_ENC_ENCODE)
> @@ -82,6 +87,12 @@ struct venc_ap_ipi_msg_enc {
>  	uint32_t bs_size;
>  };
>  
> +struct venc_ap_ipi_msg_enc_ext {
> +	struct venc_ap_ipi_msg_enc base;
> +	uint32_t data_item;
> +	uint32_t data[32];
> +};
> +
>  /**
>   * struct venc_ap_ipi_msg_deinit - AP to VPU deinit cmd structure
>   * @msg_id:	message id (AP_IPIMSG_XXX_ENC_DEINIT)
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index 53854127814b..6c77bf025172 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -116,49 +116,81 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
>  	return 0;
>  }
>  
> +static unsigned int venc_enc_param_crop_right(struct venc_vpu_inst *vpu,
> +					      struct venc_enc_param *enc_prm)
> +{
> +	unsigned int img_crop_right = enc_prm->buf_width - enc_prm->width;
> +
> +	return img_crop_right % 16;
> +}
> +
> +static unsigned int venc_enc_param_crop_bottom(struct venc_enc_param *enc_prm)
> +{
> +	return round_up(enc_prm->height, 16) - enc_prm->height;
> +}
> +
> +static unsigned int venc_enc_param_num_mb(struct venc_enc_param *enc_prm)
> +{
> +	return DIV_ROUND_UP(enc_prm->width, 16) *
> +	       DIV_ROUND_UP(enc_prm->height, 16);
> +}
> +
>  int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  		      enum venc_set_param_type id,
>  		      struct venc_enc_param *enc_param)
>  {
> -	struct venc_ap_ipi_msg_set_param out;
> +	const bool is_ext = vpu->ctx->dev->venc_pdata->uses_ext;
> +	size_t msg_size = is_ext ?
> +		sizeof(struct venc_ap_ipi_msg_set_param_ext) :
> +		sizeof(struct venc_ap_ipi_msg_set_param);
> +	struct venc_ap_ipi_msg_set_param_ext out;
>  
>  	mtk_vcodec_debug(vpu, "id %d ->", id);
>  
>  	memset(&out, 0, sizeof(out));
> -	out.msg_id = AP_IPIMSG_ENC_SET_PARAM;
> -	out.vpu_inst_addr = vpu->inst_addr;
> -	out.param_id = id;
> +	out.base.msg_id = AP_IPIMSG_ENC_SET_PARAM;
> +	out.base.vpu_inst_addr = vpu->inst_addr;
> +	out.base.param_id = id;
>  	switch (id) {
>  	case VENC_SET_PARAM_ENC:
> -		out.data_item = 0;
> +		if (is_ext) {
> +			out.base.num_data = 3;
> +			out.base.data[0] =
> +				venc_enc_param_crop_right(vpu, enc_param);
> +			out.base.data[1] =
> +				venc_enc_param_crop_bottom(enc_param);
> +			out.base.data[2] = venc_enc_param_num_mb(enc_param);
> +		} else {
> +			out.base.num_data = 0;
> +		}
>  		break;
>  	case VENC_SET_PARAM_FORCE_INTRA:
> -		out.data_item = 0;
> +		out.base.num_data = 0;
>  		break;
>  	case VENC_SET_PARAM_ADJUST_BITRATE:
> -		out.data_item = 1;
> -		out.data[0] = enc_param->bitrate;
> +		out.base.num_data = 1;
> +		out.base.data[0] = enc_param->bitrate;
>  		break;
>  	case VENC_SET_PARAM_ADJUST_FRAMERATE:
> -		out.data_item = 1;
> -		out.data[0] = enc_param->frm_rate;
> +		out.base.num_data = 1;
> +		out.base.data[0] = enc_param->frm_rate;
>  		break;
>  	case VENC_SET_PARAM_GOP_SIZE:
> -		out.data_item = 1;
> -		out.data[0] = enc_param->gop_size;
> +		out.base.num_data = 1;
> +		out.base.data[0] = enc_param->gop_size;
>  		break;
>  	case VENC_SET_PARAM_INTRA_PERIOD:
> -		out.data_item = 1;
> -		out.data[0] = enc_param->intra_period;
> +		out.base.num_data = 1;
> +		out.base.data[0] = enc_param->intra_period;
>  		break;
>  	case VENC_SET_PARAM_SKIP_FRAME:
> -		out.data_item = 0;
> +		out.base.num_data = 0;
>  		break;
>  	default:
>  		mtk_vcodec_err(vpu, "id %d not supported", id);
>  		return -EINVAL;
>  	}
> -	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
> +	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
>  		mtk_vcodec_err(vpu,
>  			       "AP_IPIMSG_ENC_SET_PARAM %d fail", id);
>  		return -EINVAL;
> @@ -172,33 +204,44 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>  		   struct venc_frm_buf *frm_buf,
>  		   struct mtk_vcodec_mem *bs_buf,
> -		   unsigned int *bs_size)
> +		   unsigned int *bs_size,
> +		   struct venc_frame_info *frame_info)
>  {
> -	struct venc_ap_ipi_msg_enc out;
> +	const bool is_ext = vpu->ctx->dev->venc_pdata->uses_ext;
> +	size_t msg_size = is_ext ?
> +		sizeof(struct venc_ap_ipi_msg_enc_ext) :
> +		sizeof(struct venc_ap_ipi_msg_enc);
> +	struct venc_ap_ipi_msg_enc_ext out;
>  
>  	mtk_vcodec_debug(vpu, "bs_mode %d ->", bs_mode);
>  
>  	memset(&out, 0, sizeof(out));
> -	out.msg_id = AP_IPIMSG_ENC_ENCODE;
> -	out.vpu_inst_addr = vpu->inst_addr;
> -	out.bs_mode = bs_mode;
> +	out.base.msg_id = AP_IPIMSG_ENC_ENCODE;
> +	out.base.vpu_inst_addr = vpu->inst_addr;
> +	out.base.bs_mode = bs_mode;
>  	if (frm_buf) {
>  		if ((frm_buf->fb_addr[0].dma_addr % 16 == 0) &&
>  		    (frm_buf->fb_addr[1].dma_addr % 16 == 0) &&
>  		    (frm_buf->fb_addr[2].dma_addr % 16 == 0)) {
> -			out.input_addr[0] = frm_buf->fb_addr[0].dma_addr;
> -			out.input_addr[1] = frm_buf->fb_addr[1].dma_addr;
> -			out.input_addr[2] = frm_buf->fb_addr[2].dma_addr;
> +			out.base.input_addr[0] = frm_buf->fb_addr[0].dma_addr;
> +			out.base.input_addr[1] = frm_buf->fb_addr[1].dma_addr;
> +			out.base.input_addr[2] = frm_buf->fb_addr[2].dma_addr;
>  		} else {
>  			mtk_vcodec_err(vpu, "dma_addr not align to 16");
>  			return -EINVAL;
>  		}
>  	}
>  	if (bs_buf) {
> -		out.bs_addr = bs_buf->dma_addr;
> -		out.bs_size = bs_buf->size;
> +		out.base.bs_addr = bs_buf->dma_addr;
> +		out.base.bs_size = bs_buf->size;
>  	}
> -	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
> +	if (is_ext && frame_info) {
> +		out.data_item = 3;
> +		out.data[0] = frame_info->frm_cnt;
> +		out.data[1] = frame_info->skip_frm_cnt;
> +		out.data[2] = frame_info->frm_type;
> +	}
> +	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
>  		mtk_vcodec_err(vpu, "AP_IPIMSG_ENC_ENCODE %d fail",
>  			       bs_mode);
>  		return -EINVAL;
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> index edd411621b68..f9be9cab7ff7 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> @@ -45,7 +45,8 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>  		   struct venc_frm_buf *frm_buf,
>  		   struct mtk_vcodec_mem *bs_buf,
> -		   unsigned int *bs_size);
> +		   unsigned int *bs_size,
> +		   struct venc_frame_info *frame_info);
>  int vpu_enc_deinit(struct venc_vpu_inst *vpu);
>  
>  #endif

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
