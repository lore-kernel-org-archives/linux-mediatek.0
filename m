Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E35EC4743F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 07:08:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53505610E7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 07:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53505610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdUjlOJTh99W29O0RxtOTYR3h+yZXpMqIdUJB+gfcrc=; b=Uj1JQcOeJf3BRG
	99b+LLMGarojERpdmHA5YdkTMfykgJPE07xrbcD06UBroOtBJvQ8g1jula9aPcTH7jqGiL0omVA1k
	GMNy/tiU919TdfdJ+WoKWqKQAggELDQBp8DkBeYMBwf+7AEX8LQ/hw2dM9Gs3SyHStYPXGdV/J0EI
	9ONnP+8OmRBXullNHyIh08W7Okofo7lIjzIywdbDt9ijXUl5zqmT8CaKmoPd/NFiw5fhyQgR947Dz
	2K7KxFnO9hhKt0rSoYzkmWZ70aMj5TwXZ21CtYW+dOP7Z4wHufCNQT2hS9ZFIsJBFTiXJnDqhJ4nH
	ztAi/bAitaIvwneLTMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9NC-001utz-1F; Mon, 07 Jun 2021 07:08:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9MH-001uYF-FK; Mon, 07 Jun 2021 07:07:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 223396121F;
 Mon,  7 Jun 2021 07:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623049657;
 bh=LCovMA/WpeQPLJl1EPHBeVn/zjZbOdOtdU0vdT8DZj0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AtT06Y8yIh0AbQlnWPYo7E1SKNDG5mobSDsxs7sJsCjpw7lP0QzfLfJwquZcPcSnn
 kM7mQz4XCFgt2c+CUxGm1TpkXn65UrGK14g54Le21/MGMK4kKHddEsWzjltQv8xzR1
 di7fRXwVT1+PBlSMp4PEZPMDXvKbZlCAXSeJceJHVIzWRGVGoHOQfs46yO1DaSArSL
 VWQRoD3Kgwp9BaqyCUmNaLWj5RKpBqGfbRNsseapJjUtgjaxKEkbIExBf4JtjDruj9
 UYq/KwEPgoIqq4VpbnSRQ8ZPa1j93w5Iv6A8oH8va9T5gqSq9LooQ7vrLvvGIBv4wg
 7Bya1a+zXESNA==
Received: by mail-oo1-f54.google.com with SMTP id
 q20-20020a4a6c140000b029024915d1bd7cso2244760ooc.12; 
 Mon, 07 Jun 2021 00:07:37 -0700 (PDT)
X-Gm-Message-State: AOAM531AwOu3iWdHNX745OKMW909/VRoTedHdVutMbGQKJWD2m03/x6w
 m7jzb0/k5nFdgR+y7fYXccBVcdG4jVYELvVCNiA=
X-Google-Smtp-Source: ABdhPJy2kCYQwYjG0i1qYY2Ghb3U7Iy0TlG9MoCIcwelicr5YR1d2V/ah5ArlyZhVDqIf6fNCY6OKIyDR07ilfIwt5w=
X-Received: by 2002:a4a:8706:: with SMTP id z6mr12433560ooh.41.1623049656460; 
 Mon, 07 Jun 2021 00:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXE3faN7nSSdoSU=ed+OPruefD_vJuhyRnsMuNiRygZZbg@mail.gmail.com>
 <20210607065948.31632-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210607065948.31632-1-mark-pk.tsai@mediatek.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 7 Jun 2021 09:07:25 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFPuWLkORrT4YUfoKZ6+SsLRjxdNM91iff4SJj2jgWa8A@mail.gmail.com>
Message-ID: <CAMj1kXFPuWLkORrT4YUfoKZ6+SsLRjxdNM91iff4SJj2jgWa8A@mail.gmail.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Helsley <mhelsley@vmware.com>, 
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 Sami Tolvanen <samitolvanen@google.com>, yj.chiang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_000737_584140_75F25CB6 
X-CRM114-Status: GOOD (  32.11  )
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

On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > >
> > > Avoid using ABS symbol, which won't be relocate, as reference.
> > >
> > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > >
> > > Section Headers:
> > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > >
> >
> > A RELA section's r_info field points to the section to which it
> > applies. This is why in the example above section #65522 points to
> > section #65521. This has nothing to do with the numerical value of
> > SHN_ABS.
>
> If the r_info of RELA section is 65521(0xfff1),
> find_secsym_ndx() will use it to find the base symbol.
>

But what does that have to do with the sh_info field of the RELA
section's Elf_Shdr struct? IOW, what is the relevance of section
#65521 here?

> And in the symbol search loop in find_secsym_ndx(), get_symindex will
> return 0xfff1 if the symbol is in ABS section.
>
> In this case, find_secsym_ndx() will return a absolute symbol as
> base, which won't be relocate, if an ABS symbol is found before the
> real symbol in section 65521.
>

I see your point here.

> >
> > > find_secsym_ndx, which use r_info in rela section to find the reference
> > > symbol, may take ABS symbol as base.
> > >
> > > Symbol table '.symtab' contains 453285 entries:
> > >    Num:    Value          Size Type    Bind   Vis       Ndx Name
> > >      6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count
> > >
> > > Which cause an invalid address in __mcount_loc.
> > >
> >
> > Could you give a better account of the error you are trying to address?
> >
> > Also, arm64 no longer defines a section_count symbol (since v5.11), so
> > please make sure that the diagnostics of the issue you are addressing
> > are accurate for mainline.
> >
>
> My kernel version is 5.4.61.
> But as I explained, I suppose mainline also have this issue.
>

Mainline is what we work on. So please base your changes (and your
commit log) on mainline.


> >
> > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > ---
> > >  scripts/recordmcount.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > > index f9b19524da11..9b69167fb7ff 100644
> > > --- a/scripts/recordmcount.h
> > > +++ b/scripts/recordmcount.h
> > > @@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
> > >         for (symp = sym0, t = nsym; t; --t, ++symp) {
> > >                 unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
> > >
> > > +               /* avoid absolute symbols */
> > > +               if (symp->st_shndx == SHN_ABS)
> > > +                       continue;
> > > +
> > >                 if (txtndx == get_symindex(symp, symtab, symtab_shndx)
> > >                         /* avoid STB_WEAK */
> > >                     && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
