Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E663CC05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SDDobNw8IhsSeHChXAxs++SOI6CGdHlnbv8CLYWp4w=; b=xhbrCeRkodyXN/VYuDh0yxp2DH
	3jXuR7tCwFwQ1Ts3bq6KbareE3vxkXG5MRZ6tC4BjZUZd0nOSgDpnA1xf/9gWzXJmkLojGpNpl4NU
	vDrxU4j/4wkZ5zq4OqC/cGau9+l+L7bpW+k4lvJFYdfH4XiwTCSAgEEEePGK7M+7kVizhHM+o8OFi
	xyAxUKFrJzKxwL3VmvYvv2s5sjKpLzgtz2IKUCRpyYG9Jy/YjIa8vu9KFe0ZIDdcw0F0VK30czWXy
	fLdcJThNKljogg6SsRN17HusyHhNaBx+BDbh3dLVyN0ei6RJ84uLRCEhlbOUVvDyrpf/Kso4DibxN
	jmplsAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7xV-001zCr-F7; Thu, 09 Feb 2023 14:31:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7xJ-001z8d-1j; Thu, 09 Feb 2023 14:31:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6720A61A91;
	Thu,  9 Feb 2023 14:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA0EC4339B;
	Thu,  9 Feb 2023 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675953080;
	bh=zAwLjTfHZkA4Un8Wr96bawLWi9udk66aSBO3uZqtYAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VG5jFqXowBO4k3HxzeJWpfut2l0emYLJiIhkuZRgIavsBSTDTP8w9UHu5bMOwz6az
	 KDhpEkzdmx8AzjN6VDm3d79kkWwGfKZ3zv15VslgJvIfWn3BckIIPOx26HRHPWsb7+
	 JUSX7XenJnIUONq8rg7BC9rIb1aNamgywSg1Qtdtz4ZccT/Q+XGmD8xK8Rvo7PWZxM
	 DZc+yN0yeqppujKqn3ectEj7YYmTNaWjfKoVbeZVsHfGgs9xz7l8BkQUfJC0oKeLG1
	 no+cx8P3SwCP4tVqMjsVHdGRKJyNTjEFUN5PvJ3xy81FNkix+uaId+dWBihVWuzVgt
	 ZNhw/sUJ5xMDQ==
Date: Thu, 9 Feb 2023 16:31:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	chinwen.chang@mediatek.com, andrew.yang@mediatek.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/doc: Replace isolate_lru_page with folio_isolate_lru
Message-ID: <Y+UDq2DYJJSA3L60@kernel.org>
References: <20230131062853.28449-1-Kuan-Ying.Lee@mediatek.com>
 <87a61wvtcs.fsf@meer.lwn.net>
 <Y+Twr+g8PPL3uKhL@kernel.org>
 <Y+T78Wzeg3BgwiuY@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+T78Wzeg3BgwiuY@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_063121_151954_59A6A51C 
X-CRM114-Status: GOOD (  30.42  )
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

On Thu, Feb 09, 2023 at 01:58:09PM +0000, Matthew Wilcox wrote:
> On Thu, Feb 09, 2023 at 03:10:07PM +0200, Mike Rapoport wrote:
> > On Thu, Feb 02, 2023 at 11:02:11AM -0700, Jonathan Corbet wrote:
> > > Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> writes:
> > > 
> > > > Since we introduce folio, replace isolate_lru_page() with
> > > > folio_isolate_lru().
> > > >
> > > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > > ---
> > > >  Documentation/mm/page_migration.rst | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > This seems like a good patch to copy to linux-mm - done now.
> > > 
> > > The patch perhaps is a closer match to what's in linux-next, but it
> > > seems that, if we're going to update this document, we should reflect
> > > the use folios throughout?
> > 
> > Most of the current users of migrate_pages() still use isolate_lru_page()
> > so I think that updating page_migration.rst to folios is premature.
> > But when we do the update it also should include the translations.
> 
> It's a slim majority -- 9 of isolate_lru_pages() and 7 of
> folio_isolate_lru().  I don't think that changing the documentation is
> premature; we should document the functions we want people to use.
> I'd be surprised if isolate_lru_pages() still existed in six months.

That's a bit of a problem when documentation describes how things are done
rather than how to do them, but I don't have a strong feeling about
updating the docs while we are still in the transition period or postponing
it until e.g. isolate_lru_page() is gone.

But in any case, this should be much more comprehensive update rather than
replacing two occurrences out of three in a single file.

-- 
Sincerely yours,
Mike.

