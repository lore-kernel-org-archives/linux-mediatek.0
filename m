Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5E4C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 12:07:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15D42469D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 12:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qRarJBL8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ozrd4D4e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15D42469D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eOoR+dcgqM+/1ujMBpjlGlaPeU5Xc91aFUp3NuUmZ9o=; b=qRarJBL82E1vVYly+T586l5gY
	sqeq+iLXi3gbLWeG633+cmPoKrfGCWKYT1I5zuIWI6uV/RfxLrbsNlbgMUKrcPejLJKfl0Mz4Gd4Z
	vK7qV0V/2Qm5WXlDH1NaeBooc2+tUpwnuyQ8o6N5uBA2Kng7Jsi3FuOyIaYlHNl66wuuMQfUG4BmA
	cpUGDEYjv+1q/bVC9gOoUH5r7SKqvGWRsZ0ez9arGZAWKdyb3Ym4LoEyi10WEww0D4Cvb1032Q6mE
	a/JegGqT1hGxDc5P2aiEPoC2vRQYktM1CVYefQJSNNyp84WJoUbnBIzqRvxW9+JaLf3OP72ZhIF0Y
	LPG3TRzLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfiip-0002qF-Dg; Thu, 19 Nov 2020 12:07:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfiib-0002mM-5K; Thu, 19 Nov 2020 12:07:19 +0000
X-UUID: 03680f27f9ab4d92a1b859f82e93420c-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BxaKCvbGMroRDKzMiJNq1cYSi2kIAUSuDsxHbXnM8mQ=; 
 b=Ozrd4D4eZOMAsBxl7a79PK7pJ0mw2IpxoauhFm8kWH/ffpwJJ4CmQ+f3RNP+1C1L7zg1152mOf8jzf6oRzWY8CEZH7VSlUbvZrzMfMIHrUuOUsFnaXunv+6pNZYCvUqFHbJL8Np/NWrTham7LZSInz0PuL0UYYHVUtKxQeWIXiU=;
X-UUID: 03680f27f9ab4d92a1b859f82e93420c-20201119
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 982312717; Thu, 19 Nov 2020 04:07:09 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 04:07:08 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 20:06:53 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 20:06:53 +0800
Message-ID: <1605787613.29084.32.camel@mtksdccf07>
Subject: Re: [PATCH v2 1/1] kasan: fix object remain in offline per-cpu
 quarantine
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 19 Nov 2020 20:06:53 +0800
In-Reply-To: <CACT4Y+ZpK5YKLrN_jvaD60YFKQ-kVHc=91NTBzhX5PZRTHVd7g@mail.gmail.com>
References: <1605508168-7418-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <1605508168-7418-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <CACT4Y+Zy_JQ3y7_P2NXffiijTuxcnh7VPcAGL66Ks2LaLTj-eg@mail.gmail.com>
 <1605595583.29084.24.camel@mtksdccf07>
 <CACT4Y+ZpK5YKLrN_jvaD60YFKQ-kVHc=91NTBzhX5PZRTHVd7g@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D7C440176C6B4D09255888CCD89F8353F4DFF4A81CDD6B698FE89F10231667002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_070717_530533_76BEE727 
X-CRM114-Status: GOOD (  35.85  )
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
Cc: Miles
 Chen <miles.chen@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 nicholas.tang@mediatek.com, Alexander Potapenko <glider@google.com>,
 guangye.yang@mediatek.com, Matthias
 Brugger <matthias.bgg@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-17 at 08:13 +0100, Dmitry Vyukov wrote:
