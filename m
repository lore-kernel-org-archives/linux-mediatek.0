Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885DDCD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 10:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpZ7KdRqBjlI4gv4PMlRGcwdk6EzHsOECmqGEz11ZOc=; b=CN64veTPVtTEB7LVQF2PPPZiIt
	yrjrzKKOIUZxEmfbXsMUKwxO7QmUu/mYFIJgWqLMDt6C97mYEOObSoiCX8apEb/8R5Wv8flHS8zcs
	J9m5hM24jyKr4ViEI0sbQdYe6gtGr37ntJwZi8qzwjMNunVjhoK/z0k1cFNva2yRvEtn7LsZ7OZlz
	YYmQ4/f+pu+ocGqDPmdLVzHtZuvHcH3B5iQce7byeCt0Zll9Pox9t5ugiLHU39gR0IDFAcLPP3BNp
	yN1suwCEAc6oUhsYTQMEQEkdKtuqPBWQa2vf+LtS1GdjyEpGyS9zI42K3p8GPDHAxgFgKuGWZ8NCB
	n7tT7vFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sln66-00000003s7y-16uP;
	Wed, 04 Sep 2024 10:18:46 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmda-00000003lNl-3wWT
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:49:22 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5e172cc6d66so1648336eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443357; x=1726048157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpZ7KdRqBjlI4gv4PMlRGcwdk6EzHsOECmqGEz11ZOc=;
        b=dMKU+4dygt3u6usmBoTeUmxPrbKF0ZVx0EvMs2wESGu4E3zwSch+Y+bvbkNBhIOceL
         VvzOALqtIz+N68rV7WE65/nudH3jYTrt4Tjc0JlIcdM/+C+BfSb8VRLU15TZbHh1zhR/
         WSctSmZfrkwPQGbx/wtzzFN30681xafDBRVQJ6iWIJErA45IhMZRNlQ879k5cmkTWJcx
         XN9qlOQ3+ihz3N6Ht0uG9UuyU3SibC8oNYRWGa++uHWEEH+g2v117WnGIhOn+tpdxXbf
         6/Yr+o2svmIOJ4xQVWuejw8KRCqs+es7w73qJshWmfXXsUUFNOb3VdaxX+FHRpr3wyOn
         Q+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443357; x=1726048157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpZ7KdRqBjlI4gv4PMlRGcwdk6EzHsOECmqGEz11ZOc=;
        b=GduLRGdXPEZiQsGC4GctbDYgae3HzTJoxzOuJ+b+Ozk0TXG12DQywX+Q3ArTaSWhq0
         qavd8YxH6s9Fp0/Jf4qaoXa5jmrswF00wH29lbNMQw0pKI/daAlJDgowYYSoLC9u5ldV
         A3BKTCcjNa2Ecj4bZg80e/V8P9diJO1r/Z0oUsOQ/tv/RNvttPs6AzMu6AdlZXnNKFKA
         keVoJDvdLszorFTPTd3O9wFceBK7BUWJMuWKu6qqBAhoVcX2yrp68t0rLmtCz7Gl9hWT
         eK46Wz32AkhXEoLgFY51okCOKm0vmAIE4JqJ3Zql3YtsAQhEV8chRJE195dJM8t7gUXj
         2wtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7MvnkyIck1PmwgEBULq9AAjI78va+SNSH7TfBBVnUJV4IRyuu6JzPmfZM8RPIw2XPYaKaXncrZqGtSSB5Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Co2kxTetAFJyM2nLuLHHLfFeeHhY26HvgBSzXaff+swaoT2K
	NXQ2aca36KbbZXYoAc2sS4B4lQDzr2QiExk4hUv17GapRA9TIsIxrC29IHYuKom+2mZPgVOnIRX
	/UQkVVhIjlbBZdtMk1mbyFW3moY/JhNHkcg7TTA==
X-Google-Smtp-Source: AGHT+IEiz409Dd1CoVYf0iPvsq+r4irwqwy0woQMNOijgx+ZDuuXpfWlT5y5hKMkjy9IqrAvLIbrceafR3Xii3Kutro=
X-Received: by 2002:a05:6870:f691:b0:277:f301:40ce with SMTP id
 586e51a60fabf-2781a7abfc4mr5476161fac.20.1725443357455; Wed, 04 Sep 2024
 02:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-3-jens.wiklander@linaro.org> <CABdmKX02Zd98euuxvKHuV2C5Cng+4P3_8UL3xn2apMP9to+KOA@mail.gmail.com>
In-Reply-To: <CABdmKX02Zd98euuxvKHuV2C5Cng+4P3_8UL3xn2apMP9to+KOA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Sep 2024 11:49:06 +0200
Message-ID: <CAHUa44HfZ=xT8QFvseR_-e3xhYWQU9kg=Q-wgxN5noXBi_cLbg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
To: "T.J. Mercier" <tjmercier@google.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_024919_029294_06DA32A3 
X-CRM114-Status: GOOD (  38.79  )
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

