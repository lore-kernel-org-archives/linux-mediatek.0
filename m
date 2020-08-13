Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17CCC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 01:46:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7150221775
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 01:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p0wUTrLE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PVYnGy0Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7150221775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4OqebYh0E+tqYVzNWz08/JP0auDP52kMzm9Fb4200g=; b=p0wUTrLE4EULkRrONGXD8KYS8
	LwE+Fk1nYx1DELf5l3amkZSOsynXjX6dJEDmkbwnzvRsyWT4YPbixz3PGXIG+9G0/aOgn4hb2fqj5
	fwODryPWyDu7I5kLwyVLihWfw/8YL0Gwoc9Gy1c8+8jm1u70WngQ0lxnmc9L7rEOT52BdFBNT2bM+
	n/F/EZDTEYNVttRT8TP3vzpm3V9aE41LbffB5SWsO+69ibqUWLvzYFPycKEG+vJSVG6b+VEBmV4aJ
	lFBWYHcvI/fL0TQle8r+O5UWR+ZL4XHBlAd63NStppGOJgZevFLHutIo430Qor2+/txpK0y+WLBq/
	hoTbyR2gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k62KO-0000Sv-IC; Thu, 13 Aug 2020 01:46:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k62KJ-0000Rf-UK; Thu, 13 Aug 2020 01:46:45 +0000
X-UUID: 35d6b568a0514bc5933790c3e7e27d45-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=asJV3IBv1/0dhV/oRZH8LjXOLv7AOsr87CflwjOG1gY=; 
 b=PVYnGy0ZK311eNEtTn2eQmP3xSy5bUO3wADqWYO4OGKZRd21CPQXoGLDpw6KidMHoHJqQFYZVqjd5KqftvCA55YxNTcywwQwq0WrwKvTgpoYF0IAaDNoQawR29c4nbIraJkRSMSmCL8sk05nNlKBwn42ciaBiAn5Cuo1AgxgGI8=;
X-UUID: 35d6b568a0514bc5933790c3e7e27d45-20200812
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 255767147; Wed, 12 Aug 2020 17:46:22 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 18:46:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 09:46:19 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 09:46:15 +0800
Message-ID: <1597283178.9999.19.camel@mtksdccf07>
Subject: Re: [PATCH 1/5] timer: kasan: record and print timer stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Marco Elver <elver@google.com>
Date: Thu, 13 Aug 2020 09:46:18 +0800
In-Reply-To: <CANpmjNO9=JBcSV-nif9a=4Zt7gTCp6e5c2jVXMCSFgP3v2P9-w@mail.gmail.com>
References: <20200810072313.529-1-walter-zh.wu@mediatek.com>
 <CANpmjNO9=JBcSV-nif9a=4Zt7gTCp6e5c2jVXMCSFgP3v2P9-w@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A828CD4FB1E137D0EE7E3C33E0D2CE14A46CDB2C1BF3FFD27ED08E538949AC012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_214644_105934_D5EC2E55 
