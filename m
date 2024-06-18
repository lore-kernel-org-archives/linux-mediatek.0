Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F00C27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 06:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJr9JzMYPoHUkzMHoCiTq0VIt4qu1sC4HEHrc5vqagc=; b=eM1ioUPRNwx6uZtSdDDaBoVtyq
	ohIcZDfZUKDSvQkCXx/ZiD9XMYpw044kH3MMltOSDIFWNzmfuPgEEPwVVKQdPqc+yLZP/k5hHuycj
	Ti1YBsDZEWLczPDQCwauncmqx1DI9gprvZUnqMLoIeX+0O65L1YCEamVWTn2kw4uI7hLdFH9I+tst
	L9Hql7JxMvCIKd6RAUcNBi015ruE+qCmtBb+gQdlwXuzFkVhzFgnzL6ShMkcn4E5SNqBZJtGAvboE
	mltbwzVi9rFVX8BWJjx5Zpnh9XSdpwSBv0Ov2Tb5xkGVDBp7o9D9gH/nvIt2FtPKsF5nDcYXoNX87
	N62AzZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJS8s-0000000DlR9-2ZiW;
	Tue, 18 Jun 2024 06:16:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJS8o-0000000DlOS-3D6y
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jun 2024 06:16:28 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a6f0e153eddso647927566b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jun 2024 23:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718691383; x=1719296183; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJr9JzMYPoHUkzMHoCiTq0VIt4qu1sC4HEHrc5vqagc=;
        b=isAblybbq6yrBjobKzqeAH1zlmf0tLOwOS9fY6Le2UanfnYCfx9Vt6LBmkIeOVFSWj
         Nb7regYCX4R72evHEWTBh9JzBf/Z068sEAkdkua6oHMUOjr2YpnocJrT0ThpshQKd8Rs
         5/bZEi+My1YmUzQUOO2SurVyENV77zCj+Lupw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718691383; x=1719296183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJr9JzMYPoHUkzMHoCiTq0VIt4qu1sC4HEHrc5vqagc=;
        b=t4Ub3PjscG8iof/gxvhXxIdr803n7z0bFmH7oJcCLRxwGhpo8YFm1CcBjT/Sahimb7
         7HPYrq8PoFgK9jXDsvzFkMNH0pzEWtFZDP+OVskcLxTgQViIn/NVh1L/0VATUrfOFcMP
         ua3gB+F/RcwzPqganO6QMfYPhyBjVeHyDCvN13lW8WdZBr92TSzIcD1JQhpKx3jgEeP1
         XWExiKjdRJ4nKUOwOYupoX7Jl+buvCZuApE4E2V2pwIuxCcUEmqP5YIGSPNmZLpp62xV
         0vixJQjTsP4wbnz+Ar73v1ocaev3QmqgTtkMkJVC79UXrOZ7xgB9M0Nk83k9uMBZnRlY
         5sZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmD/CbdpZgyYaiwvDdhQCbhuhq6m/1uGs3LxxG8uCQ62wlBW/2ZK5p/OUyu40sLRh8MkoK3sGgF23RCvgrCeV5zmN3/p/53L+OSrZfm6aoQDyr
X-Gm-Message-State: AOJu0YypCEQCtkem+2om9xjuFGyvIqaH+5UeN1qOQl8KTVnVjaqLgonL
	EatdAH12+YiDtcdsT2kXOX+0xmUoHONbmsM9PiBYn/5tOIj4+38ma+nstuQRC7IWQiSLXX+RJhV
	m1Q==
