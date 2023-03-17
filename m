Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1292AC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3entTdCvHNayAO/y47dlHOH6X33xCBWJvBs6qAEu2Hk=; b=fIyEVUsgWZYtrWerjKSq7fy1V+
	Y7e/pRqR5V5O+dPuXAPO3sxRlaFcidXkPuctWFe+MyE0QAwpM1kpJTIqhUg/damd6mDOpCh7BS8j1
	uMFfj45cqmA/Dvh8y0fehk+UlQ0G1Ku6+kaTSYyVQX+rEFyyuquZP5I+VL7I8taGmtnr9hoU8hQtl
	MIF9W807fEwcZFK/8jVECfZXVUVhHElDYcyUKwvbsDF/1gDsGWkYIVIPzCThfYvk8naoGzMQgSBY+
	Zz6CfU1sM29F+Z1ce2P3LpoOBbh2qQDheq2BDQ0KTx+vwTXmseXZlVh6b98wGtgWbFCT86b26FMbo
	fulIZ53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5C1-001Pfl-1O;
	Fri, 17 Mar 2023 08:12:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5Bx-001Pdj-1e
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Mar 2023 08:12:03 +0000
X-UUID: 5f44d1ccc49b11ed86fbcd8805c7ac66-20230317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3entTdCvHNayAO/y47dlHOH6X33xCBWJvBs6qAEu2Hk=;
	b=HyZwMKh45fckb4dCT3RIUTQ24PG348rIropfhFETeMKGLJ9RI9oU767TRzV5N49cm/N+WRANNvZsRDpAyCILzqfVSWlI59DW1SfGnuXnS03AimGJOcdk73HCyurfpSO6tQ9HBknR5MW1AV0aWCns1rTWmdz6v42yGtGd/yrlsL4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:6871569a-2701-4988-a0da-85f60dd35ae4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:83295aa,CLOUDID:503dac28-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5f44d1ccc49b11ed86fbcd8805c7ac66-20230317
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yanchao.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 701237271; Fri, 17 Mar 2023 01:11:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 16:11:17 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 16:11:15 +0800
From: Yanchao Yang <yanchao.yang@mediatek.com>
To: Loic Poulain <loic.poulain@linaro.org>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev ML
	<netdev@vger.kernel.org>, kernel ML <linux-kernel@vger.kernel.org>
CC: Intel experts <linuxwwan@intel.com>, Chetan <m.chetan.kumar@intel.com>,
	MTK ML <linux-mediatek@lists.infradead.org>, Liang Lu
	<liang.lu@mediatek.com>, Haijun Liu <haijun.liu@mediatek.com>, Hua Yang
	<hua.yang@mediatek.com>, Ting Wang <ting.wang@mediatek.com>, Felix Chen
	<felix.chen@mediatek.com>, Mingliang Xu <mingliang.xu@mediatek.com>, Min Dong
	<min.dong@mediatek.com>, Aiden Wang <aiden.wang@mediatek.com>, Guohao Zhang
	<guohao.zhang@mediatek.com>, Chris Feng <chris.feng@mediatek.com>, Yanchao
 Yang <yanchao.yang@mediatek.com>, Lambert Wang <lambert.wang@mediatek.com>,
	Mingchuang Qiao <mingchuang.qiao@mediatek.com>, Xiayu Zhang
	<xiayu.zhang@mediatek.com>, Haozhe Chang <haozhe.chang@mediatek.com>
Subject: [PATCH net-next v4 02/10] net: wwan: tmi: Add control plane transaction layer
Date: Fri, 17 Mar 2023 16:09:34 +0800
Message-ID: <20230317080942.183514-3-yanchao.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230317080942.183514-1-yanchao.yang@mediatek.com>
References: <20230317080942.183514-1-yanchao.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_011201_558269_6617ED29 
X-CRM114-Status: GOOD (  20.29  )
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

The control plane implements TX services that reside in the transaction layer.
The services receive the packets from the port layer and call the corresponding
DMA components to transmit data to the device. Meanwhile, TX services receive
and manage the port control commands from the port layer.

The control plane implements RX services that reside in the transaction layer.
The services receive the downlink packets from the modem and transfer the
packets to the corresponding port layer interfaces.

Signed-off-by: Yanchao Yang <yanchao.yang@mediatek.com>
Signed-off-by: Mingliang Xu <mingliang.xu@mediatek.com>
---
 drivers/net/wwan/mediatek/Makefile         |  4 +-
 drivers/net/wwan/mediatek/mtk_ctrl_plane.c | 36 +++++++++++++
 drivers/net/wwan/mediatek/mtk_ctrl_plane.h | 30 +++++++++++
 drivers/net/wwan/mediatek/mtk_dev.c        | 25 +++++++++
 drivers/net/wwan/mediatek/mtk_dev.h        |  3 ++
 drivers/net/wwan/mediatek/pcie/mtk_pci.c   | 62 ++++++++++++++++++++++
 6 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wwan/mediatek/mtk_ctrl_plane.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_ctrl_plane.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_dev.c

