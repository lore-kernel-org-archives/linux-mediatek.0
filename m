Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06151CD484C
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJEfWMki53C0C9QhqoAya3sbRCJGrb7hvD0oAvB4tgE=; b=36vuArgj4QFo5O5VuQlwTGunyh
	tDtgVqtFG618HnU076UhaiqxwiKYUi3aiiZ3HClNeo6S90CC3Fi6npm6FR5XvgP6v/811N0f9jHSO
	hIHRiukrV2NzS9h6n+L3p68HCYbpFZ4cbSjn2RuGlUIKWaa0DuFIVJ/dtR6GxVuf1vTDpxNmvaL1c
	h5g35h9b1yApky75/8IsKMd08Z2XeY4vn9eHVsD6WITejaNhmhXxPb88QCkV/s2m2EAK1GwyNTD7F
	Mtn+y+TcBNQi37g4VigqQhQNzQ2sQZ/oM56xnOsSuJ+XyJrS2eyiqMyqRnRnRUqeUOjVIduyr8AdF
	8K9VuGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkl5-009c29-10;
	Fri, 22 Sep 2023 18:20:07 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkl2-009c0d-1T
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Sep 2023 18:20:06 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d8020510203so2951819276.2
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Sep 2023 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695406799; x=1696011599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJEfWMki53C0C9QhqoAya3sbRCJGrb7hvD0oAvB4tgE=;
        b=xjUvI/xuwNkWo8f2J5L4naRGL2Q2VmjDmlVE4EW+0/tSDJNWCoOMrdAnoPK/iPo+76
         JNvO80pXXvdRrBDngJ6b/kXOV2DeFe78HvdJAisYI5Bedefso3EkjYfuP//4JK1w4JKC
         1fZkqPEx8J3lwA1YjI15codwu29rGgNewrZUUYcjwH//rn43Mehchgz2oGggtPPKB7WF
         c6ve+x/IR09iGYoWrvwUGqLrJbaHaEDtGv1Z70nLixAOa3aVTyOdyXYJUoQoaraCo/77
         XJZMJDRSFFS0LBRKpaBOFP7Cvu88Dxk5SI/E3DZqbo37mJ2mR3OJl8gV80ny25Jxv+Dv
         Q55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695406799; x=1696011599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJEfWMki53C0C9QhqoAya3sbRCJGrb7hvD0oAvB4tgE=;
        b=U/9ipB8FEfPUZg+7uKg3YL1kKIBkhyDk3frX6tFDkqt2zV+lU3Gh4NW/2ajp0SRI2H
         10OoyYBLKx8epFwTsJwkSM7tgmlM4VZ8auYrWmJ6sulQ+M8jvQxrNeFvBxaeTS2tZ5Tx
         e9uOj/ETpmZkjTH2hq2V15A22dpaKVUZoM0IDN5GROQ9PrvVM2bj+vuU8i9zflYW6guf
         0fu5nwZxgEm3ZTO0WKTAtMXcwaTfmqryBZ4y5gq07fR9dHBJkJuwh2B7D/Y/9wMR38NF
         mSvvDp2DQPNAiN0oDQlv6/un49JaL80o79f3p0NYK1+M31B6NkQX3yEfXZp5o0p3BFyR
         nonw==
X-Gm-Message-State: AOJu0Yw+Zv3SMU4WLQpmnmER6V33h2Iuu/QvqHQfPeMllOj+I97TZZf5
	4MCF81nk+HjovG3XJ67Mh/Twtr2E+Y95wH4BlN9okg==
X-Google-Smtp-Source: AGHT+IEHQohIXqITSfor/S743Ge1pG10gsNJCzDT+XFRdZSUhjj6xBKLS9Ve3hl88Y+oLZXD7F7ZDyjyqF5lKzjIhh8=
X-Received: by 2002:a25:9205:0:b0:d81:6344:540b with SMTP id
 b5-20020a259205000000b00d816344540bmr65049ybo.45.1695406798515; Fri, 22 Sep
 2023 11:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com> <20230911023038.30649-3-yong.wu@mediatek.com>
 <71c435a6-ba43-5d26-e658-f55bddbb8b98@amd.com>
In-Reply-To: <71c435a6-ba43-5d26-e658-f55bddbb8b98@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 22 Sep 2023 11:19:46 -0700
Message-ID: <CABdmKX1-5ujRRVQHNVMkoC4Ls0mruxE8GCXNavRLyywD7SobOw@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma-heap: Add proper kref handling on dma-buf heaps
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_112004_495564_ED44E1F4 
X-CRM114-Status: GOOD (  36.22  )
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

