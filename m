Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C83C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 01:52:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875AA613D0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 01:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 875AA613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+f7RqLlpC9ZE6H4FbAaeLCEUOw+q+994HJ5G7Y44gIg=; b=3vqoUqik48zSTn
	Gw82oIK+zpANJa61mwjm1Uczl7KhrTMAVZBuGEaBqohRSCY1zijC4gLhoE4elGmuC1Co+BUnF+wFL
	5QxBDqm/bzOY/ASEkss400vmXLAzlHLeDNnDiaRD2uepUMBuqjsSyLrrOg26ZDqldav/ne6KPAJ8+
	Isr+0FwJ6NziGMwi2JvzbpO+ohKSakiZxpuasI4knoynuExegsa3eRVUhIX5crqdZWk/lNbheFI9N
	sQ4YZouAC51I9r8KMHS4IrrmIewweJX4MDtWgMJZswEU+8uIGPy8aubcB0A0wH/oM5Iq2YgPnNSXF
	1yPmCNM4i+7e/wTEZOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loG3p-001X6E-57; Wed, 02 Jun 2021 01:52:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loG3n-001X5p-9w
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 01:52:44 +0000
X-UUID: 9f3898e8673e4e249172c97e4cd0958b-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=P0JczdjtXLMD3lKRzUEdp9LlUudbdF4NZ7ZINV8TM9k=; 
 b=j7q0yaUum3Laox9DjzsES1ONn/Kh/asZnmuzb8KxjEXFzNZRHMxzAPIcUKgtMcXUyS/RBg2O4Ml9LfPoWzKSMQjfkDoJFlbkTLLEaTgABpbvRvXjrl1f/fanqyFoyvhsLxhKaRqvo/Eku0IvwPb7kMij8wqtWbRHe334tE7Lcgg=;
X-UUID: 9f3898e8673e4e249172c97e4cd0958b-20210601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2103512158; Tue, 01 Jun 2021 18:52:42 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 18:50:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 09:50:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 09:50:18 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: setup drr group for peers
Date: Wed, 2 Jun 2021 09:50:17 +0800
Message-ID: <6c7c14984826d3a69b6a381a83259b8df63c13c1.1622591903.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <56332dd6ef478da69d4a5319c3745116072e1949.1622591903.git.ryder.lee@mediatek.com>
References: <56332dd6ef478da69d4a5319c3745116072e1949.1622591903.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_185243_372668_469446EA 
X-CRM114-Status: GOOD (  10.59  )
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

This is a prerequisite for MU functionality.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 655fabd32c1e..49321b4dcf71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2332,6 +2332,32 @@ int mt7915_mcu_add_he(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				     MCU_EXT_CMD(STA_REC_UPDATE), true);
 }
 
+static int
+mt7915_mcu_add_group(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		     struct ieee80211_sta *sta)
+{
+#define MT_STA_BSS_GROUP		1
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct {
+		__le32 action;
+		u8 wlan_idx_lo;
+		u8 status;
+		u8 wlan_idx_hi;
+		u8 rsv0[5];
+		__le32 val;
+		u8 rsv1[8];
+	} __packed req = {
+		.action = cpu_to_le32(MT_STA_BSS_GROUP),
+		.wlan_idx_lo = to_wcid_lo(msta->wcid.idx),
+		.wlan_idx_hi = to_wcid_hi(msta->wcid.idx),
+		.val = cpu_to_le32(mvif->idx % 16),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(SET_DRR_CTRL), &req,
+				 sizeof(req), true);
+}
+
 int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, bool enable)
 {
@@ -2341,6 +2367,10 @@ int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		return 0;
 
 	/* must keep the order */
+	ret = mt7915_mcu_add_group(dev, vif, sta);
+	if (ret)
+		return ret;
+
 	ret = mt7915_mcu_add_txbf(dev, vif, sta, enable);
 	if (ret)
 		return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
