Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A05AC52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=; b=z29NWgKo+OGuiY+YZe56ZsL9iJ
	jGP/Y6r7wxa1tfRVLWFcoBRXybT7oXgf9oHUvsQGRyXbeSGjhCR/gSeGx5Z1BleKlqC2mnZtKBXxs
	HRLnCg8WEd+Xp5p8u1uiNoLoTddUGXDnxel/w6InHfHyGu3nJsY5kVYjxcIZ6ykG+QKb5AgDtzrIO
	ipo+OfIc0wasOGpsEvdzN9WBPwFlZkzHRwhMhrdMTOoS9GOVELiNLdeQHYaePTZqw/o6FMT35c2hl
	BDQctSYgydqmLKYwVQUztEOUNei1wGf8+CyuzObSwPKwbJR5G/ELOfzdQKP3xFiVOwKuQgNMnvXjh
	FSgfuuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shA6X-0000000DPFX-19FY;
	Thu, 22 Aug 2024 15:52:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh9U1-0000000DIJU-32t1
	for linux-mediatek@bombadil.infradead.org;
	Thu, 22 Aug 2024 15:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=; b=l7o2AnnvjF3EhaPcpTEYDjZElc
	EPxv8Im5ZgpziEQ1ENO9W+HtBHm3Z92GdQctVg7DFCj+NIJRVxRK/f5QqQKju4VCd+VsrO0fPeHsm
	QJKP6tZHB8vPu8+Q27oNcqZRRokBMYV6WkwA0zFR3l3ljl9l5T2QetWUgp91Db50Fxlkfgl9ik5B4
	2anM/q9tmQVNdvtmfsLBvROZzuiY/Ji5+R/JYMWRwYmJbzmcJj8lYpF9lpycgs/6uM8fUVfCmP0QW
	AimpubG3FgOIQKDflIzgDwbTcNEJEKc1tXuH2BmHQj4Vy/XltjIznLhdLvNJ4pmF8I8a5NnsD4l3e
	ocojcXJA==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh9Tx-00000009y3r-2chd
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 15:12:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso8411851fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724339530; x=1724944330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=;
        b=wfWBrP1E9oUbIzdTu4r65iNVr0qdllQ8OPIFq0eV59W1HQTLRO19x7P9JY8z2V/4ET
         5i4Mh0qZVWu844SYt3aXFx17LREYHfv4cCFWBbNURYydTeH1v9/INNO1jbtbWBuZfAy5
         xeR9kkAdgvOwI/WqWjOZhzCT+Wv+K9ugq/NOVgKdge+4qQxevC73pcpcIJS6TPMpzqzl
         13DufR3PAu5Eged6+YV2Wm5+Vx08/j44KglBP1BnYMKz9ZhDHs5SF09yaMt33GYMu02c
         7ccAGL6XoTRgSy7RCK5DTuysZc2clkQtbQVsRTWei9hkuFKuGVZFZ0QaQAz6VY3Ah+U0
         8Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724339530; x=1724944330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=;
        b=nJYje9ANCDYMemtB2+b3+N/f+CEi8NGmBEiwVhDjLaad58YG0F8fUKLh8YekHI+ySi
         2Liy1LgVxAxWltUw1RxV0pGt4M5R5HojGh8C1SXaTFU5Mmb52U0a/8xrsFLprwcgpIZY
         tah3DH0tgHFrFNy29RFgbehIi/tVO3tQ/SpZIWMOlCIs0nUnkVKMG0LVewzQD96lzOFL
         2eGRYWlOwIaNwN/WQVVAthV66Ps0hQg7uh0EWj/EBuyNymgrNF7/S9RvlTUU0aFMVrH4
         Txhh+VPi4Q47KGaLWKfOQDNVvGBIGxpEBm6Uw4mJkq0N3EnBpkApJR2lQfhfL/qYdbMR
         tphw==
X-Forwarded-Encrypted: i=1; AJvYcCXTbNF273GxjlFfEclcmMHG1/bCnKC0040iICoByCkOuNCUklp0Kn6WhVpX6/Fck9Ij3C+HnmwhCOFZTw3BNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrOhLETl7coInsDlyYZnA1BZZ4XUoEOcBarmLamePTZvMZ7c3I
	8/ZkabgLRvjot8d7dtkiFgVaxZrqaUVBx2YvWF/WpAAddhYe/2DMRlrGwzpue2zcczkIbgdM73x
	VY4rusElaLg1w5lPgUEuoC+5TGAu+Q/aIEy2lkw==
