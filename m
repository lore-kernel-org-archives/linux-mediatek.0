Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 03:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXP+9nIeME91zjFqjqyfrF60JqVDm4biO56k8+ZkcYM=; b=LzaP2T4flyiGco
	+Iwtx4m4lqq3OpkFPx5hMJs5YjSL3CB+bF04MY/SRohb3HKrP07DWcrBjl29qcDWqZL1zSlszTX6N
	6v8DFU4hOdfH6rsg6zghyEKKnuSFeaM8b4V07mIE7OD6FEQXxDk4LbEVBrVlRxRDITtNIO+h5L7Pj
	eWzXF1CzRuagRY66Nze3eQQI2VYX331j9S03NZNYCw7u9FqWuoA78Dki72/Q6GUXyqneRFCUKxqZV
	JB2U401md3Txf+xqWTIbk8sC4PI5S5GMlWCmx15KWo6swqsjJuYwyWK7zbXRAhTlN4TJowH6b3tjs
	r7ASF1/A4Hn7d73qJyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTxvJ-007eK0-4b; Tue, 15 Mar 2022 03:32:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTxv6-007eG8-6z; Tue, 15 Mar 2022 03:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LX0E2les13YpXYBTKiKwQRB41rW+42lYHTDGzHdEAYU=; b=AJtxFRchW7D27kGcK6oYZmF5sA
 XonPIJLddVIcOM02rq5l+CPZAvswzV8R0vLGibH1n7vDtNBi+gm0lpOHdTI8nd6bcE/Ek6ASTfm24
 yiJ0EYKcNa7cX75sXm10TtJOKSou5cdiBjj4gA5LMqyPZyDJ1ZRU7fhIIyqyAjT5EWxdPJCil+RKd
 W5ZQnQj1V5z0lzKNjpi2q6oZ2+UCkhn6CX2vevQTuW3ooFUnhiwRikZDoYpLgqwr+CaELRGcUl7dj
 DuRyLHWcQU2iD+7P2DJilra4pXNGTl+F+1IqVcgdzEeKgkte+s1UX9rzFVrKVR4pRAlvNMyY4m+r+
 RirbJIMg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nTxuy-004e5z-Dd; Tue, 15 Mar 2022 03:32:16 +0000
Date: Tue, 15 Mar 2022 03:32:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, David Howells <dhowells@redhat.com>,
 William Kucharski <william.kucharski@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 Yang Shi <shy828301@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Nicholas Tang <nicholas.tang@mediatek.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Subject: Re: [PATCH] mm/migrate: fix race between lock page and clear
 PG_Isolated
Message-ID: <YjAIwAT6PnQnbckn@casper.infradead.org>
References: <20220315030515.20263-1-andrew.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315030515.20263-1-andrew.yang@mediatek.com>
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

On Tue, Mar 15, 2022 at 11:05:15AM +0800, Andrew Yang wrote:
> When memory is tight, system may start to compact memory for large
> continuous memory demands. If one process tries to lock a memory page
> that is being locked and isolated for compaction, it may wait a long time
> or even forever. This is because compaction will perform non-atomic
> PG_Isolated clear while holding page lock, this may overwrite PG_waiters
> set by the process that can't obtain the page lock and add itself to the
> waiting queue to wait for the lock to be unlocked.
> 
> CPU1                            CPU2
> lock_page(page); (successful)
>                                 lock_page(); (failed)
> __ClearPageIsolated(page);      SetPageWaiters(page) (may be overwritten)
> unlock_page(page);
> 
> The solution is to not perform non-atomic operation on page flags while
> holding page lock.
> 
> Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
> ---
>  include/linux/page-flags.h |  2 +-
>  mm/migrate.c               | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 1c3b6e5c8bfd..64a84a9835cb 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -918,7 +918,7 @@ PAGE_TYPE_OPS(Guard, guard)
>  
>  extern bool is_free_buddy_page(struct page *page);
>  
> -__PAGEFLAG(Isolated, isolated, PF_ANY);
> +PAGEFLAG(Isolated, isolated, PF_ANY);

Agreed.  Further, page cannot be a tail page (this is implied by the
get_page_unless_zero() as tailpages have a zero refcount, and it
is assumed by __PageMovable() as page->mapping is undefined for tail
pages).  So this can actually be:

+PAGEFLAG(Isolated, isolated, PF_NO_TAIL);

I considered PF_ONLY_HEAD, but there are a lot more places that _check_
PageIsolated() and I don't want to prove that they're all definitely
working on head pages.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
