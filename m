Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_RED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936FDC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 10:14:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2527B60249
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 10:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2527B60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ayixtTVrDP8lcqCPjjzGTEJRcU+Gpn3+RoGG6qMktU=; b=Vk+zNqHjQ8kkYUKeUvculpWKx
	N24it6/FtoYEK3K29XzCGefCZUhz6QkBiz0S5++PrSAdKGBRO6sLoG6C0YeFgWQ3e27+cjQgKVFHB
	Blq27De3dUeWd3BSjIBZNceApu2sVSZUR9nhgE/He+SFDhtCzc/BsdwDdDD3+tNHLiV64vCoDcR4Z
	hOwNqYlaxr1llOX9agpnksQvtKeG/IttkeXuO5LXAxSdVBqmHb+oRuiPElAgXk6OU6/MYztk7EX4d
	0Wuhakd6kpmPlJ5nqdAQg6UIyJyTG2rE1dro+wLx/p7AJKjunnGIgv8/Zb7f6rAYcWktib5qGJGfN
	kwc8HpIBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLkEY-00FV1V-EP; Mon, 15 Mar 2021 10:13:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLkEJ-00FUzY-Fv; Mon, 15 Mar 2021 10:13:47 +0000
X-UUID: d638fb3b130f4ceca50e099e36daf7c0-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=618js/PS6ZPaWu29u7iJ5zsMGtOyFM88Lrk/7gggYzg=; 
 b=XS+ASPMS0f6iOMJGyN7nMWN6hZmcUpXi79/qun+Qd+2wvcihW/HLlAf0emKj0yjzPZtmXqMul1FL+52TLsFGeCPHoWgjkh742C3ajzbHP+1knXOO8PvgdCBB8fKFOJ/4FMjIa2FkAeLy6u770WDIak1ZXE9+xoOs+UeilMZpp2E=;
X-UUID: d638fb3b130f4ceca50e099e36daf7c0-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 367052946; Mon, 15 Mar 2021 02:13:36 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 03:13:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 18:13:09 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Mar 2021 18:13:09 +0800
Message-ID: <1615803189.26681.2.camel@mtksdccf07>
Subject: Re: [PATCH] task_work: kasan: record task_work_add() call stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Andrey
 Konovalov" <andreyknvl@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov
 <oleg@redhat.com>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM
 <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Mon, 15 Mar 2021 18:13:09 +0800
In-Reply-To: <CACT4Y+YtenynUES2Kb6jSjfw_wT4NMeyX+uG5KdCe3SHhq1qsw@mail.gmail.com>
References: <20210315015940.11788-1-walter-zh.wu@mediatek.com>
 <CACT4Y+YrFeRQkw+M8rpOF5169LFn9+puL3Dh1Kk1AOoKV-nyrQ@mail.gmail.com>
 <1615801102.24887.4.camel@mtksdccf07>
 <CACT4Y+YtenynUES2Kb6jSjfw_wT4NMeyX+uG5KdCe3SHhq1qsw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 485F11046E134C02B7185E4AE2E19A4AA60643209A878351DC8250614617A2D42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_101344_105291_5DB7D690 
X-CRM114-Status: GOOD (  42.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-03-15 at 11:03 +0100, 'Dmitry Vyukov' via kasan-dev wrote:
> On Mon, Mar 15, 2021 at 10:38 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > On Mon, 2021-03-15 at 07:58 +0100, 'Dmitry Vyukov' via kasan-dev wrote:
> > > On Mon, Mar 15, 2021 at 3:00 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > > >
> > > > Why record task_work_add() call stack?
> > > > Syzbot reports many use-after-free issues for task_work, see [1].
> > > > After see the free stack and the current auxiliary stack, we think
> > > > they are useless, we don't know where register the work, this work
> > > > may be the free call stack, so that we miss the root cause and
> > > > don't solve the use-after-free.
> > > >
> > > > Add task_work_add() call stack into KASAN auxiliary stack in
> > > > order to improve KASAN report. It is useful for programmers
> > > > to solve use-after-free issues.
> > > >
> > > > [1]: https://groups.google.com/g/syzkaller-bugs/search?q=kasan%20use-after-free%20task_work_run
> > > >
> > > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > > Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> > > > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > > > Cc: Dmitry Vyukov <dvyukov@google.com>
> > > > Cc: Andrey Konovalov <andreyknvl@google.com>
> > > > Cc: Alexander Potapenko <glider@google.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > Cc: Jens Axboe <axboe@kernel.dk>
> > > > Cc: Oleg Nesterov <oleg@redhat.com>
> > > > ---
> > > >  kernel/task_work.c | 3 +++
> > > >  mm/kasan/kasan.h   | 2 +-
> > > >  2 files changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/kernel/task_work.c b/kernel/task_work.c
> > > > index 9cde961875c0..f255294377da 100644
> > > > --- a/kernel/task_work.c
> > > > +++ b/kernel/task_work.c
> > > > @@ -55,6 +55,9 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
> > > >                 break;
> > > >         }
> > > >
> > > > +       /* record the work call stack in order to print it in KASAN reports */
> > > > +       kasan_record_aux_stack(work);
> > >
> > > I think this call should be done _before_ we actually queue the work,
> > > because this function may operate on non-current task.
> > > Consider, we queue the work, the other task already executes it and
> > > triggers use-after-free, now only now we record the stack.
> >
> > agree, what do you think below change?
> >
> > --- a/kernel/task_work.c
> > +++ b/kernel/task_work.c
> > @@ -34,6 +34,9 @@ int task_work_add(struct task_struct *task, struct
> > callback_head *work,
> >  {
> >     struct callback_head *head;
> >
> > +   /* record the work call stack in order to print it in KASAN reports
> > */
> > +   kasan_record_aux_stack(work);
> > +
> 
> This looks good to me.
> 
> 
> >     do {
> >         head = READ_ONCE(task->task_works);
> >         if (unlikely(head == &work_exited))
> > @@ -55,9 +58,6 @@ int task_work_add(struct task_struct *task, struct
> > callback_head *work,
> >         break;
> >     }
> >
> > -   /* record the work call stack in order to print it in KASAN reports
> > */
> > -   kasan_record_aux_stack(work);
> > -
> >     return 0;
> >  }
> >
> > > Moreover, I think we can trigger use-after-free here ourselves while
> > > recording the aux stack. We queued the work, and the work can cause
> > > own free, so it's not necessary live by now.
> >
> > Sorry, I don't fully know your meaning, do you mean we should add an
> > abort when detect use-after-free?
> 
> I meant that where we had the kasan_record_aux_stack(work) call in the
> first version of the patch, work can be already freed. We must not
> access work after queueing it.
> 

Got it. Now I must treat urgent issue, I will send v2 patch tomorrow.

Thanks for your review.

> > > >         return 0;
> > > >  }
> > > >
> > > > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > > > index 3436c6bf7c0c..d300fe9415bd 100644
> > > > --- a/mm/kasan/kasan.h
> > > > +++ b/mm/kasan/kasan.h
> > > > @@ -146,7 +146,7 @@ struct kasan_alloc_meta {
> > > >         struct kasan_track alloc_track;
> > > >  #ifdef CONFIG_KASAN_GENERIC
> > > >         /*
> > > > -        * call_rcu() call stack is stored into struct kasan_alloc_meta.
> > > > +        * Auxiliary stack is stored into struct kasan_alloc_meta.
> > > >          * The free stack is stored into struct kasan_free_meta.
> > > >          */
> > > >         depot_stack_handle_t aux_stack[2];
> > > > --
> > > > 2.18.0
> > >
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1615801102.24887.4.camel%40mtksdccf07.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
