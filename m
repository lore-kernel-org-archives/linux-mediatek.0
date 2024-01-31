Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E5DC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MUD9HTI1e0BY5P2+rcAvV/RfzBprzDJcgshNjTcI5g=; b=JD8zKk0SxO4l13oupDjH7JIsBz
	ku0quVI/ZifyTCDOBk+s/zJlSSlLrzgzUySFtvfMxefoE7TL12/qQ4hb5FGJoHHm3xzmOYPNXzNjB
	L4DMPq4Ln+JIIQDUz2u4XXUK/siIwBfuGNmsqg2Jooous/tj6a6YeHU8rVX4HitggvWqepMf6xfGA
	GdMxnzSESsQZMp7CULlQBRM6EaIzxrYUH+RVK552rcYi4oFyQwGNrsw4d2Ojv865zatuaZ9/hFfsD
	1hiiNPnLWfM5AI/1usA+uGP2dLnykkwsmaCmDEvyrDXCnjLKHUVf9MmdmXJ1e5XqQtKtSSPMgawNx
	FDa818pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAZV-00000003b9H-0hM4;
	Wed, 31 Jan 2024 13:24:09 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAZS-00000003b6O-1mul
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 13:24:07 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso4768592a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706707443; x=1707312243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MUD9HTI1e0BY5P2+rcAvV/RfzBprzDJcgshNjTcI5g=;
        b=VG43lfZsB1gQM66+hVHVaD/RQV6tmbkCzhOStuUJ5iwdxgxLbpiFeyXl5zsm3CrRTm
         ONIftkZMyIJ+72D1w7yff4Ec7fLBduwRQDH1ti/NkVNothg/CulEC4CwRGSj33Dc9CqM
         EHJxOjbHwHAmXIGD1h/AgrkZH1Raj4K+GBiyhyTfGs/TFP8Gsh9UI6G1yO1NQWcFoaNq
         rqOmfjjp4YP1aJiFqiOYQt+Drx58dIG+4uypy98BKqZgb0H7FRXMwKFbtVfR1E6lKS6A
         JYX7N3zaYIMrqNBCHfnIHU9JhparQC0se6CDH2UwE/NBxZKdvcvJtmgMk9y4tipvYaaW
         RyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706707443; x=1707312243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MUD9HTI1e0BY5P2+rcAvV/RfzBprzDJcgshNjTcI5g=;
        b=hToJtocuPk2yvKC4LjkoBt6Jv+63ZpyrPhGuUDbKn00uqKPQqc/GUmAZHhLubPKYdU
         dX49rsOpvM7VzI/BoakGfQ1Rrtn0L4yCU8hTmnzLC/rkPxkLhvT4Xx/BmZI1UxHcTAix
         DyW1XOYdyStF0rEPgukag5o8Vxh8Fa61HC7hAzeRWVOwy9PoMNXmmufX/ttTdO+vumSI
         ujwd8JGHDX78SV84qEMnBFGJwSFd7bwydlxHKwviPoi2uLX2fKnQH4dnw/l1tTYyMm9Y
         qzC8qDBBAjk8TFqr1Fo4owlFxJKBiL0osaJIhbqCDSl4Mh6i+TOX2vcH+rUoYQ/HE3Jq
         xd4w==
X-Gm-Message-State: AOJu0YwLEgb3ZUxVelqTKh1N/BBNM5pr8djx9nGFxFQCyE7u9JDUvKYx
	5pgpcRxd/R5yO2V/rUdl2R9HTt820+r9/5it3T1IPeelq6hhJyAyXfVNbnKhw3w=
X-Google-Smtp-Source: AGHT+IGsArhQ0W4XwCtuYHmCXvO2RCbEUYwLVnXG7bbJ2f+RWm7qp6uth4/WrrGNVLWi0nMCiDAGlA==
X-Received: by 2002:a05:6402:5213:b0:55f:7fe9:c567 with SMTP id s19-20020a056402521300b0055f7fe9c567mr1328202edd.1.1706707443454;
        Wed, 31 Jan 2024 05:24:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXAPb1qAxujL6HdXhhSE+sVLYyv05T+1t6zsGllhHznYzX/PMaaMWlWlwdKflV/rE2cW6o74D6P5/MgaRBL50x8hpKC6rdV3SXCT9jg9Ji7TUTPz1pNeBhWMlWC+IfLrPd0B2vhwyNDuizmS32810JX3sqf5JT7V+AQ99g6Rel+10bREe21Sb5EO1A/Omzzjn3QIfCT/mujA2BEUIiu1zZv+0CqUv1MaxkOh7cqm9rocuXEHmjyBszU0xvEJlv0mjNYLCS1XoDJxpzUAq/rfM/zz5jpOFPEGrdjrd9xf/22brANqKdr5Qe7xJD4RBSiEgBrJJf/AkA4q95VBK8PXrnB0jaX78Q7eDv8e+05u79LxxjkpSzKapxDjRADUQkvVUGL4Bo/Fj0g6gCjTSX4jQxfKFGNVzoFUx5kWAFx1+ygTUek7Rz2OKpqQXwb937CLkXtvDD2DA7yqDKv1A+/fqrKg8HBoUNNJECbkjLwH8g99VV5sbLqL0YhV3CLc4Xcu7CMQMVNnwPCTGD4XqyeQSQ8hrz1YCxpBWplY+sPHVREe6iy1/GkJs/OwqCglwcC7CFTSolo9DSTLmRDrk1UhGOFe31qbec+gOCKSWxxr4s6abJlSI8f+navK+6YHoPncMiXIizZv3QIiI1Z4891Tkb4pYAedqs2PA0AE1Wv9C7i3ka9bfYsDX09/hNrgQkhQ1xjUVADtWzUmG0UrwpYOJEmhjfGBkgglntxHOt+hgbn4N4VuA1QdBjYw1CU8N7CJzmVLwtLZaliIjELEvthoIM2ibY5DXpSs5qu9XM59tf609gL0qEP4IFy3iwMydPTmAqogjjmV03dipumTSNdoFHa55YPC2eQ3OyH5nA5YOEQrE4ElC5koxoXVb43SA5OoTdRfnAD93eKIz+BlAAfzx/hqxYe+pKpm1gX8Qh3wS2YqK9fF05r6BlYh117YgypN339P3
 9xHWP4A+bTltjSuhLbMpZNEOGvejoeqZB4
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com. [81.231.61.187])
        by smtp.gmail.com with ESMTPSA id et6-20020a056402378600b0055eeb5f0efcsm3641516edb.58.2024.01.31.05.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 05:24:02 -0800 (PST)
