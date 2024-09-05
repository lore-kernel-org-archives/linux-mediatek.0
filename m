Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8B0CD4F4D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is6oA3m8LIEojdfLA7VjQTerM+IVLQZFBibvLCSwhaA=; b=qBT2fehzvH6hqGJuJJzlnGeLwZ
	GZh3EvSnW27qVyf1ByO2NWHIKkstG3Yl+w64e9lMtpZ0O1Xg7c4ZIIeAejZ8C5Ra3i6UcceJlunOv
	C2hTapLM/VwQMN+uCVaxO3/RYANl9gvq7G3kWcpToQeywtMNANJcgPhk+heMBh1SA+Puf4hxhexWh
	EZy9aKordhGSexdYQdn8bnARhL75tSN3vFOOghRLg9cpKAA3mrOa+lDXYzwb7A3fB8qBZt9xlW2T6
	T2mtiwVWV3oAzRihlVUMf0j8gl7y7qHchCGTE/NxxDTiSGaEohRi9QW9iVYY6Aycl3ln/EtaOebKn
	WI/QijaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6Qn-00000007Grs-0Kqa;
	Thu, 05 Sep 2024 06:57:25 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6Po-00000007Gfx-2SNq
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 06:56:26 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-70f5a9bf18bso264286a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725519383; x=1726124183; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is6oA3m8LIEojdfLA7VjQTerM+IVLQZFBibvLCSwhaA=;
        b=b114olRp5OBhD10UuJUdMPAzIcTIZg9tXmD6GsQEw014KnHpO88GXKjN9vTxRmb7+t
         cGFRFQy7W6yfH2H+wjDsVOm41DIgSoTbmWO7GyXg4Mr3xFYJxqKPcqPuy/QXl+KjC+V5
         iUr0hdRt8FxlAm8IOGHwVgR+QViwlVK0kpMMopv/vC6Tj9F3n4pAIuHe3XQZbs+B3dc1
         dM6LlL5cZYkWii4zKN+Al6RQUj2P0WMLat+7W72TtfS7ipdp1tK7+RQPRGue238Pg39I
         hkFtg0m1aktXGq4T/SBIp+zgNRT4hZ9Qet67spWJco28OqdyEkTHsfFuoip2sL3JCUqt
         FBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725519383; x=1726124183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is6oA3m8LIEojdfLA7VjQTerM+IVLQZFBibvLCSwhaA=;
        b=scErWwwDzayaLQ0ySPnRlBVmty/pZbkSrKnd4x+TGHMuXeaUEdTfrMfukw6h0a+e/n
         yoFGPdzBNZpuij8tuTPEYgYG7w/19u3ISCVF7FyFOAn58a+5N7btqZhtDrcXHAZT12IN
         z83gTUoYrY487juG8m/JSHVPl+oTWNTD/Jfw8j9G+7Un7VlGUBnZdNyi/jGvmcedSOHH
         XJKzO5xLAAPDaGi7gVihxo0MVT319nkaYIWdcLIKBIqMhRV5bxMt+aQztL2ec/nR3ryG
         wkpv3E+ILcIYRoFFs2llARQD3LDUuwRledBBDxR8LopzepggbNEaRGOCoID0KmiBDbcl
         1Q/w==
X-Forwarded-Encrypted: i=1; AJvYcCWsS2nOlMJnDoH+CLP6dBalYvSRr6j/y7I24AdEs5rzMo3A8Wj+nUrNBAz2ULQPjWaaQA9IgZD3EZZ5ZF0v0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh1mirlodK25EZ5k6ij45hFOZU1DSI3vKhmk8kqFik9ENkBzcm
	ew487N5XegCeI2Cf5SVPhhkLbLfooiELzEMZEyu7e6JcCH/EHv5A5F92f3MZ4an/ZDioEvmP3vj
	HyDMsHahQgVRD/N5uCRnh2hVeTbhM1PM6tAeKPA==
X-Google-Smtp-Source: AGHT+IH5sLg/BL7saD9/TXa220ctb5hvcylawPt/eU1IH9MP/VmfAzkYvlQbzwvsbvXXi2U8bfsvnevyQYB2IQEHh6U=
X-Received: by 2002:a05:6830:25d6:b0:703:63d3:9eef with SMTP id
 46e09a7af769-70f7072e89bmr16742155a34.25.1725519383303; Wed, 04 Sep 2024
 23:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-2-jens.wiklander@linaro.org> <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
