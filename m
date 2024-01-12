Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1E4C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 23:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhEbbmE1Z6uLNZgCKtRC6woP3H/Wl1Wl1gQfP+v/DTY=; b=49GtPgNEr0ua3Mkv9o2ajU6t4b
	bwjOE2SzcVNq7J+yVffmbjYlgtnPDAfWwYew2v/ZNQ67MRoRmXO2fBSLVaHhYSkdeBEey9k7lN5vT
	0HCXt3qYQmZeOUFj0zpL6bRIJckBuwg26Z2Dx3sLC6yAD5n4Z453xxnifL+WAgXMyCv5dLV4uK8cg
	6l1Sk5HpK++HkdmFYefkFuJUd+Iv3UaWS71TH565WvY38BPz6tEzgdDNLGZy82SWWcvT2QzYOu1W0
	O4ko8+l0iWgPQ8TDXk15yszGaVmrDgwjioVvOi+CPl4ML0X16KKFuIIigpqYVGTu56Z+8+Zuh+qTz
	+zvKhEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOQwD-004FIk-1b;
	Fri, 12 Jan 2024 23:27:45 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOQw9-004FHT-1m
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 23:27:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3ea8d0f9dso18815ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 15:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705102060; x=1705706860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhEbbmE1Z6uLNZgCKtRC6woP3H/Wl1Wl1gQfP+v/DTY=;
        b=Ns1zZrvg0AIowrG/OMEXCe1eD+/QTmZ1bHqWXV/9xG1Qb9DZVYqMBaT25BjMC8/Vf/
         MDw9hLtM+Fd3Pany6e1j34vAPLUNU0U1QZhsmfuugnG8XaJMqjwY2psBkpv9IPBCPIxE
         4wUbQjBWU08CYEpbXnJp6hOJ6cya8V4UGc3wOtNjnl9kJzVgR8ep7co88dZxHc4rMExK
         fq+ETIRmCoHcOAJFer7sALwlj5nNp810bEcE3n7dvTmb7ORqyDVhHSfRCYSO/ow2e1AY
         +rdLZzdHoAPmSzxsDygfb0zV0CwnuUYjcwQfvlyzpMCjNGV5M8/Oct9iayt6cc5I9Xaq
         nS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705102060; x=1705706860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhEbbmE1Z6uLNZgCKtRC6woP3H/Wl1Wl1gQfP+v/DTY=;
        b=srvLJEtfvu7LTe9q6EzIatsKB8gY+1/A0DvijM8Q+SoONngkeIP8d5b/4DXngBPTUs
         /aqYxaUE23Krhjx0h2aF/UPlVJY7Ti/r1ppZWOXbx1+OG3Yw0ttq8f8F/yp+j+r7l4HX
         MRFsVolHz9Dh23u44RizpY6mABPOCLhwIqAE0gYd7t3GJrTqEQE8oPDMAWU19j3JcWuD
         oIli5pIyXUwDJuNFqH9qpOrSehTHBVNssOiY2qOr/7D2v12vGmlYmqDmyyRAsUOTdNCC
         BZtIHcJ2oFgNKy0h9OYS1aCAMm2LbP75lmi3xeCJQK+RiLWC7LuhBfT4SdSjgqs3FQAx
         Cylw==
X-Gm-Message-State: AOJu0Yw6t4wkXvAwB2Hps66yV36v8zknYLYei2aQAS355JY2UlZSCSRp
	BeC0MaL5luyMqo6uGkrBbehPSkox+UMWFsTkSrh1UEoUks0=
X-Google-Smtp-Source: AGHT+IFwwNVRgX+18llMY6Crrv0CZvMC6Ee5jLqPJn9RMR+jzSAJCxBI0rpUZIw0G2/SmU4oxB/NiR3hY1G0xancka4=
X-Received: by 2002:a17:903:210d:b0:1d5:a791:ef1b with SMTP id
 o13-20020a170903210d00b001d5a791ef1bmr203692ple.1.1705102059466; Fri, 12 Jan
 2024 15:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
