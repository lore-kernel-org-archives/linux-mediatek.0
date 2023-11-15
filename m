Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6225C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 23:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNrY+yv6flp09u25YudSqsktgZkCbw+hX4drbUgi3Pw=; b=s+5rkmWBUAvsTAvBbzhp87U1Yf
	z89w2xKrRP2FX2mkmLqBMc335DxrebXBJdDfkpZh3O44Josm5OONlfqbiwkQ9YUuKo5hxmyB+2CSq
	fgMzshHTIxtC6n5GtvL7RrZmEgjM9dsPw2D1qRZEAcl7Gx7CPxN23OpCJj8stNLProcVBJyaMJmld
	o1q1F8RJeb7oflwjGCU+JLE1vIEwsWzPSRg8YpVaNXc3hhPKR5AM3qYPFZR05TR74OlOVNj6VP7Tk
	Qs6SD9TxWDvZSQzGmADAaeUDFIBVK2XGrcO0VGyAvnsL+Zj7X2XphJRuQ54xSpC+DWSsNEdnARoas
	ANymQqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PCp-001xcW-2F;
	Wed, 15 Nov 2023 23:21:59 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PCm-001xbY-2y
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 23:21:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc209561c3so63365ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 15:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700090516; x=1700695316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNrY+yv6flp09u25YudSqsktgZkCbw+hX4drbUgi3Pw=;
        b=lMRxBGBPHk9h/TDoaufqPgQp3gGyRvJ0YusI6r+YA93ow4CtPvLVVnXV408fP5eu3i
         gi9OgEbaO5ZGVkcoduLzo10bytmeJH9Fjt4CGUUV3g7CU4Aee8kVfUqv0xXDdIHEeUGS
         99ET0u2AoKkEQEIeuOemgukjR08jgQMwZwxR4uoKAlANntmN6u0Bb2vgYtK64P84CZYM
         iVtfjDlV0oJGnwGFuOk2P3Pde5YZRyUa6WFsOfBIt9rRqWplzStRP8cOPUUrnOw05dUQ
         DZaQz1Zgc00ZNRIM9Iif7YKz89a9bjIuKxotqs14YpkQ7rS8sjvyWe5pMU4jwl8gwqOI
         Fk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700090516; x=1700695316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNrY+yv6flp09u25YudSqsktgZkCbw+hX4drbUgi3Pw=;
        b=UAodZ3Cb0vhYvzN0nVcaTY1g5laAF3GGe3iIvRuqxYp0ICd9z9v01IcBOof65HaHeT
         Hmx7bzpCRIEvLtVewZ8aY0955f9JsVu4AB7WJ8GWe5ntkcRCI4dt588tc4Na3NhsK69W
         YnRDNizjXWGHmGxTTKmdpAD0kt8bdglQoLoLkc0oIOxqWRAfF2Izr4vZF+FxOAkntMyE
         YwQ7UHG/n6xfBBj/zKo7LKsO9UU0/Jn/+4OfaDm5NJ6H8nKHXexEQoqo1f7/dvrLtHmV
         /cEcgjyQ09glQh8v2sb4fi5p5RG0CMM1QeiYH/HqRHJbrXuJXkDUm6SUAMU4x039Np2W
         9Zrg==
X-Gm-Message-State: AOJu0Yw9/tmkZbFMQ9BntVlyrKfYTzxrjFaN7rIr91RFB1gcgyIglIEw
	pXum3MlstkxCZRiKe3P5/DOr0vWjuRAwIvUXay+E
X-Google-Smtp-Source: AGHT+IGm7zgQJWAfwVDpHCI+ij6qSFWymYieGz93/wfD0nW3TAyf4K67Hy1IrPWOL2RQmlTU4JpJXZoiI0CXMLDcngE=
X-Received: by 2002:a17:902:c942:b0:1cc:2c43:9061 with SMTP id
 i2-20020a170902c94200b001cc2c439061mr61673pla.21.1700090515344; Wed, 15 Nov
 2023 15:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-3-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-3-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:21:44 -0800