> On Tue, Nov 17, 2020 at 7:46 AM Kuan-Ying Lee
> <Kuan-Ying.Lee@mediatek.com> wrote:
> >
> > On Mon, 2020-11-16 at 10:26 +0100, Dmitry Vyukov wrote:
> > > On Mon, Nov 16, 2020 at 7:30 AM Kuan-Ying Lee
> > > <Kuan-Ying.Lee@mediatek.com> wrote:
> > > >
> > > > We hit this issue in our internal test.
> > > > When enabling generic kasan, a kfree()'d object is put into per-cpu
> > > > quarantine first. If the cpu goes offline, object still remains in
> > > > the per-cpu quarantine. If we call kmem_cache_destroy() now, slub
> > > > will report "Objects remaining" error.
> > > >
> > > > [   74.982625] =============================================================================
> > > > [   74.983380] BUG test_module_slab (Not tainted): Objects remaining in test_module_slab on __kmem_cache_shutdown()
> > > > [   74.984145] -----------------------------------------------------------------------------
> > > > [   74.984145]
> > > > [   74.984883] Disabling lock debugging due to kernel taint
> > > > [   74.985561] INFO: Slab 0x(____ptrval____) objects=34 used=1 fp=0x(____ptrval____) flags=0x2ffff00000010200
> > > > [   74.986638] CPU: 3 PID: 176 Comm: cat Tainted: G    B             5.10.0-rc1-00007-g4525c8781ec0-dirty #10
> > > > [   74.987262] Hardware name: linux,dummy-virt (DT)
> > > > [   74.987606] Call trace:
> > > > [   74.987924]  dump_backtrace+0x0/0x2b0
> > > > [   74.988296]  show_stack+0x18/0x68
> > > > [   74.988698]  dump_stack+0xfc/0x168
> > > > [   74.989030]  slab_err+0xac/0xd4
> > > > [   74.989346]  __kmem_cache_shutdown+0x1e4/0x3c8
> > > > [   74.989779]  kmem_cache_destroy+0x68/0x130
> > > > [   74.990176]  test_version_show+0x84/0xf0
> > > > [   74.990679]  module_attr_show+0x40/0x60
> > > > [   74.991218]  sysfs_kf_seq_show+0x128/0x1c0
> > > > [   74.991656]  kernfs_seq_show+0xa0/0xb8
> > > > [   74.992059]  seq_read+0x1f0/0x7e8
> > > > [   74.992415]  kernfs_fop_read+0x70/0x338
> > > > [   74.993051]  vfs_read+0xe4/0x250
> > > > [   74.993498]  ksys_read+0xc8/0x180
> > > > [   74.993825]  __arm64_sys_read+0x44/0x58
> > > > [   74.994203]  el0_svc_common.constprop.0+0xac/0x228
> > > > [   74.994708]  do_el0_svc+0x38/0xa0
> > > > [   74.995088]  el0_sync_handler+0x170/0x178
> > > > [   74.995497]  el0_sync+0x174/0x180
> > > > [   74.996050] INFO: Object 0x(____ptrval____) @offset=15848
> > > > [   74.996752] INFO: Allocated in test_version_show+0x98/0xf0 age=8188 cpu=6 pid=172
> > > > [   75.000802]  stack_trace_save+0x9c/0xd0
> > > > [   75.002420]  set_track+0x64/0xf0
> > > > [   75.002770]  alloc_debug_processing+0x104/0x1a0
> > > > [   75.003171]  ___slab_alloc+0x628/0x648
> > > > [   75.004213]  __slab_alloc.isra.0+0x2c/0x58
> > > > [   75.004757]  kmem_cache_alloc+0x560/0x588
> > > > [   75.005376]  test_version_show+0x98/0xf0
> > > > [   75.005756]  module_attr_show+0x40/0x60
> > > > [   75.007035]  sysfs_kf_seq_show+0x128/0x1c0
> > > > [   75.007433]  kernfs_seq_show+0xa0/0xb8
> > > > [   75.007800]  seq_read+0x1f0/0x7e8
> > > > [   75.008128]  kernfs_fop_read+0x70/0x338
> > > > [   75.008507]  vfs_read+0xe4/0x250
> > > > [   75.008990]  ksys_read+0xc8/0x180
> > > > [   75.009462]  __arm64_sys_read+0x44/0x58
> > > > [   75.010085]  el0_svc_common.constprop.0+0xac/0x228
> > > > [   75.011006] kmem_cache_destroy test_module_slab: Slab cache still has objects
> > > >
> > > > Register a cpu hotplug function to remove all objects in the offline
> > > > per-cpu quarantine when cpu is going offline. Set a per-cpu variable
> > > > to indicate this cpu is offline.
> > > >
> > > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > > Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> > > > Reported-by: Guangye Yang <guangye.yang@mediatek.com>
> > > > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > > > Cc: Alexander Potapenko <glider@google.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > ---
> > > >  mm/kasan/quarantine.c | 35 +++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 35 insertions(+)
> > > >
> > > > diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> > > > index 4c5375810449..16e618ea805e 100644
> > > > --- a/mm/kasan/quarantine.c
> > > > +++ b/mm/kasan/quarantine.c
> > > > @@ -29,6 +29,7 @@
> > > >  #include <linux/srcu.h>
> > > >  #include <linux/string.h>
> > > >  #include <linux/types.h>
> > > > +#include <linux/cpuhotplug.h>
> > > >
> > > >  #include "../slab.h"
> > > >  #include "kasan.h"
> > > > @@ -43,6 +44,7 @@ struct qlist_head {
> > > >         struct qlist_node *head;
> > > >         struct qlist_node *tail;
> > > >         size_t bytes;
> > > > +       bool offline;
> > > >  };
> > > >
> > > >  #define QLIST_INIT { NULL, NULL, 0 }
> > > > @@ -188,6 +190,11 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
> > > >         local_irq_save(flags);
> > > >
> > > >         q = this_cpu_ptr(&cpu_quarantine);
> > > > +       if (q->offline) {
> > > > +               qlink_free(&info->quarantine_link, cache);
> > > > +               local_irq_restore(flags);
> > > > +               return;
> > > > +       }
> >
> > I think we need to make sure objects will not be put in per-cpu
> > quarantine which is offline.
> >
> > > >         qlist_put(q, &info->quarantine_link, cache->size);
> > > >         if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
> > > >                 qlist_move_all(q, &temp);
> > > > @@ -328,3 +335,31 @@ void quarantine_remove_cache(struct kmem_cache *cache)
> > > >
> > > >         synchronize_srcu(&remove_cache_srcu);
> > > >  }
> > > > +
> > > > +static int kasan_cpu_online(unsigned int cpu)
> > > > +{
> > > > +       this_cpu_ptr(&cpu_quarantine)->offline = false;
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int kasan_cpu_offline(unsigned int cpu)
> > > > +{
> > > > +       struct qlist_head *q;
> > > > +
> > > > +       q = this_cpu_ptr(&cpu_quarantine);
> > > > +       q->offline = true;
> > > > +       qlist_free_all(q, NULL);
> > >
> > > Looks much nicer now!
> > >
> > > What is the story with interrupts in these callbacks?
> > > In the previous patch you mentioned that this CPU can still receive
> > > interrupts for a brief period of time. If these interrupts also free
> > > something, can't we corrupt the per-cpu quarantine? In quarantine_put
> > > we protect it by disabling interrupts I think.
> > >
> >
> > Here is a situation.
> > After we freed all objects from the per-cpu quarantine which is going
> > offline, the interrupts happened. These interrupts free something and
> > put objects into this per-cpu quarantine. If we call
> > kmem_cache_destroy() now, slub still detect objects remain in
> > the per-cpu quarantine and report "Object remaining" error.
> >
> > Thus, we need to check q->offline in quarantine_put and make sure
> > the offline per-cpu quarantine is not corrupted.
> 
> If an interrupt can happen later, can't it happen right during our
> call to qlist_free_all and corrupt the per-cpu cache?
> Perhaps we need something like:
> 
> // ... explain the subtleness ...
> WRITE_ONCE(q->offline, true);
> barrier();
> qlist_free_all(q, NULL);
> 
> ?

Yes, we need to add barrier to ensure the ordering.
I did not think about that before.
Thanks for the reminder.
I will fix in v3.

> 
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int __init kasan_cpu_offline_quarantine_init(void)
> > > > +{
> > > > +       int ret = 0;
> > > > +
> > > > +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mm/kasan:online",
> > > > +                               kasan_cpu_online, kasan_cpu_offline);
> > > > +       if (ret < 0)
> > > > +               pr_err("kasan offline cpu quarantine register failed [%d]\n", ret);
> > > > +       return ret;
> > > > +}
> > > > +late_initcall(kasan_cpu_offline_quarantine_init);
> > > > --
> > > > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
