Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45728C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 16:59:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015EF22C7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 015EF22C7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8OOt+iPEjirDMFWzaCEq/ZrYMCMGrbaqff0BbhXpsA8=; b=Wc25QD22vPhqx8nLb2iVz+yvQ
	xkRF7gsKrmoWWHoJ+t/AkkNYlZ5zAHAqj7ZGTx0i4rBjC3KyuMOflsIT/D8FL8LcBVL5Ze52OmAa6
	3+mhPZh0tOR0DWBva2a/4RruzfYQfiz/J7kA9IJDG7rbsZZEepstemkoCRc5wp6ZLDlZnLcV+a+5o
	Ion26uCsRYL280HGojKtQcfl8e0VTUvP8Uy57qSuFftR4bcGW70ISJ7I9nrq5vsroZvwfHRyHKoPk
	FwMXVUHIHLYHaP+7VC8aeS1oOWl4vAfqoa82Ojf8yOXZwoVT7afxWyjNkPNjfxPwqZyuMvaC90qoV
	58cXg/sBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Xre-00082P-IB; Mon, 18 Jan 2021 16:58:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Xra-00081j-DQ; Mon, 18 Jan 2021 16:58:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76036222BB;
 Mon, 18 Jan 2021 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610989120;
 bh=0bKhzEZ2HOSFbpgHtimXEvYRPGe1qXAb+1JtaEmfCiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LcT4LSccNgfsfftGAHO5+Er6JQxGKpLFfMWLD3u67HN3Hb7QO1fgXikzrpRuhhyef
 SVvft3JrmCeoJ3MssTo5V1t/EzaDxb4sYYE0or7cH49o+cPsNcBf/Al+gn4ye32RKA
 KXUP3ece7Osqhubt3XL/nmZoHnj+7Wnnss7nyT5yr73omdai3VYGdOo2o/8JHSACF3
 kUDbm1ifuQK80OJv8fOnub3scEU0caBV1uUaqAwRpojx5ux/rmovbCibhpDYxUvYyQ
 ze0rfzkgHbUvtXvlR/o8kCO6nL8UHghEYaQmC9TLa9rswXCoPx6nhPNSfLE3jGpc3h
 2/bFjkFJKQxCg==
Date: Mon, 18 Jan 2021 16:58:34 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 6/7] iommu/mediatek: Gather iova in iommu_unmap to
 achieve tlb sync once
Message-ID: <20210118165833.GA17722@willie-the-truck>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-7-yong.wu@mediatek.com>
 <e1e17782-a9f3-6b64-1630-bf29af5241cf@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1e17782-a9f3-6b64-1630-bf29af5241cf@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_115846_752071_618ED4E9 
X-CRM114-Status: GOOD (  13.80  )
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 04:35:22PM +0000, Robin Murphy wrote:
> On 2020-12-16 10:36, Yong Wu wrote:
> > In current iommu_unmap, this code is:
> > 
> > 	iommu_iotlb_gather_init(&iotlb_gather);
> > 	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
> > 	iommu_iotlb_sync(domain, &iotlb_gather);
> > 
> > We could gather the whole iova range in __iommu_unmap, and then do tlb
> > synchronization in the iommu_iotlb_sync.
> > 
> > This patch implement this, Gather the range in mtk_iommu_unmap.
> > then iommu_iotlb_sync call tlb synchronization for the gathered iova range.
> > we don't call iommu_iotlb_gather_add_page since our tlb synchronization
> > could be regardless of granule size.
> > 
> > In this way, gather->start is impossible ULONG_MAX, remove the checking.
> > 
> > This patch aims to do tlb synchronization *once* in the iommu_unmap.
> 
> Assuming the update to patch #4 simply results in "unsigned long end = iova
> + size - 1;" here,
> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

There's a v4 here:

https://lore.kernel.org/r/20210107122909.16317-1-yong.wu@mediatek.com

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
