Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C702C388F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:04:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCFEE20B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WAfEUmAI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vTA7EHji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCFEE20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=skOt4t755K5JMgNbbXP6pqaKCc1EumlV5jhaHux8VnM=; b=WAfEUmAISIyLYIRSm7CpjLRDN
	Eb6Z8YchvLkqv1x5X3W5PJkbxqfs33fRgsDoWiwBRPHqU/UfKy6+ZbwW25DEbst7Ne3LmFpBvEgQR
	drRWq14WfKBS8Yw3LmHxq9tF0BbwIwbBr6EV75Stz1fPllJn1tQEUv/4piQr4div8/UFNAT7cuej4
	aOg8BFMSSNTVyxEIA86fkmuXw1p64NG7WEUZV2L8Gk5L7bZ1z7QJAJj4GMv4EmPVRzGTpnhjdcWk6
	eaDDJw86xeqzI6qK22cULR+ywxKNX8RkljceQhXl8su2jSGc6m3vr7Qoj/5qJm5geaiE8y12YXA7r
	AgTWVfIdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdT7l-0002WM-G3; Fri, 13 Nov 2020 07:03:57 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdT7d-0002R2-Kk
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 07:03:51 +0000
Received: by mail-qt1-x842.google.com with SMTP id v11so6038448qtq.12
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 23:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PkncTpQIdgHDydrhX/SeaNm5Vy35yKSw0V2poc3sOE=;
 b=vTA7EHjidIHa0QR6bMWC4IbyGdx/RH4kQZGkiBjdySaklqHjkVx3Pb9M6X5ypyZm1l
 TD83hfj3lNv1OiI0tRm3nVOFEt97ecxZFA6WH+lLxKtmI/DRVA71b6JrVVMsemNrWM30
 rmexLos7IeBbt9tcvNXG3hwgp6YKMhsQ5tChI2MNMW476o/wdeYDqOChL6GMoYjwHUjt
 X+iTwV9m1Chlloj3gkDgi89WwhgQc0ttryexkfP1kePJroZXYZI6BFpiPSLZVw8M+PTF
 WIdZ2C7gjrElaWzKll9oDHHxtDcVo7urLHFLgfBaC4Fm8+DYSuhNUhz2aqQC050Pbnjb
 fCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PkncTpQIdgHDydrhX/SeaNm5Vy35yKSw0V2poc3sOE=;
 b=ttvNNHln6MP8OdMwZa+k3C/MyJ7Z7ZBpMwWzN+8JbxZCTZCcY9k/R2tIevt8u2P7q4
 Q/vQS+Brgv0KeZ0pgkS3JMW34snMCWFwtlRKFk0rPAtuaWNOLtTXyByfavypzs4UsrMv
 M4sNoyE6PT+UBsBUqsUGgWK4p5g2AhjnE7dmniH6s872K7AZ1SA6VTTpxNqOds6WOtcU
 cC8Qv5fLKERaNciIiCCzsVmusiUTZKnDxZrjcntwhDDrOSIvqoiAwE9BAPNeWHv50QEt
 +nsfYOjs1est4cmvM0sWwjcl+ow9XHipMdRb2PX5y4uDG2KsSEQK7fqtNxGP4+1XDpWc
 4JMA==
X-Gm-Message-State: AOAM5300i1tXxI57JUblFt1zxPBEYL0ISO4zbIvEA1uRf/G1ztHs6tej
 6+XkY4dGJKmn1siaA2cXgKnyH+S3nRHvf452giBQgA==
X-Google-Smtp-Source: ABdhPJwZpia7Ugc2X36833y+Hf+b2aXwjH+F7F9ce4CNJ6t1/KP62DBdAXq0Ht4wwnYizYDiAlzaVNpvqDch8W1N7I8=
X-Received: by 2002:ac8:1288:: with SMTP id y8mr763877qti.177.1605251024620;
 Thu, 12 Nov 2020 23:03:44 -0800 (PST)
