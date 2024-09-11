Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC5EE01F3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 05:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQuYmmGkZQSTH3xLGsMnzwcqDZfFYWN76TvS9W1XNG8=; b=CEzYEj4di+kK7tEeozMV0X44SE
	khJP+dT1GqpJ76eYHc7EzlH+IdLU17UlYA4+xXMcDjBnei8vdCgJiOw6ozUOxHxGSu79B9HvBuV1S
	lw3fIxSMupRI+KfwONHtd7LgbmuBONgSJaBdpfSMeYb0MPdcJ5nWSdWmvb22ej6SMsXxlnDFKy+Fi
	4E7Lrv3pCCp0PhqWxntBGQ60AI4geY21pGlxdQMBfpd7Ep8PmB/vJbwISPuELYYjQ/YUfMJT08KtE
	Jan1Qnf9ZFwOROjh5xOcJPnh01/1yJ6SJ6zvPdDa2muz2atqFq7CslyP4tGhPI8VdmFhH3OrkDEK8
	w/E8XRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soGOQ-00000008CwK-0rgi;
	Wed, 11 Sep 2024 05:59:54 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soGNN-00000008Coa-0bQg
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 05:58:51 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-277fa3de06fso3028139fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 22:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726034328; x=1726639128; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQuYmmGkZQSTH3xLGsMnzwcqDZfFYWN76TvS9W1XNG8=;
        b=qwo+8nQU1++f50KTxc6+nqC+qpbgftZfZALzxjXuC72IXkq8cJTmySn3VhmkB6QkO4
         4s0djb3+hXWPP/xQSNNR18oAr49Ndi9oa7/Fms92P5TtqS0HNC90rDE9UFBkRQv34bmZ
         9fWDNt7oUHPFVMTPWnO/n/pl8rZ/8cUAATIeDqWDdDDmfqvQ5Hz3zXIxYAWZ+IVOvvw5
         DyJgjKGKs6Brp+921oIq5P2RqpIZkBuZE9nMEo6bnIXpeYIkAygnLr+2NiZbyb8YYbp0
         GknfHh/R610Deus0B54of+NL6x9PrHOLhB3Eri5Cc79A15LncXipg5NgX8bduYOo7UIk
         4O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726034328; x=1726639128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQuYmmGkZQSTH3xLGsMnzwcqDZfFYWN76TvS9W1XNG8=;
        b=r1CIzR9ZCxSSira5FuEYGJZdCRQ9Jr1ZQViHW/xNtZ7iq5qHP1eSP8Oguu8kxcdQkE
         T6sklKGeo48wptLTBJfaeey5fiOWwExOvpnJ14V5u18ngN7PCT+SFSnSi44ShWCl8dUY
         PWF1pPD3VN4PixidgBKIo5mdsYELlhhVimozNmk2DJKj/l8FhwD4txt7Tg2TcwPAbA1L
         Q0BxiCxwnGUl4JbS3pIWvWvBhr+Us/Og5iLAn6W3O1TMdndvnKN53od0pQyEbL+4sJge
         sUrehLwIe4W5WbU7NZD4MzSWSCO7scgOu739F4Xwzv2V0iKwJJVYmjWZV6zr6Advjdg+
         vwyg==
X-Forwarded-Encrypted: i=1; AJvYcCW7OP6Js2pb/wEeUQg/Ru8CWxeUOb6jfEzzPcCalYwn1IjBUZGJAexQavjvydLQ1yX3OIH0eLduMLAnJivS7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnKDDaELRmkwWypucrLVm4sCsAoxyqWp9zsEVILsZMguvwE3W6
	QR0WcAqLEF3uFzfF6vNllWtoI3Af4N2AVoFBbdbhvTMAkTBiLiOmjHo8MabE/uO9EZDj68X0vqc
	oZCFd64V4ynXo+bW3C5UZZEgvxueWt856p+ltHg==
X-Google-Smtp-Source: AGHT+IGW84UWOA5xC2203pkvht57DpEX0/BC3BhwlaltfaRSJeBxnIuKEFhXcRdVK9MgL8mADdwKjHbUJPQhBWPPeEQ=
X-Received: by 2002:a05:6870:469e:b0:277:ca2f:905 with SMTP id
 586e51a60fabf-27b82fab148mr16719695fac.29.1726034327791; Tue, 10 Sep 2024
 22:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
 <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
 <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com> <CABdmKX2Tsp-KG6_Lth7VUcZcxCfgbsBYqZ5N2h574J+sNP2SxA@mail.gmail.com>
