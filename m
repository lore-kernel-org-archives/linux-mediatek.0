Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A16C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiLbjMB01LOnFnPEifsGIaFUfHw5df24MQCQIrXCMcM=; b=VcxkWHJZgRdnG7uOobDvB3+vIO
	QDYna4fB1YidTnTVtL+WfJz1/miIM34UsE4qcNVqIl3mAfM4EeMQm6Xr8QULxTm7qFVa7IKmm9dh3
	khEGK5l54WuzhFTBQvaAqK8XQnRigWRnISZzvbHDLBZ7dQDnDWMqXMddN/+nlzyX7wY2EGWa8raI8
	ruYa+47k5jXUrmnzINgpxnL2Sn389MZ46cJV5fo3OWjlIjPer4qop9QR9DlE+ihWLz8v9t1kToFoz
	KdOJWJ4SPwmbU8jbR+mTYTOd9wHETeL9YKD1kz3LNgcKdsh1DzlSXu51t8XznV0ZEyVdfBWENMbxH
	ynicE+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPht-0000000BHDD-0oF9;
	Mon, 29 Jul 2024 12:42:29 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPhQ-0000000BH5s-4BCZ;
	Mon, 29 Jul 2024 12:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722256919;
	bh=X2u0PrWontZeldcDpL+njEQwMDia9hCQv81wis8dBZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zDIMeh0KQ57DH7NdTsBL1i5R22tUOSs33l+APLxNicDEnocmlSDFe7YGBKzUhQsYg
	 KcJi6lIdBhrDlPPF9PBtsPqmPO8GrtyPjQlDGVCSh/Q7bkax57y1k4/fXgVbqY/Mv7
	 22BxG+F7nw9zuefRiT0dbbI/N/dZdgAZNF1OM58yJiQSIzCowrJuUntD3t/VeicCd/
	 T3/875y2VBHgiOEbd4msgw5NsVLZaz0k8YGO+sFLiK64kwM5ovVQhXn3aqOii8+u9q
	 FykHVw409xZoImd55I5O6WJMv7EhWZP/4VDWi8pbNYxkXBwGhvOT6Ij4iFh/dqRLbG
	 WgkpulPZQudQA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 194A437804D4;
	Mon, 29 Jul 2024 12:41:59 +0000 (UTC)
Message-ID: <ae3a3925-0c34-4e05-8786-f76debadab9a@collabora.com>
Date: Mon, 29 Jul 2024 14:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] media: mediatek: jpeg: support 34bits
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240728120140.25135-1-jianhua.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240728120140.25135-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_054201_227814_A8B0F3D2 
X-CRM114-Status: GOOD (  22.62  )
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

Il 28/07/24 14:01, Jianhua Lin ha scritto:
> the iommu HW supported 34bits iova space(16GB),
> but mediatek jpeg enc/dec driver still is 32bit,
> then need to set the bit32/bit33 iova to jpeg HW.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
> Changes compared with v2:
> - remove dev_info() to print 34bits support info.
> - keep of_property_read_bool() to check 34bits status,
>    because need to compatible old soc.
> - use FIELD_PREP() and GENMASK() to generate bit mask.
> - remove rdma pandig enable code, because the code not
>    related to 34bit support.
>   
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  8 ++-
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 59 +++++++++++++++----
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 +++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 44 ++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 ++-
>   7 files changed, 111 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index ac48658e2de4..abee5ee5c6e3 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1030,6 +1030,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
>   	spin_lock_irqsave(&jpeg->hw_lock, flags);
>   	mtk_jpeg_dec_reset(jpeg->reg_base);
>   	mtk_jpeg_dec_set_config(jpeg->reg_base,
> +				jpeg->support_34bit,
>   				&jpeg_src_buf->dec_param,
>   				jpeg_src_buf->bs_size,
>   				&bs,
> @@ -1317,6 +1318,9 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> +	if (of_property_read_bool(pdev->dev.of_node, "mediatek,34bits"))

I seem to remember that I already reviewed this part and said that this is a SoC
capability, meaning that one SoC either always does, or always doesn't support
34-bits IOVA.

This means that this **shall not** be a devicetree property, but *must* be set in
the platform data (mtk_jpeg_variant) for the specific SoC supporting that.

> +		jpeg->support_34bit = true;
> +
>   	if (!jpeg->variant->multi_core) {
>   		ret = mtk_jpeg_single_core_init(pdev, jpeg);
>   		if (ret) {
> @@ -1564,7 +1568,8 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
>   	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>   	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>   
> -	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> +			ctx->jpeg->support_34bit);
>   	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
>   
>   	buf_state = VB2_BUF_STATE_DONE;
> @@ -1764,6 +1769,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>   	ctx->total_frame_num++;
>   	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>   	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> +				jpeg->support_34bit,
>   				&jpeg_src_buf->dec_param,
>   				jpeg_src_buf->bs_size,
>   				&bs,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 8ba6e757e11a..bf65bb54a035 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -34,6 +34,8 @@
>   
>   #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
>   
> +#define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
> +
>   /**
>    * enum mtk_jpeg_ctx_state - states of the context state machine
>    * @MTK_JPEG_INIT:		current state is initialized
> @@ -209,6 +211,7 @@ struct mtk_jpegdec_comp_dev {
>    * @reg_decbase:	jpg decode register base addr
>    * @dec_hw_dev:	jpg decode hardware device
>    * @hw_index:		jpg hw index
> + * @support_34bit:	flag to check if support dma_address 34bit
>    */
>   struct mtk_jpeg_dev {
>   	struct mutex		lock;
> @@ -231,6 +234,7 @@ struct mtk_jpeg_dev {
>   	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
>   	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
>   	atomic_t hw_index;
> +	bool support_34bit;

...and you don't need to add this member here, as struct mtk_jpeg_dev
already has a pointer to mtk_jpeg_variant, which will contain the same
member from platform data.

Regards,
Angelo