X-Google-Smtp-Source: AGHT+IFiLmEsOvYvdr3VyiyqB861aTavzd4tiwin4hjTDIgK3KZVq4VStdlXBdk3Plh+1gYEh1qgoVqRfz/lcHt5430=
X-Received: by 2002:a05:651c:1547:b0:2ef:2b38:879c with SMTP id
 38308e7fff4ca-2f405c7c266mr14899621fa.3.1724339529793; Thu, 22 Aug 2024
 08:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240515112308.10171-1-yong.wu@mediatek.com> <20240515112308.10171-8-yong.wu@mediatek.com>
In-Reply-To: <20240515112308.10171-8-yong.wu@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 Aug 2024 17:11:57 +0200
Message-ID: <CAHUa44GHtEGsXagwLLAix7HxpjZt45rsZkWCb4i0LUmr54Xjqg@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] dma-buf: heaps: restricted_heap: Add MediaTek
 restricted heap and heap_init
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>, 
	willy@infradead.org, Logan Gunthorpe <logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_161213_907353_93CFCFE1 
X-CRM114-Status: GOOD (  35.66  )
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

On Wed, May 15, 2024 at 1:25=E2=80=AFPM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add a MediaTek restricted heap which uses TEE service call to restrict
> buffer. Currently this restricted heap is NULL, Prepare for the later
> patch. Mainly there are two changes:
> a) Add a heap_init ops since TEE probe late than restricted heap, thus
>    initialize the heap when we require the buffer the first time.
> b) Add a priv_data for each heap, like the special data used by MTK
>    (such as "TEE session") can be placed in priv_data.
>
> Currently our heap depends on CMA which could only be bool, thus
> depend on "TEE=3Dy".
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig               |   7 ++
>  drivers/dma-buf/heaps/Makefile              |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c     |  11 ++
>  drivers/dma-buf/heaps/restricted_heap.h     |   2 +
>  drivers/dma-buf/heaps/restricted_heap_mtk.c | 115 ++++++++++++++++++++
>  5 files changed, 136 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfi=
g
> index e54506f480ea..84f748fb2856 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -21,3 +21,10 @@ config DMABUF_HEAPS_RESTRICTED
>           heap is to manage buffers that are inaccessible to the kernel a=
nd user space.
>           There may be several ways to restrict it, for example it may be=
 encrypted or
