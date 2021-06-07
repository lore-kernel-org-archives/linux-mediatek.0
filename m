Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB66C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 13:45:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A2061185
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 13:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A2061185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8f6hsG/QY/DaW9nKCiwzUBHilEYeiFogidPMAcHpwnc=; b=G6oY1n0Y9vMfiH
	x5oLXJszDHj9NjeepDhPtncMPyWCSWeG2kHTSR/sC59z4uJQCs5onL2+iuLsAN5ciVGcF/TzGDs3M
	dcrrkM3Or3T+gz6Ytueq/8BoTQoQJ7PIyhdF9R35lPi0qHQtiGXgwqPCRPTmU8ChFSqrj4zm9tzJO
	b1IBcyze2yZzO0z6iE5+oC4EClp7dvFevSRVvoFHsphqYGBIcwjtC/yGOqUai2g7w37hKpPMZVCCJ
	cwCJjYi0Um7u+bgrEHmpnjMqSWDCd8QUottv2XGua+pFbYYKf6zH9dm3tnlygE+ud3wMOeYilu2Iy
	dNBdGuXQ7F4pQ1klLf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqFYq-003uPq-1m; Mon, 07 Jun 2021 13:45:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqFYS-003u8G-9b; Mon, 07 Jun 2021 13:44:40 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2EBF61001;
 Mon,  7 Jun 2021 13:44:34 +0000 (UTC)
Date: Mon, 7 Jun 2021 09:44:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Mark-PK Tsai
 <mark-pk.tsai@mediatek.com>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>, linux-toolchains@vger.kernel.org, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Helsley
 <mhelsley@vmware.com>, Sami Tolvanen <samitolvanen@google.com>,
 yj.chiang@mediatek.com
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Message-ID: <20210607094433.473100d9@oasis.local.home>
In-Reply-To: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
References: <20210607074258.32322-1-mark-pk.tsai@mediatek.com>
 <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
 <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
 <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_064436_399246_EE1119A9 
X-CRM114-Status: GOOD (  25.25  )
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

On Mon, 7 Jun 2021 13:44:21 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

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
> objtool seems to use shndx 0. A matching recordmcount patch would be
> something like this.

Mark-PK,

Does the below patch fix it for you too (if you backport it to your
kernel). I much rather have recordmcount match objtool, as one day the
two will hopefully merge to one executable.

-- Steve


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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
