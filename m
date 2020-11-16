Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5346DC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 09:27:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBA0F2224F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 09:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ham8j5Bw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="AYmtyXEd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBA0F2224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pkMirQi9EYDOT3wV55XEADYdDFYQXb4hKh1XKq7By5E=; b=ham8j5Bwi2vOBedsqF3AREgkl
	Q+hpO28FHwwOfbvVY4F4/O7VyHDKVWDp3VRUqct//jG1P51ot4K8rjWqK7YlqtzyZZxEmya/qUoK7
	F4vSE29I/XfwJVg0NHSg0ioBnz/aYyDuExA3fxDADanlKaV0+hKdNgdEYv6gI4W4x6h+DnRziBpsz
	QcuINThCfBLCKJ0Or9QdqSjhgoeRZgSnAuXgCOot/7h6wXnT7OFgrEC+fy4VXdHvpOSchxd+f5Njc
	Vkw9jJx0SL8A6Utgc7OiitUw6kRCjjudtIJ7IuNM9FpKCdUPRzyBsA2EID0lLWxOqBxBVWsiRILF8
	SArE8lu8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kean1-0002pO-G5; Mon, 16 Nov 2020 09:27:11 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keamx-0002nU-0u
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 09:27:08 +0000
Received: by mail-qt1-x841.google.com with SMTP id p12so12393330qtp.7
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 01:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xO0juaBQE580WCmD+C2do+lXaG7MUpIc228ombtl2So=;
 b=AYmtyXEdWrp6kXBVb78bCbobLpl22LmlY+utW0OW+ZWvmj3ctCp2iAfvCycLas1hiL
 d6KyORZMBhYvZkJ1jLvAMtdCPvu4CNi7rw9IigvxkV306dlpusAmgkM2cl/Kv25Tlicl
 K2/YCP43uopQqAa8JnplZGPhC6h9001ILf/bhvEAhsi9I+GslKf/CjwTTFxjj6SZPkC+
 6nka7ZBJGOC6Mt9asBZ/GhUtEH64p6KIhLwL7Ja9MQXwDu0ZoKlBEbIAJXuZkPlMfPtg
 o9TH3KIJ38r+x9OrmVqfOOgpX5/ECr2jshRc52HLRlV83P4nFHzZp2QikA1OUCjuoW/4
 1odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xO0juaBQE580WCmD+C2do+lXaG7MUpIc228ombtl2So=;
 b=Ph23QTQvtdPQuceAkVo0uwHDiZa/+KTsIzAGOy7P+WxTmHtad4A2hV5akBAB16y9Gy
 Rwi3WU87bleyobRf0OJAbUH/2QhhmcRpsDjbmDL6yiSTxMW6M/txsTo31GqlEUbbBqCM
 BHwhM9e6wVpXKdcKl1Yy3V2NjErcLgTGdIcCI67P44D1w1eZwmSxtYCdCthmCrd8erT8
 734zy5k7mxZx5mcGxMmz951dGYjCxq/3MQUHlrghEFStnW/YU0ZBo/YPz8IWIovcMv8T
 e0ToYNnHoGmfztsjuXXlIWVEpZhm34pIq3OCHDqhRkSwqR6sSe/zWLDThZZw8H6cgj7B
 f0GQ==
X-Gm-Message-State: AOAM532tQnwJP+gJejQH+MnXNeRIZt3Mkek62pK8hmKQOTyjhp0J/KAa
 nv3mWz0FszB4OIVc167NqMFbgNvHhS3kF5ITw5A9GQ==
X-Google-Smtp-Source: ABdhPJyOnYx143blG3oTAJfoG1SkneonElF+InYoaKB3gm9FknORy0i0cO0JvZ+xkKiMt/Ri89Nio4h0t1Uyle7xRqc=
X-Received: by 2002:ac8:37f2:: with SMTP id e47mr13349765qtc.290.1605518823487; 
 Mon, 16 Nov 2020 01:27:03 -0800 (PST)
MIME-Version: 1.0
References: <1605508168-7418-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <1605508168-7418-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <1605508168-7418-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 16 Nov 2020 10:26:52 +0100
Message-ID: <CACT4Y+Zy_JQ3y7_P2NXffiijTuxcnh7VPcAGL66Ks2LaLTj-eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] kasan: fix object remain in offline per-cpu
 quarantine
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_042707_117119_0F11EBC6 
X-CRM114-Status: GOOD (  24.07  )
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
Cc: Miles Chen <miles.chen@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux-MM <linux-mm@kvack.org>, nicholas.tang@mediatek.com,
 Alexander Potapenko <glider@google.com>, guangye.yang@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 7:30 AM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> We hit this issue in our internal test.
