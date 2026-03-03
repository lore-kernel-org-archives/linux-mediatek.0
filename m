Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304C0E67A6E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 05:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5MVbiSNp2ZHifDR6N19v65FzkDq63EhGl8ZOM9pIVk=; b=DatsAOHrTHYA02xgF+7oXbju79
	3dc01JpnIzfW0lnRxv2e/xap3yx2sApoy1hPPkIfLb4/r1JFOK//mAhkIJ6uMAk/tdJEW/25hdSDg
	DVkj8gxGKmaE6vsAfYccfS1ZLr4GGu+bMzGxG0v9h/zBDBjqI6NE26VSBIc/XIua1NG9z0LtZfFL9
	X+M9+QJGTq0RN0y2KNtiPqeJr3G6p8jAanEl8NArtI8uDcU3lrMUIJmGVeI3IHBek2nm50nKfFUHY
	D0Gx8r9GAosJY81BTGvY8yqQsWKOwxxjT5RUW8gTESWDQKQaU22Fo2i872OPh3K9W7WBQ2Xy6XE/h
	qQ5Ct/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRH-0000000EYZn-2CZe;
	Tue, 03 Mar 2026 05:36:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRE-0000000EYYH-44KK
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 05:36:58 +0000
X-UUID: fb7208b816c211f1ad39f32c34db0b1c-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=I5MVbiSNp2ZHifDR6N19v65FzkDq63EhGl8ZOM9pIVk=;
	b=FFWTh02thVTpeBn0mh3vcnm1gPfA27BcLNTeNPTfTvHjW50C6EjijfIa2RqliaUlNiYGF9cqYPKMUKYLM/m2djudSQeFDnwTOENcXsBgMCWk04ac6f7pdhzmQ/hSN4E1LW2lbsGTMnyl0N5C0Tg24JXTBgbcf9hRF4UqFXLPFEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:39c0ab1b-c297-4d48-84aa-b260f43151c8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:225c2dea-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fb7208b816c211f1ad39f32c34db0b1c-20260302
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2049078896; Mon, 02 Mar 2026 22:36:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 13:36:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 13:36:49 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>
Subject: [PATCH v2 2/5] wifi: mt76: mt7921: refactor CLC support check flow
Date: Tue, 3 Mar 2026 13:36:34 +0800
Message-ID: <20260303053637.465465-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260303053637.465465-1-jb.tsai@mediatek.com>
References: <20260303053637.465465-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_213657_028906_2B51D778 
X-CRM114-Status: GOOD (  13.33  )
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

Move the disable_clc module parameter to regd.c and introduce
mt7921_regd_clc_supported() to centralize CLC support checks.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
v2: Drop the CLC ARRAY_SIZE(phy->clc) defensive checks in
mt7921_load_clc() and mt7921_mcu_set_clc(), since phy->clc is dynamically
allocated and ARRAY_SIZE() is not applicable.
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  |  8 ++------
 drivers/net/wireless/mediatek/mt76/mt7921/regd.c | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/regd.h |  1 +
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 8442dbd2ee23..9777c899e503 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -4,6 +4,7 @@
 #include <linux/fs.h>
 #include <linux/firmware.h>
 #include "mt7921.h"
+#include "regd.h"
 #include "mcu.h"
 #include "../mt76_connac2_mac.h"
 #include "../mt792x_trace.h"
@@ -11,10 +12,6 @@
 #define MT_STA_BFER			BIT(0)
 #define MT_STA_BFEE			BIT(1)
 
-static bool mt7921_disable_clc;
-module_param_named(disable_clc, mt7921_disable_clc, bool, 0644);
-MODULE_PARM_DESC(disable_clc, "disable CLC support");
-
 int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			      struct sk_buff *skb, int seq)
 {
@@ -422,8 +419,7 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	u8 *clc_base = NULL, hw_encap = 0;
 
 	dev->phy.clc_chan_conf = 0xff;
-	if (mt7921_disable_clc ||
-	    mt76_is_usb(&dev->mt76))
+	if (!mt7921_regd_clc_supported(dev))
 		return 0;
 
 	if (mt76_is_mmio(&dev->mt76)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index 51dbbadbc63a..943342984965 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -6,6 +6,19 @@
 #include "regd.h"
 #include "mcu.h"
 
+static bool mt7921_disable_clc;
+module_param_named(disable_clc, mt7921_disable_clc, bool, 0644);
+MODULE_PARM_DESC(disable_clc, "disable CLC support");
+
+bool mt7921_regd_clc_supported(struct mt792x_dev *dev)
+{
+	if (mt7921_disable_clc ||
+	    mt76_is_usb(&dev->mt76))
+		return false;
+
+	return true;
+}
+
 static void
 mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
index 2907b78d375b..ece85feb7a23 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -11,5 +11,6 @@ struct regulatory_request;
 void mt7921_regd_update(struct mt792x_dev *dev);
 void mt7921_regd_notifier(struct wiphy *wiphy,
 			  struct regulatory_request *request);
+bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
 
 #endif
-- 
2.43.0


