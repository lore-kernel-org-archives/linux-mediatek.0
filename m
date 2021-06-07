Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07611C47094
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 13:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF166100B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 13:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF166100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHqKfYoQtm3QoXuj2BAGKVjmRB53Nl5C5WM1xqvdv2M=; b=mlr5jPV+jr5beT
	RVUbRI2BoBuLXZtqOHruI/jbIZkM/ezo8flgJXUe1lqAdomQqec0hLAlmqMlCR3w2G0mQmdESRJRe
	724eGKkLC20vIU11jW3eWf6AtCHEwreGCvttEQsUbonawqqlzM6m/E4ic5oadBZSM4IX/8lfvUvIP
	kZ5JIOEPzNrIMupsCloQnCtdHAa3CPYbRVf1e6z8+KEVKY8iJe+RotnF4x2gbXINSCBQWOsGRNtZA
	ILvRYFujanr82wekBnjxRa87qNg+qGipMOBl1FzfH6c+4ZkzaOEyqeWvTQa9tC3HDwxz0QGhPiGUP
	x1tZui+cs5J7EZ3dWpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqF9o-003kQT-IY; Mon, 07 Jun 2021 13:19:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqF9f-003kLO-5z; Mon, 07 Jun 2021 13:19:04 +0000
X-UUID: 3ace10ddcfe944a3a16864300da0c167-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3hyyIOpV3O780eopkVWQ0PAK9edb3gbqUdK9v07TkLE=; 
 b=Sysj8Ky4d+twyFwVMGyY7XeXca7+422ZdJJyAFYUndqXNW77+okW0tH9RF6xz/TTxHDnlENEFGeyphIKHeEeNzYkuzf93AYnR09+UIIqrEXMMv9MJiH57qEIFD8WYPZTC8At+HC1ruxzUXNnFnj1JfUwewtBWFMsBezsN3zylUE=;
X-UUID: 3ace10ddcfe944a3a16864300da0c167-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 654289907; Mon, 07 Jun 2021 06:18:54 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 06:18:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 21:18:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 21:18:45 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <peterz@infradead.org>
CC: <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-toolchains@vger.kernel.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, 
 <rostedt@goodmis.org>, <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date: Mon, 7 Jun 2021 21:18:45 +0800
Message-ID: <20210607131845.3118-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
References: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_061859_287680_2BD587D8 
X-CRM114-Status: GOOD (  37.85  )
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

> On Mon, Jun 07, 2021 at 11:50:40AM +0200, Ard Biesheuvel wrote:
> > On Mon, 7 Jun 2021 at 10:06, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > >
> > > > > On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > >
> > > > > > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > > > >
> > > > > > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > > > > > >
> > > > > > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > > > > > >
> > > > > > > > Section Headers:
> > > > > > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > > > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > > > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > > > > > >
> > > > > > >
> > > > > > > A RELA section's r_info field points to the section to which it
> > > > > > > applies. This is why in the example above section #65522 points to
> > > > > > > section #65521. This has nothing to do with the numerical value of
> > > > > > > SHN_ABS.
> > > > > >
> > > > > > If the r_info of RELA section is 65521(0xfff1),
> > > >
> > > > Oh sorry, I mean sh_info here.
> > > >
> > > > > > find_secsym_ndx() will use it to find the base symbol.
> > > > > >
> > > > >
> > > > > But what does that have to do with the sh_info field of the RELA
> > > > > section's Elf_Shdr struct? IOW, what is the relevance of section
> > > > > #65521 here?
> > > > >
> > > >
> > > > So what I mean is the problem occur if the sh_info of a RELA section
> > > > is #65521.
> > >
> > > Actually the problem occur if the sh_info of a RELA section is in
> > > the special section index range(SHN_LORESERVE ~ SHN_HIRESERVE).
> > > Maybe I should add a is_shndx_special() to check this like
> > > scripts/mod/modpost.h did?
> > >
> >
> > So if I understand all of this correctly, we are running into a
> > fundamental issue here, where the linker emits more sections than the
> > sh_info field can describe, overflowing into the reserved range.
> >
> > I don't think papering over it like this is going to be maintainable
> > going forward.
>
> There's an extended section header index section for just that. And
> recordmcount actually seems to use that as well.
>
> I can't seem to find enough of the thread to figure out what the actual
> problem is though. The lore archive doesn't have anything prior to this
> message.
>
> One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> SHN_XINDEX, then use .symtab_shndx.
>
> Apparently you've found a case where neither is true? In that case

Yes, that's what my mean.
get_symindex returns st_shndx directly even if st_shndx is in the reserve range.
So either do not use get_symindex for those symbols or do extra handling
for it like the patch you provide will solve the problem.

> objtool seems to use shndx 0. A matching recordmcount patch would be
> something like this.
>
>
> diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> index f9b19524da11..d99cc0aed6fe 100644
> --- a/scripts/recordmcount.h
> +++ b/scripts/recordmcount.h
> @@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
>  	unsigned long offset;
>  	int index;
>
> -	if (sym->st_shndx != SHN_XINDEX)
> +	if (sym->st_shndx > SHN_UDEF &&
> +	    sym->st_shndx < SHN_LORESERVE)
>  		return w2(sym->st_shndx);
>
> -	offset = (unsigned long)sym - (unsigned long)symtab;
> -	index = offset / sizeof(*sym);
> +	if (sym->st_shndx == SHN_XINDEX) {
> +		offset = (unsigned long)sym - (unsigned long)symtab;
> +		index = offset / sizeof(*sym);
>
> -	return w(symtab_shndx[index]);
> +		return w(symtab_shndx[index]);
> +	}
> +
> +	return 0;
>  }
>
>  static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)

Thanks for the suggestion.
Skip all the symbols in the special sections seems fine because
those sections should not be processed here.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
