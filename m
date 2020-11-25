Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DD3C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA2E206E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RHl6bvpa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uahWelgQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABA2E206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6EfKcC8b8dWRcPYM4pomUsuMh4jLi7Hp4AGHzz+aLho=; b=RHl6bvpacQez0gw+bxSIy2tPD
	gUti34mE2JCTiXekWkAYmPL6WJf5ZrB7Esdxl7RIyC9L0TJZEKPwkMJwhF5rk0ckIngp3BBc49/oK
	L2e3ml2msrd3YC6viGNRAxD77KRLVFxNJ5A5YpgLXEjYq7nes/ptyXOVNVChAuv+NIsDN9OWkwYE9
	Bm3XUhh6WDR7FJu3KC+NTKqSMwqynuGpwu8PoDGRLds1U+xoyMn3TNflJ5LlYgBMYpoDD6fDxqbdQ
	T6VxkqftTHj3HdCEmaLdx3e4FgSyA7PTWrA3YD0uM5L12Z8PTF7E0nR021dDW4Qsqf1zV28d3OlFx
	aw0GaMRcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsja-0007et-Vr; Wed, 25 Nov 2020 11:13:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsjW-0007cv-8W; Wed, 25 Nov 2020 11:13:11 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FECF206B7;
 Wed, 25 Nov 2020 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606302788;
 bh=rbevIJAsSB/iRPD2vJR1nkW2xROzISyxEwaJMCSnkso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uahWelgQafXjRsuI496JVdUNxkEZm3JksQ9wJ1cwLh6puVI2ye4SNLrtruQL4fU4V
 UwWTo+hCjkW7fqNmMG4Qi6yOj6GcqoKnuediWkLgQ0DfOEXU/BVkN87icfKT45+m8X
 l9QM/ksIyV6ERAwsQpKuBYGIddyhVWQ4oOhKWgaA=
Date: Wed, 25 Nov 2020 11:13:02 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH] iommu: Improve the performance for direct_mapping
Message-ID: <20201125111301.GB15239@willie-the-truck>
References: <20201120090628.6566-1-yong.wu@mediatek.com>
 <20201123123258.GC10233@willie-the-truck>
 <1606209884.26323.132.camel@mhfsdcap03>
 <20201124110520.GA12980@willie-the-truck>
 <1606302214.26323.141.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606302214.26323.141.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_061310_409611_BEE2757C 
X-CRM114-Status: GOOD (  20.90  )
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

On Wed, Nov 25, 2020 at 07:03:34PM +0800, Yong Wu wrote:
> On Tue, 2020-11-24 at 11:05 +0000, Will Deacon wrote:
> > On Tue, Nov 24, 2020 at 05:24:44PM +0800, Yong Wu wrote:
> > > On Mon, 2020-11-23 at 12:32 +0000, Will Deacon wrote:
> > That said, maybe we could simplify this further by changing the loop bounds
> > to be:
> > 
> > 	for (addr = start; addr <= end; addr += pg_size)
> > 
> > and checking:
> > 
> > 	if (!phys_addr && addr != end) {
> > 		map_size += pg_size;
> > 		continue;
> > 	}
> > 
> > does that work?
> 
> It works but I think we can not check iommu_iova_to_phys(domain, end).
> We should add a "if", like:
> 
> for (addr = start; addr <= end; addr += pg_size) {
> ...
> 	if (addr < end) {
> 		phys_addr = iommu_iova_to_phys(domain, addr);
> 		if (!phys_addr) {
> 			map_size += pg_size;
> 			continue;
> 		}
> 	}
> ...
> 

Oh yes, you're right.

> If you don't like this "if (addr < end)", then we have to add a "goto".
> like this:
> 
> 
> for (addr = start; addr <= end; addr += pg_size) {
>  	phys_addr_t phys_addr;
>  
> 	if (addr == end)
> 		goto map_last;
> 
> 	phys_addr = iommu_iova_to_phys(domain, addr);
> 	if (!phys_addr) {
> 		map_size += pg_size;
> 		continue;
> 	}
> 
> map_last:
> 	if (!map_size)
> 		continue;
> 	ret = iommu_map(domain, addr - map_size,
> 			addr - map_size, map_size, entry->prot);

I think it's cleared to invert this as you had before:

	if (map_size)
		ret = iommu_map(...);

> Which one is better?

The second one is easier to read. I'll stop making suggestions now, thanks.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
