Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FCFC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 00:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lSXKCMl8Csf2s7d77YZeEwC0n3KkiJM6fivLD5orMCM=; b=BpllvIlFog5AqH
	XV9tZIb9IzItj3ChH744+LWIydsSPPnRlJ1t5/Mn6RHB/5JzYTbw+/6CJZVK47wt85LMa6MYJ8DK7
	TD6j1dcnMquy1ODkho+EHNwvU2RzQBYjBll0fmwrikdJ+GwZQGC7lf8IFS8wKs3TXM+F6sXS9Xr3t
	ufMrCTxBYqeQH+nqniZrHm0v720pw8iPTpRflgIB5WSHFY0f4vfoulHonh8UjGUChPHll9YZLSw5g
	HCCah8xWNH5RFnD/yQvkm7Wj9Wcxj64p7J3f6weFanpyNR9KbSqywUzhdRJxzOdCAH9QeQ1QQsGbS
	fYiWA/TqUFQD60LfbqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNkuu-007FK1-HI; Sat, 26 Feb 2022 00:26:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNkuq-007FJc-Hi
 for linux-mediatek@lists.infradead.org; Sat, 26 Feb 2022 00:26:31 +0000
X-UUID: acfdaca60c214dc3851489e983c998bd-20220225
X-UUID: acfdaca60c214dc3851489e983c998bd-20220225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 313170467; Fri, 25 Feb 2022 17:26:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 16:26:19 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 26 Feb 2022 08:26:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 26 Feb 2022 08:26:17 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/2] mt76: mt7921: fix up the monitor mode
Date: Sat, 26 Feb 2022 08:26:14 +0800
Message-ID: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_162628_645861_E679A330 
X-CRM114-Status: GOOD (  13.09  )
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

From: Sean Wang <sean.wang@mediatek.com>

Properly set up the monitor mode the firmware can support to fix up
RTS/CTS and beacon frames cannot be captured and forwarded to the host.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: 1. add Tested-by tag
    2. make mt76_connac_mcu_set_sniffer mt7921 specific
    3. align the structure declartion
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 23 +++++++-------
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 30 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
 4 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 384c3eab1c8a..e5857d2cf78c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -993,6 +993,7 @@ enum {
 	MCU_UNI_CMD_SUSPEND = 0x05,
 	MCU_UNI_CMD_OFFLOAD = 0x06,
 	MCU_UNI_CMD_HIF_CTRL = 0x07,
+	MCU_UNI_CMD_SNIFFER = 0x24,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index b6e836a4fad7..0f3c56530e66 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -479,6 +479,16 @@ mt7921_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	mt7921_mcu_set_beacon_filter(dev, vif, dev->pm.enable);
 }
 
+static void
+mt7921_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt7921_dev *dev = priv;
+	struct ieee80211_hw *hw = mt76_hw(dev);
+	bool enabled = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
+
+	mt7921_mcu_set_sniffer(dev, vif, enabled);
+}
+
 void mt7921_set_runtime_pm(struct mt7921_dev *dev)
 {
 	struct ieee80211_hw *hw = dev->mphy.hw;
@@ -516,16 +526,9 @@ static int mt7921_config(struct ieee80211_hw *hw, u32 changed)
 	}
 
 	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
-		bool enabled = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
-
-		if (!enabled)
-			phy->rxfilter |= MT_WF_RFCR_DROP_OTHER_UC;
-		else
-			phy->rxfilter &= ~MT_WF_RFCR_DROP_OTHER_UC;
-
-		mt76_rmw_field(dev, MT_DMA_DCR0(0), MT_DMA_DCR0_RXD_G5_EN,
-			       enabled);
-		mt76_wr(dev, MT_WF_RFCR(0), phy->rxfilter);
+		ieee80211_iterate_active_interfaces(hw,
+						    IEEE80211_IFACE_ITER_RESUME_ALL,
+						    mt7921_sniffer_interface_iter, dev);
 		mt7921_set_runtime_pm(dev);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 33a836825cca..ab790e5df863 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1133,3 +1133,33 @@ int mt7921_get_txpwr_info(struct mt7921_dev *dev, struct mt7921_txpwr *txpwr)
 
 	return 0;
 }
+
+int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			   bool enable)
+{
+	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct {
+		struct {
+			u8 band_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct sniffer_enable_tlv {
+			__le16 tag;
+			__le16 len;
+			u8 enable;
+			u8 pad[3];
+		} __packed enable;
+	} req = {
+		.hdr = {
+			.band_idx = mvif->band_idx,
+		},
+		.enable = {
+			.tag = cpu_to_le16(0),
+			.len = cpu_to_le16(sizeof(struct sniffer_enable_tlv)),
+			.enable = enable,
+		},
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(SNIFFER), &req, sizeof(req),
+				 true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 9edc83f06139..9575d571b425 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -452,4 +452,6 @@ void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
 bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
 void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 void mt7921_set_runtime_pm(struct mt7921_dev *dev);
+int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			   bool enable);
 #endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
