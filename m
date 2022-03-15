Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8894C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 17:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyWz86ccLJGvBcGkmCW7b9Rwsm7jIgNO/h+BdRpJsvc=; b=0wFfLcb+ufmxky
	A7eEyFudlE0+hXbwyJ+qXEbJcJVWNuQTiLaPwGea/6csnC5SRolEoyF5ousxAO6iadCcDaeRabJ5e
	TNYsIkipq33AxpCPtvP9Cb/BCJg9dApSISFoi1iMz5qtIPVHpSd2rF+3C/4WPT6z7dNgapoXc+OTT
	vxBPtz2G6QQiqRlQGklVcqLyLfdPJ17uKxa9OPWpJ8kRxXRcrhzqN5M76oIblOHULZVxriMsD5eBj
	Q94i/i74p4UT+4YYRa7hEcxN0Nw7uy+e3yX60HgCVOz7Bd/zetcK48Pm9rqRQ8yCF2gHLkPKT6+8E
	nAItNXsBITmW+MVQMlcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUBD6-00A65W-TP; Tue, 15 Mar 2022 17:43:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUBCx-00A645-1s; Tue, 15 Mar 2022 17:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9pix+9SYxTuRDwLng5y7yIMLfweBib50HhucdHeBtV8=; b=NYpXmo/lC67e8NGFr3lxnBFGQe
 tK0dLkVgTBREiEfAfL+cAgHJtIl5GII0YxxNuYEhUHAvNtImmJua7o/d+Dx6HUm/dY4V7bTXoGZUV
 0UhgMdosi7uwS09pKtcXS6wUFJ9SOVo9Jo0Dpha0BpKNs+aLxMrj2RkjXU5/dvfCCYBT0RyPtDoai
 mZ+bTYpTO6NLiVROTByF86Dhj5C2yGhCmJR6zODjFdnte6s9cb6UgZhSFzH+hTCpmsgHxwQ3PsWww
 be4XeaPDganE7k6QcOsapL20PPH0RgjLh1JGLrP6SmRrs0DDcVjtT1frS9iY7spPsx/eE1QNzVrYo
 FXjZqNnA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nUBCn-005FAg-4i; Tue, 15 Mar 2022 17:43:33 +0000
Date: Tue, 15 Mar 2022 17:43:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andrew Yang <andrew.yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, David Howells <dhowells@redhat.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Yang Shi <shy828301@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Nicholas Tang <nicholas.tang@mediatek.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Subject: Re: [PATCH] mm/migrate: fix race between lock page and clear
 PG_Isolated
Message-ID: <YjDQRdShE6syVSnM@casper.infradead.org>
References: <20220315030515.20263-1-andrew.yang@mediatek.com>
 <20220314212127.a2797926ee0ef8a7ad05dcaa@linux-foundation.org>
 <4cb789a5-c49c-f095-1f7e-67be65ba508a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cb789a5-c49c-f095-1f7e-67be65ba508a@redhat.com>
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

On Tue, Mar 15, 2022 at 04:45:13PM +0100, David Hildenbrand wrote:
> On 15.03.22 05:21, Andrew Morton wrote:
> > On Tue, 15 Mar 2022 11:05:15 +0800 Andrew Yang <andrew.yang@mediatek.com> wrote:
> > 
> >> When memory is tight, system may start to compact memory for large
> >> continuous memory demands. If one process tries to lock a memory page
> >> that is being locked and isolated for compaction, it may wait a long time
> >> or even forever. This is because compaction will perform non-atomic
> >> PG_Isolated clear while holding page lock, this may overwrite PG_waiters
> >> set by the process that can't obtain the page lock and add itself to the
> >> waiting queue to wait for the lock to be unlocked.
> >>
> >> CPU1                            CPU2
> >> lock_page(page); (successful)
> >>                                 lock_page(); (failed)
> >> __ClearPageIsolated(page);      SetPageWaiters(page) (may be overwritten)
> >> unlock_page(page);
> >>
> >> The solution is to not perform non-atomic operation on page flags while
> >> holding page lock.
> > 
> > Sure, the non-atomic bitop optimization is really risky and I suspect
> > we reach for it too often.  Or at least without really clearly
> > demonstrating that it is safe, and documenting our assumptions.
> 
> I agree. IIRC, non-atomic variants are mostly only safe while the
> refcount is 0. Everything else is just absolutely fragile.

We could add an assertion ... I just tried this:

+++ b/include/linux/page-flags.h
@@ -342,14 +342,16 @@ static __always_inline                                                    \
 void __folio_set_##lname(struct folio *folio)                          \
 { __set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }         \
 static __always_inline void __SetPage##uname(struct page *page)                \
-{ __set_bit(PG_##lname, &policy(page, 1)->flags); }
+{ VM_BUG_ON_PGFLAGS(atomic_read(&policy(page, 1)->_refcount), page);   \
+  __set_bit(PG_##lname, &policy(page, 1)->flags); }

 #define __CLEARPAGEFLAG(uname, lname, policy)                          \
 static __always_inline                                                 \
 void __folio_clear_##lname(struct folio *folio)                                \
 { __clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }       \
 static __always_inline void __ClearPage##uname(struct page *page)      \
-{ __clear_bit(PG_##lname, &policy(page, 1)->flags); }
+{ VM_BUG_ON_PGFLAGS(atomic_read(&policy(page, 1)->_refcount), page);   \
+  __clear_bit(PG_##lname, &policy(page, 1)->flags); }

 #define TESTSETFLAG(uname, lname, policy)                              \
 static __always_inline                                                 \

... but it dies _really_ early:

(gdb) bt
#0  0xffffffff820055e5 in native_halt ()
    at ../arch/x86/include/asm/irqflags.h:57
#1  halt () at ../arch/x86/include/asm/irqflags.h:98
#2  early_fixup_exception (regs=regs@entry=0xffffffff81e03cf8,
    trapnr=trapnr@entry=6) at ../arch/x86/mm/extable.c:283
#3  0xffffffff81ff243c in do_early_exception (regs=0xffffffff81e03cf8,
    trapnr=6) at ../arch/x86/kernel/head64.c:419
#4  0xffffffff81ff214f in early_idt_handler_common ()
    at ../arch/x86/kernel/head_64.S:417
#5  0x0000000000000000 in ?? ()

and honestly, I'm not sure how to debug something that goes wrong this
early.  Maybe I need to make that start warning 5 seconds after boot
or only if we're not in pid 1, or something ...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
