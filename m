Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D91E98DF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YivnOTAbiMqEyFv+2SP79n5iUJYP62LtjycTcWNwMuc=; b=pBITF3HVjSia02DafjpVPNgc5H
	KnLvQLh5m5CIqEKXqL9abeocoyeB7f+lUGI+sYuJz4Cw2PyfGryDZlxEyRsqGpM6ypCG1pvHE2ZiI
	yRoPfa8OsqEsXITZE8NwdcuHxmJcGxiiaed7ELImO5DeL2GCCPIFpy0LPtWvgzNSHSElFse3Ykz8B
	fuOPFymzTBAmnioiuPfijvNSErrEi2ApwXnla85mp8DeAPFr/Das8zqKNzrAIEvGHIhlCZfDDM6Rf
	sNCQ03UnIJ5FBybGR8vunL9aCPgImTsOGxGuKhyvxevbjQxtNQv3uvVlrkGFCLN1jkih/yRaUcwru
	YYCam/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQX7-0000000HODV-1D4W;
	Mon, 23 Feb 2026 07:39:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQX4-0000000HOBt-32ud
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:39:07 +0000
X-UUID: b8394d24108a11f1ad39f32c34db0b1c-20260223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YivnOTAbiMqEyFv+2SP79n5iUJYP62LtjycTcWNwMuc=;
	b=LRZuVhzkneELZJeYvGfl1E9YTka8R+uaJKEj+FMfby1ThYSkDEZuOjPa37eeN9kL6MGDK7Up+ZKDDWsivbuBFHDECA0ItwKULnoEJvnckE5NZ+sWdhy3MgWKYlmeYbMcZE6ay8+L8JccDwDuqIPybZP1Ox6TGY/NMHgD2SNN26A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c1a33d0d-a703-4613-9dab-a2ea5c416e6e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:caf9805b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8394d24108a11f1ad39f32c34db0b1c-20260223
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1196028042; Mon, 23 Feb 2026 00:39:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 23 Feb 2026 15:38:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 23 Feb 2026 15:38:58 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>
Subject: [PATCH 2/5] wifi: mt76: mt7921: refactor CLC support check flow
Date: Mon, 23 Feb 2026 15:38:51 +0800
Message-ID: <20260223073854.2464232-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223073854.2464232-1-jb.tsai@mediatek.com>
References: <20260223073854.2464232-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_233906_778341_CCEEDE9F 
X-CRM114-Status: GOOD (  14.25  )
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
mt7925_regd_clc_supported() to centralize CLC support checks.

Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  | 14 ++++++++------
 drivers/net/wireless/mediatek/mt76/mt7921/regd.c | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/regd.h |  1 +
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 8442dbd2ee23..1e2afa736cdf 100644
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
@@ -470,6 +466,9 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
 		clc = (const struct mt7921_clc *)(clc_base + offset);
 
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
+			break;
+
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
 			continue;
@@ -1403,6 +1402,9 @@ int mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 	struct mt792x_phy *phy = (struct mt792x_phy *)&dev->phy;
 	int i, ret;
 
+	if (!ARRAY_SIZE(phy->clc))
+		return -ESRCH;
+
 	/* submit all clc config */
 	for (i = 0; i < ARRAY_SIZE(phy->clc); i++) {
 		ret = __mt7921_mcu_set_clc(dev, alpha2, env_cap,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index 6e6c81189222..70440ab8ba82 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -7,6 +7,19 @@
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
index 0ba6161e1919..74bc2fdd532c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -9,5 +9,6 @@
 void mt7921_regd_update(struct mt792x_dev *dev);
 void mt7921_regd_notifier(struct wiphy *wiphy,
 			  struct regulatory_request *request);
+bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
 
 #endif
-- 
2.45.2