On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> <jens.wiklander@linaro.org> wrote:
> >
> > From: Etienne Carriere <etienne.carriere@linaro.org>
> >
> > Enable userspace to create a tee_shm object that refers to a dmabuf
> > reference.
> >
> > Userspace registers the dmabuf file descriptor as in a tee_shm object.
> > The registration is completed with a tee_shm file descriptor returned t=
o
> > userspace.
> >
> > Userspace is free to close the dmabuf file descriptor now since all the
> > resources are now held via the tee_shm object.
> >
> > Closing the tee_shm file descriptor will release all resources used by =
the
> > tee_shm object.
> >
> > This change only support dmabuf references that relates to physically
> > contiguous memory buffers.
> >
> > New tee_shm flag to identify tee_shm objects built from a registered
> > dmabuf, TEE_SHM_DMA_BUF.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_core.c   |  38 ++++++++++++++
> >  drivers/tee/tee_shm.c    | 104 +++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_drv.h  |  11 +++++
> >  include/uapi/linux/tee.h |  29 +++++++++++
> >  4 files changed, 179 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index e59c20d74b36..3dfd5428d58c 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -356,6 +356,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >         return ret;
> >  }
> >
> > +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                                    struct tee_ioctl_shm_register_fd_d=
ata __user *udata)
> > +{
> > +       struct tee_ioctl_shm_register_fd_data data;
> > +       struct tee_shm *shm;
> > +       long ret;
> > +
> > +       if (copy_from_user(&data, udata, sizeof(data)))
> > +               return -EFAULT;
> > +
> > +       /* Currently no input flags are supported */
> > +       if (data.flags)
> > +               return -EINVAL;
> > +
> > +       shm =3D tee_shm_register_fd(ctx, data.fd);
> > +       if (IS_ERR(shm))
> > +               return -EINVAL;
> > +
> > +       data.id =3D shm->id;
> > +       data.flags =3D shm->flags;
> > +       data.size =3D shm->size;
> > +
> > +       if (copy_to_user(udata, &data, sizeof(data)))
> > +               ret =3D -EFAULT;
> > +       else
> > +               ret =3D tee_shm_get_fd(shm);
> > +
> > +       /*
> > +        * When user space closes the file descriptor the shared memory
> > +        * should be freed or if tee_shm_get_fd() failed then it will
> > +        * be freed immediately.
> > +        */
> > +       tee_shm_put(shm);
> > +       return ret;
> > +}
> > +
> >  static int params_from_user(struct tee_context *ctx, struct tee_param =
*params,
> >                             size_t num_params,
> >                             struct tee_ioctl_param __user *uparams)
> > @@ -830,6 +866,8 @@ static long tee_ioctl(struct file *filp, unsigned i=
nt cmd, unsigned long arg)
> >                 return tee_ioctl_shm_alloc(ctx, uarg);
> >         case TEE_IOC_SHM_REGISTER:
> >                 return tee_ioctl_shm_register(ctx, uarg);
> > +       case TEE_IOC_SHM_REGISTER_FD:
> > +               return tee_ioctl_shm_register_fd(ctx, uarg);
> >         case TEE_IOC_OPEN_SESSION:
> >                 return tee_ioctl_open_session(ctx, uarg);
> >         case TEE_IOC_INVOKE:
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index 731d9028b67f..a1cb3c8b6423 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -4,6 +4,7 @@
> >   */
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/idr.h>
> >  #include <linux/mm.h>
> >  #include <linux/sched.h>
> > @@ -14,6 +15,14 @@
> >  #include <linux/highmem.h>
> >  #include "tee_private.h"
> >
> > +/* extra references appended to shm object for registered shared memor=
y */
> > +struct tee_shm_dmabuf_ref {
> > +       struct tee_shm shm;
> > +       struct dma_buf *dmabuf;
> > +       struct dma_buf_attachment *attach;
> > +       struct sg_table *sgt;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t page_coun=
t)
> >  {
> >         size_t n;
> > @@ -44,7 +53,16 @@ static void release_registered_pages(struct tee_shm =
*shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct tee_shm =
*shm)
> >  {
> > -       if (shm->flags & TEE_SHM_POOL) {
> > +       if (shm->flags & TEE_SHM_DMA_BUF) {
> > +               struct tee_shm_dmabuf_ref *ref;
> > +
> > +               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, sh=
m);
> > +               dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +               DMA_BIDIRECTIONAL);
> > +
> > +               dma_buf_detach(ref->dmabuf, ref->attach);
> > +               dma_buf_put(ref->dmabuf);
> > +       } else if (shm->flags & TEE_SHM_POOL) {
> >                 teedev->pool->ops->free(teedev->pool, shm);
> >         } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >                 int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, =
shm);
> > @@ -56,7 +74,8 @@ static void tee_shm_release(struct tee_device *teedev=
, struct tee_shm *shm)
> >                 release_registered_pages(shm);
> >         }
> >
> > -       teedev_ctx_put(shm->ctx);
> > +       if (shm->ctx)
> > +               teedev_ctx_put(shm->ctx);
> >
> >         kfree(shm);
> >
> > @@ -168,7 +187,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_c=
ontext *ctx, size_t size)
> >   * tee_client_invoke_func(). The memory allocated is later freed with =
a
> >   * call to tee_shm_free().
> >   *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> >   */
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size=
_t size)
> >  {
> > @@ -178,6 +197,85 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
e_context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
> >
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> > +{
> > +       struct tee_shm_dmabuf_ref *ref;
> > +       int rc;
> > +
> > +       if (!tee_device_get(ctx->teedev))
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       teedev_ctx_get(ctx);
> > +
> > +       ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > +       if (!ref) {
> > +               rc =3D -ENOMEM;
> > +               goto err_put_tee;
> > +       }
> > +
> > +       refcount_set(&ref->shm.refcount, 1);
> > +       ref->shm.ctx =3D ctx;
> > +       ref->shm.id =3D -1;
> > +
> > +       ref->dmabuf =3D dma_buf_get(fd);
> > +       if (IS_ERR(ref->dmabuf)) {
> > +               rc =3D PTR_ERR(ref->dmabuf);
> > +               goto err_put_dmabuf;
> > +       }
>
> Hi,
>
> Most of the gotos in the errors paths from here on look offset by one
> to me. Attempting to put a dmabuf after failing to get, detaching
> after failing to attach, unmapping after failing to map, removing an
> IDR after failing to allocate one.

You're right, I'll fix them.

Thanks,
Jens

>
>
> > +
> > +       ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx->teed=
ev->dev);
> > +       if (IS_ERR(ref->attach)) {
> > +               rc =3D PTR_ERR(ref->attach);
> > +               goto err_detach;
> > +       }
> > +
> > +       ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIO=
NAL);
> > +       if (IS_ERR(ref->sgt)) {
> > +               rc =3D PTR_ERR(ref->sgt);
> > +               goto err_unmap_attachement;
> > +       }
> > +
> > +       if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +               rc =3D PTR_ERR(ref->sgt->sgl);
> > +               goto err_unmap_attachement;
> > +       }
> > +
> > +       ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> > +       ref->shm.size =3D ref->sgt->sgl->length;
> > +       ref->shm.flags =3D TEE_SHM_DMA_BUF;
> > +
> > +       mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +       ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm=
,
> > +                               1, 0, GFP_KERNEL);
> > +       mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +       if (ref->shm.id < 0) {
> > +               rc =3D ref->shm.id;
> > +               goto err_idr_remove;
> > +       }
> > +
> > +       return &ref->shm;
> > +
> > +err_idr_remove:
> > +       mutex_lock(&ctx->teedev->mutex);
> > +       idr_remove(&ctx->teedev->idr, ref->shm.id);
> > +       mutex_unlock(&ctx->teedev->mutex);
> > +err_unmap_attachement:
> > +       dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTION=
AL);
> > +err_detach:
> > +       dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +       dma_buf_put(ref->dmabuf);
> > +       kfree(ref);
> > +err_put_tee:
> > +       teedev_ctx_put(ctx);
> > +       tee_device_put(ctx->teedev);
> > +
> > +       return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> > +
> > +
> >  /**
> >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately s=
hared
> >   *                           kernel buffer
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index 71632e3c5f18..6a1fee689007 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -25,6 +25,7 @@
> >  #define TEE_SHM_USER_MAPPED    BIT(1)  /* Memory mapped in user space =
*/
> >  #define TEE_SHM_POOL           BIT(2)  /* Memory allocated from pool *=
/
> >  #define TEE_SHM_PRIV           BIT(3)  /* Memory private to TEE driver=
 */
