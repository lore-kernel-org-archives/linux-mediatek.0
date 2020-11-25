Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C787C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:13:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE23206B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1PF+ofen";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Fk02J6x4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE23206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5/lmIZRzx8rOgP3JyiTwe+O48hD2JdD4DgFaUhDJhMs=; b=1PF+ofencS6TSAksVmKBsVAzE
	Y9gDBgusnWvfjBpQ0feHCQ9plypu4BrWFHn9RUuCV4RAP7Y2IWkFbD9mwFaQfSclp0ok6O7U0vSSS
	8StodkXoLt4flkt9X1mu3CJjkKQaUFsOieDWnPVZgCU9Dcok0AWQA2neKTbyVhnsBR8BnWQNWKNaO
	2/Vo4OQShOKjBZ4DmyeDBCuXM0AFGvrt9QpBIkoMkZlU2RNUnoZXY4aW5JO8Ql2yDbtRH/+7QLEkd
	ojQtBKybvkvbCJSf/JUZlq/4uzErv4xY/cciOruPhA2dPxKVtj/bO6shZgBx0m0quq0DkyC5ZnuVS
	HsNXodvcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khskB-0007nQ-Ua; Wed, 25 Nov 2020 11:13:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsk9-0007l5-D4; Wed, 25 Nov 2020 11:13:50 +0000
X-UUID: f3284587bf584583b6bfe09288cd2695-20201125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xI/ceqZKKONm10j9fLWN04WfsGQ+Y6PfpXlP79ucbtc=; 
 b=Fk02J6x4gYEjQNlA9YmduD9VtFZEumjvhjw9/e55K8RlZ3n6s4XuiYYZmGU8WfxVKLa3z8OnHIJ42GpiZt7Q8QBp046nkh/qoaZF9Ca+0sHhqgJvOhdpTKr0NPzmPfSlCrfcWpFtQ88gnMj1q4uSaUH9i3dQqfrwTGk2K4xmzLk=;
X-UUID: f3284587bf584583b6bfe09288cd2695-20201125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 938886545; Wed, 25 Nov 2020 03:13:33 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 03:03:36 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Nov 2020 19:03:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Nov 2020 19:03:33 +0800
Message-ID: <1606302214.26323.141.camel@mhfsdcap03>
Subject: Re: [PATCH] iommu: Improve the performance for direct_mapping
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Wed, 25 Nov 2020 19:03:34 +0800
In-Reply-To: <20201124110520.GA12980@willie-the-truck>
References: <20201120090628.6566-1-yong.wu@mediatek.com>
 <20201123123258.GC10233@willie-the-truck>
 <1606209884.26323.132.camel@mhfsdcap03>
 <20201124110520.GA12980@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3E37F2948B73A16F8990BEF5FB644CD56B780219D1EF19A777FBD0308C48F13A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_061349_667379_96755502 
X-CRM114-Status: GOOD (  28.67  )
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
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-24 at 11:05 +0000, Will Deacon wrote:
> On Tue, Nov 24, 2020 at 05:24:44PM +0800, Yong Wu wrote:
> > On Mon, 2020-11-23 at 12:32 +0000, Will Deacon wrote:
> > > On Fri, Nov 20, 2020 at 05:06:28PM +0800, Yong Wu wrote:
> > > > +				unmapped_sz = 0;
> > > > +			}
> > > > +			start += pg_size;
> > > > +		}
> > > > +		if (unmapped_sz) {
> > > > +			ret = iommu_map(domain, start, start, unmapped_sz,
> > > > +					entry->prot);
> > > 
> > > Can you avoid this hunk by changing your loop check to something like:
> > > 
> > > 	if (!phys_addr) {
> > > 		map_size += pg_size;
> > > 		if (addr + pg_size < end)
> > > 			continue;
> > > 	}
> > 
> > Thanks for your quick review. I have fixed and tested it. the patch is
> > simple. I copy it here. Is this readable for you now?
> > 
> > 
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -737,6 +737,7 @@ static int
> > iommu_create_device_direct_mappings(struct iommu_group *group,
> >  	/* We need to consider overlapping regions for different devices */
> >  	list_for_each_entry(entry, &mappings, list) {
> >  		dma_addr_t start, end, addr;
> > +		size_t map_size = 0;
> >  
> >  		if (domain->ops->apply_resv_region)
> >  			domain->ops->apply_resv_region(dev, domain, entry);
> > @@ -752,12 +753,21 @@ static int
> > iommu_create_device_direct_mappings(struct iommu_group *group,
> >  			phys_addr_t phys_addr;
> >  
> >  			phys_addr = iommu_iova_to_phys(domain, addr);
> > -			if (phys_addr)
> > -				continue;
> > +			if (!phys_addr) {
> > +				map_size += pg_size;
> > +				if (addr + pg_size < end)
> > +					continue;
> > +				else
> 
> You don't need the 'else' here  ^^^
> 
> > +					addr += pg_size; /*Point to End */
> 
> addr = end ?
> 
> That said, maybe we could simplify this further by changing the loop bounds
> to be:
> 
> 	for (addr = start; addr <= end; addr += pg_size)
> 
> and checking:
> 
> 	if (!phys_addr && addr != end) {
> 		map_size += pg_size;
> 		continue;
> 	}
> 
> does that work?

It works but I think we can not check iommu_iova_to_phys(domain, end).
We should add a "if", like:

for (addr = start; addr <= end; addr += pg_size) {
...
	if (addr < end) {
		phys_addr = iommu_iova_to_phys(domain, addr);
		if (!phys_addr) {
			map_size += pg_size;
			continue;
		}
	}
...


If you don't like this "if (addr < end)", then we have to add a "goto".
like this:


for (addr = start; addr <= end; addr += pg_size) {
 	phys_addr_t phys_addr;
 
	if (addr == end)
		goto map_last;

	phys_addr = iommu_iova_to_phys(domain, addr);
	if (!phys_addr) {
		map_size += pg_size;
		continue;
	}

map_last:
	if (!map_size)
		continue;
	ret = iommu_map(domain, addr - map_size,
			addr - map_size, map_size, entry->prot);
	if (ret)
		goto out;
}

Which one is better?

> 
> Will
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
