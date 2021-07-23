Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCC9C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 08:40:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5107960E77
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 08:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5107960E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4G1oMZRjlvr3tVeBsYhgZAxKrNPj3YX5tUhlA3pwRg=; b=2yKcy+U99K6/pS
	O1wdLAdY+HiPNnJp+1tFZ2XYtyLHj971ffTiTh93T0OD+O2F4psle2gtjXX54g1bjaDGVkhN1OPks
	NSc1qF4ibeHuEgs7oskgD2MuWelBk2H+dpNBmeXDgQcWQJrf2GedyvSqXWIE+kvtv1w6P4kpzaC/b
	DbTyovxs3tGCEVSCtNZVilosjT9nQCvOKdxNQNE5lfihgEC4zHIO2x1t0XlARuRYvqOUQyIyG62pC
	sXInLsuliFVTkZqDZMCfDSCosdveFoD2rcsM5ecTCirv7aJGQRYV6Sy84zOmuANpkWeS9gEbxtcmr
	3Itsn5M0TcEtuNWEfb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6qj6-003yl1-El; Fri, 23 Jul 2021 08:40:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6qj2-003yjZ-Tk
 for linux-mediatek@lists.infradead.org; Fri, 23 Jul 2021 08:40:10 +0000
X-UUID: e834613c1e7e43e684e3b16fe8c30480-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6eFxbfXU1aGruy1a6KsbRzQX11yjS2zTUljrzlkeqUU=; 
 b=hr79QuZ31l8PtsKCPcPzv+oHGdsHt3MktK/1aYXM1h48h69CZQE+srWopEqrpXsCDNP7kFKkDmvDtBcD/BXYF9MzhwtiJVU90NHMPqzPg/Ha79sUlv/2uTjrqYtEutODQmvZvcxZxyADoVplg9WSQFMkYuTzXhYnJKPHXlJL2M4=;
X-UUID: e834613c1e7e43e684e3b16fe8c30480-20210723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1426315244; Fri, 23 Jul 2021 01:40:05 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 01:40:04 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 16:40:02 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 16:40:01 +0800
Message-ID: <1627029602.14347.6.camel@mtkswgap22>
Subject: Re: [RESEND PATCH v2] mm/sparse: clarify pgdat_to_phys
From: Miles Chen <miles.chen@mediatek.com>
To: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, <linux-mm@kvack.org>, 
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <wsd_upstream@mediatek.com>
Date: Fri, 23 Jul 2021 16:40:02 +0800
In-Reply-To: <a042906d-7d07-d1af-57d2-ab4cbdc53f36@redhat.com>
References: <20210723070137.23321-1-miles.chen@mediatek.com>
 <a042906d-7d07-d1af-57d2-ab4cbdc53f36@redhat.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_014009_054846_4DFCCED7 
X-CRM114-Status: GOOD (  28.03  )
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

On Fri, 2021-07-23 at 09:10 +0200, David Hildenbrand wrote:
> On 23.07.21 09:01, Miles Chen wrote:
> > Clarify pgdat_to_phys() by testing if
> > pgdat == &contig_page_data when CONFIG_NUMA=n.
> > 
> > contig_page_data is only available when CONFIG_NUMA=n
> > so we have to use #ifndef here.
> > 
> > No functional change intended.
> > 
> > Comment from Mark [1]:
> > "
> > ... and I reckon it'd be clearer and more robust to define
> > pgdat_to_phys() in the same ifdefs as contig_page_data so
> > that these, stay in-sync. e.g. have:
> > 
> > | #ifdef CONFIG_NUMA
> > | #define pgdat_to_phys(x)	virt_to_phys(x)
> > | #else /* CONFIG_NUMA */
> > |
> > | extern struct pglist_data contig_page_data;
> > | ...
> > | #define pgdat_to_phys(x)	__pa_symbol(&contig_page_data)
> > |
> > | #endif /* CONIFIG_NUMA */
> > "
> > 
> > Comment from Mike [2]:
> > "
> > I'm not sure a macro is better than a static inline.
> > 
> > Maybe we'd want to warn if pgdat passed to pgtat_to_phys() is not
> > &contig_page_data, e.g something like
> > 
> > static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> > {
> > 	if (!IS_ENABLED(CONFIG_NUMA)) {
> > 		if (pgdat == &contig_page_data)
> > 			return __pa_symbol(&contig_page_data);
> > 		else
> > 			pr_warn("Unexpected pglist_data pointer!\n");
> > 	}
> > 
> > 	return __pa(pgdat);
> > }
> > "
> > 
> > [1] https://urldefense.com/v3/__https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/__;!!CTRNKA9wMg0ARbw!1bJTnH2gJ6QvsBKTXH8xOiKfHF-xq_1dok3cnETD4e4qjryntFm8K0XjtEmkHAxG6g$ 
> > [2] https://urldefense.com/v3/__https://lore.kernel.org/patchwork/patch/1452903/*1650759__;Iw!!CTRNKA9wMg0ARbw!1bJTnH2gJ6QvsBKTXH8xOiKfHF-xq_1dok3cnETD4e4qjryntFm8K0XjtEmbGXEkVg$ 
> > 
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > 
> > ---
> > 
> > Change since v1:
> > Thanks for Mike's comment, check if pgdat == &contig_page_data,
> > so it is clearer that we only expect contig_page_data when
> > CONFIG_NUMA=n.
> > ---
> >   mm/sparse.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index 6326cdf36c4f..f73ff3c124c5 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -348,10 +348,11 @@ size_t mem_section_usage_size(void)
> >   static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> >   {
> >   #ifndef CONFIG_NUMA
> > -	return __pa_symbol(pgdat);
> > -#else
> > +	if (pgdat == &contig_page_data)
> > +		return __pa_symbol(&contig_page_data);
> > +	pr_warn("Unexpected pglist_data pointer!\n");
> 
> Shouldn't this rather be a VM_BUG_ON()?
> 
> Because it looks like something that should barely happen and we might 
> not want to perform runtime checks on each and every system?

thanks for your comment, I will use VM_BUG_ON() to check if pgdat ==
contig_page_data to avoid the runtime check.
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
