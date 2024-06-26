Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2FC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 12:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8ijXjV5omOiDY1f2EAX6SK0fpFhI+S33azFMpJk0EQ=; b=aMR/bxe9BDH6fR1YREPCyx+QXM
	Gke6fJev9neW3u8NK8DisoivYYZWfTSmnzb/H/7EVmGd7/TlsbJDzgiB8ipmOgkmwiVjYFvmUsmHE
	eXVqPY3tQxWs06VfeLnW/jI4x/Mi4xJy/PzPDVZT5VzwY+5gC/rqN4MfdcY8EjLo8lmxOkzzUXvHv
	hrg7ZRyPr+2RQq5eOmJixoVS9+qA8dvlyuZdaKcTmOabYG9YDxpsmxPZfq90zMRvPk5FrTFA0mJyp
	IL2mwxHob+QwZbiuz3uTKLtRo8xuf0SwzKT8VY6saEq5W3npYFDm6SS6vdwn/J3qxDWESGAFiFRMC
	veZhbPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMRfX-00000006jcc-0SJ2;
	Wed, 26 Jun 2024 12:22:35 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMRfO-00000006jb6-00VM;
	Wed, 26 Jun 2024 12:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719404541;
	bh=4gqb6RUV9FtRsFLGLj5xiIJHjnN/nEoE7x+LdmuRdXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h2C9SLJHO8i/nTWz2ClEullVShnsHLY3q9PKP03eH+08DwvwmGkOTk8I0Dwjw3vIQ
	 84M5mTvw0GvNxVdXhXr2dY0ebJtbzfatUzvOJTwehFAPynOGYK8RLv1lL0nXA+/gCp
	 qtJWuMM6SP39fHzYnVBmzwulR/5gBZMwvJE5tTY/zxmup0UNZxV/XbTGIcGLEB5m3r
	 DwarYtj20JcuNiN78PPkUchrKe2ogkbtxkouZyK/BUxgaTg8c6oaWcaxHsLFGl9BJM
	 43FPTgrdberdnS5GoX9jSgmHYfQu7soO4d/ha94ykmaOBaH6eBBa8Q/kCVpSG2uvkg
	 gzKWKWm37hyHA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1E339378202E;
	Wed, 26 Jun 2024 12:22:21 +0000 (UTC)
Message-ID: <1268bc19-bcd8-4101-8683-3ddeab278250@collabora.com>
Date: Wed, 26 Jun 2024 14:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: mediatek: jpeg: support 34bits
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240625125611.29145-1-jianhua.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240625125611.29145-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_052226_475169_E4BAA635 
X-CRM114-Status: GOOD (  26.13  )
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

Il 25/06/24 14:56, Jianhua Lin ha scritto:
> the iommu HW supported 34bits iova space(16GB),
> but mediatek jpeg enc/dec driver still is 32bit,
> then need to set the bit32/bit33 iova to jpeg HW.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
> Changes compared with v1:
> - used of_property_read_bool instead.
> - used the ternary operator instead.
> - added comment to explain the multiplier.
> - cleaned up coding style warning max line length.
> 
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 10 +++-
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  2 +
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 59 +++++++++++++++----
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 +++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 45 ++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  | 11 +++-
>   7 files changed, 117 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index ac48658e2de4..5e3053f99dda 100644
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
> @@ -1317,6 +1318,11 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> +	if (of_property_read_bool(pdev->dev.of_node, "mediatek,34bits"))

This is per-SoC, and if one SoC supports 34-bits, it always does: this means that
you don't need this property.

Add it to mtk8195_jpegdec_drvdata and mtk8195_jpegenc_drvdata.

> +		jpeg->support_34bit = true;
> +
> +	dev_info(&pdev->dev, "use 34bits: %d", jpeg->support_34bit);

Also, this print is not necessary; if you really really want it (but I don't see
the sense of that), please use dev_dbg().

