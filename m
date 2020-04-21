Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19A0C2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 05:21:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8869D208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 05:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pXKZKQu6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Gpzlicv3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8869D208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sUvm5hTUDlReL1+D1iLB7j1m3A7SQ70Y3x5WOd5O8GA=; b=pXKZKQu6quhSjI
	CSLEP2awmOYzcwxYruygfwScM0G4HuSzJA4xKeHPae1ufiq6MYLh+gK61y5fjLrLnHb+ygmTFTHlS
	kx0tIiD7JTe2UYbuKYktr1jDU2wTUMev6zSrIhGbzREddxs56hLn2/cJSgJ2pj1QuSqWzMyPXTIgs
	TQr61KrnE1LkRBiIUAqJ1D6MxejzGK36EG4i1kl+KpFlinKHc33/AXBFnJtAA5ET/EgPMZpMU0aem
	NgvnbuIOcvmiuKIvVllz2KBtX8L2B2buB/2nwmdVynB3y9VSZoC/AbIRffCBGp/Ku1Mf2Y36M0T2k
	QhHUOpsiy8rQMg2Sfnew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQlL3-0005iW-EA; Tue, 21 Apr 2020 05:20:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQlKz-0005gM-Io
 for linux-mediatek@lists.infradead.org; Tue, 21 Apr 2020 05:20:51 +0000
X-UUID: 48300c724a2d43f194793bd3c07a1bf7-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5XC0Ao1cIps8tVn+BctDx6S5LvFaIEhA9tJXzNUL478=; 
 b=Gpzlicv3FosIwHe7MJXRw53/0D/FiO8xH67LkLwacq/XDDbHcxGW0iLE0zL5dV6TMMc3c1RoCAHpkNT6FhWrGcJW1Gm0ED5Kf+Q8UMvhbFoNAPZOmpFqIfdyGmBBzAkxoe/0Jpa/GZ6Hdn5d/UlPEyvGpakJcTnhObJHcimLS0Q=;
X-UUID: 48300c724a2d43f194793bd3c07a1bf7-20200420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1203739982; Mon, 20 Apr 2020 21:20:40 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 22:20:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 13:20:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Apr 2020 13:20:26 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/3] mt76: mt7615: Fix up WMM setting for STA mode
Date: Tue, 21 Apr 2020 13:20:21 +0800
Message-ID: <1467d47fd111b5711fa74410833153bdc9e01b72.1587445885.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 10B04FC7E3FA56E85C2CB57171A57B36D63EF18D6CFE344ED1875DFC912767042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_222049_622181_18331DB8 
X-CRM114-Status: GOOD (  12.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Have to perform WMM setup until BSS become active according to firmware
usage. Otherwise, the current usage would break WMM setting in STA mode.

Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
Suggested-by: YF Luo <Yf.Luo@mediatek.com>
Suggested-by: Soul Huang <Soul.Huang@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 11 ++++++-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 32 ++++++++++++-------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    | 10 ++++--
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 417903a8e2ec..cdc8babca85a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -424,7 +424,13 @@ mt7615_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u16 queue,
 
 	queue += mvif->wmm_idx * MT7615_MAX_WMM_SETS;
 
-	return mt7615_mcu_set_wmm(dev, queue, params);
+	/* Have to set wmm up until BSS become active */
+	mvif->wmm[queue].cw_min = params->cw_min;
+	mvif->wmm[queue].cw_max = params->cw_max;
+	mvif->wmm[queue].aifs = params->aifs;
+	mvif->wmm[queue].txop = params->txop;
+
+	return 0;
 }
 
 static void mt7615_configure_filter(struct ieee80211_hw *hw,
@@ -503,6 +509,9 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
+	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
+		mt7615_mcu_set_wmm(dev, vif);
+
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
 		mt7615_mcu_add_bss_info(phy, vif, info->enable_beacon);
 		mt7615_mcu_sta_add(dev, vif, NULL, info->enable_beacon);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 8b543e8dadb8..045bde7f554d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2269,8 +2269,7 @@ int mt7615_mcu_set_rts_thresh(struct mt7615_phy *phy, u32 val)
 				   &req, sizeof(req), true);
 }
 
-int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
-		       const struct ieee80211_tx_queue_params *params)
+int mt7615_mcu_set_wmm(struct mt7615_dev *dev, struct ieee80211_vif *vif)
 {
 #define WMM_AIFS_SET	BIT(0)
 #define WMM_CW_MIN_SET	BIT(1)
@@ -2289,21 +2288,30 @@ int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
 		__le16 txop;
 	} __packed req = {
 		.number = 1,
-		.queue = queue,
 		.valid = WMM_PARAM_SET,
-		.aifs = params->aifs,
 		.cw_min = 5,
 		.cw_max = cpu_to_le16(10),
-		.txop = cpu_to_le16(params->txop),
 	};
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	int ac, err;
 
-	if (params->cw_min)
-		req.cw_min = fls(params->cw_min);
-	if (params->cw_max)
-		req.cw_max = cpu_to_le16(fls(params->cw_max));
+	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
+		req.queue = ac + mvif->wmm_idx * MT7615_MAX_WMM_SETS;
+		req.aifs = mvif->wmm[ac].aifs;
+		req.txop = cpu_to_le16(mvif->wmm[ac].txop);
 
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE,
-				   &req, sizeof(req), true);
+		if (mvif->wmm[ac].cw_min)
+			req.cw_min = fls(mvif->wmm[ac].cw_min);
+		if (mvif->wmm[ac].cw_max)
+			req.cw_max = cpu_to_le16(fls(mvif->wmm[ac].cw_max));
+
+		err = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE,
+					  &req, sizeof(req), true);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
 }
 
 int mt7615_mcu_set_dbdc(struct mt7615_dev *dev)
@@ -3353,7 +3361,7 @@ void mt7615_mcu_set_suspend_iter(void *priv, u8 *mac,
 	int i;
 
 	mt7615_mcu_set_bss_pm(phy->dev, vif, suspend);
-	
+
 	mt7615_mcu_set_gtk_rekey(phy->dev, vif, suspend);
 
 	mt7615_mcu_set_suspend_mode(phy->dev, vif, suspend, 1, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 3e84c2dc0f93..ad37463a02d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -152,6 +152,13 @@ struct mt7615_vif {
 	u8 scan_seq_num;
 
 	struct mt7615_sta sta;
+
+	struct {
+		u16 cw_min;
+		u16 cw_max;
+		u16 txop;
+		u8 aifs;
+	} wmm[IEEE80211_NUM_ACS];
 };
 
 struct mib_stats {
@@ -386,8 +393,7 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *rates);
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev);
 int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd);
-int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
-		       const struct ieee80211_tx_queue_params *params);
+int mt7615_mcu_set_wmm(struct mt7615_dev *dev, struct ieee80211_vif *vif);
 void mt7615_mcu_rx_event(struct mt7615_dev *dev, struct sk_buff *skb);
 int mt7615_mcu_rdd_cmd(struct mt7615_dev *dev,
 		       enum mt7615_rdd_cmd cmd, u8 index,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
