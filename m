Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AE2C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:27:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 545DB246AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GlvpSxA3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cH0y2BVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 545DB246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G7w8/8ntR9eIMT2mJPkx1IjTpmPbbbsqhcG3vsH/sys=; b=GlvpSxA36OUMXB58yumyUgQm7
	/zy0GijeD6EYwqs4r+KwOaWwJz/QNEEHNkLit7xM958NE+5gQiGybfKIw9rrmBkg2HQD8C+sP7zk2
	uzsJ+nSHg6JWC2a4p+4QPvGOZyPcUJ3BjmJucy0I82h3iWI4AJCrSJ//TOo5YifQPHth6lzF4dNUw
	tbxZTx6vYUqvWyHR3I47bH17W5T7JcSABnN7TTl1tYxS+DWQ6pJt+4s8164MiDJTbQLuirAYFMrno
	hfNUYaT6wuKBpj6FlJC/I6N4j1yK/E2fPmEOp5WJCdcFQOc4IqOj/BZ47JDG89ugqzNz5f459Rc1H
	BQeQxk6WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfdPs-0001dD-IN; Thu, 19 Nov 2020 06:27:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfdPW-0001Xx-U4; Thu, 19 Nov 2020 06:27:16 +0000
X-UUID: 1576fb255de64cd784dc6f54cde11066-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ioem/N90dye+4AvaddbOXGvKCEWYhEsXSifGJdwDonE=; 
 b=cH0y2BVMDrukZV42uqZRRKgBmdy2NMTnVOk3AFWTgEgkmXXvZLAqK8axKYwxYzk7bcUsKqZJZ185Zcqlx3t0bgUCNb1Wlq/KiRuT/gEsS3DLzapEQYZ3Karz9pZDqv4ifN2Rj6Ej1cwsuHKTDwM7QKaSbe1XBO+AKrc/FOKwwII=;
X-UUID: 1576fb255de64cd784dc6f54cde11066-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1144522444; Wed, 18 Nov 2020 22:26:55 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 22:19:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 14:19:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 14:19:06 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v2 3/6] iommu/mediatek: Add iotlb_sync_map to sync whole the
 iova range
Date: Thu, 19 Nov 2020 14:18:33 +0800
Message-ID: <20201119061836.15238-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201119061836.15238-1-yong.wu@mediatek.com>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_012715_207451_382733EE 
X-CRM114-Status: GOOD (  13.87  )
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

Remove IO_PGTABLE_QUIRK_TLBI_ON_MAP to avoid tlb sync for each a small
chunk memory, Use the new iotlb_sync_map to tlb_sync once for whole the
iova range of iommu_map.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
After reading msm_iommu.c, It looks IO_PGTABLE_QUIRK_TLBI_ON_MAP can be
removed.
---
 drivers/iommu/mtk_iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index c072cee532c2..8c2d4a225666 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -323,7 +323,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 	dom->cfg = (struct io_pgtable_cfg) {
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
-			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
 			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
 		.ias = 32,
@@ -454,6 +453,14 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 				       data);
 }
 
+static void mtk_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
+			       size_t size)
+{
+	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+
+	mtk_iommu_tlb_flush_range_sync(iova, size, size, dom->data);
+}
+
 static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 					  dma_addr_t iova)
 {
@@ -540,6 +547,7 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.unmap		= mtk_iommu_unmap,
 	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
 	.iotlb_sync	= mtk_iommu_iotlb_sync,
+	.iotlb_sync_map	= mtk_iommu_sync_map,
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
