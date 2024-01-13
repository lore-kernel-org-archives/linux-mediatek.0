Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA4C3DA79
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jan 2024 01:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM/RZNODygz3tcx3iBW5QQla7ILOiDn5Z5q0jGfqFBA=; b=FpI+2TfWer09dq+gPBiFcHBN+8
	OAulICMrJfD68uMYu7G3CIQUyl4hF9DLN43PCE2gXkZA9hjIc4ZXnWVVAHoUYq5l3rcUR+sEixK0b
	T8oJWM57f0tS3CWkhSvUWLqmNBu3agg0Mz3wt2fAWdMQKU4/6wBiRfHNm3D/O+fpcdT0m3R2IDngn
	3l7Ab7l+tf9xOqHp1ZszGB5dQJGWgKydObMoMOpIZIN+JnGu/hRd/LYm0pzlWoDsC5OUi5ddqMEKO
	1l1630qmdIKam8W+fWjA+UN8oCqFynjRvCiOIiJwaCIX1wLTjrCmW+DjOBG8QALE9J7NqfkzXi6C/
	RWaCFAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSkB-004Nyg-1R;
	Sat, 13 Jan 2024 01:23:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSk7-004Nxa-0q
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jan 2024 01:23:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40e4afe9ea7so8595e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 17:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705109001; x=1705713801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM/RZNODygz3tcx3iBW5QQla7ILOiDn5Z5q0jGfqFBA=;
        b=IYadDNxqBgX4Kn27lEJ1hh5f62cz3SgNF5d3hfiagzN4zY8dTLVMaZ+uAqjj0IC0/n
         ECiRtrF+Y3+gYQjsDxid3xDih/XQh/8AAVqdSjSKPXOU9AvP0vPbovi5UqQ2ayedMh+7
         q7M3uspEfSeH0TJXRd/PnKbl2+EnAgm1juirvWxsXfTjXjbTQeV+n704YrFiC5OD/Ipw
         YoXo32v3PwK0kKwABmyV3NO7XbqKa9f0bGuXuyeWe6QuOmnv1Fmsh7TZz237aJKkDomX
         cncZFO2UIyJUR2bNDsXTQd84jhV1hoq1iWndXVt6s49R6uMCB5IxLBl0j3J3NvEOUhf9
         BB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705109001; x=1705713801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mM/RZNODygz3tcx3iBW5QQla7ILOiDn5Z5q0jGfqFBA=;
        b=jz1Lhn22Dfka45kLLAogAtLr2pSNlzdHrKkDvxUnRUvd+jbgosTEav9rncBjGGHESN
         5FgDw+4H4UV6V50igbFp5ne5/ArN+3ah41iMnbzgS0r1gJqrColnZXusWrVqn+15qqs1
         2/ZmveiPF9+w4hdof2/bX4NVi9IC9ahZM5bSorI+173JNjmKLNeM2Pm1BZTIVAAHQwOk
         pEiuqq5TpD2zQST2hXiI2hI59MijcfCzLfZNsnW/G8+J9NpEO6wfrQxg8sz8uvmKbEr/
         GIrllSg7LKsW1ggCmnDuuk3NF/CSAx6rYVyqIstW6/jtm3DNJtxFXSKiLAMnAU1bkMc1
         dwOg==
X-Gm-Message-State: AOJu0YzIc3z4BUxzZuo8QcuvHXpUB1PJz3gtRr7T5qxq5P6ueVDbKZu5
	ofMpK9LHb3UTjXytuDKEzCo+Zlrt9wALrrmB3xT+I++6hkw=
X-Google-Smtp-Source: AGHT+IG/+qOlk4ymLnRUPXBnV0zsSF5F2DLjgpluok3fjIXdmyv0TwrSAfnNPRC7q4VbUcI/uz5Z7ZFuE7x5bsdIM1U=
X-Received: by 2002:a1c:721a:0:b0:40e:4990:d573 with SMTP id
 n26-20020a1c721a000000b0040e4990d573mr396698wmc.4.1705109000593; Fri, 12 Jan
 2024 17:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
 <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com> <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
In-Reply-To: <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 12 Jan 2024 17:23:07 -0800
Message-ID: <CANDhNCrGxhHJLA2ct-iqemLAsQRt3C8m5=xAD3_dDdKH6Njrdg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240112_172323_299329_2BEFDEC4 
X-CRM114-Status: GOOD (  49.92  )
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

