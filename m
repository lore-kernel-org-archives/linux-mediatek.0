Return-Path: <SRS0=Aqg+=2Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC90C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Dec 2019 04:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D2302075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Dec 2019 04:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ajOuITeZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="byBjXLMO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D2302075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raqoGEPfyPelWUDFxxmaKX0wG0Gb2kL1vO4wIzi6Tww=; b=ajOuITeZaRK9T0
	YgjT657mdNtWY0iNsdELfe7hwkSfTCnk6tVL6lxsMuNmkGiFWYKYmmnzWek2/3uz0zW3jnwKT82l6
	uPO9zq66gENSna0ewLJYzCLxLmuVm/kkSkuAgPj6O1U2aFaPs1GxoYAebTwKQ9UzGwArPoFu0OGFM
	f3sR9jiS0rdJqMiazwAVIUgCyLSHfRZHxRdR8l4bbmxFm2hRN1lVp54bFLKv8XUkXMYav5Ne92jHM
	7XhJyN4qNbVKaj0oYKcXZZEwg6u9rparcEfe4o9rjKb9CeW0iCnnpyVIhSLqSOuRK5e3pX0H076h5
	3bD+faljBnQvOwC9ZHzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikKL1-00046Z-Gh; Thu, 26 Dec 2019 04:01:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikKKx-000462-VU
 for linux-mediatek@lists.infradead.org; Thu, 26 Dec 2019 04:01:25 +0000
X-UUID: 50f7c5697c55462fbdb3cd8385dd00d3-20191225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SOFsA6XoDQBIw637BsIfztzTRDRPnBhAyPLmANxVkxc=; 
 b=byBjXLMOx4RGQl+0mmjFyHddsPhZtRtybLd6njGLzBT3ZP8mBkaLB0eLFc6qaruw5vIya506WUd/W2fF55Q1k6gxb2dV+AErQSBNONHSSX6JB5+wQ34AJ7XxbTMfBBnL9XfuOrtD6XKq1vhrkVYncpusw8unia2nuT32qF1yt6g=;
X-UUID: 50f7c5697c55462fbdb3cd8385dd00d3-20191225
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2095694480; Wed, 25 Dec 2019 20:01:19 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Dec 2019 20:01:44 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Dec 2019 12:01:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 26 Dec 2019 12:00:10 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] mm/page_owner: print largest memory consumer when OOM
 panic occurs
Date: Thu, 26 Dec 2019 12:01:14 +0800
Message-ID: <20191226040114.8123-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1806FE86&#45;9508&#45;43BC&#45;8E2F&#45;3620CD243B14@lca.pw>
References: <1806FE86&#45;9508&#45;43BC&#45;8E2F&#45;3620CD243B14@lca.pw>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191225_200124_019987_06EC6D48 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Not sure if you have code that can share but I can't imagine there are many places that would have a single call site in the driver doing alloc_pages() over and over again. For example, there is only two alloc_pages() in intel-iommu.c with one is only in the cold path, so even if alloc_pgtable_page() one do leaking, it is still up to there air if your patch will catch it because it may not a single call site and it needs to leak significant amount of memory to be the greatest consumer where it is just not so realistic. 

That is what the patch does -- targeting on the memory leakage which causes an OOM kernel panic, so the greatest consumer information helps (the amount of leakage is big enough to cause an OOM kernel panic)

I've posted the number of real problems since 2019/5 I solved by this approach.

  Miles
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
