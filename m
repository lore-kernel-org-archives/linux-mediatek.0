Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794CEC0018C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:36:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D413723356
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D413723356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWtwscmKNZVe9LeDbn9X8t0yWUcVO1LqZERDyCZTGtY=; b=ypJGFexC5c/nxLbAv52O6rWs5y
	6NADRk0TK7UQwebtbaMn5jrAB15MyABlq330yLBWksW1mLeyAoQqiGRfcR+Y/5oDTU8wS472pv0Gb
	wnEeZSv1PrR5G/HLicT1hb5jw71zelMw13j8Uf7QJZ0uvY1nzro8rfCaY4tuF79hFl0fkSkK+XRW9
	T4D9t+JfAGmEFtpPFyEmknj/YNGSkYNnZ3IjFEbnDCe1RCobDx7JGM9DIUyK0MmV4U788liWpj41i
	CKn8MdVh1kno8aiYIHQx1VtIIGnTsKzp7Xwuc9ZgQC0FUMVHMRkDNVwukL6HRIhs1gR4I+nb5voCI
	cvR1SL0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpUAc-0008Ni-26; Wed, 16 Dec 2020 10:36:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpUAR-0008KQ-RZ; Wed, 16 Dec 2020 10:36:27 +0000
X-UUID: 1f01928bef0a4deda6e40a165ba4a3cc-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RUEMA8JdHFnQoro1s2tKclBgBlRJ8Ayx4yGw8mYewYA=; 
 b=t07ZgCFvWmLXDg5zpTwxFTe9e2NpRr8jnfL5l7cHOgHdMLpmmH3JbEOQ2fBvCoJk2F3oRmhcAPF1v3BQI3mJ6hHYhKu4+zl5FHqrEjFGB4zzSUksW9ifXT6ArfCAJ6MTiGoNmcbWtgUsPvut/pogam5IJA2SswUM7HkPgudVzpU=;
X-UUID: 1f01928bef0a4deda6e40a165ba4a3cc-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1833271664; Wed, 16 Dec 2020 02:36:17 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 02:36:16 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 18:36:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 18:36:11 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v3 0/7] MediaTek IOMMU improve tlb flush performance in
 map/unmap
Date: Wed, 16 Dec 2020 18:36:00 +0800
Message-ID: <20201216103607.23050-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_053624_216765_E2E2558B 
X-CRM114-Status: GOOD (  11.93  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
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
don't care about granule size. thus I gather the range in our file.

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

patch [1/7][2/7][3/7] are for map while the others are for unmap.

This patchset base on:
  a) mt8192 iommu v5
https://lore.kernel.org/linux-iommu/20201209080102.26626-1-yong.wu@mediatek.com/T/#t
  b) iommu/io-pgtable: Remove tlb_flush_leaf
https://lore.kernel.org/linux-iommu/160744101816.3622130.16266834943434854326.b4-ty@kernel.org/T/#mc8fbc98bee8bca865d73c873275ab34fed1c25c7

change note:
v3: Refactor the unmap flow suggested by Robin.
     
v2: https://lore.kernel.org/linux-iommu/20201119061836.15238-1-yong.wu@mediatek.com/
    Refactor all the code.
    base on v5.10-rc1.

Yong Wu (7):
  iommu: Move iotlb_sync_map out from __iommu_map
  iommu: Add iova and size as parameters in iotlb_sync_map
  iommu/mediatek: Add iotlb_sync_map to sync whole the iova range
  iommu: Switch gather->end to unsigned long long
  iommu: Allow io_pgtable_tlb ops optional
  iommu/mediatek: Gather iova in iommu_unmap to achieve tlb sync once
  iommu/mediatek: Remove the tlb-ops for v7s

 drivers/iommu/iommu.c      | 24 +++++++++++++++-----
 drivers/iommu/mtk_iommu.c  | 45 +++++++++++++++-----------------------
 drivers/iommu/tegra-gart.c |  3 ++-
 include/linux/io-pgtable.h |  8 ++++---
 include/linux/iommu.h      |  8 ++++---
 5 files changed, 49 insertions(+), 39 deletions(-)

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
