Return-Path: <SRS0=2SDw=3U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E7BC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 18:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29DDD20CC7
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 18:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOrfVbPz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="jeDt22Y7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29DDD20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uwr9t7Il/LcJcauPad+bpbtbGCxHqvGtl0C8YUESYMg=; b=rOrfVbPzqammHx
	j9c1iTrM8u4FqHtRhxPKzf6nmLYCDWSMYFhQeGYBYgN+GbqDTVpMYlQJLYuQcwve/Zwvk0jc65Op9
	4CpeeaJ+k6W+040k2k86YrfyMDHh+cdeXygj09pCTHdx8JchKDVH9f4YNaim1D3PDj+MTI9SnhbUO
	EQOuMPzW9+5XI7rLuUTGTaMEZHjIlMSOW0D3anOGboEMe13/vpJGU9FLmbfm2L9RfWEqOqG/ScoZt
	Yf8ksiUeZUo0Yq3ieJNLpipMheJ5hV3C2VmA20+LFVj4SLKVgRa+l3TCLvi9+d/xy8zSefsIet5DO
	v1fUwMuPh/G2YUmiiK+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixalv-0007TM-Ig; Fri, 31 Jan 2020 18:12:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixalt-0007Sa-JO
 for linux-mediatek@lists.infradead.org; Fri, 31 Jan 2020 18:12:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id k11so9730508wrd.9
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jan 2020 10:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQB69rHX1wLUOB6ckxnewaTIywwOUniSjsLx2ZdmZVU=;
 b=jeDt22Y76Yhwn3Q8wYjH9uJcoKEH0QuY429dXNFN7HruLwWlRqVzXUK751j8JOdxjq
 FULXCK2DPDMD9GR+VdOs4vb/InZZFXbIn0Y73jMsCQBUw7xAQd1SkBJu2EwklkEOxiS6
 0USCMPOp279Gx/SIRygdYahxOnYgQuJqKQthJwCpA/S0Ut4VeHIr5/WrT9o9OQprpORe
 xvfqMAcldi7yr298nGsS9k0ykRUMQSUO57pZwZ78QXiR6+6BSTCvE6Xxau6WzzcN/2UD
 6y+X9NEM5Z/eaynqJL6QbY4sQN5sJ43ZQ4BOe/ZqUspMnrtQZJNJlhlFTMDfeKCP2/+H
 d7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQB69rHX1wLUOB6ckxnewaTIywwOUniSjsLx2ZdmZVU=;
 b=MR4Zh63S1XphPueqpE3WELqEqiE680WVz3N5BksoRZMoEKQn2ddNkkjFip8Y2lJCcs
 9jPrNsrGe9z+7+ukykQnii23YoRPO9Ly5YdKgZKjdwAKGNslfuDcSi5k90pmWU2mj+7z
 FutEmZuPgdcH0JrlQKj5pUEltwX86isGmxNddogM6DVwzUhfRueX4rCPLTWhY+zneD/U
 wDgPNB0kFEcRov8C4zvHQxSboXoabcaF+n9x+Geqn5lp57h7TvzLn0aWYNebWD9mfe1P
 0rQccv3/Hl1Ya4CjdW48z2gTbBvrdixXEZSFYGgFCJoqtY6A4irH2u7eHiDVPCM5grNB
 m+Bg==
X-Gm-Message-State: APjAAAUWyIt+tuA7wcYbnTaUzIIM3/5k0H26+dX4YwBNpEa/GzP0zfbz
 syMIUj4ma2dWAOWC3y6ym/Nh5Hzhci23CTnOGrGlXg==
X-Google-Smtp-Source: APXvYqyq/YfoE0oFSPYzEyKRSgA8t1DxpbDmSXNnWAWmVKZvjNNBuUx80heTPOUQbSjAkXy16oEV7Acsq2nO+E63ABI=
X-Received: by 2002:a5d:6692:: with SMTP id l18mr12918211wru.382.1580494315839; 
 Fri, 31 Jan 2020 10:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20200130064430.17198-1-walter-zh.wu@mediatek.com>
 <CAG_fn=X_jSUJXD932z9oN5hBa--n3Qct4zrjzGaPtb2MwJye7A@mail.gmail.com>
 <1580436306.11126.16.camel@mtksdccf07>