In-Reply-To: <CABdmKX2Tsp-KG6_Lth7VUcZcxCfgbsBYqZ5N2h574J+sNP2SxA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Sep 2024 07:58:36 +0200
Message-ID: <CAHUa44G9j4rOZHX+XCQyM+mkru12Hy01iyj=USHHiD0raTDfZA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap support
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_225849_211385_87E1D015 
X-CRM114-Status: GOOD (  32.66  )
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

On Tue, Sep 10, 2024 at 5:08=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Mon, Sep 9, 2024 at 11:06=E2=80=AFPM Jens Wiklander
> <jens.wiklander@linaro.org> wrote:
> >
> > On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander=
@linaro.org> wrote:
> > > >
> > > > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@goog=
le.com> wrote:
> > > > >
> > > > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > > > <jens.wiklander@linaro.org> wrote:
> > > > > >
> > > > > > Add a Linaro restricted heap using the linaro,restricted-heap b=
indings
> > > > > > implemented based on the generic restricted heap.
> > > > > >
> > > > > > The bindings defines a range of physical restricted memory. The=
 heap
> > > > > > manages this address range using genalloc. The allocated dma-bu=
f file
> > > > > > descriptor can later be registered with the TEE subsystem for l=
ater use
> > > > > > via Trusted Applications in the secure world.
> > > > > >
> > > > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > ---
> > > > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++=
++++++++
> > > > > >  3 files changed, 176 insertions(+)
> > > > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linar=
o.c
> > > > > >
> > > > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/he=
aps/Kconfig
> > > > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > > > >         help
> > > > > >           Enable restricted dma-buf heaps for MediaTek platform=
. This heap is backed by
> > > > > >           TEE client interfaces. If in doubt, say N.
> > > > > > +
> > > > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > > > +       help
> > > > > > +         Choose this option to enable the Linaro restricted dm=
a-buf heap.
> > > > > > +         The restricted heap pools are defined according to th=
e DT. Heaps
> > > > > > +         are allocated in the pools using gen allocater.
> > > > > > +         If in doubt, say N.
> > > > > > +
> > > > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/h=
eaps/Makefile
> > > > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > > > @@ -2,4 +2,5 @@
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted=
_heap_mtk.o
> > > > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted=
_heap_linaro.o
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/d=
rivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..4b08ed514023
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > > @@ -0,0 +1,165 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +/*
> > > > > > + * DMABUF secure heap exporter
> > > > > > + *
> > > > > > + * Copyright 2021 NXP.
> > > > > > + * Copyright 2024 Linaro Limited.
> > > > > > + */
> > > > > > +
> > > > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > > > +
> > > > > > +#include <linux/dma-buf.h>
> > > > > > +#include <linux/err.h>
> > > > > > +#include <linux/genalloc.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/of.h>
> > > > > > +#include <linux/of_fdt.h>
> > > > > > +#include <linux/of_reserved_mem.h>
> > > > > > +#include <linux/scatterlist.h>
> > > > > > +#include <linux/slab.h>
> > > > > > +
> > > > > > +#include "restricted_heap.h"
> > > > > > +
> > > > > > +#define MAX_HEAP_COUNT 2
> > > > >
> > > > > Are multiple supported because of what Cyrille mentioned here abo=
ut permissions?
> > > > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F7887=
09@DBBPR04MB7514.eurprd04.prod.outlook.com/
> > > >
> > > > Yes, I kept that as is.
> > >
> > > Ok thanks.
> > >
> > > > > So this is just some arbitrary limit? I'd prefer to have some sor=
t of
> > > > > documentation about this.
> > > >
> > > > How about removing the limit and using dynamic allocation instead?
> > >
> > > That works too!
> >
> > It turns out that was easier said than done. The limit is hardcoded
> > because dynamic memory allocation isn't available at that stage during
> > boot. We have a short description of this heap in Kconfig. I'll add
> > something about the limit there if that makes sense.
> >
> > Thanks,
> > Jens
>
> Ah ok sounds good.
>
> I noticed one other thing, linaro_restricted_heap_init and add_heap
> should probably have __init. Last week I sent a patch to add that for
> the CMA and system heaps.

Thanks, I'll add it.

Cheers,
Jens

