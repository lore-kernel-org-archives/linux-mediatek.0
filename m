Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853A7C43461
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DFA6052B
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DFA6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nw1KcaEfwBrxLm4U31xeE9jvqb/ay+LdAs02IPIhrDo=; b=NKUJtgK/zXy4lkiXa5s0wC7f3
	0dYegnqkIPQpDBHIvtc2YEoMq4z2N8m3hmfc+ipcyYvM5nDYOO5D6BQBQYnZrkMFbvD9S+Ej/siVX
	3d2ODQEG+OVq1qjAJcHa1KmUxmm5KT7ga6QBQZYD/7z6yEB8+KecRzSSQyYjMuVxYBSBjPMRyUZUD
	2XO9BTILxE/dY/eB9KQ4ZsCg9s21X3/no9wU8mLCG03xRYn+gyWj47MCleuSKh68QseTEWmQmjBxK
	MPMcWpCAFPoPQNCuD9EFYWAegrnioQgWdxAAWsBooolzH+TQQ238cE4TQegDvstUngxdmKCJFXYhJ
	xtxSN34Vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYAPP-008JzN-H7; Sun, 18 Apr 2021 16:36:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPJ-008Jy1-9u
 for linux-mediatek@desiato.infradead.org; Sun, 18 Apr 2021 16:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=aX5Uw8HI5GapMQbfyIKolXr79HkrYd8RdJTvudKPPU4=; b=db5Cy1Eh4LPsPz2KmMJ9b/WwX6
 hdwOp2VkJDIxml8ki1wISZ90SSejq+O8qToZK74NtrAJ4P9UPiCI8NdftQfo7ASzxdgh+JEc7EF1P
 qaDXqJ6Trc3Om3I/QKT/cRly1p+aQsqWC5W88EBRitGtZ5TSpLsA8ZgPb8v3/GYsj+U8Qw8k69azF
 W0SRSWxwDws0q7W9iMYlT95dHasDhoJAvbyvzGfYxxia0nFy3TMWA2LXW6jTg5toEx6P09Kf+1y48
 raPn7mGc3g9Xsihd/Jp09aiyNh52lnXUv3Ky9F2WEnVbMch1dgqRyQbIIMisBq/4SWacHW+Xaw74C
 elBwkYWw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPE-00AVnz-IS
 for linux-mediatek@lists.infradead.org; Sun, 18 Apr 2021 16:36:24 +0000
X-UUID: 631482a6e00147d0909202975f47e2b1-20210418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aX5Uw8HI5GapMQbfyIKolXr79HkrYd8RdJTvudKPPU4=; 
 b=TPuieYZ1MpkTt//CsOl8ZgVaN2BI3xm0mms4gK0A6t/7U7OGXG4swE8YJx+R983JDCE0gP/hpcXqoyrN6Qs+mZd2FKNF4SKYxpN7U488+4zrZQ/1O7yy3nCJMLnL1wL2PdAgATUkKEPpZHdNNrM8/ROzQeQlDT99z+WE887qYhk=;
X-UUID: 631482a6e00147d0909202975f47e2b1-20210418
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1912775682; Sun, 18 Apr 2021 09:36:11 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Apr 2021 09:36:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 00:36:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 00:36:09 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 5/6] mt76: connac: introduce mt76_connac_mcu_set_deep_sleep
 utility
Date: Mon, 19 Apr 2021 00:36:06 +0800
Message-ID: <1618763767-1292-6-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
References: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_093620_636273_82F3F092 
X-CRM114-Status: GOOD (  11.40  )
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

Introduce mt76_connac_mcu_set_deep_sleep to enable deep sleep mode
and will be activated immediately when the host returns the ownership
to the device.

Co-developed-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 22 ++++++++++++-------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 10 +++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 860406a53cb6..7578855099e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1528,14 +1528,7 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_sched_scan_enable);
 
 int mt76_connac_mcu_chip_config(struct mt76_dev *dev)
 {
-	struct {
-		__le16 id;
-		u8 type;
-		u8 resp_type;
-		__le16 data_size;
-		__le16 resv;
-		u8 data[320];
-	} req = {
+	struct mt76_connac_config req = {
 		.resp_type = 0,
 	};
 
@@ -1546,6 +1539,19 @@ int mt76_connac_mcu_chip_config(struct mt76_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_chip_config);
 
+int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable)
+{
+	struct mt76_connac_config req = {
+		.resp_type = 0,
+	};
+
+	snprintf(req.data, sizeof(req.data), "KeepFullPwr %d", !enable);
+
+	return mt76_mcu_send_msg(dev, MCU_CMD_CHIP_CONFIG, &req, sizeof(req),
+				 false);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_deep_sleep);
+
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ff9fca52f344..e943b89fda75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -918,6 +918,15 @@ struct mt76_connac_tx_power_limit_tlv {
 	u8 pad2[32];
 } __packed;
 
+struct mt76_connac_config {
+	__le16 id;
+	u8 type;
+	u8 resp_type;
+	__le16 data_size;
+	__le16 resv;
+	u8 data[320];
+} __packed;
+
 #define to_wcid_lo(id)		FIELD_GET(GENMASK(7, 0), (u16)id)
 #define to_wcid_hi(id)		FIELD_GET(GENMASK(9, 8), (u16)id)
 
@@ -1017,6 +1026,7 @@ int mt76_connac_mcu_set_hif_suspend(struct mt76_dev *dev, bool suspend);
 void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif);
 int mt76_connac_mcu_chip_config(struct mt76_dev *dev);
+int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable);
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump);
 int mt76_connac_mcu_set_rate_txpower(struct mt76_phy *phy);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
