Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2885E80AB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwpuJVrljR01ya7iLJlB/BxIx7PRZ9f1GPx1GjjrYe8=; b=1C49y4w4r+bz/85m59mBu6GPrh
	jaFTsZIWQ/9khPqcM1VaknnrbDReVqT76FcytnKhgMaRNuNBszzeTwfSkH/d/bDJLMRKQnVLeZOzy
	sBqaHfefTcflI169bsM2dc0AvgcY0iCpCankys88/lebXk9+DFqKJVZTezvfGHnyfIglZYtO9X4w+
	hfWauLim19wdkLO1xJkqkb7L0e7clr3VwfZQcx4i8yaoQ3ZoT0yTXY+CuwiEd9++sGpKj8X/jHCdN
	9pPM70CThIISpvHYUhhWbgUPOB72vwVWbBcbHmqmSiYtZwaVkuHzqYrYLZFAVGKe7wpU4lNPULcb+
	Bqq5RhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVfE-0019Bc-1J;
	Wed, 27 Sep 2023 14:37:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVfB-0019AN-08
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Sep 2023 14:37:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c136ee106so1416421566b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Sep 2023 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695825433; x=1696430233; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwpuJVrljR01ya7iLJlB/BxIx7PRZ9f1GPx1GjjrYe8=;
        b=O7set0ZtWwUSZYhT1cqSC5tao6cz+WIa1RQzEczX7Tvm25Go3NeQU8eTm8pcwIhJwU
         ny7y2Czd7pwM8S1RW9zgcqQ5xtzAEYJwdnO00iVai3ixt+Qj199shNt9WdW7eASe6zjK
         v8VRHkiz/I8mVaFGs7bY6if9SDY8OTSQCbzS2BYXB7eN56SKEctbGRijYFkAh960y4C8
         AnmigdI2lmoh89SVXT5JMtpvcAn72+oI1LQ8xWaLraMrhjHxar/TIZVB4GW7QERflLMi
         w8mZ+fqaBfp+bkXGDj2nHiMP3jNTuPWGo1OxcUVj+H2KUlPxGBgKtPQwU1pR15XF3ZuL
         etNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825433; x=1696430233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwpuJVrljR01ya7iLJlB/BxIx7PRZ9f1GPx1GjjrYe8=;
        b=OH6rzgXPUItw9Ob23+fZ2ArxKPZ2czVMwUPfIVt3tz8ryFXdUi6FrJ1WjB3oe5KYyq
         XvKYSjm5OGSAI4RKEri4tlc/53GYAlHp2ARuTPvzzM00DSzW76prxEbekiqcEejZbvm2
         6oN4oXQaHs1B8FnT+bqniwUiI5zq0tjA1cWQGhj5XB2/v/C1ujwBT8pD6U4zimlP/J4R
         FkNb4QkpVuio70p7GELDAQKfmG3zrdNj8INYsKpS291mH/ms7YgSUfwOHEcsZoiVhFxT
         GjKbsTgGRhHq0Bce7qNC4abkuGPb7PMYoaAUUjDe7jPRAQ2bBCnvOVzg4qO+P4r/wLqo
         hsPQ==
X-Gm-Message-State: AOJu0YxGZOOOEAJN1wmnP9nbCYbSwwKR3beHUc+35We3w/3iSD1IRAUu
	1Tiq/Z+RT94LH8GJCH+DZD5mLw==
X-Google-Smtp-Source: AGHT+IE24BySFabmbygoup96UaV3lWsfthbehjSORDi1CarIOCzrFCMCEesG7lkPLlYbBFWt6f/70Q==
X-Received: by 2002:a17:907:7611:b0:9a1:bd53:b23 with SMTP id jx17-20020a170907761100b009a1bd530b23mr2067824ejc.14.1695825433013;
        Wed, 27 Sep 2023 07:37:13 -0700 (PDT)
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com. [81.231.61.187])
        by smtp.gmail.com with ESMTPSA id k8-20020a170906a38800b0099bc2d1429csm9411039ejz.72.2023.09.27.07.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:37:12 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:37:09 +0200
From: Joakim Bech <joakim.bech@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, tjmercier@google.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, jianjiao.zeng@mediatek.com,
	kuohong.wang@mediatek.com, Anan Sun <anan.sun@mediatek.com>
Subject: Re: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Message-ID: <20230927143709.hrytde34trrdhpwf@pop-os.localdomain>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-7-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_073717_085522_03C70D7E 
X-CRM114-Status: GOOD (  30.84  )
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

On Mon, Sep 11, 2023 at 10:30:35AM +0800, Yong Wu wrote:
> Add TEE service call for secure memory allocating/freeing.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/mtk_secure_heap.c | 69 ++++++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
> index e3da33a3d083..14c2a16a7164 100644
> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> @@ -17,6 +17,9 @@
>  
>  #define MTK_TEE_PARAM_NUM		4
>  
> +#define TZCMD_MEM_SECURECM_UNREF	7
> +#define TZCMD_MEM_SECURECM_ZALLOC	15
This is related to the discussion around UUID as well. These numbers
here are specific to the MediaTek TA. If we could make things more
generic, then these should probably be 0 and 1. 