On Fri, Jan 12, 2024 at 4:13=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@googl=
e.com> wrote:
> On Fri, Jan 12, 2024 at 3:51=E2=80=AFPM John Stultz <jstultz@google.com> =
wrote:
> >
> > On Fri, Jan 12, 2024 at 3:27=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@g=
oogle.com> wrote:
> > > On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.c=
om> wrote:
> > > > I know part of this effort here is to start to centralize all these
> > > > vendor specific restricted buffer implementations, which I think is
> > > > great, but I just worry that in doing it in the dmabuf heap interfa=
ce,
> > > > it is a bit too user-facing. The likelihood of encoding a particula=
r
> > > > semantic to the singular "restricted_heap" name seems high.
> > >
> > > In patch #5 it has the actual driver implementation for the MTK heap
> > > that includes the heap name of "restricted_mtk_cm", so there shouldn'=
t
> > > be a heap named "restricted_heap" that's actually getting exposed. Th=
e
> >
> > Ah, I appreciate that clarification! Indeed, you're right the name is
> > passed through. Apologies for missing that detail.
> >
> > > restricted_heap code is a framework, and not a driver itself.  Unless
> > > I'm missing something in this patchset...but that's the way it's
> > > *supposed* to be.
> >
> > So I guess I'm not sure I understand the benefit of the extra
> > indirection. What then does the restricted_heap.c logic itself
> > provide?
> > The dmabuf heaps framework already provides a way to add heap implement=
ations.
>
> So in the v1 patchset, it was done with just a Mediatek specific heap
> with no framework or abstractions for another vendor to build on top
> of. The feedback was to make this more generic since Mediatek won't be
> the only vendor who wants a restricted heap..which is how it ended up
> here. There was more code in the framework before relating to TEE
> calls, but then that was moved to the vendor specific code since not
> all restricted heaps are allocated through a TEE.

Yeah. I apologize, as I know how frustrating the contradictory
feedback can be. I don't mean to demotivate. :(

I think folks would very much like to see consolidation around the
various implementations, and I agree!
I just worry that creating the common framework for this concept in a
dmabuf heaps driver is maybe too peripheral/close to userland.

> This was also desirable for the V4L2 pieces since there's going to be
> a V4L2 flag set when using restricted dma_bufs (and it wants to
> validate that)....so in order to keep that more generic, there should
> be a higher level concept of restricted dma_bufs that isn't specific
> to a single vendor.  One other thing that would ideally come out of
> this is a cleaner way to check that a dma_buf is restricted or not.

Yeah. If there is a clear meaning to "restricted" here, I think having
a query method on the dmabuf is reasonable.
My only fret is if the meaning is too vague and userland starts
depending on it meaning what it meant for vendor1, but doesn't mean
for vendor2.

So we need some clarity in what "restricted" really means.  For
instance, it being not cpu mappable vs other potential variations like
being cpu mappable, but not cpu accessible.  Or not cpu mappable, but
only mappable between a set of 3 devices (Which 3 devices?! How can we
tell?).

And if there is variation, maybe we need to enumerate the types of
"restricted" buffers so we can be specific when it's queried.

That's where maybe having the framework for this be more central or
closer to the kernel mm code and not just a sub-type of a dmabuf heap
driver might be better?

> The current V4L2 patchset just attaches the dma_buf and then checks if
> the page table is empty....and if so, it's restricted. But now I see
> there's other feedback indicating attaching a restricted dma_buf
> shouldn't even be allowed, so we'll need another strategy for
> detecting them. Ideally there is some function/macro like
> is_dma_buf_restricted(struct dma_buf*) that can indicate that...but we
> haven't come up with a good way to do that yet which doesn't involve
> adding another field to dma_buf or to dma_buf_ops (and if such a thing
> would be fine, then OK...but I had assumed we would get pushback on
> modifying either of those structs).

If there's a need and the best place to put something is in the
dma_buf or dma_buf_ops, that's where it should go.  Folks may
reasonably disagree if it's the best place (there may be yet better
spots for the state to sit in the abstractions), but for stuff going
upstream, there's no reason to try to hack around things or smuggle
state just to avoid changing core structures. Especially if core
structures are internal only and have no ABI implications.

Sima's suggestion that attachments should fail if the device cannot
properly map the restricted buffer makes sense to me. Though I don't
quite see why all attachments should fail, and I don't really like the
idea of a private api, but I need to look more at the suggested virtio
example (but even they said that wasn't their preferred route).

My sense of attach was only that it was supposed to connect a device's
interest in the buffer, allowing lazy allocation to satisfy various
device constraints before first mapping - a design feature that I
don't think anyone ever implemented.  So my sense was it didn't have
much meaning otherwise (but was a requirement to call before map). But
that may have evolved since the early days.

And I'm sure the method to figure out if the attachment can work with
the device may be complicated/difficult, so it sounding reasonable can
be far from it being reasonable to implement.

And again, I don't mean to frustrate or demotivate here. I'm really
excited to see this effort being pushed upstream!

thanks
-john

