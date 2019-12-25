Return-Path: <SRS0=B1Xv=2P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B78C2D0DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 09:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D0102073B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 09:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4+DJctS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hyyuIbMz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D0102073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVM3msIV10356VYH3uYptLEMbl3EObKS255dqbQ0h+Q=; b=O4+DJctS255lXV
	EWVbQrgjlFTDA6MKwiYUk2i034hNvplLrAwx4YAl5dwXNQ+R/WzrTsPS3XqX/2B9/0l/fRek399BN
	kdcZf5Gd1ARcDRsFkWk1l0q4Gz3v+VWfuc/zPLNqSjHXGQZT1LEUfL8hBTdztqCLmHFF6vv6AaH0u
	7Pg+Iv+tu/qxwNwdy5Efpa+HetcUPIQzwol0vuQ+DjHf6k7AUJ0CgULzs9Xtl6EQWFsXYWUh2bmOB
	3xePs47VvQD9d5hXtGuFYDPi9yGZkBm9+68h2pMh4GoOch3smhjbZx0wOzFnmCWTA/mTN85BOGV8P
	1utIZVA1Xd0GuZu1U2uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ik35F-0000d6-Av; Wed, 25 Dec 2019 09:36:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ik35C-0000cK-Jb
 for linux-mediatek@lists.infradead.org; Wed, 25 Dec 2019 09:36:00 +0000
X-UUID: ab6e964bfd74435294e86c80ffd31583-20191225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MQpZnlOW3rHl7XcCvW/fiVIv7mvsoc4U1tYgVz64kwo=; 
 b=hyyuIbMzic0VYRogqCCFKuTYs/TvNOwZZqr3i4C9wi7o02au4JYeRZIBX7eE+d+1YxCxemQ6wqkBH+jYcCav7rCqQf8lnogQrTosc5wa3vFbkbf5B95fVHzV0N2WDfTDe2trqnv7fkXez12tdAeRb9+VBen+LOYi5FRhcIK5Di4=;
X-UUID: ab6e964bfd74435294e86c80ffd31583-20191225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1694603866; Wed, 25 Dec 2019 01:35:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Dec 2019 01:29:30 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Dec 2019 17:28:44 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 25 Dec 2019 17:28:42 +0800
Message-ID: <1577266145.31907.4.camel@mtkswgap22>
Subject: Re: [PATCH] mm/page_owner: print largest memory consumer when OOM
 panic occurs
From: Miles Chen <miles.chen@mediatek.com>
To: Qian Cai <cai@lca.pw>
Date: Wed, 25 Dec 2019 17:29:05 +0800
In-Reply-To: <5E08DE19-5B71-4245-8908-548BB4FA861F@lca.pw>
References: <1577169946.4959.4.camel@mtkswgap22>
 <5E08DE19-5B71-4245-8908-548BB4FA861F@lca.pw>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191225_013558_657342_BB68018F 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2019-12-24 at 08:47 -0500, Qian Cai wrote:
> 
> > On Dec 24, 2019, at 1:45 AM, Miles Chen <miles.chen@mediatek.com> wrote:
> > 
> > We use kmemleak too, but a memory leakage which is caused by
> > alloc_pages() in a kernel device driver cannot be caught by kmemleak.
> > We have fought against this kind of real problems for a few years and 
> > find a way to make the debugging easier.
> > 
> > We currently have information during OOM: process Node, zone, swap, 
> > process (pid, rss, name), slab usage, and the backtrace, order, and
> > gfp flags of the OOM backtrace. 
> > We can tell many different types of OOM problems by the information
> > above except the alloc_pages() leakage.
> > 
> > The patch does work and save a lot of debugging time.
> > Could we consider the "greatest memory consumer" as another useful 
> > OOM information?
> 
> This is rather situational considering there are memory leaks here and there but it is not necessary that straightforward as a single place of greatest consumer.

Agreed, but having the greatest memory consumer information does no harm
here.
Maybe you can share some cases to me?


The greatest memory consumer provides a strong clue of of a memory
leakage.
I have seen some different types of OOM issues.

1. task leakage, we can observe these by the kernel_stack numbers

2. memory fragmentation, check the ZONE memory status and the allocation
order

3. kmalloc leakage, check the slab numbers and let's say the number
kamlloc-512 is abnormal,
and we can enable kmemleak, reproduce the issue. Most of the time, I saw
a single backtrace of that leak.
It's helpful to have the greatest memory consumer in this case.

4. vmalloc leakage, we have no vmalloc numbers now. And I saw a case
that we pass a large number
into vmalloc() in a fuzzing test and it causes OOM kernel panic.
It is hard to reproduce the issue and kmemleak can do little help here
because it is a OOM kernel panic.
That is the issue which inspires me to create this patch. We found the
root cause by this approach.

5. OOM due to out of normal memory (in 32bit kernel), we can check the
allocate flags and the
zone memory status. In this case, we can try to check the memory
allocations and see if they can
use highmem. Knowing the greatest memory consumer may or may not be
useful here.

6. OOM caused by 2 or more different backtraces. I saw this once and we
enable PAGE_OWNER and
get the complete information of memory usage and locate the root cause.
Again, knowing the greatest
memory consumer is still a help in this issue.

7. OOM cause by alloc_pages(). There are no existing useful information
for this issue. 
CONFIG_PAGE_OWNER is useful and we can do more base on
CONFIG_PAGE_OWNER. (this patch)

> 
> The other question is why the offensive drivers that use alloc_pages() repeatedly without using any object allocator? Do you have examples of this in drivers that could happen?


For example, we're implementing our iommu driver and there are many
alloc_pages() in drivers/iommu.
This approach helps us located some memory leakages in our
implementation.

Thanks again for your comments
It's Christmas now so I think we can discuss after the Christmas break?

I have posted the number of issues addressed by this approach (7 real
problems since 2019/5) 
I think this approach can help people. :)


  Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
