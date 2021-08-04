Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BD0C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:20:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD3360F14
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDD3360F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kmCPj5wi22no1vrAKRMF/0Zq1d3C4TtCLYxnHNTOvY=; b=iD6kaB/71UHQNh
	zAd3FyUEEcx+2Nqs3Kgoo0dc0Ya0M6q8oJl7xiLulbSvlYsPivBsfIajlMYemOJwCrtgpNXgL2lpe
	V4lHGP6e/5o6T/xzehp1FtkbteoYM0qGP5YB147BEQHwz9eROCDNWLK5esNjG4ihAIt0+rx3brjdC
	5GWynKKhoPv356rXferREJ6HCNckVEpcAoKfPU4JFsqawhxuki9AXUeh99Jh2y5zKOJBkZuAI5NJ5
	weOAdtFoNilbxRFn+tHmBUSkNv8XTM+RyG8GHwJJnocfno8JTeBjok42N0ZAdB4k2vDQQdcypJtdr
	5VTSsMh9sKFZi394IYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBD4o-005O2j-5N; Wed, 04 Aug 2021 09:20:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCtv-005K9N-CQ; Wed, 04 Aug 2021 09:09:24 +0000
X-UUID: 0de7b57dee894933bbf5616ff17b3240-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZfWcoCPDwKOGCJtFhr1e1qhJiHIkyO0ox6qkE+5EVlw=; 
 b=KZGWTiBRHrdRp7F4xr7PKEIeChMDpifloiO3sH6kGBxIy5aEhz70DBKWt3tfuw1pPNovzWIRpttRY2bIUxtIs5Tiq3l8bUmaBMkCvx7FCuJM10Ovgy7vVV+C9Ku/V/2doB+DPnC08n6XUh0SiSKmvKbQSn/8gNLUJsTxqSUUGvI=;
X-UUID: 0de7b57dee894933bbf5616ff17b3240-20210804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 330209592; Wed, 04 Aug 2021 02:09:19 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 01:59:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 16:59:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Aug 2021 16:59:42 +0800
Message-ID: <27f393ad9a926a96bfb9291b21cdd2a86ada2d4d.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] kasan, slub: reset tag when printing address
From: kuan.ying lee <kuan-ying.lee@mediatek.com>
To: Marco Elver <elver@google.com>
CC: Nicholas Tang <nicholas.tang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Chinwen Chang
 <chinwen.chang@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>,
 <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <kuan-ying.lee@mediatek.com>
Date: Wed, 4 Aug 2021 16:59:42 +0800
In-Reply-To: <CANpmjNMAw=rcp_V+G_vjRjArj+09AkOxtC+wUNs-e1RRvfQm6w@mail.gmail.com>
References: <20210804082230.10837-1-Kuan-Ying.Lee@mediatek.com>
 <20210804082230.10837-3-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNMAw=rcp_V+G_vjRjArj+09AkOxtC+wUNs-e1RRvfQm6w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_020923_471104_4F7740D7 
X-CRM114-Status: GOOD (  25.21  )
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

On Wed, 2021-08-04 at 10:41 +0200, Marco Elver wrote:
> On Wed, 4 Aug 2021 at 10:23, Kuan-Ying Lee <
> Kuan-Ying.Lee@mediatek.com> wrote:
> > 
> > The address still includes the tags when it is printed.
> > With hardware tag-based kasan enabled, we will get a
> > false positive KASAN issue when we access metadata.
> > 
> > Reset the tag before we access the metadata.
> > 
> > Fixes: aa1ef4d7b3f6 ("kasan, mm: reset tags when accessing
> > metadata")
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > Suggested-by: Marco Elver <elver@google.com>
> 
> Note, in this case Suggested-by is inappropriate, because I did not
> suggest the change in any way (you already had it in v1). I just
> commented on the fact that it's missing a Fixes so stable can pick it
> up and some clarification.
> 
> Reviewed-by: Marco Elver <elver@google.com>

Got it.
I will remove it on v3.
Thanks.

> 
> > ---
> >  mm/slub.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index b6c5205252eb..f77d8cd79ef7 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -576,8 +576,8 @@ static void print_section(char *level, char
> > *text, u8 *addr,
> >                           unsigned int length)
> >  {
> >         metadata_access_enable();
> > -       print_hex_dump(level, kasan_reset_tag(text),
> > DUMP_PREFIX_ADDRESS,
> > -                       16, 1, addr, length, 1);
> > +       print_hex_dump(level, text, DUMP_PREFIX_ADDRESS,
> > +                       16, 1, kasan_reset_tag((void *)addr),
> > length, 1);
> >         metadata_access_disable();
> >  }
> > 
> > --
> > 2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
