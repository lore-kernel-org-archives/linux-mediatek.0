Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86108C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 10:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4844D613A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 10:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4844D613A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biU5ABFdZFYfNwPU9an/rV5x0vKv29+k9AqSqGwlvCk=; b=JHK9iExhoVq3bo
	CxWW1/Ymj7AQoNrDI1FWIA595eOv4/0USUaqMxmS34cSkf2w9Ybo2UnWGhcyn19Sy/ZSkyedD3SC2
	in6oZ+3o6CKSJ5l4xETeTeLZoA5OkpM4gnvS8tO82QrNaPUUeLVyrM16sYn5c0mtIVy9RPOT7tACs
	Z70ayudQaBd+QS6WJOZq2orCF73eNe+TFbS+SjbU43gG8dObwhD/XhWztPIpbs6um7BkjwvfW763C
	/BGWcKncedsZVhqvL5IgZ2wBqgsjWfcE49LyeJeHDHDaQs/aF3NVfBNNL2OV67DbgEz4FWnYimIxN
	8f5ImLbwELlNPqOgcXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVWp9-00AiAH-Ik; Wed, 29 Sep 2021 10:28:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVWow-00Ai8z-Rd; Wed, 29 Sep 2021 10:28:16 +0000
X-UUID: 9941198addf749679db37bc8501fa61a-20210929
X-UUID: 9941198addf749679db37bc8501fa61a-20210929
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1993791822; Wed, 29 Sep 2021 03:28:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 03:28:04 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 18:28:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 18:28:03 +0800
Message-ID: <1c8464602db6ded259859e7d5866381017d953f3.camel@mediatek.com>
Subject: Re: [PATCH] scs: Release kasan vmalloc poison in scs_free process
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Sami Tolvanen <samitolvanen@google.com>
CC: <yee.lee@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 <nicholas.Tang@mediatek.com>, <chinwen.chang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <kuan-ying.lee@mediatek.com>
Date: Wed, 29 Sep 2021 18:28:03 +0800
In-Reply-To: <CABCJKucWe-C7i1+k42uV4TgeD8Q7NBoMrXxdyV85oPE9Tibdrg@mail.gmail.com>
References: <20210923095316.13867-1-yee.lee@mediatek.com>
 <5f7a9ed1dabba25596c38a8e7c32ee5750b80459.camel@mediatek.com>
 <CABCJKucWe-C7i1+k42uV4TgeD8Q7NBoMrXxdyV85oPE9Tibdrg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_032814_940058_CB184054 
X-CRM114-Status: GOOD (  28.99  )
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

On Fri, 2021-09-24 at 07:35 -0700, Sami Tolvanen wrote:
> On Thu, Sep 23, 2021 at 4:19 AM Kuan-Ying Lee
> <Kuan-Ying.Lee@mediatek.com> wrote:
> > 
> > On Thu, 2021-09-23 at 17:53 +0800, yee.lee@mediatek.com wrote:
> > > From: Yee Lee <yee.lee@mediatek.com>
> > > 
> > > Since scs allocation has been moved to vmalloc region, the
> > > shadow stack is protected by kasan_posion_vmalloc.
> > > However, the vfree_atomic operation needs to access
> > > its context for scs_free process and causes kasan error
> > > as the dump info below.
> > > 
> > > This patch Adds kasan_unpoison_vmalloc() before vfree_atomic,
> > > which aligns to the prior flow as using kmem_cache.
> > > The vmalloc region will go back posioned in the following
> > > vumap() operations.
> > > 
> > >  ================================================================
> > > ==
> > >  BUG: KASAN: vmalloc-out-of-bounds in llist_add_batch+0x60/0xd4
> > >  Write of size 8 at addr ffff8000100b9000 by task kthreadd/2
> > > 
> > >  CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.15.0-rc2-11681-(skip)
> > >  Hardware name: linux,dummy-virt (DT)
> > >  Call trace:
> > >   dump_backtrace+0x0/0x43c
> > >   show_stack+0x1c/0x2c
> > >   dump_stack_lvl+0x68/0x84
> > >   print_address_description+0x80/0x394
> > >   kasan_report+0x180/0x1dc
> > >   __asan_report_store8_noabort+0x48/0x58
> > >   llist_add_batch+0x60/0xd4
> > >   vfree_atomic+0x60/0xe0
> > >   scs_free+0x1dc/0x1fc
> > >   scs_release+0xa4/0xd4
> > >   free_task+0x30/0xe4
> > >   __put_task_struct+0x1ec/0x2e0
> > >   delayed_put_task_struct+0x5c/0xa0
> > >   rcu_do_batch+0x62c/0x8a0
> > >   rcu_core+0x60c/0xc14
> > >   rcu_core_si+0x14/0x24
> > >   __do_softirq+0x19c/0x68c
> > >   irq_exit+0x118/0x2dc
> > >   handle_domain_irq+0xcc/0x134
> > >   gic_handle_irq+0x7c/0x1bc
> > >   call_on_irq_stack+0x40/0x70
> > >   do_interrupt_handler+0x78/0x9c
> > >   el1_interrupt+0x34/0x60
> > >   el1h_64_irq_handler+0x1c/0x2c
> > >   el1h_64_irq+0x78/0x7c
> > >   _raw_spin_unlock_irqrestore+0x40/0xcc
> > >   sched_fork+0x4f0/0xb00
> > >   copy_process+0xacc/0x3648
> > >   kernel_clone+0x168/0x534
> > >   kernel_thread+0x13c/0x1b0
> > >   kthreadd+0x2bc/0x400
> > >   ret_from_fork+0x10/0x20
> > > 
> > >  Memory state around the buggy address:
> > >   ffff8000100b8f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> > > f8
> > >   ffff8000100b8f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> > > f8
> > >  >ffff8000100b9000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> > > f8
> > >                     ^
> > >   ffff8000100b9080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> > > f8
> > >   ffff8000100b9100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> > > f8
> > >  ================================================================
> > > ==
> > > 
> > > CC: Matthias Brugger <matthias.bgg@gmail.com>
> > > CC: Will Deacon <will@kernel.org>
> > > CC: Sami Tolvanen <samitolvanen@google.com>
> > > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > > ---
> > >  kernel/scs.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/kernel/scs.c b/kernel/scs.c
> > > index e2a71fc82fa0..25c0d8e416e6 100644
> > > --- a/kernel/scs.c
> > > +++ b/kernel/scs.c
> > > @@ -68,6 +68,7 @@ void scs_free(void *s)
> > > 
> > >       __scs_account(s, -1);
> > > 
> > > +     kasan_unpoison_vmalloc(s, SCS_SIZE);
> > >       /*
> > >        * We cannot sleep as this can be called in interrupt
> > > context,
> > >        * so use this_cpu_cmpxchg to update the cache, and
> > > vfree_atomic
> > 
> > I'm not sure if we need to add kasan_unpoison_vmalloc() and
> > kasan_poison_vmalloc() in this file.
> > 
> > As far as I know, vmalloc() and vfree() will do these two
> > functions.
> 
> The idea here is to poison the shadow stack after it's set up to
> catch
> unintentional accesses. Outside of compiler instrumentation, nothing
> should read or write from this buffer while the task is running.

Got it.
Thanks.

Reviewed-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

> 
> Sami


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
