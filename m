Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09190C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgJMYSTcwLM1ixgRLAPd5jJAf8M0pVTq8SAJXoBvwMk=; b=AWt4kZ2T7/xTWs25YRE5ySZY4n
	0PsY0mlGkhu5BR0zazSv/5TC1kLqeFilRgJSYjwv51ob9bFJR+4wSeMIMw1o0FEBDZ7SZLWGUya7w
	SQxUhmxqwtIcKnF2pVBhwBzstloQ9BjvfqX3Kg0UdM2ZlE0oMxR65H4ckM67DYZImB8QV2kjKV4/e
	6YXdqarGawiWLtsIgSQ2quOI5TQ+kk7coHLPVzy6ciO/ao1TxL5ZdGlMJZ82dK+/OrxgcyTnpzL3/
	KoM00V558Im9tUPs/7iYhD7pZhwBAi5ySxZNJfqOeTdjGuFEFey+gVY6oprCkmRVgK0Qr1/4ZKC29
	oUdY5ylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7RR-001srv-0U; Thu, 09 Feb 2023 13:58:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7RI-001spK-2G; Thu, 09 Feb 2023 13:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SgJMYSTcwLM1ixgRLAPd5jJAf8M0pVTq8SAJXoBvwMk=; b=JZUXBWPbQ00z8TXTU+ZxSGwxJ3
	nn++ZtwCXNQ7i5ca8YILza2oM3JOdiT9EIubWY3IbWuZiJKxSvGFHSH0jViD0/QWLn+QEqWUxrXRQ
	VYbos8eOlrsacOr3eWvZAhUCLDzUYehlDtcJCm2cyN3ExIX5Qy6fEhWXbWJeoW0Yp5D0VYRvSkGLd
	/OdhUc4UVAtX/1g1bTk7M1Z7OIswzjACzDGIYdAcXysS/22aha7l/bvAjN2mlOHVHf4tTNPAqsaCC
	p2af01D5ggKiN1y2EvmvqZeIoWpIN7XLISiwKiBqPT0TLBrgzhEmRayHsoE5Xeah58INu+DB9MPDZ
	jAvvtrnw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7RB-002F9j-E0; Thu, 09 Feb 2023 13:58:09 +0000
Date: Thu, 9 Feb 2023 13:58:09 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	chinwen.chang@mediatek.com, andrew.yang@mediatek.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/doc: Replace isolate_lru_page with folio_isolate_lru
Message-ID: <Y+T78Wzeg3BgwiuY@casper.infradead.org>
References: <20230131062853.28449-1-Kuan-Ying.Lee@mediatek.com>
 <87a61wvtcs.fsf@meer.lwn.net>
 <Y+Twr+g8PPL3uKhL@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Twr+g8PPL3uKhL@kernel.org>
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

On Thu, Feb 09, 2023 at 03:10:07PM +0200, Mike Rapoport wrote:
> On Thu, Feb 02, 2023 at 11:02:11AM -0700, Jonathan Corbet wrote:
> > Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> writes:
> > 
> > > Since we introduce folio, replace isolate_lru_page() with
> > > folio_isolate_lru().
> > >
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > ---
> > >  Documentation/mm/page_migration.rst | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > This seems like a good patch to copy to linux-mm - done now.
> > 
> > The patch perhaps is a closer match to what's in linux-next, but it
> > seems that, if we're going to update this document, we should reflect
> > the use folios throughout?
> 
> Most of the current users of migrate_pages() still use isolate_lru_page()
> so I think that updating page_migration.rst to folios is premature.
> But when we do the update it also should include the translations.

It's a slim majority -- 9 of isolate_lru_pages() and 7 of
folio_isolate_lru().  I don't think that changing the documentation is
premature; we should document the functions we want people to use.
I'd be surprised if isolate_lru_pages() still existed in six months.

