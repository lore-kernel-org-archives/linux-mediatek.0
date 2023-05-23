Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B113C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 07:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh1M/PyhqnPF3gHXcsPzIKqPXVy0TQ5XWDVGt8r34Cw=; b=HO62LiJQbv6an+tAhPrTnE5EFy
	sAfVVTgi3EYyEOYouXSTmNkfihq5Wl37gUkpXFma9bHMg84L0P7oBXKOvKW2Z4Qs6z8JZFW5/i3JL
	hYNTWiuhB7R4I+6wAXBP4dzglOUaPCo5WcdKITA/rz3K/Q7B1bnVqAAGDXte0y1Va7ZNMGwT7oeyb
	xmojo5+AhNxSsBQA5OnJQ8KSeXQTK4gwe1K2BCONMqj6prlOFnB9tzL3JtIPFoBEs4fetTJq4PzUL
	dd0/GsK3MIRN3ZEPY/r39Hl8rHMgeTstGJ3eH+1RnnqCA5WYRXpV4+gCPQ9UNxPi3lb8TVS7gqMjc
	u87abvCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MOm-009DJ6-2t;
	Tue, 23 May 2023 07:25:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MOg-009DHc-10;
	Tue, 23 May 2023 07:25:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so47645945e9.0;
        Tue, 23 May 2023 00:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684826728; x=1687418728;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hh1M/PyhqnPF3gHXcsPzIKqPXVy0TQ5XWDVGt8r34Cw=;
        b=MbWTUJK0onitNaT4PQy7LWYs3/eCrjGWOztlNDkwLuKrPc2NB3ITFEKXZNPSCQBVkm
         IsDCDKehWZ8npbFaRSGkKIfRvHD8P75fyk5si+zzsFeFE8w/tJz3S7O1mOUp7Mt7HTdT
         r6LF5FjChUepkHIWCN4SCllJcZNcSGNLmnC3zqHu1xZ7+jWeJ7IYlfbR7gxLtDkH4JKX
         mxay8Vb1CJPUnjMgALNdyy5NHyJTWR0JvVa/hBUlmukAz3edKWeYRZ8sytnO6b0QbvCw
         JlsLc6mnPtF81xYjLlCDrGVNDeM1Zij5DB32GhWHgEDPh620Z76Sx5nLWt4mZOCnoR8i
         ZMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684826728; x=1687418728;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hh1M/PyhqnPF3gHXcsPzIKqPXVy0TQ5XWDVGt8r34Cw=;
        b=Gr01qjRY8lrAc7JUv5h/g6q5eL45rwbAG1zbGhKswIenp+rTfuUWCwRg8Qs1HlapT2
         wN9jIwjU8R7L76yBZTiNoqtfusvKJ+XYzgodi/5h1ckD7kuBuD0CoYX8i/X+ksugxvlI
         7S+LpiVCzcmH/zBxNhelMtpmKeyhcA4H6WAiwjsQpXAiHGsekUGR1ajan3BN3CzE273R
         J4abXxaHsNpnwC98nZ0ds3x4P4oe71nyS8qSJgyaoV+KIoQZM3DAFi71X8yNfdtYNPTJ
         JJmuy9QvZWA+MTosSCmuLOHRG6Th9zSQ1p6JOjeHwdrJa4A6Q3RpBRcaO9dX1phn1K05
         6CKA==
X-Gm-Message-State: AC+VfDyfmjiaoRZcYDucMYRVSQhG0/zQG/pbte48IZ0BtlXPZoXlV5XK
	MFH//213qvic5VscsaSBBIc=
X-Google-Smtp-Source: ACHHUZ6TvcH4VxLvgQZWHCNak2I8mUxXM2ty6AS9EVucuJhjX5yJLuwW0XNYUI3IR6a9XcTU9oOJTg==
X-Received: by 2002:a1c:4c10:0:b0:3f4:5058:a033 with SMTP id z16-20020a1c4c10000000b003f45058a033mr9372191wmf.24.1684826728204;
        Tue, 23 May 2023 00:25:28 -0700 (PDT)
Received: from localhost (host81-154-179-160.range81-154.btcentralplus.com. [81.154.179.160])
        by smtp.gmail.com with ESMTPSA id h1-20020a1ccc01000000b003eddc6aa5fasm13988260wmb.39.2023.05.23.00.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:25:27 -0700 (PDT)
Date: Tue, 23 May 2023 08:25:26 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Christoph Hellwig <hch@infradead.org>,
	Xiaoming Ding <xiaoming.ding@mediatek.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com,
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Subject: Re: FOLL_LONGTERM vs FOLL_EPHEMERAL Re: [PATCH] tee: add
 FOLL_LONGTERM for CMA case when alloc shm
Message-ID: <106e7886-ef02-4979-b96d-66d33cfa119c@lucifer.local>
References: <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org>
 <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
 <ZGSgCZrg+RjAbGO1@infradead.org>
 <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
 <d4773626-6cf0-c929-c775-a84ac41fd719@redhat.com>
 <ZGWnq/dAYELyKpTy@infradead.org>
 <CAFA6WYPgvifYcj_MT7BBcC0BtQDWXV0u+HY8qv0M9nNyiCgkow@mail.gmail.com>
 <8b898768-a3c0-198d-a70c-9aa96b7f4a29@redhat.com>
 <1ced7f32-553e-2a5b-eec9-f794d7983d56@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ced7f32-553e-2a5b-eec9-f794d7983d56@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_002530_354613_5F960799 
