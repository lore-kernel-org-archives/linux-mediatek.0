Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EFDC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 01:18:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7123961263
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 01:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7123961263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gy2D2ReU0GbfZqE9RyATQKRCzj8O2UyE62BpO5XVs1Y=; b=K7hi67QqQj95xv
	oSkg3EJwTCcSx2f6YltYUdXXUZMg+jMNdXa7OaLDAj60bEBTJDF0LTZjIPTxfbkWXu91iD3gHLqFk
	swVQuSwAvCQtD8dOiEN2/A7ZWlPbI7mGE55HJNyaBdIQYbzYgCvvBaQ0Xue1MJwLCpmV+oLv2nHOj
	AU1heQADJPNmIPjIWgH5I1YiLIqCFINea6nGd5WtnnGPAEM+ut+oQNZlJDrg1NthwExSup/hfcK5N
	ZP0tntXaHM1Kk9l3JyJMCiKQ+vd11xeCvfnd4vuKt7Mf944KUYBifWh2Bn/LJADX+g6/oV5j7X9A4
	0VirktXso+/X48wxuA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqQLn-005vJG-No; Tue, 08 Jun 2021 01:16:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqQLi-005vIJ-Kr; Tue, 08 Jun 2021 01:16:14 +0000
X-UUID: 04b91928e8e14f6db461ddb6ae762660-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jDFEUqWIq72U0CEUHRrNZQwQlA/p7eokfZGCMIbJkGI=; 
 b=hFYk+G4NrNb5dLli6hw844GDNihV7PTurFfszaOSkaiU8n/vPe5ibXZIMef90htMzkDIf02BR/HlsDiOzmfPogyHGRTe1IiL9pR6YNrfPbVSjqqvrYk2qFAoYWPBQk/TBH3Kf6mXFJkvG7o4WIsI71KkDwBfNz/17ocFQPBxLmE=;
X-UUID: 04b91928e8e14f6db461ddb6ae762660-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1953059611; Mon, 07 Jun 2021 18:16:04 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 18:16:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 09:15:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Jun 2021 09:15:48 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <peterz@infradead.org>
CC: <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-toolchains@vger.kernel.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, 
 <rostedt@goodmis.org>, <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date: Tue, 8 Jun 2021 09:15:48 +0800
Message-ID: <20210608011548.5008-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YL492/4WrWaNDL4p@hirez.programming.kicks-ass.net>
References: <YL492/4WrWaNDL4p@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_181610_718219_4DEBF03E 
X-CRM114-Status: GOOD (  19.53  )
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

> On Mon, Jun 07, 2021 at 01:44:21PM +0200, Peter Zijlstra wrote:
> > One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> > SHN_XINDEX, then use .symtab_shndx.
> > 
> > Apparently you've found a case where neither is true? In that case
> > objtool seems to use shndx 0. A matching recordmcount patch would be
> > something like this.
> > 
> 
> Apparently I'm consistently bad at spelling SHM_UNDEF today..

I test the below patch and it work for me.
I only correct the UNDEF typo without any other modification.

Could I push this patch or you will push it?
I guess I have to add your signed-off-by.

> 
> > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > index f9b19524da11..d99cc0aed6fe 100644
> > --- a/scripts/recordmcount.h
> > +++ b/scripts/recordmcount.h
> > @@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
> >  	unsigned long offset;
> >  	int index;
> >  
> > -	if (sym->st_shndx != SHN_XINDEX)
> > +	if (sym->st_shndx > SHN_UDEF &&
> > +	    sym->st_shndx < SHN_LORESERVE)
> >  		return w2(sym->st_shndx);
> >  
> > -	offset = (unsigned long)sym - (unsigned long)symtab;
> > -	index = offset / sizeof(*sym);
> > +	if (sym->st_shndx == SHN_XINDEX) {
> > +		offset = (unsigned long)sym - (unsigned long)symtab;
> > +		index = offset / sizeof(*sym);
> >  
> > -	return w(symtab_shndx[index]);
> > +		return w(symtab_shndx[index]);
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
