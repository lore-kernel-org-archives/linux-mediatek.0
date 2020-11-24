Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B09C56202
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 11:05:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0F020708
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 11:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObbCAzRu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3SBAmZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0F020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n/Jiw88NI9ABJBwxVGLPYTPdIc6dEyaEJwHwDrDamJ8=; b=ObbCAzRuxZ6gtQVvDuUzQYBZ3
	J/ofA/yo7rdQOSbx8Y5B/eA/1h7Tw+x3j+L801Vxj43bkxHG39B0k8Vo9RiHi4owXHpeLVLDoahQc
	bZLaBOkQkJFljn7kjtJjSpDwCj6MbeUGzTREDad6Ust6t/lAIcsvMuFOiwryMA99q+WcwAvmF1OSn
	CHqnlzgWIN6ZczrUMX5oJdu6yj40AlvdfNZ7EqpAnUf/BXcElypBcontIN3lsrWr3+e/7Y3jfOKNa
	7w59ceJGbPIKR9xLGIcCikIjBNeVwSNpiU63/leyqreGXiS6EsdAK+IsH1cl1E9fR5MUXirWjkZjo
	l6LMDIb6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khW8a-0006wS-FW; Tue, 24 Nov 2020 11:05:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khW8W-0006vf-5L; Tue, 24 Nov 2020 11:05:28 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A41B20708;
 Tue, 24 Nov 2020 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606215927;
 bh=p7cS0enyaISQXUsFbBkJBL1aoa2MlX33h5/J260iXIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F3SBAmZRTb54N/YAxmPu1vt5vCXgqcUrDxC/I6tq4FoRWdxlhKAXh24e2A3yq6vzm
 BgHxbhukrj9r3LrDIPXIc3Mwe2Guh38i3iRJEe4ZQjjNxebY2oBWMFXYq3afwnmKfK
 THIyImd3gme1xi91jEdzIxGCeTTwpRkoTNsv8iK8=
Date: Tue, 24 Nov 2020 11:05:21 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH] iommu: Improve the performance for direct_mapping
Message-ID: <20201124110520.GA12980@willie-the-truck>
References: <20201120090628.6566-1-yong.wu@mediatek.com>
 <20201123123258.GC10233@willie-the-truck>
 <1606209884.26323.132.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606209884.26323.132.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_060528_310211_372C9B1E 
X-CRM114-Status: GOOD (  22.07  )
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
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 05:24:44PM +0800, Yong Wu wrote:
> On Mon, 2020-11-23 at 12:32 +0000, Will Deacon wrote:
> > On Fri, Nov 20, 2020 at 05:06:28PM +0800, Yong Wu wrote:
> > > +				unmapped_sz = 0;
> > > +			}
> > > +			start += pg_size;
> > > +		}
> > > +		if (unmapped_sz) {
> > > +			ret = iommu_map(domain, start, start, unmapped_sz,
> > > +					entry->prot);
> > 
> > Can you avoid this hunk by changing your loop check to something like:
> > 
> > 	if (!phys_addr) {
> > 		map_size += pg_size;
> > 		if (addr + pg_size < end)
> > 			continue;
> > 	}
> 
> Thanks for your quick review. I have fixed and tested it. the patch is
> simple. I copy it here. Is this readable for you now?
> 
> 
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -737,6 +737,7 @@ static int
> iommu_create_device_direct_mappings(struct iommu_group *group,
>  	/* We need to consider overlapping regions for different devices */
>  	list_for_each_entry(entry, &mappings, list) {
>  		dma_addr_t start, end, addr;
> +		size_t map_size = 0;
>  
>  		if (domain->ops->apply_resv_region)
>  			domain->ops->apply_resv_region(dev, domain, entry);
> @@ -752,12 +753,21 @@ static int
> iommu_create_device_direct_mappings(struct iommu_group *group,
>  			phys_addr_t phys_addr;
>  
>  			phys_addr = iommu_iova_to_phys(domain, addr);
> -			if (phys_addr)
> -				continue;
> +			if (!phys_addr) {
> +				map_size += pg_size;
> +				if (addr + pg_size < end)
> +					continue;
> +				else

You don't need the 'else' here  ^^^

> +					addr += pg_size; /*Point to End */

addr = end ?

That said, maybe we could simplify this further by changing the loop bounds
to be:

	for (addr = start; addr <= end; addr += pg_size)

and checking:

	if (!phys_addr && addr != end) {
		map_size += pg_size;
		continue;
	}

does that work?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
