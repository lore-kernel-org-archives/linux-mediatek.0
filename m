Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3676AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 12:51:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF24A20791
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 12:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="He6Wkwg9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BOIL1Rth"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF24A20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HGn1DoICqXw4nvGu4Uvj2hBRGeNUNpU+hJfwofugAEg=; b=He6Wkwg9mU4c9I913mmnylkLA
	Z+JCeA6QGtemPJ2bY5aXMp7baGFUPMLaLIQdOPLLNZA+8KqvZNmfaSy2435jHfpqulZZfGrmJtyDS
	vf76d/1VS4SODby1vcDhB7gI4vRothc2WTKmyyet8+F5x+6qvDnTE5xOTDpby44W3kRkUKGprdURB
	H+fiXBIdi+419Nmk8mPYtdvimvL+MWcIfh77tL3wRMFz8Ty6oFaAaNRQJFtiyeRJSUX1dvva+8Btv
	ZG5vRM+TW+m6wU+KP+fsGvfZj7HMt0HdGA544LE3O57tpZSan4p8Yu0iRhiydSOyu3WXAflG/YebY
	2fIkkx41g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6ChA-0005Qg-Dg; Thu, 13 Aug 2020 12:51:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6CfJ-0004TP-4C; Thu, 13 Aug 2020 12:49:09 +0000
X-UUID: bd8aaff32b07494b8f9b751b447b8803-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aaE6HcSMNBLCW8HhXQtINfxBXNzqkMSqUtGQrGAVPSM=; 
 b=BOIL1Rthkq9dh/cIjPy+2394BryYEPZfVPl/p+WsDexLcm3qgQzNuBPsL0vAbg37mWo9/dLo2BbPnRGsW8DFgSdQLfM7yeckhVTy/TqVPueTsFo02M+ubzkfdnErZR0RGBMNia4m2X8yPfKS1hN2oImOc4oPWc9W6sKsqNaEzNA=;
X-UUID: bd8aaff32b07494b8f9b751b447b8803-20200813
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1844085126; Thu, 13 Aug 2020 04:49:00 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 05:48:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 20:48:55 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 20:48:57 +0800
Message-ID: <1597322937.9999.42.camel@mtksdccf07>
Subject: Re: [PATCH 1/5] timer: kasan: record and print timer stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 13 Aug 2020 20:48:57 +0800
In-Reply-To: <87d03ulqbp.fsf@nanos.tec.linutronix.de>
References: <20200810072313.529-1-walter-zh.wu@mediatek.com>
 <87d03ulqbp.fsf@nanos.tec.linutronix.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_084905_463179_9E5C9661 
X-CRM114-Status: GOOD (  40.61  )
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
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Thomas,

Please ignore my previous mail. Thanks.


On Thu, 2020-08-13 at 13:48 +0200, Thomas Gleixner wrote:
> Walter,
> 
> Walter Wu <walter-zh.wu@mediatek.com> writes:
> > This patch records the last two timer queueing stacks and prints
> 
> "This patch" is useless information as we already know from the subject
> line that this is a patch.
> 
> git grep 'This patch' Documentation/process/
> 

Thanks for your information.

> > up to 2 timer stacks in KASAN report. It is useful for programmers
> > to solve use-after-free or double-free memory timer issues.
> >
> > When timer_setup() or timer_setup_on_stack() is called, then it
> > prepares to use this timer and sets timer callback, we store
> > this call stack in order to print it in KASAN report.
> 
> we store nothing. Don't impersonate code please.
> 
> Also please structure the changelog in a way that it's easy to
> understand what this is about instead of telling first what the patch
> does and then some half baken information why this is useful followed by
> more information about what it does.
> 
> Something like this:
> 
>   For analysing use after free or double free of objects it is helpful
>   to preserve usage history which potentially gives a hint about the
>   affected code.
> 
>   For timers it has turned out to be useful to record the stack trace
>   of the timer init call. <ADD technical explanation why this is useful>
>  
>   Record the most recent two timer init calls in KASAN which are printed
>   on failure in the KASAN report.
> 
> See, this gives a clear context, an explanation why it is useful and a
> high level description of what it does. The details are in the patch
> ifself and do not have to be epxlained in the changelog.
> 

Thanks for your explanation, Our patch will use this as a template from
now on.

> For the technical explanation which you need to add, you really need to
> tell what's the advantage or additional coverage vs. existing debug
> facilities like debugobjects. Just claiming that it's useful does not
> make an argument.
> 

We originally wanted him to have similar functions. Maybe he can't
completely replace, but KASAN can ave this ability.

> The UAF problem with timers is nasty because if you free an active timer
> then either the softirq which expires the timer will corrupt potentially
> reused memory or the reuse will corrupt the linked list which makes the
> softirq or some unrelated code which adds/removes a different timer
> explode in undebuggable ways. debugobject prevents that because it
> tracks per timer state and invokes the fixup function which keeps the
> system alive and also tells you exactly where the free of the active
> object happens which is the really interesting place to look at. The
> init function is pretty uninteresting in that case because you really
> want to know where the freeing of the active object happens.
> 
> So if KASAN detects UAF in the timer softirq then the init trace is not
> giving any information especially not in cases where the timer is part
> of a common and frequently allocated/freed other data structure.
> 

I don't have experience using this tool, but I will survey it.

> >  static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
> >  static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
> >  static inline void kasan_record_aux_stack(void *ptr) {}
> > +static inline void kasan_record_tmr_stack(void *ptr) {}
> 
> Duh, so you are adding per object type functions and storage? That's
> going to be a huge copy and pasta orgy as every object requires the same
> code and extra storage space.
> 
> Why not just using kasan_record_aux_stack() for all of this?
> 
> The 'call_rcu' 'timer' 'whatever next' printout is not really required
> because the stack trace already tells you the function which was
> invoked. If TOS is call_rcu() or do_timer_init() then it's entirely
> clear which object is affected. If the two aux records are not enough
> then making the array larger is not the end of the world.
> 

My previous mail say that we will re-use kasan_record_aux_stack() and
only have aux_stack.

> >  #endif /* CONFIG_KASAN_GENERIC */
> >  
> > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > index a5221abb4594..ef2da9ddfac7 100644
> > --- a/kernel/time/timer.c
> > +++ b/kernel/time/timer.c
> > @@ -783,6 +783,8 @@ static void do_init_timer(struct timer_list *timer,
> >  	timer->function = func;
> >  	timer->flags = flags | raw_smp_processor_id();
> >  	lockdep_init_map(&timer->lockdep_map, name, key, 0);
> > +
> > +	kasan_record_tmr_stack(timer);
> >  }
> 
> Are you sure this is correct for all timers?
> 
> This is also called for timers which are temporarily allocated on stack
> and for timers which are statically allocated at compile time. How is
> that supposed to work?
> 

If I understand correctly, KASAN report have this record only for slub
variable. So what you said shouldn't be a problem.

> These kind of things want to be explained upfront an not left to the
> reviewer as an exercise.
> 

Sorry, My fault. Later we will be more cautious to send patch.

> Thanks,
> 
>         tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
