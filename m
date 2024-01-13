Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86512C47422
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jan 2024 00:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZN1rPiXKN7u9zdqvXb7Qif49uja1bfBANswKzoofhOQ=; b=UUKmvegEyVga9002a1EVeluiK0
	+pDUWb7mWyTrwftnlNKB0A3T04ObHe2g4P1/SxARs7LodlX5fNmSUG3Zf8SIbZOGCmbNjPy8zVGL1
	ns+UAkPQaaEP/Fvvfdmv248JCk1eHtzDWRLoLiwDhLHldS94HULK+JkqJuOAIirw7B6AutEXUbfbx
	MvKUHXq9XVDtHTppSZJnMcQJijefnVMBGJZeI2JrdLmTA+vGLKesTkUiT7cNVehl2bkzscbVcc52H
	3dgPUXab9cD9ZOqwaFHiSzv6KgxMXv9TLOgaGMjVUSGw68S4hhlcKEO3DVMHnjRwJqDAzqkxDnphs
	qA94ncCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORed-004JEb-0Y;
	Sat, 13 Jan 2024 00:13:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOReZ-004JDj-1y
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jan 2024 00:13:37 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d5ad1a14e1so56975ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 16:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705104815; x=1705709615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN1rPiXKN7u9zdqvXb7Qif49uja1bfBANswKzoofhOQ=;
        b=eUyhd27mzX6BuYpaQ5tSprE8X8PuL6seCzMEHKo7WgGzehrYRwJpMD5Q0IazAe0a8N
         47/zF/L64Ee+VgCanYVvrYFNfxqVzzsSRaHDCeX2DHW7wTmo6NlI0GXHGR2pL3Qv4Qp/
         lzDscpQXt7m2l+u2AaikVirx6vWiukB/umDlWVvpU2b0/hJECHSw3c24B9k3pj7OBP6y
         l8v5wm7CPMUJKuy/1k7/RynZgD7lsSGL241hY6ml7FIuiEgJ5z3TTc6qmdQvNCQDzVBb
         tqbKlPKgeszRZFpLgn3RgjG8vktjKxo8RRYzNyl+bV5oMt9lBhh6Zqiscndd6VrlH/3H
         ipLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705104815; x=1705709615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZN1rPiXKN7u9zdqvXb7Qif49uja1bfBANswKzoofhOQ=;
        b=cTMsdzCxYlDvBrIbzrWudqidX0IV7+5ti0+JazddL71WUhGHG0V82bn02uuf328ldq
         w8oHiMLosrrfcVvW9+nhruBsqDYAfd2MwuqcpBZya6cq4TDJ30IZSVXOJRZwHW33nuEE
         tBuw0+ryoCcDk/NCEkxtkPmw4lQmPtzNowRK4Lj1W+IOK2XvpnoqmvEe9lEnYyq1FjBZ
         Dbh+yg1O8FcqZu7lD4ydcjAM2g3a9MwEPBSwlJsZSp4TLJdK66IrKQs/hdr2Mw0B4rv9
         nD0jHsEfmmWQbgaEj5sMhmzHBcMQYZe4qIA3K6DtpZCbztEg8PYnE/t7cc2YBWv4t81Y
         2ElA==
X-Gm-Message-State: AOJu0YyDe53S4rKi27R5imcXefunS6KoxEUCUdFvMCLnGUTPfC0FaGbn
	YoAsBoOtzFUIoV+YEV4clUhQlfxHfrC8gLk8nRYsA+ykRSw=
X-Google-Smtp-Source: AGHT+IFoy9IVWruhvKFe05xW5Uee6UeUnu8jeQqa2o5hMHQEB/8kcTZ0reXjfnhh9x+XoVNHMhQznVcSROnNPsA1e0c=
X-Received: by 2002:a17:902:ec8a:b0:1d4:c2bd:eff5 with SMTP id
 x10-20020a170902ec8a00b001d4c2bdeff5mr44003plg.3.1705104814522; Fri, 12 Jan
 2024 16:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com> <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
In-Reply-To: <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Fri, 12 Jan 2024 16:13:22 -0800
Message-ID: <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240112_161335_698136_20482C46 
X-CRM114-Status: GOOD (  41.36  )
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

