Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC59C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 11:57:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203D420714
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 11:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lcEIspmN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PXJKEtd2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 203D420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2idlWtsu1qaQuP3CURabMGcUeSJjKdahyc8gk7IuLvQ=; b=lcEIspmN9AN4Qv
	F00N1yvS1hEQfwwr1FRPQ3mQa9YEcXy8PgxtY3OyZ2p+u0vfCowQXV6KuqZs9+OkbWkIpHCRkeDWI
	x53rvxfXpgmHUARBRRNck472AHzARzEuYfHRp1j9stP1ZlE7Blgttgc5Lt8wdD62oyU4jmBSfNynd
	/6VWFmCTzD93vH26EEUSHeG0QB5E8a+KXQVo279U4IRsqAv5y9u4YZRMCcAc9SiaiPlzFwjc8Ne47
	pHXTdLHeFYRLN4Z6Po0rQCSkAFbkSp76Ezr5q6rmGbDcS+qk7HhwfvpKETmUd/iJs2SSNCJqnRnRg
	y/LP7ZIs595YG8KBtWOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWIfW-0007yX-3z; Wed, 06 May 2020 11:56:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWIfO-0007s3-NM; Wed, 06 May 2020 11:56:48 +0000
X-UUID: 7bc91f3e9e2740c38a35fa63d31ef3f7-20200506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MNY7QjHyK2N8v2XPbveR8rY3W7ehZggZwWilVhYjlQw=; 
 b=PXJKEtd2EYOa4rA2Hb0vETIQGIbuaIRWoqj+ZhgwmE/kBOQWSyUVFAKUrIGXIxS16PZF+Zsez8211XRDgJtX9345+lZf2IlW7Zb5mvobDYAQXAAQ+D+vQErewCeuq7qeEII5tuzpDqUeJQqy9MpYZ9dns9lh7M5eAaQ6368JM1M=;
X-UUID: 7bc91f3e9e2740c38a35fa63d31ef3f7-20200506
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 735037817; Wed, 06 May 2020 03:56:42 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 04:56:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 19:56:31 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 May 2020 19:56:30 +0800
Message-ID: <1588766193.23664.28.camel@mtksdccf07>
Subject: Re: [PATCH 2/3] kasan: record and print the free track
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 6 May 2020 19:56:33 +0800
In-Reply-To: <CACT4Y+ajKJpwNXd1V17bOT_ZShXm8h2eepxx_g4hAqk78SxCDA@mail.gmail.com>
References: <20200506052155.14515-1-walter-zh.wu@mediatek.com>
 <CACT4Y+ajKJpwNXd1V17bOT_ZShXm8h2eepxx_g4hAqk78SxCDA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_045646_766198_5E15D838 
X-CRM114-Status: GOOD (  27.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-06 at 11:50 +0200, Dmitry Vyukov wrote:
> On Wed, May 6, 2020 at 7:22 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > We add new KASAN_RCU_STACK_RECORD configuration option. It will move
> > free track from slub meta-data (struct kasan_alloc_meta) into freed object.
> > Because we hope this options doesn't enlarge slub meta-data size.
> >
> > This option doesn't enlarge struct kasan_alloc_meta size.
> > - add two call_rcu() call stack into kasan_alloc_meta, size is 8 bytes.
> > - remove free track from kasan_alloc_meta, size is 8 bytes.
> >
> > This option is only suitable for generic KASAN, because we move free track
> > into the freed object, so free track is valid information only when it
> > exists in quarantine. If the object is in-use state, then the KASAN report
> > doesn't print call_rcu() free track information.
> >
> > [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
> >
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > ---
> >  mm/kasan/common.c | 10 +++++++++-
> >  mm/kasan/report.c | 24 +++++++++++++++++++++---
> >  2 files changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index 32d422bdf127..13ec03e225a7 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -321,8 +321,15 @@ void kasan_record_callrcu(void *addr)
> >                 /* record last call_rcu() call stack */
> >                 alloc_info->rcu_free_stack[1] = save_stack(GFP_NOWAIT);
> >  }
> > -#endif
> >
> > +static void kasan_set_free_info(struct kmem_cache *cache,
> > +               void *object, u8 tag)
> > +{
> > +       /* store free track into freed object */
> > +       set_track((struct kasan_track *)(object + BYTES_PER_WORD), GFP_NOWAIT);
> > +}
> > +
> > +#else
> >  static void kasan_set_free_info(struct kmem_cache *cache,
> >                 void *object, u8 tag)
> >  {
> > @@ -339,6 +346,7 @@ static void kasan_set_free_info(struct kmem_cache *cache,
> >
> >         set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
> >  }
> > +#endif
> >
> >  void kasan_poison_slab(struct page *page)
> >  {
> > diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> > index 7aaccc70b65b..f2b0c6b9dffa 100644
> > --- a/mm/kasan/report.c
> > +++ b/mm/kasan/report.c
> > @@ -175,8 +175,23 @@ static void kasan_print_rcu_free_stack(struct kasan_alloc_meta *alloc_info)
> >         print_track(&free_track, "Last call_rcu() call stack", true);
> >         pr_err("\n");
> >  }
> > -#endif
> >
> > +static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> > +               void *object, u8 tag, const void *addr)
> > +{
> > +       u8 *shadow_addr = (u8 *)kasan_mem_to_shadow(addr);
> > +
> > +       /*
> > +        * Only the freed object can get free track,
> > +        * because free track information is stored to freed object.
> > +        */
> > +       if (*shadow_addr == KASAN_KMALLOC_FREE)
> > +               return (struct kasan_track *)(object + BYTES_PER_WORD);
> 
> Humm... the other patch defines BYTES_PER_WORD as 4... I would assume
> seeing 8 (or sizeof(long)) here. Why 4?
It should be a pointer size, maybe sizeof(long) makes more sense.

> Have you tested all 4 modes (RCU/no-RCU x SLAB/SLUB)? As far as I
> remember one of the allocators stored something in the object.
Good question, I only tested in RCU x SLUB, would you tell mew how do
no-RCU? I will test them in v2 pathset.

> 
> Also, does this work with objects with ctors and slabs destroyed by
> rcu? kasan_track may smash other things in these cases.
> Have you looked at the KASAN implementation when free_track was
> removed? That may have useful details :)
Set free_track before put into quarantine, free_track should not have to
be removed, it only have to overwirte itself.

> 
> 
> > +       else
> > +               return NULL;
> > +}
> > +
> > +#else
> >  static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> >                 void *object, u8 tag, const void *addr)
> >  {
> > @@ -196,6 +211,7 @@ static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> >
> >         return &alloc_meta->free_track[i];
> >  }
> > +#endif
> >
> >  static void describe_object(struct kmem_cache *cache, void *object,
> >                                 const void *addr, u8 tag)
> > @@ -208,8 +224,10 @@ static void describe_object(struct kmem_cache *cache, void *object,
> >                 print_track(&alloc_info->alloc_track, "Allocated", false);
> >                 pr_err("\n");
> >                 free_track = kasan_get_free_track(cache, object, tag, addr);
> > -               print_track(free_track, "Freed", false);
> > -               pr_err("\n");
> > +               if (free_track) {
> > +                       print_track(free_track, "Freed", false);
> > +                       pr_err("\n");
> > +               }
> >  #ifdef CONFIG_KASAN_RCU_STACK_RECORD
> >                 kasan_print_rcu_free_stack(alloc_info);
> >  #endif
> > --
> > 2.18.0
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200506052155.14515-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
