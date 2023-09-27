Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940EEE82CA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQa0uS9ZxVzUEvSIaoDnSyYxM+uNjYjcw68CuBARJN8=; b=c54jspI4KMliNRGTRF/Q/ulOhv
	pmjn6mGGCWuKA3rTwkN9Y5v6xuR8EW26gt6vnUrMeDurhCz5R8LqUEvIKP9/0hEM/NdioVDX+5cgq
	FE1qKTGjDk5d3u8EJ7+GbP3ZQDUdiWg8oLsI/g3M7YF2oKY2LuKf24/daff/40b61FzFNp/FZ6OW1
	OBsrQjRgdDt0U04eXy+tu6bWraoctc+7mJbHs3UtD/rJXFABwAp86j4HHD1ErntqDLh5Yj5+GCoEb
	kuXSy5hbw8W0zLDOjEn2FaikRCMYn4KSZaGFrmiein+7J1uZTFdpD6YKfbtOstC11p/gvm3PpwhWf
	21pyum9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVkL-0019ly-1T;
	Wed, 27 Sep 2023 14:42:37 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVkI-0019jO-18
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Sep 2023 14:42:35 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-533e7d127d4so9301318a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Sep 2023 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695825749; x=1696430549; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQa0uS9ZxVzUEvSIaoDnSyYxM+uNjYjcw68CuBARJN8=;
        b=P5uvcwzm/+5VYUPAe8ob0r/Hpd5wuXUblwKHPemlO81SSEWLvbBtm2ipxgDAZ0mpvp
         E4TgVJXV08HkWTefH7ryBa5MDhmOTLR291OKBF6i2cpdjmkfD0aqf9xEIemXLKlBU9/u
         fFd5O9O1e8YZ+2LbY8dW6JIkV2su+GvD08GF0jzjicrlFnVvB6ZAXAnUGENdCFEgpGeK
         I4DbqGkWLpe9E3aEy6JJIr0+L5unK1gqlm3+L1bbbd7ZkC9jkNxJw+ih0gdqncZf7E96
         Ka380ri1N/wRcvy890awLBLXCo5xz0o0ceZYYSi1xo/QrNGGkHp7woMfhstsURNkfRAO
         ggnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825749; x=1696430549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQa0uS9ZxVzUEvSIaoDnSyYxM+uNjYjcw68CuBARJN8=;
        b=mGx2pQrIeJXqATk/eV0IjQA9e5twmnFxqk6zYSsQJpr0VmPLhXmgzVwr3PlxRV/ISb
         iAmREQYVARUf0+iA4UKq3uDZkHUTD/4LkKc1sUdgXqt7XIKzKYxHGWq1TOMUPmczuCde
         0/ENXW9n7NgGfV0J1wC4Fba1YAvcG4OR8FHX2Lv/mmTNF8kRymRnjP2WbyN1gfdbvK7D
         PnqnNPDJbnD/yaFHhGfvjGg2GLy5tdL5fX0wVFV0rNJGMiGRrA6vDWnzZ0jiIeWEywt2
         4SQzXOwn0dCh35ylw9OlEDEuMComwj+XszfJd64oviZOzWyitR6KWJTbXLl+qztLD4A5
         KkkA==
X-Gm-Message-State: AOJu0Ywvv9VQp5QOtSTbEyo0kr2coN+tRtdUnmS8FLiDZI7ial7hhJQ5
	vs2g+ZUkhQ8EkGruyKC32wC+Eg==
X-Google-Smtp-Source: AGHT+IHbkXEUZ2yiICh2bDKC3XoQRoR1GzJCgOavVhuustl4JEpqTa1gx5Cc9UIMgVeGD+zgjr8MaQ==
X-Received: by 2002:a17:906:5142:b0:9b2:ba65:db21 with SMTP id jr2-20020a170906514200b009b2ba65db21mr368111ejc.45.1695825749077;
        Wed, 27 Sep 2023 07:42:29 -0700 (PDT)
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com. [81.231.61.187])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906944f00b00993928e4d1bsm9374996ejx.24.2023.09.27.07.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:42:28 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:42:26 +0200
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
	kuohong.wang@mediatek.com
