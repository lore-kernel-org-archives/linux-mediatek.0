Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CA9C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LawwaK/yAKjY5g+XV6BBxg8MJwf55RJqkRT68lynIdw=; b=ydqHYVuGTFn07yH/aPrUPeNF8D
	KV9g4+kvczC4MOeqy5athd/A2FgxQQcWJu+NY1gNf4xp9NBk+ElASaWOwN9Oyi+fp7aduEKIhbDMK
	f4K3XDIlBAD/JGDZhdGsp31PuugbI0y9iXSnGCPXcbkoMZ/lKUX+Rf2N2G8tFRwOJSjk5zyy5Phfp
	UiqLktApDahWC0t9X1Z41rSrTv4vI5JLQ3KOXyYM+A7qm3t46LwY30W0zxLJ1Y8QRyrePHadMEic5
	kzmXlYXavEsIbqXKdx7obd5FJCRkljSvvZqKE6zr6wmMiSbQFZvTgiUi/RY+MkiEZp/38oqv+rDL+
	icAYwUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6hB-001cTN-FZ; Thu, 09 Feb 2023 13:10:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6gy-001cQf-0v; Thu, 09 Feb 2023 13:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF89961A51;
	Thu,  9 Feb 2023 13:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE6DC433D2;
	Thu,  9 Feb 2023 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675948222;
	bh=4SUmqquqGXJoK6fqr+/rMnpLfSjMEDdKWErLzFfQiqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbxJAcxIY5aZSy8WxcV0uALiZbcIvWCMEUPDCaMmQmTjiQVyI8lF/94iQfqQkdCZM
	 PZdv9ca/F5KivfuWiigTuT1SG4/YCVTOKKrjerMnwjdv13ix9huD/Qek9w27t8GKxv
	 /0flF45ld1/3Dwvmb59C8wusQ0kkPeVcdiTwazc73m56FwcDU+91btuUha2TNEBd17
	 sIBgdMUx69bJVjv8jLvPynF3Q0q+WWsdyDNFUw9M4nydY7VZwZ9zLcAjARLixKOl+k
	 V9YQTg4QS7b+ll5deXaGt/mqSV2Tb1PLjcJkpxxw7BJ7Md1ZxYhttiprhhMKhtEUId
	 DBKpdSpSELI1Q==
Date: Thu, 9 Feb 2023 15:10:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	chinwen.chang@mediatek.com, andrew.yang@mediatek.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/doc: Replace isolate_lru_page with folio_isolate_lru
Message-ID: <Y+Twr+g8PPL3uKhL@kernel.org>
References: <20230131062853.28449-1-Kuan-Ying.Lee@mediatek.com>
 <87a61wvtcs.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a61wvtcs.fsf@meer.lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_051024_147058_EB81C1CB 
X-CRM114-Status: GOOD (  30.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 02, 2023 at 11:02:11AM -0700, Jonathan Corbet wrote:
> Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> writes:
> 
> > Since we introduce folio, replace isolate_lru_page() with
> > folio_isolate_lru().
> >
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > ---
> >  Documentation/mm/page_migration.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> This seems like a good patch to copy to linux-mm - done now.
> 
> The patch perhaps is a closer match to what's in linux-next, but it
> seems that, if we're going to update this document, we should reflect
> the use folios throughout?

Most of the current users of migrate_pages() still use isolate_lru_page()
so I think that updating page_migration.rst to folios is premature.
But when we do the update it also should include the translations.
 
> Thanks,
> 
> jon
> 
> > diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
> > index 11493bad7112..1f8cc175d770 100644
> > --- a/Documentation/mm/page_migration.rst
> > +++ b/Documentation/mm/page_migration.rst
> > @@ -69,8 +69,8 @@ In kernel use of migrate_pages()
> >  
> >     Lists of pages to be migrated are generated by scanning over
> >     pages and moving them into lists. This is done by
> > -   calling isolate_lru_page().
> > -   Calling isolate_lru_page() increases the references to the page
> > +   calling folio_isolate_lru().
> > +   Calling folio_isolate_lru() increases the references to the page
> >     so that it cannot vanish while the page migration occurs.
> >     It also prevents the swapper or other scans from encountering
> >     the page.
> > @@ -89,7 +89,7 @@ How migrate_pages() works
> >  
> >  migrate_pages() does several passes over its list of pages. A page is moved
> >  if all references to a page are removable at the time. The page has
> > -already been removed from the LRU via isolate_lru_page() and the refcount
> > +already been removed from the LRU via folio_isolate_lru() and the refcount
> >  is increased so that the page cannot be freed while page migration occurs.
> >  
> >  Steps:
> > -- 
> > 2.18.0
> 

-- 
Sincerely yours,
Mike.

