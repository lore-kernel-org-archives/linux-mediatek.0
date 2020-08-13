Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA77C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 12:26:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839732078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 12:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sAjOxNux";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GmWMcG+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 839732078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ngqCMVGLf7oeuJc98mXg0PCVcSPLlamHnAIrEyMInAk=; b=sAjOxNux/rEoYIDgnY3HLPAc2
	iGcdK/4L6Hj7mEvJrqQ8Z42TivmwS/2QzZqnBSg/dx7+EyYn501w632rh+o+r42bf2YHQh9Ufh/Ov
	qMBuE7xTBZ42vYfO2soeiuabEy6rhsvwJ4Iw2FF9R49P/dHrJLNRUKmXX/h23ORSC9yJMvYhfW+eC
	ZRrkZCdMzxcufXT9WVKydeS6JZLs6QUWKCDqfWRCSlNLWaNCWrwPSYtzLCy58WVVA8gzYPJ56lQPo
	mB1BYDfZNWSDFbfb5Ma7UqhPyXtxuVpTAmjiIqhiMZ84ZqymkXsasz+VCo84BNuv6jX14uWJF1u4o
	ReukBB9dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6CJE-00013z-Ag; Thu, 13 Aug 2020 12:26:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6CJ9-00012u-4f; Thu, 13 Aug 2020 12:26:12 +0000
X-UUID: 4056165f5dd74230a73c1333f3521aa4-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e41c5oYHqFyVyE7RzGdj+2oNjx9zrZ3d7b52Xcy+lRI=; 
 b=GmWMcG+BIBGO22uTdBbkrn4zxhcIScGQV8kNkFh3aoyvpEBcuhLidVJYbbOhI7ChlNj7U0MR6x8qdXG3THfdCkFhm7VpvhPJEMlezo1v5OQOoERcGV2c9B+IZGSLTcjzEh7wEH6hX8AF+hKfpd2LTpG5oADKtYgSGq3d9Cca9V0=;
X-UUID: 4056165f5dd74230a73c1333f3521aa4-20200813
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1124127630; Thu, 13 Aug 2020 04:26:06 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 05:26:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 20:25:54 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 20:25:54 +0800
Message-ID: <1597321556.9999.27.camel@mtksdccf07>
Subject: Re: [PATCH 1/5] timer: kasan: record and print timer stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 13 Aug 2020 20:25:56 +0800
In-Reply-To: <87d03ulqbp.fsf@nanos.tec.linutronix.de>
References: <20200810072313.529-1-walter-zh.wu@mediatek.com>
 <87d03ulqbp.fsf@nanos.tec.linutronix.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6EB2F04DEDD30544E1EE481F458926A2139F49991264C64715B53AF6C629549C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_082611_310021_831DFDFF 
X-CRM114-Status: GOOD (  37.90  )
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

> For the technical explanation which you need to add, you really need to
> tell what's the advantage or additional coverage vs. existing debug
> facilities like debugobjects. Just claiming that it's useful does not
> make an argument.
> 



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

It is what we want to achieve, maybe we have shortcomings, but my patch

> So if KASAN detects UAF in the timer softirq then the init trace is not
> giving any information especially not in cases where the timer is part
> of a common and frequently allocated/freed other data structure.
> 
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
> These kind of things want to be explained upfront an not left to the
> reviewer as an exercise.
> 
> Thanks,
> 
>         tglx

I have already 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
