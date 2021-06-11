Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05E8C48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 18:05:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7833613DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 18:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7833613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ToKt1mplKdc9jIhSF0ZzdbOduTj65lsZu+ulLLQd7g=; b=q5FLpW5zQm0ffG
	aiDMH2Su4t3XvtPK5D1JQYnzyOuzY3Q6NWFox1/h91tP5JUp9532Mt59dpqTe0Tct91Hv9+3s/xlE
	SZkDDlIxjBuuNlg0rtufouUAsrruE492YMHI0PocBBf0TuElxAMmHJCMbDgQxi3B3Y/vuiD+1pN9d
	AsY2+C0u5aN4pdXVvy0xVzYoSz0qFko/fOXFF8KAxLjqEW7GVtXEbosxUA4MrqQ/jXwxwXozVhFWH
	TO0891g82lvldcMfe6Z0aWcclI5oWdBro2pA3bUbU3AWt3U2N41Yy0ZwbYhtXHPcKwk8kuSLbDNPJ
	njs6aL4an9Gip81nn10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrlWU-006Pgt-Ig; Fri, 11 Jun 2021 18:04:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrlWP-006PcH-M2
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 18:04:49 +0000
X-UUID: d0b17792b7cd4a0c8ee5c6141ab84e88-20210611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d3QbEewhxR0a+7q41b5BkHFNwSeNjWM0QgvY2hluu3w=; 
 b=CwOXfKCETjG4mwdXxXM9EnXrbPGUfKrx8LgVjjc3HUMRHmSY1ihJtsS58xBsBAdA5+p5ZZUaddX06/DQfB/M0D47mO3NN+WaNOx31gH05g6W7EBK0SiwUNX0xHkTmGId7FKLiORi+SQXiWyJ1OwyUJ7QnbOGzZ63XZZQVFBNPto=;
X-UUID: d0b17792b7cd4a0c8ee5c6141ab84e88-20210611
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1397458783; Fri, 11 Jun 2021 11:04:42 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 11:04:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Jun 2021 02:04:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 12 Jun 2021 02:04:27 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>
Subject: [PATCH 2/2] mt76: fix iv and CCMP header insertion
Date: Sat, 12 Jun 2021 02:04:21 +0800
Message-ID: <7e5151dacb48b002f0abe720615b9b39844c2300.1623434432.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <28077c152c43d40f78252efb39d77ed5fca18028.1623434432.git.ryder.lee@mediatek.com>
References: <28077c152c43d40f78252efb39d77ed5fca18028.1623434432.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_110445_780285_50F722CF 
X-CRM114-Status: GOOD (  10.37  )
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

The iv from RXD is only for TKIP_RSC/CCMP_PN/GCMP_PN, and add checks for
CCMP header insertion.

Signed-off-by: Xing Song <xing.song@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7603/mac.c   | 29 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7603/regs.h  |  4 +++
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 29 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  3 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 29 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7915/mac.h   | 16 ++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 29 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7921/mac.h   | 16 ++++++++++
 8 files changed, 122 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 8435e9597688..d760b48b4ece 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -550,14 +550,27 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			status->iv[0] = data[5];
-			status->iv[1] = data[4];
-			status->iv[2] = data[3];
-			status->iv[3] = data[2];
-			status->iv[4] = data[1];
-			status->iv[5] = data[0];
-
-			insert_ccmp_hdr = FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+			switch (FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2)) {
+			case MT_CIPHER_AES_CCMP:
+			case MT_CIPHER_CCMP_CCX:
+			case MT_CIPHER_CCMP_256:
+				insert_ccmp_hdr =
+					FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+				fallthrough;
+			case MT_CIPHER_TKIP:
+			case MT_CIPHER_TKIP_NO_MIC:
+			case MT_CIPHER_GCMP:
+			case MT_CIPHER_GCMP_256:
+				status->iv[0] = data[5];
+				status->iv[1] = data[4];
+				status->iv[2] = data[3];
+				status->iv[3] = data[2];
+				status->iv[4] = data[1];
+				status->iv[5] = data[0];
+				break;
+			default:
+				break;
+			}
 		}
 
 		rxd += 4;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/regs.h b/drivers/net/wireless/mediatek/mt76/mt7603/regs.h
