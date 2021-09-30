Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52858C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 09:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1686140F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 09:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E1686140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUtFwrXefhsamjX0jXKAK9qUK8Mzk9Ik85DLoE7hRqM=; b=kfTWl6vtLNHcA/
	QVKiYM2w+XzQIxh+8rMEooEpCE76VPupgw215AmO9HdxfqrtlyPE1BGudki5mLF5z9fwp6bv61Rlb
	njimCZrTwvyxeUf16yoJS692KK3nUhYSjRjTF0pYMJGafQ0OB376Eexe8+qxlkaYk2GFyi4oWuhbZ
	gURAW7NfY+95gtrdf3gzcA/fs2+lq1eppxHOobCAWy2BFw0hBUSWzwXPSszxm9YHB6wnAA++Xe94s
	2Do4WsxFY9GBMYTk+r2pXjWAo0pM0kbPgiJs8EL48zE+vnbX8m90TtlDnfHxpZDZWDQJ3DBH4Qd6f
	MP65KuALwvkTdm+A/2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVs1y-00DWWP-2K; Thu, 30 Sep 2021 09:07:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVs1v-00DWVi-CR; Thu, 30 Sep 2021 09:07:05 +0000
X-UUID: c84b097229ea4ea5b6809e6f1b9df225-20210930
X-UUID: c84b097229ea4ea5b6809e6f1b9df225-20210930
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 799862912; Thu, 30 Sep 2021 02:06:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 02:06:54 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Sep 2021 17:06:53 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Sep 2021 17:06:53 +0800
Message-ID: <badc86471db3647b46673aa60b710262200eda51.camel@mediatek.com>
Subject: Re: [PATCH v2] scs: Release kasan vmalloc poison in scs_free process
From: Yee Lee <yee.lee@mediatek.com>
To: Will Deacon <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <nicholas.Tang@mediatek.com>,
 <Kuan-Ying.lee@mediatek.com>, <chinwen.chang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC	support"
 <linux-mediatek@lists.infradead.org>
Date: Thu, 30 Sep 2021 17:06:53 +0800
In-Reply-To: <20210930083535.GB23389@willie-the-truck>
References: <20210930081619.30091-1-yee.lee@mediatek.com>
 <20210930083535.GB23389@willie-the-truck>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_020703_464871_59563E94 
X-CRM114-Status: GOOD (  20.73  )
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

Got it. Thank you.

Yee

On Thu, 2021-09-30 at 09:35 +0100, Will Deacon wrote:
> On Thu, Sep 30, 2021 at 04:16:13PM +0800, yee.lee@mediatek.com wrote:
> > From: Yee Lee <yee.lee@mediatek.com>
> > 
> > Since scs allocation is moved to vmalloc region, the
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
> >  CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.15.0-rc2-11681-
> > g92477dd1faa6-dirty #1
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
> 
> Thanks, I'll take this via the arm64 tree as we're the only use of
> SCS.
> 
> One thing for future:
> 
> > Suggested-by: Kuan-Ying Lee <kuan-ying.lee@mediatek.com>
> > Reviewd-by: Will Deacon <will@kernel.org>
> 
> I gave an "Acked-by" and a "Tested-by" at [1], so those are the tags
> you
> should be using. Please don't convert them into a "Reviewed-by".
> 
> > Reviewd-by: Sami Tolvanen <samitolvanen@google.com>
> 
> This should be "Reviewed-by" (you have a typo).
> 
> Anyway, I'll fix these locally, no need to resend this time.
> 
> Will
> 
> [1] 
> https://urldefense.com/v3/__https://lore.kernel.org/r/20210929115447.GA21631@willie-the-truck__;!!CTRNKA9wMg0ARbw!yjJi1VvoIbI7CZQJplT_jdN087Pkk6pzXAZ12_FpegZzaUEQutkzBjX85rub_NI$
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
