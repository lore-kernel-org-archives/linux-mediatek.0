Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B80C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 06:31:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B5E221FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 06:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gK/jhUtP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qLRFbRuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B5E221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rQPgpRzsfWDVyyF5AaFhz8WiXiVJ1AIzwZ78gJLyXO8=; b=gK/jhUtP1lIXlbRsgrI+RU46g
	0lXOejnE0a21Yl2G5hB8tFQ+7VgJEJLLl4q6KT9YhPDwOXNMhnuFUIVevB8Y3f4AZ8zMkGwiFqNgh
	dNhhkPwNWD8sdi3/t1KdtgLV9inl5kRoxvViQa1oerlD0VxDhRHpFYd52dxqEuPeZDu6TtbvluOcX
	Cczc++Vac93TE3oYJkyWy08/e1TKXD/KExOFTycxk16i4ZBJxAg+vAEJmS/cdLKxnJWGRLQGEvZ7u
	X1Y1gA09wEMp9B6NHsT1lbfRr1IHHPfHM+h4NAxltELAv/GQ9iYuExU2jMCZIip4nOM9tq+QtOe8W
	kE+W1EX/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiXIC-0000qI-UO; Fri, 27 Nov 2020 06:31:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiXHt-0000jE-09; Fri, 27 Nov 2020 06:31:22 +0000
X-UUID: 21a336ea2e594ecd9236d5ca0b5e111d-20201126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gWFqjIgZJcUQlxaxqF4KJOYrIr+kx5lZqVQTXm3WVxc=; 
 b=qLRFbRucTIUtSK5qJesPIKLwZiHsaN99MkV2RYurS1zhc5QWY7DsLjpZMeuS/DB85ANJPnOsrh0znFKHjm/pqP3zHCeBD7e6JTJrKMXSWnDnYC3//8MlK/anA2zdoHztR+9m/jKPHelTrVkZQ8jOJ8i6ZujvRXTiCUBJET99jUw=;
X-UUID: 21a336ea2e594ecd9236d5ca0b5e111d-20201126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 202768617; Thu, 26 Nov 2020 22:31:13 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 22:21:08 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 27 Nov 2020 14:21:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 14:21:02 +0800
Message-ID: <1606458063.26323.190.camel@mhfsdcap03>
Subject: Re: [PATCH] iommu: Improve the performance for direct_mapping
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 27 Nov 2020 14:21:03 +0800
In-Reply-To: <cbc9763b-aa7e-aea9-2a21-315dfdd2c407@arm.com>
References: <20201120090628.6566-1-yong.wu@mediatek.com>
 <cbc9763b-aa7e-aea9-2a21-315dfdd2c407@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8385ECAE0D6D3223BDD513D2FBE4AE4F466D2488E98D903708BC01BA7A1574042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_013121_274064_72463C8A 
X-CRM114-Status: GOOD (  31.76  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-26 at 15:19 +0000, Robin Murphy wrote:
> On 2020-11-20 09:06, Yong Wu wrote:
> > Currently direct_mapping always use the smallest pgsize which is SZ_4K
> > normally to mapping. This is unnecessary. we could gather the size, and
> > call iommu_map then, iommu_map could decide how to map better with the
> > just right pgsize.
> > 
> >  From the original comment, we should take care overlap, otherwise,
> > iommu_map may return -EEXIST. In this overlap case, we should map the
> > previous region before overlap firstly. then map the left part.
> > 
> > Each a iommu device will call this direct_mapping when its iommu
> > initialize, This patch is effective to improve the boot/initialization
> > time especially while it only needs level 1 mapping.
> > 
> > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/iommu.c | 20 ++++++++++++++++++--
> >   1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index df87c8e825f7..854a8fcb928d 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -737,6 +737,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
> >   	/* We need to consider overlapping regions for different devices */
> >   	list_for_each_entry(entry, &mappings, list) {
> >   		dma_addr_t start, end, addr;
> > +		size_t unmapped_sz = 0;
> >   
> >   		if (domain->ops->apply_resv_region)
> >   			domain->ops->apply_resv_region(dev, domain, entry);
> > @@ -752,10 +753,25 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
> >   			phys_addr_t phys_addr;
> >   
> >   			phys_addr = iommu_iova_to_phys(domain, addr);
> > -			if (phys_addr)
> > +			if (phys_addr == 0) {
> > +				unmapped_sz += pg_size; /* Gather the size. */
> >   				continue;
> > +			}
> 
> I guess the reason we need to validate every page is because they may 
> already have been legitimately mapped if someone else's reserved region 
> overlaps - is it worth explicitly validating that, i.e. bail out if 
> something's gone wrong enough that phys_addr != addr?

I'm not sure the history about why to validate every page. this
direct_mapping is called very early, normally after alloc_default_domain
and _attach_device. the "phys_addr != addr" looks impossible.

If there is a normal flow that may cause "phys_addr != addr", then
something go wrong, Could we give a warning like adding a
WARN_ON_ONCE(phys_addr != addr)? and it should be in a another patch.

> 
> Other than the naming issue (I agree that map_size is a far, far better 
> choice), I don't have any strong opinions about the rest of the 
> implementation - I've written enough variations of this pattern to know 
> that there's just no "nice" way to do it in C; all you can do is shuffle 
> the clunkiness around :)

:). I will send a v2.
Thanks.

> 
> Robin.
> 
> >   
> > -			ret = iommu_map(domain, addr, addr, pg_size, entry->prot);
> > +			if (unmapped_sz) {
> > +				/* Map the region before the overlap. */
> > +				ret = iommu_map(domain, start, start,
> > +						unmapped_sz, entry->prot);
> > +				if (ret)
> > +					goto out;
> > +				start += unmapped_sz;
> > +				unmapped_sz = 0;
> > +			}
> > +			start += pg_size;
> > +		}
> > +		if (unmapped_sz) {
> > +			ret = iommu_map(domain, start, start, unmapped_sz,
> > +					entry->prot);
> >   			if (ret)
> >   				goto out;
> >   		}
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
