Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9CF6124D
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD9CF6124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOKDrkN2xyF2h2g9JoEw8eIXwhfDn71r6m+BbmxXQw8=; b=USo1BfogbfhuWS
	FpwyvOUabipQ7R2Co7TyvBZD3DR6pV7Qg49sVkOxdG1xGgQLvh3aXjKG4Y647RZO171LmjVNn+T/R
	AlMr6/ItWLUeqIOp8hJ67NpyKHbkjtA4VBKwwgrRD2lp3DYfhJQUM4Hh4LjdNWpbVadSmfhTLkIiM
	kqCBijWNKY5Nh7t+61CLRu5WSpugbCZDdrM5s1ixsC2TQMgoY7uyZNu+mTvR6lyVS8MeswkVWYJ/P
	TKtfE114jMmVou7cVKd/B3XnT9wIAhQPceZBt8vU84iQG3goarqzVHxwd5sXcKPFMe7zcg8Di/R8C
	v0ZLxg1HocLj3JDld2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmIY-00EqvN-Rf; Fri, 24 Sep 2021 14:35:34 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmIW-00EquA-BN
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 14:35:33 +0000
Received: by mail-yb1-xb35.google.com with SMTP id s16so6172398ybe.0
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Sep 2021 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/Ub9o1nHZLbzldoR1+kn89lBOvKBniRGbpvXkg/Lws=;
 b=qp6ZzxPOKAQ8qeuCBY5JCBFNvVolTFiS5QJUYREJsnkUdwUUCJLPUBOg13T5ZXAt3u
 I4ZgqmlNomr/sqoOiR1LLW4Zl+hl2l14qUH9xY2DSyyQC4sOMt0emS+Ic+xodUpLgfae
 A038DKmM7UnSe3vF3dRhpaJlusuypitUk1V5jgnh+NvjoiR03rGthOCfsptxRzpqqlAb
 8IGC9tmfCQSWelvsbcFs7h/GaWozRdoTfYKxHQ6I5BliJcFb9p6S4vZBT4bk+eMTGkKo
 Walqa0qAyW50cXsiEB6lQIqTZUj/LqjoiCCiX6oKtf/ageRbxGSje0E3JFwoK9WLYNwC
 wjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/Ub9o1nHZLbzldoR1+kn89lBOvKBniRGbpvXkg/Lws=;
 b=72V0ZsBNYLoo/2ISixuGNQIbXO/yyQxaigcwWGVGiGjWLavNgt2snrh48uxEppI0D6
 FOstUpd8p7hI0u30DelhxafJHmSqKATe9YNmR8f5eqrn529vsAlpcY+ZdARw8hLHI8Hs
 ZA6dnXdnJOfJ0E4NNKdlZXCUukUd/qj6PQwMZhs8pJ7HG7SeCYVykpi03vccjV4ij4uX
 e+CXeljGv6EFfHbBuWfqyvU+45SZN0Qi9FrpY3kiQ4og9LbG+02H34fo26PQQL+7MoD6
 nnTEs1WcqVlLCKiiUhTHc6FN6cKp2Uy/dthlnQlVdK/NYJs8/jO25a+N+IAR8hbNtjKL
 /h8Q==
X-Gm-Message-State: AOAM530kI/yOZMA0LLmbJlgdKu3azKJxtCmCoRP2UJXQXRzZowQA2F+3
 olOWMkq2a1VAqdjRN4XZpRefoWD6AYDszKd1Vn8UDQ==
X-Google-Smtp-Source: ABdhPJyC0J5iolEmiySIkflhvFYnRo92b050ZN6hy/g7sKlzcRi3NyQdQdaanFVAjHwucoJ9rXOIDi7Ba06guk3ium4=
X-Received: by 2002:a25:2e0f:: with SMTP id u15mr13653133ybu.133.1632494130630; 
 Fri, 24 Sep 2021 07:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210923095316.13867-1-yee.lee@mediatek.com>
 <5f7a9ed1dabba25596c38a8e7c32ee5750b80459.camel@mediatek.com>
In-Reply-To: <5f7a9ed1dabba25596c38a8e7c32ee5750b80459.camel@mediatek.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 24 Sep 2021 07:35:19 -0700
Message-ID: <CABCJKucWe-C7i1+k42uV4TgeD8Q7NBoMrXxdyV85oPE9Tibdrg@mail.gmail.com>
Subject: Re: [PATCH] scs: Release kasan vmalloc poison in scs_free process
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: yee.lee@mediatek.com, LKML <linux-kernel@vger.kernel.org>, 
 nicholas.Tang@mediatek.com, chinwen.chang@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_073532_424583_2166426C 
