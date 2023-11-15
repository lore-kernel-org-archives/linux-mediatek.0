Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE48C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAFs8HHoQNrVkpTk2Xb6uh3p9ALW4pkggBRLwqVuKp8=; b=gTWmC8ugGEMm7fyO3SDj35zqgi
	VAmPWOWmFi8Xg064ao9JE6oydAvpG3ApIbuJr2VAvd8YyEKu9ihWHtArW8LDNJJ/x3FGjkHToSFvI
	QFfAXrcSBJBaPPi6fcHes0DIHWFFNWDLSMzJUV4/xfmP07ZQJbyLKB48WtMm+PLvypL3ozYFAsssi
	XoGtudV9RoRI4dSfCVy6BIxSVN1pqLa/GgtyuUqwKPKIq6VFzUvLLIUYlxBRXHnHEjHkn+vnQ3+cH
	zma9Da+hkF3urvpG/+fn1J+m5XjJrl5X2h0Qm84iRAV1hMr9UUe8BSpHBSjU1KFjkF2vxN5Hhmq24
	0dXeW7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PHA-001yPa-2M;
	Wed, 15 Nov 2023 23:26:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PH7-001yO0-2q
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 23:26:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc209561c3so63885ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 15:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700090783; x=1700695583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAFs8HHoQNrVkpTk2Xb6uh3p9ALW4pkggBRLwqVuKp8=;
        b=R/BOqmabYDGDCkLRazNDvi15ZUZdWAVmeQavuvhTh+4uvmfzywfX1kXahT+4Zy8XiK
         v0QiKgJyvH3KJ1gg2PibgzHdFWCc5UGfl41P4rQfiWbPfSNdh2mrgXQ80PkuoMC4fTJ+
         GOQDOjNWTtWeN/j41htVE8C6330o3yKpQKq8LnuUf7hJg2ZoVITgep7yO8Ql7izo8WfR
         zuziWXUWMsuKsVOdLXhxqrBSXd4JSr6E2V73yMtsLScIUcLDqZZRTQ2VK4eAZubfticy
         qVqlILDAcDiVO+LXB744pYIoyqC2DHqDKB1FZeuKq5pIeu7b8Vv1GpO4wlVez3O0irVB
         yqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700090783; x=1700695583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAFs8HHoQNrVkpTk2Xb6uh3p9ALW4pkggBRLwqVuKp8=;
        b=Lg2mO05ju/wu8WNwlk1NKkrUDXPKgEUXuLr0P9bgtcfcdNyALb0SZ8w9A+UHvvou42
         XX5gbMOGG9oigy1/G/LORBR1R+wKQSQASEFozEyN6feX869AKhmfTGi6egp/eb958nOm
         +ave2ttML/okHYZvRWHccmBQ5LTyGAnHAF39L03x30vwdvInB6V2m7oWn4GDzMpqjPWu
         LNd0gxbfJbD/kVuCVyt58mQaKT4+3RtwkPtqgKUOcyj2bVTb32cz/CTs+lwC0Jrz7/YE
         uEKO5Mq4w6C8qS2Z3wqt3NEy8IuoqpJ79BRpx7vFHdzWBHYMHs5v+IVq8TDHtKNC1z/M
         qVdg==
X-Gm-Message-State: AOJu0YwlShDjvsLsxKd/SxFxZNipV/lUftMUlDZQ8bCdFIr9NdcJAgub
	Uz2Rxt//gRydgo1V0Qk0kM7Dw9i9986VnYDchw2Y
X-Google-Smtp-Source: AGHT+IGj+hC5mU9kET+8w2o2R4u5BSQRJN1vIsWLj2aFby+giajWEP2YT1Jlfo5UOZkuWR/w/W7j5Z6KHyHw0pRmcMA=
X-Received: by 2002:a17:902:c40d:b0:1cc:51d6:fb04 with SMTP id
 k13-20020a170902c40d00b001cc51d6fb04mr61228plk.26.1700090782696; Wed, 15 Nov
 2023 15:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-5-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-5-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:26:11 -0800
Message-ID: <CA+ddPcNDBSESjJSKiTwEpf_GydThrdh+KGnnXmTnYVmmnwZ83w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory
 service call
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
X-CRM114-CacheID: sfid-20231115_152625_919847_97C0435E 
X-CRM114-Status: GOOD (  30.36  )
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

On Sat, Nov 11, 2023 at 3:17=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add TEE service call. In the case of MediaTek, secure memory management i=
s
> located within the TEE. The kernel just needs to tell TEE what size it
> needs and the TEE will return a "security handle" to kernel.
>
> To be consistent with the cma heap later, we put the tee ops into the ops
> of secure_the_memory.
>
> It seems that secure_heap_tee_service_call could be a more general
> interface, but it could be a new topic.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 97 +++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index 2a037fc54004..05062c14e7c7 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -17,6 +17,27 @@
>
>  #define TEE_PARAM_NUM                  4
>
> +enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. */
> +       /*
> +        * TZCMD_SECMEM_ZALLOC: Allocate the zeroed secure memory from TE=
E.
> +        *
> +        * [in]  value[0].a: The buffer size.
> +        *       value[0].b: alignment.
> +        * [in]  value[1].a: enum secure_memory_type.
> +        * [out] value[3].a: The secure handle.
> +        */
> +       TZCMD_SECMEM_ZALLOC =3D 0,
> +
> +       /*
> +        * TZCMD_SECMEM_FREE: Free secure memory.
> +        *
> +        * [in]  value[0].a: The secure handle of this buffer, It's value=
[3].a of
> +        *                   TZCMD_SECMEM_ZALLOC.
> +        * [out] value[1].a: return value, 0 means successful, otherwise =
fail.
> +        */
> +       TZCMD_SECMEM_FREE =3D 1,
> +};
> +

