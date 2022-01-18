Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E065DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KFYa7pCjWvwMMepsHnqjMbkc4wr/avbnxWumpPET9uk=; b=npZqMzcVnGRrAQ
	lp/thOG/TPOOSxub1zeEOtwaQgE9ma09coP5Qc+G0Mw52Nli3CxnYce7IdtX/LBvIQJlLiYfZ376x
	Um3SAMgpe/YCLMcM4JrsUzZGCffxaodumTfR+lQ6TEFO1NP0EWeIdEmYESg9poYZh0Z35b/5C7VgX
	h/c+aUvZ5uGzbKhy3ZJSlroUQCr/JPXEWIEaVbjiTb4Q7tKpkw0uxYeeHbSWDAxftZG7ZdOv2JeT/
	tMSPlW89bUEJsXdkELiT26EU4dbFSceuhswUkgamlA7FBpm3GPRVIa1JLFUqOA1Vd5tM/PfD8qXun
	QxQP1tX+1RgR5MrbZ6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9jOV-000g99-9a; Tue, 18 Jan 2022 07:59:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9jON-000fxA-RG
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 07:59:05 +0000
X-UUID: db96cc77e8564ccbbae420473b5697fa-20220118
X-UUID: db96cc77e8564ccbbae420473b5697fa-20220118
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 312963291; Tue, 18 Jan 2022 00:58:49 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 23:58:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 18 Jan 2022 15:58:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Jan 2022 15:58:46 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: check band idx for bcc event
Date: Tue, 18 Jan 2022 15:58:45 +0800
Message-ID: <74293a8c02d0e6ca3460aa30bd374cddec9a0a1e.1642485678.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_235859_915655_35E83D6A 
X-CRM114-Status: GOOD (  11.72  )
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

Add missing band idx check for DBDC cases.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
This depends on https://patchwork.kernel.org/project/linux-wireless/patch/055b47746ca7756fd8ed14ff197c0c090393369d.1642128031.git.Bo.Jiao@mediatek.com/
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 20 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  9 +++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 43c95bd15170..6c5568d6abde 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -422,6 +422,22 @@ mt7915_mcu_cca_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	ieee80211_color_change_finish(vif);
 }
 
+static void
+mt7915_mcu_rx_bcc_notify(struct mt7915_dev *dev, struct sk_buff *skb)
+{
+	struct mt76_phy *mphy = &dev->mt76.phy;
+	struct mt7915_mcu_bcc_notify *b;
+
+	b = (struct mt7915_mcu_bcc_notify *)skb->data;
+
+	if ((b->band_idx && !dev->phy.band_idx) && dev->mt76.phy2)
+		mphy = dev->mt76.phy2;
+
+	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
+			IEEE80211_IFACE_ITER_RESUME_ALL,
+			mt7915_mcu_cca_finish, mphy->hw);
+}
+
 static void
 mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 {
@@ -441,9 +457,7 @@ mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 		mt7915_mcu_rx_log_message(dev, skb);
 		break;
 	case MCU_EXT_EVENT_BCC_NOTIFY:
-		ieee80211_iterate_active_interfaces_atomic(dev->mt76.hw,
-				IEEE80211_IFACE_ITER_RESUME_ALL,
-				mt7915_mcu_cca_finish, dev);
+		mt7915_mcu_rx_bcc_notify(dev, skb);
 		break;
 	default:
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index aa05c6ceebb9..fb558a6945fd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -79,6 +79,15 @@ struct mt7915_mcu_csa_notify {
 	u8 rsv;
 } __packed;
 
+struct mt7915_mcu_bcc_notify {
+	struct mt7915_mcu_rxd rxd;
+
+	u8 band_idx;
+	u8 omac_idx;
+	u8 cca_count;
+	u8 rsv;
+} __packed;
+
 struct mt7915_mcu_rdd_report {
 	struct mt7915_mcu_rxd rxd;
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
