Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AE7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6K6WxpqWr5yM3SzDPZ6o5KXpJQczgte2Sli127Axro=; b=szrLmPDF+AkccG8oWm2482pzWs
	8ktv6a2iN0DJb6UAkj06BaHA8sAc76Mo3npdJKeHf6iBvARhWqXYke1hnj85Zj5W7jN4svJqwzzDe
	/RVQz1FmaEznlHKsPec6onwmsUAhbM57UmBrZI2dQzlTT15In2hcY/SkfH6Kv6PKjqTCwDn1KqCOl
	7VrOBlWIkcxstRg52BFWGpHbobeV2jvgwLvhONxaf/yS4JA414FbCubaRuDGgeiOf8usF37qL5+8w
	jVFP+fDyvlU4Fv0BFqgj+BnWxkXmFPl1jC9psMPxEqflcbtOJ6aakfcqDU9JHuqLb+cwyN62asIqe
	eyvWgqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4eiF-001BGF-Ul; Fri, 24 Jun 2022 08:30:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ehu-001B6D-59; Fri, 24 Jun 2022 08:30:28 +0000
X-UUID: 368aabeac5a84446bfb2843bbfde6f29-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:85889f6a-d1ce-4ae5-9e4b-5d763c3bf50b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:c9206aea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 368aabeac5a84446bfb2843bbfde6f29-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yee.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1155874340; Fri, 24 Jun 2022 01:30:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 01:20:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 16:20:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 24 Jun 2022 16:20:20 +0800
Message-ID: <bdfd039fbde06113071f773ae6d5635ff4664e2c.camel@mediatek.com>
Subject: Re: [PATCH 1/1] mm: kfence: skip kmemleak alloc in kfence_pool
From: Yee Lee <yee.lee@mediatek.com>
To: Marco Elver <elver@google.com>
CC: <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:KFENCE" <kasan-dev@googlegroups.com>, "open list:MEMORY MANAGEMENT"
	<linux-mm@kvack.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Fri, 24 Jun 2022 16:20:20 +0800
In-Reply-To: <CANpmjNN-jsZoVmJWD2Dz6O3_YVjy0av6e0iD-+OYXpik1LbLvg@mail.gmail.com>
References: <20220623111937.6491-1-yee.lee@mediatek.com>
	 <20220623111937.6491-2-yee.lee@mediatek.com>
	 <CANpmjNN-jsZoVmJWD2Dz6O3_YVjy0av6e0iD-+OYXpik1LbLvg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_013026_251126_BBB2A51F 
X-CRM114-Status: GOOD (  24.04  )
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

On Thu, 2022-06-23 at 13:59 +0200, Marco Elver wrote:
> On Thu, 23 Jun 2022 at 13:20, yee.lee via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> > 
> > From: Yee Lee <yee.lee@mediatek.com>
> > 
> > Use MEMBLOCK_ALLOC_NOLEAKTRACE to skip kmemleak registration when
> > the kfence pool is allocated from memblock. And the kmemleak_free
> > later can be removed too.
> 
> Is this purely meant to be a cleanup and non-functional change?
> 
> > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > 
> > ---
> >  mm/kfence/core.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> > index 4e7cd4c8e687..0d33d83f5244 100644
> > --- a/mm/kfence/core.c
> > +++ b/mm/kfence/core.c
> > @@ -600,14 +600,6 @@ static unsigned long kfence_init_pool(void)
> >                 addr += 2 * PAGE_SIZE;
> >         }
> > 
> > -       /*
> > -        * The pool is live and will never be deallocated from this
> > point on.
> > -        * Remove the pool object from the kmemleak object tree, as
> > it would
> > -        * otherwise overlap with allocations returned by
> > kfence_alloc(), which
> > -        * are registered with kmemleak through the slab post-alloc 
> > hook.
> > -        */
> > -       kmemleak_free(__kfence_pool);
> 
> This appears to only be a non-functional change if the pool is
> allocated early. If the pool is allocated late using page-alloc, then
> there'll not be a kmemleak_free() on that memory and we'll have the
> same problem.

Do you mean the kzalloc(slab_is_available) in memblock_allc()? That
implies that MEMBLOCK_ALLOC_NOLEAKTRACE has no guarantee skipping
kmemleak_alloc from this. (Maybe add it?)

If so, we cannot identify later the block is stored in the phys
tree(memblock) or the virt tree(page_alloc).



