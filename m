Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1B2C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 22:52:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5253F60C4D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 22:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5253F60C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0Ht7kB1zR8tKClKQBRUFCSuxI4BJPHkmN2n9+sszXg=; b=z8ygS668ZacRNC
	bsaFN/JnXtVt21EwX1deTEktBPMCtV7FeP17XMwbmrYN2Bdslb7T3uCoeTA7OuvHT1j6MCOJF3TNs
	xwwP5GC8McoWjPHaFuFncy5w2YRfQUNS5jRfEe81dQDJIB3tcZMjBC4JU6b4Qya2uSHcRCXFw7+hc
	USrPuNxD2ojajMO3jLeyi+W7Svf7xVN+PGqsX6xu6+AemiiBUgp36nvFrfVGp2Da6hJaSbQyf2E9J
	FWkjevCtqCwCooRN0OvJpA7wjzt6A/36Ga6sLUgfy4in7H6VHFCFu0/83/XIlcuci/5lwhumDxYrP
	fW4WMV0OC5EIdQDYvIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maQdT-00E7eN-IJ; Tue, 12 Oct 2021 22:52:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maQdR-00E7dN-NT
 for linux-mediatek@lists.infradead.org; Tue, 12 Oct 2021 22:52:39 +0000
X-UUID: 7d587c16cb9b4d40b43079809787a86b-20211012
X-UUID: 7d587c16cb9b4d40b43079809787a86b-20211012
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2136850058; Tue, 12 Oct 2021 15:52:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 15:52:34 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 13 Oct 2021 06:52:33 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 06/16] mt76: connac: move mcu reg access utility routines
 in mt76_connac_lib module
Date: Wed, 13 Oct 2021 06:51:59 +0800
Message-ID: <9db79a69d6557dee8e55954e0b97066b5d15c5a7.1634077769.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634077769.git.objelf@gmail.com>
References: <cover.1634077769.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_155237_795840_5624BF4D 
X-CRM114-Status: UNSURE (   9.93  )
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

Move mcu reg access shared between mt7663s and mt7921s in mt76_connac_lib
module.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 27 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index c569e320f843..404c6bf8578e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2412,6 +2412,33 @@ void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_suspend_iter);
 
+u32 mt76_connac_mcu_reg_rr(struct mt76_dev *dev, u32 offset)
+{
+	struct {
+		__le32 addr;
+		__le32 val;
+	} __packed req = {
+		.addr = cpu_to_le32(offset),
+	};
+
+	return mt76_mcu_send_msg(dev, MCU_CMD_REG_READ, &req, sizeof(req),
+				 true);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_reg_rr);
+
+void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val)
+{
+	struct {
+		__le32 addr;
+		__le32 val;
+	} __packed req = {
+		.addr = cpu_to_le32(offset),
+		.val = cpu_to_le32(val),
+	};
+
+	mt76_mcu_send_msg(dev, MCU_CMD_REG_WRITE, &req, sizeof(req), false);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_reg_wr);
 #endif /* CONFIG_PM */
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 848f43c44258..e5a0a6827145 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1113,4 +1113,6 @@ void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 int mt76_connac_mcu_set_rate_txpower(struct mt76_phy *phy);
 int mt76_connac_mcu_set_p2p_oppps(struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif);
+u32 mt76_connac_mcu_reg_rr(struct mt76_dev *dev, u32 offset);
+void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
 #endif /* __MT76_CONNAC_MCU_H */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
