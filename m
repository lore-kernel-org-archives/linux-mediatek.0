Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2B4C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cDX2/TcLZZv47keVH9izOB2UPw4wXcT8INdh+8le7A=; b=GQtNRVuslX7xXxsLjH9BIpaKZ9
	AyLIKIPVtt81zcGkOmo02FQBSfvDYfij8Vk/72y7bDWzdJvKRoNUHVEKXNnSt+81/EN2sOuWtFTFd
	rYh6F6ubA675YcRitcHCob33wlF/hmIS1p853k96lEye6BALe1Zjqhzs8Lma5aoxfOHNOAniLYsAX
	kSLNYUyAqa8UmQvsP6N3jrgb3eG8ThHGXaiLYzGuqd5DWrK21wCyFiV5ixBP96nnkIjVJ4brx5OFJ
	gTqtmQHcm4dYqkyKZ1aCJCsepZZ8ptBUw748ab48UVw3F60x34fQxvoilabWyyk/DsVpWVw2Xp0pv
	7kWAawnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3P9n-001x6L-1X;
	Wed, 15 Nov 2023 23:18:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3P9i-001x4M-1V
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 23:18:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc30de471dso61305ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 15:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700090324; x=1700695124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cDX2/TcLZZv47keVH9izOB2UPw4wXcT8INdh+8le7A=;
        b=e2qCd9iLeV1UjcDGD3ZPOH443zVe+Vhhrx3SPpxbHO6DqJCXLHS8AZksv6+bHMO5b6
         oCRoJWD6Dz4/2Kfoy0gD8V0TQTKpufJpQA+sa03R0j2Crdk0B97Sv8yFjD7TMGTDiFNx
         HKwgEOcF/L2nxYdoLXvs6qswj/AqwSzaUxcospu+YoBDvCeiL5Xou55LHkJRPWpDFJz2
         0Y4eSd2lO9H5tVjxK/LQTXnH36QetQWukXVhPrlXN99izy1/yzlLl6or252/MBayCgwL
         kQA6SHMWEWUknjmT3XemWmXl9X1qhBHSkKl8StUTWmRtNqDbbRPYRRyLVquWTnGUB+s4
         IY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700090324; x=1700695124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cDX2/TcLZZv47keVH9izOB2UPw4wXcT8INdh+8le7A=;
        b=B08h998xIUnkFYJRiGAZDcdQro4qKWYkV1XoWn5nuRQqRUBQU3SB7hc5mgpOtYBSg3
         XOoXtf0NaW++cM0kwacWANZHx94xrohj5bLEvfHbTwTF7npbOZ/jv6z+sAa3e3pBscNM
         6RcZreQ8zqUThLqcnvTsLQtalMxFxDVlV8QGA4ti9LoIYBNqOSRprV2//HrsTry+mCGN
         itJJU9lS8yo5QlFF5SAHrNYWdCih4Eo6EiAR7S5xL+1kPRbH07r5FZESAAedpqc6g9w9
         kCRZiWTVmScwqMHn6APhD85uynLegYw9eiohhSohLfmXW/cZGvt3zVogd0+IOIb41DP6
         SRow==
X-Gm-Message-State: AOJu0YyFiM0ta9oWOBG/CHzfQ7QTJOWSHUTCpU3YQKQhUqP9vNZmMwmo
	67OwNPblRjBh5JnB1RPPHGkwVhm1iFcO9+JfE+YE
X-Google-Smtp-Source: AGHT+IGyoRxZw5ygDqLDB76eixVmV7Sl9Rg99pJFDrY1646vTJd9/k/9IdlRgQQs8vDIsMVb3PqED09pUEuJwebdqxU=
X-Received: by 2002:a17:902:d50f:b0:1cc:ff0:213f with SMTP id
 b15-20020a170902d50f00b001cc0ff0213fmr66975plg.2.1700090323863; Wed, 15 Nov
 2023 15:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-2-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-2-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:18:32 -0800
Message-ID: <CA+ddPcMQan85Q8KDdDub=aDe0HB3vy9dBj33ofEoM2WUhFu8Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dma-buf: heaps: Initialize a secure heap
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech <joakim.bech@linaro.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_151846_512795_BF094DA6 
X-CRM114-Status: GOOD (  32.21  )
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

