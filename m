Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EE5C47094
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 10:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFEA2611ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 10:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFEA2611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGGlFOuX9ocQc3u+bIZGiBEM9gbP+AsIf4iMiF1BwSI=; b=kAQBMJbq3fSD8K
	fxKszi56peG/M5fqP270dFtvn3h0OXOSpiFnkL3FAHWbEML9Qipk/pclkiLz77z01j1KvXyV66MJx
	lj8Xqy11yIGYFHiWjQlczPhKNzHf4ufD4ugWoBI4GzmNOqILIK6BS2AdyR+ce6EQlDCI1l6Mam307
	MrYG20wIZ5yiKzZXIAUqDda3UIiW9yUDfXICTE2uuEecOKzWGghkhy651+72ahua+0YFVyad9bI5B
	N5qUViL0HhgF1cLDLflYdN+cp0t406waTZcFCl/mk/PofpKVzg9csXjsL44n3u6NcBx8DPuxyt1qY
	1gR9ETr9IYsiWAO50ENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqCmL-0032qW-Nw; Mon, 07 Jun 2021 10:46:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqCYq-002wlc-K1; Mon, 07 Jun 2021 10:32:54 +0000
X-UUID: a87a3d8a7b6c432db9fee9c31c582b29-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=L0EFW/qMoI2eFF2KBENUk2nHfBxRyK3VOzw/0Qr6REA=; 
 b=bRX3vNHukJdMXvuCbMNSjFFNCyuttwsgDgVhYIK0y6SZoExJUM5JFqxyDHpdjss+8MLkjLguJCQewELJ332Btabb2jLTZ+MRzWrfeCpdJ3SmCXZqyJdO0eQpjP8g3uu+iqszkiSmBD1kGT0nFXoyb1t1SFceUbBs3f1An8ANGu0=;
X-UUID: a87a3d8a7b6c432db9fee9c31c582b29-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1575699260; Mon, 07 Jun 2021 03:32:45 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 03:32:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 18:32:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 18:32:42 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <ardb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-toolchains@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, <rostedt@goodmis.org>,
 <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date: Mon, 7 Jun 2021 18:32:42 +0800
Message-ID: <20210607103242.2480-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
References: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_033250_138307_41CF54F8 
X-CRM114-Status: GOOD (  47.06  )
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

> On Mon, 7 Jun 2021 at 10:06, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> >
> > > > On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > >
> > > > > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > > >
> > > > > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > > > > >
> > > > > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > > > > >
> > > > > > > Section Headers:
> > > > > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > > > > >
> > > > > >
> > > > > > A RELA section's r_info field points to the section to which it
> > > > > > applies. This is why in the example above section #65522 points to
> > > > > > section #65521. This has nothing to do with the numerical value of
> > > > > > SHN_ABS.
> > > > >
> > > > > If the r_info of RELA section is 65521(0xfff1),
> > >
> > > Oh sorry, I mean sh_info here.
> > >
> > > > > find_secsym_ndx() will use it to find the base symbol.
> > > > >
> > > >
> > > > But what does that have to do with the sh_info field of the RELA
> > > > section's Elf_Shdr struct? IOW, what is the relevance of section
> > > > #65521 here?
> > > >
> > >
> > > So what I mean is the problem occur if the sh_info of a RELA section
> > > is #65521.
> >
> > Actually the problem occur if the sh_info of a RELA section is in
> > the special section index range(SHN_LORESERVE ~ SHN_HIRESERVE).
> > Maybe I should add a is_shndx_special() to check this like
> > scripts/mod/modpost.h did?
> >
>
> So if I understand all of this correctly, we are running into a
> fundamental issue here, where the linker emits more sections than the
> sh_info field can describe, overflowing into the reserved range.

Actually the problem is about comparing st_shndx and sh_info.

When the st_shndx is larger than SHN_LORESERVE, the linker mark
it as SHN_XINDEX, and get_symindex() will handle it.

But sh_info for a RELA section take the actual shndx which may
be in the reserved range.
So I suppose before compare the sh_info and st_shndx,
we need to do more check in find_secsym_ndx().

>
> I don't think papering over it like this is going to be maintainable
> going forward.
>

Do you have suggestion for how to deal with this problem?

>
>
> > >
> > > > > And in the symbol search loop in find_secsym_ndx(), get_symindex will
> > > > > return 0xfff1 if the symbol is in ABS section.
> > > > >
> > > > > In this case, find_secsym_ndx() will return a absolute symbol as
> > > > > base, which won't be relocate, if an ABS symbol is found before the
> > > > > real symbol in section 65521.
> > > > >
> > > >
> > > > I see your point here.
> > > >
> > > > > >
> > > > > > > find_secsym_ndx, which use r_info in rela section to find the reference
> > >
> > > sh_info.
> > >
> > > > > > > symbol, may take ABS symbol as base.
> > > > > > >
> > > > > > > Symbol table '.symtab' contains 453285 entries:
> > > > > > >    Num:    Value          Size Type    Bind   Vis       Ndx Name
> > > > > > >      6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count
> > > > > > >
> > > > > > > Which cause an invalid address in __mcount_loc.
> > > > > > >
> > > > > >
> > > > > > Could you give a better account of the error you are trying to address?
> > > > > >
> > > > > > Also, arm64 no longer defines a section_count symbol (since v5.11), so
> > > > > > please make sure that the diagnostics of the issue you are addressing
> > > > > > are accurate for mainline.
> > > > > >
> > > > >
> > > > > My kernel version is 5.4.61.
> > > > > But as I explained, I suppose mainline also have this issue.
> > > > >
> > > >
> > > > Mainline is what we work on. So please base your changes (and your
> > > > commit log) on mainline.
> > > >
> > >
> > > I understand it.
> > > But the platform I can reproduce the problem is only support to 5.4 LTS now.
> > > And port it to the latest mainline kernel have much more work to do, can I just
> > > keep this commit log? Or just remove the example I posted in the commit messsage?
> > >
> > > >
> > > > > >
> > > > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > > > ---
> > > > > > >  scripts/recordmcount.h | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > > > > > > index f9b19524da11..9b69167fb7ff 100644
> > > > > > > --- a/scripts/recordmcount.h
> > > > > > > +++ b/scripts/recordmcount.h
> > > > > > > @@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
> > > > > > >         for (symp = sym0, t = nsym; t; --t, ++symp) {
> > > > > > >                 unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
> > > > > > >
> > > > > > > +               /* avoid absolute symbols */
> > > > > > > +               if (symp->st_shndx == SHN_ABS)
> > > > > > > +                       continue;
> > > > > > > +
> > > > > > >                 if (txtndx == get_symindex(symp, symtab, symtab_shndx)
> > > > > > >                         /* avoid STB_WEAK */
> > > > > > >                     && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
> > >
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
