Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E197C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zKkAu8sBmZ8AUWqqGaZNWJ0ySqq2Qh8VC8e0QTwAd24=; b=hthEPL8AAKFVgsdHhdfYEHceK0
	rmKphc1vByguC+yUlO/BxpfkYXLzf9+cCQXOpNaYN0lTSAuCSPG+HBqY99Db335MNeo9X5AUmiVFF
	m+C/s271M16ESxYiGaMWSXOs0ezqkqiTGMTVtGNCjcuILaJMmqt7tY9H1jSumKFmqU7oYEMeMkRTq
	KfGMj9Rdn6oaV3nKEUmKyXAWxj3Xzh/PYCyekidMPL85G3+jCWeePRxaoQUhaVB/j992O1c34shiY
	qSmt54RUFrY+A+15Yl1yUCrzOHjJdi46vBAhPi7B0M2lumpZCNJP09pj1ngJr9skqSEElQTIkfMyy
	7cVqe8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wxP-009hkd-CL; Wed, 22 Jun 2022 09:47:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wxM-009hhR-DK
	for linux-mediatek@lists.infradead.org; Wed, 22 Jun 2022 09:47:30 +0000
X-UUID: a44be47bce364229ba35f7eb03c77323-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:59da1923-c032-4e15-b9c7-aedc78b53c22,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:626b2b38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a44be47bce364229ba35f7eb03c77323-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <meichia.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 210609809; Wed, 22 Jun 2022 02:47:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 02:47:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 17:47:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jun 2022 17:47:17 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, MeiChia Chiu
	<MeiChia.Chiu@mediatek.com>, Money Wang <Money.Wang@mediatek.com>
Subject: [PATCH] mt76: mt7915: update the maximum size of beacon offload
Date: Wed, 22 Jun 2022 17:46:55 +0800
Message-ID: <20220622094655.26594-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_024728_492411_2E94F56C 
X-CRM114-Status: GOOD (  10.72  )
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

Since an in-band discovery frame is offloaded by MCU,
here we enlarge the command size to accommodate the additional content.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 9 +++++++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3a7051858892..417f6402aff4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1980,6 +1980,12 @@ mt7915_mcu_beacon_inband_discov(struct mt7915_dev *dev, struct ieee80211_vif *vi
 	len = sizeof(*discov) + MT_TXD_SIZE + skb->len;
 	len = (len & 0x3) ? ((len | 0x3) + 1) : len;
 
+	if (len > (MAX_BSS_OFFLOAD_SIZE - rskb->len)) {
+		dev_err(dev->mt76.dev, "inband discovery size limit exceed\n");
+		dev_kfree_skb(skb);
+		return;
+	}
+
 	tlv = mt7915_mcu_add_nested_subtlv(rskb, BSS_INFO_BCN_DISCOV,
 					   len, &bcn->sub_ntlv, &bcn->len);
 	discov = (struct bss_info_inband_discovery *)tlv;
@@ -2002,7 +2008,6 @@ mt7915_mcu_beacon_inband_discov(struct mt7915_dev *dev, struct ieee80211_vif *vi
 int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  int en, u32 changed)
 {
-#define MAX_BEACON_SIZE 512
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
@@ -2011,7 +2016,7 @@ int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct sk_buff *skb, *rskb;
 	struct tlv *tlv;
 	struct bss_info_bcn *bcn;
-	int len = MT7915_BEACON_UPDATE_SIZE + MAX_BEACON_SIZE;
+	int len = MAX_BSS_OFFLOAD_SIZE;
 	bool ext_phy = phy != &dev->phy;
 
 	if (vif->bss_conf.nontransmitted)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 5abde482a97f..f73259d376b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -489,6 +489,12 @@ enum {
 	SER_RECOVER
 };
 
+#define MAX_BEACON_SIZE		512
+#define MAX_INBND_FRME_SIZE	256
+#define MAX_BSS_OFFLOAD_SIZE	(MAX_BEACON_SIZE +	  \
+				 MAX_INBND_FRME_SIZE +	  \
+				 MT7915_BEACON_UPDATE_SIZE)
+
 #define MT7915_BSS_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
 					 sizeof(struct bss_info_omac) +	\
 					 sizeof(struct bss_info_basic) +\
-- 
2.18.0


