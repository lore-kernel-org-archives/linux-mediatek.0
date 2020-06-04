Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABD1C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 03:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC0A2088E
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 03:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwoKw8pn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FAAUMXeg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC0A2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5va0/pX4ozgj+ubr0v7s/bOjFTkfoU3b0imR4YAR6U=; b=OwoKw8pn7lR8k7
	oz8TWFhZsUYmhR7H1nSCyNcPsW/gEhUU6YaFpXL/+/vzDO5Lqd55YbuTgH/bKn0wxKfPjUJ37FhI2
	p9TzxDKJGJn4csUAKS+jUe3xXzquxoyx8E4PpeppAlYiNzmM5rKim2c97FJDKlbYEqYqjMI+Yv30v
	834rNBbgrM2O9yoAjDqGBIAxeC0gJQjH5Pk/nX1u37oPoKbE3kHVZk2rP5SGSAxH9sKrEtgO+huFm
	8MX4s7RwbCTnHnclKYEHTLxx623qaBxmToKAOM+tcIrfwBIjeirMnq2tPSLqlbVqRjd9fVbU3ihnF
	8Pt0I8LsThYwb8ZhvYgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jggjr-0001gq-F1; Thu, 04 Jun 2020 03:40:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jggjY-0007Uo-4n; Thu, 04 Jun 2020 03:40:01 +0000
X-UUID: 15f3e13d276e44a4a115b99bb8677a82-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9ohiaeGdFreb1r0AXs539unugde1ILARpYyi69vZq7M=; 
 b=FAAUMXegfjiNk7eBOMTYbUdzdoIslcIAQpe/Cb/PZllnABeI6orW1H/Fvpg4/HThRotVRYZ/RfLlbYXa6A+7xSTX8jThRyjIdY9Z3UYF1i6RV1v87eJBSWVsL1OnrtDWUtp3dnf7zTsTE0QRe1jXTRBVVGgU50XvOi2QqRDCBaU=;
X-UUID: 15f3e13d276e44a4a115b99bb8677a82-20200603
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1706934061; Wed, 03 Jun 2020 19:39:55 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 20:39:57 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 11:39:47 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 11:39:47 +0800
Message-ID: <1591241987.29475.19.camel@mtkswgap22>
Subject: Re: [PATCH] mm/memblock: export max_pfn for kernel modules
From: Miles Chen <miles.chen@mediatek.com>
To: David Hildenbrand <david@redhat.com>
Date: Thu, 4 Jun 2020 11:39:47 +0800
In-Reply-To: <23a9a2cc-3461-52bb-4285-b063a01bd7c6@redhat.com>
References: <20200603161132.2441-1-miles.chen@mediatek.com>
 <23a9a2cc-3461-52bb-4285-b063a01bd7c6@redhat.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BBB609BC241D5D6326810E159D32C1FFD2E89757713B0F6749736E0F12BB7A882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_204000_189466_1DD1F614 
X-CRM114-Status: GOOD (  18.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-03 at 18:16 +0200, David Hildenbrand wrote:
> On 03.06.20 18:11, Miles Chen wrote:
> > max_pfn is uesd to get the highest pfn in the system. Drivers like
> > drivers/iommu/mtk_iommu.c checks max_pfn to see if it should enable
> > its "4GB mode".
> > 
> > This patch exports the max_pfn symbol, so we can build the driver as
> > a kernel module.
> 
> Please add that change to the respective user patch (and cc MM-people
> for that patch), so we have the actual user right along the change and
> can figure out if this is the right thing to do.
> 

Thanks for the comment.

Mike points out another alternative way to do this by totalram_pages().
I will use that approach so we don't have to export max_pfn here.

https://lkml.org/lkml/2020/6/3/771

Miles

> > 
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  mm/memblock.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index c79ba6f9920c..3b2b21ecebb6 100644
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -99,6 +99,7 @@ EXPORT_SYMBOL(contig_page_data);
> >  unsigned long max_low_pfn;
> >  unsigned long min_low_pfn;
> >  unsigned long max_pfn;
> > +EXPORT_SYMBOL(max_pfn);
> >  unsigned long long max_possible_pfn;
> >  
> >  static struct memblock_region memblock_memory_init_regions[INIT_MEMBLOCK_REGIONS] __initdata_memblock;
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
