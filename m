Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64EBC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLuSjFfvcEuEmaQo9SbJ+jxYDKXN8EVDEVD/m4JEzVU=; b=W0Eh/zLKmcYK4NMrg3/gnN6XNV
	+dqViSS5RA+JtRdii5QJ/CZ1qDpIbwu/RysRFJD/RdnQzovFdugdZMqowURf8wDFQaXJH8bhg99po
	bo0IvVPjHSWPyOCnkbkYBQJuNXm8W3lTfsXsQKMTV8Tewi+ZjLr7jXtSYhEaICf/jNMt/cCz41ztH
	FePGTQLu3WuaplVVjZHY22hOrj/vVfhRLq8Fko8P2291RhEExXtN9KnR2VN7WcnNqq86rWAOxouRw
	9nsSwtcagGkymrvwxwxsAEWgusneB0QvwsXIMTcMgxF65YFFwY7yM6F8Hke6GusscPXUBqPkowcGH
	qja4CMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDlka-008Qfj-T9; Tue, 19 Jul 2022 11:50:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDlkQ-008Qbx-W5; Tue, 19 Jul 2022 11:50:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A3DF6162A;
	Tue, 19 Jul 2022 11:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A21C341C6;
	Tue, 19 Jul 2022 11:50:39 +0000 (UTC)
Date: Tue, 19 Jul 2022 12:50:35 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, yee.lee@mediatek.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:KFENCE" <kasan-dev@googlegroups.com>,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
Message-ID: <Ytaai+yWz0JG4a6O@arm.com>
References: <20220628113714.7792-1-yee.lee@mediatek.com>
 <20220628113714.7792-2-yee.lee@mediatek.com>
 <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
 <20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org>
 <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_045043_093151_A36A6454 
X-CRM114-Status: GOOD (  26.31  )
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

On Sat, Jul 16, 2022 at 08:43:06PM +0200, Geert Uytterhoeven wrote:
> On Sat, Jul 16, 2022 at 1:33 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> > On Fri, 15 Jul 2022 10:17:43 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Jun 28, 2022 at 1:42 PM <yee.lee@mediatek.com> wrote:
> > > > From: Yee Lee <yee.lee@mediatek.com>
> > > >
> > > > This patch solves two issues.
> > > >
> > > > (1) The pool allocated by memblock needs to unregister from
> > > > kmemleak scanning. Apply kmemleak_ignore_phys to replace the
> > > > original kmemleak_free as its address now is stored in the phys tree.
> > > >
> > > > (2) The pool late allocated by page-alloc doesn't need to unregister.
> > > > Move out the freeing operation from its call path.
> > > >
> > > > Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Suggested-by: Marco Elver <elver@google.com>
> > > > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > >
> > > Thank you, this fixes the storm of
> > >
> > >     BUG: KFENCE: invalid read in scan_block+0x78/0x130
> > >     BUG: KFENCE: use-after-free read in scan_block+0x78/0x130
> > >     BUG: KFENCE: out-of-bounds read in scan_block+0x78/0x130
> > >
> > > messages I was seeing on arm64.
> >
> > Thanks, but...
> >
> > - It would be great if we could identify a Fixes: for this.
> 
> IIRC, I started seeing the issue with "[PATCH v4 3/4] mm:
> kmemleak: add rbtree and store physical address for objects
> allocated with PA" (i.e. commit 0c24e061196c21d5 ("mm: kmemleak:
> add rbtree and store physical address for objects allocated
> with PA")) of series "[PATCH v4 0/4] mm: kmemleak: store objects
> allocated with physical address separately and check when scan"
> (https://lore.kernel.org/all/20220611035551.1823303-1-patrick.wang.shcn@gmail.com),
> in an arm64 config that had enabled kfence.

Yes, I think it fixes 0c24e061196c21d5 since after that commit, the
kmemleak_free() no longer worked as expected on physically allocated
objects.

-- 
Catalin