> > +#define TEE_SHM_DMA_BUF                BIT(4)  /* Memory with dma-buf =
handle */
> >
> >  struct device;
> >  struct tee_device;
> > @@ -275,6 +276,16 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t=
 size);
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size=
_t size);
> >
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file descriptor
> > + *
> > + * @ctx:       Context that allocates the shared memory
> > + * @fd:                Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> > +
> >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >                                             void *addr, size_t length);
> >
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index 23e57164693c..77bc8ef24d3c 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -117,6 +117,35 @@ struct tee_ioctl_shm_alloc_data {
> >  #define TEE_IOC_SHM_ALLOC      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, =
\
> >                                      struct tee_ioctl_shm_alloc_data)
> >
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory registering a=
rgument
> > + * @fd:                [in] File descriptor identifying the shared mem=
ory
> > + * @size:      [out] Size of shared memory to allocate
> > + * @flags:     [in] Flags to/from allocation.
> > + * @id:                [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by the c=
all
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD belo=
w.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +       __s64 fd;
> > +       __u64 size;
> > +       __u32 flags;
> > +       __s32 id;
> > +} __aligned(8);
> > +
> > +/**
> > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file desc=
riptor
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor refers to the shared memory object in =
kernel
> > + * land. The shared memory is freed when the descriptor is closed.
> > + */
> > +#define TEE_IOC_SHM_REGISTER_FD        _IOWR(TEE_IOC_MAGIC, TEE_IOC_BA=
SE + 8, \
> > +                                    struct tee_ioctl_shm_register_fd_d=
ata)
> > +
> >  /**
> >   * struct tee_ioctl_buf_data - Variable sized buffer
> >   * @buf_ptr:   [in] A __user pointer to a buffer
> > --
> > 2.34.1
> >

