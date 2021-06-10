Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21160C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 18:52:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4CB5613E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 18:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4CB5613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOvbUVbnEbmVq6C0h00QFkU2IiiJwKtDV05uddw/oow=; b=ExmxIHmRIiFYQi
	K0jzjGKiA9+BInvpvaFxyj767kmTcAxo4wC+bxeTCXkVPwujf0/L6FcfCaApe3FVsM90gcsgMGAZP
	yha63IEGd6904h/zxjpaOfa7eqbNvg/1+3SUPNqmQsq+IVbVpyCZ/1goBC+xIU61u6mOzPZHRY0YW
	c6j0diiI2Hzt3+4+kQG4vgzUs++0d5Hrcw82LeBXBBK2wjBiNfVQw8HYQH2oHl4+cRIl8ioSY/md1
	KsbkKK0vYpirchUAuPGD6cI72CS97FK9IAP7ddVOuICisYneJC+Lqz5zMuaeRhqri0MfXUY5ujzm0
	koDTnYElbCs1FNEM9Sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrPnE-002Cly-NX; Thu, 10 Jun 2021 18:52:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrPnB-002Ckl-1Y
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 18:52:38 +0000
X-UUID: 38bf5a36a94f411a9715274ed712086e-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Yrq6dqmKCV5/yC36qBYgCqBZ+AnCCDPzyAHnm6VDGow=; 
 b=N3jDxwrMZjoApWC3IvNaFS50wbjfmByoaes3pMayRPYiJlDxqDh396OkjKTUuxdsBnxV6q9JZUavRTnxE/qadsRP+4I34XTuKGl59+azWHs/Yt3KNzrJb4434/HZh9sN3Lp9zvpiW/V2KOfOMeVlvApwluZBaIAUQTA2kk2XtwI=;
X-UUID: 38bf5a36a94f411a9715274ed712086e-20210610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2051773639; Thu, 10 Jun 2021 11:52:30 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 11:43:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 02:43:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Jun 2021 02:43:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 3/4] mt76: mt7915: introduce mt7915_mcu_set_txbf()
Date: Fri, 11 Jun 2021 02:43:46 +0800
Message-ID: <cdfdf6314d680143891739fc52f3e10e46a6d98f.1623347029.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <245a3745aea487793e40fbf82172c5367649bab3.1623347029.git.ryder.lee@mediatek.com>
References: <245a3745aea487793e40fbf82172c5367649bab3.1623347029.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_115237_114600_F4262D76 
X-CRM114-Status: GOOD (  13.00  )
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

Use mt7915_mcu_set_txbf() to reduce global functions. This can be
easily extended to support other TxBF commands in further patches.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  3 +-
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  7 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 83 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  6 ++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +-
 5 files changed, 50 insertions(+), 53 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 3961d46e0df8..c6e9a7038311 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -3,6 +3,7 @@
 
 #include "mt7915.h"
 #include "eeprom.h"
+#include "mcu.h"
 
 /** global debugfs **/
 
@@ -16,7 +17,7 @@ mt7915_implicit_txbf_set(void *data, u64 val)
 
 	dev->ibf = !!val;
 
-	return mt7915_mcu_set_txbf_type(dev);
+	return mt7915_mcu_set_txbf(dev, MT_BF_TYPE_UPDATE);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index a0f8db9e3852..72b65799cc1a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -319,20 +319,19 @@ static int mt7915_txbf_init(struct mt7915_dev *dev)
 {
 	int ret;
 
-
 	if (dev->dbdc_support) {
-		ret = mt7915_mcu_set_txbf_module(dev);
+		ret = mt7915_mcu_set_txbf(dev, MT_BF_MODULE_UPDATE);
 		if (ret)
 			return ret;
 	}
 
 	/* trigger sounding packets */
-	ret = mt7915_mcu_set_txbf_sounding(dev);
+	ret = mt7915_mcu_set_txbf(dev, MT_BF_SOUNDING_ON);
 	if (ret)
 		return ret;
 
 	/* enable eBF */
-	return mt7915_mcu_set_txbf_type(dev);
+	return mt7915_mcu_set_txbf(dev, MT_BF_TYPE_UPDATE);
 }
 
 static int mt7915_register_ext_phy(struct mt7915_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e28396938ce9..ca633c1bb8c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3893,57 +3893,50 @@ int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band)
 				 &req, sizeof(req), false);
 }
 
