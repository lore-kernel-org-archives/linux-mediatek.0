Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB381C43460
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:47:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44DD1613F1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44DD1613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UQsaE/SvY4uUW7EHsduGAy8WTsrGPrzrCButzXSuji4=; b=geeLv9suEYynsCliioqZRsim8
	1mm6XJSeRVPV1V92JfeBjOMTGBvQsKgtuVnqMw86Jk9ytSSUJ9Xxq9MeAG4NsmtbbMiUutvxLff5y
	SYrl9idbQPLuUSQgEtChZBIsPCVNs97RGjeyYhn0o2imgB074aQCdl4kvEyXQzmWOVpXZ6ba2qgHH
	e3PEunYvFoIFCmItfWP6kYdSKoNm7zNMYYTUlYiIb4etIVbJyyhRHSdUUCBu6q1UTisPHRiILgat5
	VqH1ZhGmaBfQ3FNRcIPkyYHQnORFOCFrRCmANaYoN5tyMPFjYvYX4o2PPzFpHGEQJ4FOmpnKEhIv0
	rZBuPkISg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKgD-001kJy-L2; Wed, 05 May 2021 16:47:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUu-001fg6-Hb; Wed, 05 May 2021 16:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NS6cC2gHRt/8gJwdexbuYPwKxku2T/ZWQVuJRl2oE2w=; b=A3uV+seqma5W3YfJNw70JWhVOY
 vcG1o+n8Tk3g/AstaT5rYOTZWI/roaX2Vm5B/BCAyg5Rti+hDXX/P7wLbCYYzW4+1VmxRmAmFYQg3
 4ALAZTL6AzCL4oyGD04uSxgO+oll2EHZvZASeJw5u6sY5UJqjp+x1umpCRRGqVj6GMHmfewDUaJKr
 S7O9A7tC8x4sX9mwg6ARtShY4+p/2nE3cMXmrmyr70nD6aT4Y43gLxDSfWokmBDtQZhY4w0+PcqIg
 DX6Y93xP09d7NNvRiR4W5Mnp6h3QU4b27vFU2kaFHYFStOeLgnC4S9zh3nUEYw04JLTpyZT+vjD5m
 nvuY04/g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUr-004x7j-IS; Wed, 05 May 2021 16:35:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0522A61921;
 Wed,  5 May 2021 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232537;
 bh=K+gH0wjcF7IJvbsod80xCdpe9hFkbSVCzrRz+0zDuJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ovKHohIltpRiWU6EKlYciXIkX/+FZgtQ1GuAmMZWp4BjsuqjAdtnZQ//VIsYmqwR4
 z/fSdS7c8xEXty59ZE6vPVcH9AWf/IFIX66fWKV0oCly6bAj1Tl9G1NXemWql8KlSh
 3xkz6DmNhZugoBjXqM99K+yQQm3uiwCsJMV6+grlBYxdNoPjt5a8bhKisxGMwQwY+U
 3hsHmZIYGzDQppJGTC74gOrrQ5tBknkbkt9UPX+jHioUjmnaCMaDcU5jI4KhbT3AaG
 xGPxcvExjGUXTTovOqnPjf8F0nK/FO8+bHFPZO9/hklCklagf9A7fFM18euolmyS2h
 7Jrh84WsVMVig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 057/104] mt76: mt7915: add wifi subsystem reset
Date: Wed,  5 May 2021 12:33:26 -0400
Message-Id: <20210505163413.3461611-57-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093537_704269_200B279C 
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
index 2ec18aaa8280..aaa8006e0950 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -4,6 +4,7 @@
 #include <linux/etherdevice.h>
 #include "mt7915.h"
 #include "mac.h"
+#include "mcu.h"
 #include "eeprom.h"
 
 #define CCK_RATE(_idx, _rate) {						\
@@ -282,9 +283,50 @@ static void mt7915_init_work(struct work_struct *work)
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
 
@@ -294,6 +336,12 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 
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
@@ -307,8 +355,14 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
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
index 1cbae0eacfe9..a0aa76ac16b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2780,21 +2780,8 @@ static int mt7915_load_ram(struct mt7915_dev *dev)
 
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
index 848703e6eb7c..8a0ceb30392c 100644
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
@@ -375,6 +380,14 @@
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
