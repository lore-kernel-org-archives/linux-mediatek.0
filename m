Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8828FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 02:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNcYE/IzzmDb7Z5wHy8l3S2bsEMyPkhPMUldiMUh2IA=; b=QAD/oOZYA5xKV4
	8fu4sVQxFZl8j32mqU+9YqINHzg3zaNtlYeGBmqb/9pyWDUe8vBVYX17olAUk0hh8u91rahS3hIwf
	F8oHw8qcL69Sa3dBkiwBtKbHL2nwSPTCSMiJTTWaREt7B0SOom7RsBYlwrzONPYoBHLB2ATWIwu7h
	XGNUFUxqjaGvbKxvOhNDm4c+TJXp3brclOna1acn5ZfA/zrJLQoGT61BBwFoQ0fG7WjwAYMSVJ/49
	69P6GYVIHrWr8BE+LKAutEgz8cFdXO0KcBOu8I66ro5wV9pfvuxBd7nIXESLn51ooZhCLtmZccSMA
	nAWBmHCi7/e3WgWEhcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mz8LC-000CKU-67; Mon, 20 Dec 2021 02:23:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mz8L7-000CFv-Hr
 for linux-mediatek@lists.infradead.org; Mon, 20 Dec 2021 02:23:51 +0000
X-UUID: 50dea65ea12944efa7257d839fb14e58-20211219
X-UUID: 50dea65ea12944efa7257d839fb14e58-20211219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 190689865; Sun, 19 Dec 2021 19:23:42 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Dec 2021 18:18:18 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 20 Dec 2021 10:18:12 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 20 Dec 2021 10:18:12 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v4 05/12] mt76: mt7915: add firmware support for mt7916
Date: Mon, 20 Dec 2021 10:17:57 +0800
Message-ID: <6b2d86cbbe6426a5ed0d91b8248b95ac3390885f.1639965732.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1639965732.git.Bo.Jiao@mediatek.com>
References: <cover.1639965732.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_182349_645665_46269DD3 
X-CRM114-Status: GOOD (  21.33  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

Update firmware initialization for mt7916.
This is an intermediate patch to add mt7916 support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
v3:
- modify the function mt7915_wfsys_reset to support mt7916
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 75 ++++++++---------
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 81 +++++++++++++++----
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  3 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  6 +-
 5 files changed, 115 insertions(+), 54 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 2da342d..edf0d7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -511,41 +511,53 @@ static void mt7915_init_work(struct work_struct *work)
 
 static void mt7915_wfsys_reset(struct mt7915_dev *dev)
 {
-	u32 val = MT_TOP_PWR_KEY | MT_TOP_PWR_SW_PWR_ON | MT_TOP_PWR_PWR_ON;
+	u32 val;
 
 #define MT_MCU_DUMMY_RANDOM	GENMASK(15, 0)
 #define MT_MCU_DUMMY_DEFAULT	GENMASK(31, 16)
+	if (is_mt7915(&dev->mt76)) {
+		mt76_wr(dev, MT_MCU_WFDMA0_DUMMY_CR, MT_MCU_DUMMY_RANDOM);
+
+		/* change to software control */
+		val |= MT_TOP_PWR_SW_RST;
+		mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+		/* reset wfsys */
+		val &= ~MT_TOP_PWR_SW_RST;
+		mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+		/* release wfsys then mcu re-excutes romcode */
+		val |= MT_TOP_PWR_SW_RST;
+		mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+		/* switch to hw control */
+		val &= ~MT_TOP_PWR_SW_RST;
+		val |= MT_TOP_PWR_HW_CTRL;
+		mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+
+		/* check whether mcu resets to default */
+		if (!mt76_poll_msec(dev, MT_MCU_WFDMA0_DUMMY_CR,
+				    MT_MCU_DUMMY_DEFAULT, MT_MCU_DUMMY_DEFAULT,
+				    1000)) {
+			dev_err(dev->mt76.dev, "wifi subsystem reset failure\n");
+			return;
+		}
 
-	mt76_wr(dev, MT_MCU_WFDMA0_DUMMY_CR, MT_MCU_DUMMY_RANDOM);
-
-	/* change to software control */
-	val |= MT_TOP_PWR_SW_RST;
-	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
-
-	/* reset wfsys */
-	val &= ~MT_TOP_PWR_SW_RST;
-	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+		/* wfsys reset won't clear host registers */
+		mt76_clear(dev, MT_TOP_MISC, MT_TOP_MISC_FW_STATE);
 
-	/* release wfsys then mcu re-excutes romcode */
-	val |= MT_TOP_PWR_SW_RST;
-	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+		msleep(100);
+	} else {
+		val = mt76_rr(dev, MT_WF_SUBSYS_RST);
 
-	/* switch to hw control */
-	val &= ~MT_TOP_PWR_SW_RST;
-	val |= MT_TOP_PWR_HW_CTRL;
-	mt76_wr(dev, MT_TOP_PWR_CTRL, val);
+		val |= 0x1;
+		mt76_wr(dev, MT_WF_SUBSYS_RST, val);
+		msleep(20);
 
-	/* check whether mcu resets to default */
-	if (!mt76_poll_msec(dev, MT_MCU_WFDMA0_DUMMY_CR, MT_MCU_DUMMY_DEFAULT,
-			    MT_MCU_DUMMY_DEFAULT, 1000)) {
-		dev_err(dev->mt76.dev, "wifi subsystem reset failure\n");
-		return;
+		val &= ~0x1;
+		mt76_wr(dev, MT_WF_SUBSYS_RST, val);
+		msleep(20);
 	}
-
-	/* wfsys reset won't clear host registers */
-	mt76_clear(dev, MT_TOP_MISC, MT_TOP_MISC_FW_STATE);
-
-	msleep(100);
 }
 
 static int mt7915_init_hardware(struct mt7915_dev *dev)
@@ -568,15 +580,6 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 
 	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
 
-	/*
-	 * force firmware operation mode into normal state,
-	 * which should be set before firmware download stage.
-	 */
-	if (is_mt7915(&dev->mt76))
-		mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
-	else
-		mt76_wr(dev, MT_SWDEF_MODE_MT7916, MT_SWDEF_NORMAL_MODE);
-
 	ret = mt7915_mcu_init(dev);
 	if (ret) {
 		/* Reset and try again */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index d068266..6ea213b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2693,16 +2693,20 @@ static int mt7915_mcu_start_patch(struct mt7915_dev *dev)
 				 sizeof(req), true);
 }
 
-static int mt7915_driver_own(struct mt7915_dev *dev)
+static int mt7915_driver_own(struct mt7915_dev *dev, u8 band)
 {
-	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND0, MT_TOP_LPCR_HOST_DRV_OWN);
-	if (!mt76_poll_msec(dev, MT_TOP_LPCR_HOST_BAND0,
+	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND(band), MT_TOP_LPCR_HOST_DRV_OWN);
+	if (!mt76_poll_msec(dev, MT_TOP_LPCR_HOST_BAND(band),
 			    MT_TOP_LPCR_HOST_FW_OWN_STAT,
 			    0, 500)) {
 		dev_err(dev->mt76.dev, "Timeout for driver own\n");
 		return -EIO;
 	}
 
+	/* clear irq when the driver own success */
+	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND_IRQ_STAT(band),
+		MT_TOP_LPCR_HOST_BAND_STAT);
+
 	return 0;
 }
 