X-CRM114-Status: GOOD (  41.32  )
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

On Mon, May 22, 2023 at 06:54:29PM -0700, John Hubbard wrote:
> On 5/18/23 06:56, David Hildenbrand wrote:
> > On 18.05.23 08:08, Sumit Garg wrote:
> > > On Thu, 18 May 2023 at 09:51, Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > On Wed, May 17, 2023 at 08:23:33PM +0200, David Hildenbrand wrote:
> > > > > In general: if user space controls it -> possibly forever -> long-term. Even
> > > > > if in most cases it's a short delay: there is no trusting on user space.
> > > > >
> > > > > For example, iouring fixed buffers keep pages pinned until user space
> > > > > decides to unregistered the buffers -> long-term.
> > > > >
> > > > > Short-term is, for example, something like O_DIRECT where we pin -> DMA ->
> > > > > unpin in essentially one operation.
> > > >
> > > > Btw, one thing that's been on my mind is that I think we got the
> > > > polarity on FOLL_LONGTERM wrong.  Instead of opting into the long term
> > > > behavior it really should be the default, with a FOLL_EPHEMERAL flag
> > > > to opt out of it.  And every users of this flag is required to have
> > > > a comment explaining the life time rules for the pin..

I couldn't agree more, based on my recent forays into GUP the interface
continues to strike me as odd:-

- FOLL_GET is a wing and a prayer that nothing that
  [folio|page]_maybe_dma_pinned() prevents happens in the brief period the
  page is pinned/manipulated. So agree completely with David's concept of
  unexporting that and perhaps carefully considering our use of
  it. Obviously the comments around functions like gup_remote() make clear
  that 'this page not be what you think it is' but I wonder whether many
  callers of GUP _truly_ take that on board.

- FOLL_LONGTERM is entirely optional for PUP and you can just go ahead and
  fragment page blocks to your heart's content. Of course this would be an
  abuse, but abuses happen.

- With the recent change to PUP/FOLL_LONGTERM disallowing dirty tracked
  file-backed mappings we're now really relying on this flag indicating a
  _long term_ pin semantically. By defaulting to this being switched on, we
  avoid cases of callers who might end up treating the won't
  reclaim/etc. aspect of PUP as all they care about while ignoring the
  MIGRATE_MOVABLE aspect.

>
> I see maybe 10 or 20 call sites today. So it is definitely feasible to add
> documentation at each, explaining the why it wants a long term pin.
>

Yeah, my efforts at e.g. dropping vmas has been eye-opening in actually
quite how often a refactoring like this often ends up being more
straightforward than you might imagine.

> > >
> > > It does look like a better approach to me given the very nature of
> > > user space pages.
> >
> > Yeah, there is a lot of historical baggage. For example, FOLL_GET should be inaccessible to kernel modules completely at one point, to be only used by selected core-mm pieces.
>
> Yes. When I first mass-converted call sites from gup to pup, I just
> preserved FOLL_GET behavior in order to keep from changing too much at
> once. But I agree that that it would be nice to make FOLL_GET an
> mm internal-only flag like FOLL_PIN.

Very glad you did that work! And totally understandable as to you being
conservative with that, but I think we're at a point where there's more
acceptance of incremental improvements to GUP as a whole.

I have another patch series saved up for _yet more_ changes on this. But
mindful of churn I am trying to space them out... until Jason nudges me of
course :)

>
> >
> > Maybe we should even disallow passing in FOLL_LONGTERM as a flag and only provide functions like pin_user_pages() vs. pin_user_pages_longterm(). Then, discussions about conditional flag-setting are no more :)
> >
> > ... or even use pin_user_pages_shortterm() vs. pin_user_pages() ... to make the default be longterm.
> >
>
> Yes, it is true that having most gup flags be internal to mm does tend
> to avoid some bugs. But it's also a lot of churn. I'm still on the fence
> as to whether it's really a good move to do this for FOLL_LONGTERM or
> not. But it's really easy to push me off of fences. :)

*nudge* ;)

>
> thanks,
> --
> John Hubbard
> NVIDIA
>

Looking at non-fast, non-FOLL_LONGTERM PUP callers (forgive me if I missed any):-

- pin_user_pages_remote() in process_vm_rw_single_vec() for the
  process_vm_access functionality.

- pin_user_pages_remote() in user_event_enabler_write() in
  kernel/trace/trace_events_user.c.

- pin_user_pages_unlocked() in ivtv_udma_setup() in
  drivers/media/pci/ivtv/ivtv-udma.c and ivtv_yuv_prep_user_dma() in ivtv-yuv.c.

And none that actually directly invoke PUP without FOLL_LOGNTERM... That
suggests that we could simply disallow non-FOLL_LONGTERM non-fast PUP calls
altogether and move to pin_user_pages_longterm() [I'm happy to write a
patch series doing this].

The ivtv callers look like they really actually want FOLL_LONGTERM unless
I'm missing something so we should probably change that too?

I haven't surveyed the fast versions, but I think defaulting to
FOLL_LONGTERM on them also makes sense.