On Fri, Jan 12, 2024 at 3:51=E2=80=AFPM John Stultz <jstultz@google.com> wr=
ote:
>
> On Fri, Jan 12, 2024 at 3:27=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@goo=
gle.com> wrote:
> > On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.com=
> wrote:
> > > On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com=
> wrote:
> > > > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-=
buf/heaps/restricted_heap.h
> > > > index 443028f6ba3b..ddeaf9805708 100644
> > > > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > > > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > > > @@ -15,6 +15,18 @@ struct restricted_buffer {
> > > >
> > > >  struct restricted_heap {
> > > >         const char              *name;
> > > > +
> > > > +       const struct restricted_heap_ops *ops;
> > > > +};
> > > > +
> > > > +struct restricted_heap_ops {
> > > > +       int     (*heap_init)(struct restricted_heap *heap);
> > > > +
> > > > +       int     (*memory_alloc)(struct restricted_heap *heap, struc=
t restricted_buffer *buf);
> > > > +       void    (*memory_free)(struct restricted_heap *heap, struct=
 restricted_buffer *buf);
> > > > +
> > > > +       int     (*memory_restrict)(struct restricted_heap *heap, st=
ruct restricted_buffer *buf);
> > > > +       void    (*memory_unrestrict)(struct restricted_heap *heap, =
struct restricted_buffer *buf);
> > > >  };
> > > >
> > > >  int restricted_heap_add(struct restricted_heap *rstrd_heap);
> > >
> > > So, I'm a little worried here, because you're basically turning the
> > > restricted_heap dma-buf heap driver into a framework itself.
> > > Where this patch is creating a subdriver framework.
> > >
> > > Part of my hesitancy, is you're introducing this under the dma-buf
> > > heaps. For things like CMA, that's more of a core subsystem that has
> > > multiple users, and exporting cma buffers via dmabuf heaps is just an
> > > additional interface.  What I like about that is the core kernel has
> > > to define the semantics for the memory type and then the dmabuf heap
> > > is just exporting that well understood type of buffer.
> > >
> > > But with these restricted buffers, I'm not sure there's yet a well
> > > understood set of semantics nor a central abstraction for that which
> > > other drivers use directly.
> > >
> > > I know part of this effort here is to start to centralize all these
> > > vendor specific restricted buffer implementations, which I think is
> > > great, but I just worry that in doing it in the dmabuf heap interface=
,
> > > it is a bit too user-facing. The likelihood of encoding a particular
> > > semantic to the singular "restricted_heap" name seems high.
> >
> > In patch #5 it has the actual driver implementation for the MTK heap
> > that includes the heap name of "restricted_mtk_cm", so there shouldn't
> > be a heap named "restricted_heap" that's actually getting exposed. The
>
> Ah, I appreciate that clarification! Indeed, you're right the name is
> passed through. Apologies for missing that detail.
>
> > restricted_heap code is a framework, and not a driver itself.  Unless
> > I'm missing something in this patchset...but that's the way it's
> > *supposed* to be.
>
> So I guess I'm not sure I understand the benefit of the extra
> indirection. What then does the restricted_heap.c logic itself
> provide?
> The dmabuf heaps framework already provides a way to add heap implementat=
ions.

So in the v1 patchset, it was done with just a Mediatek specific heap
with no framework or abstractions for another vendor to build on top
of. The feedback was to make this more generic since Mediatek won't be
the only vendor who wants a restricted heap..which is how it ended up
here. There was more code in the framework before relating to TEE
calls, but then that was moved to the vendor specific code since not
all restricted heaps are allocated through a TEE.

This was also desirable for the V4L2 pieces since there's going to be
a V4L2 flag set when using restricted dma_bufs (and it wants to
validate that)....so in order to keep that more generic, there should
be a higher level concept of restricted dma_bufs that isn't specific
to a single vendor.  One other thing that would ideally come out of
this is a cleaner way to check that a dma_buf is restricted or not.
The current V4L2 patchset just attaches the dma_buf and then checks if
the page table is empty....and if so, it's restricted. But now I see
there's other feedback indicating attaching a restricted dma_buf
shouldn't even be allowed, so we'll need another strategy for
detecting them. Ideally there is some function/macro like
is_dma_buf_restricted(struct dma_buf*) that can indicate that...but we
haven't come up with a good way to do that yet which doesn't involve
adding another field to dma_buf or to dma_buf_ops (and if such a thing
would be fine, then OK...but I had assumed we would get pushback on
modifying either of those structs).

>
> thanks
> -john

