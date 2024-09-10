Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5342FEDE99A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiSPE2re4i7ztv5W1E1npIwrh98/6F2AGMg3S1xMoPU=; b=RIAdUYrebUl6GfAbdTXDosJh78
	8x1nrBAsjbxSpu9Tqp09td6YeEH0Gnq0odPDcCfWdg63/BexHiy8l8OHpogjkWbMS2LeIiBTi3QhI
	htyNQjh30RGAiWDFR45+FQGtQbV71doV0PPuk11jN/bxz3PJiOOebL4SwgD1vOQb+TpeauoFkPvap
	LtxXJ6WI49ykdqVzNcViSwbak2jj/qeO4ero9SDct3lUXWOnmEfbSxpqzoPW0TxM2Bdgx3mEz3+jX
	j1cnJ8EPzVZxKNKz7hev99xd7GQmn1B54ld0l4xb/bWFaJrPsVA7D3Giv0qnG2tmX1Vv6Zdzatn+I
	z2aCQU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so2Tj-00000005zuy-2VjL;
	Tue, 10 Sep 2024 15:08:27 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so2Tf-00000005zt0-49IY
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 15:08:25 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4582fa01090so289131cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725980902; x=1726585702; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiSPE2re4i7ztv5W1E1npIwrh98/6F2AGMg3S1xMoPU=;
        b=ljdjsw4Yi+vA1Cz+zqvHqrAaIX+1aOjJTgB+psUPoU8C+7Hk8Mm+0N8PyhaJoqcSaU
         67cyl7X5nezlzPxkLn2OtwPzYto8c3p974HpHQMeqmpIuog8ybOTLlUIpVze9b9TWXzv
         tIC93Ee1MP7i5JfQgpq4sl72poWksce5q4ms93EzjJhO5UzJIIfQH+aBIymrEERifX+8
         B7KxjGVYyAig72rSZWRWG226Y22EekcSFwoIobx9XgjO2D4teD2y+ZsiYE+visNmuEHT
         vYobeveq7aR/7QeM6tl3R1ZMEHeAdy5vDf194XRZTpCjFVI0tpb0oGy99wURlc6owcwn
         e3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980902; x=1726585702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiSPE2re4i7ztv5W1E1npIwrh98/6F2AGMg3S1xMoPU=;
        b=YjNyIC8U9MtqGrVbrL24nDfydpryQQbNIzZqx6ggbh9LFY/mQUFX8yKclaeOa2hBnu
         8OGA+6sxCwZ7BTDM4yICQ0lWsy6oV+I9Kx/an8Sycoac+BXMLiUccQwseHnjGKk8sPNq
         9lhed5Uyx/FAcMI8lubj6tbNqZp4OS/ETwH4oyiq14GD3Hj/8tlOoPdfJ1QFmPbd7Dlk
         wd4KbXaSHpDAuk+K8VsFGRho/WFMLjUqfayw7lwiVZVL27J3jjTzDTaVWFaDKa4vnbzx
         ZxnYMoZS1z/22LHn7BaNWkjxa0cvdZqQVpA5qiTPeeuyNRby2UjT2acqQAn0+Omxt290
         nOPw==
X-Forwarded-Encrypted: i=1; AJvYcCU1XQvRAhc9AKs0iLNc3IpCLoS+DWvEiVgp0+3jIuqHuHurRTePkZa5B2/r+ZFGrPBkvfSew3rKsv1rBzOXzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMC39+o7aCqoMTGumlpkYjXa2KeORGpdVcl3IN/K8P5Ln4AqhF
	YG4p3T9aZDy1lPHu+xMJjciuPBw3lDxYvHK3wcTzbEWttbNZCU04BhmPzsCKo/vIsYyp1wkYHnR
	LY3Pz356CT2vtQJeFyS36KANoctB3E7OC8+lb
