Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB26C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIH2dT5rBnZFjhKTkiDOQvxWWMxsCvDK0b0vzyQ0+X8=; b=BmFbRXuLDxdEx3dt6kWG48Lb0S
	qC9s+kSkVed++RdOp4dEiib4OLe3h3JURWdp8IjDHj8GKlUrCBhF0cVZ6/OTyLmTbXkganqweYNiC
	1jPJToAZhC22Id2HEju9nf7EBac+HgPyRar0WntCpJbavRY7LZK5yREFuV+cSpbAINW7bcfrxkUdH
	P5WBf6cVaENllaDim2kBCG9TOndVFeuGA6NZQ4jB9XdOpknR2JD3Cd6OKAgn4qhYPiYwX+JPs0bk5
	wKZCbppmKtZAWlYoaVJ5vkqEE4Y7MP5wbRFOx6Lt7d6HAf8SGye8/AOnNmfhaD1qnFdbaGQBblJ05
	/EiqsVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PZr-0021Cr-1J;
	Wed, 15 Nov 2023 23:45:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PZo-0021Am-1x
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 23:45:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc209561c3so65935ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 15:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700091942; x=1700696742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIH2dT5rBnZFjhKTkiDOQvxWWMxsCvDK0b0vzyQ0+X8=;
        b=AkRYSrGLXVT1AjbHu/ut6gEh98b7d7LiagpgQ7dIy1XZgp5hFL+zGiM1wigGv+ildo
         L4mniSSi7N/NPl79KRbopgHWRtA09WqoXgOshvTmncredE0+SiUnpAWkXfDErcRsar/W
         y+93iopW67+oaUM3Ju9Wn+8dwAEN7iiRV4nhPbogquSkeLAc198TaccfMHQvXXXBPxv2
         yomq9BVRtnn6wK8XUjwjf/T1bTM6Bfc5cEUkSscb5q2gkK8rmWwg8OKyZdD+Md6HrzQX
         a4c/7y9tiuW2IH5Ovj4vahDFYtgp5iJCcsxATGwRnHJ7SvHiLzJE7KSRHY/rCtXMZUv+
         JbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700091942; x=1700696742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIH2dT5rBnZFjhKTkiDOQvxWWMxsCvDK0b0vzyQ0+X8=;
        b=KlTnREia3IWIcvEjvnDxguDFBGXd/Eq+w6fIB4vZ28TVvxHxS+fQOlbULJWaRnnTOV
         IO15mB9icmx6CPL2q9bxue5HyhORDAM+EtUY9VXvr7GEIEGHDINtBkEvHJSDSk/E+RJ4
         8BMVLxzVSDTfv8RHhxMTFqOEEUjCILYEUwnh+Erdaze1vAEcpeVDs2jr7s0Xuzwm7KWv
         L+78arjcceziABSShuN2s7K9/BdlmVPzZtsg6iZsZ+BMn32vJZ4WI5ihCAcsho0p/pHT
         uZrq70JVrk1RYsGWdRgQgvkv/ILbrGFRVir4ofHaJ88vF5e0Eh9Le2VXpe2pHkYoLz7R
         ltOQ==
X-Gm-Message-State: AOJu0Yw9poJQuuzpYNpejUKkqyggS4XOErSfuLUnx6Kt/eCnncBVPMKl
	2dV6X0yJhb92VqDmqD5WPVfdw9Ne+7tYPHikhg7E
X-Google-Smtp-Source: AGHT+IFvaq+a3HVgNlcWB8G0UvgbXEFSxTfLrN/9hWim6vKKnIqWcSHLeWYNY3t7rR2xLuNg/XZcLVowUmtLGfVqu6Q=
X-Received: by 2002:a17:902:db0b:b0:1c2:446:5259 with SMTP id
 m11-20020a170902db0b00b001c204465259mr67088plx.19.1700091941779; Wed, 15 Nov
 2023 15:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-9-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-9-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:45:30 -0800
