Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD471CCFA03
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Oct 2025 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdSLPpX1EPwSD61cIQEerrvcHDNh7nEsuHMgFrf/95w=; b=gD8NpSrk+GnmZRl7wJZ0jwJJ5g
	MisCE+wd96hf4IJ9xCPLISZfg0iyWxSgSRIgiQpMrP7QjV0QrSy9XkCv/2wdQjhQnzpfQPw0lbB2J
	UY10ze38LxciATvQJ3WraifsiouL9CQ59CYP0HLZajSqwEOQMwQSO5WpOq00rZyHyp/RPk5Astcnz
	qo2crTF4EvyIJH5Um3FMjM4r8yxxAtqknks16wVQLfMOgrpu64jHoIdsDNbGvMGwoxj/kw8sservF
	xGn1W+cH06nCGPhAHbWlyAePcNxOX7DJmZ2kSF6uaem5GzpvArzoBbErv4BVgysS8dKf9Wh+zDIeE
	mZ2jZTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3Q-00000005k31-3nyR;
	Fri, 31 Oct 2025 09:04:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3N-00000005jzB-0JIg
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Oct 2025 09:04:15 +0000
X-UUID: 8ee57a9eb63811f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BdSLPpX1EPwSD61cIQEerrvcHDNh7nEsuHMgFrf/95w=;
	b=Gi0sY0MI51L01ScyzbsNebkFZRJjO9P0yrJdpaFjBOwCuUYk73IMNXqtvgGxU+xcXFvbh0hYsT8jwG1rnp+irrRfhCFmmk2fn5CIsWsRogUwRFlzVzh8uoNO2D7oHXpgRHEGKEYWV4a5y5mF8U6InRjyJKg0pnTwLi6ErQHrikY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d8e70556-817b-4016-bb0b-f89a08f5c983,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:d4acc518-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8ee57a9eb63811f09f706fa2197c6ceb-20251031
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1656876470; Fri, 31 Oct 2025 02:04:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 17:04:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 17:04:05 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 2/6] wifi: mt76: mt7925: refactor CLC support check flow
Date: Fri, 31 Oct 2025 17:03:48 +0800
Message-ID: <20251031090352.1400079-3-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031090352.1400079-1-mingyen.hsieh@mediatek.com>
References: <20251031090352.1400079-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020413_144005_0A2882F9 
X-CRM114-Status: GOOD (  12.80  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Move the disable_clc module parameter to regd.c and introduce
mt7925_regd_clc_supported() to centralize CLC support checks.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 11 +++++------
 drivers/net/wireless/mediatek/mt76/mt7925/regd.c | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7925/regd.h |  1 +
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 25d26baebb17..08013fcf2cdf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -4,16 +4,13 @@
 #include <linux/fs.h>
 #include <linux/firmware.h>
 #include "mt7925.h"
+#include "regd.h"
 #include "mcu.h"
 #include "mac.h"
 
 #define MT_STA_BFER			BIT(0)
 #define MT_STA_BFEE			BIT(1)
 
-static bool mt7925_disable_clc;
-module_param_named(disable_clc, mt7925_disable_clc, bool, 0644);
-MODULE_PARM_DESC(disable_clc, "disable CLC support");
-
 int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			      struct sk_buff *skb, int seq)
 {
@@ -741,8 +738,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	int ret, i, len, offset = 0;
 
 	dev->phy.clc_chan_conf = 0xff;
-	if (mt7925_disable_clc ||
-	    mt76_is_usb(&dev->mt76))
+	if (!mt7925_regd_clc_supported(dev))
 		return 0;
 
 	if (mt76_is_mmio(&dev->mt76)) {
@@ -3436,6 +3432,9 @@ int mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 	struct mt792x_phy *phy = (struct mt792x_phy *)&dev->phy;
 	int i, ret;
 
+	if (!ARRAY_SIZE(phy->clc))
+		return -ESRCH;
+
 	/* submit all clc config */
 	for (i = 0; i < ARRAY_SIZE(phy->clc); i++) {
 		if (i == MT792x_CLC_BE_CTRL)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index 8d7ce274adcd..9e7b468a8228 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -5,6 +5,19 @@
 #include "regd.h"
 #include "mcu.h"
 
+static bool mt7925_disable_clc;
+module_param_named(disable_clc, mt7925_disable_clc, bool, 0644);
+MODULE_PARM_DESC(disable_clc, "disable CLC support");
+
+bool mt7925_regd_clc_supported(struct mt792x_dev *dev)
+{
+	if (mt7925_disable_clc ||
+	    mt76_is_usb(&dev->mt76))
+		return false;
+
+	return true;
+}
+
 void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
 {
 	struct mt792x_phy *phy = &dev->phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.h b/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
index a504e71472fd..5977e068c1c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
@@ -9,6 +9,7 @@
 void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2);
 void mt7925_regd_update(struct mt792x_dev *dev);
 void mt7925_regd_notifier(struct wiphy *wiphy, struct regulatory_request *req);
+bool mt7925_regd_clc_supported(struct mt792x_dev *dev);
 
 #endif
 
-- 
2.34.1


