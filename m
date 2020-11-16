Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28002C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 01:54:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F0C022265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 01:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KfWDzd7K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QQ60WSJl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F0C022265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cmzJMw/JGSe68CyrWMrDKn7GFLG4tsjAMllou/zQPgo=; b=KfWDzd7KW7BTwefiecSSzhdwi
	gVZICgdYiPRA5r2gHcdnJtPYVEdbRhUuW6c3cawouqiXX8kQSR3Fxlixf73Gp89mVwdhTNq04kfEZ
	ekgRFTjiT57/k4dlliDttnNPa0pUgvS/nwnDtQcKGDNlH6OSRQuWieABqOb+gacB2AZrLysQTAn+j
	qLGeYM5mHRm5OZ1wstNCFY5yw0s2mZZpzzuMkQYyvjulMdOUEEONuHmfaxlB9MTfItZpbOgGGywul
	RLCwZPHoz4PUpaS87MVuGrOxSFGdV6FqGxdKZDalEkBXD9dWvRToNViGalc4v8FpXyiEezMjRrAXy
	v80vXK+Tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keTjE-00055H-0x; Mon, 16 Nov 2020 01:54:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keTj7-00054X-E8; Mon, 16 Nov 2020 01:54:43 +0000
X-UUID: 1032328b69824a40a678871d22e0246d-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5zef3sILoFC/Qxr+vbXApTKUmQnZIlDEA1uxAbrnje4=; 
 b=QQ60WSJleBUO5+Zwgdr5G0yafsm4WbYZNCpVZtuHx7lvIZorFm+nrfuBQumMTMzNGeEG7QV14+8BdVrYootmxZ+0e+ASzIKwPybgsiDBpx2R90ONt9CKvx52ra53G2hWKPXS+NGz8kEvzga4EcWk1EP2Ul1KsHiU2VoVIT/KDF8=;
X-UUID: 1032328b69824a40a678871d22e0246d-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 283459825; Sun, 15 Nov 2020 17:54:32 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 17:44:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 09:44:23 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Nov 2020 09:44:22 +0800
Message-ID: <1605491062.29084.2.camel@mtksdccf07>
Subject: Re: [PATCH 1/1] kasan: fix object remain in offline per-cpu quarantine
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 16 Nov 2020 09:44:22 +0800
In-Reply-To: <CACT4Y+b7F_A1E_FMKQMK4cg2SwpniLjq9Nr988J6BVSF5rkDGg@mail.gmail.com>
References: <1605162252-23886-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <1605162252-23886-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <CACT4Y+bpDTqQRRdV0_O07H=Kczj3nXUY9ngQgX5K=BtT=Y60RQ@mail.gmail.com>
 <1605234714.30076.18.camel@mtksdccf07>
 <CACT4Y+b7F_A1E_FMKQMK4cg2SwpniLjq9Nr988J6BVSF5rkDGg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D66A5C08AA565297E4DD3C222B41601357186A840CDB0C0DE06C3F51EF81814B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_205442_310154_137C3CB3 