In-Reply-To: <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Fri, 12 Jan 2024 15:27:27 -0800
Message-ID: <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
To: John Stultz <jstultz@google.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Joakim Bech <joakim.bech@linaro.org>, Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, 
	Pekka Paalanen <ppaalanen@gmail.com>, jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_152741_614710_7B897F10 
X-CRM114-Status: GOOD (  37.52  )
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

On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.com> wr=
ote:
>
> On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wr=
ote:
> >
> > Add "struct restricted_heap_ops". For the restricted memory, totally th=
ere
> > are two steps:
> > a) memory_alloc: Allocate the buffer in kernel;
> > b) memory_restrict: Restrict/Protect/Secure that buffer.
> > The memory_alloc is mandatory while memory_restrict is optinal since it=
 may
> > be part of memory_alloc.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
> >  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
> >  2 files changed, 52 insertions(+), 1 deletion(-)
> >
>
> Thanks for sending this out! A thought below.
>
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/=
heaps/restricted_heap.h
> > index 443028f6ba3b..ddeaf9805708 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > @@ -15,6 +15,18 @@ struct restricted_buffer {
> >
> >  struct restricted_heap {
> >         const char              *name;
> > +
> > +       const struct restricted_heap_ops *ops;
> > +};
> > +
> > +struct restricted_heap_ops {
> > +       int     (*heap_init)(struct restricted_heap *heap);
> > +
> > +       int     (*memory_alloc)(struct restricted_heap *heap, struct re=
stricted_buffer *buf);
> > +       void    (*memory_free)(struct restricted_heap *heap, struct res=
tricted_buffer *buf);
> > +
> > +       int     (*memory_restrict)(struct restricted_heap *heap, struct=
 restricted_buffer *buf);
> > +       void    (*memory_unrestrict)(struct restricted_heap *heap, stru=
ct restricted_buffer *buf);
> >  };
> >
> >  int restricted_heap_add(struct restricted_heap *rstrd_heap);
>
> So, I'm a little worried here, because you're basically turning the
> restricted_heap dma-buf heap driver into a framework itself.
> Where this patch is creating a subdriver framework.
>
> Part of my hesitancy, is you're introducing this under the dma-buf
> heaps. For things like CMA, that's more of a core subsystem that has
> multiple users, and exporting cma buffers via dmabuf heaps is just an
> additional interface.  What I like about that is the core kernel has
> to define the semantics for the memory type and then the dmabuf heap
> is just exporting that well understood type of buffer.
>
> But with these restricted buffers, I'm not sure there's yet a well
> understood set of semantics nor a central abstraction for that which
> other drivers use directly.
>
> I know part of this effort here is to start to centralize all these
> vendor specific restricted buffer implementations, which I think is
> great, but I just worry that in doing it in the dmabuf heap interface,
> it is a bit too user-facing. The likelihood of encoding a particular
> semantic to the singular "restricted_heap" name seems high.

In patch #5 it has the actual driver implementation for the MTK heap
that includes the heap name of "restricted_mtk_cm", so there shouldn't
be a heap named "restricted_heap" that's actually getting exposed. The
restricted_heap code is a framework, and not a driver itself.  Unless
I'm missing something in this patchset...but that's the way it's
*supposed* to be.

>
> Similarly we might run into systems with multiple types of restricted
> buffers (imagine a discrete gpu having one type along with TEE
> protected buffers also being used on the same system).
>
> So the one question I have: Why not just have a mediatek specific
> restricted_heap dmabuf heap driver?  Since there's already been some
> talk of slight semantic differences in various restricted buffer
> implementations, should we just start with separately named dmabuf
> heaps for each? Maybe consolidating to a common name as more drivers
> arrive and we gain a better understanding of the variations of
> semantics folks are using?
>
> thanks
> -john

