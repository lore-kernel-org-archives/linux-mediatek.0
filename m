Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F48C7618A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yk/jNbxXPIJjagKiNGJc8Kt765xoLiABwlA5tGTLv20=; b=496gdRG6SyKZ1XJKjK7nuajHNM
	LF4FIUSRlOIgH6G4loT1qnSmiU2yEDyTaNxrL6e3lnOkelbtTnxYfU8nza6Ote+wF7oVsvxf27aEZ
	LmaoBIQt0b98vSJwtdchRFA9r1BOVmNd0p2I6knbvDE6cSljSQ2pBk7VDh83+LcvLucKUIDmKCLh2
	YRNbjnsmHq6bfX9vgDYK2K7Ko+zNJPFHCKTX1KHWjTUJl/C708m6ZFw5tERVu7F70rg7GcAc6Kmr6
	hEkOlIOnk9R1eYoXIuMVpiBO+P1mUZ7JrAE+13B/V+auW2/Uj2f563QU+kImanht4upbenbv8vAry
	iPIBlXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pchpt-00FSNn-2H;
	Thu, 16 Mar 2023 07:15:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pchpp-00FSJI-3C;
	Thu, 16 Mar 2023 07:15:39 +0000
X-UUID: 55e538c8c3ca11edb5598346aad47b14-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yk/jNbxXPIJjagKiNGJc8Kt765xoLiABwlA5tGTLv20=;
	b=dOMx0xSwDf6QGFDpogC7ZL0m1CDIekO1v7jYbEpMUq1u3ivmhr2+Tw5qeTWwnSlOuYeX//87ChFsl/3fS9kFwuM2VOoO1I08mufW4Sq1RtO67JoF09Qj+GYDdRfKmvInFuaGP4DqTyv7mPYG8IQ6X2B/BmbFzwo+Y+oHVi6jTIQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:8d0dd05b-80fb-4536-8813-32da56e4ec75,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:7debfaf5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 55e538c8c3ca11edb5598346aad47b14-20230316
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 997671684; Thu, 16 Mar 2023 00:15:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 16 Mar 2023 15:14:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 16 Mar 2023 15:14:53 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Subject: [PATCH v9 1/2] phy: core: add debugfs files
Date: Thu, 16 Mar 2023 15:14:51 +0800
Message-ID: <20230316071452.9161-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_001538_036275_3FA717EC 
X-CRM114-Status: GOOD (  13.12  )
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

Add a debugfs root for phy class, and create a debugfs directory under
the root when create phy, then phy drivers can add debugfs files.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v9: create a 'phy' debugfs root, add a debugfs entry in struct phy suggested by Vinod;

No v8 sent out;

v2~v7: no changes
---
 drivers/phy/phy-core.c  | 14 ++++++++++++++
 include/linux/phy/phy.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 9951efc03eaa..05715352881e 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -20,6 +21,7 @@
 #include <linux/regulator/consumer.h>
 
 static struct class *phy_class;
+static struct dentry *phy_debugfs_root;
 static DEFINE_MUTEX(phy_provider_mutex);
 static LIST_HEAD(phy_provider_list);
 static LIST_HEAD(phys);
@@ -996,6 +998,8 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 		pm_runtime_no_callbacks(&phy->dev);
 	}
 
+	phy->debugfs = debugfs_create_dir(dev_name(&phy->dev), phy_debugfs_root);
+
 	return phy;
 
 put_dev:
@@ -1226,6 +1230,7 @@ static void phy_release(struct device *dev)
 
 	phy = to_phy(dev);
 	dev_vdbg(dev, "releasing '%s'\n", dev_name(dev));
+	debugfs_remove_recursive(phy->debugfs);
 	regulator_put(phy->pwr);
 	ida_simple_remove(&phy_ida, phy->id);
 	kfree(phy);
@@ -1242,6 +1247,15 @@ static int __init phy_core_init(void)
 
 	phy_class->dev_release = phy_release;
 
+	phy_debugfs_root = debugfs_create_dir("phy", NULL);
+
 	return 0;
 }
 device_initcall(phy_core_init);
+
+static void __exit phy_core_exit(void)
+{
+	debugfs_remove_recursive(phy_debugfs_root);
+	class_destroy(phy_class);
+}
+module_exit(phy_core_exit);
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 3a570bc59fc7..f6d607ef0e80 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -148,6 +148,7 @@ struct phy_attrs {
  * @power_count: used to protect when the PHY is used by multiple consumers
  * @attrs: used to specify PHY specific attributes
  * @pwr: power regulator associated with the phy
+ * @debugfs: debugfs directory
  */
 struct phy {
 	struct device		dev;
@@ -158,6 +159,7 @@ struct phy {
 	int			power_count;
 	struct phy_attrs	attrs;
 	struct regulator	*pwr;
+	struct dentry		*debugfs;
 };
 
 /**
-- 
2.18.0