X-CRM114-Status: GOOD (  46.30  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, nicholas.tang@mediatek.com,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Miles Chen <miles.chen@mediatek.com>, Alexander Potapenko <glider@google.com>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-13 at 08:03 +0100, Dmitry Vyukov wrote:
> On Fri, Nov 13, 2020 at 3:32 AM Kuan-Ying Lee
> <Kuan-Ying.Lee@mediatek.com> wrote:
> >
> > On Thu, 2020-11-12 at 09:39 +0100, Dmitry Vyukov wrote:
> > > On Thu, Nov 12, 2020 at 7:25 AM Kuan-Ying Lee
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
> > > > ---
> > > >  mm/kasan/quarantine.c | 59 +++++++++++++++++++++++++++++++++++++++++--
> > > >  1 file changed, 57 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> > > > index 4c5375810449..67fb91ae2bd0 100644
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
> > > > @@ -97,6 +98,7 @@ static void qlist_move_all(struct qlist_head *from, struct qlist_head *to)
> > > >   * guarded by quarantine_lock.
> > > >   */
> > >
> > > Hi Kuan-Ying,
> > >
> > > Thanks for fixing this.
> > >
> > > >  static DEFINE_PER_CPU(struct qlist_head, cpu_quarantine);
> > > > +static DEFINE_PER_CPU(int, cpu_quarantine_offline);
> > >
> > > I think cpu_quarantine_offline is better be part of cpu_quarantine
> > > because it logically is and we already obtain a pointer to
> > > cpu_quarantine in quarantine_put, so it will also make the code a bit
> > > shorter.
> > >
> >
> > Ok. Got it.
> >
> > >
> > > >  /* Round-robin FIFO array of batches. */
> > > >  static struct qlist_head global_quarantine[QUARANTINE_BATCHES];
> > > > @@ -176,6 +178,8 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
> > > >         unsigned long flags;
> > > >         struct qlist_head *q;
> > > >         struct qlist_head temp = QLIST_INIT;
> > > > +       int *offline;
> > > > +       struct qlist_head q_offline = QLIST_INIT;
> > > >
> > > >         /*
> > > >          * Note: irq must be disabled until after we move the batch to the
> > > > @@ -187,8 +191,16 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
> > > >          */
> > > >         local_irq_save(flags);
> > > >
> > > > -       q = this_cpu_ptr(&cpu_quarantine);
> > > > -       qlist_put(q, &info->quarantine_link, cache->size);
> > > > +       offline = this_cpu_ptr(&cpu_quarantine_offline);
> > > > +       if (*offline == 0) {
> > > > +               q = this_cpu_ptr(&cpu_quarantine);
> > > > +               qlist_put(q, &info->quarantine_link, cache->size);
> > > > +       } else {
> > > > +               qlist_put(&q_offline, &info->quarantine_link, cache->size);
> > > > +               qlist_free_all(&q_offline, cache);
> > >
> > > This looks like a convoluted way to call qlink_free. I think it will
> > > be better to call qlink_free directly here.
> > >
> > > And why do we need this? Because CPU shutdown code can still free some
> > > objects afterwards?
> > >
> >
> > Yes, it is because IRQ can happen during CPU shutdown and free some
> > objects into offline CPU quarantine.
> >
> > > > +               local_irq_restore(flags);
> > > > +               return;
> > >
> > > You add both if/else and early return, this looks like unnecessary
> > > code complication. It would be simpler with:
> > >
> > > if (*offline) {
> > >     qlink_free(...);
> > >     return;
> > > }
> > > ... all current per-cpu local ...
> > >
> > >
> >
> > Thank you for reminder. v2 Will do it.
> >
> > > > +       }
> > > >         if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
> > > >                 qlist_move_all(q, &temp);
> > > >
> > > > @@ -328,3 +340,46 @@ void quarantine_remove_cache(struct kmem_cache *cache)
> > > >
> > > >         synchronize_srcu(&remove_cache_srcu);
> > > >  }
> > > > +
> > > > +static int kasan_cpu_online(unsigned int cpu)
> > > > +{
> > > > +       int *offline;
> > > > +       unsigned long flags;
> > > > +
> > > > +       local_irq_save(flags);
> > >
> > > I assume this local_irq_save/restore is to prevent some warnings from
> > > this_cpu_ptr.
> > > But CPU online/offline callbacks should run without preemption already
> > > (preempting/rescheduling on other CPUs does not make sense for them,
> > > right?), so I would assume that is already at least preemption
> > > disabled or something. Is there this_cpu_ptr variant that won't
> > > produce warnings on its own in cpu online/offline callbacks?
> > > This whole function could be a 1-liner:
> > > this_cpu_ptr(&cpu_quarantine)->offline = true;
> > > So I am trying to understand if we could avoid all this unnecessary danse.
> > >
> >
> > Yes, it's unnecessary. v2 will fix it.
> >
> > >
> > > > +       offline = this_cpu_ptr(&cpu_quarantine_offline);
> > > > +       *offline = 0;
> > > > +       local_irq_restore(flags);
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int kasan_cpu_offline(unsigned int cpu)
> > > > +{
> > > > +       struct kmem_cache *s;
> > > > +       int *offline;
> > > > +       unsigned long flags;
> > > > +
> > > > +       local_irq_save(flags);
> > > > +       offline = this_cpu_ptr(&cpu_quarantine_offline);
> > > > +       *offline = 1;
> > > > +       local_irq_restore(flags);
> > > > +
> > > > +       mutex_lock(&slab_mutex);
> > > > +       list_for_each_entry(s, &slab_caches, list) {
> > > > +               per_cpu_remove_cache(s);
> > > > +       }
> > > > +       mutex_unlock(&slab_mutex);
> > >
> > > We just want to drop the whole per-cpu cache at once, right? I would
> > > assume there should be a simpler way to do this all at once, rather
> > > than doing this per-slab.
> > >
> >
> > Yes.
> > Is removing objects in per-cpu quarantine directly better?
> 
> Yes, single qlist_free_all call looks much better than iteration over
> all slabs and removing in parts under the mutex.
> 

Hi Dmitry,

Got it.
Thanks for your review and reminder.
I will fix them in v2.

Kuan-Ying


> > struct qlist_head *q;
> > q = this_cpu_ptr(&cpu_quaratine);
> > q->offline = true;
> > qlist_free_all(q, NULL);
> >
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int __init kasan_cpu_offline_quarantine_init(void)
> > > > +{
> > > > +       int ret = 0;
> > > > +
> > > > +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mm/kasan:online",
> > > > +                               kasan_cpu_online, kasan_cpu_offline);
> > > > +       if (ret)
> > > > +               pr_err("kasan offline cpu quarantine register failed [%d]\n", ret);
> > > > +       return ret;
> > > > +}
> > > > +late_initcall(kasan_cpu_offline_quarantine_init);
> > > > --
> > > > 2.18.0
> > > >
> > > > --
> > > > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > > > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > > > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1605162252-23886-2-git-send-email-Kuan-Ying.Lee%40mediatek.com.
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1605234714.30076.18.camel%40mtksdccf07.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