@@ -2732,6 +2736,7 @@ static int mt7915_load_patch(struct mt7915_dev *dev)
 {
 	const struct mt7915_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
+	const char *patch;
 	int i, ret, sem;
 
 	sem = mt7915_mcu_patch_sem_ctrl(dev, 1);
@@ -2745,7 +2750,8 @@ static int mt7915_load_patch(struct mt7915_dev *dev)
 		return -EAGAIN;
 	}
 
-	ret = request_firmware(&fw, MT7915_ROM_PATCH, dev->mt76.dev);
+	patch = is_mt7915(&dev->mt76) ? MT7915_ROM_PATCH : MT7916_ROM_PATCH;
+	ret = request_firmware(&fw, patch, dev->mt76.dev);
 	if (ret)
 		goto out;
 
@@ -2876,9 +2882,11 @@ static int mt7915_load_ram(struct mt7915_dev *dev)
 {
 	const struct mt7915_fw_trailer *hdr;
 	const struct firmware *fw;
+	const char *mcu;
 	int ret;
 
-	ret = request_firmware(&fw, MT7915_FIRMWARE_WM, dev->mt76.dev);
+	mcu = is_mt7915(&dev->mt76) ? MT7915_FIRMWARE_WM : MT7916_FIRMWARE_WM;
+	ret = request_firmware(&fw, mcu, dev->mt76.dev);
 	if (ret)
 		return ret;
 
@@ -2902,7 +2910,8 @@ static int mt7915_load_ram(struct mt7915_dev *dev)
 
 	release_firmware(fw);
 
-	ret = request_firmware(&fw, MT7915_FIRMWARE_WA, dev->mt76.dev);
+	mcu = is_mt7915(&dev->mt76) ? MT7915_FIRMWARE_WA : MT7916_FIRMWARE_WA;
+	ret = request_firmware(&fw, mcu, dev->mt76.dev);
 	if (ret)
 		return ret;
 
@@ -2934,10 +2943,36 @@ out:
 	return ret;
 }
 
