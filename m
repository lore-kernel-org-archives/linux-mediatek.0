Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4895C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 06:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AoALzwV8d6NJ2ISJuNql7JRkGvj4HNgGRK89uacXkHo=; b=Rxy06SaPzcOf5h
	+khtPo09jMcff9+Ur0JkX7OA6lbcA4l+flQ6CBNl1rrXRN8tG5tIEc+Pp7IPVTh5vmr9N2QtGuq2U
	omu6cN/qyFFZB3HYs+2lPR7hSLoWRDPBFZaExmw4axkgmHGyko7IX1w5RpIDT+B/h8lAku8CvegtM
	MM5vgvPTeSfHbTZ2w+ru/LNDem5nP7Yki2nXwgBbYzu04aRbr+1dbXte5ldwV7ia4CyGutGCnRk1S
	SR+27kqazragomddRi6wtDPWEQFdpQ40A9c5dX4HOKxikK7wHNhYidpmXbvFdXO4+S30Jy9rSZe5v
	Lmp/ouE4Q6YbWyYmpZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt1gz-00EV4p-Q9; Fri, 03 Dec 2021 06:05:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt1gx-00EV47-89
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 06:05:08 +0000
X-UUID: 6f3ae899a1d7473f856aefa68d6d7107-20211202
X-UUID: 6f3ae899a1d7473f856aefa68d6d7107-20211202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1014503273; Thu, 02 Dec 2021 23:04:59 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 22:04:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 3 Dec 2021 14:04:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 3 Dec 2021 14:04:56 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: only access ieee80211_hdr after mt76_insert_ccmp_hdr
Date: Fri, 3 Dec 2021 14:04:54 +0800
Message-ID: <37d186367a8221b637489dd914cc524b3e545bbc.1638508664.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_220507_323777_F5D6A863 
X-CRM114-Status: GOOD (  10.18  )
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

Get rid of unsafe access since mt76_insert_ccmp_hdr moves the header.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 5757284b24a5..c8747f59ba51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -777,7 +777,7 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	}
 
 	if (!hdr_trans) {
-		struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
+		struct ieee80211_hdr *hdr;
 
 		if (insert_ccmp_hdr) {
 			u8 key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
@@ -785,6 +785,7 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			mt76_insert_ccmp_hdr(skb, key_id);
 		}
 
+		hdr = mt76_skb_get_hdr(skb);
 		fc = hdr->frame_control;
 		if (ieee80211_is_data_qos(fc)) {
 			seq_ctrl = le16_to_cpu(hdr->seq_ctrl);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 30cce5743731..edf54b192f37 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -772,7 +772,7 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 	}
 
 	if (!hdr_trans) {
-		struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
+		struct ieee80211_hdr *hdr;
 
 		if (insert_ccmp_hdr) {
 			u8 key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
