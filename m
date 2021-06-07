Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E7BC47094
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 15:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAC761159
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 15:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CAC761159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqqwQr8pv8T84lq7bh95xAJOqWirzbKeAYNkYrc2AMY=; b=HXjQrgVzVNy1e6
	Ba6q11D83qcDvYBE2pz7lN4QcVfUf2GnxAfkIzy4y8gdGiFovRuHuMo7vMV1PvAvSF386LcasBg8a
	oDIweEHnrXBh+qEkyVvMgfXsUYUx8kgfVVTZCHTuByJsJotOdvJwWuzxj4KbMVTDnhkIowKnH4YAN
	OSTAJn/KBR/V5lql8oCuxb42x5K4yADDUToeWSL/MZNdsfdt89knKkSmcUjcchRGVYiu5Qh9EmKeG
	VS7moXQ6jomXeMIQNVprO6WethaF4lAMNHcpiBJ6f85qrTgk26GxT83kK6Ex6WrakCaunbLI1Vmpz
	OFx48s4LSea1iqCS6V9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqHMq-004Ikp-E6; Mon, 07 Jun 2021 15:40:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqHMe-004IhK-9z; Mon, 07 Jun 2021 15:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=F13xOnM5F0Ufs2TOCg78ImeKaTi/MppD+Ee/8+ZOVI8=; b=P529/dNw+gMsYw/hfuMVAoBCZp
 ROKU97uFOlzFU6oKNahA9xz/5nFZSMQP5EHsm5/e22V+QmLx57Y4AobtI/h3WFwElZfw/N8ITwxhl
 t5jabZ/6vbWvAvEb3x48iqorZj9Fhvc+D//RL/1vah+pZ8bxlZ43SJrCQKlNNsCl1LMWbaPr6MSzb
 ux5T/zJULURJ5LWCjiB0eZwU4fP3XSK30JwHeOCXT5DJlrB0+2lH8JdXZKRVEYgNyDFoONRWNiGFY
 uJvDzD7E3dSz3VF5dMKzVcP8pg34INJdmmI2uLDRGkPTWUccRVFc0MCDR+5M0FknIUxy5iFDyxoP/
 AVwrnxEA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lqHMK-00FxAA-6M; Mon, 07 Jun 2021 15:40:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8A91E3001E3;
 Mon,  7 Jun 2021 17:40:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 774F82D6A737A; Mon,  7 Jun 2021 17:40:11 +0200 (CEST)
Date: Mon, 7 Jun 2021 17:40:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-toolchains@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matt Helsley <mhelsley@vmware.com>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 Sami Tolvanen <samitolvanen@google.com>, yj.chiang@mediatek.com
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Message-ID: <YL492/4WrWaNDL4p@hirez.programming.kicks-ass.net>
References: <20210607074258.32322-1-mark-pk.tsai@mediatek.com>
 <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
 <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
 <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
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

On Mon, Jun 07, 2021 at 01:44:21PM +0200, Peter Zijlstra wrote:
> One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> SHN_XINDEX, then use .symtab_shndx.
> 
> Apparently you've found a case where neither is true? In that case
> objtool seems to use shndx 0. A matching recordmcount patch would be
> something like this.
> 

Apparently I'm consistently bad at spelling SHM_UNDEF today..

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
