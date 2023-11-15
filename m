Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7B4C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 23:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0HQzSRtljGrY6Ct7U4zPmfDbNyabfc92sz3kDFmCiU=; b=sLmtbaQUDR4VUCOn3jdhJIVKgq
	QLv/YFyrMhaNfVVbjIbli5Jy5vtScQg4YrluDlvQzAFTnRBIUywuy92Un4kuFQjBGsXGW/HMN2DUX
	PPvD47nAH6cQse7ZhwO90z7kakwLiogqJJ+TW+rdII1S7ilmPGBMjxZEGQT7y4fM6gDcg4GstU1QZ
	rzenHpRZnPhnb4f3bcKpUMJnzRV7VaHSVpfhfqqQJQkO0bThdpZbpZUG9oFkfd82+bRI4Q26wcbhw
	7CVKCJEpY9pW+yVZOMFX+bkAEtyE2SPJ3mpH6WOLE7UXbhif43PMIVKMiTLe9LrpiJdaXjMZ3mkMT
	86z8AyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PZE-0020ys-2r;
	Wed, 15 Nov 2023 23:45:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PZB-0020xY-1L
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 23:45:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cc79f73e58so26365ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 15:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700091903; x=1700696703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0HQzSRtljGrY6Ct7U4zPmfDbNyabfc92sz3kDFmCiU=;
        b=WmiZctkMVPVYeFf4V873YCxnFImvWD+O/9H4cE05ruvvvmBweACtQt/OiBjZHLPBH8
         Bj8SiF/a9oDwoe6nGD22tMS+RqWQRJH1uybx+AAYxM3yQMp6UO7uJijJxjBzctOvf6Rt
         j1+QuHSdqCxDb1IAa6ESOUvEUdgAg9B14/KciFHHlhGdEzfbYF4MaISWMDkneEZnIM6t
         mAyJ1hlBeFvHVXCA2xmbmpf/PWpFaEB7/ZinK+xARAMeSqG2z1DmpNjSXEtd8JS7kYPy
         DWrBzhlLzzByrF+iWqvR8lYbv3YBMjjhnGDsWdryWPs/KsXF2lqcD/A4ZTskHqLiiIrz
         6JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700091903; x=1700696703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0HQzSRtljGrY6Ct7U4zPmfDbNyabfc92sz3kDFmCiU=;
        b=TKyANUj1fnf9tEmXjQuL2uMrDroXVQsfB8QeputF3STJjwfXZWWI1JYxWesYUsfXvL
         K/DoeE/F1NY+f6H7KHPW5LUJ8F6LdMLcfGjdyGARjBhFEl9F3D/9o4gs8L2Ph/Az5JMw
         WchV0MUlK56buJlbEPf0UgdHpS/EqINT8eNZr7tUNFY7Twgxwq/mcmLKQxm+os1LgGLY
         T1UHj7JNpg/TaSjEe2z1StEeCqRkxZ58xTd/gVMwZsY3FBr8uvfVf/McCtJERF8zyaSU
         15I9Y/zVhtIXiv87u0bMAD2j6M5AkOM+e22ygyNFLw5hajC90PO3GCRVsQrl5i6Zm83U
         jdEA==
X-Gm-Message-State: AOJu0YzrCTjCrJQccvGHzjbFTiZ+q07adkhOpjTK2QVN9T/EIFmEM64c
	9mAImLd52/B/JtYhjeOFAlBcWkkNk9IdXcBAAx1y
X-Google-Smtp-Source: AGHT+IHISxj9EsT/9lY/lJetsyYrfbppRvYUbomdqDwOMwE4b3B7cZrenSrMORfWdoLXEO2C2FzUxtsSuisll17+FN8=
X-Received: by 2002:a17:903:191:b0:1cc:4eb0:64c8 with SMTP id
 z17-20020a170903019100b001cc4eb064c8mr65472plg.25.1700091903097; Wed, 15 Nov
 2023 15:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-8-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-8-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:44:51 -0800
Message-ID: <CA+ddPcMrdhV0G73i8C6Lpc==XF+BA-SPjU3zefTLDicbQpzqpA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dma_buf: heaps: secure_heap: Add a new MediaTek
 CMA heap
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
X-CRM114-CacheID: sfid-20231115_154505_451563_73C6D157 
X-CRM114-Status: GOOD (  36.05  )
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

Most of the things in this patch should go in the MTK specific
implementation (except for the secure_heap_init changes). Especially
the RESERVEDMEM_OF_DECLARE.

