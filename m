Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EB6C49EA5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 04:23:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C2C6135A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 04:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C2C6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoiwak+V88lYiCllUki7w9QAlFIcxT5OfvB0Qm2hQfA=; b=mYCYNFDsgP9NNa
	onsFJkMdqN9JfvZmDziEk1deEMsC+YwiFEMOGNk62w0JmQUlWpK+b/VhCAr1krpCl1ET6+CdEUr6H
	UDezJ8vdmX3Gduzl11gD5HK3J3J/zMxYVxS8nv/70BBUim27e5qz9DuADkvPMcqOKIHn0kzietuVK
	AQu22875OP3608MLPWtwiUB+mFPZcDAIMQXfSWYQL3ETMJYoChpjyoWG3ptjajO22L1NwyanGce07
	7x4eYB5tdtfbYrzr/GiU1HLyh2nCtKSnsCVOYW2JDzoImC4PbRUUghWwQGWPCh85fcOyBn1n4KydH
	RAHt5WPzrVkXWRS2jFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvuPZ-009FD4-W5; Wed, 23 Jun 2021 04:22:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvuPN-009FBV-IV; Wed, 23 Jun 2021 04:22:39 +0000
X-UUID: f66946b8098642c294334e7c99e9f826-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TBxfwLBKGn4+TI8Df5N7zNLI4LFZZ6G306I1NI2naDU=; 
 b=rEs2Lb/bY+TyhaTlmCTs9yMAwPjjrrSVjxXYX1SnoRuM2G3k3CjMG2JT3FgTyX1Aa8+xufkuPW3PzdLpkE81F6wc2N/b/A53e/tTaUj7tKJPmSmTco8vwlf4Qz6rL+znJh/Ur8P9dKGyDwRK7mGo5/4mAJo2UQaP8GteZ+GZSeQ=;
X-UUID: f66946b8098642c294334e7c99e9f826-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2039167884; Tue, 22 Jun 2021 21:22:36 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 21:12:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 12:12:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 12:12:27 +0800
Message-ID: <d75209622c3ffd9c2c9743c594fa5ff60d19a9fc.camel@mediatek.com>
Subject: Re: [PATCH v3 3/3] kasan: add memory corruption identification
 support for hardware tag-based mode
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
 <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>,
 <kuan-ying.lee@mediatek.com>
Date: Wed, 23 Jun 2021 12:12:26 +0800
In-Reply-To: <CA+fCnZcSy6LqqhbYfiC8hn16+T640uw_rnUzNPg1zsvg_RwYzw@mail.gmail.com>
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-4-Kuan-Ying.Lee@mediatek.com>
 <CA+fCnZcSy6LqqhbYfiC8hn16+T640uw_rnUzNPg1zsvg_RwYzw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_212237_661252_624B92D3 
X-CRM114-Status: GOOD (  21.39  )
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
> > Add memory corruption identification support for hardware tag-based
> > mode. We store one old free pointer tag and free backtrace.
> 
> Please explain why only one.
> 

Got it. I will rewrite this commit message in v4.

> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > Suggested-by: Marco Elver <elver@google.com>
> > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Andrey Konovalov <andreyknvl@gmail.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >  lib/Kconfig.kasan | 2 +-
> >  mm/kasan/kasan.h  | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> > index 6f5d48832139..2cc25792bc2f 100644
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -157,7 +157,7 @@ config KASAN_STACK
> > 
> >  config KASAN_TAGS_IDENTIFY
> >         bool "Enable memory corruption identification"
> > -       depends on KASAN_SW_TAGS
> > +       depends on KASAN_SW_TAGS || KASAN_HW_TAGS
> >         help
> >           This option enables best-effort identification of bug
> > type
> >           (use-after-free or out-of-bounds) at the cost of
> > increased
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index b0fc9a1eb7e3..d6f982b8a84e 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -153,7 +153,7 @@ struct kasan_track {
> >         depot_stack_handle_t stack;
> >  };
> > 
> > -#ifdef CONFIG_KASAN_TAGS_IDENTIFY
> > +#if defined(CONFIG_KASAN_TAGS_IDENTIFY) &&
> > defined(CONFIG_KASAN_SW_TAGS)
> >  #define KASAN_NR_FREE_STACKS 5
> >  #else
> >  #define KASAN_NR_FREE_STACKS 1
> > --
> > 2.18.0
> > 
> 
> Other than that:
> 
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
