Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C567C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brFPAz+0FKhSexzsU5Naru6T385rMC5LaoSYIJwBLz4=; b=3u8FfiGI6Z6Xz9
	fnVouIl48Mh/fm2RVLYfG/HfBr+wXixADBth2Ngp7S0Wnq9fFDFTS/qgOM+vtSGZd5QD+kAEjh4NM
	N5Fvwk/fFLUjIpIU+fVqCoKKwLS5tr9+ufU6aA5/9yxEaM0Zfh6aoGEfJuOK+FSDa7OksDMTpH0HH
	tYQfEvisFCyewpp4J2iSc+2Q+P774puA2rU8xp43QbqjAt9tgyGRmo8EtT62oYvedbMeTEVqLK0Ch
	ku5AosCAASjC7dgTx0QgUvGETlaJqQVJUPAyPAM4ScobznnMHqzWBVJvknlVLGL6ToSBFu+r0y6vN
	BqXwpYxUPFEWRg37Efdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWRQ0-009Og8-C9; Mon, 21 Mar 2022 23:26:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWRPl-009Obj-GH; Mon, 21 Mar 2022 23:26:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2CDBAB817FB;
 Mon, 21 Mar 2022 23:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727CDC340E8;
 Mon, 21 Mar 2022 23:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1647905175;
 bh=zm2PRxe5xFsuwQYNcENkfpKJjH4eQjyHej02f6w7vjg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fGhw3WkLFHitotKvT3JlzZG0riB2q+AE/MkryHbgTQjYGLXL1C233leDbR81IFofB
 NsHl5gPddbUrnzYwKJ7L5eLUUCYrCoFtWd8VdcspYc3DsurGS3obuw3Itzlr/3UxFF
 ypV18Zu9I53mSAM9ws3iNQX4xxY19wBQRcw++xqQ=
Date: Mon, 21 Mar 2022 16:26:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Yang <andrew.yang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, David Howells
 <dhowells@redhat.com>, William Kucharski <william.kucharski@oracle.com>,
 David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Marc
 Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Nicholas Tang <nicholas.tang@mediatek.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Subject: Re: [PATCH] mm/migrate: fix race between lock page and clear
 PG_Isolated
Message-Id: <20220321162613.0a3510d18f1fa0f1637e9661@linux-foundation.org>
In-Reply-To: <YjAIwAT6PnQnbckn@casper.infradead.org>
References: <20220315030515.20263-1-andrew.yang@mediatek.com>
 <YjAIwAT6PnQnbckn@casper.infradead.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_162617_879536_F6E8D804 
X-CRM114-Status: GOOD (  25.17  )
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

On Tue, 15 Mar 2022 03:32:16 +0000 Matthew Wilcox <willy@infradead.org> wrote:

> On Tue, Mar 15, 2022 at 11:05:15AM +0800, Andrew Yang wrote:
> > When memory is tight, system may start to compact memory for large
> > continuous memory demands. If one process tries to lock a memory page
> > that is being locked and isolated for compaction, it may wait a long time
> > or even forever. This is because compaction will perform non-atomic
> > PG_Isolated clear while holding page lock, this may overwrite PG_waiters
> > set by the process that can't obtain the page lock and add itself to the
> > waiting queue to wait for the lock to be unlocked.
> > 
> > CPU1                            CPU2
> > lock_page(page); (successful)
> >                                 lock_page(); (failed)
> > __ClearPageIsolated(page);      SetPageWaiters(page) (may be overwritten)
> > unlock_page(page);
> > 
> > The solution is to not perform non-atomic operation on page flags while
> > holding page lock.
> > 
> > Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
> > ---
> >  include/linux/page-flags.h |  2 +-
> >  mm/migrate.c               | 12 ++++++------
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 1c3b6e5c8bfd..64a84a9835cb 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -918,7 +918,7 @@ PAGE_TYPE_OPS(Guard, guard)
> >  
> >  extern bool is_free_buddy_page(struct page *page);
> >  
> > -__PAGEFLAG(Isolated, isolated, PF_ANY);
> > +PAGEFLAG(Isolated, isolated, PF_ANY);
> 
> Agreed.  Further, page cannot be a tail page (this is implied by the
> get_page_unless_zero() as tailpages have a zero refcount, and it
> is assumed by __PageMovable() as page->mapping is undefined for tail
> pages).  So this can actually be:
> 
> +PAGEFLAG(Isolated, isolated, PF_NO_TAIL);
> 
> I considered PF_ONLY_HEAD, but there are a lot more places that _check_
> PageIsolated() and I don't want to prove that they're all definitely
> working on head pages.

There was no followup to this.  I'll send the patch upstream as-is, but
please let's not forget this idea.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
