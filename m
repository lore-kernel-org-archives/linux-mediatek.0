Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADC1C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 07:43:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F38A6121F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F38A6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYUXuxX32sar0XPC1V3C2N0j1Fwl0WCUqmyg/x7FL80=; b=1DvEQvkysPlxqk
	JV5WZjfRkwnP6N+HZoZqLZGdkM4bWiyzf9xezqn4v+ekh7+I6M6ZUZYfL/7cmZgPHm5QrW9k5EtHN
	iTSbSlbEpyN4IasmT+UPITEk6PBfbKeTy2QBFgqDwcg9pKEd9ChcKsr78lARiUIPMNddP9Akaw1eS
	XuiJ/yUv0/uD6JsqZVGU3j+jyM8j3/sRn8VKra/V8S4L66dhV8ANT3nwdgXA8e0S5f4UwzpqaZeUQ
	MABB23y85dki8PFwuOpiRYBh4pCe9yidu9HYnXiCUCtzlMJqgYUBIcFzFuixV7rE8zTERq+q4NB+A
	WV99EuqJny7M3orPe1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9v2-0027Pi-7m; Mon, 07 Jun 2021 07:43:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9um-0027Ln-H8; Mon, 07 Jun 2021 07:43:20 +0000
X-UUID: 9bdd208523ca46b0a3c48850ea3ef4e5-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h6prAWjSyLjGF9lOk/oGWMIVO0M5vUecstvoy/92VI0=; 
 b=aeT17EABx3gNxjgFNXFL0YCabMWk7kQoIWsS5lc05wp9muT52xLuWWLIMDPwuA27KVBQwwY6PA/ZenwjU+lojfuvUaT/tVG2oYJrlge8NEKrvI0eVQoZYkF1oLtXvjb6BdL+wCc5AMjRd/XqX5l6FoNmdYGJRkR1de4udD93abA=;
X-UUID: 9bdd208523ca46b0a3c48850ea3ef4e5-20210607
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1766516022; Mon, 07 Jun 2021 00:43:13 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 00:43:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 15:42:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 15:42:58 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <ardb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, <rostedt@goodmis.org>,
 <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date: Mon, 7 Jun 2021 15:42:58 +0800
Message-ID: <20210607074258.32322-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMj1kXFPuWLkORrT4YUfoKZ6+SsLRjxdNM91iff4SJj2jgWa8A@mail.gmail.com>
References: <CAMj1kXFPuWLkORrT4YUfoKZ6+SsLRjxdNM91iff4SJj2jgWa8A@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_004316_605291_46455B55 
X-CRM114-Status: GOOD (  38.82  )
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

> On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> >
> > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > >
> > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > >
> > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > >
> > > > Section Headers:
> > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > >
> > >
> > > A RELA section's r_info field points to the section to which it
> > > applies. This is why in the example above section #65522 points to
> > > section #65521. This has nothing to do with the numerical value of
> > > SHN_ABS.
> >
> > If the r_info of RELA section is 65521(0xfff1),

Oh sorry, I mean sh_info here.

> > find_secsym_ndx() will use it to find the base symbol.
> >
>
> But what does that have to do with the sh_info field of the RELA
> section's Elf_Shdr struct? IOW, what is the relevance of section
> #65521 here?
>

So what I mean is the problem occur if the sh_info of a RELA section
is #65521.

> > And in the symbol search loop in find_secsym_ndx(), get_symindex will
> > return 0xfff1 if the symbol is in ABS section.
> >
> > In this case, find_secsym_ndx() will return a absolute symbol as
> > base, which won't be relocate, if an ABS symbol is found before the
> > real symbol in section 65521.
> >
>
> I see your point here.
>
> > >
> > > > find_secsym_ndx, which use r_info in rela section to find the reference

sh_info.

> > > > symbol, may take ABS symbol as base.
> > > >
> > > > Symbol table '.symtab' contains 453285 entries:
> > > >    Num:    Value          Size Type    Bind   Vis       Ndx Name
> > > >      6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count
> > > >
> > > > Which cause an invalid address in __mcount_loc.
> > > >
> > >
> > > Could you give a better account of the error you are trying to address?
> > >
> > > Also, arm64 no longer defines a section_count symbol (since v5.11), so
> > > please make sure that the diagnostics of the issue you are addressing
> > > are accurate for mainline.
> > >
> >
> > My kernel version is 5.4.61.
> > But as I explained, I suppose mainline also have this issue.
> >
>
> Mainline is what we work on. So please base your changes (and your
> commit log) on mainline.
>

I understand it.
But the platform I can reproduce the problem is only support to 5.4 LTS now.
And port it to the latest mainline kernel have much more work to do, can I just
keep this commit log? Or just remove the example I posted in the commit messsage?

>
> > >
> > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > ---
> > > >  scripts/recordmcount.h | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > > > index f9b19524da11..9b69167fb7ff 100644
> > > > --- a/scripts/recordmcount.h
> > > > +++ b/scripts/recordmcount.h
> > > > @@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
> > > >         for (symp = sym0, t = nsym; t; --t, ++symp) {
> > > >                 unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
> > > >
> > > > +               /* avoid absolute symbols */
> > > > +               if (symp->st_shndx == SHN_ABS)
> > > > +                       continue;
> > > > +
> > > >                 if (txtndx == get_symindex(symp, symtab, symtab_shndx)
> > > >                         /* avoid STB_WEAK */
> > > >                     && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
