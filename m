Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FE7C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eN4o7k4QqJV7SqojvfN0U64D6Ofk/bwXkmAp+CaRKs=; b=LZMc6/j+g5MF6Mv+0eOMEquHrc
	F3Nl9e/JBwS+OleQdCt2B8H0IjHsRxiHO3Zk8/rIhBlKTijn+dv6uwbIv5lY28mx5P+Zousa7ka3C
	EwtsVi5RfzXcLJc7hnmRaPz4SjrqRI49e6cnsAUD/VVjuVIdjqMJXqcR8oQtEyJdOkYS7mYVjiHeL
	XQTPZP1h/eQgyTbkxKX5ObN9cBkROm+1iKnkGnUqOSBrpjHjWT/J8eAin5SghHl4TkAkWZVzmvym0
	VwRGqqcZZyt3SVfJZ80d15ekTydJWkHIHJVJeehY9WOlIfJGK2Kg1f+PHoFYscoZcVbLE3GAENdRs
	V3MbKyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzO4C-00000001cOn-1wGo;
	Tue, 23 Apr 2024 21:52:44 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzO47-00000001cMk-2QSP
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 21:52:42 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-78d62c1e82bso446943085a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 14:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713909154; x=1714513954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eN4o7k4QqJV7SqojvfN0U64D6Ofk/bwXkmAp+CaRKs=;
        b=TUnp1p4GtHUaODqK6X0OIXSqMFUWBGxvmL0hcA/KMIRXiq3Zoy3Zp2NXxq+YXrNr23
         65JTf0jsL1dAAkvzal+ZdxU/TDcAqk/IAHhP5PPefdSRK5kERVoFUQaXif6fsaGr2LQH
         S9SOMS9uNLe7pZOlTBVCNVlvBRdmjdwwnAqvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713909154; x=1714513954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eN4o7k4QqJV7SqojvfN0U64D6Ofk/bwXkmAp+CaRKs=;
        b=QJlGnembaPeU2t6XpZ2RXysEpWr4Uut7IgRZen2LK1XyoFJ8N2G2bAfyBmdhj8DKih
         SPBi8JqKOiQlHqkEI4PvoIhwlsDJw5rTm+LkeJOklWGyo8byhkr3nyGhmSbYTGqRUOvZ
         tLnKOKvcawjB2ZIuybHLewDhTOPcTBq51jB4sBc6i98gQhkD8gwvwHvG5JvVn5ahB7hk
         axJ4adkOR6FaXShFe+GbDys0wUx48P+yDWE9CBeljP27ZLic9P0TA+GSLX8VbvQzYrzB
         duFapvC/99zeHqrqi15cEn4JI3f0MaUL4fHVjE/j0honTwP3ahfVagHvbyf7U80Fjiy+
         IxoA==
X-Forwarded-Encrypted: i=1; AJvYcCUmn9Ha7sqJ/SrWwmmQBEbNeQlcl8+H16fCJ/I18dJxwqkGJp8H4YxHVmNbJ+vjkCLLFJ8vBVMTxiASyQE7DPdMF0Nkf8bQ5SCrtN4xrHRuviud
X-Gm-Message-State: AOJu0YxQCjFCVVLUiH/u9rnIypHW1R1ml7dRlcpiDS5JVqpMpyTu3YMr
	+Abu8oJMoVDOEAk3+7v8zNCJcZ3R0V/RKWwjFri3wPBfZDrPoQ/6APidodI5FwnHvtufyZq8+2Y
	=
X-Google-Smtp-Source: AGHT+IGwkCYmPmpFJXY8bF6Ng9hKlZtJXyhxl91R0lK92LvO1Xwv6w0FFiOqjVLxa26kAwEZF3Gtng==
X-Received: by 2002:ae9:e717:0:b0:78d:6ae4:6778 with SMTP id m23-20020ae9e717000000b0078d6ae46778mr718900qka.47.1713909154173;
        Tue, 23 Apr 2024 14:52:34 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id o27-20020a05620a111b00b0078ec3c4452dsm5588632qkk.9.2024.04.23.14.52.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 14:52:32 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-436ed871225so44521cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 14:52:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXowG5uI6BvHg4avmMvl79vTs4z9ncwvaTIUwzu6msbVZITwit1IFaWGIieJvDvQbz4d7QFTJWBysxh8eu+yxK8QtWFRDjqRu4L/rQDDi9P68Ez