-int mt7915_mcu_set_txbf_module(struct mt7915_dev *dev)
+int mt7915_mcu_set_txbf(struct mt7915_dev *dev, u8 action)
 {
-#define MT_BF_MODULE_UPDATE               25
 	struct {
 		u8 action;
-		u8 bf_num;
-		u8 bf_bitmap;
-		u8 bf_sel[8];
-		u8 rsv[8];
+		union {
+			struct {
+				u8 snd_mode;
+				u8 sta_num;
+				u8 rsv;
+				u8 wlan_idx[4];
+				__le32 snd_period;	/* ms */
+			} __packed snd;
+			struct {
+				bool ebf;
+				bool ibf;
+				u8 rsv;
+			} __packed type;
+			struct {
+				u8 bf_num;
+				u8 bf_bitmap;
+				u8 bf_sel[8];
+				u8 rsv[5];
+			} __packed mod;
+		};
 	} __packed req = {
-		.action = MT_BF_MODULE_UPDATE,
-		.bf_num = 2,
-		.bf_bitmap = GENMASK(1, 0),
-	};
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(TXBF_ACTION), &req,
-				 sizeof(req), true);
-}
-
-int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev)
-{
-#define MT_BF_TYPE_UPDATE		20
-	struct {
-		u8 action;
-		bool ebf;
-		bool ibf;
-		u8 rsv;
-	} __packed req = {
-		.action = MT_BF_TYPE_UPDATE,
-		.ebf = true,
-		.ibf = dev->ibf,
+		.action = action,
 	};
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(TXBF_ACTION), &req,
-				 sizeof(req), true);
-}
-
-int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev)
-{
-#define MT_BF_PROCESSING		4
-	struct {
-		u8 action;
-		u8 snd_mode;
-		u8 sta_num;
-		u8 rsv;
-		u8 wlan_idx[4];
-		__le32 snd_period;	/* ms */
-	} __packed req = {
-		.action = true,
-		.snd_mode = MT_BF_PROCESSING,
-	};
+#define MT_BF_PROCESSING	4
+	switch (action) {
+	case MT_BF_SOUNDING_ON:
+		req.snd.snd_mode = MT_BF_PROCESSING;
+		break;
+	case MT_BF_TYPE_UPDATE:
+		req.type.ebf = true;
+		req.type.ibf = dev->ibf;
+		break;
+	case MT_BF_MODULE_UPDATE:
+		req.mod.bf_num = 2;
+		req.mod.bf_bitmap = GENMASK(1, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(TXBF_ACTION), &req,
 				 sizeof(req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 70ab06d9f954..9087a7771c35 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1120,6 +1120,12 @@ enum {
 	MT_IBF = BIT(1)		/* implicit beamforming */
 };
 
+enum {
+	MT_BF_SOUNDING_ON = 1,
+	MT_BF_TYPE_UPDATE = 20,
+	MT_BF_MODULE_UPDATE = 25
+};
+
 #define MT7915_WTBL_UPDATE_MAX_SIZE	(sizeof(struct wtbl_req_hdr) +	\
 					 sizeof(struct wtbl_generic) +	\
 					 sizeof(struct wtbl_rx) +	\
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index e8cde81f8417..e4d1d2069801 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -356,9 +356,7 @@ int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter);
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
 int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy);
 int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int len);
-int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev);
-int mt7915_mcu_set_txbf_module(struct mt7915_dev *dev);
-int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev);
+int mt7915_mcu_set_txbf(struct mt7915_dev *dev, u8 action);
 int mt7915_mcu_set_fcc5_lpn(struct mt7915_dev *dev, int val);
 int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
 			    const struct mt7915_dfs_pulse *pulse);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
