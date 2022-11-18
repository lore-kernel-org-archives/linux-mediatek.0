Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345DEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t0/kcTXw6jGVvgjMHZqdojaidDYLv7u6AgMEPfrEt7Y=; b=UTEyAauxJGG/uVvEHz+CF/6xoj
	udfN6fM6ppyjSKLq6X9GdMiNuJkxAiIxeuS8TrbTtTubzkllY/vbmCCIvN31/f+34uwMSF8O+RZoV
	wsVA60CHMbNRscS1Fafkqt2XbTbA/24m6hlFOF/QNlhRicOGta8QI134ktm0p3xtuetq7OevWKzQs
	/ED9+Db1GPhpu+UVwBwq6eUQXEl8NU/kcriX/vQCfeEfrpqEIVMIwnPz3085vRuib+ucd8W35VBFm
	mw+XRjDEYuBHZrB5VqYNgoP9JPpQ155x3lnDh4Yy260ZpLXf2F1TXts18d1ucH7eHOya8mwOvLSIW
	Ij1WS8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovvWp-002U2p-T0; Fri, 18 Nov 2022 07:11:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovvWi-002U1m-0M; Fri, 18 Nov 2022 07:11:08 +0000
X-UUID: 68f79bc5c5e848979b4f2bed284aa788-20221118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=t0/kcTXw6jGVvgjMHZqdojaidDYLv7u6AgMEPfrEt7Y=;
	b=TgrtK+zHQSeV11CMOq80D4ZO/inklulGUmy2rNfpEXtSwlcbXOJ9WoRQlFM6wSnNJBhpzxlhHTV3Eh69VyHMHXz/t4GohFgufTCqU7OqZsEMWG8kH4bZ/HnHcGVx7rBqgrcob0SMSFM8xvafL4miGL83bSv5bkN4zWoONzKe6yc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:afe29d46-7a0f-4293-b406-19ce1b4334be,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:aad1a1f8-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 68f79bc5c5e848979b4f2bed284aa788-20221118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1685384891; Fri, 18 Nov 2022 00:10:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 18 Nov 2022 14:30:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 18 Nov 2022 14:30:19 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v1] mtk-mmsys: Change mtk-mmsys & mtk-mutex to modules
Date: Fri, 18 Nov 2022 14:30:18 +0800
Message-ID: <20221118063018.13520-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_231104_075871_3B2EDEB3 
X-CRM114-Status: GOOD (  11.57  )
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

Change mtk-mmsys & mtk-mutex to modules for gki

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig     |  2 +-
 drivers/soc/mediatek/mtk-mmsys.c | 18 +++++++++++++++++-
 drivers/soc/mediatek/mtk-mutex.c | 17 ++++++++++++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 40d0cc600cae..20c77152c282 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -68,7 +68,7 @@ config MTK_SCPSYS_PM_DOMAINS
 	  tasks in the system.
 
 config MTK_MMSYS
-	bool "MediaTek MMSYS Support"
+	tristate "MediaTek MMSYS Support"
 	default ARCH_MEDIATEK
 	depends on HAS_IOMEM
 	help
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f3431448e843..82443a91d7d9 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
@@ -326,4 +327,19 @@ static struct platform_driver mtk_mmsys_drv = {
 	.probe = mtk_mmsys_probe,
 };
 
-builtin_platform_driver(mtk_mmsys_drv);
+static int __init mtk_mmsys_init(void)
+{
+	return platform_driver_register(&mtk_mmsys_drv);
+}
+
+static void __exit mtk_mmsys_exit(void)
+{
+	platform_driver_unregister(&mtk_mmsys_drv);
+}
+
+module_init(mtk_mmsys_init);
+module_exit(mtk_mmsys_exit);
+
+MODULE_AUTHOR("Yongqiang Niu <yongqiang.niu@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek SoC MMSYS driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c1a33d52038e..84cd1a858f06 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -874,4 +874,19 @@ static struct platform_driver mtk_mutex_driver = {
 	},
 };
 
-builtin_platform_driver(mtk_mutex_driver);
+static int __init mtk_mutex_init(void)
+{
+	return platform_driver_register(&mtk_mutex_driver);
+}
+
+static void __exit mtk_mutex_exit(void)
+{
+	platform_driver_unregister(&mtk_mutex_driver);
+}
+
+module_init(mtk_mutex_init);
+module_exit(mtk_mutex_exit);
+
+MODULE_AUTHOR("Yongqiang Niu <yongqiang.niu@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek SoC MUTEX driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


