Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F963C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 08:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436576124E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 08:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 436576124E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSuKlqb1zG1TblCMvQyOHYZRd0KhrmuioMLiB92LZk0=; b=aScID+9x5YW8WL
	/9IC7kl5bFEZ7c8O3MlMjdKKBATRNqdKY2jXu6LQt92g10pc5xOlf2iKNoVL8FRVfZzmt007/5iJi
	wqVbO1nMVrGN37kCvs+H8I5iQXiZRqIlv6Z/RzG48phfsybcCgTnViDqkzuwFtgnQcX5jJziFD2G2
	UqTw5SoZYKNxh27DLQWbv7C5fTBDVfDlZ9YVoatuBjez/cl4djmGH89vDtV7vu91906RfwCLInmoP
	ToWa/QOVOLqI6hwaRnQzi+LOHr8ZHhnIvz2sHy243oAh3mArwG0Vke1bJLRgGbc6hThC1NtoF5fWU
	JM8BuKGlyBad4wxICRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8IrV-00E8Sd-5O; Tue, 27 Jul 2021 08:54:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8IrA-00E8Lu-Bh; Tue, 27 Jul 2021 08:54:35 +0000
X-UUID: 7a85bd6614b14bee93abe6344cd283b3-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pHkaLI0XXjme0KOzVJgZfcROjWi4O4Qvm9FSQ9EMZ7I=; 
 b=Sbgx3enf0EGT3B4yyFLD4EiGmCuBrFwdklEtlVkBhlf5pMOz2Umo/V3/oHmr4xrlsGCC5RN78xNYD563nawA9efyxaIMLsMAaG1pIikxDYJ9nh0dJLQwwgTHFyaxIVOvNspM1ZH/6pSih3GQ7QnccD2Kn6h2WYGk2u4V5JEuOeI=;
X-UUID: 7a85bd6614b14bee93abe6344cd283b3-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 254181671; Tue, 27 Jul 2021 01:54:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 01:54:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 16:54:27 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Jul 2021 16:54:27 +0800
Message-ID: <77ecf897408ab1022bd7fd879b8708e99c479cd9.camel@mediatek.com>
Subject: Re: [PATCH 2/2] kasan, mm: reset tag for hex dump address
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Marco Elver <elver@google.com>
CC: Nicholas Tang <nicholas.tang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Morton
 <akpm@linux-foundation.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Kuan-Ying.Lee@mediatek.com>
Date: Tue, 27 Jul 2021 16:54:26 +0800
In-Reply-To: <CANpmjNNOkCspsf4=gPLLw=29vtv4qEDaErB1i1sz-p+bzLxNKg@mail.gmail.com>
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-3-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNNOkCspsf4=gPLLw=29vtv4qEDaErB1i1sz-p+bzLxNKg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_015432_473799_EC902831 
X-CRM114-Status: GOOD (  28.31  )
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

On Tue, 2021-07-27 at 09:20 +0200, Marco Elver wrote:
> On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <
> Kuan-Ying.Lee@mediatek.com> wrote:
> > 
> > Text is a string. We need to move this kasan_reset_tag()
> > to address but text.
> > 
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> 
> This patch also makes sense (I think), thanks for sending. But it's
> unclear what the problem is. The fact that when the address is
> printed
> it still includes the tag? Or a false positive?
> It'd be good to clarify in the commit message.

Yes, printed address includes the tag, so when we access the
metadata, we will encounter tag mismatch with HW tag-based kasan
enabled.

> 
> Here I'd also use a more descriptive patch title, something like
> "kasan, slub: reset tag when printing address".
> 
> Also, I think this patch requires a:
> 
>   Fixes: aa1ef4d7b3f6 ("kasan, mm: reset tags when accessing
> metadata")
> 
> So that stable kernels can pick this up if appropriate.

Thank you, Marco.
I will refine commit message in the v2.

> 
> > ---
> >  mm/slub.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 6dad2b6fda6f..d20674f839ba 100644
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
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit 
> > https://urldefense.com/v3/__https://groups.google.com/d/msgid/kasan-dev/20210727040021.21371-3-Kuan-Ying.Lee*40mediatek.com__;JQ!!CTRNKA9wMg0ARbw!13XOuYbzPQrBvIDMNbrT7vm8RGc56Oqr402PDfQRDmHrrBsujrZUr7O9q24JeDJ_3NlWSQ$
> >  .
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