MIME-Version: 1.0
References: <1605162252-23886-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <1605162252-23886-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <CACT4Y+bpDTqQRRdV0_O07H=Kczj3nXUY9ngQgX5K=BtT=Y60RQ@mail.gmail.com>
 <1605234714.30076.18.camel@mtksdccf07>
In-Reply-To: <1605234714.30076.18.camel@mtksdccf07>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 13 Nov 2020 08:03:32 +0100
Message-ID: <CACT4Y+b7F_A1E_FMKQMK4cg2SwpniLjq9Nr988J6BVSF5rkDGg@mail.gmail.com>
Subject: Re: [PATCH 1/1] kasan: fix object remain in offline per-cpu quarantine
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_020349_725807_2A6B8462 
X-CRM114-Status: GOOD (  50.14  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 3:32 AM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> On Thu, 2020-11-12 at 09:39 +0100, Dmitry Vyukov wrote:
> > On Thu, Nov 12, 2020 at 7:25 AM Kuan-Ying Lee
> > <Kuan-Ying.Lee@mediatek.com> wrote:
> > >
> > > We hit this issue in our internal test.
> > > When enabling generic kasan, a kfree()'d object is put into per-cpu
> > > quarantine first. If the cpu goes offline, object still remains in
> > > the per-cpu quarantine. If we call kmem_cache_destroy() now, slub
> > > will report "Objects remaining" error.
> > >
> > > [   74.982625] =============================================================================
> > > [   74.983380] BUG test_module_slab (Not tainted): Objects remaining in test_module_slab on __kmem_cache_shutdown()
> > > [   74.984145] -----------------------------------------------------------------------------
> > > [   74.984145]
> > > [   74.984883] Disabling lock debugging due to kernel taint
> > > [   74.985561] INFO: Slab 0x(____ptrval____) objects=34 used=1 fp=0x(____ptrval____) flags=0x2ffff00000010200
> > > [   74.986638] CPU: 3 PID: 176 Comm: cat Tainted: G    B             5.10.0-rc1-00007-g4525c8781ec0-dirty #10
> > > [   74.987262] Hardware name: linux,dummy-virt (DT)
> > > [   74.987606] Call trace:
> > > [   74.987924]  dump_backtrace+0x0/0x2b0
> > > [   74.988296]  show_stack+0x18/0x68
> > > [   74.988698]  dump_stack+0xfc/0x168
> > > [   74.989030]  slab_err+0xac/0xd4
> > > [   74.989346]  __kmem_cache_shutdown+0x1e4/0x3c8
> > > [   74.989779]  kmem_cache_destroy+0x68/0x130
> > > [   74.990176]  test_version_show+0x84/0xf0
> > > [   74.990679]  module_attr_show+0x40/0x60
> > > [   74.991218]  sysfs_kf_seq_show+0x128/0x1c0
> > > [   74.991656]  kernfs_seq_show+0xa0/0xb8
> > > [   74.992059]  seq_read+0x1f0/0x7e8
> > > [   74.992415]  kernfs_fop_read+0x70/0x338
> > > [   74.993051]  vfs_read+0xe4/0x250
> > > [   74.993498]  ksys_read+0xc8/0x180
> > > [   74.993825]  __arm64_sys_read+0x44/0x58
> > > [   74.994203]  el0_svc_common.constprop.0+0xac/0x228
> > > [   74.994708]  do_el0_svc+0x38/0xa0
> > > [   74.995088]  el0_sync_handler+0x170/0x178
> > > [   74.995497]  el0_sync+0x174/0x180
> > > [   74.996050] INFO: Object 0x(____ptrval____) @offset=15848
> > > [   74.996752] INFO: Allocated in test_version_show+0x98/0xf0 age=8188 cpu=6 pid=172
> > > [   75.000802]  stack_trace_save+0x9c/0xd0
> > > [   75.002420]  set_track+0x64/0xf0
> > > [   75.002770]  alloc_debug_processing+0x104/0x1a0
> > > [   75.003171]  ___slab_alloc+0x628/0x648
> > > [   75.004213]  __slab_alloc.isra.0+0x2c/0x58
> > > [   75.004757]  kmem_cache_alloc+0x560/0x588
> > > [   75.005376]  test_version_show+0x98/0xf0
> > > [   75.005756]  module_attr_show+0x40/0x60
> > > [   75.007035]  sysfs_kf_seq_show+0x128/0x1c0
> > > [   75.007433]  kernfs_seq_show+0xa0/0xb8
> > > [   75.007800]  seq_read+0x1f0/0x7e8
> > > [   75.008128]  kernfs_fop_read+0x70/0x338
> > > [   75.008507]  vfs_read+0xe4/0x250
> > > [   75.008990]  ksys_read+0xc8/0x180
> > > [   75.009462]  __arm64_sys_read+0x44/0x58
> > > [   75.010085]  el0_svc_common.constprop.0+0xac/0x228
> > > [   75.011006] kmem_cache_destroy test_module_slab: Slab cache still has objects
> > >
> > > Register a cpu hotplug function to remove all objects in the offline
> > > per-cpu quarantine when cpu is going offline. Set a per-cpu variable
> > > to indicate this cpu is offline.
> > >
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > ---
> > >  mm/kasan/quarantine.c | 59 +++++++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 57 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> > > index 4c5375810449..67fb91ae2bd0 100644
> > > --- a/mm/kasan/quarantine.c
> > > +++ b/mm/kasan/quarantine.c
> > > @@ -29,6 +29,7 @@
> > >  #include <linux/srcu.h>
> > >  #include <linux/string.h>
> > >  #include <linux/types.h>
> > > +#include <linux/cpuhotplug.h>
> > >
> > >  #include "../slab.h"
> > >  #include "kasan.h"
> > > @@ -97,6 +98,7 @@ static void qlist_move_all(struct qlist_head *from, struct qlist_head *to)
> > >   * guarded by quarantine_lock.
> > >   */
> >
> > Hi Kuan-Ying,
> >
> > Thanks for fixing this.
> >
> > >  static DEFINE_PER_CPU(struct qlist_head, cpu_quarantine);
> > > +static DEFINE_PER_CPU(int, cpu_quarantine_offline);
> >
> > I think cpu_quarantine_offline is better be part of cpu_quarantine
> > because it logically is and we already obtain a pointer to
> > cpu_quarantine in quarantine_put, so it will also make the code a bit
> > shorter.
> >
>
> Ok. Got it.
>
> >
> > >  /* Round-robin FIFO array of batches. */
> > >  static struct qlist_head global_quarantine[QUARANTINE_BATCHES];
> > > @@ -176,6 +178,8 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
> > >         unsigned long flags;
> > >         struct qlist_head *q;
> > >         struct qlist_head temp = QLIST_INIT;
> > > +       int *offline;
> > > +       struct qlist_head q_offline = QLIST_INIT;
> > >
> > >         /*
> > >          * Note: irq must be disabled until after we move the batch to the
> > > @@ -187,8 +191,16 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
> > >          */
> > >         local_irq_save(flags);
> > >
> > > -       q = this_cpu_ptr(&cpu_quarantine);
> > > -       qlist_put(q, &info->quarantine_link, cache->size);
> > > +       offline = this_cpu_ptr(&cpu_quarantine_offline);
> > > +       if (*offline == 0) {
> > > +               q = this_cpu_ptr(&cpu_quarantine);
> > > +               qlist_put(q, &info->quarantine_link, cache->size);
> > > +       } else {
> > > +               qlist_put(&q_offline, &info->quarantine_link, cache->size);
> > > +               qlist_free_all(&q_offline, cache);
> >
> > This looks like a convoluted way to call qlink_free. I think it will
> > be better to call qlink_free directly here.
> >
> > And why do we need this? Because CPU shutdown code can still free some
> > objects afterwards?
> >
>
> Yes, it is because IRQ can happen during CPU shutdown and free some
> objects into offline CPU quarantine.
>
> > > +               local_irq_restore(flags);
> > > +               return;
> >
> > You add both if/else and early return, this looks like unnecessary
> > code complication. It would be simpler with:
> >
> > if (*offline) {
> >     qlink_free(...);
> >     return;
> > }
> > ... all current per-cpu local ...
> >
> >
>
> Thank you for reminder. v2 Will do it.
>
> > > +       }
> > >         if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
> > >                 qlist_move_all(q, &temp);
> > >
> > > @@ -328,3 +340,46 @@ void quarantine_remove_cache(struct kmem_cache *cache)
> > >
> > >         synchronize_srcu(&remove_cache_srcu);
> > >  }
> > > +
> > > +static int kasan_cpu_online(unsigned int cpu)
> > > +{
> > > +       int *offline;
> > > +       unsigned long flags;
> > > +
> > > +       local_irq_save(flags);
> >
> > I assume this local_irq_save/restore is to prevent some warnings from
> > this_cpu_ptr.
> > But CPU online/offline callbacks should run without preemption already
> > (preempting/rescheduling on other CPUs does not make sense for them,
> > right?), so I would assume that is already at least preemption
> > disabled or something. Is there this_cpu_ptr variant that won't
> > produce warnings on its own in cpu online/offline callbacks?
> > This whole function could be a 1-liner:
> > this_cpu_ptr(&cpu_quarantine)->offline = true;
> > So I am trying to understand if we could avoid all this unnecessary danse.
> >
>
> Yes, it's unnecessary. v2 will fix it.
>
> >
> > > +       offline = this_cpu_ptr(&cpu_quarantine_offline);
> > > +       *offline = 0;
> > > +       local_irq_restore(flags);
> > > +       return 0;
> > > +}
> > > +
> > > +static int kasan_cpu_offline(unsigned int cpu)
> > > +{
> > > +       struct kmem_cache *s;
> > > +       int *offline;
> > > +       unsigned long flags;
> > > +
> > > +       local_irq_save(flags);
> > > +       offline = this_cpu_ptr(&cpu_quarantine_offline);
> > > +       *offline = 1;
> > > +       local_irq_restore(flags);
> > > +
> > > +       mutex_lock(&slab_mutex);
> > > +       list_for_each_entry(s, &slab_caches, list) {
> > > +               per_cpu_remove_cache(s);
> > > +       }
> > > +       mutex_unlock(&slab_mutex);
> >
> > We just want to drop the whole per-cpu cache at once, right? I would
> > assume there should be a simpler way to do this all at once, rather
> > than doing this per-slab.
> >
>
> Yes.
> Is removing objects in per-cpu quarantine directly better?

Yes, single qlist_free_all call looks much better than iteration over
all slabs and removing in parts under the mutex.

> struct qlist_head *q;
> q = this_cpu_ptr(&cpu_quaratine);
> q->offline = true;
> qlist_free_all(q, NULL);
>
> > > +       return 0;
> > > +}
> > > +
> > > +static int __init kasan_cpu_offline_quarantine_init(void)
> > > +{
> > > +       int ret = 0;
> > > +
> > > +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mm/kasan:online",
> > > +                               kasan_cpu_online, kasan_cpu_offline);
> > > +       if (ret)
> > > +               pr_err("kasan offline cpu quarantine register failed [%d]\n", ret);
> > > +       return ret;
> > > +}
> > > +late_initcall(kasan_cpu_offline_quarantine_init);
> > > --
> > > 2.18.0
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1605162252-23886-2-git-send-email-Kuan-Ying.Lee%40mediatek.com.
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1605234714.30076.18.camel%40mtksdccf07.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