Message-ID: <CA+ddPcPZJzJXro1ph7tT=Zdk6wyDyncmpPZvO0i0J2zCRauMsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dma-buf: heaps: secure_heap: Add private heap ops
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
X-CRM114-CacheID: sfid-20231115_152156_978629_A7DEB53A 
X-CRM114-Status: GOOD (  23.45  )
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
> For the secure memory, there are two steps:
> a) Allocate buffers in kernel side;
> b) Secure that buffer.
> Different heaps may have different buffer allocation methods and
> different memory protection methods. Here abstract the memory
> allocation and securing operations.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 58 ++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index a634051a0a67..87ac23072e9e 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -24,15 +24,66 @@ struct secure_buffer {
>         size_t                          size;
>  };
>
> +struct secure_heap;
> +
> +struct secure_heap_prv_data {
> +       int     (*memory_alloc)(struct secure_heap *sec_heap, struct secu=
re_buffer *sec_buf);
> +       void    (*memory_free)(struct secure_heap *sec_heap, struct secur=
e_buffer *sec_buf);
> +
> +       /* Protect/unprotect the memory */
> +       int     (*secure_the_memory)(struct secure_heap *sec_heap, struct=
 secure_buffer *sec_buf);
> +       void    (*unsecure_the_memory)(struct secure_heap *sec_heap, stru=
ct secure_buffer *sec_buf);
> +};
Move these into dma-heap-secure.h per the comments on the prior patch.

> +
>  struct secure_heap {
>         const char                      *name;
>         const enum secure_memory_type   mem_type;
> +
> +       const struct secure_heap_prv_data *data;
>  };
>
> +static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
> +                                             struct secure_buffer *sec_b=
uf)
> +{
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +       int ret;
> +
> +       if (data->memory_alloc) {
> +               ret =3D data->memory_alloc(sec_heap, sec_buf);
> +               if (ret)
> +                       return ret;
> +       }
You should probably always require that memory_alloc is defined
(secure_the_memory can be optional, as that may be part of the
allocation).
> +
> +       if (data->secure_the_memory) {
> +               ret =3D data->secure_the_memory(sec_heap, sec_buf);
> +               if (ret)
> +                       goto sec_memory_free;
> +       }
> +       return 0;
> +
> +sec_memory_free:
> +       if (data->memory_free)
> +               data->memory_free(sec_heap, sec_buf);
You should probably always require that memory_free is defined.
> +       return ret;
> +}
> +
> +static void secure_heap_secure_memory_free(struct secure_heap *sec_heap,
> +                                          struct secure_buffer *sec_buf)
> +{
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +
> +       if (data->unsecure_the_memory)
> +               data->unsecure_the_memory(sec_heap, sec_buf);
> +
> +       if (data->memory_free)
> +               data->memory_free(sec_heap, sec_buf);
You should probably always require that memory_free is defined.
> +}
> +
>  static struct dma_buf *
>  secure_heap_allocate(struct dma_heap *heap, unsigned long size,
>                      unsigned long fd_flags, unsigned long heap_flags)
>  {
> +       struct secure_heap *sec_heap =3D dma_heap_get_drvdata(heap);
>         struct secure_buffer *sec_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
> @@ -45,6 +96,9 @@ secure_heap_allocate(struct dma_heap *heap, unsigned lo=
ng size,
>         sec_buf->size =3D ALIGN(size, PAGE_SIZE);
>         sec_buf->heap =3D heap;
>
> +       ret =3D secure_heap_secure_memory_allocate(sec_heap, sec_buf);
> +       if (ret)
> +               goto err_free_buf;
>         exp_info.exp_name =3D dma_heap_get_name(heap);
>         exp_info.size =3D sec_buf->size;
>         exp_info.flags =3D fd_flags;
> @@ -53,11 +107,13 @@ secure_heap_allocate(struct dma_heap *heap, unsigned=
 long size,
>         dmabuf =3D dma_buf_export(&exp_info);
>         if (IS_ERR(dmabuf)) {
>                 ret =3D PTR_ERR(dmabuf);
> -               goto err_free_buf;
> +               goto err_free_sec_mem;
>         }
>
>         return dmabuf;
>
> +err_free_sec_mem:
> +       secure_heap_secure_memory_free(sec_heap, sec_buf);
>  err_free_buf:
>         kfree(sec_buf);
>         return ERR_PTR(ret);
> --
> 2.25.1
>

