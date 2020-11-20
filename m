Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFBAC63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 09:19:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775612224C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 09:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SY8AA3Sz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="enZqSsOy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 775612224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NSyajqKUHn0gyT2bbnfhmtB5kRiHjjMBBKR8ZKpfLXY=; b=SY8AA3SzSX8r7OHBMy+bCMr8vu
	SragdVk+dXzz3hPav3eYEM89LIRY7rl8xIhSPBFXT4LlKePInlJUA1bRDk7D10EzgMzry0ah3pfUA
	bx5axA3SgsXZ/zvAmAYNr+WQH/muGuDNkK/FpEDKUQVY/R1lC3Qq3H2wltq1lrkWzBqpdfSbdiJen
	cjfkj1xHdbGbe/EHJNmcmGbf3ZcnO7EwozgsAU5x3ojHtjCBBRsJMx5SxLP5m/Yoxy+VSTtXuxCx7
	Co+YvYBvjXbfIvYqHfHklGW2GBRYJjPewxwLVXlNV2BF4r3bAnvuon90AHfQC7MJDFhj+6jZCL6rU
	n//qCwbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2Zr-0007HQ-Qy; Fri, 20 Nov 2020 09:19:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2Zh-0007Cf-0i; Fri, 20 Nov 2020 09:19:26 +0000
X-UUID: ce7bd5783c254096a32e1d8fb5728c70-20201120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Iywa6pDI4ybnQsPHQdv7ro+vWe35fQeZyL0aS3VhkOY=; 
 b=enZqSsOy7KiPxR/6YJ1tpQadJyquS5/qTo0e4kb7lEXR/RCx4SX/lIGeTA+G+0+K1tDutXvT8OiWVNpSQhza3JuvCYutBl0TKqyZq5LECu5cxU5vc0Ois7V5WK6wj2on6mF2eMuthqLXZ+ANqrkEQFw319A2xDxY0eze/MvktX8=;
X-UUID: ce7bd5783c254096a32e1d8fb5728c70-20201120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1670398377; Fri, 20 Nov 2020 01:17:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 01:07:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 17:07:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 17:07:10 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH] iommu: Improve the performance for direct_mapping
Date: Fri, 20 Nov 2020 17:06:28 +0800
Message-ID: <20201120090628.6566-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_041925_321862_D3AB69A2 
X-CRM114-Status: GOOD (  17.63  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently direct_mapping always use the smallest pgsize which is SZ_4K
normally to mapping. This is unnecessary. we could gather the size, and
call iommu_map then, iommu_map could decide how to map better with the
just right pgsize.

From the original comment, we should take care overlap, otherwise,
iommu_map may return -EEXIST. In this overlap case, we should map the
previous region before overlap firstly. then map the left part.

Each a iommu device will call this direct_mapping when its iommu
initialize, This patch is effective to improve the boot/initialization
time especially while it only needs level 1 mapping.

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/iommu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index df87c8e825f7..854a8fcb928d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -737,6 +737,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 	/* We need to consider overlapping regions for different devices */
 	list_for_each_entry(entry, &mappings, list) {
 		dma_addr_t start, end, addr;
+		size_t unmapped_sz = 0;
 
 		if (domain->ops->apply_resv_region)
 			domain->ops->apply_resv_region(dev, domain, entry);
@@ -752,10 +753,25 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 			phys_addr_t phys_addr;
 
 			phys_addr = iommu_iova_to_phys(domain, addr);
-			if (phys_addr)
+			if (phys_addr == 0) {
+				unmapped_sz += pg_size; /* Gather the size. */
 				continue;
+			}
 
-			ret = iommu_map(domain, addr, addr, pg_size, entry->prot);
+			if (unmapped_sz) {
+				/* Map the region before the overlap. */
+				ret = iommu_map(domain, start, start,
+						unmapped_sz, entry->prot);
+				if (ret)
+					goto out;
+				start += unmapped_sz;
+				unmapped_sz = 0;
+			}
+			start += pg_size;
+		}
+		if (unmapped_sz) {
+			ret = iommu_map(domain, start, start, unmapped_sz,
+					entry->prot);
 			if (ret)
 				goto out;
 		}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