X-Received: by 2002:ac8:70cc:0:b0:439:4ba9:daf7 with SMTP id
 g12-20020ac870cc000000b004394ba9daf7mr105462qtp.0.1713909151984; Tue, 23 Apr
 2024 14:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
 <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com>
 <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com> <d8cfb08ac44523c9235a858a4bd78dcd297a62da.camel@collabora.com>
In-Reply-To: <d8cfb08ac44523c9235a858a4bd78dcd297a62da.camel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Apr 2024 14:52:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XcYR7gvBA-0xghaLJaknkf5tpOP_mGejii5UWD5wJHMQ@mail.gmail.com>
Message-ID: <CAD=FV=XcYR7gvBA-0xghaLJaknkf5tpOP_mGejii5UWD5wJHMQ@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei-Shun Chang <weishunc@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_145239_700902_44EAC18E 
X-CRM114-Status: GOOD (  55.13  )
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

Hi,

On Tue, Apr 23, 2024 at 6:47=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hey,
>
> Le lundi 22 avril 2024 =C3=A0 12:25 -0700, Doug Anderson a =C3=A9crit :
> > Hi,
> >
> > On Mon, Apr 22, 2024 at 11:27=E2=80=AFAM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Hi,
> > >
> > > Le lundi 22 avril 2024 =C3=A0 10:03 -0700, Douglas Anderson a =C3=A9c=
rit :
> > > > As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: =
Use
> > > > DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
> > > > really make sense to try to allocate contiguous chunks of memory fo=
r
> > > > video encoding/decoding. Let's switch the Mediatek vcodec driver to
> > > > pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off th=
e
> > > > memory subsystem.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > > NOTE: I haven't personally done massive amounts of testing with thi=
s
> > > > change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
> > > > specifically for the video encoding / decoding cases and I know it
> > > > helped avoid memory problems in the past on other systems. Colleagu=
es
> > > > of mine have told me that with this change memory problems are hard=
er
> > > > to reproduce, so it seems like we should consider doing it.
> > >
> > > One thing to improve in your patch submission is to avoid abstracting=
 the
> > > problems. Patch review and pulling is based on a technical rational a=
nd very
> > > rarely on the trust that it helps someone somewhere in some unknown c=
ontext.
> > > What kind of memory issues are you facing ? What is the technical adv=
antage of
> > > using DMA_ATTR_ALLOC_SINGLE_PAGES over the current approach that help=
s fixing
> > > the issue? I do expect this to be documented in the commit message it=
self=C3=A9.
> >
> > Right. The problem here is that I'm not _directly_ facing any problems
> > here and I also haven't done massive amounts of analysis of the
> > Mediatek video codec. I know that some of my colleagues have run into
> > issues on Mediatek devices where the system starts getting
> > unresponsive when lots of videos are decoded in parallel. That
> > reminded me of the old problem I debugged in 2015 on Rockchip
> > platforms and is talked about a bunch in the referenced commit
> > 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
> > DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc") so I wrote up
> > this patch. The referenced commit contains quite a bit of details
> > about the problems faced back in 2015.
> >
> > When I asked, my colleagues said that my patch seemed to help, though
> > it was more of a qualitative statement than a quantitative one.
> >
> > I wasn't 100% sure if it was worth sending the patch up at this point,
> > but logically, I think it makes sense. There aren't great reasons to
> > hog all the large chunks of memory for video decoding.
>
> Ok, slowly started retracing this 2016 effort (which now I understand you=
 where
> deeply involved in). Its pretty clear this hint is only used for codecs. =
One
> thing the explanation seems missing (or that I missed) is that all the en=
abled
> drivers seems to come with a dedicated mmu (dedicated TLB). But this argu=
ment
> seems void if it is not combined with DMA_ATTR_NO_KERNEL_MAPPING to avoid=
 using
