Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C34CC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 10:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B851610C7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 10:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B851610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxO8soK0X2teClNDELLQ902hPKrtd0EJjjMZNuz6qAM=; b=4NIXoE+o0thpLF
	0HGgtvqyODjfvRFkV6SVF2xewuXXD/I0Pgj3GC/aR0B5C8iWEGrdLfTY+LrPvPyWOFJ/5K1ndli2y
	s6ThAJAif3Z4PgUeis381x2/FB9/tH8k4QY1Yiel5SoItZOZj6rEKHtiBBNQgACFN7xp+Lpk6HhUG
	EQR/q3QdGUzyEZNXbiZSBaQaMXS33Lk5vVgql1nG90dVsci7IV5YZVZKCaq4m0PbAmyQIguHe2b4S
	v7n6/vy4vqwEay/CieBgUFgLtFuzWss9CCWJrrjsGCbyph64RpZgsI8BD7aAtvNf8SC8QVNxRuJ3+
	BqxdnCkMgAJ277SAUmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lve0W-006m4n-B4; Tue, 22 Jun 2021 10:51:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lve0G-006lzd-36; Tue, 22 Jun 2021 10:51:37 +0000
X-UUID: 0f15853c5da645429e2fb3d73e54fefd-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2Xe8s5S2Pr4ZdWw9QKHGiKnjYf3PUAlezQXXPGZ6XEY=; 
 b=gzfNptSpgprLIDASwWuot5yz8g6+tlxSm99SiEIx66xcbfWlNFswAlL5H9DYnt8TqvDF/6yHRb5ORoB5Yor4/P4+PfPJbaC4pP0fvvlmDeqeAbvJzFCwFEuBooamcmKutHMG1kGu2OT/2jlnvhZAcZB2Q2Y13WCem4vJ8/vR50s=;
X-UUID: 0f15853c5da645429e2fb3d73e54fefd-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 908456525; Tue, 22 Jun 2021 03:51:33 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 03:48:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 18:48:13 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Jun 2021 18:48:13 +0800
Message-ID: <46b1468146206e6cef0c33ecbfd86e02ea819db4.camel@mediatek.com>
Subject: Re: [PATCH] kasan: [v2]unpoison use memzero to init unaligned object
From: Yee Lee <yee.lee@mediatek.com>
To: Marco Elver <elver@google.com>
CC: <andreyknvl@gmail.com>, <wsd_upstream@mediatek.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "open list:KASAN"
 <kasan-dev@googlegroups.com>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Date: Tue, 22 Jun 2021 18:48:13 +0800
In-Reply-To: <CANpmjNPyP2-oULXuO9ZdC=yj_XSiC2TWKNBp0RL_h3k-XvpFsA@mail.gmail.com>
References: <20210622084723.27637-1-yee.lee@mediatek.com>
 <CANpmjNPyP2-oULXuO9ZdC=yj_XSiC2TWKNBp0RL_h3k-XvpFsA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_035136_185978_9156455E 
X-CRM114-Status: GOOD (  40.12  )
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

On Tue, 2021-06-22 at 11:01 +0200, Marco Elver wrote:
> On Tue, 22 Jun 2021 at 10:48, <yee.lee@mediatek.com> wrote:
> > 
> > From: Yee Lee <yee.lee@mediatek.com>
> > 
> > Follows the discussion: 
> > https://patchwork.kernel.org/project/linux-mediatek/list/?series=504439
> 
> The info about the percentage of how frequent this is could have been
> provided as a simple reply to the discussion.
> 
> > This patch Add memzero_explict to initialize unaligned object.
> 
> This patch does not apply to anything (I see it depends on the
> previous patch).
> 
> What you need to do is modify the original patch, and then send a
> [PATCH v2] (git helps with that by passing --reroll-count or -v) that
> applies cleanly to your base kernel tree.
> 
> The commit message will usually end with '---' and then briefly
> denote
> what changed since the last version.
> 
Got it.

> 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
> 
> > Based on the integrateion of initialization in kasan_unpoison().
> > The hwtag instructions, constrained with its granularity, has to
> > overwrite the data btyes in unaligned objects. This would cause
> > issue when it works with SLUB debug redzoning.
> > 
> > In this patch, an additional initalizaing path is added for the
> > unaligned objects. It contains memzero_explict() to clear out the
> > data and disables its init flag for the following hwtag actions.
> > 
> > In lab test, this path is executed about 1.1%(941/80854) within the
> > overall kasan_unpoison during a non-debug booting process.
> 
> Nice, thanks for the data. If it is somehow doable, however, I'd
> still
> recommend to additionally guard the new code path by a check if
> debug-support was requested. Ideally with an IS_ENABLED() config
> check
> so that if it's a production kernel the branch is simply optimized
> out
> by the compiler.

Does it mean the memzero code path would be applied only at
CONFIG_DEBUG_SLUB enabled? It expects no other potential overwriting
in non-debug kernel.
 
By the way, based on de-coupling principle, adding a specific
conditional statement(is_enable slub_debug) in a primitive
funciton(kasan_unpoison) is not neat. It may be more proper that the
conditional statement be added in other procedures of slub alloc.
 
Thanks,

BR,
Yee

> 
> > Lab test: QEMU5.2 (+mte) / linux kernel 5.13-rc7
> > 
> > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > ---
> >  mm/kasan/kasan.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index d8faa64614b7..edc11bcc3ff3 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -389,7 +389,7 @@ static inline void kasan_unpoison(const void
> > *addr, size_t size, bool init)
> >                 return;
> >         if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> >                 init = false;
> > -               memset((void *)addr, 0, size);
> > +               memzero_explicit((void *)addr, size);
> >         }
> >         size = round_up(size, KASAN_GRANULE_SIZE);
> >         hw_set_mem_tag_range((void *)addr, size, tag, init);
> > 2.18.0
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit 
> > https://groups.google.com/d/msgid/kasan-dev/20210622084723.27637-1-yee.lee%40mediatek.com
> > .
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
