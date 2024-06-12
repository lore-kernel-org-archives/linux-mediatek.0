Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD90AC27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 05:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhTcYBsCM+Mbg92p9SQKrJMtUFN9/26AX/bqLUidx8Y=; b=B4IZPJ9xrR7bmvscn5eskOMbGn
	YAPeOmD2SZ/TixGJ8aCT2XwQeuEWlLRVMLkQFMr/j9Kxs9sdCmdTuu9baPGFLH/pQK0N5jfjoR7WG
	cDVkDvQ1lVsvSVRs0YUE6+ERG1zoyx94CsLkI8OX3mGTgtjKB78a/tCVis12fiU/R1SZpsCIPNHR9
	w4LHMARJBB9I0OiUvAtbgChXA5vkUHWROAk4zUBSniGOM37Vcx/zb6C9Nj0g479S3AcC0Dw7bK0kp
	hAeHrJQvDKzqqegFILnsD8e/hWPAUJHIlssS2l2wAomRBFk59oQHVd7tBisXjVwCB/T6wWIP/Tp94
	HQF/cH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHGRi-0000000B8Wy-14QI;
	Wed, 12 Jun 2024 05:22:54 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHGRf-0000000B8VI-22TU
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jun 2024 05:22:53 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-627ebbefd85so74039897b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 22:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718169767; x=1718774567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhTcYBsCM+Mbg92p9SQKrJMtUFN9/26AX/bqLUidx8Y=;
        b=IdMuhju9Wt0wkG5x8byENMgaT+C4Z29ePIVCtf89/iJXq2v/TOYi2x1XzAzIPVqDEf
         vKJhIB/R2lGdKPZ+Dqxd95zxXgQ4dA8xMWYkuLltZrySfuSHftWi1rl/m1OpeRqBoNoZ
         iRm0epnp5kGvQPChf7TJcKxmFW7OoI0RPGAYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169767; x=1718774567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhTcYBsCM+Mbg92p9SQKrJMtUFN9/26AX/bqLUidx8Y=;
        b=MYxJ6u51fh5BdP/UCtBVY8I+AaQfKBIOtJ8qSwUn2Ht0m7i6EJx9fsMRSgAZLFf452
         uVNFgwgCCkk8AMdg4X27C4U3j2JtbfTzfAuFfiO1ylUOMfQk/GbbjHDIyXTBLEnEo08u
         yyhkOF9dUg2hl1EdNCqwi3U2n60RtwyFoC9Khh93zESpAnREd6XYnIingKxcyP5c6KV1
         9QvUqRyvyqIj1SwQkBmpE+tmFX4pTnYZ61g0x+LMpwNEupFy79dXgcMaq5xuy1BV4Jdz
         j1mA3yFWgZeo96dzOMdPo5MHgww3Si90fml6aNuB90FyxpzHZ4XltTlCbJGvnJdEUXiw
         1KEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1r2aUdaPbDRTvl6d0dtdSpQwHJqocgJL18XrMawfaCGarwaCmW4mAL597rxAcqfiE01OF8VhH7dDHvcDpBuyLFsPYSHoCu9+RM92nPdMxnOF8
X-Gm-Message-State: AOJu0YzsR9iVhctvNOLPnp9whYeLSePd8MBjZe2RoYU4euZA2cbf2MSU
	2ZdX/myhf9fLMYvAyYSuh0s5MeLpDDNKJrkBd/EDTC1MMd9b2k0IcndIf7EDv7Vvvu/yQraPSqR
	rhg==
X-Google-Smtp-Source: AGHT+IEppKCyK/JSHnKcsXHzDq3ew+qYkvjNGKJpUa5VhAjqTgQihMv3DtChdSvf6MwsluIQgolTGg==
X-Received: by 2002:a05:690c:6612:b0:61b:14a8:7944 with SMTP id 00721157ae682-62fc9ebfa84mr8344767b3.39.1718169766976;
        Tue, 11 Jun 2024 22:22:46 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ef51579csm76355645ad.112.2024.06.11.22.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:22:46 -0700 (PDT)
Date: Wed, 12 Jun 2024 14:22:40 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
Message-ID: <4a5tf2cl744xzqslox4ddzmdpuvwksr54g3qk2jl4soatdts45@e6xmmm2ijmv6>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-13-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516122102.16379-13-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_222251_543085_8C77E488 
X-CRM114-Status: GOOD (  31.01  )
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