diff --git a/drivers/net/wwan/mediatek/Makefile b/drivers/net/wwan/mediatek/Makefile
index b74192eee432..c93c81597821 100644
--- a/drivers/net/wwan/mediatek/Makefile
+++ b/drivers/net/wwan/mediatek/Makefile
@@ -3,6 +3,8 @@
 MODULE_NAME := mtk_tmi
 
 mtk_tmi-y = \
-	pcie/mtk_pci.o
+	pcie/mtk_pci.o	\
+	mtk_dev.o	\
+	mtk_ctrl_plane.o
 
 obj-$(CONFIG_MTK_TMI) += mtk_tmi.o
diff --git a/drivers/net/wwan/mediatek/mtk_ctrl_plane.c b/drivers/net/wwan/mediatek/mtk_ctrl_plane.c
new file mode 100644
index 000000000000..1dbfcf8587a1
--- /dev/null
+++ b/drivers/net/wwan/mediatek/mtk_ctrl_plane.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/freezer.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/sched.h>
+#include <linux/wait.h>
+
+#include "mtk_ctrl_plane.h"
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk;
+
+	ctrl_blk = devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNEL);
+	if (!ctrl_blk)
+		return -ENOMEM;
+
+	ctrl_blk->mdev = mdev;
+	mdev->ctrl_blk = ctrl_blk;
+
+	return 0;
+}
+
+int mtk_ctrl_exit(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk = mdev->ctrl_blk;
+
+	devm_kfree(mdev->dev, ctrl_blk);
+
+	return 0;
+}
diff --git a/drivers/net/wwan/mediatek/mtk_ctrl_plane.h b/drivers/net/wwan/mediatek/mtk_ctrl_plane.h
new file mode 100644
index 000000000000..77af4248cb74
--- /dev/null
+++ b/drivers/net/wwan/mediatek/mtk_ctrl_plane.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_CTRL_PLANE_H__
+#define __MTK_CTRL_PLANE_H__
+
+#include <linux/kref.h>
+#include <linux/skbuff.h>
+
+#include "mtk_dev.h"
+
+#define VQ_MTU_3_5K			(0xE00)
+#define VQ_MTU_63K			(0xFC00)
+
+struct mtk_ctrl_trans {
+	struct mtk_ctrl_blk *ctrl_blk;
+	struct mtk_md_dev *mdev;
+};
+
+struct mtk_ctrl_blk {
+	struct mtk_md_dev *mdev;
+	struct mtk_ctrl_trans *trans;
+};
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev);
+int mtk_ctrl_exit(struct mtk_md_dev *mdev);
+
+#endif /* __MTK_CTRL_PLANE_H__ */
diff --git a/drivers/net/wwan/mediatek/mtk_dev.c b/drivers/net/wwan/mediatek/mtk_dev.c
new file mode 100644
index 000000000000..f63c7e04df6a
--- /dev/null
+++ b/drivers/net/wwan/mediatek/mtk_dev.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#include "mtk_ctrl_plane.h"
+#include "mtk_dev.h"
+
+int mtk_dev_init(struct mtk_md_dev *mdev)
+{
+	int ret;
+
+	ret = mtk_ctrl_init(mdev);
+	if (ret)
+		goto err_ctrl_init;
+
+	return 0;
+err_ctrl_init:
+	return ret;
+}
+
+void mtk_dev_exit(struct mtk_md_dev *mdev)
+{
+	mtk_ctrl_exit(mdev);
+}
diff --git a/drivers/net/wwan/mediatek/mtk_dev.h b/drivers/net/wwan/mediatek/mtk_dev.h
index acda9ccf05f1..d48fc55ddef0 100644
--- a/drivers/net/wwan/mediatek/mtk_dev.h
+++ b/drivers/net/wwan/mediatek/mtk_dev.h
@@ -101,8 +101,11 @@ struct mtk_md_dev {
 	u32 hw_ver;
 	int msi_nvecs;
 	char dev_str[MTK_DEV_STR_LEN];
+	void *ctrl_blk;
 };
 
