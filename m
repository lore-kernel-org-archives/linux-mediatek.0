Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B05C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dc/e9cXIcjXKqAy1pDtsf8k2O1HcIze+qCnGsuyy+M=; b=I1NboA992e0bRR
	C6HmkJ3UQqP2oKqx2g9E8JRC4LZPK9XOAansV7pSDHrZp6DOaCUXOyLRl4TeFAG4MgMqXskDTW+tF
	G/0FjQPpIlJxb/kU5PQbODBuKzRUPjb8Kd6B2tNFGaSNHY/C9xciJDne1Uqe7CunoFWIckPtpCwwB
	5KGioejQ0dmbW/t6y+Rv3+YizaE+IQqofzXf3D3Hy4S/2rFvTBXNlhk1wT+pgYMTMVuK/jFArK0qC
	6BwFTX1XCPItUkYCuWpU24MYP1Byo6fTGy0fYRIaJC8HL6b57nkIwxMOyuFiUghqYqts3k1NzWm0O
	pVh5yWOsZti1/T8Zz2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvk8H-00332r-3e; Fri, 10 Dec 2021 17:56:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvk4b-0030ut-20; Fri, 10 Dec 2021 17:52:46 +0000
X-UUID: 21bf670fe8c544f7a9b8b6cbcf9a6784-20211210
X-UUID: 21bf670fe8c544f7a9b8b6cbcf9a6784-20211210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 802192356; Fri, 10 Dec 2021 10:52:40 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:52:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:34 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 04/12] iommu/mediatek: Add APU iommu data for mt8195
Date: Sat, 11 Dec 2021 01:52:15 +0800
Message-ID: <20211210175223.31131-5-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_095245_149479_AB9B9E39 
X-CRM114-Status: GOOD (  10.87  )
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

Add hardware settins for support mt8195 apu iommu.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 drivers/iommu/mtk_iommu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 4bc7c76062e6..3fda9ad9f925 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -218,6 +218,13 @@ static const struct mtk_iommu_iova_region mt8192_multi_dom_apu[] = {
 	{ .iova_base = 0x70000000ULL,	.size = 0x12600000}, /* APU REG */
 };
 
+static const struct mtk_iommu_iova_region mt8195_multi_dom_apu[] = {
+	{ .iova_base = 0x0,		.size = SZ_4G}, /* APU DATA */
+	{ .iova_base = 0x8000000ULL,	.size = 0x8000000},  /* APU VLM */
+	{ .iova_base = 0x20000000ULL,	.size = 0xe0000000}, /* APU VPU */
+	{ .iova_base = 0x70000000ULL,	.size = 0x12600000}, /* APU REG */
+};
+
 /* If 2 M4U share a domain(use the same hwlist), Put the corresponding info in first data.*/
 static struct mtk_iommu_data *mtk_iommu_get_frst_data(struct list_head *hwlist)
 {
@@ -1312,6 +1319,18 @@ static const struct mtk_iommu_plat_data mt8192_data_apu = {
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom_apu),
 };
 
+static const struct mtk_iommu_plat_data mt8195_data_apu = {
+	.m4u_plat       = M4U_MT8195,
+	.flags          = DCM_DISABLE | MTK_IOMMU_TYPE_APU |
+			  SHARE_PGTABLE,
+	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
+	.hw_list        = &apulist,
+	.bank_nr	= 1,
+	.bank_enable    = {true},
+	.iova_region    = mt8195_multi_dom_apu,
+	.iova_region_nr = ARRAY_SIZE(mt8195_multi_dom_apu),
+};
+
 static const struct mtk_iommu_plat_data mt8195_data_infra = {
 	.m4u_plat	  = M4U_MT8195,
 	.flags            = WR_THROT_EN | DCM_DISABLE |
@@ -1368,6 +1387,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
 	{ .compatible = "mediatek,mt8192-iommu-apu",   .data = &mt8192_data_apu},
+	{ .compatible = "mediatek,mt8195-iommu-apu",   .data = &mt8195_data_apu},
 	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
 	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
 	{ .compatible = "mediatek,mt8195-iommu-vpp",   .data = &mt8195_data_vpp},
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