On Mon, Sep 11, 2023 at 2:49=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 11.09.23 um 04:30 schrieb Yong Wu:
> > From: John Stultz <jstultz@google.com>
> >
> > Add proper refcounting on the dma_heap structure.
> > While existing heaps are built-in, we may eventually
> > have heaps loaded from modules, and we'll need to be
> > able to properly handle the references to the heaps
> >
> > Also moves minor tracking into the heap structure so
> > we can properly free things.
>
> This is completely unnecessary, see below.
>
> >
> > Signed-off-by: John Stultz <jstultz@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add comment for "minor" and "refcount"]
> > ---
> >   drivers/dma-buf/dma-heap.c | 38 ++++++++++++++++++++++++++++++++++---=
-
> >   include/linux/dma-heap.h   |  6 ++++++
> >   2 files changed, 40 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 51030f6c9d6e..dcc0e38c61fa 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/dma-buf.h>
> >   #include <linux/dma-heap.h>
> >   #include <linux/err.h>
> > +#include <linux/kref.h>
> >   #include <linux/list.h>
> >   #include <linux/nospec.h>
> >   #include <linux/syscalls.h>
> > @@ -30,6 +31,8 @@
> >    * @heap_devt:              heap device node
> >    * @list:           list head connecting to list of heaps
> >    * @heap_cdev:              heap char device
> > + * @minor:           heap device node minor number
> > + * @refcount:                reference counter for this heap device
> >    *
> >    * Represents a heap of memory from which buffers can be made.
> >    */
> > @@ -40,6 +43,8 @@ struct dma_heap {
> >       dev_t heap_devt;
> >       struct list_head list;
> >       struct cdev heap_cdev;
> > +     int minor;
> > +     struct kref refcount;
> >   };
> >
> >   static LIST_HEAD(heap_list);
> > @@ -205,7 +210,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >   {
> >       struct dma_heap *heap, *h, *err_ret;
> >       struct device *dev_ret;
> > -     unsigned int minor;
> >       int ret;
> >
> >       if (!exp_info->name || !strcmp(exp_info->name, "")) {
> > @@ -222,12 +226,13 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >       if (!heap)
> >               return ERR_PTR(-ENOMEM);
> >
> > +     kref_init(&heap->refcount);
> >       heap->name =3D exp_info->name;
> >       heap->ops =3D exp_info->ops;
> >       heap->priv =3D exp_info->priv;
> >
> >       /* Find unused minor number */
> > -     ret =3D xa_alloc(&dma_heap_minors, &minor, heap,
> > +     ret =3D xa_alloc(&dma_heap_minors, &heap->minor, heap,
> >                      XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
> >       if (ret < 0) {
> >               pr_err("dma_heap: Unable to get minor number for heap\n")=
;
> > @@ -236,7 +241,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       }
> >
> >       /* Create device */
> > -     heap->heap_devt =3D MKDEV(MAJOR(dma_heap_devt), minor);
> > +     heap->heap_devt =3D MKDEV(MAJOR(dma_heap_devt), heap->minor);
> >
> >       cdev_init(&heap->heap_cdev, &dma_heap_fops);
> >       ret =3D cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
> > @@ -280,12 +285,37 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >   err2:
> >       cdev_del(&heap->heap_cdev);
> >   err1:
> > -     xa_erase(&dma_heap_minors, minor);
> > +     xa_erase(&dma_heap_minors, heap->minor);
> >   err0:
> >       kfree(heap);
> >       return err_ret;
> >   }
> >
> > +static void dma_heap_release(struct kref *ref)
> > +{
> > +     struct dma_heap *heap =3D container_of(ref, struct dma_heap, refc=
ount);
> > +
> > +     /* Note, we already holding the heap_list_lock here */
> > +     list_del(&heap->list);
> > +
> > +     device_destroy(dma_heap_class, heap->heap_devt);
> > +     cdev_del(&heap->heap_cdev);
> > +     xa_erase(&dma_heap_minors, heap->minor);
>
> You can just use MINOR(heap->heap_devt) here instead.
>
Got it, thanks.

> > +
> > +     kfree(heap);
> > +}
> > +
> > +void dma_heap_put(struct dma_heap *h)
> > +{
> > +     /*
> > +      * Take the heap_list_lock now to avoid racing with code
> > +      * scanning the list and then taking a kref.
> > +      */
>
> This is usually considered a bad idea since it makes the kref approach
> superfluous.
>
> There are multiple possibilities how handle this, the most common one is
> to use kref_get_unless_zero() in your list traversal code and ignore the
> entry when that fails.
>
> Alternatively you could use kref_put_mutex() instead. This gives you the
> same functionality as this here, but as far as I know it's normally only
> used in a couple of special cases.
>
Ok, I'll move this mutex acquisition to dma_heap_release so that it
guards just the list_del, and change dma_heap_find to use
kref_get_unless_zero. Thanks.

> > +     mutex_lock(&heap_list_lock);
> > +     kref_put(&h->refcount, dma_heap_release);
> > +     mutex_unlock(&heap_list_lock);
> > +}
> > +
> >   static char *dma_heap_devnode(const struct device *dev, umode_t *mode=
)
> >   {
> >       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index c7c29b724ad6..f3c678892c5c 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -64,4 +64,10 @@ const char *dma_heap_get_name(struct dma_heap *heap)=
;
> >    */
> >   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_=
info);
> >
> > +/**
> > + * dma_heap_put - drops a reference to a dmabuf heap, potentially free=
ing it
> > + * @heap: the heap whose reference count to decrement
> > + */
>
> Please don't add kerneldoc to the definition, add it to the
> implementation of the function.
>
Will fix.




> Regards,
> Christian.
>
> > +void dma_heap_put(struct dma_heap *heap);
> > +
> >   #endif /* _DMA_HEAPS_H */
>