+int mtk_dev_init(struct mtk_md_dev *mdev);
+void mtk_dev_exit(struct mtk_md_dev *mdev);
 static inline u32 mtk_hw_read32(struct mtk_md_dev *mdev, u64 addr)
 {
 	return mdev->hw_ops->read32(mdev, addr);
diff --git a/drivers/net/wwan/mediatek/pcie/mtk_pci.c b/drivers/net/wwan/mediatek/pcie/mtk_pci.c
index f8590d7319a8..b3de9634a62c 100644
--- a/drivers/net/wwan/mediatek/pcie/mtk_pci.c
+++ b/drivers/net/wwan/mediatek/pcie/mtk_pci.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
@@ -16,6 +17,9 @@
 #include "mtk_reg.h"
 
 #define MTK_PCI_TRANSPARENT_ATR_SIZE	(0x3F)
+#define MTK_PCI_LOCK_L1SS_STS_MASK	(0x1F)
+#define MTK_PCI_LOCK_L1SS_POLL_STEP	(10)
+#define MTK_PCI_LOCK_L1SS_POLL_TIMEOUT	(10000)
 
 static u32 mtk_pci_mac_read32(struct mtk_pci_priv *priv, u64 addr)
 {
@@ -196,6 +200,41 @@ static void mtk_pci_ack_dev_state(struct mtk_md_dev *mdev, u32 state)
 	mtk_pci_mac_write32(mdev->hw_priv, REG_PCIE_DEBUG_DUMMY_7, state);
 }
 
+static void mtk_pci_force_mac_active(struct mtk_md_dev *mdev, bool enable)
+{
+	struct mtk_pci_priv *priv = mdev->hw_priv;
+	u32 reg;
+
+	reg = mtk_pci_mac_read32(priv, REG_PCIE_MISC_CTRL);
+	if (enable)
+		reg |= MTK_FORCE_MAC_ACTIVE_BIT;
+	else
+		reg &= ~MTK_FORCE_MAC_ACTIVE_BIT;
+	mtk_pci_mac_write32(priv, REG_PCIE_MISC_CTRL, reg);
+}
+
+static u32 mtk_pci_get_ds_status(struct mtk_md_dev *mdev)
+{
+	u32 reg;
+
+	mtk_pci_force_mac_active(mdev, true);
+	reg = mtk_pci_mac_read32(mdev->hw_priv, REG_PCIE_RESOURCE_STATUS);
+	mtk_pci_force_mac_active(mdev, false);
+
+	return reg;
+}
+
+static void mtk_pci_set_l1ss(struct mtk_md_dev *mdev, u32 type, bool enable)
+{
+	struct mtk_pci_priv *priv = mdev->hw_priv;
+	u32 addr = REG_DIS_ASPM_LOWPWR_SET_0;
+
+	if (enable)
+		addr = REG_DIS_ASPM_LOWPWR_CLR_0;
+
+	mtk_pci_mac_write32(priv, addr, type);
+}
+
 static int mtk_pci_get_irq_id(struct mtk_md_dev *mdev, enum mtk_irq_src irq_src)
 {
 	struct mtk_pci_priv *priv = mdev->hw_priv;
@@ -736,6 +775,7 @@ static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mtk_pci_priv *priv;
 	struct mtk_md_dev *mdev;
 	int ret;
+	int val;
 
 	mdev = devm_kzalloc(dev, sizeof(*mdev), GFP_KERNEL);
 	if (!mdev) {
@@ -794,6 +834,25 @@ static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		goto free_mhccif;
 
+	/* lock l1ss and check result */
+	mtk_pci_set_l1ss(mdev, L1SS_BIT_L1(L1SS_PM), false);
+	ret = read_poll_timeout(mtk_pci_get_ds_status, val,
+				(val & MTK_PCI_LOCK_L1SS_STS_MASK) == MTK_PCI_LOCK_L1SS_STS_MASK,
+				MTK_PCI_LOCK_L1SS_POLL_STEP,
+				MTK_PCI_LOCK_L1SS_POLL_TIMEOUT,
+				true,
+				mdev);
+	if (ret) {
+		dev_err(mdev->dev, "Failed to lock L1ss!\n");
+		goto free_irq;
+	}
+
+	ret = mtk_dev_init(mdev);
+	if (ret) {
+		dev_err(mdev->dev, "Failed to init dev.\n");
+		goto free_irq;
+	}
+
 	/* enable device to host interrupt. */
 	pci_set_master(pdev);
 
@@ -802,6 +861,8 @@ static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	dev_info(mdev->dev, "Probe done hw_ver=0x%x\n", mdev->hw_ver);
 	return 0;
 
+free_irq:
+	mtk_pci_free_irq(mdev);
 free_mhccif:
 	mtk_mhccif_exit(mdev);
 free_bar:
@@ -825,6 +886,7 @@ static void mtk_pci_remove(struct pci_dev *pdev)
 	int ret;
 
 	mtk_pci_mask_irq(mdev, priv->mhccif_irq_id);
+	mtk_dev_exit(mdev);
 
 	ret = mtk_pci_fldr(mdev);
 	if (ret)
-- 
2.32.0


