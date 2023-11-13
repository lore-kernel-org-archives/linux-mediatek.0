Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC517C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANsBnkxIEizgy+Rx0aSYLP0EtZ8VynwdjpRWu4uknns=; b=nmPnpuhlhnfyUqIRglDXX1yn/1
	KGwEA6cQ/Cz5ajOS8z3CuOyg9hcnjofkbUsONGEMWFBpmqh7Xiehoz6gBl3L+2qJ8FKMbHTjd1+t7
	0J63J+lSiWZhtqI+GfX1H8TuPNFOuycjK3SGZXZzwN9Hy5fInX4WbV+OcgvDngc0XV0e0nsEvc28u
	D6zhinE22DGvSej8mBUYH1zswo52rX25kMcR+/ymcmp+gfShMcU8NCem84Ue/3MtjS9AisAhgUEXE
	xlJHxlOwnRDRGEUS/FDKOkWYwVTXDGyUwFqtqdiUEdmGn1WjctgrpbGP68v0HxzhACFTR9DS17mVm
	zKY+pNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2bIJ-00ETU4-2Z;
	Mon, 13 Nov 2023 18:04:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2bIG-00ETT2-2t
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 18:04:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc30de471dso8725ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Nov 2023 10:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699898652; x=1700503452; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANsBnkxIEizgy+Rx0aSYLP0EtZ8VynwdjpRWu4uknns=;
        b=uzsaqLrmZ0QrngMFAJocWCh7fXOKcJYVESOnrRWcH40OU4XxZFuRESmLyUSHXGmyA/
         vxm1DcIW0cpmfILQgxI/b1ZYSQ8kLxIvDqNGWI1wU+mTVKmL0lPZ+2dVQvZfrfRl13Fr
         GezENvksC1wV52/l4vSI8S/HG9CaqxSGOFdWQsOzSywiUkOn8pppZKKlNoJLc0W/WXoe
         vbyt4M6eCkr8rggpjDFwWio2X7x5PqUSJJYEROmOxOcASt+aKG1x4LOU00VwxTmGOxMV
         t4tvnnlm2H19BNZ1R9cUiVluwPvwHlqyzgL4yAjFoO3hVpfqCtLb5IiAfMPVjBa6btNM
         nhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699898652; x=1700503452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANsBnkxIEizgy+Rx0aSYLP0EtZ8VynwdjpRWu4uknns=;
        b=SnNUGC/5y+lTk1RXC/XgyFjjKacm6RaZ2hP78NTXK83s7htjFPu7cpXL08XiDiXD2o
         6IS0lrFGvPd5azwGywRjvaNJimgHIfidiWbmxnrZsLsBjLTMqRYXVteaYXBs6Xyci9zA
         QzywuUOxq6pQsz4IfOUxL7OaQPf46eaPQhULxJCazPEmzuO9xCKrXrSzKCGtVSGWqnTu
         kxjy+GpAKtUL/guXhsmQwyZjhA05QgWhr3bwN6u4Z7Q4/UPo8kN4vE7Ay+t9SvuCLFas
         sHhgvCn33QAUJB/nKkaIWfq0wyDhg9v3R7/z3FmD/uLMzpwgu0FrNemvyvRh7vphtOsP
         jTHw==
X-Gm-Message-State: AOJu0Yxn77rLchXn4NodaZBk+hXZsdXuwQ/7rdU6NxEA7Z289JAvPzTR
	HPGvUrM/siTwn8XuG/MkO15AdYgqEMge/iEFGdoG
X-Google-Smtp-Source: AGHT+IHb03F7T2KTb6TSXiR1tmUr6UGViGF0nZ4nr88w91aDnu2AAQ+8uxUpsoeNCFN6pRoOfEgnDys2xBb/WNxE3dc=
X-Received: by 2002:a17:902:d491:b0:1bc:29c3:5895 with SMTP id
 c17-20020a170902d49100b001bc29c35895mr19363plg.0.1699898651665; Mon, 13 Nov
 2023 10:04:11 -0800 (PST)
MIME-Version: 1.0
References: <20231106120423.23364-1-yunfei.dong@mediatek.com>
 <20231106120423.23364-5-yunfei.dong@mediatek.com> <ZU/D3iDxIW6Q8bOq@duo.ucw.cz>
In-Reply-To: <ZU/D3iDxIW6Q8bOq@duo.ucw.cz>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Mon, 13 Nov 2023 10:04:00 -0800
Message-ID: <CA+ddPcNtZ5XRNZOOm4+C+SBpo0jLWpMZ1xOPrR-Dj_CQpT9s5Q@mail.gmail.com>
Subject: Re: [PATCH v2,04/21] v4l: add documentation for secure memory flag
To: Pavel Machek <pavel@ucw.cz>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, "T . J . Mercier" <tjmercier@google.com>, 
	John Stultz <jstultz@google.com>, Yong Wu <yong.wu@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_100416_933722_29CCBF4F 
X-CRM114-Status: GOOD (  16.36  )
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

Mediatek,

What happened to the RFC cover letter that explained more overall for
what this is for?  That should be included in the 0th patch for each
of the series.

Pavel,
This is for secure video playback where the memory is 'secure'
(TrustZone in this case) and is only accessible in the TEE and
specific HW blocks. Userspace has FDs that reference the memory, but
kernel/userspace can't actually map/access that memory.  And yes, this
is for supporting DRM (Digital Rights Management) playback.

Cheers,
Jeff


On Sat, Nov 11, 2023 at 11:06=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> >
> > Adds documentation for V4L2_MEMORY_FLAG_SECURE.
>
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -696,7 +696,7 @@ enum v4l2_memory
> >
> >  .. _memory-flags:
> >
> > -Memory Consistency Flags
> > +Memory Flags
> >  ------------------------
> >
> >  .. raw:: latex
> > @@ -728,6 +728,12 @@ Memory Consistency Flags
> >       only if the buffer is used for :ref:`memory mapping <mmap>` I/O a=
nd the
> >       queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> >       <V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> > +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
> > +
> > +      - ``V4L2_MEMORY_FLAG_SECURE``
> > +      - 0x00000002
> > +      - DMA bufs passed into the queue will be validated to ensure the=
y were
> > +     allocated from a secure dma-heap.
>
> Could we get some more information somewhere? Why would userspace want
> to work with "secure" DMA heaps? How exactly are they different from
> others? What attacks are these secure against? What is goal of all
> this? DRM?
>
> BR,
>                                                                 Pavel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.

