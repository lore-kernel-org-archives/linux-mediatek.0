Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3475AC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05D122263
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LnJhxoF3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mp2Xzjek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B05D122263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ORK/z+HqllUVaYaLOAVC8MeRIoeUoQf4rQ9Hw7vcwNQ=; b=LnJhxoF39VxB6JPmswlRaHdCjI
	yqPV7wFr7EA8u1meQpsyPjA6KpNkHPzaf9MlUd+k9qzTTESrUlrqPpxTOhecySLli/aS4AaD1/zKu
	lQc1/sqrQoPpQxDQmOosc7eML8lKQKjG+MY7kyYYExJ6ddKi7W24cWcY77ibn3wqOZ6uK9P/ARSrC
	4YfXPrwHYqCZK6wHNtadJooLht8eXx2b0OwpdGwZIeOWmI+4kKLbBujsN4ZGeHq5b89M9CEPWUAOc
	9bNCRnrYiahUGmpds4K2R6ZfTcHyXuxArU3SttviiOTMJONKz2gvJnnk96UhxXK0aV4LCo1NkuVvI
	1+jbCdrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUTUJ-0004y6-Fn; Mon, 19 Oct 2020 11:38:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUTUA-0004uz-BZ; Mon, 19 Oct 2020 11:37:56 +0000
X-UUID: a9d616cce79148fc89882b7a51207444-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aNtNGXeJLGDumINEjf9bWj2sEZwVw3nV2iDSgN4Ie4I=; 
 b=mp2XzjekOuzWMA059D20L/sxhoiNY9V2AElGv9X5dTgtrDawc3SYTRZEWfXze9qEdYozfZuQaKTDwZUfQTH4Mas0z+RgDp4Hhhgpk+c5tLqs+HZS+swjcnimr6C/xUL3Y83t7Fks4VEbjekVZCqjvtNNG8Xxz4zuFwr3uOtE8Sg=;
X-UUID: a9d616cce79148fc89882b7a51207444-20201019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1736158208; Mon, 19 Oct 2020 03:37:45 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 04:37:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:37:28 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Oct 2020 19:37:27 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/4] MTK_IOMMU: Optimize mapping / unmapping performance
Date: Mon, 19 Oct 2020 19:30:56 +0800
Message-ID: <20201019113100.23661-1-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 15E5CB9EC7FD0FD48D83E2456A7D282C07A92B4951C0BD41AB454EE3475C52ED2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_073754_534445_7D7BD6DC 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: Jun Wen <jun.wen@mediatek.com>, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mingyuan Ma <mingyuan.ma@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

    For MTK platforms, mtk_iommu is using iotlb_sync(), tlb_add_range() and tlb_flush_walk/leaf()
to do tlb sync when iommu driver runs iova mapping/unmapping. But if buffer size is large,
it maybe consist of many pages(4K/8K/64K/1MB......). So iommu driver maybe run many times tlb
sync in mapping for this case and it will degrade performance seriously. In order to resolve the
issue, we hope to add iotlb_sync_range() callback in iommu_ops, it can appiont iova and size to
do tlb sync. MTK_IOMMU will use iotlb_sync_range() callback when the whole mapping/unmapping is
completed and remove iotlb_sync(), tlb_add_range() and tlb_flush_walk/leaf().
    So this patchset will replace iotlb_sync(), tlb_add_range() and tlb_flush_walk/leaf() with
iotlb_sync_range() callback.

Chao Hao (4):
  iommu: Introduce iotlb_sync_range callback
  iommu/mediatek: Add iotlb_sync_range() support
  iommu/mediatek: Remove unnecessary tlb sync
  iommu/mediatek: Adjust iotlb_sync_range

    drivers/iommu/dma-iommu.c |  9 +++++++++
    drivers/iommu/iommu.c     |  7 +++++++
    drivers/iommu/mtk_iommu.c | 36 ++++++++----------------------------
    include/linux/iommu.h     |  2 ++
    4 files changed, 26 insertions(+), 28 deletions(-)

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
