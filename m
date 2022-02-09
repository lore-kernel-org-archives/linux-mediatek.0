Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 01:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SGo5WsR+8nK3aAwTU/dCtoYvSYOAx54BKmEwSCMjlcs=; b=i+xaSaaP1qaipl
	AoMkSN5dZFpo4RS6qe8D7cdVyP+oqcJqUy9WZFUJJFwCZiWvVJwwfKtqjj3cBGaCpMVpBf8cyhwaw
	DS1Esu/VR763Gi7qszKQ1JBS4KLKSpVVVNXbC5RohSCKrWi4z8rVt1mQ0yHhgXiCHKzCHdFzhMPLo
	uq/mKEl1CdNM0m5s4EoqYbaBBjAQQ+LSDR3S1RRJAH7EUzxuIuc7reRbuM5IOo+FJnw0qXdZ1z0y0
	pDnk3bbplAXBBnpdxFOE2XbkcwNIImW9+ubkiTTo8rPgZJgcrraEqmQMZhA9df+1DEhBhPO4yWQ5+
	CwQQMU++o8Kiv6+i8HNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHbyS-00FumN-Nc; Wed, 09 Feb 2022 01:40:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHbyP-00Fuld-IS
 for linux-mediatek@lists.infradead.org; Wed, 09 Feb 2022 01:40:46 +0000
X-UUID: 4f776835469c45fe895c86fbc190a92d-20220208
X-UUID: 4f776835469c45fe895c86fbc190a92d-20220208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1147752178; Tue, 08 Feb 2022 18:40:40 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 17:40:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 09:40:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Feb 2022 09:40:37 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2] mt76: mt7921s: fix missing fc type/sub-type for 802.11 pkts
Date: Wed, 9 Feb 2022 09:40:27 +0800
Message-ID: <41839f21510756e08919ae7930212817e37f40f0.1644370695.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_174045_641357_534A048C 
X-CRM114-Status: GOOD (  10.39  )
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

From: Deren Wu <deren.wu@mediatek.com>

For non-mmio devices, should set fc values to proper txwi config

Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
Tested-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Leon Yen <Leon.Yen@mediatek.com>
Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v2: remove is_mmio which is just used once
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 12 +++++++++---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.h |  3 +++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index d17558349a17..f0ebee670131 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -912,9 +912,15 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev, __le32 *txwi,
 		txwi[3] |= cpu_to_le32(val);
 	}
 
-	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
-	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
-	txwi[7] |= cpu_to_le32(val);
+	if (mt76_is_mmio(&dev->mt76)) {
+		val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
+		      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
+		txwi[7] |= cpu_to_le32(val);
+	} else {
+		val = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
+		      FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
+		txwi[8] |= cpu_to_le32(val);
+	}
 }
 
 void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
index 544a1c33126a..12e1cf8abe6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
@@ -284,6 +284,9 @@ enum tx_mcu_port_q_idx {
 #define MT_TXD7_HW_AMSDU		BIT(10)
 #define MT_TXD7_TX_TIME			GENMASK(9, 0)
 
+#define MT_TXD8_L_TYPE			GENMASK(5, 4)
+#define MT_TXD8_L_SUB_TYPE		GENMASK(3, 0)
+
 #define MT_TX_RATE_STBC			BIT(13)
 #define MT_TX_RATE_NSS			GENMASK(12, 10)
 #define MT_TX_RATE_MODE			GENMASK(9, 6)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
