Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B3BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:42:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 115BB224DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 115BB224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KwZJo+vY5SNm8vBTuOB0eMElgQa9m3IUPNhZg7qy7rE=; b=1zxiY4OAjPR1o9tWfdSXjmtzt
	/If1NogfUIhFZkWJjYWo8feyqPweu65AbLMCsCHBUp6MdNt+KYxS7eGVpsu14iUPfacn+E51Hijxb
	zcuNUv/1UzAIoarnh0+cMqMULFn0KLpztJ074xUKIK+EdEW/BRII2c4WeXlahzVJ8wrmk8+G8cZgJ
	cYCJj8ynUgcIEambqWpUR+ZMM58Tk3Vw85H9o8GAZDifC+QyihNKrxgnAi3hu6TsZJwr4PBG9C7J7
	UnPF7iKAkZAm2emRUx2a5skfBtAgNBq/Kgcj6iQ6ipEKJhMJYX+3//WEpgyQzO8YksTiKYd+dLK0a
	jCheJ7pyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl07V-0003it-I5; Fri, 04 Dec 2020 01:42:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl07Q-0003gy-4w; Fri, 04 Dec 2020 01:42:45 +0000
X-UUID: cda7a7a4cbf24e228bf15943fa4dc33b-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KWikmV/wDlXuDUVsDyFD6GjELptOAMlHj8HVv2I+cPU=; 
 b=ZRa98cbvF1HYbZ2/bYY5lqWwPLrMu3JbnmYTRJM5q8//V79QvySGpdptghl8/lokH2P7YgYm+ceoP6+iGxlyKi4YTG59v8SBcfHGCATJ2ngSAkJj2Z+0hXxhgklPVV0BKQfn+I7Lv3J50YgR+YU76Yv5j8fdEd1JHvDlyOW6W3g=;
X-UUID: cda7a7a4cbf24e228bf15943fa4dc33b-20201203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1736454323; Thu, 03 Dec 2020 17:42:37 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 17:32:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 09:32:34 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 09:32:36 +0800
Message-ID: <1607045555.4722.7.camel@mtksdccf07>
Subject: Re: [PATCH v5 3/4] lib/test_kasan.c: add workqueue test case
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Marco Elver <elver@google.com>
Date: Fri, 4 Dec 2020 09:32:35 +0800
In-Reply-To: <CANpmjNNdaiN=J0TU_AjAoH=ECNC8dJWS8HTvJs9nxBkJce9AmQ@mail.gmail.com>
References: <20201203022748.30681-1-walter-zh.wu@mediatek.com>
 <CANpmjNNdaiN=J0TU_AjAoH=ECNC8dJWS8HTvJs9nxBkJce9AmQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_204244_355409_D0D28090 
X-CRM114-Status: GOOD (  23.69  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry
 Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 11:29 +0100, Marco Elver wrote:
> On Thu, 3 Dec 2020 at 03:27, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > Adds a test to verify workqueue stack recording and print it in
> > KASAN report.
> >
> > The KASAN report was as follows(cleaned up slightly):
> >
> >  BUG: KASAN: use-after-free in kasan_workqueue_uaf
> >
> >  Freed by task 54:
> >   kasan_save_stack+0x24/0x50
> >   kasan_set_track+0x24/0x38
> >   kasan_set_free_info+0x20/0x40
> >   __kasan_slab_free+0x10c/0x170
> >   kasan_slab_free+0x10/0x18
> >   kfree+0x98/0x270
> >   kasan_workqueue_work+0xc/0x18
> >
> >  Last potentially related work creation:
> >   kasan_save_stack+0x24/0x50
> >   kasan_record_wq_stack+0xa8/0xb8
> >   insert_work+0x48/0x288
> >   __queue_work+0x3e8/0xc40
> >   queue_work_on+0xf4/0x118
> >   kasan_workqueue_uaf+0xfc/0x190
> >
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Acked-by: Marco Elver <elver@google.com>
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
> > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> >
> > v4:
> > - testcase has merge conflict, so that rebase onto the KASAN-KUNIT
> >
> > ---
> >  lib/test_kasan_module.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/lib/test_kasan_module.c b/lib/test_kasan_module.c
> > index 2d68db6ae67b..62a87854b120 100644
> > --- a/lib/test_kasan_module.c
> > +++ b/lib/test_kasan_module.c
> > @@ -91,6 +91,34 @@ static noinline void __init kasan_rcu_uaf(void)
> >         call_rcu(&global_rcu_ptr->rcu, kasan_rcu_reclaim);
> >  }
> >
> > +static noinline void __init kasan_workqueue_work(struct work_struct *work)
> > +{
> > +       kfree(work);
> > +}
> > +
> > +static noinline void __init kasan_workqueue_uaf(void)
> > +{
> > +       struct workqueue_struct *workqueue;
> > +       struct work_struct *work;
> > +
> > +       workqueue = create_workqueue("kasan_wq_test");
> > +       if (!workqueue) {
> > +               pr_err("Allocation failed\n");
> > +               return;
> > +       }
> > +       work = kmalloc(sizeof(struct work_struct), GFP_KERNEL);
> > +       if (!work) {
> > +               pr_err("Allocation failed\n");
> > +               return;
> > +       }
> > +
> > +       INIT_WORK(work, kasan_workqueue_work);
> > +       queue_work(workqueue, work);
> > +       destroy_workqueue(workqueue);
> > +
> > +       pr_info("use-after-free on workqueue\n");
> > +       ((volatile struct work_struct *)work)->data;
> > +}
> >
> >  static int __init test_kasan_module_init(void)
> >  {
> > @@ -102,6 +130,7 @@ static int __init test_kasan_module_init(void)
> >
> >         copy_user_test();
> >         kasan_rcu_uaf();
> > +       kasan_workqueue_uaf();
> 
> 
> Why can't this go into the KUnit based KASAN test?

This test case has not been ported to KUnit, because KUnit's expect
failure will not check whether the work stack is exist. So it remains in
test_kasan_module, it is the same with kasan_rcu_uaf()[1].

[1]https://lkml.org/lkml/2020/8/1/45

Thanks.
Walter



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