On Sat, Nov 11, 2023 at 3:18=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Create a new MediaTek CMA heap from the CMA reserved buffer.
>
> In this heap, When the first allocating buffer, use cma_alloc to prepare
> whole the CMA range, then send its range to TEE to protect and manage.
> For the later allocating, we just adds the cma_used_size_mtk.
>
> This CMA flow may be different with the normal CMA heap of next patch.
> So I named the variable with _mtk suffix like cma_page_mtk/
> cma_used_size_mtk. This is also to distinguish it from the cma_page of
> the buffer structure in the next patch.
>
> When SVP done, cma_release will release the buffer, then kernel may
> reuse it.
>
> Meanwhile, this patch adds a "heap_init" pointer, while allows some heap
> initialization operations. This case also checks if the CMA range is
> ready.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 124 +++++++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index 25cc95442c56..f8b84fd16288 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -4,11 +4,12 @@
>   *
>   * Copyright (C) 2023 MediaTek Inc.
>   */
> -
> +#include <linux/cma.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-heap.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/tee_drv.h>
> @@ -25,6 +26,8 @@ enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. =
*/
>          * [in]  value[0].a: The buffer size.
>          *       value[0].b: alignment.
>          * [in]  value[1].a: enum secure_memory_type.
> +        * [in]  value[2].a: pa base in cma case.
> +        *       value[2].b: The buffer size in cma case.
>          * [out] value[3].a: The secure handle.
>          */
>         TZCMD_SECMEM_ZALLOC =3D 0,
> @@ -45,6 +48,13 @@ enum secure_memory_type {
>          * management is inside the TEE.
>          */
>         SECURE_MEMORY_TYPE_MTK_CM_TZ    =3D 1,
> +       /*
> +        * MediaTek dynamic chunk memory carved out from CMA.
> +        * In normal case, the CMA could be used in kernel; When SVP star=
t, we will
> +        * allocate whole this CMA and pass whole the CMA PA and size int=
o TEE to
> +        * protect it, then the detail memory management also is inside t=
he TEE.
> +        */
> +       SECURE_MEMORY_TYPE_MTK_CM_CMA   =3D 2,
>  };
>
>  struct secure_buffer {
> @@ -70,6 +80,7 @@ struct secure_heap_prv_data {
>          */
>         const int                       tee_command_id_base;
>
> +       int     (*heap_init)(struct secure_heap *sec_heap);
>         int     (*memory_alloc)(struct secure_heap *sec_heap, struct secu=
re_buffer *sec_buf);
>         void    (*memory_free)(struct secure_heap *sec_heap, struct secur=
e_buffer *sec_buf);
>
> @@ -86,6 +97,13 @@ struct secure_heap {
>         u32                             tee_session;
>
>         const struct secure_heap_prv_data *data;
> +
> +       struct cma              *cma;
> +       struct page             *cma_page_mtk;
> +       unsigned long           cma_paddr;
> +       unsigned long           cma_size;
> +       unsigned long           cma_used_size_mtk;
> +       struct mutex            lock; /* lock for cma_used_size_mtk */
>  };
>
>  struct secure_heap_attachment {
> @@ -168,7 +186,10 @@ static int secure_heap_tee_secure_memory(struct secu=
re_heap *sec_heap,
>         params[1].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
>         params[1].u.value.a =3D sec_heap->mem_type;
>         params[2].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> -
> +       if (sec_heap->cma && sec_heap->mem_type =3D=3D SECURE_MEMORY_TYPE=
_MTK_CM_CMA) {
> +               params[2].u.value.a =3D sec_heap->cma_paddr;
> +               params[2].u.value.b =3D sec_heap->cma_size;
> +       }
>         params[3].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
>         ret =3D secure_heap_tee_service_call(sec_heap->tee_ctx, sec_heap-=
>tee_session,
>                                            data->tee_command_id_base + TZ=
CMD_SECMEM_ZALLOC,
> @@ -197,6 +218,66 @@ static void secure_heap_tee_unsecure_memory(struct s=
ecure_heap *sec_heap,
>                        sec_heap->name, sec_buf->sec_handle, params[1].u.v=
alue.a);
>  }
>
> +static int mtk_secure_memory_cma_allocate(struct secure_heap *sec_heap,
> +                                         struct secure_buffer *sec_buf)
> +{
> +       /*
> +        * Allocate CMA only when allocating buffer for the first time, a=
nd just
> +        * increase cma_used_size_mtk at the other time.
> +        */
> +       mutex_lock(&sec_heap->lock);
> +       if (sec_heap->cma_used_size_mtk)
> +               goto add_size;
> +
> +       mutex_unlock(&sec_heap->lock);
> +       sec_heap->cma_page_mtk =3D cma_alloc(sec_heap->cma, sec_heap->cma=
_size >> PAGE_SHIFT,
> +                                          get_order(PAGE_SIZE), false);
> +       if (!sec_heap->cma_page_mtk)
> +               return -ENOMEM;
> +
> +       mutex_lock(&sec_heap->lock);
> +add_size:
> +       sec_heap->cma_used_size_mtk +=3D sec_buf->size;
> +       mutex_unlock(&sec_heap->lock);
> +
> +       return 0;
> +}
> +
> +static void mtk_secure_memory_cma_free(struct secure_heap *sec_heap,
> +                                      struct secure_buffer *sec_buf)
> +{
> +       bool cma_is_empty;
> +
> +       mutex_lock(&sec_heap->lock);
> +       sec_heap->cma_used_size_mtk -=3D sec_buf->size;
> +       cma_is_empty =3D !sec_heap->cma_used_size_mtk;
> +       mutex_unlock(&sec_heap->lock);
> +
> +       if (cma_is_empty)
> +               cma_release(sec_heap->cma, sec_heap->cma_page_mtk,
> +                           sec_heap->cma_size >> PAGE_SHIFT);
> +}
> +
> +static int mtk_secure_heap_cma_init(struct secure_heap *sec_heap)
> +{
> +       if (!sec_heap->cma)
> +               return -EINVAL;
> +       mutex_init(&sec_heap->lock);
> +       return 0;
> +}
> +
> +/* Use CMA to prepare the buffer and the memory allocating is within the=
 TEE. */
> +const struct secure_heap_prv_data mtk_sec_mem_data_cma =3D {
> +       .uuid                   =3D TZ_TA_MEM_UUID_MTK,
> +       .tee_impl_id            =3D TEE_IMPL_ID_OPTEE,
> +       .tee_command_id_base    =3D TEE_MEM_COMMAND_ID_BASE_MTK,
> +       .heap_init              =3D mtk_secure_heap_cma_init,
> +       .memory_alloc           =3D mtk_secure_memory_cma_allocate,
> +       .memory_free            =3D mtk_secure_memory_cma_free,
> +       .secure_the_memory      =3D secure_heap_tee_secure_memory,
> +       .unsecure_the_memory    =3D secure_heap_tee_unsecure_memory,
> +};
> +
>  /* The memory allocating is within the TEE. */
>  const struct secure_heap_prv_data mtk_sec_mem_data =3D {
>         .uuid                   =3D TZ_TA_MEM_UUID_MTK,
> @@ -420,20 +501,59 @@ static struct secure_heap secure_heaps[] =3D {
>                 .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_TZ,
>                 .data           =3D &mtk_sec_mem_data,
>         },
> +       {
> +               .name           =3D "secure_mtk_cma",
> +               .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_CMA,
> +               .data           =3D &mtk_sec_mem_data_cma,
> +       },
>  };
>
> +static int __init secure_cma_init(struct reserved_mem *rmem)
> +{
> +       struct secure_heap *sec_heap =3D secure_heaps;
> +       struct cma *sec_cma;
> +       int ret, i;
> +
> +       ret =3D cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->na=
me,
> +                                   &sec_cma);
> +       if (ret) {
> +               pr_err("%s: %s set up CMA fail\n", __func__, rmem->name);
> +               return ret;
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
> +               if (sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_MTK_CM_CMA=
)
> +                       continue;
> +
> +               sec_heap->cma =3D sec_cma;
> +               sec_heap->cma_paddr =3D rmem->base;
> +               sec_heap->cma_size =3D rmem->size;
> +       }
> +       return 0;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(secure_cma, "secure_cma_region", secure_cma_init)=
;
> +
>  static int secure_heap_init(void)
>  {
>         struct secure_heap *sec_heap =3D secure_heaps;
>         struct dma_heap_export_info exp_info;
>         struct dma_heap *heap;
>         unsigned int i;
> +       int ret;
>
>         for (i =3D 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
>                 exp_info.name =3D sec_heap->name;
>                 exp_info.ops =3D &sec_heap_ops;
>                 exp_info.priv =3D (void *)sec_heap;
>
> +               if (sec_heap->data && sec_heap->data->heap_init) {
> +                       ret =3D sec_heap->data->heap_init(sec_heap);
> +                       if (ret) {
> +                               pr_err("sec_heap %s init fail %d.\n", sec=
_heap->name, ret);
> +                               continue;
> +                       }
> +               }
>                 heap =3D dma_heap_add(&exp_info);
>                 if (IS_ERR(heap))
>                         return PTR_ERR(heap);
> --
> 2.25.1
>

