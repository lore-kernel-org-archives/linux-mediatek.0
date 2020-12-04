Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C861C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A474D225AC
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A474D225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zGSsWUHVa7E99nYfkqcIiUQVr3uTCm+T98fPQ2QfR58=; b=ibUvnMN/0c/sXLRbnjimZ0CNHk
	7UzfdiJtzIVJddoyxdXrsC3VkzI4Dr70RoD1vjSxey2G/pvKFNlmtpSUKwQ85PabO3VQa91qwJ9ku
	dfaDpnE9JdreJOicb6OmEcjd1I5zwDDaZlVQfeF69mORV8IDsI7rblnoulet8eLqfyUIcMeEw6Gtn
	FaWlm1KPJqZFOoBISpDeY1+E7CK1WCRj3tmUtqzAyhz1LN+czFFEBXPAxhGiihwVU7lH0Jja9yiZ4
	vbryACqTUkcnBSkeYxaQJyJZwzo3/9Q2Xx1qu4ifKxIlMmbab51jYScV/Y/PJXegr0YqfnvGZUkPX
	Thpl5MPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7Wi-0007MY-RN; Fri, 04 Dec 2020 09:37:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7Wg-0007LS-30
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 09:37:19 +0000
X-UUID: 081f57c4ab0243e098e313693776d9b7-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LTZzBJ3Q8DEA53VXcG2uFATCWj/UagcdFBP0FPmTst0=; 
 b=F3Z1yfCdYRyQPae5BKPkgk5auSJd3NZHY3HqVrmQbCZi4exrICdgb+qu8ht3LF2oVb/8HR4b+UTTReFArC1hfUNtVuu/KzBFxcU/woHUCnArCCWIpJLCJipkk8bYg0rGwBYlxB8x+4oP0zxxsRwTJcBqzBe7xaX3Cjs6af4oEyU=;
X-UUID: 081f57c4ab0243e098e313693776d9b7-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1322135255; Fri, 04 Dec 2020 01:37:01 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 01:37:10 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 17:37:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Dec 2020 17:37:08 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 1/5] mt76: mt7915: add partial add_bss_info command on
 testmode init
Date: Fri, 4 Dec 2020 17:36:55 +0800
Message-ID: <20201204093659.20384-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_043718_328832_0B9A917B 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a preliminary patch for DBDC and ipg config support
in testmode.

The wmm_idx of band1 should be configured by this command to
make band1 Tx work normally. Also, for setting ipg, FW needs a
non-empty bss_info structure to do edca parameters update.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 20 ++++++++++++++-----
 .../wireless/mediatek/mt76/mt7915/testmode.c  |  2 ++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6097653abda4..623b7b6d9e83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -674,6 +674,7 @@ mt7915_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	switch (vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
+	case NL80211_IFTYPE_MONITOR:
 		break;
 	case NL80211_IFTYPE_STATION:
 		/* TODO: enable BSS_INFO_UAPSD & BSS_INFO_PM */
@@ -702,16 +703,21 @@ mt7915_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	}
 
 	bss = (struct bss_info_basic *)tlv;
-	memcpy(bss->bssid, vif->bss_conf.bssid, ETH_ALEN);
-	bss->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
 	bss->network_type = cpu_to_le32(type);
-	bss->dtim_period = vif->bss_conf.dtim_period;
 	bss->bmc_wcid_lo = to_wcid_lo(wlan_idx);
 	bss->bmc_wcid_hi = to_wcid_hi(wlan_idx);
-	bss->phy_mode = mt7915_get_phy_mode(phy->dev, vif, band, NULL);
 	bss->wmm_idx = mvif->wmm_idx;
 	bss->active = enable;
 
+	if (vif->type != NL80211_IFTYPE_MONITOR) {
+		memcpy(bss->bssid, vif->bss_conf.bssid, ETH_ALEN);
+		bss->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
+		bss->dtim_period = vif->bss_conf.dtim_period;
+		bss->phy_mode = mt7915_get_phy_mode(phy->dev, vif, band, NULL);
+	} else {
+		memcpy(bss->bssid, phy->mt76->macaddr, ETH_ALEN);
+	}
+
 	return 0;
 }
 
@@ -727,6 +733,7 @@ mt7915_mcu_bss_omac_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
 	tlv = mt7915_mcu_add_tlv(skb, BSS_INFO_OMAC, sizeof(*omac));
 
 	switch (vif->type) {
+	case NL80211_IFTYPE_MONITOR:
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
 		type = CONNECTION_INFRA_AP;
@@ -996,6 +1003,9 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 
 	mt7915_mcu_bss_basic_tlv(skb, vif, phy, enable);
 
+	if (vif->type == NL80211_IFTYPE_MONITOR)
+		goto out;
+
 	if (enable) {
 		mt7915_mcu_bss_rfch_tlv(skb, vif, phy);
 		mt7915_mcu_bss_bmc_tlv(skb, phy);
@@ -1009,7 +1019,7 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 		    mvif->omac_idx < REPEATER_BSSID_START)
 			mt7915_mcu_bss_ext_tlv(skb, mvif);
 	}
-
+out:
 	return mt76_mcu_skb_send_msg(&phy->dev->mt76, skb,
 				     MCU_EXT_CMD_BSS_INFO_UPDATE, true);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 9ee82e2d262c..fe56ab18e974 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -192,6 +192,8 @@ mt7915_tm_init(struct mt7915_dev *dev)
 	mt7915_tm_mode_ctrl(dev, en);
 	mt7915_tm_reg_backup_restore(dev, &dev->phy);
 	mt7915_tm_set_trx(dev, &dev->phy, TM_MAC_TXRX, !en);
+
+	mt7915_mcu_add_bss_info(&dev->phy, dev->phy.monitor_vif, en);
 }
 
 static void
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
