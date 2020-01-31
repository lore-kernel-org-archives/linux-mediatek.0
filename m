Return-Path: <SRS0=2SDw=3U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B11C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 02:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE4C2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 02:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tdg4FeMr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t/kHqHbI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE4C2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAz5sGPj+MwmYtyrwbEKv33EFlqBSoIGfpCxAruVtsY=; b=Tdg4FeMrL14aFR
	9wq2FDZkdpTF0pvJV+jO1/doG7iSSE6/IBCj77f5PBITffOQ7AZ7/7bxm/6e2Mn2x7SAOOOZq1XwL
	CB2aHW6VIhOowy5bwOZSzCDZdUxrXjBf/Wyo+dqWzPxULDzdY+POESvaFF4QpQQjFs310pLHE14YZ
	GTv+0VuQvsS1TT896L/8bMVRi13/4hFahUhBttyAu4RSxtMNKqQl8qqchfufsUUNxG6roCOxZKn4V
	lo3FYJ/oqTi3Qfjqhve71w/hwK7SpTvM594+8sgaOD9HiASBiNULLYOwnwN/B+w2BEuDq7Br4OLQi
	qjJFkjklZAQ19MKbeO2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixLgy-0007FY-8y; Fri, 31 Jan 2020 02:05:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixLgp-00079j-Uk; Fri, 31 Jan 2020 02:05:49 +0000
X-UUID: 1b99f470b09443db9ec129b6e29d950d-20200130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eAN7TYSx5Ngnmh1dy1RUM0HJOBtCp5tpJodPVFhl6LQ=; 
 b=t/kHqHbIsMuJDEtefMCvcLTmsW/5c4BBHLrMccFqL+IkVCD9EQGYsUxoeu3xExjhxaeLQeVc6JHic3PR8Th2tLKjUwCDhHw+oOtddmhwkThlVxzRWfvCm6SWd2aIudQTNypgISxPxIiwjIZsMgp3a3SAABvmQQATXNRZhwr6k0Y=;
X-UUID: 1b99f470b09443db9ec129b6e29d950d-20200130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 919770357; Thu, 30 Jan 2020 18:05:42 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 Jan 2020 18:05:33 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 Jan 2020 10:04:23 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 31 Jan 2020 10:05:16 +0800
Message-ID: <1580436306.11126.16.camel@mtksdccf07>
Subject: Re: [PATCH v3] lib/stackdepot: Fix global out-of-bounds in stackdepot
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Alexander Potapenko <glider@google.com>
Date: Fri, 31 Jan 2020 10:05:06 +0800
In-Reply-To: <CAG_fn=X_jSUJXD932z9oN5hBa--n3Qct4zrjzGaPtb2MwJye7A@mail.gmail.com>
References: <20200130064430.17198-1-walter-zh.wu@mediatek.com>
 <CAG_fn=X_jSUJXD932z9oN5hBa--n3Qct4zrjzGaPtb2MwJye7A@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_180547_998924_069104EE 
X-CRM114-Status: GOOD (  24.77  )
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
 linux-arm-kernel@lists.infradead.org, Josh
 Poimboeuf <jpoimboe@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-30 at 13:03 +0100, Alexander Potapenko wrote:
> On Thu, Jan 30, 2020 at 7:44 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> 
> Hi Walter,
> 
> > If the depot_index = STACK_ALLOC_MAX_SLABS - 2 and next_slab_inited = 0,
> > then it will cause array out-of-bounds access, so that we should modify
> > the detection to avoid this array out-of-bounds bug.
> >
> > Assume depot_index = STACK_ALLOC_MAX_SLABS - 3
> > Consider following call flow sequence:
> >
> > stack_depot_save()
> >    depot_alloc_stack()
> >       if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
> >       depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 2
> >       if (depot_index + 1 < STACK_ALLOC_MAX_SLABS) //enter
> >          smp_store_release(&next_slab_inited, 0); //next_slab_inited = 0
> >       init_stack_slab()
> >          if (stack_slabs[depot_index] == NULL) //enter and exit
> >
> > stack_depot_save()
> >    depot_alloc_stack()
> >       if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
> >       depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 1
> >       init_stack_slab(&prealloc)
> >          stack_slabs[depot_index + 1]  //here get global out-of-bounds
> >
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > ---
> > changes in v2:
> > modify call flow sequence and preconditon
> >
> > changes in v3:
> > add some reviewers
> > ---
> >  lib/stackdepot.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> > index ed717dd08ff3..7e8a15e41600 100644
> > --- a/lib/stackdepot.c
> > +++ b/lib/stackdepot.c
> > @@ -106,7 +106,7 @@ static struct stack_record *depot_alloc_stack(unsigned long *entries, int size,
> >         required_size = ALIGN(required_size, 1 << STACK_ALLOC_ALIGN);
> >
> >         if (unlikely(depot_offset + required_size > STACK_ALLOC_SIZE)) {
> > -               if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) {
> > +               if (unlikely(depot_index + 2 >= STACK_ALLOC_MAX_SLABS)) {
> 
> I don't think this is the right way to fix the problem.
> You're basically throwing away the last element of stack_slabs[], as
> we won't allocate anything from it.
> 
ok, I agree.
 
> How about we set |next_slab_inited| to 1 here:
> 
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 2e7d2232ed3c..943a51eb746d 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -105,6 +105,8 @@ static bool init_stack_slab(void **prealloc)
>                 return true;
>         if (stack_slabs[depot_index] == NULL) {
>                 stack_slabs[depot_index] = *prealloc;
> +               if (depot_index + 1 == STACK_ALLOC_MAX_SLABS)
> +                       smp_store_release(&next_slab_inited, 1);
>         } else {
>                 stack_slabs[depot_index + 1] = *prealloc;
>                 /*
> 
> This will ensure we won't be preallocating pages once |depot_index|
> reaches the last element, and we won't attempt to write those pages
> anywhere either.
> 
> Could you please check if this fixes the problem for you?
> 
Consider above call flow sequence at first stack_depot_save(),
depot_index = STACK_ALLOC_MAX_SLABS - 2 before enter init_stack_slab(),
so the fixes should be below.

--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -83,6 +83,8 @@ static bool init_stack_slab(void **prealloc)
                return true;
        if (stack_slabs[depot_index] == NULL) {
                stack_slabs[depot_index] = *prealloc;
+               if (depot_index + 2 == STACK_ALLOC_MAX_SLABS)
+                       smp_store_release(&next_slab_inited, 1);
        } else {
                stack_slabs[depot_index + 1] = *prealloc;
                /*


> >                         WARN_ONCE(1, "Stack depot reached limit capacity");
> >                         return NULL;
> >                 }
> > --
> > 2.18.0
> 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
