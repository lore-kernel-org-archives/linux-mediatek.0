Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB32AC48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 15:30:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B1F61185
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 15:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B1F61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDXUgkRsAuTlUvWQYan+5dsG2ChUVXfZ7Ewj7EIN0jo=; b=n+dmhmjpPBAJ8X
	wzwPaO06ooteA9hPSw5Cr+xSsdlTgZoSnbxC0k5DyoKhIr2IEUV9b3mqQ7/Nwprid5RdfVRxJKCB1
	HgwwD1QOTEnmSLWdPqTchHgLfrTnFRzP2ioYJ6osQ636IyQmbQA/5u3L1mUKFik8Ao9Byl8GG2Q63
	lcEtaWabWCbkXbc2jWFb/r3aoUOPdMwka5RcowN9ygMA1OdkU/l0e0HeSGqxFQ4OC/oT/N2xWecRF
	HjCSgiIPY/N17sfpg1XsyIA4lW8wJd5JS/YG6ilNigFEKlxe9w5NxDBsLaVtSr4PC1NtTeWnK7Zx6
	Dyn/gCuViPdVmUYM1zLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltXUj-006tgs-Ak; Wed, 16 Jun 2021 15:30:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltXUS-006tbp-Qj; Wed, 16 Jun 2021 15:30:06 +0000
X-UUID: 2c7ee9001ce54678aedff26f47332f78-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PHPppWOhOgkV4w2AEsAArZ28w3Ig+QmHEr8mfpu7g/Y=; 
 b=Xgbm5n5eDxCRsRL/BX7vhXu3bVTF33PIWrak+exK34rd6+sbxGnAziNn0LVKtJFTqusEdHD9HsauahJcI1TU1uvhym+qnHS2s7edOSZVIxEH2dA1SF9jL6RphdDmtQjCsRoSG9zk59rvtDmQNetUCHiGdMCFMPyhZVSfFcnD15c=;
X-UUID: 2c7ee9001ce54678aedff26f47332f78-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1476601398; Wed, 16 Jun 2021 08:30:02 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 08:30:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 23:29:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 23:29:46 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <peterz@infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, <rostedt@goodmis.org>,
 <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3] recordmcount: Correct st_shndx handling
Date: Wed, 16 Jun 2021 23:29:46 +0800
Message-ID: <20210616152946.2709-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YMoSNnNXmKnDpJEv@hirez.programming.kicks-ass.net>
References: <YMoSNnNXmKnDpJEv@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_083005_201407_63C06D1A 
X-CRM114-Status: GOOD (  23.04  )
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

> On Wed, Jun 16, 2021 at 12:23:13AM +0800, Mark-PK Tsai wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
> > SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.
> > 
> > This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.
> > 
> > Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > [handle endianness of sym->st_shndx]
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  scripts/recordmcount.h | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > index f9b19524da11..ef9c3425f86b 100644
> > --- a/scripts/recordmcount.h
> > +++ b/scripts/recordmcount.h
> > @@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
> >  	unsigned long offset;
> >  	int index;
> >  
> > +	if (w2(sym->st_shndx) > SHN_UNDEF &&
> > +	    w2(sym->st_shndx) < SHN_LORESERVE)
> >  		return w2(sym->st_shndx);
> >  
> > +	if (w2(sym->st_shndx) == SHN_XINDEX) {
> > +		offset = (unsigned long)sym - (unsigned long)symtab;
> > +		index = offset / sizeof(*sym);
> >  
> > +		return w(symtab_shndx[index]);
> > +	}
> > +
> > +	return 0;
> >  }
> 
> Thanks. However that leads to atrocious codegen because w2 is an
> indirect function, something like the below seems much better.

Oh, I didn't notice that.
I'll update in v4.
Thanks!

> 
> 1d00:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
> 1d05:       c0 eb 04                shr    $0x4,%bl
> 1d08:       ff 15 7a 54 00 00       callq  *0x547a(%rip)        # 7188 <w2>
> 1d0e:       85 c0                   test   %eax,%eax
> 1d10:       74 16                   je     1d28 <main+0xba8>
> 1d12:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
> 1d17:       ff 15 6b 54 00 00       callq  *0x546b(%rip)        # 7188 <w2>
> 1d1d:       3d ff fe 00 00          cmp    $0xfeff,%eax
> 1d22:       0f 86 00 03 00 00       jbe    2028 <main+0xea8>
> 1d28:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
> 1d2d:       ff 15 55 54 00 00       callq  *0x5455(%rip)        # 7188 <w2>
> 
> vs
> 
> 1d0c:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
> 1d11:       ff 15 71 54 00 00       callq  *0x5471(%rip)        # 7188 <w2>
> 
> ---
> diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> index f9b19524da11..b3e9d0563c03 100644
> --- a/scripts/recordmcount.h
> +++ b/scripts/recordmcount.h
> @@ -192,15 +192,23 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
>  				 Elf32_Word const *symtab_shndx)
>  {
>  	unsigned long offset;
> +	unsigned short shndx;
>  	int index;
>  
> -	if (sym->st_shndx != SHN_XINDEX)
> -		return w2(sym->st_shndx);
> +	shndx = w2(sym->st_shndx);
>  
> -	offset = (unsigned long)sym - (unsigned long)symtab;
> -	index = offset / sizeof(*sym);
> +	if (shndx > SHN_UNDEF &&
> +	    shndx < SHN_LORESERVE)
> +		return shndx;
>  
> -	return w(symtab_shndx[index]);
> +	if (shndx == SHN_XINDEX) {
> +		offset = (unsigned long)sym - (unsigned long)symtab;
> +		index = offset / sizeof(*sym);
> +
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
