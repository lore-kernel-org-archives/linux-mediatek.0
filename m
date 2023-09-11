Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8229BCA0EC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 23:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9FHti0UeaT45a62FC88dUwVtXoyU66QnGu8MY083Gc=; b=O0YB3Vy/xTJwhN81IKWFITCu6A
	cXQ1Ax5gFsTpcrdVJ2ElIsenLYqMQgy2MvER0teQTYXWKUEJ+G76InQ4rsP0wtcfY83nhVCPgYQwe
	K67g17TFbcSE3TG1D/4tcOGGQOfLGe2hJZTvFLR8zWxTX1XN1OvOG/N+nB8M9FGmKVMb+9Ni5jIXQ
	+D/jXsWZbZEamz47l5PSwIPgXXWHImg4A+85uwGdlsZiCRKXfC/ten0oWy2wL8lp/uK9v8B3Rjt3n
	ry+QihurtrIhJppbukQwLW++7OR9rH9LNwmyf3GtvV8D8zs9t99daQZBfU+Fg1Uc/7cO3NmA0U642
	jRcxyL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqgw-001d9a-0O;
	Mon, 11 Sep 2023 23:51:42 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqgs-001d88-0J
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 23:51:40 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d7ba4c5f581so4408708276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694476293; x=1695081093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9FHti0UeaT45a62FC88dUwVtXoyU66QnGu8MY083Gc=;
        b=31C0682OcNUqLF6Rihodkwne1Mw02ooKY1VtW/EpXvmbKa/DP4bltAURI6nO18e3BT
         b0ff9AmEeOP7dDV4H5Kvcmjzj+oBrvaASX9He9SrAXIZirFhFx4x01PolSSEzUUi9XNj
         MNDT47Hr238gS4h/2fOl+UdnCtH//XV3taWkkGJABcVq9EcXTvySD+EFeiD9nwv0RKva
         6A1rJEdcPMEuvnTaMXeVxDycnb9QbAjUAolByMkktFurl+VaqC/x3KcStXgd/t99L9BQ
         eadA8VC21RCjXWj7Jq1Z6ClrLKgQ1aLZHbOwCpOv/4eDJz33w9lL6+RKiw7Y5m1Y5fG7
         GM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694476293; x=1695081093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9FHti0UeaT45a62FC88dUwVtXoyU66QnGu8MY083Gc=;
        b=TVkxAmzZI8ZCQjB6QeE85Y7ZKpBL74UPV2niAwkVRCzB9WUDOjK/fNRFCZSS8A0mCu
         4c4cqILEyHHEeYTy8TaSagthaf/uZw2u6auvfjwB98YchHHMAKrcid03cpnltd0Db6JS
         Wkwn746qhBQbhu8lmGpxtnPHde++O28PcuajxZKZqWEycix8qmiJ1sZfuNWx7qYrHxOq
         UjjAFZ/5fE35YaBUNj8nvO3xPfncB3H4B/xG3TiRhOQkj2OABFrK0XyUGu6iHMpX7I/6
         OdV9usDLtsv67TLiTDUQsiAZ7NCZPQ8KSntFrsfTo8AQRqN/I+9kOug+woAd6p5lNxrm
         27uw==
X-Gm-Message-State: AOJu0YxF6A8N5u+JWjnsvDaUnQMdDAnPBCdj3Buxeg9mXJXkt73jKw2i
	JHipbXAGmDvWp72wAkeEXlRtgcU3SGxd1qGyfEjSRw==
X-Google-Smtp-Source: AGHT+IGFOM/4w9EDJt7MB2VEaaVKgVLAWXiT0CbJ/s1mQvZfpoxvSUlNkizqXQqtn0mkteVDRyeHoSWnwX1ZfV5oYr4=
X-Received: by 2002:a25:ce03:0:b0:d09:f934:f2fe with SMTP id
 x3-20020a25ce03000000b00d09f934f2femr9212180ybe.18.1694476292641; Mon, 11 Sep
 2023 16:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com> <20230911023038.30649-2-yong.wu@mediatek.com>
 <46532644-a38b-98d5-13a1-8b51b9276a1d@amd.com>
In-Reply-To: <46532644-a38b-98d5-13a1-8b51b9276a1d@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 11 Sep 2023 16:51:20 -0700
Message-ID: <CABdmKX0-x53hjkKeSw1oDu2yFTKEXc1z_TFg0EMyWF2aBNbk2w@mail.gmail.com>
Subject: Re: [PATCH 1/9] dma-buf: heaps: Deduplicate docs and adopt common format
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
X-CRM114-CacheID: sfid-20230911_165138_135940_38A65A8B 
X-CRM114-Status: GOOD (  26.45  )
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

On Mon, Sep 11, 2023 at 2:36=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> m 11.09.23 um 04:30 schrieb Yong Wu:
> > From: "T.J. Mercier" <tjmercier@google.com>
> >
> > The docs for dma_heap_get_name were incorrect, and since they were
> > duplicated in the implementation file they were wrong there too.
> >
> > The docs formatting was inconsistent so I tried to make it more
> > consistent across functions since I'm already in here doing cleanup.
> >
> > Remove multiple unused includes.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add a comment for "priv" to mute build warning]
> > ---
> >   drivers/dma-buf/dma-heap.c | 29 +++++++----------------------
> >   include/linux/dma-heap.h   | 11 +++++------
> >   2 files changed, 12 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 84ae708fafe7..51030f6c9d6e 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -7,17 +7,15 @@
> >    */
> >
> >   #include <linux/cdev.h>
> > -#include <linux/debugfs.h>
> >   #include <linux/device.h>
> >   #include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> >   #include <linux/err.h>
> > -#include <linux/xarray.h>
> >   #include <linux/list.h>
> > -#include <linux/slab.h>
> >   #include <linux/nospec.h>
> > -#include <linux/uaccess.h>
> >   #include <linux/syscalls.h>
> > -#include <linux/dma-heap.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/xarray.h>
> >   #include <uapi/linux/dma-heap.h>
> >
> >   #define DEVNAME "dma_heap"
> > @@ -28,9 +26,10 @@
> >    * struct dma_heap - represents a dmabuf heap in the system
> >    * @name:           used for debugging/device-node name
> >    * @ops:            ops struct for this heap
> > - * @heap_devt                heap device node
> > - * @list             list head connecting to list of heaps
> > - * @heap_cdev                heap char device
> > + * @priv:            private data for this heap
> > + * @heap_devt:               heap device node
> > + * @list:            list head connecting to list of heaps
> > + * @heap_cdev:               heap char device
> >    *
> >    * Represents a heap of memory from which buffers can be made.
> >    */
> > @@ -192,25 +191,11 @@ static const struct file_operations dma_heap_fops=
 =3D {
> >   #endif
> >   };
> >
> > -/**
> > - * dma_heap_get_drvdata() - get per-subdriver data for the heap
> > - * @heap: DMA-Heap to retrieve private data for
> > - *
> > - * Returns:
> > - * The per-subdriver data for the heap.
> > - */
>
> Kernel documentation is usually kept on the implementation and not the
> definition.
>
> So I strongly suggest to remove the documentation from the header
> instead and if there is any additional information in there add it here.
>
> Regards,
> Christian.
>
Ok thanks for looking. I'll move all the function docs over to the
implementation.

