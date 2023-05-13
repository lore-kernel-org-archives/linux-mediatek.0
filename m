Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CC2C77B7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 May 2023 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Kkxf3BPerLuhz2Tiv7w0gG5pbHJwAtXbjBqeS8LbOE=; b=joYHTLM1WHPm9vbJbeSPoOrD3D
	kcyhVhIBMJFhPsrOO2WIJ9uSL4NdrEii7oYD228Ks8WdIQlAlxorqv0RBl84+2iPy9FiFRtRA2+js
	n+PRkTYnI8nMIi4TMC/5XPHAQSvPEgTRbw8J7eo4ulIbMtpUEvFSyUyzSWE/T6kLKwppfTVIvls5C
	ZUBqoiF/X+9H41IQd65o1kRdW1mWt1wTKp4WVLNwD7rTw3YG3ndg9YeKK6SZMoc8JUc3YJGCwZgj2
	UxUUsqvDc1xEmOH3hFnYULyrQTLdr2rGOX55Uv/PTR8Nd5iQQdm+/uakCmcS/hFrME8JixYPFDSRU
	Xmi2WWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxlSU-00E9FI-0S;
	Sat, 13 May 2023 09:22:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxlSQ-00E9AR-0J;
	Sat, 13 May 2023 09:22:31 +0000
X-UUID: aac24ad4f16f11ed912e1518a6540028-20230513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5Kkxf3BPerLuhz2Tiv7w0gG5pbHJwAtXbjBqeS8LbOE=;
	b=iRxb/Qkb2jdO0DTfQiPrY0Y6ScFY4yazVQ12kneqSybw/ADJq43Vt4ZfwoTLsY27rAyBrXQcnBbxySLF2Ob7t2mOsMUJ3B2sMFWowvSqO7LOSP23YvMa+YvgAoLFQ51Uz4WQZG0A2x0f3ejclb1EI3Maj5BSM9NFkMVEoXqVBfo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:536734d4-12c5-4553-bcba-f5b72290f1e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:0eb0af6b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: aac24ad4f16f11ed912e1518a6540028-20230513
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1246045976; Sat, 13 May 2023 02:22:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 13 May 2023 17:22:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 13 May 2023 17:22:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v9 1/2] phy: core: add debugfs files
Date: Sat, 13 May 2023 17:22:17 +0800
Message-ID: <20230513092218.21139-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_022230_181620_09AC5D52 
X-CRM114-Status: GOOD (  12.88  )
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
index 6464dcb56d56..96a0b1e111f3 100644
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


