Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 23:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019506124F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 23:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 019506124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxb16EYaGFeSfm+eNsLrW2PeZ71JX+rUInI/UjrXXh4=; b=XvWBj2biKWNp7G
	ZgneLHDtMfC/8RZ5tg6zM2BJohMgBJOtRlQODUIOc8ugxvYBr4z1cLd1VBxLjiOas6mUwEc6UlE4j
	r13zv+cvRBeGsQQi6Iyfw43ejjTzkdty0pn/fU2ZGtBGB/mpgBoDuQ0OGGH0IeTLV3ek+BIaGc/vm
	O39ukDRoqIsZT1JS+nUVyx5kFbaWeBh2J9nlScJGg8wuz8DIj1hdYBcbr9cdPgEnEjZXuCRJPtIOI
	/sv2hotR4v99isenz6RAwLBtUSsDAGLQe+21+iNsLjhoPRKn+E+9jbEE5Ncoyb/g1J8EfmfnvqpgF
	uSC7RqGRYNtAI5t56ASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW5t3-00GBI2-LR; Thu, 30 Sep 2021 23:54:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW5sw-00GBDZ-9t
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 23:54:43 +0000
X-UUID: 72da5cb8241c41e2b9c0e5ed3b048c77-20210930
X-UUID: 72da5cb8241c41e2b9c0e5ed3b048c77-20210930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1627658606; Thu, 30 Sep 2021 16:54:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 16:49:03 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Oct 2021 07:49:03 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <shawnku@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 14/16] mt76: mt7921: refactor mt7921_mcu_send_message
Date: Fri, 1 Oct 2021 07:48:01 +0800
Message-ID: <f0571612eebee17d761ffb1c1c855a4d1f568e18.1632961096.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1632961096.git.objelf@gmail.com>
References: <cover.1632961096.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_165442_416394_F1033099 
X-CRM114-Status: GOOD (  13.90  )
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

This is a preliminary patch to introduce mt7921s support.

Refactor mt7921_mcu_send_message to be sharable between mt7921e and
mt7921e.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c    | 11 ++++-------
 .../net/wireless/mediatek/mt76/mt7921/mt7921.h |  2 +-
 .../wireless/mediatek/mt76/mt7921/pci_mcu.c    | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 432aa534733d..7a9573b977f6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -224,12 +224,11 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 }
 EXPORT_SYMBOL_GPL(mt7921_mcu_parse_response);
 
-int mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
+int mt7921_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			    int cmd, int *wait_seq)
 {
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
 	int txd_len, mcu_cmd = cmd & MCU_CMD_MASK;
-	enum mt76_mcuq_id txq = MT_MCUQ_WM;
 	struct mt7921_uni_txd *uni_txd;
 	struct mt7921_mcu_txd *mcu_txd;
 	__le32 *txd;
@@ -251,10 +250,8 @@ int mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (!seq)
 		seq = ++dev->mt76.mcu.msg_seq & 0xf;
 
-	if (cmd == MCU_CMD_FW_SCATTER) {
-		txq = MT_MCUQ_FWDL;
+	if (cmd == MCU_CMD_FW_SCATTER)
 		goto exit;
-	}
 
 	txd_len = cmd & MCU_UNI_PREFIX ? sizeof(*uni_txd) : sizeof(*mcu_txd);
 	txd = (__le32 *)skb_push(skb, txd_len);
@@ -318,9 +315,9 @@ int mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (wait_seq)
 		*wait_seq = seq;
 
-	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[txq], skb, 0);
+	return 0;
 }
-EXPORT_SYMBOL_GPL(mt7921_mcu_send_message);
+EXPORT_SYMBOL_GPL(mt7921_mcu_fill_message);
 
 static void
 mt7921_mcu_scan_event(struct mt7921_dev *dev, struct sk_buff *skb)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 2082b4d2a23d..f4b85ec530bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -381,7 +381,7 @@ void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
 			   bool beacon);
 void mt7921_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi);
 void mt7921_mac_sta_poll(struct mt7921_dev *dev);
-int mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
+int mt7921_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			    int cmd, int *wait_seq);
 int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			      struct sk_buff *skb, int seq);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
index 9ac3bc25f067..583a89a34734 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
@@ -18,6 +18,24 @@ static int mt7921e_driver_own(struct mt7921_dev *dev)
 	return 0;
 }
 
+static int
+mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
+			int cmd, int *seq)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	enum mt76_mcuq_id txq = MT_MCUQ_WM;
+	int ret;
+
+	ret = mt7921_mcu_fill_message(mdev, skb, cmd, seq);
+	if (ret)
+		return ret;
+
+	if (cmd == MCU_CMD_FW_SCATTER)
+		txq = MT_MCUQ_FWDL;
+
+	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[txq], skb, 0);
+}
+
 int mt7921e_mcu_init(struct mt7921_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7921_mcu_ops = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
