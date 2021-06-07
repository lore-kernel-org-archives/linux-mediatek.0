Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F384DC47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 10:31:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C6F6105A
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 10:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C6F6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VI/tG+LHKCUyJE/GEnuC2nwLVSRA8k4hglMmc/+P4ck=; b=o0x4nhguAC2x80
	olgM6ILAPWwc4JmgjJD8EN8Yj3Pknjk2M5r7E9lFz55i7jhy8HkoaYAgCFimYoj5kPn4U2Y/c4Vvt
	V6Tt2216VmTFncdiFPMedmvDY5UzDozABoA/lrm30Ld17tELXfZhy8a0I/ITTDkkSpgx1TEGzkGwQ
	9Kb9qnDETXt22DVQhoItr5gKKcQSEtPQRg8q58Bv3dhUEPxEjG4LvFWyKYc2K+btG+J8nxx9KBYLm
	KGD7NGluijyIajY4jG7JUoAlb88ZznyN7jGkWljBF00o/ISk+7JlS4wq7S1lO/mFI4elMgQGbiaXs
	qf4EVg9GIwlbY+QvNdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqCXh-002w2O-SX; Mon, 07 Jun 2021 10:31:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqBuG-002iUC-Ix; Mon, 07 Jun 2021 09:50:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3102E610E7;
 Mon,  7 Jun 2021 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623059452;
 bh=JE9YmLu1XcCh2IdiKUhtfnOei95qmgTeBXzlr2OSs5U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DfpEj+7Jk2U92sWwP3npSY4c5Up9o6rqkZHAdIDdytRl6i4N+gby7GRq/smungUVO
 0vhwLULcopfuk/WqYIcGYUBavLNLrRMQ5xooklERJjzzypO/GUcpVOA9KFha9zO3nA
 QPat5j1no34Vch7tvNC+2/PEojw8p0VMLS19KqySapcSkJmoUtaK0zzgVExj7LI3K1
 zAVqGwAYNRPL9J7cbL5gO/8s1twL1RNlWRatR3Jn6LH2jFS006a3hGXspLzFbfjTkl
 S5hA1Rpllhszmu8M46JCoQJGhrlzIB98REL/dT1bXnyFnO/lSG2xoCrg2E8Gfx0QQc
 J6UsQh7JOTJ4w==
Received: by mail-ot1-f52.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so15043750otu.6; 
 Mon, 07 Jun 2021 02:50:52 -0700 (PDT)
X-Gm-Message-State: AOAM532Kg9IMcT1zs6Z4SBJZ4g/lz3hRpxB7wgJ30hurEdKUTO0TlsDA
 ZlqBGh523PHyQ3p7OvEVeJEC+xkCUrH6ZyaRcyw=
X-Google-Smtp-Source: ABdhPJwBcZO3+EJo10iM+TtSxwhwjmCAV3817RPdz1/FU9dXzT2GEqhh9BNYlRt6h/snGjjy0s4uCKxjFa8oCQ/sXzQ=
X-Received: by 2002:a9d:6d0e:: with SMTP id o14mr6760139otp.90.1623059451515; 
 Mon, 07 Jun 2021 02:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210607074258.32322-1-mark-pk.tsai@mediatek.com>
 <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 7 Jun 2021 11:50:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
Message-ID: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-toolchains@vger.kernel.org
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Helsley <mhelsley@vmware.com>, 
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 Sami Tolvanen <samitolvanen@google.com>, yj.chiang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_025052_700570_AEF916CB 
X-CRM114-Status: GOOD (  45.58  )
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

On Mon, 7 Jun 2021 at 10:06, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> > > On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > >
> > > > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > >
> > > > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > > > >
> > > > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > > > >
> > > > > > Section Headers:
> > > > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > > > >
> > > > >
> > > > > A RELA section's r_info field points to the section to which it
> > > > > applies. This is why in the example above section #65522 points to
> > > > > section #65521. This has nothing to do with the numerical value of
> > > > > SHN_ABS.
> > > >
> > > > If the r_info of RELA section is 65521(0xfff1),
> >
> > Oh sorry, I mean sh_info here.
> >
> > > > find_secsym_ndx() will use it to find the base symbol.
> > > >
> > >
> > > But what does that have to do with the sh_info field of the RELA
> > > section's Elf_Shdr struct? IOW, what is the relevance of section
> > > #65521 here?
> > >
> >
> > So what I mean is the problem occur if the sh_info of a RELA section
> > is #65521.
>
> Actually the problem occur if the sh_info of a RELA section is in
> the special section index range(SHN_LORESERVE ~ SHN_HIRESERVE).
> Maybe I should add a is_shndx_special() to check this like
> scripts/mod/modpost.h did?
>

So if I understand all of this correctly, we are running into a
fundamental issue here, where the linker emits more sections than the
sh_info field can describe, overflowing into the reserved range.

I don't think papering over it like this is going to be maintainable
going forward.



> >
> > > > And in the symbol search loop in find_secsym_ndx(), get_symindex will
> > > > return 0xfff1 if the symbol is in ABS section.
> > > >
> > > > In this case, find_secsym_ndx() will return a absolute symbol as
> > > > base, which won't be relocate, if an ABS symbol is found before the
> > > > real symbol in section 65521.
> > > >
> > >
> > > I see your point here.
> > >
> > > > >
> > > > > > find_secsym_ndx, which use r_info in rela section to find the reference
> >
> > sh_info.
> >
> > > > > > symbol, may take ABS symbol as base.
> > > > > >
> > > > > > Symbol table '.symtab' contains 453285 entries:
> > > > > >    Num:    Value          Size Type    Bind   Vis       Ndx Name
> > > > > >      6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count
> > > > > >
> > > > > > Which cause an invalid address in __mcount_loc.
> > > > > >
> > > > >
> > > > > Could you give a better account of the error you are trying to address?
> > > > >
> > > > > Also, arm64 no longer defines a section_count symbol (since v5.11), so
> > > > > please make sure that the diagnostics of the issue you are addressing
> > > > > are accurate for mainline.
> > > > >
> > > >
> > > > My kernel version is 5.4.61.
> > > > But as I explained, I suppose mainline also have this issue.
> > > >
> > >
> > > Mainline is what we work on. So please base your changes (and your
> > > commit log) on mainline.
> > >
> >
> > I understand it.
> > But the platform I can reproduce the problem is only support to 5.4 LTS now.
> > And port it to the latest mainline kernel have much more work to do, can I just
> > keep this commit log? Or just remove the example I posted in the commit messsage?
> >
> > >
> > > > >
> > > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > > ---
> > > > > >  scripts/recordmcount.h | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > > > > > index f9b19524da11..9b69167fb7ff 100644
> > > > > > --- a/scripts/recordmcount.h
> > > > > > +++ b/scripts/recordmcount.h
> > > > > > @@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
> > > > > >         for (symp = sym0, t = nsym; t; --t, ++symp) {
> > > > > >                 unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
> > > > > >
> > > > > > +               /* avoid absolute symbols */
> > > > > > +               if (symp->st_shndx == SHN_ABS)
> > > > > > +                       continue;
> > > > > > +
> > > > > >                 if (txtndx == get_symindex(symp, symtab, symtab_shndx)
> > > > > >                         /* avoid STB_WEAK */
> > > > > >                     && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
