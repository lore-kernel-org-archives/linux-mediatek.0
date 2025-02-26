Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110CBC021BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 02:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vXi58LyDy1GWYlC/u6cuTmKczjfEVwi6s+UDBBfxoY=; b=RBweX8biM4VKw46kCEm35V2FfL
	hVe5vQt1VBpqYAIRYKkKbUpyPXW+390KaB+wEtUSLMAntBBwbXjFnIqEpYngupKAbc5ZuCwVRYGr5
	ZHdamoYRM5tYUlj2U59ThWP+toj/Pwd33R+1MEz8hyA+rQ2EWNJg/aTLQ2LYIfW+sm+v5jqHrQOGu
	EVU7Cpoww2RhMj4nx6qtp/bF1xMauF1xmDSNzMr0LQHoXFdedKbwjCdMHFgnThjrlm3vRCuCjQsY6
	aQH7WAHWAJ0v4xyyxtU3j5QLi/SSaiDnJI/DMrPDfJTw7urgQn6KbcWtxS+t8V0oB01abni6N4FjT
	FUtu8v9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bf-00000002EPP-0cXh;
	Wed, 26 Feb 2025 02:57:07 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bc-00000002EO0-0bWH
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 02:57:05 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2b199bb8af9so288229fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 18:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538623; x=1741143423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vXi58LyDy1GWYlC/u6cuTmKczjfEVwi6s+UDBBfxoY=;
        b=MqT2N6DUhFUwJvQ37rClwtWrRgEhJwJovO3S+tq40rm0RLWvDnLPcDnn7Zyf4R5GxA
         O6sEK3Bo77AiHLhPcEunaYUmn8MRmHs/mFeC7EjZyTxtfXtIci4ovzIKr2rOVbtWLm54
         /93kZn2vgx0WpBSvN6Nh/xz1qjXMGZq+9z0xHYEWkjvmT/OSRWK60toFtC8vz20QrUJb
         HwrETr7lOiq1HZ5xXvz7g/3n8MAjx4Jc7a6qDmxAjMnjpgjGhVvf9LSD6oyZcSYlA5uZ
         9AWul88SctBxcJxdkvPCwtgPSmJsyfEDfi2XBAzTx6Ja8OCKHLL/IbtQmTSt+VFoH65C
         cTWg==
X-Forwarded-Encrypted: i=1; AJvYcCWHaAwn1CqnjsJ9Xv2s72+zAGu31xTd0gUb4o3al+tj7KxhaozL3IvK9vF8vmNH9jwiZzYb6geepkQC1yLyQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQJqe4TrUM1eiEHx6xxFfjj/PzNyc7+weeRrUsyi88IyI9YCjs
	I9Xj7W6Xleqb9px/klRxA4MVJL1McvFERvNmJdoHZOQdSkEm73bk
X-Gm-Gg: ASbGncvvqiv7k9vzctIKoOQpAOtyL80a9CdDYetXBnTeiePSCUtIsnUExRZqItCHiR5
	e5jIHwa6YBNZHfqQADrsglmSTcwe0QM0ets6MfcMgTUa+BhaaQSxgTq3ILzawSNhcmIFVSKBFa3
	9hflNRhG2ScBwLzlBPvtehasWLGqHn7RxPevuW7asMxkxqzO9mwx9rtetgECenGzZEC4TTY2PPw
	3RPLObV+Q+40XwhRlyFAwfwKs8OTsC8tyZxeaBMHvP7igynIQL3wvO7nqVRA/laOVdsDharFhp9
	fL/iZaEV2Ieer5Pb41PT9jTqn8am8Vhjvo9eTXnYbjU=
X-Google-Smtp-Source: AGHT+IEIugqduV+RGP3uvFWYUDXl+R6/9G+jIQ080D5wrSR6I8qtMlDHw/vEuMSZFevfVt5/TORrow==
X-Received: by 2002:a05:6871:6a7:b0:297:281b:fb6d with SMTP id 586e51a60fabf-2bd500303f0mr14238536fac.3.1740538623206;
        Tue, 25 Feb 2025 18:57:03 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c1113f0135sm676360fac.27.2025.02.25.18.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:57:01 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Caleb Jorden <cjorden@gmail.com>
Subject: [PATCH v4 4/6] wifi: mt76: mt7925: adjust rm BSS flow to prevent next connection failure
Date: Tue, 25 Feb 2025 18:56:45 -0800
Message-Id: <20250226025647.102904-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226025647.102904-1-sean.wang@kernel.org>
References: <20250226025647.102904-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_185704_184023_44EF2EC4 
X-CRM114-Status: GOOD (  14.26  )
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

Removing BSS without removing STAREC first will cause firmware
abnormal and next connection fail.

Fixes: f8797298565e ("wifi: mt76: mt7925: Cleanup MLO settings post-disconnection")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Tested-by: Caleb Jorden <cjorden@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
v3:
  1) fixed the merge conflict
v4:
  1)  add tested-by tag
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 45 +++++++++++++++----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 604f771af68e..4a9f393b45ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1155,7 +1155,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
-		mt792x_mac_link_bss_remove(dev, mconf, mlink);
+
+		if (ieee80211_vif_is_mld(vif))
+			mt792x_mac_link_bss_remove(dev, mconf, mlink);
+		else
+			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
+						link_sta, false);
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
@@ -1175,6 +1180,31 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	struct mt76_wcid *wcid;
 	unsigned int link_id;
 
+	/* clean up bss before starec */
+	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct ieee80211_bss_conf *link_conf;
+		struct mt792x_bss_conf *mconf;
+		struct mt792x_link_sta *mlink;
+
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		if (!link_sta)
+			continue;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		if (!mlink)
+			continue;
+
+		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+		if (!link_conf)
+			continue;
+
+		mconf = mt792x_link_conf_to_mconf(link_conf);
+
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
+					link_sta, false);
+	}
+
 	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_link_sta *link_sta;
 		struct mt792x_link_sta *mlink;
@@ -1212,6 +1242,7 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct {
 		struct {
 			u8 omac_idx;
@@ -1242,14 +1273,10 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7925_mac_sta_remove_links(dev, vif, sta, rem);
 
-	if (ieee80211_vif_is_mld(vif)) {
-		mt7925_mcu_set_dbdc(&dev->mphy, false);
-
-		/* recovery omac address for the legacy interface */
-		memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
-		mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
-				  &dev_req, sizeof(dev_req), true);
-	}
+	/* recovery omac address for the legacy interface */
+	memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
+	mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
+			  &dev_req, sizeof(dev_req), true);
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-- 
2.25.1


