Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB921C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 23:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp9mV4Ke/a2nl4+Mq/TPZKlXYFvSYBSYldkMY7yov80=; b=MioKcpRuo8dcM/RBsGkLtZ8lyY
	3A1rlbjbTzetIPm63mYiBZsYy7hW/rX2WObuT7+9eLO4wOryuTdwVEi+KsCRjWBzwJGQ/laARPNcr
	Tcnpj9LNXh86dPM2eevKMD73D1QpnY0sciKjJsJQgZw3M1rki/NmNR7oiXzA7oyue466ZWpsYxQrG
	MrCsJAkVQIfeogKQY83fE74kA8AzcDrbR5Bzf9h9k1rvc7s+VY/QB3QVSrrOi3aaH+btqPtQZOUkh
	LU3hyf2/bGhSehQK8ll/Ahe0b2qemGrukYRQduuK2ero4umAGdhpWwE0v1m0Nbe/jtXlZCJMQ58N0
	lKpkJWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORJQ-004HXL-37;
	Fri, 12 Jan 2024 23:51:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORJO-004HW9-0N
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 23:51:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40d5097150fso6915e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 15:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705103498; x=1705708298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp9mV4Ke/a2nl4+Mq/TPZKlXYFvSYBSYldkMY7yov80=;
        b=xc1i6pvnJdFnPQsxtu43qtgjHRU2SwGCmv8YZVydhykYErsTZCYnBoVuef8Gy99wTV
         LabLrcpIRDuqP9iIN8W79aUleZycsnKP9AcGGre3alKtcBw5dROkPiR0iQZiza7szAfP
         daike/tEkvXJ3rhDyL/BH5fYsLyZv8BaO5qT16XZruabYWcFwigN7+zSevPS6SP1ICuA
         0nieFKKLXpuE8jcsHzIYifY390vmGZP9Pymjy72TenDFiTi6wKTl3z6qNk0Bhzmd3Qn8
         LOceYYUdE4nzPLZ9kbXeE9Y82hcceG8idAz+wyvpCnDzdV3e9sHVP8T6UpBqlh/0yJgv
         Dmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705103498; x=1705708298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kp9mV4Ke/a2nl4+Mq/TPZKlXYFvSYBSYldkMY7yov80=;
        b=m9LLAVjx81uEdmJQQNcr/ZYnQ8eExS6Acbj+EB97jGPyNLA/LWQXXY/yeX9LNmNcpk
         jtgSwlCAmS7MZmZYXkIO+SHdfdL/uXx5OK3VbYj6SH0vwG0ahrufHrwSUZ2mGkR6INaJ
         6XunX75olfMlfJVuewU7ms5VMXsOTpf+gqfgCA209qijcKLG99n7e2ugdA0oX+/oL+Ia
         sMxxt86N7mCpYjHP8NWB/qKI8aCxfVRsVf8BKKV62ViTIvlKeALHmBzF9V+tp2DME4i4
         SRNX24Z5pDw+VIVSx4nti4Um2Ptx03f6N+686R1u9grwARJ7aVkcYRe7R3py+skOUqxg
         VPoA==
X-Gm-Message-State: AOJu0YwJs7pzh4+aLCrEddetkjeDlUiOuSGd19BsJtPyx6eCthyrGpHO
	H0qE4d8/oI1ZYDLUgoLSH5UScVQ3WzuJIddeTIn2McctLi4=
X-Google-Smtp-Source: AGHT+IHw6ArP/KmmpI2CYpNyzdh9UGjQJc8eU/h6V5ZAE1R9MItE23iIMtklhlwhBVwyIqzHg22KBjSAxDaPMMiP1UE=
X-Received: by 2002:a05:600c:3b1d:b0:40d:87df:92ca with SMTP id
 m29-20020a05600c3b1d00b0040d87df92camr30276wms.3.1705103498218; Fri, 12 Jan
 2024 15:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com> <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
In-Reply-To: <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 12 Jan 2024 15:51:25 -0800
Message-ID: <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
To: Jeffrey Kardatzke <jkardatzke@google.com>
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
X-CRM114-CacheID: sfid-20240112_155142_173354_F369B2D2 
X-CRM114-Status: GOOD (  31.23  )
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

On Fri, Jan 12, 2024 at 3:27=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@googl=
e.com> wrote:
> On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.com> =
wrote:
> > On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> =
wrote:
> > > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-bu=
f/heaps/restricted_heap.h
> > > index 443028f6ba3b..ddeaf9805708 100644
> > > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > > @@ -15,6 +15,18 @@ struct restricted_buffer {
> > >
> > >  struct restricted_heap {
> > >         const char              *name;
> > > +
> > > +       const struct restricted_heap_ops *ops;
> > > +};
> > > +
> > > +struct restricted_heap_ops {
> > > +       int     (*heap_init)(struct restricted_heap *heap);
> > > +
> > > +       int     (*memory_alloc)(struct restricted_heap *heap, struct =
restricted_buffer *buf);
> > > +       void    (*memory_free)(struct restricted_heap *heap, struct r=
estricted_buffer *buf);
> > > +
> > > +       int     (*memory_restrict)(struct restricted_heap *heap, stru=
ct restricted_buffer *buf);
> > > +       void    (*memory_unrestrict)(struct restricted_heap *heap, st=
ruct restricted_buffer *buf);
> > >  };
> > >
> > >  int restricted_heap_add(struct restricted_heap *rstrd_heap);
> >
> > So, I'm a little worried here, because you're basically turning the
> > restricted_heap dma-buf heap driver into a framework itself.
> > Where this patch is creating a subdriver framework.
> >
> > Part of my hesitancy, is you're introducing this under the dma-buf
> > heaps. For things like CMA, that's more of a core subsystem that has
> > multiple users, and exporting cma buffers via dmabuf heaps is just an
> > additional interface.  What I like about that is the core kernel has
> > to define the semantics for the memory type and then the dmabuf heap
> > is just exporting that well understood type of buffer.
> >
> > But with these restricted buffers, I'm not sure there's yet a well
> > understood set of semantics nor a central abstraction for that which
> > other drivers use directly.
> >
> > I know part of this effort here is to start to centralize all these
> > vendor specific restricted buffer implementations, which I think is
> > great, but I just worry that in doing it in the dmabuf heap interface,
> > it is a bit too user-facing. The likelihood of encoding a particular
> > semantic to the singular "restricted_heap" name seems high.
>
> In patch #5 it has the actual driver implementation for the MTK heap
> that includes the heap name of "restricted_mtk_cm", so there shouldn't
> be a heap named "restricted_heap" that's actually getting exposed. The

Ah, I appreciate that clarification! Indeed, you're right the name is
passed through. Apologies for missing that detail.

> restricted_heap code is a framework, and not a driver itself.  Unless
> I'm missing something in this patchset...but that's the way it's
> *supposed* to be.

So I guess I'm not sure I understand the benefit of the extra
indirection. What then does the restricted_heap.c logic itself
provide?
The dmabuf heaps framework already provides a way to add heap implementatio=
ns.

thanks
-john

