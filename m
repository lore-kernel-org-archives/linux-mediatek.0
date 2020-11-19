Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C311C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:27:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8402E246AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXa/81gr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ap+5vWSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8402E246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFEnSCJI5+siQCbs+EYahIscpCHzZcphAuLxZx6zkTU=; b=qXa/81grz+TFYtCLKBgoR6CdIx
	VTPvFrz3RAyZL8FxCB1+4bSXhjmuwKlfAkfI4eznlwEIVN0hn7bZPGMIJUXZOCHKevuzZ79L8VesI
	jG6vpEUxWd4wyYgJZzO0gFNHAcvVwS5f/v6iMGECAEuni7PDf6hb1d27gbISV3xd6jchtqJ1fUsq3
	Tne6yr3I4rnC1kT224BCvKDJYhr/0/9VyK0YCaayeKGyKvApAPjHd+lft/UA2h3pg4RoYyF40CIF0
	as94cXPFHKlZ3K/1nQ8p0CM4rhMyJqhsxFAJSQn/PRGSIRVvSEJTwg+WOyLmnSORthWRcUS/EeyAs
	defLEZAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfdPj-0001bA-9K; Thu, 19 Nov 2020 06:27:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfdPV-0001Xu-2f; Thu, 19 Nov 2020 06:27:14 +0000
X-UUID: 11df1a346d3c4ade9f5d5fe99865e780-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5B5FYoeAyux0x1P5dVB4L5zKSpaj3qsCwIgOnxPWjuM=; 
 b=Ap+5vWSfOkefEJ3PR1aRsI4y03naC9a4eKOxKuTRg7Aaj3lkkTP/jWv9vR9VCupU2nxASzfBGGYPlqmIcCq2Dc61awHM/0SJxJf7xpmV9eH9/4rSwXsTv7m1LulIVw6UrQqC+bfw9NR3Ka8oAvgihXHSy24OvI7lPqQ1R4IGW1Y=;
X-UUID: 11df1a346d3c4ade9f5d5fe99865e780-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 77185153; Wed, 18 Nov 2020 22:26:55 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 22:18:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 14:18:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 14:18:42 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v2 0/6] MediaTek IOMMU improve tlb flush performance in
 map/unmap
Date: Thu, 19 Nov 2020 14:18:30 +0800
Message-ID: <20201119061836.15238-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_012713_437542_9710984D 
X-CRM114-Status: GOOD (  12.42  )
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
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, jun.wen@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset is to improve tlb flushing performance in iommu_map/unmap
for MediaTek IOMMU.

For iommu_map, currently MediaTek IOMMU use IO_PGTABLE_QUIRK_TLBI_ON_MAP
to do tlb_flush for each a memory chunk. this is so unnecessary. we could
improve it by tlb flushing one time at the end of iommu_map.

For iommu_unmap, currently we have already improve this performance by
gather. But the current gather should take care its granule size. if the
granule size is different, it will do tlb flush and gather again. Our HW
don't care about granule size. thus I add a flag(granule_ignore) for this
case.

After this patchset, we could achieve only tlb flushing once in iommu_map
and iommu_unmap.

Regardless of sg, for each a segment, I did a simple test:
  
  size = 20 * SZ_1M;
  /* the worst case, all are 4k mapping. */
  ret = iommu_map(domain, 0x5bb02000, 0x123f1000, size, IOMMU_READ);
  iommu_unmap(domain, 0x5bb02000, size);

This is the comparing time(unit is us):
              original-time  after-improve
   map-20M    59943           2347
   unmap-20M  264             36

This patchset also flush tlb once in the iommu_map_sg case.

patch [1/6][2/6][3/6] are for map while the others are for unmap.

change note:
v2: Refactor all the code.
    base on v5.10-rc1.

v1: https://lore.kernel.org/linux-iommu/20201019113100.23661-1-chao.hao@mediatek.com/

Yong Wu (6):
  iommu: Move iotlb_sync_map out from __iommu_map
  iommu: Add iova and size as parameters in iommu_iotlb_map
  iommu/mediatek: Add iotlb_sync_map to sync whole the iova range
  iommu: Add granule_ignore when tlb gather
  iommu/mediatek: Enable granule_ignore for unmap
  iommu/mediatek: Convert tlb_flush_walk to gather_add_page

 drivers/iommu/iommu.c      | 24 +++++++++++++++++++-----
 drivers/iommu/mtk_iommu.c  | 32 ++++++++++++++++++++++++++------
 drivers/iommu/tegra-gart.c |  3 ++-
 include/linux/iommu.h      |  7 +++++--
 4 files changed, 52 insertions(+), 14 deletions(-)

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