I also find the naming a bit heavy, I think I'd suggest something like:
# define TEE_CMD_SECURE_HEAP_ZALLOC ...
and so on.

> +
>  /*
>   * MediaTek secure (chunk) memory type
>   *
> @@ -29,6 +32,8 @@ enum kree_mem_type {
The "kree" here, is that meant to indicate kernel REE? If yes, then I
guess that could be dropped since we know we're already in the kernel
context, perhaps instead name it something with "secure_heap_type"?

>  struct mtk_secure_heap_buffer {
>  	struct dma_heap		*heap;
>  	size_t			size;
> +
> +	u32			sec_handle;
>  };
>  
>  struct mtk_secure_heap {
> @@ -80,6 +85,63 @@ static int mtk_kree_secure_session_init(struct mtk_secure_heap *sec_heap)
>  	return ret;
>  }
>  
> +static int
> +mtk_sec_mem_tee_service_call(struct tee_context *tee_ctx, u32 session,
> +			     unsigned int command, struct tee_param *params)
> +{
> +	struct tee_ioctl_invoke_arg arg = {0};
> +	int ret;
> +
> +	arg.num_params = MTK_TEE_PARAM_NUM;
> +	arg.session = session;
> +	arg.func = command;
> +
> +	ret = tee_client_invoke_func(tee_ctx, &arg, params);
> +	if (ret < 0 || arg.ret) {
> +		pr_err("%s: cmd %d ret %d:%x.\n", __func__, command, ret, arg.ret);
> +		ret = -EOPNOTSUPP;
> +	}
> +	return ret;
> +}
Perhaps not relevant for this patch set, but since this function is just
a pure TEE call, I'm inclined to suggest that this could even be moved
out as a generic TEE function. I.e., something that could be used
elsewhere in the Linux kernel.

> +
> +static int mtk_sec_mem_allocate(struct mtk_secure_heap *sec_heap,
> +				struct mtk_secure_heap_buffer *sec_buf)
> +{
> +	struct tee_param params[MTK_TEE_PARAM_NUM] = {0};
> +	u32 mem_session = sec_heap->mem_session;
How about name it tee_session? Alternative ta_session? I think that
would better explain what it actually is.

> +	int ret;
> +
> +	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	params[0].u.value.a = SZ_4K;			/* alignment */
> +	params[0].u.value.b = sec_heap->mem_type;	/* memory type */
> +	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	params[1].u.value.a = sec_buf->size;
> +	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
> +
> +	/* Always request zeroed buffer */
> +	ret = mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
> +					   TZCMD_MEM_SECURECM_ZALLOC, params);
> +	if (ret)
> +		return -ENOMEM;
> +
> +	sec_buf->sec_handle = params[2].u.value.a;
> +	return 0;
> +}
> +
> +static void mtk_sec_mem_release(struct mtk_secure_heap *sec_heap,
> +				struct mtk_secure_heap_buffer *sec_buf)
> +{
> +	struct tee_param params[MTK_TEE_PARAM_NUM] = {0};
> +	u32 mem_session = sec_heap->mem_session;
> +
> +	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	params[0].u.value.a = sec_buf->sec_handle;
> +	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
Perhaps worth having a comment for params[1] explain why we need the
VALUE_OUTPUT here?

-- 
// Regards
Joakim

> +
> +	mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
> +				     TZCMD_MEM_SECURECM_UNREF, params);
> +}
> +
>  static struct dma_buf *
>  mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>  		      unsigned long fd_flags, unsigned long heap_flags)
> @@ -107,6 +169,9 @@ mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>  	sec_buf->size = size;
>  	sec_buf->heap = heap;
>  
> +	ret = mtk_sec_mem_allocate(sec_heap, sec_buf);
> +	if (ret)
> +		goto err_free_buf;
>  	exp_info.exp_name = dma_heap_get_name(heap);
>  	exp_info.size = sec_buf->size;
>  	exp_info.flags = fd_flags;
> @@ -115,11 +180,13 @@ mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>  	dmabuf = dma_buf_export(&exp_info);
>  	if (IS_ERR(dmabuf)) {
>  		ret = PTR_ERR(dmabuf);
> -		goto err_free_buf;
> +		goto err_free_sec_mem;
>  	}
>  
>  	return dmabuf;
>  
> +err_free_sec_mem:
> +	mtk_sec_mem_release(sec_heap, sec_buf);
>  err_free_buf:
>  	kfree(sec_buf);
>  	return ERR_PTR(ret);
> -- 
> 2.25.1
> 

