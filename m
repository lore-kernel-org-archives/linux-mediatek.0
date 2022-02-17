Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEF6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5xEwAjyPkVzBwYBI+43Jx2P13AqrX8VpvMA2wKZeK8=; b=e0XcVCNQp75JRo
	cgV/MZ09E9aBnyqwhSOqs/v7+iLvxWikAXs2WN0apMUMsKd3+h34AMkP3+3eZfi9hAkZ/xIwGBRh7
	J/qchktSIpSNYS5qD4tWXAXJAsq+jgObl9ebAY1VKtxlTJwI2WGAG8YS9a5Oyh3nydpjFtKz9UZNm
	JwTI53Zq+aF/+M5TofjrLfk5GZckwJ+qf9wnIfulAvO3dmwDGClHdGYoGoD6CfzcQLA77wyIBir6o
	09BwX/cCCi/m7OKTgnXPep5HnL9O0MSbFBahe2SDy5HysvDpNwTT2ScVHkbM4HyqiREZlpVYIijlB
	eDbERi66TyvzuopxsCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKfHr-00ABru-H7; Thu, 17 Feb 2022 11:49:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKfEI-00AA0x-14; Thu, 17 Feb 2022 11:45:47 +0000
X-UUID: cb6f194093304028a085b3b22432fdad-20220217
X-UUID: cb6f194093304028a085b3b22432fdad-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1513271880; Thu, 17 Feb 2022 04:45:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 03:38:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 19:38:57 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 19:38:56 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v5 25/34] iommu/mediatek: Separate mtk_iommu_data for v1 and v2
Date: Thu, 17 Feb 2022 19:34:44 +0800
Message-ID: <20220217113453.13658-26-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220217113453.13658-1-yong.wu@mediatek.com>
References: <20220217113453.13658-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_034546_100157_9EB892E9 
X-CRM114-Status: GOOD (  21.34  )
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

Prepare for adding the structure "mtk_iommu_bank_data". No functional
change. The mtk_iommu_domain in v1 and v2 are different, we could not add
current data as bank[0] in v1 simplistically.

Currently we have no plan to add new SoC for v1, in order to avoid affect
v1 when we add many new features for v2, I totally separate v1 and v2 in
this patch, there are many structures only for v2.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c    | 82 +++++++++++++++++++++++++++++++++---
 drivers/iommu/mtk_iommu.h    | 81 -----------------------------------
 drivers/iommu/mtk_iommu_v1.c | 29 +++++++++++++
 3 files changed, 106 insertions(+), 86 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index efba08774c52..1827dc732917 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -146,6 +146,69 @@
 
 #define MTK_INVALID_LARBID		MTK_LARB_NR_MAX
 
+#define MTK_LARB_COM_MAX	8
+#define MTK_LARB_SUBCOM_MAX	8
+
+#define MTK_IOMMU_GROUP_MAX	8
+
+enum mtk_iommu_plat {
+	M4U_MT2712,
+	M4U_MT6779,
+	M4U_MT8167,
+	M4U_MT8173,
+	M4U_MT8183,
+	M4U_MT8192,
+	M4U_MT8195,
+};
+
+struct mtk_iommu_iova_region {
+	dma_addr_t		iova_base;
+	unsigned long long	size;
+};
+
+struct mtk_iommu_plat_data {
+	enum mtk_iommu_plat	m4u_plat;
+	u32			flags;
+	u32			inv_sel_reg;
+
+	char			*pericfg_comp_str;
+	struct list_head	*hw_list;
+	unsigned int		iova_region_nr;
+	const struct mtk_iommu_iova_region	*iova_region;
+	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
+};
+
+struct mtk_iommu_data {
+	void __iomem			*base;
+	int				irq;
+	struct device			*dev;
+	struct clk			*bclk;
+	phys_addr_t			protect_base; /* protect memory base */
+	struct mtk_iommu_suspend_reg	reg;
+	struct mtk_iommu_domain		*m4u_dom;
+	struct iommu_group		*m4u_group[MTK_IOMMU_GROUP_MAX];
+	bool                            enable_4GB;
+	spinlock_t			tlb_lock; /* lock for tlb range flush */
+
+	struct iommu_device		iommu;
+	const struct mtk_iommu_plat_data *plat_data;
+	struct device			*smicomm_dev;
+
+	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
+	struct regmap			*pericfg;
+
+	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
+
+	/*
+	 * In the sharing pgtable case, list data->list to the global list like m4ulist.
+	 * In the non-sharing pgtable case, list data->list to the itself hw_list_head.
+	 */
+	struct list_head		*hw_list;
+	struct list_head		hw_list_head;
+	struct list_head		list;
+	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
+};
+
 struct mtk_iommu_domain {
 	struct io_pgtable_cfg		cfg;
 	struct io_pgtable_ops		*iop;
@@ -156,6 +219,20 @@ struct mtk_iommu_domain {
 	struct mutex			mutex; /* Protect "data" in this structure */
 };
 
+static int mtk_iommu_bind(struct device *dev)
+{
+	struct mtk_iommu_data *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, &data->larb_imu);
+}
+
+static void mtk_iommu_unbind(struct device *dev)
+{
+	struct mtk_iommu_data *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, &data->larb_imu);
+}
+
 static const struct iommu_ops mtk_iommu_ops;
 
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
@@ -193,11 +270,6 @@ static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 
 #define for_each_m4u(data, head)  list_for_each_entry(data, head, list)
 
