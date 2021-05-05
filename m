Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09853C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:37:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60BAF6144A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60BAF6144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mk3uz3B0tq58M3+TTSNDRPKelLEGJTy7NIf4X65HzQs=; b=eyFNrBCoiao4UBq85JVzQgR9Q
	8XL5aGEzUNyidC7p7WiCUH6CCzSayEfr6evtGLLBY/LTDyAB5KRhsv9lPNcGGRocO0GEa8n/o1wxE
	3wGVPMKvg6j/KDGDAe64Sd6/94PfwnUQtzwcKHE5RCaRTgZx7a+FnpBcUc/ds5bt8IDx1zM3uAn9U
	OCHZTvS5y35us5zZJXFIYSlLJkMcxOXnxC1VId6uzhA6T7uDQmWYn+78hgLVfuMh+hTLPAWnMtXP3
	5SEzwK8GhRd6DFk9G/w+Idgs14XKumm9P6bTFDkLOgJmf/J+lQAsSrT2sWA33Wlha7OcwtbOEDRX3
	IxvbO86FA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKWe-001gV9-SO; Wed, 05 May 2021 16:37:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSI-001eZh-Ha; Wed, 05 May 2021 16:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DjUxsWB9/SoRJFu6R7kn4AqkdXrpJt9ZpWLCCK+ADBk=; b=s9DIWUh8NnoWqw8dDIspdaPIlE
 XCrMlhdByb/Orj4sSRBluoy/Q8Kze2U2pYzKyez7xSkNDg/ax/DgGMHk+/9M11/DceWexlo/NyPNO
 avc4xG3pnBa2HM/AfE9Aaqg/HyVN5w3BHMlJwoGCRN27lZFxyKW4R5PiHm+/axWQKQG2klw9fiDXE
 pUCKe7XS4dfRDH0LPVJC014wx/48isK3roYKPZ/B87yAheKJ/0p40AZIDpJVXOVBTtdFk9qN90xQZ
 AL/GAO7trNV5yi7KmKbjihOWYhchg01DjZvPXK7cVkhj2pxJwFYhsmrKqG58z4thlnBsflL1J3/a5
 UiGcvutg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSF-004wRb-NS; Wed, 05 May 2021 16:32:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2658261422;
 Wed,  5 May 2021 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232375;
 bh=q8uouMgsjHeRPHa+R+tAbyGFheMQJ6VUjD+jk0OFQII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VGYBh6rWlIO7jmi0hQVaQPuPAODIDcCSuooZl9TOhLF/dolvmMtZ+R1ACPW2J1HC7
 N9yBxcSYMM9sEhnfvVcleSEnHZlXKGSaaoBeNvnA0CBJB2DybS83nt2f6wR9MnKdPC
 EeNVpWfKQhSXO6FhQsBiwWyATqRceIL4QYrhz9Jo5PxoS71nm2IbLLVVZZnsbjkxNQ
 c+eBgf2GRwagCSJy1p3hIO0JwIduMDqHu7GJzrPI0XY8ReYEr4VhwTeY80HQ+HbODD
 Cb6n0yeUQfeyT272mYolsfNTx664YMSQOPkqkSQZ8mv6byvrYzb9UGU7JBZ3GZk/ze
 Y6+9kudb8TaBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 064/116] mt76: mt7915: add wifi subsystem reset
Date: Wed,  5 May 2021 12:30:32 -0400
Message-Id: <20210505163125.3460440-64-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093255_840230_93584CE2 
X-CRM114-Status: GOOD (  17.25  )
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

From: Ryder Lee <ryder.lee@mediatek.com>

[ Upstream commit e07419a7dca97dd9bddfe5d099380857c19535f3 ]

Reset wifi subsystem when MCU is already running.
Fixes firmware download failure after soft reboot on systems where the PCIe
reset could not be performed properly.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Co-developed-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 58 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 15 +----
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 13 +++++
 3 files changed, 70 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index ad4e5b95158b..16ad53316c38 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -4,6 +4,7 @@
 #include <linux/etherdevice.h>
 #include "mt7915.h"
 #include "mac.h"
+#include "mcu.h"
 #include "eeprom.h"
 
 #define CCK_RATE(_idx, _rate) {						\
@@ -283,9 +284,50 @@ static void mt7915_init_work(struct work_struct *work)
 	mt7915_register_ext_phy(dev);
 }
 
