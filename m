Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF935606D803
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7D0Lo6S;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZeVVbCKU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CVyUeYCRgSiO6Wq2AvjpNZrndhDmYFJUsyZqkpAqBYc=; b=R7D0Lo6SqiQ3ojSkZ9aOXnxvLO
	89ptTuK0E3/nfkqR3X5gE2XZLWHXw2Rkyq3agJWkdMsCvSJ0XCWfDUo4NFB27hpEWYV1xZrnaNqzZ
	VncXXs3FYYtP153YTZh7KiymIPuEXC6FhwzfUP+P/SJ5TUNit1F/QpKpX/hEHFfUGD8g/Fj2Auluh
	pHooshApPSFderZHHvBGr5db+dNeU7qS7eXpn3pzaS9+2+Iz0g5j9S2icjoEiyp3NsD/0OPyQouCp
	pCbXzo5KHsThjaScFrtrG/bI3+COyjjBeIal6uJh9lZFgn/RnssCu9pEoy0uGOqe6wcamkUXrhKNr
	V8ba62Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXDs-00000004rqu-1ysa;
	Wed, 04 Nov 2026 09:24:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXDp-00000004rmr-1Kky
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 09:23:58 +0000
X-UUID: 73628ae8d83111f1afed4741b24580c9-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CVyUeYCRgSiO6Wq2AvjpNZrndhDmYFJUsyZqkpAqBYc=;
	b=ZeVVbCKUWkq6v90GMZsBNyICuSoijp8RzgG005gfhbn8Iu110lyeM5FRScJpe9DqsM9obfMkg4ToIQwiOQ39rpagcdPQ/m7i+h/TBi4z20PrjqZgOJddKS4YyUKZ03YWVUOBCOTDcB8LaRpHtgG8xTk6l1BpdHvHsDqHqzYNWxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f95c8d76-6680-4fbd-9ec7-205b2d8588cb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:619a4b60-9f24-419c-b7dc-4c873a4a27ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 73628ae8d83111f1afed4741b24580c9-20261104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2043220530; Wed, 04 Nov 2026 02:23:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 17:23:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 17:23:50 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <James-LY.Huang@mediatek.com>,
	<jb.tsai@mediatek.com>, james-ly huang <james-ly.huang@mediatek.com>
