Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B58FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 23:56:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD786023E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 23:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAD786023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJ4PWNd/CVShWQTF8hsyytLg3oAcg+oxLwgiSDPmHFc=; b=xjkTC2Ug9Lyp6E
	98BTk+UCGkXrnhpaNGc0mSMnF44ECgfDk0jbvnYRYJBexHTAmS0prc03mrtqHYT8Qd0Fv+KYIk9jO
	RjRJm9HSyjJkPB5TIWUoQvsSB0swG1aCZK/tl1d+HbwxqMiZ1Uuqaj5aicxJejUCst+GjPDHBXfNh
	RWzPUWxHqVN7bMGvHPBgA9bGIUnYv9HQnypf6b7jQWO3WKJ4xM+uEXAQG6ZrGDZA4AFfOHpXpw8Uz
	f7CydkXsCt0bx6pJG9oj0ApGNVha5RJshpXLu1ra6HdngJ8Mebyy7nqbg3GAG7igY3O8+U9XgWETV
	qWpLruXjmOOmrUsmujkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW5uT-00GBs7-Gx; Thu, 30 Sep 2021 23:56:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW5uQ-00GBqU-NX
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 23:56:16 +0000
X-UUID: 5280cfc02c23488d843ebdcf95d943cb-20210930
X-UUID: 5280cfc02c23488d843ebdcf95d943cb-20210930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1865500873; Thu, 30 Sep 2021 16:56:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 16:48:34 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Oct 2021 07:48:34 +0800
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
Subject: [PATCH v3 07/16] mt76: mt7663s: rely on mcu reg access utility
Date: Fri, 1 Oct 2021 07:47:54 +0800
Message-ID: <85361034e0548095b442ec2e093c28e46798eac0.1632961096.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1632961096.git.objelf@gmail.com>
References: <cover.1632961096.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_165614_811046_4EBD6C15 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Sean Wang <sean.wang@mediatek.com>

rely on mcu reg access utility and drop the duplicated code.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 28 -------------------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 --
 .../wireless/mediatek/mt76/mt7615/sdio_mcu.c  |  4 +--
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index a39776833efd..017413c90970 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2761,31 +2761,3 @@ int mt7615_mcu_set_roc(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_ROC, &req,
 				 sizeof(req), false);
 }
-
-u32 mt7615_mcu_reg_rr(struct mt76_dev *dev, u32 offset)
-{
-	struct {
-		__le32 addr;
-		__le32 val;
-	} __packed req = {
-		.addr = cpu_to_le32(offset),
-	};
-
-	return mt76_mcu_send_msg(dev, MCU_CMD_REG_READ, &req, sizeof(req),
-				 true);
-}
-EXPORT_SYMBOL_GPL(mt7615_mcu_reg_rr);
-
-void mt7615_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val)
-{
-	struct {
-		__le32 addr;
-		__le32 val;
-	} __packed req = {
-		.addr = cpu_to_le32(offset),
-		.val = cpu_to_le32(val),
-	};
-
-	mt76_mcu_send_msg(dev, MCU_CMD_REG_WRITE, &req, sizeof(req), false);
-}
-EXPORT_SYMBOL_GPL(mt7615_mcu_reg_wr);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 58a98b5c0cbc..437f14f06e63 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -553,8 +553,6 @@ int mt7615_mac_set_beacon_filter(struct mt7615_phy *phy,
 int mt7615_mcu_set_bss_pm(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			  bool enable);
 int __mt7663_load_firmware(struct mt7615_dev *dev);
-u32 mt7615_mcu_reg_rr(struct mt76_dev *dev, u32 offset);
-void mt7615_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
 void mt7615_coredump_work(struct work_struct *work);
 
 void mt7622_trigger_hif_int(struct mt7615_dev *dev, bool en);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
index 45c1cd3b9f49..517419bb7772 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
@@ -137,8 +137,8 @@ int mt7663s_mcu_init(struct mt7615_dev *dev)
 		.mcu_skb_send_msg = mt7663s_mcu_send_message,
 		.mcu_parse_response = mt7615_mcu_parse_response,
 		.mcu_restart = mt7615_mcu_restart,
-		.mcu_rr = mt7615_mcu_reg_rr,
-		.mcu_wr = mt7615_mcu_reg_wr,
+		.mcu_rr = mt76_connac_mcu_reg_rr,
+		.mcu_wr = mt76_connac_mcu_reg_wr,
 	};
 	struct mt7615_mcu_ops *mcu_ops;
 	int ret;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