> the main mmu TLB space. There is currently three drivers using S5P_MFC, H=
antro
> and RKVDEC that uses this hint, only Hantro sets the DMA_ATTR_NO_KERNEL_M=
APPING
> hint.

Why would it be void if not combined with DMA_ATTR_NO_KERNEL_MAPPING?
I mean: sure, if we have a kernel mapping and the kernel is accessing
the memory through this mapping then it will take up space in the TLB
of the main processor. ...but that's just fine, isn't it?

...actually, unless I'm mistaken, the kernel today is always using 4K
pages anyway, even for contiguous chunks of memory (though folks are
working on this problem). That means that from a kernel mapping point
of view the TLB usage is the same whether you use big chunks of memory
or small chunks...

In any case, let's take a step back. So we're going to allocate a big
chunk of memory for video decoding / encoding, right? We're going to
map this memory (via IOMMU) in the space of the video
encoding/decoding device and probably in the space of the kernel. If
we allocate larger chunks of memory then we can (if we set things up
right) configure the page tables on the device side and (maybe) on the
kernel side to use fewer TLB entries.

In general, taking all the big chunks of memory in the system has
downsides. It makes other parts of the kernel that also need big
chunks of memory work harder.

So which is worse, eating up more TLB entries or eating up all the big
chunks of memory? It depends on your access patterns, the size of your
TLB, and your requirements. I forget the exact number, but each TLB
miss incurs something like 4 extra memory accesses. So if you only
need an extra TLB miss every 1024 accesses it's not a huge deal but if
you incur a TLB miss every few accesses then it can be a deal breaker.

In general: If you can successfully meet your performance goals while
using 4K chunks then I'd argue that's the best based on what I've
seen.


> It would be nice to check if VCODEC needs kernel mapping on the RAW image=
s, and
> introduce that hint too while introducing DMA_ATTR_ALLOC_SINGLE_PAGES. Bu=
t with
> a now proper understanding, I also feel like this is wanted , but I'll ha=
ve a
> hard time thinking of a test that shows the performance gain, since it re=
quires
> specific level of fragmentation in the system to make a difference.
>
> Another aspect of the original description that is off, is CODECs doing l=
inear
> access, while this is mostly true for reconstruction (writes), this is no=
t true
> for prediction (reads). What really matters is that the CODECs tiles are =
most of
> the time no bigger then a page, or less then a handful of pages.

I haven't spent lots of time looking at video formats. I guess,
though, that almost everything is somewhat linear compared to trying
to do a 90 degree rotation which is copying image data from rows to
columns. 90 degress rotation is _super_ non-linear. I don't know the
exact history, but I could imagine trying to do rotation on a 512x512
8-bit image would look like this:

uint8 image[512][512];

image[0][0] =3D image[0][511];
image[0][1] =3D image[1][511];
image[0][2] =3D image[2][511];
...
image[1][0] =3D image[0][510];
image[1][1] =3D image[1][510];
...
image[511][511] =3D image[511][0];

(maybe you could optimize this by reading 32-bits at a time and doing
fancier math, but you get the picture)


Let's imagine you had a tiny TLB with only 4 entries in it. If you
could get 64K chunks then you could imagine that you could do the
whole 512x512 90-degree rotation without any TLB misses since the
whole "image" takes up 256K (64 * 4) memory. If you had 4K chunks then
I think you'd get a TLB miss after every 8 accesses and that would
tank your performance.

(Hopefully I didn't mess the example above up too badly--I just write
it up off the cuff).

...so while I don't know tons about encoded video formats, I'd hope
that at least they wouldn't be accessing memory in such a terrible way
as 90-degree rotation. I'd also hope that, if they did, that the
hardware designers would design them with a TLB that was big enough
for the job at hand. Even if TLB misses are a little worse with 4K
pages, as long as they aren't _terrible_ with 4K pages and you can
still meet your FPS goals then they're the way to go.

-Doug