Message-ID: <CA+ddPcNLbyS1WRANo7fm13pYyibD_DS3uAxc6ouULWS+kBxNHQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] dma-buf: heaps: secure_heap: Add normal CMA heap
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
X-CRM114-CacheID: sfid-20231115_154544_644853_62E9C847 
X-CRM114-Status: GOOD (  27.73  )
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

You should drop this patch completely.

On Sat, Nov 11, 2023 at 3:18=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add a normal CMA heap which use the standard cma allocate.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Hi Vijay and Jaskaran,
>
> For this heap,
> 1) It uses sec_heap_buf_ops currently. I guess we cann't use the
> cma_heap_buf_ops. since if it is secure buffer, some operations such
> as mmap should not be allowed.
> 2) I didn't add how to protect/secure the buffer.
>
> Please feel free to change to meet your requirements.
> Thanks.
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 38 ++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index f8b84fd16288..8989ad5d03e9 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -43,6 +43,8 @@ enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. =
*/
>  };
>
>  enum secure_memory_type {
> +       /* CMA for the secure memory, Use the normal cma ops to alloc/fre=
e. */
> +       SECURE_MEMORY_TYPE_CMA          =3D 0,
>         /*
>          * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
>          * management is inside the TEE.
> @@ -65,6 +67,7 @@ struct secure_buffer {
>          * a value got from TEE.
>          */
>         u32                             sec_handle;
> +       struct page                     *cma_page;
>  };
>
>  #define TEE_MEM_COMMAND_ID_BASE_MTK    0x10000
> @@ -287,6 +290,33 @@ const struct secure_heap_prv_data mtk_sec_mem_data =
=3D {
>         .unsecure_the_memory    =3D secure_heap_tee_unsecure_memory,
>  };
>
> +static int cma_secure_memory_allocate(struct secure_heap *sec_heap,
> +                                     struct secure_buffer *sec_buf)
> +{
> +       if (!sec_heap->cma)
> +               return -EINVAL;
> +
> +       sec_buf->cma_page =3D cma_alloc(sec_heap->cma, sec_buf->size >> P=
AGE_SHIFT,
> +                                     get_order(PAGE_SIZE), false);
> +       if (!sec_buf->cma_page)
> +               return -ENOMEM;
> +
> +       memset(page_address(sec_buf->cma_page), 0, sec_buf->size);
> +       return 0;
> +}
> +
> +static void cma_secure_memory_free(struct secure_heap *sec_heap,
> +                                  struct secure_buffer *sec_buf)
> +{
> +       cma_release(sec_heap->cma, sec_buf->cma_page, sec_buf->size >> PA=
GE_SHIFT);
> +}
> +
> +const struct secure_heap_prv_data cma_sec_mem_data =3D {
> +       .memory_alloc   =3D cma_secure_memory_allocate,
> +       .memory_free    =3D cma_secure_memory_free,
> +       /* TODO : secure the buffer. */
> +};
> +
>  static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
>                                               struct secure_buffer *sec_b=
uf)
>  {
> @@ -496,6 +526,11 @@ static const struct dma_heap_ops sec_heap_ops =3D {
>  };
>
>  static struct secure_heap secure_heaps[] =3D {
> +       {
> +               .name           =3D "secure_cma",
> +               .mem_type       =3D SECURE_MEMORY_TYPE_CMA,
> +               .data           =3D &cma_sec_mem_data,
> +       },
>         {
>                 .name           =3D "secure_mtk_cm",
>                 .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_TZ,
> @@ -522,7 +557,8 @@ static int __init secure_cma_init(struct reserved_mem=
 *rmem)
>         }
>
>         for (i =3D 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
> -               if (sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_MTK_CM_CMA=
)
> +               if (sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_MTK_CM_CMA=
 &&
> +                   sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_CMA)
>                         continue;
>
>                 sec_heap->cma =3D sec_cma;
> --
> 2.25.1
>