> +
>   	if (!jpeg->variant->multi_core) {
>   		ret = mtk_jpeg_single_core_init(pdev, jpeg);
>   		if (ret) {
> @@ -1564,7 +1570,8 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
>   	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>   	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>   
> -	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> +			ctx->jpeg->support_34bit);

jpeg->variant->support_34bits

>   	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
>   
>   	buf_state = VB2_BUF_STATE_DONE;
> @@ -1764,6 +1771,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>   	ctx->total_frame_num++;
>   	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>   	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> +				jpeg->support_34bit,
>   				&jpeg_src_buf->dec_param,
>   				jpeg_src_buf->bs_size,
>   				&bs,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 8ba6e757e11a..42f9af8d2e2a 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -209,6 +209,7 @@ struct mtk_jpegdec_comp_dev {
>    * @reg_decbase:	jpg decode register base addr
>    * @dec_hw_dev:	jpg decode hardware device
>    * @hw_index:		jpg hw index
> + * @support_34bit:	flag to check if support dma_address 34bit
>    */
>   struct mtk_jpeg_dev {
>   	struct mutex		lock;
> @@ -231,6 +232,7 @@ struct mtk_jpeg_dev {
>   	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
>   	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
>   	atomic_t hw_index;
> +	bool support_34bit;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 4a6ee211e18f..931eb99c44b7 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -270,7 +270,7 @@ void mtk_jpeg_dec_reset(void __iomem *base)
>   EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
>   
>   static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
> -					u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
> +				u8 yscale_h, u8 uvscale_w, u8 uvscale_h)

I suppose this was accidental....

>   {
>   	u32 val;
>   
> @@ -279,23 +279,43 @@ static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
>   	writel(val, base + JPGDEC_REG_BRZ_FACTOR);
>   }
>   
> -static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, u32 addr_y,
> -				       u32 addr_u, u32 addr_v)
> +static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, bool support_34bit,
> +		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)
>   {
> +	u32 val;
> +
>   	mtk_jpeg_verify_align(addr_y, 16, JPGDEC_REG_DEST_ADDR0_Y);
>   	writel(addr_y, base + JPGDEC_REG_DEST_ADDR0_Y);
>   	mtk_jpeg_verify_align(addr_u, 16, JPGDEC_REG_DEST_ADDR0_U);
>   	writel(addr_u, base + JPGDEC_REG_DEST_ADDR0_U);
>   	mtk_jpeg_verify_align(addr_v, 16, JPGDEC_REG_DEST_ADDR0_V);
>   	writel(addr_v, base + JPGDEC_REG_DEST_ADDR0_V);
> +	if (support_34bit) {
> +		val = upper_32_bits(addr_y) & 0x3;

So you want the first 2 bits of the upper 32 bits of addr_y?

#define DESCRIPTION_OF_THOSE_TWO_BITS	GENMASK(1, 0)

u32 upper;

upper = upper_32_bits(addr_y);
writel(FIELD_PREP(DESCRIPTION_OF_THOSE_TWO_BITS, upper), ...... etc)

> +		writel(val, base + JPGDEC_REG_DEST_ADDR0_Y_EXT);
> +		val = upper_32_bits(addr_u) & 0x3;
> +		writel(val, base + JPGDEC_REG_DEST_ADDR0_U_EXT);
> +		val = upper_32_bits(addr_v) & 0x3;
> +		writel(val, base + JPGDEC_REG_DEST_ADDR0_V_EXT);
> +	}
>   }
>   
> -static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, u32 addr_y,
> -				       u32 addr_u, u32 addr_v)
> +static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, bool support_34bit,
> +		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)
>   {
> +	u32 val;
> +
>   	writel(addr_y, base + JPGDEC_REG_DEST_ADDR1_Y);
>   	writel(addr_u, base + JPGDEC_REG_DEST_ADDR1_U);
>   	writel(addr_v, base + JPGDEC_REG_DEST_ADDR1_V);
> +	if (support_34bit) {
> +		val = upper_32_bits(addr_y) & 0x3;

same here

> +		writel(val, base + JPGDEC_REG_DEST_ADDR1_Y_EXT);
> +		val = upper_32_bits(addr_u) & 0x3;
> +		writel(val, base + JPGDEC_REG_DEST_ADDR1_U_EXT);
> +		val = upper_32_bits(addr_v) & 0x3;
> +		writel(val, base + JPGDEC_REG_DEST_ADDR1_V_EXT);
> +	}
>   }
>   
>   static void mtk_jpeg_dec_set_mem_stride(void __iomem *base, u32 stride_y,
> @@ -322,18 +342,31 @@ static void mtk_jpeg_dec_set_dec_mode(void __iomem *base, u32 mode)
>   	writel(mode & 0x03, base + JPGDEC_REG_OPERATION_MODE);
>   }
>   
> -static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, u32 ptr)
> +static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base,
> +				bool support_34bit, dma_addr_t ptr)
>   {
> +	u32 val;
> +
>   	mtk_jpeg_verify_align(ptr, 16, JPGDEC_REG_FILE_BRP);
>   	writel(ptr, base + JPGDEC_REG_FILE_BRP);
> +	if (support_34bit) {
> +		val = upper_32_bits(ptr) & 0x3;

and same here

> +		writel(val, base + JPGDEC_REG_FILE_BRP_EXT);
> +	}
>   }
>   
> -static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size,
> -				     u32 bitstream_size)
> +static void mtk_jpeg_dec_set_bs_info(void __iomem *base, bool support_34bit,
> +		dma_addr_t addr, u32 size, u32 bitstream_size)
>   {
> +	u32 val;
> +
>   	mtk_jpeg_verify_align(addr, 16, JPGDEC_REG_FILE_ADDR);
>   	mtk_jpeg_verify_align(size, 128, JPGDEC_REG_FILE_TOTAL_SIZE);
>   	writel(addr, base + JPGDEC_REG_FILE_ADDR);
> +	if (support_34bit) {
> +		val = upper_32_bits(addr) & 0x3;

ditto

> +		writel(val, base + JPGDEC_REG_FILE_ADDR_EXT);
> +	}
>   	writel(size, base + JPGDEC_REG_FILE_TOTAL_SIZE);
>   	writel(bitstream_size, base + JPGDEC_REG_BIT_STREAM_SIZE);
>   }
> @@ -404,6 +437,7 @@ static void mtk_jpeg_dec_set_sampling_factor(void __iomem *base, u32 comp_num,
>   }
>   
>   void mtk_jpeg_dec_set_config(void __iomem *base,
> +			     bool support_34bits,
>   			     struct mtk_jpeg_dec_param *cfg,
>   			     u32 bitstream_size,
>   			     struct mtk_jpeg_bs *bs,
> @@ -413,8 +447,9 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>   	mtk_jpeg_dec_set_dec_mode(base, 0);
>   	mtk_jpeg_dec_set_comp0_du(base, cfg->unit_num);
>   	mtk_jpeg_dec_set_total_mcu(base, cfg->total_mcu);
> -	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size, bitstream_size);
> -	mtk_jpeg_dec_set_bs_write_ptr(base, bs->end_addr);
> +	mtk_jpeg_dec_set_bs_info(base, support_34bits, bs->str_addr,
> +				       bs->size, bitstream_size);
> +	mtk_jpeg_dec_set_bs_write_ptr(base, support_34bits, bs->end_addr);
>   	mtk_jpeg_dec_set_du_membership(base, cfg->membership, 1,
>   				       (cfg->comp_num == 1) ? 1 : 0);
>   	mtk_jpeg_dec_set_comp_id(base, cfg->comp_id[0], cfg->comp_id[1],
> @@ -432,9 +467,9 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>   				    cfg->mem_stride[1]);
>   	mtk_jpeg_dec_set_img_stride(base, cfg->img_stride[0],
>   				    cfg->img_stride[1]);
> -	mtk_jpeg_dec_set_dst_bank0(base, fb->plane_addr[0],
> +	mtk_jpeg_dec_set_dst_bank0(base, support_34bits, fb->plane_addr[0],
>   				   fb->plane_addr[1], fb->plane_addr[2]);
> -	mtk_jpeg_dec_set_dst_bank1(base, 0, 0, 0);
> +	mtk_jpeg_dec_set_dst_bank1(base, support_34bits, 0, 0, 0);
>   	mtk_jpeg_dec_set_dma_group(base, cfg->dma_mcu, cfg->dma_group,
>   				   cfg->dma_last_mcu);
>   	mtk_jpeg_dec_set_pause_mcu_idx(base, cfg->total_mcu);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
> index 8c31c6b12417..2948c9c300a4 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
> @@ -71,6 +71,7 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param);
>   u32 mtk_jpeg_dec_get_int_status(void __iomem *dec_reg_base);
>   u32 mtk_jpeg_dec_enum_result(u32 irq_result);
>   void mtk_jpeg_dec_set_config(void __iomem *base,
> +			     bool support_34bits,
>   			     struct mtk_jpeg_dec_param *cfg,
>   			     u32 bitstream_size,
>   			     struct mtk_jpeg_bs *bs,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
> index 27b7711ca341..e94f52de7c69 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
> @@ -46,5 +46,13 @@
>   #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
>   #define JPGDEC_REG_STATUS		0x0278
>   #define JPGDEC_REG_BIT_STREAM_SIZE	0x0344
> +#define JPGDEC_REG_DEST_ADDR0_Y_EXT	0x0360
> +#define JPGDEC_REG_DEST_ADDR0_U_EXT	0x0364
> +#define JPGDEC_REG_DEST_ADDR0_V_EXT	0x0368
> +#define JPGDEC_REG_DEST_ADDR1_Y_EXT	0x036c
> +#define JPGDEC_REG_DEST_ADDR1_U_EXT	0x0370
> +#define JPGDEC_REG_DEST_ADDR1_V_EXT	0x0374
> +#define JPGDEC_REG_FILE_ADDR_EXT	0x0378
> +#define JPGDEC_REG_FILE_BRP_EXT		0x037c
>   
>   #endif /* _MTK_JPEG_REG_H */
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index f8fa3b841ccf..0c654afd987e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -62,9 +62,15 @@ void mtk_jpeg_enc_reset(void __iomem *base)
>   }
>   EXPORT_SYMBOL_GPL(mtk_jpeg_enc_reset);
>   
> -u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit)
>   {
> -	return readl(base + JPEG_ENC_DMA_ADDR0) -
> +	/*
> +	 * The dma addr0 to be shifted left by 2 bits
> +	 * for support greater than 4G address.
> +	 */
> +	u32 value = (support_34bit) ? 4 : 1;

u8 shift = support_34bits ? 2 : 0
return (readl(base + JPEG_ENC_DMA_ADDR0) << shift) - readl.......

> +
> +	return readl(base + JPEG_ENC_DMA_ADDR0) * value -
>   	       readl(base + JPEG_ENC_DST_ADDR0);
>   }
>   EXPORT_SYMBOL_GPL(mtk_jpeg_enc_get_file_size);
> @@ -75,6 +81,13 @@ void mtk_jpeg_enc_start(void __iomem *base)
>   
>   	value = readl(base + JPEG_ENC_CTRL);
>   	value |= JPEG_ENC_CTRL_INT_EN_BIT | JPEG_ENC_CTRL_ENABLE_BIT;
> +	/*
> +	 * Enable hw auto padding for height is not 16 alignment,
> +	 * to ensure decoder downscales is correct.
> +	 */

This is not part of the 34-bits support, is it?!
Goes to a different commit.

> +	value |= JPEG_ENC_CTRL_RDMA_PADDING_EN;
> +	value |= JPEG_ENC_CTRL_RDMA_RIGHT_PADDING_EN;
> +	value &= ~JPEG_ENC_CTRL_RDMA_PADDING_0_EN;
>   	writel(value, base + JPEG_ENC_CTRL);
>   }
>   EXPORT_SYMBOL_GPL(mtk_jpeg_enc_start);

Regards,
Angelo


