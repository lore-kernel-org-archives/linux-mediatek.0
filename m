Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C757EC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:26:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924C961EEF
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924C961EEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxWaC/6gU7/SovRy0GPcXd/5+vh9X6T5UoieooxTZOI=; b=u1GjyF8JBcQ7z2
	NtQP9wT8IIWLoQWeMSAncgROdpZVs5MAvGL/HxwsIEPI45I3H6R+TEIp3c9VN6U8oK342yLsoMp0E
	6d/6Izv0xnAFC+29GF8gCMGTSdgJFC+IEhhaXVOj1g/Fq63p5e4NjerqUIDrwWCMl3gJB1RQSQE8b
	368h6sVqjPuXVGgVJwrIUtV5KM7ZeriscLgvZvKVStqpuKz0I+sSwqyrOGIvyfvR7aAjJtRZj+pMR
	6VPGhVvLJ6GyLr1Jt/ldHAajbNi6PMUew5RKD9S63TLYa9ysxiYh5jd6f/beQgeAWfbdiB6ANiXTp
	yHKEVVpmutupxCJo+zCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jDc-00BKEV-LX; Tue, 06 Jul 2021 11:26:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j4h-00BEOV-R2; Tue, 06 Jul 2021 11:17:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEF1E61CD2;
 Tue,  6 Jul 2021 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570231;
 bh=zPynrgZnUW8h799GItUXt5kPDHnjShwvL0DdzVFIHdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fTmqegFjk1BEMjFEykmDd9VRxIp/w50CNl11EWRnKVDc3BzyuqryXtNNEkvW2fQj6
 nHaN6k7cCPQDg27b58Wdu5VWX15kWycZTDUBLezuj7HlfRWvGmonXjvLoidOt5ChsB
 7ANbelK3D+Hd1s4rm6ntEX8/slCOLYRxBwo4mHuWyjf/EaeNEVVAlb+iQjLeb1Kc+v
 Vys7XWr4GrOmkuVsuZXm40il0cL7HWXGP4ewHM59iSW8+HEUVIvKiYzNU3Ub8bfYR7
 MIXSa3u3yU8iE0RlTQG2sJNMWsmT02Efsh0ZzRVx1+6qRsZSNOPx1hYnXOJw5xjG/1
 SOK5OpbaXo0Pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 135/189] mt76: connac: fix the maximum interval
 schedule scan can support
Date: Tue,  6 Jul 2021 07:13:15 -0400
Message-Id: <20210706111409.2058071-135-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041711_952696_F7AD8584 
X-CRM114-Status: GOOD (  11.11  )
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

[ Upstream commit abded041a07467c2f3dfe10afd9ea10572c63cc9 ]

Maximum interval (in seconds) for schedule scan plan supported by
the offload firmware can be U16_MAX.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/init.c     | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index d20f05a7717d..0d01fd3c77b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -362,7 +362,7 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->reg_notifier = mt7615_regd_notifier;
 
 	wiphy->max_sched_scan_plan_interval =
-		MT76_CONNAC_MAX_SCHED_SCAN_INTERVAL;
+		MT76_CONNAC_MAX_TIME_SCHED_SCAN_INTERVAL;
 	wiphy->max_sched_scan_ie_len = IEEE80211_MAX_DATA_LEN;
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_sched_scan_ssids = MT76_CONNAC_MAX_SCHED_SCAN_SSID;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 6c889b90fd12..5b50d29c1cb6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -7,7 +7,8 @@
 #include "mt76.h"
 
 #define MT76_CONNAC_SCAN_IE_LEN			600
-#define MT76_CONNAC_MAX_SCHED_SCAN_INTERVAL	10
+#define MT76_CONNAC_MAX_NUM_SCHED_SCAN_INTERVAL	 10
+#define MT76_CONNAC_MAX_TIME_SCHED_SCAN_INTERVAL U16_MAX
 #define MT76_CONNAC_MAX_SCHED_SCAN_SSID		10
 #define MT76_CONNAC_MAX_SCAN_MATCH		16
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 61bed6e89427..6093f39ea1dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -762,7 +762,7 @@ struct mt76_connac_sched_scan_req {
 	u8 intervals_num;
 	u8 scan_func; /* MT7663: BIT(0) eable random mac address */
 	struct mt76_connac_mcu_scan_channel channels[64];
-	__le16 intervals[MT76_CONNAC_MAX_SCHED_SCAN_INTERVAL];
+	__le16 intervals[MT76_CONNAC_MAX_NUM_SCHED_SCAN_INTERVAL];
 	union {
 		struct {
 			u8 random_mac[ETH_ALEN];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 1763ea0614ce..bd002b4247c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -92,7 +92,7 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
 	wiphy->max_sched_scan_plan_interval =
-		MT76_CONNAC_MAX_SCHED_SCAN_INTERVAL;
+		MT76_CONNAC_MAX_TIME_SCHED_SCAN_INTERVAL;
 	wiphy->max_sched_scan_ie_len = IEEE80211_MAX_DATA_LEN;
 	wiphy->max_sched_scan_ssids = MT76_CONNAC_MAX_SCHED_SCAN_SSID;
 	wiphy->max_match_sets = MT76_CONNAC_MAX_SCAN_MATCH;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