index 6741e6907194..201b39e9b8e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/regs.h
@@ -775,6 +775,10 @@ enum mt7603_cipher_type {
 	MT_CIPHER_BIP_CMAC_128,
 	MT_CIPHER_WEP128,
 	MT_CIPHER_WAPI,
+	MT_CIPHER_CCMP_CCX,
+	MT_CIPHER_CCMP_256,
+	MT_CIPHER_GCMP,
+	MT_CIPHER_GCMP_256,
 };
 
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index a48c198fb9cd..7261005ad538 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -313,14 +313,27 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			status->iv[0] = data[5];
-			status->iv[1] = data[4];
-			status->iv[2] = data[3];
-			status->iv[3] = data[2];
-			status->iv[4] = data[1];
-			status->iv[5] = data[0];
-
-			insert_ccmp_hdr = FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+			switch (FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2)) {
+			case MT_CIPHER_AES_CCMP:
+			case MT_CIPHER_CCMP_CCX:
+			case MT_CIPHER_CCMP_256:
+				insert_ccmp_hdr =
+					FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+				fallthrough;
+			case MT_CIPHER_TKIP:
+			case MT_CIPHER_TKIP_NO_MIC:
+			case MT_CIPHER_GCMP:
+			case MT_CIPHER_GCMP_256:
+				status->iv[0] = data[5];
+				status->iv[1] = data[4];
+				status->iv[2] = data[3];
+				status->iv[3] = data[2];
+				status->iv[4] = data[1];
+				status->iv[5] = data[0];
+				break;
+			default:
+				break;
+			}
 		}
 		rxd += 4;
 		if ((u8 *)rxd - skb->data >= skb->len)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index d17bf200d8de..309c40f5bf72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -394,7 +394,8 @@ enum mt7615_cipher_type {
 	MT_CIPHER_BIP_CMAC_128,
 	MT_CIPHER_WEP128,
 	MT_CIPHER_WAPI,
-	MT_CIPHER_CCMP_256 = 10,
+	MT_CIPHER_CCMP_CCX,
+	MT_CIPHER_CCMP_256,
 	MT_CIPHER_GCMP,
 	MT_CIPHER_GCMP_256,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index c093c13bf1f1..ab190508416f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -413,14 +413,27 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			status->iv[0] = data[5];
-			status->iv[1] = data[4];
-			status->iv[2] = data[3];
-			status->iv[3] = data[2];
-			status->iv[4] = data[1];
-			status->iv[5] = data[0];
-
-			insert_ccmp_hdr = FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+			switch (FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1)) {
+			case MT_RX_CIPHER_AES_CCMP:
+			case MT_RX_CIPHER_CCMP_CCX:
+			case MT_RX_CIPHER_CCMP_256:
+				insert_ccmp_hdr =
+					FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+				fallthrough;
+			case MT_RX_CIPHER_TKIP:
+			case MT_RX_CIPHER_TKIP_NO_MIC:
+			case MT_RX_CIPHER_GCMP:
+			case MT_RX_CIPHER_GCMP_256:
+				status->iv[0] = data[5];
+				status->iv[1] = data[4];
+				status->iv[2] = data[3];
+				status->iv[3] = data[2];
+				status->iv[4] = data[1];
+				status->iv[5] = data[0];
+				break;
+			default:
+				break;
+			}
 		}
 		rxd += 4;
 		if ((u8 *)rxd - skb->data >= skb->len)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index eb1885f4bd8e..a25254e6b3d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -150,6 +150,22 @@ enum rx_pkt_type {
 #define MT_CRXV_FOE_HI		GENMASK(6, 0)
 #define MT_CRXV_FOE_SHIFT	13
 
+enum rx_cipher_type {
+	MT_RX_CIPHER_NONE,
+	MT_RX_CIPHER_WEP40,
+	MT_RX_CIPHER_TKIP,
+	MT_RX_CIPHER_TKIP_NO_MIC,
+	MT_RX_CIPHER_AES_CCMP,
+	MT_RX_CIPHER_WEP104,
+	MT_RX_CIPHER_BIP_CMAC_128,
+	MT_RX_CIPHER_WEP128,
+	MT_RX_CIPHER_WAPI,
+	MT_RX_CIPHER_CCMP_CCX,
+	MT_RX_CIPHER_CCMP_256,
+	MT_RX_CIPHER_GCMP,
+	MT_RX_CIPHER_GCMP_256,
+};
+
 enum tx_header_format {
 	MT_HDR_FORMAT_802_3,
 	MT_HDR_FORMAT_CMD,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 5af3a958e5b0..8f09b40d329d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -433,14 +433,27 @@ int mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			status->iv[0] = data[5];
-			status->iv[1] = data[4];
-			status->iv[2] = data[3];
-			status->iv[3] = data[2];
-			status->iv[4] = data[1];
-			status->iv[5] = data[0];
-
-			insert_ccmp_hdr = FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+			switch (FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1)) {
+			case MT_RX_CIPHER_AES_CCMP:
+			case MT_RX_CIPHER_CCMP_CCX:
+			case MT_RX_CIPHER_CCMP_256:
+				insert_ccmp_hdr =
+					FIELD_GET(MT_RXD2_NORMAL_FRAG, rxd2);
+				fallthrough;
+			case MT_RX_CIPHER_TKIP:
+			case MT_RX_CIPHER_TKIP_NO_MIC:
+			case MT_RX_CIPHER_GCMP:
+			case MT_RX_CIPHER_GCMP_256:
+				status->iv[0] = data[5];
+				status->iv[1] = data[4];
+				status->iv[2] = data[3];
+				status->iv[3] = data[2];
+				status->iv[4] = data[1];
+				status->iv[5] = data[0];
+				break;
+			default:
+				break;
+			}
 		}
 		rxd += 4;
 		if ((u8 *)rxd - skb->data >= skb->len)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
index 3af67fac213d..020c1e4ebe2c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
@@ -155,6 +155,22 @@ enum rx_pkt_type {
 #define MT_CRXV_FOE_HI		GENMASK(6, 0)
 #define MT_CRXV_FOE_SHIFT	13
 
+enum rx_cipher_type {
+	MT_RX_CIPHER_NONE,
+	MT_RX_CIPHER_WEP40,
+	MT_RX_CIPHER_TKIP,
+	MT_RX_CIPHER_TKIP_NO_MIC,
+	MT_RX_CIPHER_AES_CCMP,
+	MT_RX_CIPHER_WEP104,
+	MT_RX_CIPHER_BIP_CMAC_128,
+	MT_RX_CIPHER_WEP128,
+	MT_RX_CIPHER_WAPI,
+	MT_RX_CIPHER_CCMP_CCX,
+	MT_RX_CIPHER_CCMP_256,
+	MT_RX_CIPHER_GCMP,
+	MT_RX_CIPHER_GCMP_256,
+};
+
 enum tx_header_format {
 	MT_HDR_FORMAT_802_3,
 	MT_HDR_FORMAT_CMD,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
