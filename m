Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5E0C49EA3
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 20:39:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33713613CE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 20:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33713613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zL+DyIpaJ+KLnZwZJqj+yLAt6mrmBinKJ95860GG9w=; b=kyf/uYZMxJk6bl
	1g3r2n+D9izPLaHgRX+XNFPxzjR0IZ3hUVcU5EI8pQdylg4+7PuJ5ItXX5kzBlWQkP97hnULC9nK8
	uoOxTFxHOT6UQq5t7QTDDAumBHnYNKzlFLYUAtl6ND0upexAfFybwYAp53aqet8j1glfyL7Yc1yZG
	42WMsUc4jqgB29H9gCUj70S9t3xw9YohwrKonxVbGcEAP0gK2USxRICvPuE5EpCI/3K4aKTbL0vGb
	9J30ew2OeUNAyoU1/Q2twYbpy5o2nIxQCUcDYZHMw5Eq76SfaNoT93KwHCbQbwM2LFBtlH6KYaYAp
	s/Y4ZMB+sZ61iKpXoO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltynP-00BkdQ-Cs; Thu, 17 Jun 2021 20:39:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltynL-00BkbJ-8E
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 20:39:24 +0000
X-UUID: e8ad5066c578490a817c801610f27b36-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Di7jf3yw9JcKFQJfqCUwEGk5VZh+TWFIcQGMj42KwOU=; 
 b=MQtiB30Uhh3js99ewvsr6f45a5oGNZ78+v6DMjR4E3oG56ToR9ANSVtawJNaV3yfNDExf+20fJ4sZjg2QbckftOFxnaDIrkYH2P1rRp0qlxqENRucTN2eT00+k8nGaVvyF1kgeGrOEVhO68/8PqL9gasEheziv3zxUTZ2Y0NWRk=;
X-UUID: e8ad5066c578490a817c801610f27b36-20210617
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 773204431; Thu, 17 Jun 2021 13:39:17 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 13:39:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 04:39:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Jun 2021 04:39:02 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/3] mt76: use IEEE80211_OFFLOAD_ENCAP_ENABLED instead of
 MT_DRV_AMSDU_OFFLOAD
Date: Fri, 18 Jun 2021 04:39:00 +0800
Message-ID: <663aa26553da45eeb15c59721447db4ed7fc18ef.1623961575.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <177785418cf407808bf3a44760302d0647076990.1623961575.git.ryder.lee@mediatek.com>
References: <177785418cf407808bf3a44760302d0647076990.1623961575.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_133923_385192_B631BAD4 
X-CRM114-Status: GOOD (  13.84  )
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

Drop MT_DRV_AMSDU_OFFLOAD after introducing IEEE80211_OFFLOAD_ENCAP_ENABLED
flag in mac80211. Driver now checks vif->offload_flags to know encap offload
status of each interface.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: squash patch 2/4 and 3/4 from v1
---
 drivers/net/wireless/mediatek/mt76/mac80211.c        |  8 ++------
 drivers/net/wireless/mediatek/mt76/mt76.h            |  1 -
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 10 ++++++----
 drivers/net/wireless/mediatek/mt76/mt7915/pci.c      |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c      |  3 +--
 5 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index ebd59d7e5837..89d09187655b 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -322,12 +322,8 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SUPPORTS_CLONED_SKBS);
 	ieee80211_hw_set(hw, SUPPORTS_AMSDU_IN_AMPDU);
 	ieee80211_hw_set(hw, SUPPORTS_REORDERING_BUFFER);
-
-	if (!(dev->drv->drv_flags & MT_DRV_AMSDU_OFFLOAD)) {
-		ieee80211_hw_set(hw, TX_AMSDU);
-		ieee80211_hw_set(hw, TX_FRAG_LIST);
-	}
-
+	ieee80211_hw_set(hw, TX_AMSDU);
+	ieee80211_hw_set(hw, TX_FRAG_LIST);
 	ieee80211_hw_set(hw, MFP_CAPABLE);
 	ieee80211_hw_set(hw, AP_LINK_PS);
 	ieee80211_hw_set(hw, REPORTS_TX_ACK_STATUS);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index c7085d6cdcc4..6ee29b684f24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -343,7 +343,6 @@ struct mt76_hw_cap {
 #define MT_DRV_SW_RX_AIRTIME		BIT(2)
 #define MT_DRV_RX_DMA_HDR		BIT(3)
 #define MT_DRV_HW_MGMT_TXQ		BIT(4)
-#define MT_DRV_AMSDU_OFFLOAD		BIT(5)
 
 struct mt76_driver_ops {
 	u32 drv_flags;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index b155e7b8d89d..e56713425860 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -406,10 +406,12 @@ void mt76_connac_mcu_wtbl_hdr_trans_tlv(struct sk_buff *skb,
 	htr = (struct wtbl_hdr_trans *)tlv;
 	htr->no_rx_trans = !test_bit(MT_WCID_FLAG_HDR_TRANS, &wcid->flags);
 
-	if (vif->type == NL80211_IFTYPE_STATION)
-		htr->to_ds = true;
-	else
-		htr->from_ds = true;
+	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) {
+		if (vif->type == NL80211_IFTYPE_STATION)
+			htr->to_ds = true;
+		else
+			htr->from_ds = true;
+	}
 
 	if (test_bit(MT_WCID_FLAG_4ADDR, &wcid->flags)) {
 		htr->to_ds = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 340b364da5f0..e5a3f0ddaec3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -222,8 +222,7 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 	static const struct mt76_driver_ops drv_ops = {
 		/* txwi_size = txd size + txp size */
 		.txwi_size = MT_TXD_SIZE + sizeof(struct mt7915_txp),
-		.drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ |
-			     MT_DRV_AMSDU_OFFLOAD,
+		.drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ,
 		.survey_flags = SURVEY_INFO_TIME_TX |
 				SURVEY_INFO_TIME_RX |
 				SURVEY_INFO_TIME_BSS_RX,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 13263f50dc00..0aed1d061316 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -94,8 +94,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	static const struct mt76_driver_ops drv_ops = {
 		/* txwi_size = txd size + txp size */
 		.txwi_size = MT_TXD_SIZE + sizeof(struct mt7921_txp_common),
-		.drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ |
-			     MT_DRV_AMSDU_OFFLOAD,
+		.drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ,
 		.survey_flags = SURVEY_INFO_TIME_TX |
 				SURVEY_INFO_TIME_RX |
 				SURVEY_INFO_TIME_BSS_RX,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
