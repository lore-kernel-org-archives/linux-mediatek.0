Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C88DC71135
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 04:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyZas3Lvh7H1mCmhnuCgcLJvePyut78m/vXrr6Nd/VI=; b=a0lVcnyg3U8kJVq3m8+qgrPumS
	M+fyrmVOPcBJ9ARqp1l/uhdnraF8ciRYfImTNg3AL3+zIFZmUtkZUUMY5KOu6R49Vqt8hIUQ21aAN
	KVkjhKA/N12bDvzcpeWIg2nltJSD5rZK/LHciBlU504G8RJpmi511NHdq9odAJd3gvLjt8JXCsW4C
	mqe1wExOlIIcK7HMtD71IG59OsyAQ+AVrtq1WMyidYGsDTB1RHiEx7R3L3ltC7yuvEonlUVs0iK8i
	GRZ0Utk5tHhgkcVVHYt7M1eMDzeeyCYkbfQONEu+/yhVujMgPIAQvVWo7gvncISA3KZVk3/Z5o590
	t7IwvFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Gk-00000003KPg-1jdD;
	Mon, 16 Jun 2025 04:16:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR01e-00000003Co9-4767;
	Mon, 16 Jun 2025 02:56:48 +0000
X-UUID: 87d93a7a4a5d11f09eb0dd999d3936bf-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NyZas3Lvh7H1mCmhnuCgcLJvePyut78m/vXrr6Nd/VI=;
	b=umRThyxfmeafjAyB3xahYrQTJwXwge3mmgxiNX2UY6HI50RDqIzpO4IoI78IUVrQ2W/u4X1Ds3oizOGoKsjujmGYcgMmNO2NuFRa5kmOPZwkMock812k5rZWQtncpY4VvgWw5cLlB7qySmfXBdnRm42kTBqBir8RCzmzuPc9+TI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:52b27b3a-0921-4f2e-8519-e62a39816f04,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:09905cf,CLOUDID:6f3d7d28-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87d93a7a4a5d11f09eb0dd999d3936bf-20250615
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 76892640; Sun, 15 Jun 2025 19:56:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 10:56:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 10:56:37 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ning li
	<ning.li@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [RFC PATCH 3/8] iommu/arm-smmu-v3: Add implementation for MT8196 MM SMMU
Date: Mon, 16 Jun 2025 10:56:09 +0800
Message-ID: <20250616025628.25454-4-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_195647_024765_8AAAD0C9 
X-CRM114-Status: GOOD (  13.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add implementation for mediatek MM SMMU.

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-mediatek.c    | 72 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
index 381268968185..c00ee687d839 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
@@ -4,10 +4,80 @@
  * Author: Ning li <ning.li@mediatek.com>
  * Author: Xueqi Zhang <xueqi.zhang@mediatek.com>
  */
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 
 #include "arm-smmu-v3.h"
 
-struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu)
+#define MTK_SMMU_COMP_STR_LEN		64
+#define MTK_SMMU_HAS_FLAG(pdata, _x)    (!!(((pdata)->flags) & (_x)))
+
+enum mtk_smmu_type {
+	MTK_SMMU_MM,
+	MTK_SMMU_TYPE_NUM,
+};
+
+struct mtk_smmu_v3_plat {
+	enum mtk_smmu_type	smmu_type;
+	u32			flags;
+};
+
+struct mtk_smmu_v3 {
+	struct arm_smmu_device	smmu;
+	const struct mtk_smmu_v3_plat *plat_data;
+};
+
+static const struct mtk_smmu_v3_plat mt8196_data_mm = {
+	.smmu_type		= MTK_SMMU_MM,
+};
+
+struct mtk_smmu_v3_of_device_data {
+	char			compatible[MTK_SMMU_COMP_STR_LEN];
+	const void		*data;
+};
+
+static const struct mtk_smmu_v3_of_device_data mtk_smmu_v3_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-mm-smmu", .data = &mt8196_data_mm},
+};
+
+static inline struct mtk_smmu_v3 *to_mtk_smmu_v3(struct arm_smmu_device *smmu)
 {
+	return container_of(smmu, struct mtk_smmu_v3, smmu);
+}
+
+static const struct mtk_smmu_v3_plat *mtk_smmu_v3_get_plat_data(const struct device_node *np)
+{
+	const struct mtk_smmu_v3_of_device_data *of_device = mtk_smmu_v3_of_ids;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_smmu_v3_of_ids); i++, of_device++) {
+		if (of_device_is_compatible(np, of_device->compatible))
+			return of_device->data;
+	}
 	return NULL;
 }
+
+struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu)
+{
+	struct mtk_smmu_v3 *mtk_smmu_v3;
+	struct device *dev = smmu->dev;
+	struct platform_device *parent_pdev;
+	struct device_node *parent_node;
+
+	mtk_smmu_v3 = devm_krealloc(dev, smmu, sizeof(*mtk_smmu_v3), GFP_KERNEL);
+	if (!mtk_smmu_v3)
+		return ERR_PTR(-ENOMEM);
+
+	mtk_smmu_v3->plat_data = mtk_smmu_v3_get_plat_data(dev->of_node);
+	if (!mtk_smmu_v3->plat_data) {
+		dev_err(dev, "Get platform data fail\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &mtk_smmu_v3->smmu;
+}
-- 
2.46.0