On Sat, Nov 11, 2023 at 3:16=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Initialize a secure heap. Currently just add a null heap, Prepare for
> the later patches.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig       |  7 +++
>  drivers/dma-buf/heaps/Makefile      |  1 +
>  drivers/dma-buf/heaps/secure_heap.c | 98 +++++++++++++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/secure_heap.c
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfi=
g
> index a5eef06c4226..e358bf711145 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,10 @@ config DMABUF_HEAPS_CMA
>           Choose this option to enable dma-buf CMA heap. This heap is bac=
ked
>           by the Contiguous Memory Allocator (CMA). If your system has th=
ese
>           regions, you should say Y here.
> +
> +config DMABUF_HEAPS_SECURE
> +       bool "DMA-BUF Secure Heap"
> +       depends on DMABUF_HEAPS && TEE
> +       help
> +         Choose this option to enable dma-buf secure heap. This heap is =
backed by
> +         TEE client interfaces or CMA. If in doubt, say N.

Remove the mention of TEE and CMA from this.

You should probably add two KConfig options. One is for
DMABUF_HEAPS_SECURE which is for the framework for secure heaps. The
other one should be:

config MTK_DMABUF_HEAPS_SECURE
    bool "Mediatek DMA-BUF Secure Heap"
    depends on DMABUF_HEAPS_SECURE && TEE
    help
        Enables secure dma-buf heaps for Mediatek platforms.


> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index 974467791032..b1ad9d1f2fbe 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_DMABUF_HEAPS_SECURE)      +=3D secure_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> new file mode 100644
> index 000000000000..a634051a0a67
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF secure heap exporter
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
> +enum secure_memory_type {
> +       /*
> +        * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
> +        * management is inside the TEE.
> +        */
> +       SECURE_MEMORY_TYPE_MTK_CM_TZ    =3D 1,

Mediatek specific code for secure dma heaps should go into a new file
(maybe secure_heap_mtk.c which the MTK_DMABUF_HEAPS_SECURE option
enables).

> +};
> +
> +struct secure_buffer {
> +       struct dma_heap                 *heap;
> +       size_t                          size;
> +};
> +
> +struct secure_heap {
> +       const char                      *name;
> +       const enum secure_memory_type   mem_type;
secure_memory_type is going to be in the vendor specific
implementation, I don't think you need it in the framework.

> +};

You should probably move these to a <linux/dma-heap-secure.h> file so
they can be shared by the framework and the specific implementation
(in this case vendor specific).

> +
> +static struct dma_buf *
> +secure_heap_allocate(struct dma_heap *heap, unsigned long size,
> +                    unsigned long fd_flags, unsigned long heap_flags)
> +{
> +       struct secure_buffer *sec_buf;
> +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +       struct dma_buf *dmabuf;
> +       int ret;
> +
> +       sec_buf =3D kzalloc(sizeof(*sec_buf), GFP_KERNEL);
> +       if (!sec_buf)
> +               return ERR_PTR(-ENOMEM);
> +
> +       sec_buf->size =3D ALIGN(size, PAGE_SIZE);
> +       sec_buf->heap =3D heap;
> +
> +       exp_info.exp_name =3D dma_heap_get_name(heap);
> +       exp_info.size =3D sec_buf->size;
> +       exp_info.flags =3D fd_flags;
> +       exp_info.priv =3D sec_buf;
> +
> +       dmabuf =3D dma_buf_export(&exp_info);
> +       if (IS_ERR(dmabuf)) {
> +               ret =3D PTR_ERR(dmabuf);
> +               goto err_free_buf;
> +       }
> +
> +       return dmabuf;
> +
> +err_free_buf:
> +       kfree(sec_buf);
> +       return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops sec_heap_ops =3D {
> +       .allocate =3D secure_heap_allocate,
> +};
> +
> +static struct secure_heap secure_heaps[] =3D {
> +       {
> +               .name           =3D "secure_mtk_cm",
> +               .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_TZ,
> +       },
> +};

Move this to the vendor specific implementation.

> +
> +static int secure_heap_init(void)
> +{
> +       struct secure_heap *sec_heap =3D secure_heaps;
> +       struct dma_heap_export_info exp_info;
> +       struct dma_heap *heap;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
> +               exp_info.name =3D sec_heap->name;
> +               exp_info.ops =3D &sec_heap_ops;
> +               exp_info.priv =3D (void *)sec_heap;
> +
> +               heap =3D dma_heap_add(&exp_info);
> +               if (IS_ERR(heap))
> +                       return PTR_ERR(heap);
> +       }
> +       return 0;
> +}

secure_heap_init should take a 'struct secure_heap*' as an argument
and be defined in dma-heap-secure.h.

> +
> +module_init(secure_heap_init);
> +MODULE_DESCRIPTION("Secure Heap Driver");
> +MODULE_LICENSE("GPL");

Remove from this file, it should go in the specific implementations.

> --
> 2.25.1
>

