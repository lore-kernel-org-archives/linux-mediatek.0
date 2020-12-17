Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85CEC2BB9A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 18:13:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECBE2388E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 18:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AECBE2388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUGHJWHll4hB2Nkj7O9OoGH5GMibYDwCb9s/ENUp3Ao=; b=ziGP9cNvKx5UM2ld00P9F91pl
	F3CKVY20Y2IxloyTH9q4CXWdt6t5kNlP4PA2DxCArOfYeBm7kFswZE/LzNbFvcq3KEsN1e3mtvq6I
	gLwAM6NfdDYa93Er5JNOZYNzMWXcEPsYmgsuAzCQVggc4/zP8cMrItcy/O/4pZzK4jPsn8L+TBQYV
	hCqeaF35iXgN4hb/Lb6ieF05EeC7O9Z0dgnAmBAmnt2rEM75PPFPnNFYuYWTHC2I5sDu1kP+/go20
	xhOuLayDXPYLT4FSasK7UHBGOXT/OAj0XJIR9U/bzN/d3/M0ura0HM33uhy1A3zBnLYO4fpoI/LEo
	s1/9PgdEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpxmZ-00051K-Bn; Thu, 17 Dec 2020 18:13:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpxmR-0004yC-QF
 for linux-mediatek@lists.infradead.org; Thu, 17 Dec 2020 18:13:39 +0000
X-UUID: 57096490c580417ca0e680f51b4dedce-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IaQCdPb3Ad0mCFJydULPmgLY/45TJxgpAvEh5o/wzVI=; 
 b=Cp5IyPfilmK9DRMQj2H/II69zfn/Jnz00gB+vaNCaj0LWODGliiYFse+SYf8Y3aFm+LSysP7Q8wqhe9E1UqAqtYfIBJ6J8a1xlmn5ApuWgYIBQRXwlu3uvyCcsobhTegJOimNjxib24dnTjCUwVSrA5LDPSvGjyFCB5bRyweY2U=;
X-UUID: 57096490c580417ca0e680f51b4dedce-20201217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 33934353; Thu, 17 Dec 2020 10:13:29 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 10:13:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Dec 2020 02:13:26 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Dec 2020 02:13:23 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v3 5/8] mt76: mt7921: add EEPROM support
Date: Fri, 18 Dec 2020 02:13:18 +0800
Message-ID: <fb3afa6f28368fddcaca480c8f7206911e2bd875.1608227863.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1608227863.git.objelf@gmail.com>
References: <cover.1608227863.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_131336_056298_3A9C4B39 
X-CRM114-Status: GOOD (  18.52  )
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
 linux-wireless@vger.kernel.org, YN.Chen@mediatek.com,
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
 .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +-
 .../wireless/mediatek/mt76/mt7921/eeprom.c    | 101 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/eeprom.h    |  27 +++++
 3 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
index 13721f4cdd43..622749311fc6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -2,4 +2,4 @@
 
 obj-$(CONFIG_MT7921E) += mt7921e.o
 
-mt7921e-y := pci.o mcu.o mac.o dma.o
+mt7921e-y := pci.o mcu.o mac.o dma.o eeprom.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
new file mode 100644
index 000000000000..dddbd3b43aa9
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
+	dev->phy.chainmask = dev->mphy.antenna_mask;
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
