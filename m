Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5128C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 03:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B651A20829
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 03:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s0ia73Ds";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Uz2Fe97+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B651A20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqw4R/o1EC1fi5k7nNQOu9iX42EGsd/XZcDNloLrQ1E=; b=s0ia73DsSqFETV
	MOTmJVYnfIAh1MyyVL0zOPTJXcAUw9xTeAzhM1A9M7bt4s5OF3dUhmku4TgIQh6dGyfvDycPSKG2h
	t/OaiuVpQ+D28lzSZfWCqBDkDbXvW/tvB9EKPAAq+2uweG2sFDtk7whgdDTc2EB0NZjmEH4CIZIya
	mgQ2YH028m8JAjSO7hilUiSh8o9WiDjd66a8ypsQ6h96gQiZjD7WEvDITOptoxMRE9JuWqLr8CNkH
	j6rQRI6Y9GqPV8Y52R5Y1Z6K8eGdVLRAIVeAA2DcBQLqWGZz2NU3XkUDBNjcMJjDvEmtKLb+aLOtf
	u6L4K628Vhl6Dc+7uVUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jggjq-0001fN-3m; Thu, 04 Jun 2020 03:40:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jggjX-0007UW-Ks; Thu, 04 Jun 2020 03:40:01 +0000
X-UUID: a238237efc7d4958b02c71473eb65353-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gg0xFQsrpVwavUKDGPkf/KTKDKCcT5COSQE37vYTZu4=; 
 b=Uz2Fe97+pGFfmbd7GLVLPa3P27PFL8rgTvzACaOi2WWmU/yTSWuIvKFwx4ChkNsakc0lnik5OJMTgoG18bVo2er8g11PHMHZJqbmJ+yHdenqacBaXwOG4Tc7PLGib65OcwGcQlyef48dW2KDFh+h5CJQZ+m7dCfz7x+YWWZ1ORo=;
X-UUID: a238237efc7d4958b02c71473eb65353-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 165288069; Wed, 03 Jun 2020 19:39:54 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 20:39:55 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 11:39:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 11:39:46 +0800
Message-ID: <1591241986.29475.18.camel@mtkswgap22>
Subject: Re: [PATCH] mm/memblock: export max_pfn for kernel modules
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Date: Thu, 4 Jun 2020 11:39:46 +0800
In-Reply-To: <20200603170624.GA202648@linux.ibm.com>
References: <20200603161132.2441-1-miles.chen@mediatek.com>
 <20200603170624.GA202648@linux.ibm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_203959_687652_7FC6A324 
X-CRM114-Status: GOOD (  16.36  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-03 at 20:06 +0300, Mike Rapoport wrote:
> On Thu, Jun 04, 2020 at 12:11:32AM +0800, Miles Chen wrote:
> > max_pfn is uesd to get the highest pfn in the system. Drivers like
> > drivers/iommu/mtk_iommu.c checks max_pfn to see if it should enable
> > its "4GB mode".
> > 
> > This patch exports the max_pfn symbol, so we can build the driver as
> > a kernel module.
> 
> You can use totalram_pages(), like e.g.
> drivers/media/platform/mtk-vpu/mtk_vpu.c:
> 
> $ git grep -np totalram_pages drivers/medhttps://lkml.org/lkml/2020/5/30/123ia/
> drivers/media/platform/mtk-vpu/mtk_vpu.c=779=static int mtk_vpu_probe(struct platform_device *pdev)
> drivers/media/platform/mtk-vpu/mtk_vpu.c:861:   vpu->enable_4GB = !!(totalram_pages() > (SZ_2G >> PAGE_SHIFT));
> 

Thanks for the suggestion.
totalram_pages() works and I can follow this example.

Miles

> 
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
> > -- 
> > 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
