Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632ABC4332D
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:01:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2917020784
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2917020784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6+YgoB+5laQTF29vSuScaj6jt2WE4/nhBCJWyssh8gU=; b=Z8cstjCMP2FhxeqwSMUaE6sPX
	7SQD1Sf1QRojg2WSG6KSFlAAGk38n1WSIWcgW6bH4TPbpFkV6VN2EVvK27m/Q74Nb1oSuYcKdAIUN
	eV13z1bq/sFRg4R48iOo/HTaTybkN9ZFXwCDYZA8dkzu3h8QWMNdi2sFAo2Odt8JUn9Y1G0/pBAIk
	4/5O9Hrox1wJZ5e11T2n623pMGtO+NKrI1nqNv1QbtebSUyhZvOLnpRoKp8wE4Si3uVj8QxTWqlPF
	24IBTYzJMeIRh9HOgHvHoo1XSp41dHx8xBsN1QybDPIAMBDQTDzbwuLRKwAP+u+9nRXGesB+kzYoD
	svh/ZjjJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwU9x-0000fz-25; Mon, 04 Jan 2021 18:00:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwU9r-0000bT-UW
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:00:45 +0000
X-UUID: e09a534a86194b418003aa5a337f0393-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KXbdF2j3tG6T4buh40ZX+6Ccgaz9VHb0ZHItmyuA4iE=; 
 b=hAZnlh2ZNo4UJDD6lOVZ5zHtR2O6XUBJ2h8KSXkV6TwDczMOXJlkdQPp+boXIvGVNMp4SD4whRm9yjJ6WtGjrpUzTcXnzNEU1toYF57yfZDjQHI8imLHp43onKN4cPTb9h2EA+IQd4mLLJISS5cWWNsstACXmvnt2Z4sNNDWfA0=;
X-UUID: e09a534a86194b418003aa5a337f0393-20210104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2076955928; Mon, 04 Jan 2021 10:00:37 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 10:00:35 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 02:00:21 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 02:00:21 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v5 06/15] mt76: mt7921: add EEPROM support
Date: Tue, 5 Jan 2021 02:00:10 +0800
Message-ID: <aaf16a3b4761965753536020a76cb563e1e49d9e.1609781247.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1609781247.git.objelf@gmail.com>
References: <cover.1609781247.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_130044_326192_AF3DAC33 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add EEPROM support to MT7921 to determine the capability the card has
such as indentificaiton, MAC address, the band and antenna number the
card able to support.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7921/eeprom.c    | 101 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/eeprom.h    |  27 +++++
 2 files changed, 128 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
new file mode 100644
index 000000000000..05e32764e17a
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc. */
+
+#include "mt7921.h"
+#include "eeprom.h"
+
+static u32 mt7921_eeprom_read(struct mt7921_dev *dev, u32 offset)
+{
+	u8 *data = dev->mt76.eeprom.data;
+
+	if (data[offset] == 0xff)
+		mt7921_mcu_get_eeprom(dev, offset);
+
+	return data[offset];
+}
+
+static int mt7921_eeprom_load(struct mt7921_dev *dev)
+{
+	int ret;
+
+	ret = mt76_eeprom_init(&dev->mt76, MT7921_EEPROM_SIZE);
+	if (ret < 0)
+		return ret;
+
+	memset(dev->mt76.eeprom.data, -1, MT7921_EEPROM_SIZE);
+
+	return 0;
+}
+
+static int mt7921_check_eeprom(struct mt7921_dev *dev)
+{
+	u8 *eeprom = dev->mt76.eeprom.data;
+	u16 val;
+
+	mt7921_eeprom_read(dev, MT_EE_CHIP_ID);
+	val = get_unaligned_le16(eeprom);
+
+	switch (val) {
+	case 0x7961:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+void mt7921_eeprom_parse_band_config(struct mt7921_phy *phy)
+{
+	struct mt7921_dev *dev = phy->dev;
+	u32 val;
+
+	val = mt7921_eeprom_read(dev, MT_EE_WIFI_CONF);
+	val = FIELD_GET(MT_EE_WIFI_CONF_BAND_SEL, val);
+
+	switch (val) {
+	case MT_EE_5GHZ:
+		phy->mt76->cap.has_5ghz = true;
+		break;
+	case MT_EE_2GHZ:
+		phy->mt76->cap.has_2ghz = true;
+		break;
+	default:
+		phy->mt76->cap.has_2ghz = true;
+		phy->mt76->cap.has_5ghz = true;
+		break;
+	}
+}
+
+static void mt7921_eeprom_parse_hw_cap(struct mt7921_dev *dev)
+{
+	u8 tx_mask, *eeprom = dev->mt76.eeprom.data;
+
+	mt7921_eeprom_parse_band_config(&dev->phy);
+
+	/* read tx mask from eeprom (0: 1Tx, 1: 2Tx) */
+	tx_mask = FIELD_GET(MT_EE_WIFI_CONF_TX_MASK, eeprom[MT_EE_WIFI_CONF]);
+	tx_mask = tx_mask + 1;
+	dev->chainmask = BIT(tx_mask) - 1;
+	dev->mphy.antenna_mask = dev->chainmask;
+	dev->mphy.chainmask = dev->mphy.antenna_mask;
+}
+
+int mt7921_eeprom_init(struct mt7921_dev *dev)
+{
+	int ret;
+
+	ret = mt7921_eeprom_load(dev);
+	if (ret < 0)
+		return ret;
+
+	ret = mt7921_check_eeprom(dev);
+	if (ret)
+		return ret;
+
+	mt7921_eeprom_parse_hw_cap(dev);
+	memcpy(dev->mphy.macaddr, dev->mt76.eeprom.data + MT_EE_MAC_ADDR,
+	       ETH_ALEN);
+
+	mt76_eeprom_override(&dev->mphy);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.h
new file mode 100644
index 000000000000..54f30401343c
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: ISC */
+/* Copyright (C) 2020 MediaTek Inc. */
+
+#ifndef __MT7921_EEPROM_H
+#define __MT7921_EEPROM_H
+
+#include "mt7921.h"
+
+enum mt7921_eeprom_field {
+	MT_EE_CHIP_ID =		0x000,
+	MT_EE_VERSION =		0x002,
+	MT_EE_MAC_ADDR =	0x004,
+	MT_EE_WIFI_CONF =	0x07c,
+	__MT_EE_MAX =		0x3bf
+};
+
+#define MT_EE_WIFI_CONF_TX_MASK			BIT(0)
+#define MT_EE_WIFI_CONF_BAND_SEL		GENMASK(3, 2)
+
+enum mt7921_eeprom_band {
+	MT_EE_NA,
+	MT_EE_5GHZ,
+	MT_EE_2GHZ,
+	MT_EE_DUAL_BAND,
+};
+
+#endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