This should go in the MTK specific implementation.

>  enum secure_memory_type {
>         /*
>          * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
> @@ -28,13 +49,25 @@ enum secure_memory_type {
>  struct secure_buffer {
>         struct dma_heap                 *heap;
>         size_t                          size;
> +       /*
> +        * The secure handle is a reference to a buffer within the TEE, t=
his is
> +        * a value got from TEE.
> +        */
> +       u32                             sec_handle;
>  };

Change this to a u64 and rename it to 'secure_address', it's up to the
specific implementation what that would actually mean.

>
> +#define TEE_MEM_COMMAND_ID_BASE_MTK    0x10000
> +
Move this into the MTK specific implementation.

>  struct secure_heap;
>
>  struct secure_heap_prv_data {
>         const char                      *uuid;
>         const int                       tee_impl_id;
> +       /*
> +        * Different TEEs may implement different commands, and this prov=
ides an opportunity
> +        * for TEEs to use the same enum secure_buffer_tee_cmd.
> +        */
> +       const int                       tee_command_id_base;
Remove this, it can be handled in the MTK specific implementation.
>
>         int     (*memory_alloc)(struct secure_heap *sec_heap, struct secu=
re_buffer *sec_buf);
>         void    (*memory_free)(struct secure_heap *sec_heap, struct secur=
e_buffer *sec_buf);
> @@ -98,10 +131,74 @@ static int secure_heap_tee_session_init(struct secur=
e_heap *sec_heap)
>         return ret;
>  }
>
> +static int
> +secure_heap_tee_service_call(struct tee_context *tee_ctx, u32 session,
> +                            unsigned int command, struct tee_param *para=
ms)
> +{
> +       struct tee_ioctl_invoke_arg arg =3D {0};
> +       int ret;
> +
> +       arg.num_params =3D TEE_PARAM_NUM;
> +       arg.session =3D session;
> +       arg.func =3D command;
> +
> +       ret =3D tee_client_invoke_func(tee_ctx, &arg, params);
> +       if (ret < 0 || arg.ret) {
> +               pr_err("%s: cmd %d ret %d:%x.\n", __func__, command, ret,=
 arg.ret);
> +               ret =3D -EOPNOTSUPP;
> +       }
> +       return ret;
> +}
> +
> +static int secure_heap_tee_secure_memory(struct secure_heap *sec_heap,
> +                                        struct secure_buffer *sec_buf)
> +{
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +       struct tee_param params[TEE_PARAM_NUM] =3D {0};
> +       int ret;
> +
> +       params[0].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +       params[0].u.value.a =3D sec_buf->size;
> +       params[0].u.value.b =3D PAGE_SIZE;
> +       params[1].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +       params[1].u.value.a =3D sec_heap->mem_type;
> +       params[2].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +
> +       params[3].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> +       ret =3D secure_heap_tee_service_call(sec_heap->tee_ctx, sec_heap-=
>tee_session,
> +                                          data->tee_command_id_base + TZ=
CMD_SECMEM_ZALLOC,
> +                                          params);
> +       if (ret)
> +               return -ENOMEM;
> +
> +       sec_buf->sec_handle =3D params[3].u.value.a;
> +       return 0;
> +}
> +
> +static void secure_heap_tee_unsecure_memory(struct secure_heap *sec_heap=
,
> +                                           struct secure_buffer *sec_buf=
)
> +{
> +       struct tee_param params[TEE_PARAM_NUM] =3D {0};
> +
> +       params[0].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +       params[0].u.value.a =3D sec_buf->sec_handle;
> +       params[1].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> +
> +       secure_heap_tee_service_call(sec_heap->tee_ctx, sec_heap->tee_ses=
sion,
> +                                    sec_heap->data->tee_command_id_base =
+ TZCMD_SECMEM_FREE,
> +                                    params);
> +       if (params[1].u.value.a)
> +               pr_err("%s, free buffer(0x%x) return fail(%lld) from TEE.=
\n",
> +                      sec_heap->name, sec_buf->sec_handle, params[1].u.v=
alue.a);
> +}
> +

These are entirely MTK specific, so move them into the MTK specific
implementation.

>  /* The memory allocating is within the TEE. */
>  const struct secure_heap_prv_data mtk_sec_mem_data =3D {
>         .uuid                   =3D TZ_TA_MEM_UUID_MTK,
>         .tee_impl_id            =3D TEE_IMPL_ID_OPTEE,
> +       .tee_command_id_base    =3D TEE_MEM_COMMAND_ID_BASE_MTK,
> +       .secure_the_memory      =3D secure_heap_tee_secure_memory,
> +       .unsecure_the_memory    =3D secure_heap_tee_unsecure_memory,
>  };

This should also go into the MTK specific implementation, and to be
clear, that's where module_init should be as well.

>
>  static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
> --
> 2.25.1
>

