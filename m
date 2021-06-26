Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C018DC49EA5
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ADE16192F
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ADE16192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdUNmjalU+M/W/sJ8FyslvBtaAbwsBl87RzVVLqOErU=; b=oKQP9GptjiomA0
	KNj+Hy32IdeIjULGIF07E/0KEyez4ea9QzImlFV6OldrKGLXUtv+J+zB4Cq0YFIXfKqMnGlxfxqzG
	NrnFS+0f5b5c1aH6WwtJJcC0x1Jd4QZ81DcNbzjPYCSNFTcHzpxi9dbc7G1tZA+y0QhMQTLQqvxLK
	0IUw5VsRMTgNoinLpjAHAFOe2AXREPRySt0GXRbOdabclthuJOBfnJSCabNamOk1sBawUCS9WFZm+
	wvZcxTf62dZLp1bKUvTRgZugxbM6pnq7+Lm9mOZlD0DaNDwLkAWE7Duy5qmDQG4+3ceP4q64p16qg
	QXKsmzte+ON/xHtRIklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lx5JY-003qVe-9n; Sat, 26 Jun 2021 10:13:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx5JJ-003qRd-4F; Sat, 26 Jun 2021 10:13:15 +0000
X-UUID: f01d2a03f5544f87a2b0c85e72983e5c-20210626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZbumjD0dXA8Fvx3qJdhEZ3HssG9IGyRmQDz1YHlIfM8=; 
 b=LBZCFEQVBy6TcLtHJIdgWJMMmB9MkAoCK1UwLMVZKtGzjmUmnQywzA6WEZcPdS9BOVIN55XJReJ/UK5WK5XdAkYYi425/sbZ+VjRJhFG9GWxzXSLB2xkuHQ2F2A30yfvirJQeB3NmIR/PF2c2OpvijbDl5cNhjjq837+9D/I+8Q=;
X-UUID: f01d2a03f5544f87a2b0c85e72983e5c-20210626
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 769931507; Sat, 26 Jun 2021 03:13:11 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 03:13:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 18:13:08 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 26 Jun 2021 18:13:08 +0800
Message-ID: <9e906af1182a9039886b0f86525106df381a6255.camel@mediatek.com>
Subject: Re: [PATCH v3 0/3] kasan: add memory corruption identification
 support for hw tag-based kasan
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Marco Elver <elver@google.com>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <chinwen.chang@mediatek.com>,
 <nicholas.tang@mediatek.com>, <kuan-ying.lee@mediatek.com>
Date: Sat, 26 Jun 2021 18:13:08 +0800
In-Reply-To: <CANpmjNP9n8-m4MhY6Cdnfx_SYLVtG8NJ7raMUR+3rBoNyyfs+Q@mail.gmail.com>
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNP9n8-m4MhY6Cdnfx_SYLVtG8NJ7raMUR+3rBoNyyfs+Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_031313_235824_3F00724B 
X-CRM114-Status: GOOD (  16.59  )
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

On Mon, 2021-06-21 at 14:45 +0200, Marco Elver wrote:
> On Sun, 20 Jun 2021 at 13:48, Kuan-Ying Lee <
> Kuan-Ying.Lee@mediatek.com> wrote:
> > 
> > Add memory corruption identification for hardware tag-based KASAN
> > mode.
> > 
> > Changes since v3:
> >  - Preserve Copyright from hw_tags.c/sw_tags.c and
> >    report_sw_tags.c/report_hw_tags.c
> >  - Make non-trivial change in kasan sw tag-based mode
> > 
> > Changes since v2:
> >  - Thanks for Marco's Suggestion
> >  - Rename the CONFIG_KASAN_SW_TAGS_IDENTIFY
> >  - Integrate tag-based kasan common part
> >  - Rebase to latest linux-next
> > 
> > Kuan-Ying Lee (3):
> >   kasan: rename CONFIG_KASAN_SW_TAGS_IDENTIFY to
> >     CONFIG_KASAN_TAGS_IDENTIFY
> >   kasan: integrate the common part of two KASAN tag-based modes
> >   kasan: add memory corruption identification support for hardware
> >     tag-based mode
> 
> I think this looks fine, thank you for your efforts. How did you test
> this? Did you run the lib/test_kasan module with both SW_TAGS and
> HW_TAGS mode? I was about to run that before adding my Reviewed-by.

Thanks for the reminder.
Yes, I run the lib/test_kasan module with SW_TAGS and HW_TAGS mode. :)

> 
> Andrey, Alex, if you have time, please have a quick look at the
> series.
> 
> Thanks,
> -- Marco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
