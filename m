Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2354FC11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C0061D81
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C0061D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blpaCgFHXBby9Fs+JWYhJzxzHptViv7qm2m+9MNtBl4=; b=P2zs4o/YqOOO1B
	fKEFqDO8S0q2gkO1j8e8EOaqne1b9tFAus3uzfZr40khn26tO8IfQgcAB91tz9mjd4oImJyhwoK7D
	jGf9uD1bXbMBmHk2nxj4NdTguTMLxHsYlbZi2ftwc27LElxWGeElAUm43eAcfwp3tYD9k7BlhYAWa
	hlTU8yy8kuirr0pfpnLhGsOZWD22hOGPM5nFKf+CD69VgcjVSrn7VGTFRKGf5myYmlnjiYrNUUhP8
	Z4lkiHHF5AWJA1gHuYRJOR7GvekuU0N8K8JRxlIoN4aFqACtREE8M+3kdvaPZ33bcxRTgTHcm3WPf
	y8LWTgLGMIy3KDOXiCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQCI-00CVYb-CY; Wed, 30 Jun 2021 02:43:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQBR-00CVGd-Qa; Wed, 30 Jun 2021 02:42:39 +0000
X-UUID: 3482484cec2545e8a5df451d70117135-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xg7rpVAP0mj6QT8NAdtOfxR/rVCDxY7oXnfvId6tyjQ=; 
 b=HOKzo5D96CuzXLfgz1Zspwc6597U/CxIGhdAwUY917YkE7s45gTaHjTwaDzevivh1954Au8ptRjl6Z85VyyhIEp0vT2n90+P5R7P3eeRLsOSciZ2McVNFRJFbWE+xnRxjGg1QgaEg9P7NYYSUTBpo95kUysBt+g5rZty5vf2mac=;
X-UUID: 3482484cec2545e8a5df451d70117135-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 899733756; Tue, 29 Jun 2021 19:42:33 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:36:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:36:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:36:45 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH 11/24] iommu/mediatek: Add SUB_COMMON_3BITS flag
Date: Wed, 30 Jun 2021 10:34:51 +0800
Message-ID: <20210630023504.18177-12-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_194237_900384_D5228306 
X-CRM114-Status: GOOD (  16.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In prevous SoC, the sub common id occupy 2 bits. the mt8195's sub common
id has 3bits. Add a new flag for this. and rename the prevous flag to
_2BITS. For readable, I put these two flags together, then move the
other flags. no functional change.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 26 ++++++++++++++++----------
 drivers/iommu/mtk_iommu.h |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 35e321ed6d3d..b770cb5893b2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -107,6 +107,8 @@
 #define REG_MMU1_INT_ID				0x154
 #define F_MMU_INT_ID_COMM_ID(a)			(((a) >> 9) & 0x7)
 #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
+#define F_MMU_INT_ID_COMM_ID_EXT(a)		(((a) >> 10) & 0x7)
+#define F_MMU_INT_ID_SUB_COMM_ID_EXT(a)		(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
@@ -118,13 +120,14 @@
 #define HAS_VLD_PA_RNG			BIT(2)
 #define RESET_AXI			BIT(3)
 #define OUT_ORDER_WR_EN			BIT(4)
-#define HAS_SUB_COMM			BIT(5)
-#define WR_THROT_EN			BIT(6)
-#define HAS_LEGACY_IVRP_PADDR		BIT(7)
-#define IOVA_34_EN			BIT(8)
-#define SHARE_PGTABLE			BIT(9) /* 2 HW share pgtable */
-#define DCM_DISABLE			BIT(10)
-#define NOT_STD_AXI_MODE		BIT(11)
+#define HAS_SUB_COMM_2BITS		BIT(5)
+#define HAS_SUB_COMM_3BITS		BIT(6)
+#define WR_THROT_EN			BIT(7)
+#define HAS_LEGACY_IVRP_PADDR		BIT(8)
+#define IOVA_34_EN			BIT(9)
+#define SHARE_PGTABLE			BIT(10) /* 2 HW share pgtable */
+#define DCM_DISABLE			BIT(11)
+#define NOT_STD_AXI_MODE		BIT(12)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
@@ -294,9 +297,12 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	fault_pa |= (u64)pa34_32 << 32;
 
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_2BITS)) {
 		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
 		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
+	} else if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_3BITS)) {
+		fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
+		sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
 	} else {
 		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
 	}
@@ -1030,7 +1036,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat      = M4U_MT6779,
-	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN |
+	.flags         = HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN | WR_THROT_EN |
 			 NOT_STD_AXI_MODE,
 	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
 	.iova_region   = single_domain,
@@ -1068,7 +1074,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
-	.flags          = HAS_BCLK | HAS_SUB_COMM | OUT_ORDER_WR_EN |
+	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
 			  WR_THROT_EN | IOVA_34_EN | NOT_STD_AXI_MODE,
 	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
 	.iova_region    = mt8192_multi_dom,
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index a41334b12b20..ce11e260d1d7 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -20,7 +20,7 @@
 #include <dt-bindings/memory/mtk-memory-port.h>
 
 #define MTK_LARB_COM_MAX	8
-#define MTK_LARB_SUBCOM_MAX	4
+#define MTK_LARB_SUBCOM_MAX	8
 
 #define MTK_IOMMU_GROUP_MAX	8
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
