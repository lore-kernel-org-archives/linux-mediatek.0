Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA946C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 02:49:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FDFC22D57
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 02:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FDFC22D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Pul5TPnM8iqMFJrhFedANN4wPSSVXvMEr+MUOSoaHA=; b=HZoHNMnX94Yq2FyrPrNXA5omMM
	y/PSZFdbyX8hqjzKSY3AKpFrseiQyl+zvDj+mwN1lHtPurDds39qvnuUnuZZIuvGg01KInaGgyOv/
	s4jkEcr6hsl+3Bjov2ZGoq2SkrbckYHehqLmMwh0RYOCMoWS5Tlzj0m36Ri1wvTaLXO1V2pJfhd+s
	nk4BES1Ssj8net7BgD5qPJMET/h4u/hxRNah+W2cgUj+x3+5N885HsLsefEmOlmaISbhRHy1lKKAA
	a8umc6n8i2OILLQ2tv0iFRjj6cWic5dVLLW6rdb9/5NZ7EHOxGFKDlPvzWC8pfctsHE6CKCzuZ06L
	yIfNWLEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kodvj-0004hS-Ua; Mon, 14 Dec 2020 02:49:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kodvf-0004fM-IJ
 for linux-mediatek@lists.infradead.org; Mon, 14 Dec 2020 02:49:41 +0000
X-UUID: 06f874a0bd0c4cea8232b2b70c11ea33-20201213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pfy3jv4ChrLB8NR51QFbS6J609Vx9U7uaYSbQM3RppU=; 
 b=Ew/11Tzf/AEFHKCWKx702cVpJSmUL+MrSd2znVrCRn8dqCm4R5KFZ1Qnhh0gnUsw2OPmO/TNlBEqJZmwc0QSaeVPy8FMuWz7PTcCbPI0qRznIRtWfD/sv1uBUUEmrUHHSe8wlbfOZZDHUNiRHyfLzEoQEVeUerlTkgdrqJ9XS30=;
X-UUID: 06f874a0bd0c4cea8232b2b70c11ea33-20201213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1831873101; Sun, 13 Dec 2020 18:49:34 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Dec 2020 18:39:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Dec 2020 10:39:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Dec 2020 10:39:23 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: mt7915: add support for flash mode
Date: Mon, 14 Dec 2020 10:38:55 +0800
Message-ID: <20201214023855.28525-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_214940_391933_6535005F 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for getting rf values from flash.
This is used for some test purposes and products.
If the mtd partition is configured in dts, driver will read from flash
to init eeprom command; if not, still init it with efuse's values.

An example:
&slot0 {
	mt7915@0,0 {
		reg = <0x0000 0 0 0 0>;
		device_type = "pci";
		mediatek,mtd-eeprom = <&factory 0x0000>;
	};
};

Acked-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  5 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 56 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  6 ++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 4 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 7a2be3f61398..0a3ac07bab4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -22,7 +22,10 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	memset(dev->mt76.eeprom.data, -1, MT7915_EEPROM_SIZE);
+	if (ret)
+		dev->flash_mode = true;
+	else
+		memset(dev->mt76.eeprom.data, -1, MT7915_EEPROM_SIZE);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5fdd1a6d32ee..d8b6f9b06670 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3229,16 +3229,56 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), true);
 }
 
+static int mt7915_mcu_set_eeprom_flash(struct mt7915_dev *dev)
+{
+#define TOTAL_PAGE_MASK		GENMASK(7, 5)
+#define PAGE_IDX_MASK		GENMASK(4, 2)
+#define PER_PAGE_SIZE		0x400
+	struct mt7915_mcu_eeprom req = { .buffer_mode = EE_MODE_BUFFER };
+	u8 total = MT7915_EEPROM_SIZE / PER_PAGE_SIZE;
+	u8 *eep = (u8 *)dev->mt76.eeprom.data;
+	int eep_len;
+	int i;
+
+	for (i = 0; i <= total; i++, eep += eep_len) {
+		struct sk_buff *skb;
+		int ret;
+
+		if (i == total)
+			eep_len = MT7915_EEPROM_SIZE % PER_PAGE_SIZE;
+		else
+			eep_len = PER_PAGE_SIZE;
+
+		skb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
+					 sizeof(req) + eep_len);
+		if (!skb)
+			return -ENOMEM;
+
+		req.format = FIELD_PREP(TOTAL_PAGE_MASK, total) |
+			     FIELD_PREP(PAGE_IDX_MASK, i) | EE_FORMAT_WHOLE;
+		req.len = cpu_to_le16(eep_len);
+
+		skb_put_data(skb, &req, sizeof(req));
+		skb_put_data(skb, eep, eep_len);
+
+		ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
+					    MCU_EXT_CMD_EFUSE_BUFFER_MODE, true);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int mt7915_mcu_set_eeprom(struct mt7915_dev *dev)
 {
-	struct req_hdr {
-		u8 buffer_mode;
-		u8 format;
-		__le16 len;
-	} __packed req = {
-		.buffer_mode = EE_MODE_EFUSE,
-		.format = EE_FORMAT_WHOLE,
-	};
+	struct mt7915_mcu_eeprom req;
+
+	if (dev->flash_mode)
+		return mt7915_mcu_set_eeprom_flash(dev);
+
+	req.buffer_mode = EE_MODE_EFUSE;
+	req.format = EE_FORMAT_WHOLE;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EFUSE_BUFFER_MODE,
 				 &req, sizeof(req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index cd1a4256c843..30ec2ef4cc74 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -118,6 +118,12 @@ struct mt7915_mcu_rdd_report {
 	} hw_pulse[32];
 } __packed;
 
+struct mt7915_mcu_eeprom {
+	u8 buffer_mode;
+	u8 format;
+	__le16 len;
+} __packed;
+
 struct mt7915_mcu_eeprom_info {
 	__le32 addr;
 	__le32 valid;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 0339abf360d3..c0041240b6c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -168,6 +168,7 @@ struct mt7915_dev {
 	s8 **rate_power; /* TODO: use mt76_rate_power */
 
 	bool dbdc_support;
+	bool flash_mode;
 	bool fw_debug;
 
 #ifdef CONFIG_NL80211_TESTMODE
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