In-Reply-To: <1580436306.11126.16.camel@mtksdccf07>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 31 Jan 2020 19:11:44 +0100
Message-ID: <CAG_fn=X2V0nL=+s38bDbS3UXf2_i61tSevd8vzkV-ZKY=7MHvw@mail.gmail.com>
Subject: Re: [PATCH v3] lib/stackdepot: Fix global out-of-bounds in stackdepot
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_101201_666771_A052D144 
X-CRM114-Status: GOOD (  23.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Josh Poimboeuf <jpoimboe@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 31, 2020 at 3:05 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> On Thu, 2020-01-30 at 13:03 +0100, Alexander Potapenko wrote:
> > On Thu, Jan 30, 2020 at 7:44 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > Hi Walter,
> >
> > > If the depot_index = STACK_ALLOC_MAX_SLABS - 2 and next_slab_inited = 0,
> > > then it will cause array out-of-bounds access, so that we should modify
> > > the detection to avoid this array out-of-bounds bug.
> > >
> > > Assume depot_index = STACK_ALLOC_MAX_SLABS - 3
> > > Consider following call flow sequence:
> > >
> > > stack_depot_save()
> > >    depot_alloc_stack()
> > >       if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
> > >       depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 2
> > >       if (depot_index + 1 < STACK_ALLOC_MAX_SLABS) //enter
> > >          smp_store_release(&next_slab_inited, 0); //next_slab_inited = 0
> > >       init_stack_slab()
> > >          if (stack_slabs[depot_index] == NULL) //enter and exit
> > >
> > > stack_depot_save()
> > >    depot_alloc_stack()
> > >       if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
> > >       depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 1
> > >       init_stack_slab(&prealloc)
> > >          stack_slabs[depot_index + 1]  //here get global out-of-bounds
> > >
> > > Cc: Dmitry Vyukov <dvyukov@google.com>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Alexander Potapenko <glider@google.com>
> > > Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> > > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > ---
> > > changes in v2:
> > > modify call flow sequence and preconditon
> > >
> > > changes in v3:
> > > add some reviewers
> > > ---
> > >  lib/stackdepot.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> > > index ed717dd08ff3..7e8a15e41600 100644
> > > --- a/lib/stackdepot.c
> > > +++ b/lib/stackdepot.c
> > > @@ -106,7 +106,7 @@ static struct stack_record *depot_alloc_stack(unsigned long *entries, int size,
> > >         required_size = ALIGN(required_size, 1 << STACK_ALLOC_ALIGN);
> > >
> > >         if (unlikely(depot_offset + required_size > STACK_ALLOC_SIZE)) {
> > > -               if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) {
> > > +               if (unlikely(depot_index + 2 >= STACK_ALLOC_MAX_SLABS)) {

This again means stack_slabs[STACK_ALLOC_MAX_SLABS - 2] gets
initialized, but stack_slabs[STACK_ALLOC_MAX_SLABS - 1] doesn't,
because we'll be bailing out from init_stack_slab() from now on.
Does this patch actually fix the problem (do you have a reliable reproducer?)
This addition of 2 is also counterintuitive, I don't think further
readers will understand the logic behind it.

What if we just check that depot_index + 1 is a valid index before accessing it?

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 2e7d2232ed3c..c2e6ff18d716 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -106,7 +106,9 @@ static bool init_stack_slab(void **prealloc)
        if (stack_slabs[depot_index] == NULL) {
                stack_slabs[depot_index] = *prealloc;
        } else {
-               stack_slabs[depot_index + 1] = *prealloc;
+               /* If this is the last depot slab, do not touch the next one. */
+               if (depot_index + 1 < STACK_ALLOC_MAX_SLABS)
+                       stack_slabs[depot_index + 1] = *prealloc;
                /*
                 * This smp_store_release pairs with smp_load_acquire() from
                 * |next_slab_inited| above and in stack_depot_save().

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