X-CRM114-Status: GOOD (  24.27  )
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

On Thu, Sep 23, 2021 at 4:19 AM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> On Thu, 2021-09-23 at 17:53 +0800, yee.lee@mediatek.com wrote:
> > From: Yee Lee <yee.lee@mediatek.com>
> >
> > Since scs allocation has been moved to vmalloc region, the
> > shadow stack is protected by kasan_posion_vmalloc.
> > However, the vfree_atomic operation needs to access
> > its context for scs_free process and causes kasan error
> > as the dump info below.
> >
> > This patch Adds kasan_unpoison_vmalloc() before vfree_atomic,
> > which aligns to the prior flow as using kmem_cache.
> > The vmalloc region will go back posioned in the following
> > vumap() operations.
> >
> >  ==================================================================
> >  BUG: KASAN: vmalloc-out-of-bounds in llist_add_batch+0x60/0xd4
> >  Write of size 8 at addr ffff8000100b9000 by task kthreadd/2
> >
> >  CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.15.0-rc2-11681-(skip)
> >  Hardware name: linux,dummy-virt (DT)
> >  Call trace:
> >   dump_backtrace+0x0/0x43c
> >   show_stack+0x1c/0x2c
> >   dump_stack_lvl+0x68/0x84
> >   print_address_description+0x80/0x394
> >   kasan_report+0x180/0x1dc
> >   __asan_report_store8_noabort+0x48/0x58
> >   llist_add_batch+0x60/0xd4
> >   vfree_atomic+0x60/0xe0
> >   scs_free+0x1dc/0x1fc
> >   scs_release+0xa4/0xd4
> >   free_task+0x30/0xe4
> >   __put_task_struct+0x1ec/0x2e0
> >   delayed_put_task_struct+0x5c/0xa0
> >   rcu_do_batch+0x62c/0x8a0
> >   rcu_core+0x60c/0xc14
> >   rcu_core_si+0x14/0x24
> >   __do_softirq+0x19c/0x68c
> >   irq_exit+0x118/0x2dc
> >   handle_domain_irq+0xcc/0x134
> >   gic_handle_irq+0x7c/0x1bc
> >   call_on_irq_stack+0x40/0x70
> >   do_interrupt_handler+0x78/0x9c
> >   el1_interrupt+0x34/0x60
> >   el1h_64_irq_handler+0x1c/0x2c
> >   el1h_64_irq+0x78/0x7c
> >   _raw_spin_unlock_irqrestore+0x40/0xcc
> >   sched_fork+0x4f0/0xb00
> >   copy_process+0xacc/0x3648
> >   kernel_clone+0x168/0x534
> >   kernel_thread+0x13c/0x1b0
> >   kthreadd+0x2bc/0x400
> >   ret_from_fork+0x10/0x20
> >
> >  Memory state around the buggy address:
> >   ffff8000100b8f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> >   ffff8000100b8f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> >  >ffff8000100b9000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> >                     ^
> >   ffff8000100b9080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> >   ffff8000100b9100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> >  ==================================================================
> >
> > CC: Matthias Brugger <matthias.bgg@gmail.com>
> > CC: Will Deacon <will@kernel.org>
> > CC: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > ---
> >  kernel/scs.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/kernel/scs.c b/kernel/scs.c
> > index e2a71fc82fa0..25c0d8e416e6 100644
> > --- a/kernel/scs.c
> > +++ b/kernel/scs.c
> > @@ -68,6 +68,7 @@ void scs_free(void *s)
> >
> >       __scs_account(s, -1);
> >
> > +     kasan_unpoison_vmalloc(s, SCS_SIZE);
> >       /*
> >        * We cannot sleep as this can be called in interrupt context,
> >        * so use this_cpu_cmpxchg to update the cache, and
> > vfree_atomic
>
> I'm not sure if we need to add kasan_unpoison_vmalloc() and
> kasan_poison_vmalloc() in this file.
>
> As far as I know, vmalloc() and vfree() will do these two functions.

The idea here is to poison the shadow stack after it's set up to catch
unintentional accesses. Outside of compiler instrumentation, nothing
should read or write from this buffer while the task is running.

Sami

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