-struct mtk_iommu_iova_region {
-	dma_addr_t		iova_base;
-	unsigned long long	size;
-};
-
 static const struct mtk_iommu_iova_region single_domain[] = {
 	{.iova_base = 0,		.size = SZ_4G},
 };
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 9dba98bb12eb..d332f9769f83 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -7,23 +7,14 @@
 #ifndef _MTK_IOMMU_H_
 #define _MTK_IOMMU_H_
 
-#include <linux/clk.h>
-#include <linux/component.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
-#include <linux/list.h>
 #include <linux/spinlock.h>
-#include <linux/dma-mapping.h>
 #include <soc/mediatek/smi.h>
 #include <dt-bindings/memory/mtk-memory-port.h>
 
-#define MTK_LARB_COM_MAX	8
-#define MTK_LARB_SUBCOM_MAX	8
-
-#define MTK_IOMMU_GROUP_MAX	8
-
 struct mtk_iommu_suspend_reg {
 	union {
 		u32			standard_axi_mode;/* v1 */
@@ -38,64 +29,6 @@ struct mtk_iommu_suspend_reg {
 	u32				wr_len_ctrl;
 };
 
-enum mtk_iommu_plat {
-	M4U_MT2701,
-	M4U_MT2712,
-	M4U_MT6779,
-	M4U_MT8167,
-	M4U_MT8173,
-	M4U_MT8183,
-	M4U_MT8192,
-	M4U_MT8195,
-};
-
-struct mtk_iommu_iova_region;
-
-struct mtk_iommu_plat_data {
-	enum mtk_iommu_plat m4u_plat;
-	u32                 flags;
-	u32                 inv_sel_reg;
-
-	char					*pericfg_comp_str;
-	struct list_head			*hw_list;
-	unsigned int				iova_region_nr;
-	const struct mtk_iommu_iova_region	*iova_region;
-	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
-};
-
-struct mtk_iommu_domain;
-
-struct mtk_iommu_data {
-	void __iomem			*base;
-	int				irq;
-	struct device			*dev;
-	struct clk			*bclk;
-	phys_addr_t			protect_base; /* protect memory base */
-	struct mtk_iommu_suspend_reg	reg;
-	struct mtk_iommu_domain		*m4u_dom;
-	struct iommu_group		*m4u_group[MTK_IOMMU_GROUP_MAX];
-	bool                            enable_4GB;
-	spinlock_t			tlb_lock; /* lock for tlb range flush */
-
-	struct iommu_device		iommu;
-	const struct mtk_iommu_plat_data *plat_data;
-	struct device			*smicomm_dev;
-
-	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
-	struct regmap			*pericfg;
-
-	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
-
-	/*
-	 * In the sharing pgtable case, list data->list to the global list like m4ulist.
-	 * In the non-sharing pgtable case, list data->list to the itself hw_list_head.
-	 */
-	struct list_head		*hw_list;
-	struct list_head		hw_list_head;
-	struct list_head		list;
-	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
-};
-
 static inline int compare_of(struct device *dev, void *data)
 {
 	return dev->of_node == data;
@@ -106,18 +39,4 @@ static inline void release_of(struct device *dev, void *data)
 	of_node_put(data);
 }
 
-static inline int mtk_iommu_bind(struct device *dev)
-{
-	struct mtk_iommu_data *data = dev_get_drvdata(dev);
-
-	return component_bind_all(dev, &data->larb_imu);
-}
-
-static inline void mtk_iommu_unbind(struct device *dev)
-{
-	struct mtk_iommu_data *data = dev_get_drvdata(dev);
-
-	component_unbind_all(dev, &data->larb_imu);
-}
-
 #endif
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 4052aad75a81..69903ba6c274 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -87,6 +87,21 @@
  */
 #define M2701_IOMMU_PGT_SIZE			SZ_4M
 
+struct mtk_iommu_data {
+	void __iomem			*base;
+	int				irq;
+	struct device			*dev;
+	struct clk			*bclk;
+	phys_addr_t			protect_base; /* protect memory base */
+	struct mtk_iommu_domain		*m4u_dom;
+
+	struct iommu_device		iommu;
+	struct dma_iommu_mapping	*mapping;
+	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
+
+	struct mtk_iommu_suspend_reg	reg;
+};
+
 struct mtk_iommu_domain {
 	spinlock_t			pgtlock; /* lock for page table */
 	struct iommu_domain		domain;
@@ -95,6 +110,20 @@ struct mtk_iommu_domain {
 	struct mtk_iommu_data		*data;
 };
 
+static int mtk_iommu_bind(struct device *dev)
+{
+	struct mtk_iommu_data *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, &data->larb_imu);
+}
+
+static void mtk_iommu_unbind(struct device *dev)
+{
+	struct mtk_iommu_data *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, &data->larb_imu);
+}
+
 static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 {
 	return container_of(dom, struct mtk_iommu_domain, domain);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