In-Reply-To: <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Sep 2024 08:56:11 +0200
Message-ID: <CAHUa44G9yF2GoQD8XrE=agkGCditH1v+NYm16WpdORX4aRixYg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dma-buf: heaps: restricted_heap: add no_map attribute
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_235624_739161_7F33CAD4 
X-CRM114-Status: GOOD (  25.69  )
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

On Fri, Aug 30, 2024 at 10:47=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 30.08.24 um 09:03 schrieb Jens Wiklander:
> > Add a no_map attribute to struct restricted_heap_attachment and struct
> > restricted_heap to skip the call to dma_map_sgtable() if set. This
> > avoids trying to map a dma-buf that doens't refer to memory accessible
> > by the kernel.
>
> You seem to have a misunderstanding here dma_map_sgtable() is called to
> map a table into IOMMU and not any kernel address space.
>
> So please explain why you need that?

You're right, I had misunderstood dma_map_sgtable(). There's no need
for the no_map attribute, so I'll remove it.

Perhaps you have a suggestion on how to fix a problem when using
dma_map_sgtable()?

Without it, I'll have to assign a pointer to teedev->dev.dma_mask when
using the restricted heap with the OP-TEE driver or there will be a
warning in __dma_map_sg_attrs() ending with a failure when trying to
register the dma-buf fd. OP-TEE is probed with a platform device, and
taking the dma_mask pointer from that device works. Is that a good
approach or is there a better way of assigning dma_mask?

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   drivers/dma-buf/heaps/restricted_heap.c | 17 +++++++++++++----
> >   drivers/dma-buf/heaps/restricted_heap.h |  2 ++
> >   2 files changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/=
heaps/restricted_heap.c
> > index 8bc8a5e3f969..4bf28e3727ca 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.c
> > +++ b/drivers/dma-buf/heaps/restricted_heap.c
> > @@ -16,6 +16,7 @@
> >   struct restricted_heap_attachment {
> >       struct sg_table                 *table;
> >       struct device                   *dev;
> > +     bool no_map;
> >   };
> >
> >   static int
> > @@ -54,6 +55,8 @@ restricted_heap_memory_free(struct restricted_heap *r=
heap, struct restricted_buf
> >   static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attachment)
> >   {
> >       struct restricted_buffer *restricted_buf =3D dmabuf->priv;
> > +     struct dma_heap *heap =3D restricted_buf->heap;
> > +     struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> >       struct restricted_heap_attachment *a;
> >       struct sg_table *table;
> >
> > @@ -70,6 +73,7 @@ static int restricted_heap_attach(struct dma_buf *dma=
buf, struct dma_buf_attachm
> >       sg_dma_mark_restricted(table->sgl);
> >       a->table =3D table;
> >       a->dev =3D attachment->dev;
> > +     a->no_map =3D rheap->no_map;
> >       attachment->priv =3D a;
> >
> >       return 0;
> > @@ -92,9 +96,12 @@ restricted_heap_map_dma_buf(struct dma_buf_attachmen=
t *attachment,
> >       struct sg_table *table =3D a->table;
> >       int ret;
> >
> > -     ret =3D dma_map_sgtable(attachment->dev, table, direction, DMA_AT=
TR_SKIP_CPU_SYNC);
> > -     if (ret)
> > -             return ERR_PTR(ret);
> > +     if (!a->no_map) {
> > +             ret =3D dma_map_sgtable(attachment->dev, table, direction=
,
> > +                                   DMA_ATTR_SKIP_CPU_SYNC);
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +     }
> >       return table;
> >   }
> >
> > @@ -106,7 +113,9 @@ restricted_heap_unmap_dma_buf(struct dma_buf_attach=
ment *attachment, struct sg_t
> >
> >       WARN_ON(a->table !=3D table);
> >
> > -     dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKI=
P_CPU_SYNC);
> > +     if (!a->no_map)
> > +             dma_unmap_sgtable(attachment->dev, table, direction,
> > +                               DMA_ATTR_SKIP_CPU_SYNC);
> >   }
> >
> >   static int
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/=
heaps/restricted_heap.h
> > index 7dec4b8a471b..94cc0842f70d 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > @@ -27,6 +27,8 @@ struct restricted_heap {
> >       unsigned long           cma_paddr;
> >       unsigned long           cma_size;
> >
> > +     bool                    no_map;
> > +
> >       void                    *priv_data;
> >   };
> >
>

