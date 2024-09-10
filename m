Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FDFECE582
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9MHdiQIKbQZ7sHVzFN+NNCUWOQwDHp5p4yZrC2v9dg=; b=J+NSXn8BtIVUuRPzJ4ZQZ0Q4S+
	dxKlXQpKiN2hjzLoQQ3wSUlVlBygd0HcCeB70QYmSUvB7sJ7Cd2XJsQKKd+A5wjH91A5IaxanDvyk
	tn+fKbVBPuIomgm/M/sQUDRhNCYdXEvfVKPJNhgXclQtveXnYF6O2vR/fhtn29rcMDYb8rR1admML
	DD+CWG4IeqfHnGFa+WVFXDC1S1nyqa9cFRaeorAuDW4WV9wGLjKn2wo7jdDXtcSvlsblqkDNcAKLD
	+CP0Lax9UsGdVDKyNPISbj+Fk6b6XtDMMh4gaYbUHT9HTWcO3lPOIKh3N5mNleL5M51p4zQObx6Pg
	QBaYee2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snu1n-00000004PUi-2YGh;
	Tue, 10 Sep 2024 06:07:03 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snu1k-00000004PTw-0fr1
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 06:07:02 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-27045e54272so2525597fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 23:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725948418; x=1726553218; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9MHdiQIKbQZ7sHVzFN+NNCUWOQwDHp5p4yZrC2v9dg=;
        b=NcEW107MeGuBEsThSf35RpTRowmzdx8fUnoGSMVuRi0Iaj0Ax5dJR0nypnaM1AnXzT
         g4cHyKEK5LNiGpk5YxBrkxv/bY7OExgYk52F1hai89HMckJneKUpSe+YKdXOzTfG2Ls6
         OnCt9aJZ8fBqn2kn7q5RcxO9olynbNGVdurnr1IyAsFWMtst/W/W3Wjp/8wpTb5b0CjC
         fsLz3tf0Z0LoEoWqDdgu3lj23vZbmP9x65iuRq/dcwR25OqxsuEdq6LJe4ctnjtFL9La
         4Cm3/JqgNCI2e4xq6N+jbvXmfV8iqtBcq+K2B4YugVyX1hfpT4RTeT6BLqvMmM7CCo/R
         OBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725948418; x=1726553218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9MHdiQIKbQZ7sHVzFN+NNCUWOQwDHp5p4yZrC2v9dg=;
        b=VU3vvtCnDPUq3XPWNGRrtpq7mX2qrJce3vyNKviSYQhhtqJWU3IerSikt1m6/olxdh
         e6tEcabze6ntAjzHxOXzKyV66QVPVroo9ucyuWoogLKu8c0taQX+/nsfQgSPoeEircxQ
         V3MM/hw1HARbyz2TEGgJSqYgQTWvzaljvc118xflTYHAFphyPpwwQaI2b30HL3y1kEjA
         XISBoI0PMcw1dBPLLvDhrQd3+baK1x99ED88TVYXrDahk887urzg136UNIqqRi1ybOsr
         nZLuPN9aYoVpNxQv+0GnRusEYUdS3kMwWxqI2mCUmkGW2qeV2CTRl4VwgkLMmAz8Ai96
         JcdA==
X-Forwarded-Encrypted: i=1; AJvYcCWk8480vN7XhoaXbSWGOR7C5A/4n8cefNNyvrVb7V7iy8Il+LiPkDyH7Q8rl36g4i/wG+zEPo/k50DPdKZbNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVwIPhOZlku3+ZG2OjiteCHOQGtDaGhafqKDrEXIzRlPLb94yH
	mFtuTcYlVDZhQLfeNL06MSlff53YG4Rf7pihJdwUkPWLrYJ9kRlvitzom+PjOhl7bpT5aHOEKjo
	i/XRQS1qZBTD5q7SGchWe5IXy+6JRwBrRH0+ATw==
X-Google-Smtp-Source: AGHT+IEICe98dkZbn2Ns9nln8TerGdgfmay8kae6nOnNQUjTdvKEr1T8PPGslpKcLz8r5N2w/0aeGsRv9D3S4R0GNlg=
X-Received: by 2002:a05:6870:9122:b0:278:22d3:53 with SMTP id
 586e51a60fabf-27b82e076cdmr13465979fac.12.1725948418296; Mon, 09 Sep 2024
 23:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com> <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
In-Reply-To: <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 10 Sep 2024 08:06:46 +0200
Message-ID: <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240909_230700_250153_7B512DA8 
X-CRM114-Status: GOOD (  29.58  )
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

On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander@lin=
aro.org> wrote:
> >
> > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google.c=
om> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > <jens.wiklander@linaro.org> wrote:
> > > >
> > > > Add a Linaro restricted heap using the linaro,restricted-heap bindi=
ngs
> > > > implemented based on the generic restricted heap.
> > > >
> > > > The bindings defines a range of physical restricted memory. The hea=
p
> > > > manages this address range using genalloc. The allocated dma-buf fi=
le
> > > > descriptor can later be registered with the TEE subsystem for later=
 use
> > > > via Trusted Applications in the secure world.
> > > >
> > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++=
++++
> > > >  3 files changed, 176 insertions(+)
> > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > >
> > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/=
Kconfig
> > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > >         help
> > > >           Enable restricted dma-buf heaps for MediaTek platform. Th=
is heap is backed by
> > > >           TEE client interfaces. If in doubt, say N.
> > > > +
> > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > +       help
> > > > +         Choose this option to enable the Linaro restricted dma-bu=
f heap.
> > > > +         The restricted heap pools are defined according to the DT=
. Heaps
> > > > +         are allocated in the pools using gen allocater.
> > > > +         If in doubt, say N.
> > > > +
> > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps=
/Makefile
> > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > @@ -2,4 +2,5 @@
> > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_hea=
p_mtk.o
> > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_hea=
p_linaro.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/drive=
rs/dma-buf/heaps/restricted_heap_linaro.c
> > > > new file mode 100644
> > > > index 000000000000..4b08ed514023
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > @@ -0,0 +1,165 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * DMABUF secure heap exporter
> > > > + *
> > > > + * Copyright 2021 NXP.
> > > > + * Copyright 2024 Linaro Limited.
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > +
> > > > +#include <linux/dma-buf.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/genalloc.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_fdt.h>
> > > > +#include <linux/of_reserved_mem.h>
> > > > +#include <linux/scatterlist.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +#include "restricted_heap.h"
> > > > +
> > > > +#define MAX_HEAP_COUNT 2
> > >
> > > Are multiple supported because of what Cyrille mentioned here about p=
ermissions?
> > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709@D=
BBPR04MB7514.eurprd04.prod.outlook.com/
> >
> > Yes, I kept that as is.
>
> Ok thanks.
>
> > > So this is just some arbitrary limit? I'd prefer to have some sort of
> > > documentation about this.
> >
> > How about removing the limit and using dynamic allocation instead?
>
> That works too!

It turns out that was easier said than done. The limit is hardcoded
because dynamic memory allocation isn't available at that stage during
boot. We have a short description of this heap in Kconfig. I'll add
something about the limit there if that makes sense.

Thanks,
Jens

