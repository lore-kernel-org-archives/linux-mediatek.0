Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC95C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 13:54:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B466145D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 13:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B466145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXzpSlRdAgVeIskMzSUaV706tnWwXMUzHYsS6bC3450=; b=3WBC8q4lWOA/CT
	K1ugZ6VnYO/lZtvGpQpCoFzfo9DlaRHB6Hf45dEUXRc4Vf3QtOcK3SoKoceY6HeHDA9bCLxs0FK53
	UcC3wRhv4l7ZG3E1xoRM53p2Cfl6UVqi4ZfaOZSKnTWaJ8uE23F+BZSbncZNy4TEwEeHu2yKahrkh
	8J6F8JvCtf5ZwEBp337EIHz08kwLWMfd9Jd1QpAjSGRPhvw1X4RGz7Pus0gpSy9lmFO/Dysj9mZ4k
	ucTwS1897WNTzJ3OtERo1i1Q7+nl5vwPS800DymjUUUbxDShZlylm/OZVLnUwk+pfsnNbOFJW6xlw
	9NSibQmNIn8KcmOF3hyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0P2u-00936W-Gp; Mon, 05 Jul 2021 13:54:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0P2p-00935h-Ez; Mon, 05 Jul 2021 13:53:58 +0000
X-UUID: bf24aefd51104bdcaf98afe10ecaa851-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tWi3mQSz+Lkgh0l0iwDGIwHxWLR6tJfo9WaRVowuGB8=; 
 b=dPu98BdeHWnRyxm+1sU6UNGnA2iaJesZdv5PEjiznJk4+WaIgUUTfKYe7REA1tXMI0nBZ/mgm7qTxliB8gbHMWMDscQngOVe2oHeLTNBNw0Cg+wb84GJcgcGYAFdQMR669u3ONnVB7MyagPlG0l7IXplHhnuzskqlLAM5MMHSEI=;
X-UUID: bf24aefd51104bdcaf98afe10ecaa851-20210705
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1929215046; Mon, 05 Jul 2021 06:53:50 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 06:53:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 21:53:47 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 21:53:47 +0800
Message-ID: <da9034e02d0a2b5ce5fae01403a881e4d637ab16.camel@mediatek.com>
Subject: Re: [PATCH v6 2/2] kasan: Add memzero int for unaligned size at DEBUG
From: Yee Lee <yee.lee@mediatek.com>
To: Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
CC: LKML <linux-kernel@vger.kernel.org>, <nicholas.tang@mediatek.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, <chinwen.chang@mediatek.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:KASAN" <kasan-dev@googlegroups.com>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Mon, 5 Jul 2021 21:53:47 +0800
In-Reply-To: <CA+fCnZfKAZuy9oyDpTgNUTcNz5gnfHpJK5WN-yBNDV5VF8cq0g@mail.gmail.com>
References: <20210705103229.8505-1-yee.lee@mediatek.com>
 <20210705103229.8505-3-yee.lee@mediatek.com>
 <CA+fCnZdhrjo4RMBcj94MO7Huf_BVzaF5S_E97xS1vXGHoQdu5A@mail.gmail.com>
 <CANpmjNNXbszUL4M+-swi7k28h=zuY-KTfw+6W90hk2mgxr8hRQ@mail.gmail.com>
 <CA+fCnZfKAZuy9oyDpTgNUTcNz5gnfHpJK5WN-yBNDV5VF8cq0g@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_065356_314826_FDE6AA85 
X-CRM114-Status: GOOD (  19.97  )
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

Thank you, Macro. I thought members in "suggested-by" would be put in
the list as well... And thank you guys for the review these days. 


@Andrew Motom
Hi Andrew, 

Could you help to push the patches? We are dealing with the issue and 
would backport to Android porject right after the action.
Appreciated!


BR,
Yee 


On Mon, 2021-07-05 at 13:23 +0200, Andrey Konovalov wrote:
> On Mon, Jul 5, 2021 at 1:18 PM Marco Elver <elver@google.com> wrote:
> > 
> > On Mon, 5 Jul 2021 at 13:12, Andrey Konovalov <andreyknvl@gmail.com
> > > wrote:
> > [...]
> > > > +       /*
> > > > +        * Explicitly initialize the memory with the precise
> > > > object size to
> > > > +        * avoid overwriting the SLAB redzone. This disables
> > > > initialization in
> > > > +        * the arch code and may thus lead to performance
> > > > penalty. The penalty
> > > > +        * is accepted since SLAB redzones aren't enabled in
> > > > production builds.
> > > > +        */
> > > > +       if (__slub_debug_enabled() &&
> > > 
> > > What happened to slub_debug_enabled_unlikely()? Was it renamed?
> > > Why? I
> > > didn't receive patch #1 of v6 (nor of v5).
> > 
> > Somebody had the same idea with the helper:
> > https://lkml.kernel.org/r/YOKsC75kJfCZwySD@elver.google.com
> > and Matthew didn't like the _unlikely() prefix.
> > 
> > Which meant we should just move the existing helper introduced in
> > the
> > merge window.
> > 
> > Patch 1/2: 
> > https://lkml.kernel.org/r/20210705103229.8505-2-yee.lee@mediatek.com
> 
> Got it. Thank you, Marco!
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