> When enabling generic kasan, a kfree()'d object is put into per-cpu
> quarantine first. If the cpu goes offline, object still remains in
> the per-cpu quarantine. If we call kmem_cache_destroy() now, slub
> will report "Objects remaining" error.
>
> [   74.982625] =============================================================================
> [   74.983380] BUG test_module_slab (Not tainted): Objects remaining in test_module_slab on __kmem_cache_shutdown()
> [   74.984145] -----------------------------------------------------------------------------
> [   74.984145]
> [   74.984883] Disabling lock debugging due to kernel taint
> [   74.985561] INFO: Slab 0x(____ptrval____) objects=34 used=1 fp=0x(____ptrval____) flags=0x2ffff00000010200
> [   74.986638] CPU: 3 PID: 176 Comm: cat Tainted: G    B             5.10.0-rc1-00007-g4525c8781ec0-dirty #10
> [   74.987262] Hardware name: linux,dummy-virt (DT)
> [   74.987606] Call trace:
> [   74.987924]  dump_backtrace+0x0/0x2b0
> [   74.988296]  show_stack+0x18/0x68
> [   74.988698]  dump_stack+0xfc/0x168
> [   74.989030]  slab_err+0xac/0xd4
> [   74.989346]  __kmem_cache_shutdown+0x1e4/0x3c8
> [   74.989779]  kmem_cache_destroy+0x68/0x130
> [   74.990176]  test_version_show+0x84/0xf0
> [   74.990679]  module_attr_show+0x40/0x60
> [   74.991218]  sysfs_kf_seq_show+0x128/0x1c0
> [   74.991656]  kernfs_seq_show+0xa0/0xb8
> [   74.992059]  seq_read+0x1f0/0x7e8
> [   74.992415]  kernfs_fop_read+0x70/0x338
> [   74.993051]  vfs_read+0xe4/0x250
> [   74.993498]  ksys_read+0xc8/0x180
> [   74.993825]  __arm64_sys_read+0x44/0x58
> [   74.994203]  el0_svc_common.constprop.0+0xac/0x228
> [   74.994708]  do_el0_svc+0x38/0xa0
> [   74.995088]  el0_sync_handler+0x170/0x178
> [   74.995497]  el0_sync+0x174/0x180
> [   74.996050] INFO: Object 0x(____ptrval____) @offset=15848
> [   74.996752] INFO: Allocated in test_version_show+0x98/0xf0 age=8188 cpu=6 pid=172
> [   75.000802]  stack_trace_save+0x9c/0xd0
> [   75.002420]  set_track+0x64/0xf0
> [   75.002770]  alloc_debug_processing+0x104/0x1a0
> [   75.003171]  ___slab_alloc+0x628/0x648
> [   75.004213]  __slab_alloc.isra.0+0x2c/0x58
> [   75.004757]  kmem_cache_alloc+0x560/0x588
> [   75.005376]  test_version_show+0x98/0xf0
> [   75.005756]  module_attr_show+0x40/0x60
> [   75.007035]  sysfs_kf_seq_show+0x128/0x1c0
> [   75.007433]  kernfs_seq_show+0xa0/0xb8
> [   75.007800]  seq_read+0x1f0/0x7e8
> [   75.008128]  kernfs_fop_read+0x70/0x338
> [   75.008507]  vfs_read+0xe4/0x250
> [   75.008990]  ksys_read+0xc8/0x180
> [   75.009462]  __arm64_sys_read+0x44/0x58
> [   75.010085]  el0_svc_common.constprop.0+0xac/0x228
> [   75.011006] kmem_cache_destroy test_module_slab: Slab cache still has objects
>
> Register a cpu hotplug function to remove all objects in the offline
> per-cpu quarantine when cpu is going offline. Set a per-cpu variable
> to indicate this cpu is offline.
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> Reported-by: Guangye Yang <guangye.yang@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  mm/kasan/quarantine.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> index 4c5375810449..16e618ea805e 100644
> --- a/mm/kasan/quarantine.c
> +++ b/mm/kasan/quarantine.c
> @@ -29,6 +29,7 @@
>  #include <linux/srcu.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> +#include <linux/cpuhotplug.h>
>
>  #include "../slab.h"
>  #include "kasan.h"
> @@ -43,6 +44,7 @@ struct qlist_head {
>         struct qlist_node *head;
>         struct qlist_node *tail;
>         size_t bytes;
> +       bool offline;
>  };
>
>  #define QLIST_INIT { NULL, NULL, 0 }
> @@ -188,6 +190,11 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
>         local_irq_save(flags);
>
>         q = this_cpu_ptr(&cpu_quarantine);
> +       if (q->offline) {
> +               qlink_free(&info->quarantine_link, cache);
> +               local_irq_restore(flags);
> +               return;
> +       }
>         qlist_put(q, &info->quarantine_link, cache->size);
>         if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
>                 qlist_move_all(q, &temp);
> @@ -328,3 +335,31 @@ void quarantine_remove_cache(struct kmem_cache *cache)
>
>         synchronize_srcu(&remove_cache_srcu);
>  }
> +
> +static int kasan_cpu_online(unsigned int cpu)
> +{
> +       this_cpu_ptr(&cpu_quarantine)->offline = false;
> +       return 0;
> +}
> +
> +static int kasan_cpu_offline(unsigned int cpu)
> +{
> +       struct qlist_head *q;
> +
> +       q = this_cpu_ptr(&cpu_quarantine);
> +       q->offline = true;
> +       qlist_free_all(q, NULL);

Looks much nicer now!

What is the story with interrupts in these callbacks?
In the previous patch you mentioned that this CPU can still receive
interrupts for a brief period of time. If these interrupts also free
something, can't we corrupt the per-cpu quarantine? In quarantine_put
we protect it by disabling interrupts I think.


> +       return 0;
> +}
> +
> +static int __init kasan_cpu_offline_quarantine_init(void)
> +{
> +       int ret = 0;
> +
> +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mm/kasan:online",
> +                               kasan_cpu_online, kasan_cpu_offline);
> +       if (ret < 0)
> +               pr_err("kasan offline cpu quarantine register failed [%d]\n", ret);
> +       return ret;
> +}
> +late_initcall(kasan_cpu_offline_quarantine_init);
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
