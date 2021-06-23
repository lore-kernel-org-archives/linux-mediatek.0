Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBFCC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 03:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F26C61001
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 03:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F26C61001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ng6lNw4xYrXbQV9Ns/7eULz0C4glEg3MGR1B3Kvt4a4=; b=zaVtxiYFnHBich
	0ZZxLCxcAjlZGAk86WMOw3e1Z0lAaeRNA8NENgaRG5x8oWVtZdDwSKik+HOGG/JuIBKZdCVRV+s9H
	alQjONIaPdhi/4ZcGK7awHFboDFvXWGlmXwrFhk27aTFMszhwjcuOdDNNhqlbybvjnVuiK9ZEQHqY
	xZvlauRTQ2zbnxAcrFvy1yg90D4ZIdDQxDq6wwsoQedaXK+qbkKmyerheqVTsWd17tn5xes7nxEa0
	yH3k4q9NfX2nnCjD6mYOFxRNPToVcRCrY8lHuYO8WM8beh885WdEQTZj29SeKLSqXY4RwajnhAr+E
	sXbnLQBrc7oSpZDai3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvtPE-0098DE-N8; Wed, 23 Jun 2021 03:18:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvtOz-00989s-J3; Wed, 23 Jun 2021 03:18:12 +0000
X-UUID: 7e94e9f4767e42d79427d7da12db4619-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bgnuDS/Z+nPqmzTT4TvjlnF+A9DJYxftjxThaCbTG3Q=; 
 b=tHHRkDmVZ8NTyBlzavJyPKjuaIHNBuMYP7TEyU2yYeyNJfqshKssDapxJPVkniDd/vCfl1dQzDF/3Ytv3NXpAiOE6dDhrQVvQr7sYgf8lWBflWN+Aw6kpem3qmltivDTFgnUpEV70ffdUWgOE20eU+h8oW3s3Lt6KNib6GsMqrE=;
X-UUID: 7e94e9f4767e42d79427d7da12db4619-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 84180601; Tue, 22 Jun 2021 20:18:05 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 20:18:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 11:17:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 11:17:55 +0800
Message-ID: <cd9c48696809ac92f9c201f4a08effe657da53ee.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] kasan: integrate the common part of two KASAN
 tag-based modes
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
 <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>
Date: Wed, 23 Jun 2021 11:17:55 +0800
In-Reply-To: <CA+fCnZdGQ-_USQ_dCkmp+=MGS01yRtn1eLpGRLvbq=j-SQDrog@mail.gmail.com>
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-3-Kuan-Ying.Lee@mediatek.com>
 <CA+fCnZdGQ-_USQ_dCkmp+=MGS01yRtn1eLpGRLvbq=j-SQDrog@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_201809_673114_319D3DD5 
X-CRM114-Status: GOOD (  25.60  )
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

On Tue, 2021-06-22 at 16:54 +0300, Andrey Konovalov wrote:
> On Sun, Jun 20, 2021 at 2:48 PM Kuan-Ying Lee
> <Kuan-Ying.Lee@mediatek.com> wrote:
> > 
> > 1. Move kasan_get_free_track() and kasan_set_free_info()
> >    into tags.c
> 
> Please mention that the patch doesn't only move but also combines
> these functions for SW_TAGS and HW_TAGS modes.
> 

Got it.

> > --- /dev/null
> > +++ b/mm/kasan/report_tags.h
> > @@ -0,0 +1,55 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> > + * Copyright (c) 2020 Google, Inc.
> > + */
> > +#ifndef __MM_KASAN_REPORT_TAGS_H
> > +#define __MM_KASAN_REPORT_TAGS_H
> > +
> > +#include "kasan.h"
> > +#include "../slab.h"
> > +
> > +const char *kasan_get_bug_type(struct kasan_access_info *info)
> 
> As mentioned by Alex, don't put this implementation into a header.
> Put
> it into report_tags.c. The declaration is already in kasan.h.
> 

Ok. I will refactor in v4.
Thanks for suggestions.

> > +{
> > +#ifdef CONFIG_KASAN_TAGS_IDENTIFY
> > +       struct kasan_alloc_meta *alloc_meta;
> > +       struct kmem_cache *cache;
> > +       struct page *page;
> > +       const void *addr;
> > +       void *object;
> > +       u8 tag;
> > +       int i;
> > +
> > +       tag = get_tag(info->access_addr);
> > +       addr = kasan_reset_tag(info->access_addr);
> > +       page = kasan_addr_to_page(addr);
> > +       if (page && PageSlab(page)) {
> > +               cache = page->slab_cache;
> > +               object = nearest_obj(cache, page, (void *)addr);
> > +               alloc_meta = kasan_get_alloc_meta(cache, object);
> > +
> > +               if (alloc_meta) {
> > +                       for (i = 0; i < KASAN_NR_FREE_STACKS; i++)
> > {
> > +                               if (alloc_meta->free_pointer_tag[i] 
> > == tag)
> > +                                       return "use-after-free";
> > +                       }
> > +               }
> > +               return "out-of-bounds";
> > +       }
> > +#endif
> > +
> > +       /*
> > +        * If access_size is a negative number, then it has reason
> > to be
> > +        * defined as out-of-bounds bug type.
> > +        *
> > +        * Casting negative numbers to size_t would indeed turn up
> > as
> > +        * a large size_t and its value will be larger than
> > ULONG_MAX/2,
> > +        * so that this can qualify as out-of-bounds.
> > +        */
> > +       if (info->access_addr + info->access_size < info-
> > >access_addr)
> > +               return "out-of-bounds";
> > +
> > +       return "invalid-access";
> > +}
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