>           protected by a TEE or hypervisor. If in doubt, say N.
> +
> +config DMABUF_HEAPS_RESTRICTED_MTK
> +       bool "MediaTek DMA-BUF Restricted Heap"
> +       depends on DMABUF_HEAPS_RESTRICTED && TEE=3Dy
> +       help
> +         Enable restricted dma-buf heaps for MediaTek platform. This hea=
p is backed by
> +         TEE client interfaces. If in doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index a2437c1817e2..0028aa9d875f 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_heap_mtk.=
o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/he=
aps/restricted_heap.c
> index 4e45d46a6467..8bc8a5e3f969 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -151,11 +151,22 @@ restricted_heap_allocate(struct dma_heap *heap, uns=
igned long size,
>                          unsigned long fd_flags, unsigned long heap_flags=
)
>  {
>         struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> +       const struct restricted_heap_ops *ops =3D rheap->ops;
>         struct restricted_buffer *restricted_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
>         int ret;
>
> +       /*
> +        * In some implements, TEE is required to protect buffer. However=
 TEE probe
> +        * may be late, Thus heap_init is performed when the first buffer=
 is requested.
> +        */
> +       if (ops->heap_init) {
> +               ret =3D ops->heap_init(rheap);
> +               if (ret)
> +                       return ERR_PTR(ret);
> +       }
> +
>         restricted_buf =3D kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
>         if (!restricted_buf)
>                 return ERR_PTR(-ENOMEM);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 6d9599a4a34e..2a33a1c7a48b 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -19,6 +19,8 @@ struct restricted_heap {
>         const char              *name;
>
>         const struct restricted_heap_ops *ops;
> +
> +       void                    *priv_data;
>  };
>
>  struct restricted_heap_ops {
> diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-bu=
f/heaps/restricted_heap_mtk.c
> new file mode 100644
> index 000000000000..52e805eb9858
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF restricted heap exporter for MediaTek
> + *
> + * Copyright (C) 2024 MediaTek Inc.
> + */
> +#define pr_fmt(fmt)     "rheap_mtk: " fmt
> +
> +#include <linux/dma-buf.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#include "restricted_heap.h"
> +
> +#define TZ_TA_MEM_UUID_MTK             "4477588a-8476-11e2-ad15-e41f1390=
d676"
> +
> +#define TEE_PARAM_NUM                  4
> +
> +enum mtk_secure_mem_type {
> +       /*
> +        * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
> +        * management is inside the TEE.
> +        */
> +       MTK_SECURE_MEMORY_TYPE_CM_TZ    =3D 1,
> +};
> +
> +struct mtk_restricted_heap_data {
> +       struct tee_context      *tee_ctx;
> +       u32                     tee_session;
> +
> +       const enum mtk_secure_mem_type mem_type;
> +
> +};
> +
> +static int mtk_tee_ctx_match(struct tee_ioctl_version_data *ver, const v=
oid *data)
> +{
> +       return ver->impl_id =3D=3D TEE_IMPL_ID_OPTEE;
> +}
> +
> +static int mtk_tee_session_init(struct mtk_restricted_heap_data *data)
> +{
> +       struct tee_param t_param[TEE_PARAM_NUM] =3D {0};
> +       struct tee_ioctl_open_session_arg arg =3D {0};
> +       uuid_t ta_mem_uuid;
> +       int ret;
> +
> +       data->tee_ctx =3D tee_client_open_context(NULL, mtk_tee_ctx_match=
, NULL, NULL);
> +       if (IS_ERR(data->tee_ctx)) {
> +               pr_err_once("%s: open context failed, ret=3D%ld\n", __fun=
c__,
> +                           PTR_ERR(data->tee_ctx));
> +               return -ENODEV;
> +       }
> +
> +       arg.num_params =3D TEE_PARAM_NUM;
> +       arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> +       ret =3D uuid_parse(TZ_TA_MEM_UUID_MTK, &ta_mem_uuid);
> +       if (ret)
> +               goto close_context;
> +       memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
> +
> +       ret =3D tee_client_open_session(data->tee_ctx, &arg, t_param);
> +       if (ret < 0 || arg.ret) {
> +               pr_err_once("%s: open session failed, ret=3D%d:%d\n",
> +                           __func__, ret, arg.ret);
> +               ret =3D -EINVAL;
> +               goto close_context;
> +       }
> +       data->tee_session =3D arg.session;
> +       return 0;
> +
> +close_context:
> +       tee_client_close_context(data->tee_ctx);

There's a
data->tee_ctx =3D NULL;
missing here.

Cheers,
Jens

> +       return ret;
> +}
> +
> +static int mtk_restricted_heap_init(struct restricted_heap *rheap)
> +{
> +       struct mtk_restricted_heap_data *data =3D rheap->priv_data;
> +
> +       if (!data->tee_ctx)
> +               return mtk_tee_session_init(data);
> +       return 0;
> +}
> +
> +static const struct restricted_heap_ops mtk_restricted_heap_ops =3D {
> +       .heap_init              =3D mtk_restricted_heap_init,
> +};
> +
> +static struct mtk_restricted_heap_data mtk_restricted_heap_data =3D {
> +       .mem_type               =3D MTK_SECURE_MEMORY_TYPE_CM_TZ,
> +};
> +
> +static struct restricted_heap mtk_restricted_heaps[] =3D {
> +       {
> +               .name           =3D "restricted_mtk_cm",
> +               .ops            =3D &mtk_restricted_heap_ops,
> +               .priv_data      =3D &mtk_restricted_heap_data,
> +       },
> +};
> +
> +static int mtk_restricted_heap_initialize(void)
> +{
> +       struct restricted_heap *rheap =3D mtk_restricted_heaps;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++)
> +               restricted_heap_add(rheap);
> +       return 0;
> +}
> +module_init(mtk_restricted_heap_initialize);
> +MODULE_DESCRIPTION("MediaTek Restricted Heap Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