Subject: Re: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Message-ID: <20230927144226.pdssel3dwv53g546@pop-os.localdomain>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_074234_398373_A2EA6995 
X-CRM114-Status: GOOD (  27.16  )
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

On Mon, Sep 11, 2023 at 10:30:33AM +0800, Yong Wu wrote:
> Initialise a mtk_svp heap. Currently just add a null heap, Prepare for
> the later patches.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig           |  8 ++
>  drivers/dma-buf/heaps/Makefile          |  1 +
>  drivers/dma-buf/heaps/mtk_secure_heap.c | 99 +++++++++++++++++++++++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/mtk_secure_heap.c
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c4226..729c0cf3eb7c 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,11 @@ config DMABUF_HEAPS_CMA
>  	  Choose this option to enable dma-buf CMA heap. This heap is backed
>  	  by the Contiguous Memory Allocator (CMA). If your system has these
>  	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_MTK_SECURE
> +	bool "DMA-BUF MediaTek Secure Heap"
> +	depends on DMABUF_HEAPS && TEE
> +	help
> +	  Choose this option to enable dma-buf MediaTek secure heap for Secure
> +	  Video Path. This heap is backed by TEE client interfaces. If in
Although this is intended for SVP right now, this is something that very
well could work for other use cases. So, I think I'd not mention "Secure
Video Path" and just mention "secure heap".

> +	  doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 974467791032..df559dbe33fe 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_MTK_SECURE)	+= mtk_secure_heap.o
> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
> new file mode 100644
> index 000000000000..bbf1c8dce23e
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF mtk_secure_heap exporter
> + *
> + * Copyright (C) 2023 MediaTek Inc.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +/*
> + * MediaTek secure (chunk) memory type
> + *
> + * @KREE_MEM_SEC_CM_TZ: static chunk memory carved out for trustzone.
nit: s/trustzone/TrustZone/

-- 
// Regards
Joakim

> + */
> +enum kree_mem_type {
> +	KREE_MEM_SEC_CM_TZ = 1,
> +};
> +
> +struct mtk_secure_heap_buffer {
> +	struct dma_heap		*heap;
> +	size_t			size;
> +};
> +
> +struct mtk_secure_heap {
> +	const char		*name;
> +	const enum kree_mem_type mem_type;
> +};
> +
> +static struct dma_buf *
> +mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
> +		      unsigned long fd_flags, unsigned long heap_flags)
> +{
> +	struct mtk_secure_heap_buffer *sec_buf;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct dma_buf *dmabuf;
> +	int ret;
> +
> +	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
> +	if (!sec_buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sec_buf->size = size;
> +	sec_buf->heap = heap;
> +
> +	exp_info.exp_name = dma_heap_get_name(heap);
> +	exp_info.size = sec_buf->size;
> +	exp_info.flags = fd_flags;
> +	exp_info.priv = sec_buf;
> +
> +	dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto err_free_buf;
> +	}
> +
> +	return dmabuf;
> +
> +err_free_buf:
> +	kfree(sec_buf);
> +	return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops mtk_sec_heap_ops = {
> +	.allocate	= mtk_sec_heap_allocate,
> +};
> +
> +static struct mtk_secure_heap mtk_sec_heap[] = {
> +	{
> +		.name		= "mtk_svp",
> +		.mem_type	= KREE_MEM_SEC_CM_TZ,
> +	},
> +};
> +
> +static int mtk_sec_heap_init(void)
> +{
> +	struct mtk_secure_heap *sec_heap = mtk_sec_heap;
> +	struct dma_heap_export_info exp_info;
> +	struct dma_heap *heap;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_sec_heap); i++, sec_heap++) {
> +		exp_info.name = sec_heap->name;
> +		exp_info.ops = &mtk_sec_heap_ops;
> +		exp_info.priv = (void *)sec_heap;
> +
> +		heap = dma_heap_add(&exp_info);
> +		if (IS_ERR(heap))
> +			return PTR_ERR(heap);
> +	}
> +	return 0;
> +}
> +
> +module_init(mtk_sec_heap_init);
> +MODULE_DESCRIPTION("MediaTek Secure Heap Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

