Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB7BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l0mhNdBKy6rfJf+GNyiWZlvD6V/6hv0B4rIgEUWCifI=; b=IaJlE96Bc8NFax
	/kaH/bZUzeB3AHWcaIyyXoqjQaZElhwIq4VxiHEyPEy/sEa3VYIG+Yth0FUqaHg8JrVV84GgnWsRI
	K6SVnJjfr+SiM/JHejZcTipbzIsbKri+C9NVD0Ra5gxBV2y/ONjhQ1JCEJJtVBej0PEPwPlbXydcE
	96JGNvYA/4xW/LZO6UyY9TOz5od2eFYlwVxd9AijSXna+Jyxr1OpPlIIH6nUdbLTwC/VAQpbhaX6j
	B0PZwOv+vVq22mgJ/mpUM4Lf4TeNRKevcu8J03UWMObR7y14w0rzyCLclt8Pc/n8DCTVxg/kfhb2A
	AdlUrzp0CCHyYWzjZVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp7wl-00GC72-Hq; Mon, 22 Nov 2021 11:57:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp703-00FwPz-55
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 10:56:40 +0000
X-UUID: 80a83fbf755a4fd0b518975a1cc11ddb-20211122
X-UUID: 80a83fbf755a4fd0b518975a1cc11ddb-20211122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 738418368; Mon, 22 Nov 2021 03:56:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 02:56:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 22 Nov 2021 18:56:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 22 Nov 2021 18:56:29 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 MeiChia Chiu <meichia.chiu@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix the wrong SMPS mode
Date: Mon, 22 Nov 2021 18:56:26 +0800
Message-ID: <20211122105626.6275-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_025639_240157_19403A93 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

Without this change, it sends the wrong SMPS mode to firmware
when a station sends an action frame with disabled SMPS.

Fixes: 427b09cd6bfa ("mt76: mt7915: fix SMPS operation fail")
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c | 17 ++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h |  7 +++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ceeb5e3f..f922265f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2022,6 +2022,21 @@ mt7915_mcu_sta_bfee_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	bfee->fb_identity_matrix = (nrow == 1 && tx_ant == 2);
 }
 
+static enum mcu_mmps_mode
+mt7915_mcu_get_mmps_mode(enum ieee80211_smps_mode smps)
+{
+	switch (smps) {
+	case IEEE80211_SMPS_OFF:
+		return MCU_MMPS_DISABLE;
+	case IEEE80211_SMPS_STATIC:
+		return MCU_MMPS_STATIC;
+	case IEEE80211_SMPS_DYNAMIC:
+		return MCU_MMPS_DYNAMIC;
+	default:
+		return MCU_MMPS_DISABLE;
+	}
+}
+
 int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
@@ -2053,7 +2068,7 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 			ra->phy = *phy;
 		break;
 	case RATE_PARAM_MMPS_UPDATE:
-		ra->mmps_mode = (sta->smps_mode == IEEE80211_SMPS_DYNAMIC);
+		ra->mmps_mode = mt7915_mcu_get_mmps_mode(sta->smps_mode);
 		break;
 	default:
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 1beaba38..53fa0f01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -365,6 +365,13 @@ enum {
 	MCU_PHY_STATE_OFDMLQ_CNINFO,
 };
 
+enum mcu_mmps_mode {
+	MCU_MMPS_STATIC,
+	MCU_MMPS_DYNAMIC,
+	MCU_MMPS_RSV,
+	MCU_MMPS_DISABLE,
+};
+
 #define STA_TYPE_STA			BIT(0)
 #define STA_TYPE_AP			BIT(1)
 #define STA_TYPE_ADHOC			BIT(2)
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