X-Google-Smtp-Source: AGHT+IGk/+MqjVLBNa+qD5EowmlfqCvCzaFlTfS1uq8t2r3RhadFZpBGCv9ceFcyyjW5GiIdk+Cu14iQs471/8FCg7c=
X-Received: by 2002:ac8:5dc6:0:b0:456:7ef1:929d with SMTP id
 d75a77b69052e-4583d0600f1mr4121411cf.12.1725980901915; Tue, 10 Sep 2024
 08:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
 <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com> <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
In-Reply-To: <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Sep 2024 08:08:10 -0700
Message-ID: <CABdmKX2Tsp-KG6_Lth7VUcZcxCfgbsBYqZ5N2h574J+sNP2SxA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap support
To: Jens Wiklander <jens.wiklander@linaro.org>
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
X-CRM114-CacheID: sfid-20240910_080824_072889_62FB3AF3 
X-CRM114-Status: GOOD (  32.46  )
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

On Mon, Sep 9, 2024 at 11:06=E2=80=AFPM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander@l=
inaro.org> wrote:
> > >
> > > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google=
.com> wrote:
> > > >
> > > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > > <jens.wiklander@linaro.org> wrote:
> > > > >
> > > > > Add a Linaro restricted heap using the linaro,restricted-heap bin=
dings
> > > > > implemented based on the generic restricted heap.
> > > > >
> > > > > The bindings defines a range of physical restricted memory. The h=
eap
> > > > > manages this address range using genalloc. The allocated dma-buf =
file
> > > > > descriptor can later be registered with the TEE subsystem for lat=
er use
> > > > > via Trusted Applications in the secure world.
> > > > >
> > > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > ---
> > > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++=
++++++
> > > > >  3 files changed, 176 insertions(+)
> > > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.=
c
> > > > >
> > > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heap=
s/Kconfig
> > > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > > >         help
> > > > >           Enable restricted dma-buf heaps for MediaTek platform. =
This heap is backed by
> > > > >           TEE client interfaces. If in doubt, say N.
> > > > > +
> > > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > > +       help
> > > > > +         Choose this option to enable the Linaro restricted dma-=
buf heap.
> > > > > +         The restricted heap pools are defined according to the =
DT. Heaps
> > > > > +         are allocated in the pools using gen allocater.
> > > > > +         If in doubt, say N.
> > > > > +
> > > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/hea=
ps/Makefile
> > > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > > @@ -2,4 +2,5 @@
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_h=
eap_mtk.o
> > > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_h=
eap_linaro.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/dri=
vers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > new file mode 100644
> > > > > index 000000000000..4b08ed514023
> > > > > --- /dev/null
> > > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > @@ -0,0 +1,165 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * DMABUF secure heap exporter
> > > > > + *
> > > > > + * Copyright 2021 NXP.
> > > > > + * Copyright 2024 Linaro Limited.
> > > > > + */
> > > > > +
> > > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > > +
> > > > > +#include <linux/dma-buf.h>
> > > > > +#include <linux/err.h>
> > > > > +#include <linux/genalloc.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/of_fdt.h>
> > > > > +#include <linux/of_reserved_mem.h>
> > > > > +#include <linux/scatterlist.h>
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +#include "restricted_heap.h"
> > > > > +
> > > > > +#define MAX_HEAP_COUNT 2
> > > >
> > > > Are multiple supported because of what Cyrille mentioned here about=
 permissions?
> > > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709=
@DBBPR04MB7514.eurprd04.prod.outlook.com/
> > >
> > > Yes, I kept that as is.
> >
> > Ok thanks.
> >
> > > > So this is just some arbitrary limit? I'd prefer to have some sort =
of
> > > > documentation about this.
> > >
> > > How about removing the limit and using dynamic allocation instead?
> >
> > That works too!
>
> It turns out that was easier said than done. The limit is hardcoded
> because dynamic memory allocation isn't available at that stage during
> boot. We have a short description of this heap in Kconfig. I'll add
> something about the limit there if that makes sense.
>
> Thanks,
> Jens

Ah ok sounds good.

I noticed one other thing, linaro_restricted_heap_init and add_heap
should probably have __init. Last week I sent a patch to add that for
the CMA and system heaps.