Date: Wed, 31 Jan 2024 14:24:00 +0100
From: Joakim Bech <joakim.bech@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
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
	linux-mediatek@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>,
	Pekka Paalanen <ppaalanen@gmail.com>, jianjiao.zeng@mediatek.com,
	kuohong.wang@mediatek.com, youlin.pei@mediatek.com
Subject: Re: [PATCH v4 2/7] dma-buf: heaps: Initialize a restricted heap
Message-ID: <20240131132400.h3hklvnjjp3pelqz@pop-os.localdomain>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240112092014.23999-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_052406_553674_74250039 
X-CRM114-Status: GOOD (  29.07  )
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

On Fri, Jan 12, 2024 at 05:20:09PM +0800, Yong Wu wrote:
> Initialize a restricted heap. Currently just add a null heap, Prepare for
> the later patches.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig           |  9 ++++
>  drivers/dma-buf/heaps/Makefile          |  3 +-
>  drivers/dma-buf/heaps/restricted_heap.c | 67 +++++++++++++++++++++++++
>  drivers/dma-buf/heaps/restricted_heap.h | 22 ++++++++
>  4 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap.c
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap.h
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c4226..e54506f480ea 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
>  	  Choose this option to enable dma-buf CMA heap. This heap is backed
>  	  by the Contiguous Memory Allocator (CMA). If your system has these
>  	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_RESTRICTED
> +	bool "DMA-BUF Restricted Heap"
> +	depends on DMABUF_HEAPS
> +	help
> +	  Choose this option to enable dma-buf restricted heap. The purpose of this
> +	  heap is to manage buffers that are inaccessible to the kernel and user space.
> +	  There may be several ways to restrict it, for example it may be encrypted or
> +	  protected by a TEE or hypervisor. If in doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 974467791032..a2437c1817e2 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)	+= restricted_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
> new file mode 100644
> index 000000000000..fd7c82abd42e
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF restricted heap exporter
> + *
> + * Copyright (C) 2024 MediaTek Inc.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +
> +#include "restricted_heap.h"
> +
> +static struct dma_buf *
> +restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
> +			 unsigned long fd_flags, unsigned long heap_flags)
> +{
> +	struct restricted_buffer *restricted_buf;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct dma_buf *dmabuf;
> +	int ret;
> +
> +	restricted_buf = kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
> +	if (!restricted_buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	restricted_buf->size = ALIGN(size, PAGE_SIZE);
> +	restricted_buf->heap = heap;
> +
> +	exp_info.exp_name = dma_heap_get_name(heap);
> +	exp_info.size = restricted_buf->size;
> +	exp_info.flags = fd_flags;
> +	exp_info.priv = restricted_buf;
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
> +	kfree(restricted_buf);
> +	return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops restricted_heap_ops = {
> +	.allocate = restricted_heap_allocate,
> +};
> +
> +int restricted_heap_add(struct restricted_heap *rstrd_heap)
>
Nothing wrong, but what about shortening rstrd_heap throughout the patch
set to "rheap", I would find that easier to read.

> +{
> +	struct dma_heap_export_info exp_info;
> +	struct dma_heap *heap;
> +
> +	exp_info.name = rstrd_heap->name;
> +	exp_info.ops = &restricted_heap_ops;
> +	exp_info.priv = (void *)rstrd_heap;
> +
> +	heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(heap))
> +		return PTR_ERR(heap);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(restricted_heap_add);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
> new file mode 100644
> index 000000000000..443028f6ba3b
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Restricted heap Header.
> + *
> + * Copyright (C) 2024 MediaTek, Inc.
> + */
> +
> +#ifndef _DMABUF_RESTRICTED_HEAP_H_
> +#define _DMABUF_RESTRICTED_HEAP_H_
> +
> +struct restricted_buffer {
> +	struct dma_heap		*heap;
> +	size_t			size;
> +};
> +
> +struct restricted_heap {
> +	const char		*name;
> +};
> +
> +int restricted_heap_add(struct restricted_heap *rstrd_heap);
> +
> +#endif
> -- 
> 2.25.1
> 

-- 
// Regards
Joakim

