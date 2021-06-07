Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517E6C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 17:32:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DAB161090
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 17:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DAB161090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHqvwexKTrHr1/m2Mb42WswL1csJNooNdJI5lQRPL0Q=; b=QWmoYYXifkqadv
	xB/3yEmeVKIUv491Vyib0F+UymI/xghWeCC980VRnjpPcfLRr3Oq45hagv9bCArT2HRdhQ+lGL58M
	NUbBFtFSY9bk+m/rxiRzH/h7RHfK24YnLOiGzoQ5gn0YHoK5fCqg1/b3iHmVYG21+it2F2ovqKEjn
	h3PQL/Ow+4pNlRZ4jq5CW5/h9+iL8wbpxUncFmi+lVwyF8YLb3pNacZqPnXF8ykJeU59BfdGcQoWb
	FablVTRMV12KD6GRZOJ36+VaCWEZWrLhQlBmtufe5FDiZv0VZQLVRsBNc6VhniJIWY2wpaILMsAKW
	tL730CIgsNi95q3y+hzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqJ7E-004pTQ-Eg; Mon, 07 Jun 2021 17:32:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqJ6T-004pAD-Kt; Mon, 07 Jun 2021 17:32:00 +0000
X-UUID: 7cff5ad8bb0e43e493bd11c32531e08d-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TlL/JnXeQvpldfzcepKfJ2qcL0fL6U38PutyOnWfZZo=; 
 b=Sfu0Kz5Xs+BZw7TnUgitLtJl3KiteeT8QD6MkKQeEg/UpQQBF3NpW6F29fiby50nANa6pUbhA1qfvSxARF2nw9OlDrbvdU2Idr4/VL6ReG0u0kXjCSSID5EYLHviO6G5xulKTkvydcaVk2AAfKUa0sFOyWxDEXU3vyG8muBHjUo=;
X-UUID: 7cff5ad8bb0e43e493bd11c32531e08d-20210607
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 530317454; Mon, 07 Jun 2021 10:31:54 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 10:31:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 01:31:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Jun 2021 01:31:38 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-toolchains@vger.kernel.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, 
 <peterz@infradead.org>, <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date: Tue, 8 Jun 2021 01:31:38 +0800
Message-ID: <20210607173138.3882-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210607094433.473100d9@oasis.local.home>
References: <20210607094433.473100d9@oasis.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_103159_132040_1335178D 
X-CRM114-Status: GOOD (  26.15  )
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

> On Mon, 7 Jun 2021 13:44:21 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > There's an extended section header index section for just that. And
> > recordmcount actually seems to use that as well.
> > 
> > I can't seem to find enough of the thread to figure out what the actual
> > problem is though. The lore archive doesn't have anything prior to this
> > message.
> > 
> > One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> > SHN_XINDEX, then use .symtab_shndx.
> > 
> > Apparently you've found a case where neither is true? In that case
> > objtool seems to use shndx 0. A matching recordmcount patch would be
> > something like this.

Hi Peter,

Should I resend the below patch as v2?

> 
> Mark-PK,
> 
> Does the below patch fix it for you too (if you backport it to your
> kernel). I much rather have recordmcount match objtool, as one day the
> two will hopefully merge to one executable.
> 
> -- Steve
> 

Yes, this patch fix it.

> 
> > 
> > 
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