X-CRM114-Status: GOOD (  41.32  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Stephen
 Boyd <sboyd@kernel.org>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Thomas
 Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 16:13 +0200, Marco Elver wrote:
> On Mon, 10 Aug 2020 at 09:23, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > This patch records the last two timer queueing stacks and prints
> > up to 2 timer stacks in KASAN report. It is useful for programmers
> > to solve use-after-free or double-free memory timer issues.
> >
> > When timer_setup() or timer_setup_on_stack() is called, then it
> > prepares to use this timer and sets timer callback, we store
> > this call stack in order to print it in KASAN report.
> >
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >  include/linux/kasan.h |  2 ++
> >  kernel/time/timer.c   |  2 ++
> >  mm/kasan/generic.c    | 21 +++++++++++++++++++++
> >  mm/kasan/kasan.h      |  4 +++-
> >  mm/kasan/report.c     | 11 +++++++++++
> >  5 files changed, 39 insertions(+), 1 deletion(-)
> 
> I'm commenting on the code here, but it also applies to patch 2/5, as
> it's almost a copy-paste.
> 
> In general, I'd say the solution to get this feature is poorly
> designed, resulting in excessive LOC added. The logic added already
> exists for the aux stacks.
> 

That's true, we will have refactoring for it.

> > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > index 23b7ee00572d..763664b36dc6 100644
> > --- a/include/linux/kasan.h
> > +++ b/include/linux/kasan.h
> > @@ -175,12 +175,14 @@ static inline size_t kasan_metadata_size(struct kmem_cache *cache) { return 0; }
> >  void kasan_cache_shrink(struct kmem_cache *cache);
> >  void kasan_cache_shutdown(struct kmem_cache *cache);
> >  void kasan_record_aux_stack(void *ptr);
> > +void kasan_record_tmr_stack(void *ptr);
> >
> >  #else /* CONFIG_KASAN_GENERIC */
> >
> >  static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
> >  static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
> >  static inline void kasan_record_aux_stack(void *ptr) {}
> > +static inline void kasan_record_tmr_stack(void *ptr) {}
> 
> It appears that the 'aux' stack is currently only used for call_rcu
> stacks, but this interface does not inherently tie it to call_rcu. The
> only thing tying it to call_rcu is the fact that the report calls out
> call_rcu.
> 
> >  /**
> > diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> > index 4b3cbad7431b..f35dcec990ab 100644
> > --- a/mm/kasan/generic.c
> > +++ b/mm/kasan/generic.c
> > @@ -347,6 +347,27 @@ void kasan_record_aux_stack(void *addr)
> >         alloc_info->aux_stack[0] = kasan_save_stack(GFP_NOWAIT);
> >  }
> >
> > +void kasan_record_tmr_stack(void *addr)
> > +{
> > +       struct page *page = kasan_addr_to_page(addr);
> > +       struct kmem_cache *cache;
> > +       struct kasan_alloc_meta *alloc_info;
> > +       void *object;
> > +
> > +       if (!(page && PageSlab(page)))
> > +               return;
> > +
> > +       cache = page->slab_cache;
> > +       object = nearest_obj(cache, page, addr);
> > +       alloc_info = get_alloc_info(cache, object);
> > +
> > +       /*
> > +        * record the last two timer stacks.
> > +        */
> > +       alloc_info->tmr_stack[1] = alloc_info->tmr_stack[0];
> > +       alloc_info->tmr_stack[0] = kasan_save_stack(GFP_NOWAIT);
> > +}
> 
> The solution here is, unfortunately, poorly designed. This is a
> copy-paste of the kasan_record_aux_stack() function.
> 

kasan_record_aux_stack() will be re-used for call_rcu, timer, and
workqueue.

> >  void kasan_set_free_info(struct kmem_cache *cache,
> >                                 void *object, u8 tag)
> >  {
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index ef655a1c6e15..c50827f388a3 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -108,10 +108,12 @@ struct kasan_alloc_meta {
> >         struct kasan_track alloc_track;
> >  #ifdef CONFIG_KASAN_GENERIC
> >         /*
> > -        * call_rcu() call stack is stored into struct kasan_alloc_meta.
> > +        * call_rcu() call stack and timer queueing stack are stored
> > +        * into struct kasan_alloc_meta.
> >          * The free stack is stored into struct kasan_free_meta.
> >          */
> >         depot_stack_handle_t aux_stack[2];
> > +       depot_stack_handle_t tmr_stack[2];
> >  #else
> >         struct kasan_track free_track[KASAN_NR_FREE_STACKS];
> >  #endif
> > diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> > index fed3c8fdfd25..6fa3bfee381f 100644
> > --- a/mm/kasan/report.c
> > +++ b/mm/kasan/report.c
> > @@ -191,6 +191,17 @@ static void describe_object(struct kmem_cache *cache, void *object,
> >                         print_stack(alloc_info->aux_stack[1]);
> >                         pr_err("\n");
> >                 }
> > +
> > +               if (alloc_info->tmr_stack[0]) {
> > +                       pr_err("Last timer stack:\n");
> > +                       print_stack(alloc_info->tmr_stack[0]);
> > +                       pr_err("\n");
> > +               }
> > +               if (alloc_info->tmr_stack[1]) {
> > +                       pr_err("Second to last timer stack:\n");
> > +                       print_stack(alloc_info->tmr_stack[1]);
> > +                       pr_err("\n");
> > +               }
> 
> Why can't we just use the aux stack for everything, and simply change
> the message printed in the report. After all, the stack trace will
> include all the information to tell if it's call_rcu, timer, or
> workqueue.
> 

This is a good suggestion, next patch will do it.

> The reporting code would simply have to be changed to say something
> like "Last potentially related work creation:" -- because what the
> "aux" thing is trying to abstract are stack traces to work creations
> that took an address that is closely related. Whether or not you want
> to call it "work" is up to you, but that's the most generic term I
> could think of right now (any better terms?).
> 

Work is good.

> Another argument for this consolidation is that it's highly unlikely
> that aux_stack[a] && tmr_stack[b] && wq_stack[c], and you need to
> print all the stacks. If you are worried we need more aux stacks, just
> make the array size 3+ (but I think it's not necessary).
> 

We hope that next patch keep it as it is aux_stack[2], it may record
call_rcu, timer, or workqueue. Because struct kasan_alloc_meta is 16
bytes, it will have the minimal redzone size and good alignment, lets
get better memory consumption.


Thanks for your good suggestion.

Walter


> Thanks,
> -- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
