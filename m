Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72F5CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjCeAO14p3zmD9+iEqpOsVWSf1uUTsFnLPszehJC8mM=; b=AkkqXyLb/YOML3zDeuJagQDlOV
	w0WEkNRw5P9PdgkPc3u5ncsyjnNXslQdqCukDmNojs5r8JW02umPaYuIpy+k/1oS0Rsj4OySwFGlb
	iFXGkhDRV3yPFdQGiNOVy3CS1760sdjpc5fHQl0dFFul5g+4OXg+hToHXU9XpOfUHSJVjGaoN6/bu
	EtUGwpKGugutPkWNtI5fbAAmMu1zkVjhEwHwdyV5ts8Pgw/+agut3Gf7MqZ0uc8+o0dXuBDNjcaCP
	4ADWvRAKMeHiHEME0sKo+0YOVoZmFnDB04APgDfCCQQjDq71yyUPIQlCm5tDhbt9mr+BVl2Jejtfp
	JBjXGkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Luz-0000000G5tm-3k1t;
	Wed, 24 Sep 2025 09:36:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Luv-0000000G5r2-32iD;
	Wed, 24 Sep 2025 09:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62A8B43B27;
	Wed, 24 Sep 2025 09:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551F0C116B1;
	Wed, 24 Sep 2025 09:34:55 +0000 (UTC)
Date: Wed, 24 Sep 2025 10:34:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, usamaarif642@gmail.com,
	yuzhao@google.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	baohua@kernel.org, voidice@gmail.com, Liam.Howlett@oracle.com,
	cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
	kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
	dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
	surenb@google.com, hughd@google.com, willy@infradead.org,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <aNO7MrQt9oPT8Hic@arm.com>
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com>
 <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com>
 <aNLHexcNI53HQ46A@arm.com>
 <f2fe9c01-2a8d-4de9-abd5-dbb86d15a37b@linux.dev>
 <aNOwuKmbAaMaEMb7@arm.com>
 <17dabd83-0849-44c9-b4a2-196af60d9676@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17dabd83-0849-44c9-b4a2-196af60d9676@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_023605_778998_E94E8880 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, Sep 24, 2025 at 11:13:18AM +0200, David Hildenbrand wrote:
> On 24.09.25 10:50, Catalin Marinas wrote:
> > On Wed, Sep 24, 2025 at 10:49:27AM +0800, Lance Yang wrote:
> > > On 2025/9/24 00:14, Catalin Marinas wrote:
> > > > So alternative patch that also fixes the deferred struct page init (on
> > > > the assumptions that the zero page is always mapped as pte_special():
> > > 
> > > I can confirm that this alternative patch also works correctly; my tests
> > > for MTE all pass ;)
> > 
> > Thanks Lance for testing. I'll post one of the variants today.
> > 
> > > This looks like a better fix since it solves the boot hang issue too.
> > 
> > In principle, yes, until I tracked down why I changed it in the first
> > place - 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to
> > the zero page"). ptrace() can read tags from PROT_MTE mappings and we
> > want to allow reading zeroes as well if the page points to the zero
> > page. Not flagging the page as PG_mte_tagged caused issues.
> > 
> > I can change the logic in the ptrace() code, I just need to figure out
> > what happens to the huge zero page. Ideally we should treat both in the
> > same way but, AFAICT, we don't use pmd_mkspecial() on the huge zero
> > page, so it gets flagged with PG_mte_tagged.
> 
> I changed that recently :) The huge zero folio will now always have
> pmd_special() set.

Oh, which commit was this? It means that we can end up with
uninitialised tags if we have a PROT_MTE huge zero page since
set_pmd_at/set_pte_at() skips mte_sync_tags().

-- 
Catalin