+static int
+mt7915_firmware_state(struct mt7915_dev *dev, bool wa)
+{
+	u32 state = FIELD_PREP(MT_TOP_MISC_FW_STATE,
+			       wa ? FW_STATE_RDY : FW_STATE_FW_DOWNLOAD);
+
+	if (!mt76_poll_msec(dev, MT_TOP_MISC, MT_TOP_MISC_FW_STATE,
+			    state, 1000)) {
+		dev_err(dev->mt76.dev, "Timeout for initializing firmware\n");
+		return -EIO;
+	}
+	return 0;
+}
+
 static int mt7915_load_firmware(struct mt7915_dev *dev)
 {
 	int ret;
 
+	/* make sure fw is download state */
+	if (mt7915_firmware_state(dev, false)) {
+		/* restart firmware once */
+		__mt76_mcu_restart(&dev->mt76);
+		ret = mt7915_firmware_state(dev, false);
+		if (ret) {
+			dev_err(dev->mt76.dev,
+				"Firmware is not ready for download\n");
+			return ret;
+		}
+	}
+
 	ret = mt7915_load_patch(dev);
 	if (ret)
 		return ret;
@@ -2946,12 +2981,9 @@ static int mt7915_load_firmware(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
-	if (!mt76_poll_msec(dev, MT_TOP_MISC, MT_TOP_MISC_FW_STATE,
-			    FIELD_PREP(MT_TOP_MISC_FW_STATE,
-				       FW_STATE_RDY), 1000)) {
-		dev_err(dev->mt76.dev, "Timeout for initializing firmware\n");
-		return -EIO;
-	}
+	ret = mt7915_firmware_state(dev, true);
+	if (ret)
+		return ret;
 
 	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
 
@@ -3117,9 +3149,23 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 
 	dev->mt76.mcu_ops = &mt7915_mcu_ops;
 
-	ret = mt7915_driver_own(dev);
+	/* force firmware operation mode into normal state,
+	 * which should be set before firmware download stage.
+	 */
+	if (is_mt7915(&dev->mt76))
+		mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
+	else
+		mt76_wr(dev, MT_SWDEF_MODE_MT7916, MT_SWDEF_NORMAL_MODE);
+
+	ret = mt7915_driver_own(dev, 0);
 	if (ret)
 		return ret;
+	/* set driver own for band1 when two hif exist */
+	if (dev->hif2) {
+		ret = mt7915_driver_own(dev, 1);
+		if (ret)
+			return ret;
+	}
 
 	ret = mt7915_load_firmware(dev);
 	if (ret)
@@ -3154,14 +3200,15 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 void mt7915_mcu_exit(struct mt7915_dev *dev)
 {
 	__mt76_mcu_restart(&dev->mt76);
-	if (!mt76_poll_msec(dev, MT_TOP_MISC, MT_TOP_MISC_FW_STATE,
-			    FIELD_PREP(MT_TOP_MISC_FW_STATE,
-				       FW_STATE_FW_DOWNLOAD), 1000)) {
+	if (mt7915_firmware_state(dev, false)) {
 		dev_err(dev->mt76.dev, "Failed to exit mcu\n");
 		return;
 	}
 
-	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND0, MT_TOP_LPCR_HOST_FW_OWN);
+	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND(0), MT_TOP_LPCR_HOST_FW_OWN);
+	if (dev->hif2)
+		mt76_wr(dev, MT_TOP_LPCR_HOST_BAND(1),
+			MT_TOP_LPCR_HOST_FW_OWN);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 673c2d7..d4449e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -30,6 +30,10 @@
 #define MT7915_FIRMWARE_WM		"mediatek/mt7915_wm.bin"
 #define MT7915_ROM_PATCH		"mediatek/mt7915_rom_patch.bin"
 
+#define MT7916_FIRMWARE_WA		"mediatek/mt7916_wa.bin"
+#define MT7916_FIRMWARE_WM		"mediatek/mt7916_wm.bin"
+#define MT7916_ROM_PATCH		"mediatek/mt7916_rom_patch.bin"
+
 #define MT7915_EEPROM_DEFAULT		"mediatek/mt7915_eeprom.bin"
 #define MT7915_EEPROM_DEFAULT_DBDC	"mediatek/mt7915_eeprom_dbdc.bin"
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index e4854a4..5d6adcd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -167,3 +167,6 @@ MODULE_DEVICE_TABLE(pci, mt7915_hif_device_table);
 MODULE_FIRMWARE(MT7915_FIRMWARE_WA);
 MODULE_FIRMWARE(MT7915_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7915_ROM_PATCH);
+MODULE_FIRMWARE(MT7916_FIRMWARE_WA);
+MODULE_FIRMWARE(MT7916_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7916_ROM_PATCH);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index a8e864a..1168a62 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -729,17 +729,21 @@ enum offs_rev {
 #define MT_TOP_BASE			0x18060000
 #define MT_TOP(ofs)			(MT_TOP_BASE + (ofs))
 
-#define MT_TOP_LPCR_HOST_BAND0		MT_TOP(0x10)
+#define MT_TOP_LPCR_HOST_BAND(_band)	MT_TOP(0x10 + ((_band) * 0x10))
 #define MT_TOP_LPCR_HOST_FW_OWN		BIT(0)
 #define MT_TOP_LPCR_HOST_DRV_OWN	BIT(1)
 #define MT_TOP_LPCR_HOST_FW_OWN_STAT	BIT(2)
 
+#define MT_TOP_LPCR_HOST_BAND_IRQ_STAT(_band)	MT_TOP(0x14 + ((_band) * 0x10))
+#define MT_TOP_LPCR_HOST_BAND_STAT	BIT(0)
+
 #define MT_TOP_MISC			MT_TOP(0xf0)
 #define MT_TOP_MISC_FW_STATE		GENMASK(2, 0)
 
 #define MT_HW_BOUND			0x70010020
 #define MT_HW_CHIPID			0x70010200
 #define MT_HW_REV			0x70010204
+#define MT_WF_SUBSYS_RST		0x70002600
 
 /* PCIE MAC */
 #define MT_PCIE_MAC_BASE		0x74030000
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
