Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073AEC07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:25:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB21261248
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB21261248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtoyHhQ1i4/Bwv9M3oKHN6eBKUyLejyIorKPAK6Rxe8=; b=u+ekO2Qp1nl6rs
	vgjBz9kFeo6oZBY0yQ7x9OXB52AWeR22tZvYM5upknsETAwFwV3w2+QQp9qZy9JymAmZMz0vNwmE1
	XCZi0T2VLOjpcFaAAnnrGcc87HgIJzSgxSVwfv7oRVP7M/g7fqf6c13NmqgV2naWuPa/0+l+Roevp
	tp0ekM+mE4lRwlyzQwVSu2sr/Kzwv6BtKUUG+eVLctQimzvIljrhJlRqHVQCBVpMgJQNfv4rTvc1I
	ppoGRgsWsIkBdwrVGMU3q+Yv7EmsQpyV3vMg6mcnMmfURHyaJSp9UOeWb1CxjD4fN/I8jfE6I3vuh
	fOxVlYx3r/Lw9GOFJ4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0KqW-008Q5Z-DE; Mon, 05 Jul 2021 09:24:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0KqR-008Q4p-Sw
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 09:24:55 +0000
X-UUID: 0941c51ecad747ebb180bf2ce32c9681-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dV2vuesOizqkAALaltoauNH3MR2oZFb5XVp6WIEb1T8=; 
 b=J/sFiNrMNP88Q7E7MLAaDcE0P5jADYaIOXFeUdieVC4nbKqr924Y+9Kvw+GwqDKtpuH7HRzKCN5TFm/1Ox8QXNXpMJ1xUqtY/eWuCeazVxZAu7n3wjL6D1Py476eb6TISxYnV9BERAq8QeIZLC9k2td3snWQ9GqvnwdswCJSRbU=;
X-UUID: 0941c51ecad747ebb180bf2ce32c9681-20210705
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 193841624; Mon, 05 Jul 2021 02:24:44 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 02:24:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 17:24:41 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 17:24:41 +0800
Message-ID: <1625477081.856.5.camel@mtkswgap22>
Subject: Re: [PATCH] mm/sparse: clarify pgdat_to_phys
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Date: Mon, 5 Jul 2021 17:24:41 +0800
In-Reply-To: <YN8QaoJuDP9Nr744@kernel.org>
References: <20210630092309.17654-1-miles.chen@mediatek.com>
 <YN8QaoJuDP9Nr744@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_022451_982917_E945D816 
X-CRM114-Status: GOOD (  25.08  )
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

On Fri, 2021-07-02 at 16:11 +0300, Mike Rapoport wrote:
> On Wed, Jun 30, 2021 at 05:23:09PM +0800, Miles Chen wrote:
> > clarify pgdat_to_phys() by wrapping pgdat_to_phys
> > with CONFIG_NUMA. (the same config as contig_page_data)
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
> > [1] https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/
> > 
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  mm/sparse.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index 7272f7a1449d..62c21ec28e33 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -344,14 +344,15 @@ size_t mem_section_usage_size(void)
> >  	return sizeof(struct mem_section_usage) + usemap_size();
> >  }
> >  
> > -static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> > -{
> > -#ifndef CONFIG_NUMA
> > -	return __pa_symbol(pgdat);
> > -#else
> > -	return __pa(pgdat);
> > -#endif
> > -}
> > +#ifdef CONFIG_NUMA
> > +#define pgdat_to_phys(pgdat) __pa(pgdat)
> > +#else /* CONFIG_NUMA */
> > +/*
> > + * When !CONFIG_NUMA, we only expect pgdat == &contig_page_data,
> > + * and use __pa_symbol().
> > + */
> > +#define pgdat_to_phys(pgdat) __pa_symbol(pgdat)
> > +#endif /* CONFIG_NUMA */
> 
> I'm not sure a macro is better than a static inline.
> 
> Maybe we'd want to warn if pgdat passed to pgtat_to_phys() is not
> &contig_page_data, e.g something like
> 
> static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> {
> 	if (!IS_ENABLED(CONFIG_NUMA)) {
> 		if (pgdat == &contig_page_data)
> 			return __pa_symbol(&contig_page_data);
> 		else
> 			pr_warn("Unexpected pglist_data pointer!\n");
> 	}
> 	
> 	return __pa(pgdat);
> }

Sorry for my late response.
Thanks for the guide. It looks better this way.I will submit patch v2.

>   
> >  #ifdef CONFIG_MEMORY_HOTREMOVE
> >  static struct mem_section_usage * __init
> > -- 
> > 2.18.0
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