+static void mt7915_wfsys_reset(struct mt7915_dev *dev)
+{
+	u32 val = MT_TOP_PWR_KEY | MT_TOP_PWR_SW_PWR_ON | MT_TOP_PWR_PWR_ON;
+	u32 reg = mt7915_reg_map_l1(dev, MT_TOP_MISC);
+
+#define MT_MCU_DUMMY_RANDOM	GENMASK(15, 0)
+#define MT_MCU_DUMMY_DEFAULT	GENMASK(31, 16)
+
+	mt76_wr(dev, MT_MCU_WFDMA0_DUMMY_CR, MT_MCU_DUMMY_RANDOM);
+
+	/* change to software control */
+	val |= MT_TOP_PWR_SW_RST;
+	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+	/* reset wfsys */
+	val &= ~MT_TOP_PWR_SW_RST;
+	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+	/* release wfsys then mcu re-excutes romcode */
+	val |= MT_TOP_PWR_SW_RST;
+	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+	/* switch to hw control */
+	val &= ~MT_TOP_PWR_SW_RST;
+	val |= MT_TOP_PWR_HW_CTRL;
+	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+	/* check whether mcu resets to default */
+	if (!mt76_poll_msec(dev, MT_MCU_WFDMA0_DUMMY_CR, MT_MCU_DUMMY_DEFAULT,
+			    MT_MCU_DUMMY_DEFAULT, 1000)) {
+		dev_err(dev->mt76.dev, "wifi subsystem reset failure\n");
+		return;
+	}
+
+	/* wfsys reset won't clear host registers */
+	mt76_clear(dev, reg, MT_TOP_MISC_FW_STATE);
+
+	msleep(100);
+}
+
 static int mt7915_init_hardware(struct mt7915_dev *dev)
 {
 	int ret, idx;
+	u32 val;
 
 	mt76_wr(dev, MT_INT_SOURCE_CSR, ~0);
 
@@ -295,6 +337,12 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 
 	dev->dbdc_support = !!(mt7915_l1_rr(dev, MT_HW_BOUND) & BIT(5));
 
+	val = mt76_rr(dev, mt7915_reg_map_l1(dev, MT_TOP_MISC));
+
+	/* If MCU was already running, it is likely in a bad state */
+	if (FIELD_GET(MT_TOP_MISC_FW_STATE, val) > FW_STATE_FW_DOWNLOAD)
+		mt7915_wfsys_reset(dev);
+
 	ret = mt7915_dma_init(dev);
 	if (ret)
 		return ret;
@@ -308,8 +356,14 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 	mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
 
 	ret = mt7915_mcu_init(dev);
-	if (ret)
-		return ret;
+	if (ret) {
+		/* Reset and try again */
+		mt7915_wfsys_reset(dev);
+
+		ret = mt7915_mcu_init(dev);
+		if (ret)
+			return ret;
+	}
 
 	ret = mt7915_eeprom_init(dev);
 	if (ret < 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 12281e4cf817..f5431e4bd8de 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2754,21 +2754,8 @@ static int mt7915_load_ram(struct mt7915_dev *dev)
 
 static int mt7915_load_firmware(struct mt7915_dev *dev)
 {
+	u32 reg = mt7915_reg_map_l1(dev, MT_TOP_MISC);
 	int ret;
-	u32 val, reg = mt7915_reg_map_l1(dev, MT_TOP_MISC);
-
-	val = FIELD_PREP(MT_TOP_MISC_FW_STATE, FW_STATE_FW_DOWNLOAD);
-
-	if (!mt76_poll_msec(dev, reg, MT_TOP_MISC_FW_STATE, val, 1000)) {
-		/* restart firmware once */
-		__mt76_mcu_restart(&dev->mt76);
-		if (!mt76_poll_msec(dev, reg, MT_TOP_MISC_FW_STATE,
-				    val, 1000)) {
-			dev_err(dev->mt76.dev,
-				"Firmware is not ready for download\n");
-			return -EIO;
-		}
-	}
 
 	ret = mt7915_load_patch(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index ed0c9a24bb53..dfb8880657bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -4,6 +4,11 @@
 #ifndef __MT7915_REGS_H
 #define __MT7915_REGS_H
 
+/* MCU WFDMA0 */
+#define MT_MCU_WFDMA0_BASE		0x2000
+#define MT_MCU_WFDMA0(ofs)		(MT_MCU_WFDMA0_BASE + (ofs))
+#define MT_MCU_WFDMA0_DUMMY_CR		MT_MCU_WFDMA0(0x120)
+
 /* MCU WFDMA1 */
 #define MT_MCU_WFDMA1_BASE		0x3000
 #define MT_MCU_WFDMA1(ofs)		(MT_MCU_WFDMA1_BASE + (ofs))
@@ -396,6 +401,14 @@
 #define MT_WFDMA1_PCIE1_BUSY_ENA_TX_FIFO1	BIT(1)
 #define MT_WFDMA1_PCIE1_BUSY_ENA_RX_FIFO	BIT(2)
 
+#define MT_TOP_RGU_BASE				0xf0000
+#define MT_TOP_PWR_CTRL				(MT_TOP_RGU_BASE + (0x0))
+#define MT_TOP_PWR_KEY				(0x5746 << 16)
+#define MT_TOP_PWR_SW_RST			BIT(0)
+#define MT_TOP_PWR_SW_PWR_ON			GENMASK(3, 2)
+#define MT_TOP_PWR_HW_CTRL			BIT(4)
+#define MT_TOP_PWR_PWR_ON			BIT(7)
+
 #define MT_INFRA_CFG_BASE		0xf1000
 #define MT_INFRA(ofs)			(MT_INFRA_CFG_BASE + (ofs))
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
