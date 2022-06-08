Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC6AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TgWkp+O+Q7bhoILVcnLPMGIrhVEXEdp8pVZkuoJz6w=; b=1oNfx9kNqJSOtX
	cxrOmPRVtOZhKXxR8g74+tJH4hy1sCh8HNoaTKVjJhm1rDi2pRvtR5gKsXC7XdUD/YbJiUqisjpXN
	gjKOn/7zxUMlX0aaFpYMghNU6tV1Tx+NuxG0sBEWiY2Pg+q+qntJk0E7J0SoTwm0NMxxxBYQ+cE98
	/SHBwzs2JYoSgHemLkQWtDOIionOD6jw43MEIv36B+tkIep41mBJ15S2MS0bA3POLB9ljUOPolHOs
	W8UVwqZfdpki7CJ7gbCNk0xhMQqFQVebMzdhCr+gSUBF+BbJMuPP7DW9ylIknQDIUCQs39oT7MgDD
	DOIu8+BQAp/zgI8u79bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvCH-00D7A6-N3; Wed, 08 Jun 2022 12:54:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvCE-00D793-2A
	for linux-mediatek@lists.infradead.org; Wed, 08 Jun 2022 12:54:04 +0000
X-UUID: d8e088da29c44211be44c3796da15804-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:52a5e089-0297-40be-bbb2-a9eccc1fc6d5,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:7fbaa77e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: d8e088da29c44211be44c3796da15804-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 352840794; Wed, 08 Jun 2022 05:53:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 05:53:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 20:53:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 8 Jun 2022 20:53:52 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
	<Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7921: fix command timeout in AP stop period
Date: Wed, 8 Jun 2022 20:53:26 +0800
Message-ID: <21366e8bc70573794b5f12372f2e55e9059d8457.1654691030.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1654691030.git.deren.wu@mediatek.com>
References: <cover.1654691030.git.deren.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_055402_152434_EEE9E7AA 
X-CRM114-Status: GOOD (  14.66  )
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

From: Deren Wu <deren.wu@mediatek.com>

Due to AP stop improperly, mt7921 driver would face random command timeout
by chip fw problem. Migrate AP start/stop process to .start_ap/.stop_ap and
congiure BSS network settings in both hooks.

The new flow is shown below.
* AP start
    .start_ap()
      configure BSS network resource
      set BSS to connected state
    .bss_info_changed()
      enable fw beacon offload

* AP stop
    .bss_info_changed()
      disable fw beacon offload (skip this command)
    .stop_ap()
      set BSS to disconnected state (beacon offload disabled automatically)
      destroy BSS network resource

Fixes: 116c69603b01 ("mt76: mt7921: Add AP mode support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 49 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  5 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
 4 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index faa279bbbcb2..7eb23805aa94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1403,6 +1403,8 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 		else
 			conn_type = CONNECTION_INFRA_AP;
 		basic_req.basic.conn_type = cpu_to_le32(conn_type);
+		/* Fully active/deactivate BSS network in AP mode only */
+		basic_req.basic.active = enable;
 		break;
 	case NL80211_IFTYPE_STATION:
 		if (vif->p2p)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 80279f342109..3b1d2f35d080 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -653,15 +653,6 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon) {
-		struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-
-		mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
-					    true);
-		mt7921_mcu_sta_update(dev, NULL, vif, true,
-				      MT76_STA_INFO_STATE_NONE);
-	}
-
 	if (changed & (BSS_CHANGED_BEACON |
 		       BSS_CHANGED_BEACON_ENABLED))
 		mt7921_mcu_uni_add_beacon_offload(dev, hw, vif,
@@ -1500,6 +1491,44 @@ mt7921_channel_switch_beacon(struct ieee80211_hw *hw,
 	mt7921_mutex_release(dev);
 }
 
+static int
+mt7921_start_ap(struct ieee80211_hw *hw,
+		struct ieee80211_vif *vif)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_phy *phy = mt7921_hw_phy(hw);
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	int err;
+
+	err = mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
+					  true);
+	if (err)
+		return err;
+
+	err = mt7921_mcu_set_bss_pm(dev, vif, true);
+	if (err)
+		return err;
+
+	return mt7921_mcu_sta_update(dev, NULL, vif, true,
+				     MT76_STA_INFO_STATE_NONE);
+}
+
+static void
+mt7921_stop_ap(struct ieee80211_hw *hw,
+	       struct ieee80211_vif *vif)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_phy *phy = mt7921_hw_phy(hw);
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	int err;
+
+	err = mt7921_mcu_set_bss_pm(dev, vif, false);
+	if (err)
+		return;
+
+	mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid, false);
+}
+
 const struct ieee80211_ops mt7921_ops = {
 	.tx = mt7921_tx,
 	.start = mt7921_start,
@@ -1510,6 +1539,8 @@ const struct ieee80211_ops mt7921_ops = {
 	.conf_tx = mt7921_conf_tx,
 	.configure_filter = mt7921_configure_filter,
 	.bss_info_changed = mt7921_bss_info_changed,
+	.start_ap = mt7921_start_ap,
+	.stop_ap = mt7921_stop_ap,
 	.sta_state = mt7921_sta_state,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.set_key = mt7921_set_key,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index de096f090da3..1384b3c127b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1019,7 +1019,7 @@ mt7921_mcu_uni_bss_bcnft(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 				 &bcnft_req, sizeof(bcnft_req), true);
 }
 
-static int
+int
 mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 		      bool enable)
 {
@@ -1048,9 +1048,6 @@ mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 	};
 	int err;
 
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return 0;
-
 	err = mt76_mcu_send_msg(&dev->mt76, MCU_CE_CMD(SET_BSS_ABORT),
 				&req_hdr, sizeof(req_hdr), false);
 	if (err < 0 || !enable)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 5ca584bb2fc6..8da816da973f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -291,6 +291,8 @@ int mt7921_wpdma_reset(struct mt7921_dev *dev, bool force);
 int mt7921_wpdma_reinit_cond(struct mt7921_dev *dev);
 void mt7921_dma_cleanup(struct mt7921_dev *dev);
 int mt7921_run_firmware(struct mt7921_dev *dev);
+int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
+			  bool enable);
 int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 			  struct ieee80211_vif *vif, bool enable,
 			  enum mt76_sta_info_state state);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
