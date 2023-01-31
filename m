Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA8FC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UadLTcEeSeeRKaGDm1cbt1YK38Xlcczw26w3sEeodGI=; b=Pc9K5GYxS47x2DXl4WCUgayvYL
	Wt81JfyCewLXMNQU9Q/QkgsU7HPK3jFSlPqxh/5SsjdI+yM3PDVCcFvQbVcTu1Hxbo38guxH/wUed
	d2dq+a0nKADRjeIOXbnXM0LdLF/rvwekSw6QmxpgZnHIjI2l10kniXDGZq0bDJ2tXejRtfyji3d6J
	isBk4S8al+7Ui3aPv2sMw5Y9HHsekGiGHHzjp5V6KRiYUQotAqF7pu+lqJZZS1vAjtqDXO6ZfA/MJ
	LsAlZUqwLP+q3fZnUwy0665P6KP6KyjIB8Sd6SMvmtcmfaunZiY2QV2GTaNA1Qn7QLc6k6qMcp/X+
	X/Mlp92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4R-007385-WB; Tue, 31 Jan 2023 09:36:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4A-0072zp-RU
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:36:41 +0000
X-UUID: bed1b7dca14a11eda08d4d6090ec5a5c-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UadLTcEeSeeRKaGDm1cbt1YK38Xlcczw26w3sEeodGI=;
	b=Jz0UZxfot82w5Ylviu+LN+oEpnp9O0UiGsXGRdo5MZJ3ywPEy1nbdl5M48avEs+J6tjI2lR00Kl5ktMKMjhKfkdkL5VE2ulLMYP/k6zNrltrmfK7Bs+bMkvv5mjpS1KAtI4BAgb32Bm7IujkHtnQ5Okfj0MA1njCKK/9I7iNMMY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:61aa591e-73b8-48d2-957f-361431c059f2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:b232758d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: bed1b7dca14a11eda08d4d6090ec5a5c-20230131
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2070462309; Tue, 31 Jan 2023 02:36:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 17:36:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:29 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 08/13] wifi: mt76: mt7996: add helpers for wtbl and interface limit
Date: Tue, 31 Jan 2023 17:36:06 +0800
Message-ID: <20230131093611.30914-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230131093611.30914-1-shayne.chen@mediatek.com>
References: <20230131093611.30914-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_013638_941579_531D104F 
X-CRM114-Status: GOOD (  13.62  )
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

Add helpers to get the maximum wtbl size and interface num based
on hw caps.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/main.c    |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/mt7996.h  | 17 +++++++++++++----
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 7a9692a66ed8..6bcf2649d8df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -256,7 +256,7 @@ static void mt7996_mac_init(struct mt7996_dev *dev)
 
 	mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
 
-	for (i = 0; i < MT7996_WTBL_SIZE; i++)
+	for (i = 0; i < mt7996_wtbl_size(dev); i++)
 		mt7996_mac_wtbl_update(dev, i,
 				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 96ced4c039ce..bdc54ff74311 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1486,7 +1486,7 @@ static void mt7996_mac_add_txs(struct mt7996_dev *dev, void *data)
 	if (pid < MT_PACKET_ID_FIRST)
 		return;
 
-	if (wcidx >= MT7996_WTBL_SIZE)
+	if (wcidx >= mt7996_wtbl_size(dev))
 		return;
 
 	rcu_read_lock();
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 2031fffe6f4e..993573e0c313 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -170,7 +170,7 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 		phy->monitor_vif = vif;
 
 	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
-	if (mvif->mt76.idx >= (MT7996_MAX_INTERFACES << dev->dbdc_support)) {
+	if (mvif->mt76.idx >= mt7996_max_interface_num(dev)) {
 		ret = -ENOSPC;
 		goto out;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 00f3beda74cc..b919a7bc606b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -11,12 +11,11 @@
 #include "../mt76_connac.h"
 #include "regs.h"
 
-#define MT7996_MAX_INTERFACES		19
+#define MT7996_MAX_INTERFACES		19	/* per-band */
 #define MT7996_MAX_WMM_SETS		4
-#define MT7996_WTBL_SIZE		544
-#define MT7996_WTBL_RESERVED		(MT7996_WTBL_SIZE - 1)
+#define MT7996_WTBL_RESERVED		(mt7996_wtbl_size(dev) - 1)
 #define MT7996_WTBL_STA			(MT7996_WTBL_RESERVED - \
-					 MT7996_MAX_INTERFACES)
+					 mt7996_max_interface_num(dev))
 
 #define MT7996_WATCHDOG_TIME		(HZ / 10)
 #define MT7996_RESET_TIMEOUT		(30 * HZ)
@@ -447,6 +446,16 @@ int mt7996_mcu_fw_dbg_ctrl(struct mt7996_dev *dev, u32 module, u8 level);
 void mt7996_mcu_rx_event(struct mt7996_dev *dev, struct sk_buff *skb);
 void mt7996_mcu_exit(struct mt7996_dev *dev);
 
+static inline u8 mt7996_max_interface_num(struct mt7996_dev *dev)
+{
+	return MT7996_MAX_INTERFACES * (1 + dev->dbdc_support + dev->tbtc_support);
+}
+
+static inline u16 mt7996_wtbl_size(struct mt7996_dev *dev)
+{
+	return (dev->wtbl_size_group << 8) + 64;
+}
+
 void mt7996_dual_hif_set_irq_mask(struct mt7996_dev *dev, bool write_reg,
 				  u32 clear, u32 set);
 
-- 
2.25.1