On Thu, May 16, 2024 at 08:20:50PM +0800, Yunfei Dong wrote:
> Need to call dma heap interface to allocate/free secure memory when playing
> secure video.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/platform/mediatek/vcodec/Kconfig    |   1 +
>  .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122 +++++++++++++++++-
>  .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
>  3 files changed, 123 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
> index bc8292232530..707865703e61 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> @@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
>  	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
>  	depends on MTK_SCP || !MTK_SCP
>  	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
> +	depends on DMABUF_HEAPS
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
>  	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> index c60e4c193b25..5958dcd7965a 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> @@ -5,9 +5,11 @@
>  *	Tiffany Lin <tiffany.lin@mediatek.com>
>  */
>  
> +#include <linux/dma-heap.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
> +#include <uapi/linux/dma-heap.h>
>  
>  #include "../decoder/mtk_vcodec_dec_drv.h"
>  #include "../encoder/mtk_vcodec_enc_drv.h"
> @@ -45,7 +47,7 @@ int mtk_vcodec_write_vdecsys(struct mtk_vcodec_dec_ctx *ctx, unsigned int reg,
>  }
>  EXPORT_SYMBOL(mtk_vcodec_write_vdecsys);
>  
> -int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
> +static int mtk_vcodec_mem_alloc_nor(void *priv, struct mtk_vcodec_mem *mem)
>  {
>  	enum mtk_instance_type inst_type = *((unsigned int *)priv);
>  	struct platform_device *plat_dev;
> @@ -75,9 +77,71 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
>  
> -void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> +static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *mem)
> +{
> +	struct device *dev = &ctx->dev->plat_dev->dev;
> +	struct dma_buf *dma_buffer;
> +	struct dma_heap *vdec_heap;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	unsigned long size = mem->size;
> +	int ret = 0;
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	vdec_heap = dma_heap_find("restricted_mtk_cma");
> +	if (!vdec_heap) {
> +		mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
> +		return -EPERM;
> +	}

How is the heap name determined here? My recollection is that the heap
name comes from the heap node in the DT, so it may vary depending on the
board.

Is the heap name documented anywhere in the DT bindings?

Shouldn't we rather query DT for a phandle to the right heap?

> +
> +	dma_buffer = dma_heap_buffer_alloc(vdec_heap, size, DMA_HEAP_VALID_FD_FLAGS,
> +					   DMA_HEAP_VALID_HEAP_FLAGS);
> +	if (IS_ERR_OR_NULL(dma_buffer)) {
> +		mtk_v4l2_vdec_err(ctx, "dma heap alloc size=0x%lx failed!", size);
> +		return PTR_ERR(dma_buffer);

This will be incorrect if NULL was returned, because the function will
return 0. Does dma_heap_buffer_alloc() actually return NULL?

> +	}
> +
> +	attach = dma_buf_attach(dma_buffer, dev);
> +	if (IS_ERR_OR_NULL(attach)) {
> +		mtk_v4l2_vdec_err(ctx, "dma attach size=0x%lx failed!", size);
> +		ret = PTR_ERR(attach);

Ditto.

> +		goto err_attach;
> +	}
> +
> +	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR_OR_NULL(sgt)) {
> +		mtk_v4l2_vdec_err(ctx, "dma map attach size=0x%lx failed!", size);
> +		ret = PTR_ERR(sgt);

Ditto.

> +		goto err_sgt;
> +	}
> +
> +	mem->va = dma_buffer;

Isn't this field supposed to point to the kernel mapping of the buffer
itself? If we need to store the dma_buf pointer, we should probably add
a separate field to avoid (potentially serious) bugs.

> +	mem->dma_addr = (dma_addr_t)sg_dma_address((sgt)->sgl);

Why is this type cast necessary here?

> +
> +	if (!mem->va || !mem->dma_addr) {

I don't think any of these 2 conditions are possible, since we already
checked for successful completion of the functions above. Also 0 is a
valid DMA address, so it shouldn't be considered an error.

> +		mtk_v4l2_vdec_err(ctx, "dma buffer size=0x%lx failed!", size);
> +		ret = -EPERM;
> +		goto err_addr;
> +	}
> +
> +	mem->attach = attach;
> +	mem->sgt = sgt;
> +
> +	return 0;
> +err_addr:

Please name the labels according to the clean-up step they perform
first, because it will make it much easier to validate at the goto point
whether it jumps to the right place.

> +	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +err_sgt:
> +	dma_buf_detach(dma_buffer, attach);
> +err_attach:
> +	dma_buf_put(dma_buffer);
> +
> +	return ret;
> +}
> +
> +static void mtk_vcodec_mem_free_nor(void *priv, struct mtk_vcodec_mem *mem)
>  {
>  	enum mtk_instance_type inst_type = *((unsigned int *)priv);
>  	struct platform_device *plat_dev;
> @@ -110,6 +174,57 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
>  	mem->dma_addr = 0;
>  	mem->size = 0;
>  }
> +
> +static void mtk_vcodec_mem_free_sec(struct mtk_vcodec_mem *mem)
> +{
> +	if (mem->sgt)
> +		dma_buf_unmap_attachment(mem->attach, mem->sgt, DMA_BIDIRECTIONAL);
> +	dma_buf_detach((struct dma_buf *)mem->va, mem->attach);
> +	dma_buf_put((struct dma_buf *)mem->va);
> +
> +	mem->attach = NULL;
> +	mem->sgt = NULL;
> +	mem->va = NULL;
> +	mem->dma_addr = 0;
> +	mem->size = 0;
> +}
> +
> +int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	enum mtk_instance_type inst_type = *((unsigned int *)priv);
> +	int ret;
> +
> +	if (inst_type == MTK_INST_DECODER) {
> +		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
> +
> +		if (dec_ctx->is_secure_playback) {
> +			ret = mtk_vcodec_mem_alloc_sec(dec_ctx, mem);
> +			goto alloc_end;

Why not just return here directly?

Best regards,
Tomasz

> +		}
> +	}
> +
> +	ret = mtk_vcodec_mem_alloc_nor(priv, mem);
> +alloc_end:
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
> +
> +void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	enum mtk_instance_type inst_type = *((unsigned int *)priv);
> +
> +	if (inst_type == MTK_INST_DECODER) {
> +		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
> +
> +		if (dec_ctx->is_secure_playback) {
> +			mtk_vcodec_mem_free_sec(mem);
> +			return;
> +		}
> +	}
> +
> +	mtk_vcodec_mem_free_nor(priv, mem);
> +}
>  EXPORT_SYMBOL(mtk_vcodec_mem_free);
>  
>  void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dec_dev *dev, int hw_idx)
> @@ -171,3 +286,4 @@ EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Mediatek video codec driver");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
> index 85f615cdd4d3..22078e757ed0 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
> @@ -18,6 +18,9 @@ struct mtk_vcodec_mem {
>  	size_t size;
>  	void *va;
>  	dma_addr_t dma_addr;
> +
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
>  };
>  
>  struct mtk_vcodec_fb {
> -- 
> 2.25.1
> 