Subject: [PATCH 7/9] wifi: mt76: mt7925: inject the deauth for an aging-timeout SAP event
Date: Wed, 4 Nov 2026 17:23:42 +0800
Message-ID: <20261104092344.1932406-7-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261104092344.1932406-1-jb.tsai@mediatek.com>
References: <20261104092344.1932406-1-jb.tsai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_012357_370389_16CD011B 
X-CRM114-Status: GOOD (  19.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: james-ly huang <james-ly.huang@mediatek.com>

The FW ages out inactive clients of an AP/GO and reports it with a
SAP aging-timeout event; the expected reaction is a deauth with
REASON_CODE_DISASSOC_INACTIVITY. The AP MLME here lives in
wpa_supplicant (softmac, device_ap_sme=0), so synthesize the deauth
frame the GO would have received from the GC and hand it to
userspace via cfg80211_rx_mgmt_khz().

Handle the new MCU_UNI_EVENT_SAP in p2p.c
(mt7925_p2p_mcu_sap_event) and dispatch it from the unsolicited
event handler.

Signed-off-by: james-ly huang <james-ly.huang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   1 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |   4 +
 .../net/wireless/mediatek/mt76/mt7925/p2p.c   | 141 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/p2p.h   |  16 ++
 4 files changed, 162 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index bb98a6eacac4..817554ffb9d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1099,6 +1099,7 @@ enum {
 	MCU_UNI_EVENT_PS_SYNC = 0x0d,
 	MCU_UNI_EVENT_SCAN_DONE = 0x0e,
 	MCU_UNI_EVENT_RDD_REPORT = 0x11,
+	MCU_UNI_EVENT_SAP = 0x1c,
 	MCU_UNI_EVENT_ROC = 0x27,
 	MCU_UNI_EVENT_MBMC = 0x28,
 	MCU_UNI_EVENT_TX_DONE = 0x2d,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 6ec74d7bfd82..d9a5b5f57fba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -8,6 +8,7 @@
 #include "mcu.h"
 #include "mac.h"
 #include "nan.h"
+#include "p2p.h"
 
 #define MT_STA_BFER			BIT(0)
 #define MT_STA_BFEE			BIT(1)
@@ -734,6 +735,9 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 	case MCU_UNI_EVENT_BSS_BEACON_LOSS:
 		mt7925_mcu_connection_loss_event(dev, skb);
 		break;
+	case MCU_UNI_EVENT_SAP:
+		mt7925_p2p_mcu_sap_event(dev, skb);
+		break;
 	case MCU_UNI_EVENT_RSSI_MONITOR:
 		mt7925_mcu_rssi_monitor_event(dev, skb);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
index f41098b324ba..d05c936d40ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
@@ -462,3 +462,144 @@ bool mt7925_p2p_chanctx_bss_programmed(struct ieee80211_vif *vif,
 	}
 }
 
+/* ------------------------------------------------------------------ */
+/* P2P-only MCU events                                                  */
+/* ------------------------------------------------------------------ */
+
+/* FW reported that a peer of our AP/GO aged out (no traffic/no ack for the FW
+ * inactivity period); the expected reaction is a deauth with
+ * REASON_CODE_DISASSOC_INACTIVITY. Here the AP MLME lives in
+ * wpa_supplicant (softmac, device_ap_sme=0), so instead of tearing the
+ * STA down in the driver we synthesize the deauth frame the GO would
+ * have received from the GC and hand it to userspace via
+ * NL80211_CMD_FRAME.
+ */
+static void
+mt7925_mcu_sap_aging_timeout(struct mt792x_dev *dev, u16 wlan_idx)
+{
+	struct {
+		struct ieee80211_hdr_3addr hdr;
+		__le16 reason_code;
+	} __packed deauth = {};
+	u8 peer[ETH_ALEN], own[ETH_ALEN], bssid[ETH_ALEN];
+	struct ieee80211_chanctx_conf *ctx;
+	struct mt792x_bss_conf *mconf;
+	struct mt792x_link_sta *mlink;
+	struct ieee80211_vif *vif;
+	struct ieee80211_sta *sta;
+	struct mt792x_vif *mvif;
+	struct mt792x_sta *msta;
+	struct mt76_wcid *wcid;
+	struct wireless_dev *wdev;
+	int freq = 0;
+	u8 link_id;
+
+	rcu_read_lock();
+
+	wcid = mt76_wcid_ptr(dev, wlan_idx);
+	if (!wcid || !wcid->sta)
+		goto unlock;
+
+	mlink = container_of(wcid, struct mt792x_link_sta, wcid);
+	msta = mlink->sta;
+	if (!msta || !msta->vif)
+		goto unlock;
+
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	if (vif->type != NL80211_IFTYPE_AP &&
+	    vif->type != NL80211_IFTYPE_P2P_GO)
+		goto unlock;
+
+	mvif = (struct mt792x_vif *)vif->drv_priv;
+	sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
+	link_id = wcid->link_id;
+
+	ether_addr_copy(peer, sta->addr);
+	ether_addr_copy(own, vif->addr);
+	ether_addr_copy(bssid, vif->bss_conf.bssid);
+	mconf = &mvif->bss_conf;
+
+	if (ieee80211_vif_is_mld(vif) && link_id < IEEE80211_LINK_UNSPECIFIED) {
+		struct ieee80211_link_sta *link_sta;
+		struct ieee80211_bss_conf *link_conf;
+		struct mt792x_bss_conf *link_mconf;
+
+		link_sta = rcu_dereference(sta->link[link_id]);
+		if (link_sta)
+			ether_addr_copy(peer, link_sta->addr);
+
+		link_conf = rcu_dereference(vif->link_conf[link_id]);
+		if (link_conf) {
+			ether_addr_copy(own, link_conf->addr);
+			ether_addr_copy(bssid, link_conf->bssid);
+		}
+
+		link_mconf = rcu_dereference(mvif->link_conf[link_id]);
+		if (link_mconf)
+			mconf = link_mconf;
+	}
+
+	ctx = mconf->mt76.ctx;
+	if (ctx && ctx->def.chan)
+		freq = ctx->def.chan->center_freq;
+	else if (dev->mphy.chandef.chan)
+		freq = dev->mphy.chandef.chan->center_freq;
+
+	rcu_read_unlock();
+
+	deauth.hdr.frame_control = cpu_to_le16(IEEE80211_FTYPE_MGMT |
+					       IEEE80211_STYPE_DEAUTH);
+	ether_addr_copy(deauth.hdr.addr1, own);	/* DA: the GO itself */
+	ether_addr_copy(deauth.hdr.addr2, peer);	/* SA: the aged-out GC */
+	ether_addr_copy(deauth.hdr.addr3, bssid);
+	deauth.reason_code = cpu_to_le16(WLAN_REASON_DISASSOC_DUE_TO_INACTIVITY);
+
+	wdev = ieee80211_vif_to_wdev(vif);
+	if (!wdev)
+		return;
+
+	cfg80211_rx_mgmt_khz(wdev, MHZ_TO_KHZ(freq), 0, (const u8 *)&deauth,
+			     sizeof(deauth), 0);
+
+	return;
+
+unlock:
+	rcu_read_unlock();
+}
+
+void mt7925_p2p_mcu_sap_event(struct mt792x_dev *dev, struct sk_buff *skb)
+{
+	struct mt7925_uni_sap_event *event;
+	u32 tlv_len;
+	u8 *tlv;
+
+	skb_pull(skb, sizeof(struct mt7925_mcu_rxd));
+	if (skb->len < sizeof(*event))
+		return;
+
+	event = (struct mt7925_uni_sap_event *)skb->data;
+	tlv = event->tlv;
+	tlv_len = skb->len - sizeof(*event);
+
+	while (tlv_len >= sizeof(struct tlv)) {
+		struct tlv *hdr = (struct tlv *)tlv;
+		u16 tag = le16_to_cpu(hdr->tag);
+		u16 len = le16_to_cpu(hdr->len);
+
+		if (len < sizeof(*hdr) || len > tlv_len)
+			break;
+
+		if (tag == MT7925_SAP_TAG_AGING_TIMEOUT &&
+		    len >= sizeof(struct mt7925_sap_aging_timeout_tlv)) {
+			struct mt7925_sap_aging_timeout_tlv *aging =
+				(struct mt7925_sap_aging_timeout_tlv *)tlv;
+
+			mt7925_mcu_sap_aging_timeout(dev,
+						     le16_to_cpu(aging->wlan_idx));
+		}
+
+		tlv += len;
+		tlv_len -= len;
+	}
+}
+
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h
index f7af45ee4c1f..9afae222845f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/p2p.h
@@ -39,6 +39,20 @@ static inline bool mt7925_is_p2p_go_probe_resp(struct sk_buff *skb)
 	return ieee80211_is_probe_resp(mgmt->frame_control);
 }
 
+/* SAP event (FW event UNI_EVENT_ID_SAP / enum ENUM_UNI_EVENT_SAP_TAG) */
+#define MT7925_SAP_TAG_AGING_TIMEOUT		0
+
+struct mt7925_sap_aging_timeout_tlv {
+	__le16 tag;
+	__le16 len;
+	__le16 wlan_idx;
+	u8 pad[2];
+} __packed;
+
+struct mt7925_uni_sap_event {
+	u8 pad[4];	/* fixed field */
+	u8 tlv[];
+} __packed;
 /* TX/RX path overrides, BMC wcid bookkeeping and the P2P-only MCU event
  * handlers.
  */
@@ -54,4 +68,6 @@ void mt7925_p2p_bmc_remove(struct mt792x_dev *dev,
 bool mt7925_p2p_chanctx_bss_programmed(struct ieee80211_vif *vif,
 				       struct ieee80211_bss_conf *link_conf);
 
+void mt7925_p2p_mcu_sap_event(struct mt792x_dev *dev, struct sk_buff *skb);
+
 #endif /* __MT7925_P2P_H */
-- 
2.45.2