X-Google-Smtp-Source: AGHT+IFR+PMkJUVu9VcUIKicu0W4IigubtkQuryCVN4c7RShgMBIvtHiRY9UXuLhOvTfOM8ne7DMGQ==
X-Received: by 2002:a17:906:ba82:b0:a6f:6ec0:554e with SMTP id a640c23a62f3a-a6f6ec0588amr746919366b.17.1718691383254;
        Mon, 17 Jun 2024 23:16:23 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41700sm587221466b.152.2024.06.17.23.16.22
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 23:16:23 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f0e153eddso647925866b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jun 2024 23:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4zxQmBoFoujVofRXUQFcRYQ2U33mWodHs6jHAsciL21CJ8M2WXSEIVKJeRnkvQu6OSEbeXFdaHV7cx6YoVK/GCAsVTYZeZNndaBl5ixBOC9yG
X-Received: by 2002:a17:906:b2c8:b0:a6f:5723:fb11 with SMTP id
 a640c23a62f3a-a6f60dc50bcmr730791166b.58.1718691382366; Mon, 17 Jun 2024
 23:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-13-yunfei.dong@mediatek.com> <4a5tf2cl744xzqslox4ddzmdpuvwksr54g3qk2jl4soatdts45@e6xmmm2ijmv6>
 <20fec212d49cc3f0479be7a855d9816f5739ce93.camel@mediatek.com>
In-Reply-To: <20fec212d49cc3f0479be7a855d9816f5739ce93.camel@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 18 Jun 2024 15:16:01 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BgELHBm6zOckbOv6cg1OD8Ghwry-EG3EnETTh9hF7EzA@mail.gmail.com>
Message-ID: <CAAFQd5BgELHBm6zOckbOv6cg1OD8Ghwry-EG3EnETTh9hF7EzA@mail.gmail.com>
Subject: Re: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
Cc: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org" <stevecho@chromium.org>, 
	"wenst@chromium.org" <wenst@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "jstultz@google.com" <jstultz@google.com>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"jkardatzke@google.com" <jkardatzke@google.com>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
	"tjmercier@google.com" <tjmercier@google.com>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "hsinyi@chromium.org" <hsinyi@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_231626_847326_A8D4AE2C 
X-CRM114-Status: GOOD (  25.23  )
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

On Mon, Jun 17, 2024 at 3:53=E2=80=AFPM Yong Wu (=E5=90=B4=E5=8B=87) <Yong.=
Wu@mediatek.com> wrote:
>
> On Wed, 2024-06-12 at 14:22 +0900, Tomasz Figa wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Thu, May 16, 2024 at 08:20:50PM +0800, Yunfei Dong wrote:
> > > Need to call dma heap interface to allocate/free secure memory when
> > playing
> > > secure video.
> > >
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > ---
> > >  .../media/platform/mediatek/vcodec/Kconfig    |   1 +
> > >  .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122
> > +++++++++++++++++-
> > >  .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
> > >  3 files changed, 123 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig
> > b/drivers/media/platform/mediatek/vcodec/Kconfig
> > > index bc8292232530..707865703e61 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> > > +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> > > @@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
>
> [snip]
>
> > > -void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> > > +static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx
> > *ctx, struct mtk_vcodec_mem *mem)
> > > +{
> > > +struct device *dev =3D &ctx->dev->plat_dev->dev;
> > > +struct dma_buf *dma_buffer;
> > > +struct dma_heap *vdec_heap;
> > > +struct dma_buf_attachment *attach;
> > > +struct sg_table *sgt;
> > > +unsigned long size =3D mem->size;
> > > +int ret =3D 0;
> > > +
> > > +if (!size)
> > > +return -EINVAL;
> > > +
> > > +vdec_heap =3D dma_heap_find("restricted_mtk_cma");
> > > +if (!vdec_heap) {
> > > +mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
> > > +return -EPERM;
> > > +}
> >
> > How is the heap name determined here? My recollection is that the
> > heap
> > name comes from the heap node in the DT, so it may vary depending on
> > the
> > board.
> >
> > Is the heap name documented anywhere in the DT bindings?
> >
> > Shouldn't we rather query DT for a phandle to the right heap?
> >
>
> Hi Tomasz,
>
> This heap name does not come from dt-binding. It is hard-coded in the
> driver[1]. Because the heap driver is a pure SW driver, there is no
> corresponding HW unit, and there is no way to add a dtsi node.
>
> [1]
> https://lore.kernel.org/linux-mediatek/20240515112308.10171-10-yong.wu@me=
diatek.com/

Okay, I see. Thanks for clarifying.

Best regards,
Tomasz

