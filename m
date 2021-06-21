Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8BCC4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 14:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4669C60FDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 14:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4669C60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HMXyN/F1Y5tVlszFOdLmjw3t079a5P+Cv2PdocGZXms=; b=yhcjeTcD3gwcSC
	9G0DdvZtEmwIMLBFjBJ/yH3x+Dds8KPFJ4Oyu6UOwBMZAR5Fr+VfUGGVPE+nXEDI+9ErfGftAZGyA
	A7YQGbUMsClhXtJnWYzJCCAYB5/HyOegDre/cf8uF0ZDvpfWxswFiyhltBll+oF7pgafDCWpMm+pG
	d1ZMBQDgXHfLUuPMv9ihn+F8euLX3mQEOSAWE8uwj1mVPvo4RD+qkaRql6XlctyLJvl5d95ffv6AS
	nnRikOuOsztkisjC+baIv2DFIv4QZagbTjDE/jiGoemWer6Tj2HfDRjjnFDKEsX0R17QBKY5lEvUP
	cacI8pSHJpLaYodvuo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvKi0-003i0R-A4; Mon, 21 Jun 2021 14:15:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvKhw-003hyK-Ps
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 14:15:26 +0000
X-UUID: 592d4da2e23f40e48fea72ffcdbdc171-20210621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+X+l2NEVyFleKGLi4rDGds2nK6eA3DwfsbWoGfvQz14=; 
 b=PSMmYAqQoDvYQNxejHx+t6qv7nyqH5iLMRgN89HOBs+V/yPoOdCqHkmCf7lLZuIcBcEmJPgoftFpbnMaXG5CIk/YZi9Q1NcTFLZZXAHFvYfUZKYslzRL2EJbmjh4h/Fgns+iVP23znyveJYAPFQIR/CpUmmLHOo+iozMcgp6iQQ=;
X-UUID: 592d4da2e23f40e48fea72ffcdbdc171-20210621
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1556939089; Mon, 21 Jun 2021 07:15:16 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 07:15:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 22:15:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Jun 2021 22:15:13 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 MeiChia Chiu <meichia.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
 Money Wang <money.wang@mediatek.com>
Subject: [PATCH] mt76: mt7915: add LED support
Date: Mon, 21 Jun 2021 22:14:30 +0800
Message-ID: <20210621141430.17577-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_071524_908979_AEB12408 
X-CRM114-Status: GOOD (  15.06  )
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

Initialize brightness_set and blink_set callbacks to enable LED support.

Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Money Wang <money.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mmio.c |  6 +++--
 .../net/wireless/mediatek/mt76/mt7915/regs.h | 19 ++++++++++++++
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index e027273..defb0ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -151,6 +151,64 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 	return 0;
 }
 
+static void mt7915_led_set_config(struct led_classdev *led_cdev,
+				  u8 delay_on, u8 delay_off)
+{
+	struct mt7915_dev *dev;
+	struct mt76_dev *mt76;
+	u32 val;
+
+	mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
+	dev = container_of(mt76, struct mt7915_dev, mt76);
+
+	/* select TX blink mode, 2: only data frames */
+	mt76_rmw_field(dev, MT_TMAC_TCR0(0), MT_TMAC_TCR0_TX_BLINK, 2);
+
+	/* enable LED */
+	mt76_wr(dev, MT_LED_EN(0), 1);
+
+	/* set LED Tx blink on/off time */
+	val = FIELD_PREP(MT_LED_TX_BLINK_ON_MASK, delay_on) |
+	      FIELD_PREP(MT_LED_TX_BLINK_OFF_MASK, delay_off);
+	mt76_wr(dev, MT_LED_TX_BLINK(0), val);
+
+	/* control LED */
+	val = MT_LED_CTRL_BLINK_MODE | MT_LED_CTRL_KICK;
+	if (dev->mt76.led_al)
+		val |= MT_LED_CTRL_POLARITY;
+
+	mt76_wr(dev, MT_LED_CTRL(0), val);
+	mt76_clear(dev, MT_LED_CTRL(0), MT_LED_CTRL_KICK);
+}
+
+static int mt7915_led_set_blink(struct led_classdev *led_cdev,
+				unsigned long *delay_on,
+				unsigned long *delay_off)
+{
+	u16 delta_on, delta_off;
+
+#define HW_TICK		10
+#define TO_HW_TICK(_t)	(((_t) > HW_TICK) ? ((_t) / HW_TICK) : HW_TICK)
+
+	if (*delay_on)
+		delta_on = TO_HW_TICK(*delay_on);
+	if (*delay_off)
+		delta_off = TO_HW_TICK(*delay_off);
+
+	mt7915_led_set_config(led_cdev, delta_on, delta_off);
+
+	return 0;
+}
+
+static void mt7915_led_set_brightness(struct led_classdev *led_cdev,
+				      enum led_brightness brightness)
+{
+	if (!brightness)
+		mt7915_led_set_config(led_cdev, 0, 0xff);
+	else
+		mt7915_led_set_config(led_cdev, 0xff, 0);
+}
+
 static void
 mt7915_init_txpower(struct mt7915_dev *dev,
 		    struct ieee80211_supported_band *sband)
@@ -308,6 +366,11 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
 				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	for (i = 0; i < 2; i++)
 		mt7915_mac_init_band(dev, i);
+
+	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
+		i = dev->mt76.led_pin ? MT_LED_GPIO_MUX3 : MT_LED_GPIO_MUX2;
+		mt76_rmw_field(dev, i, MT_LED_GPIO_SEL_MASK, 4);
+	}
 }
 
 static int mt7915_txbf_init(struct mt7915_dev *dev)
@@ -822,6 +885,12 @@ int mt7915_register_device(struct mt7915_dev *dev)
 	dev->mt76.test_ops = &mt7915_testmode_ops;
 #endif
 
+	/* init led callbacks */
+	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
+		dev->mt76.led_cdev.brightness_set = mt7915_led_set_brightness;
+		dev->mt76.led_cdev.blink_set = mt7915_led_set_blink;
+	}
+
 	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
 				   ARRAY_SIZE(mt76_rates));
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index af712a9..43f9245 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -92,10 +92,12 @@ static u32 __mt7915_reg_addr(struct mt7915_dev *dev, u32 addr)
 	}
 
 	if ((addr >= 0x18000000 && addr < 0x18c00000) ||
-	    (addr >= 0x70000000 && addr < 0x78000000) ||
-	    (addr >= 0x7c000000 && addr < 0x7c400000))
+	    (addr >= 0x70000000 && addr < 0x78000000))
 		return mt7915_reg_map_l1(dev, addr);
 
+	if (addr >= 0x7c000000 && addr < 0x7c400000)
+		return mt7915_reg_map_l1(dev, addr - 0x64000000);
+
 	return mt7915_reg_map_l2(dev, addr);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index ff31b3d..b1df0bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -57,6 +57,7 @@
 #define MT_WF_TMAC(_band, ofs)		(MT_WF_TMAC_BASE(_band) + (ofs))
 
 #define MT_TMAC_TCR0(_band)		MT_WF_TMAC(_band, 0)
+#define MT_TMAC_TCR0_TX_BLINK		GENMASK(7, 6)
 #define MT_TMAC_TCR0_TBTT_STOP_CTRL	BIT(25)
 
 #define MT_TMAC_CDTR(_band)		MT_WF_TMAC(_band, 0x090)
@@ -426,6 +427,10 @@
 #define MT_TOP_MISC			MT_TOP(0xf0)
 #define MT_TOP_MISC_FW_STATE		GENMASK(2, 0)
 
+#define MT_LED_GPIO_MUX2                0x70005058 /* GPIO 18 */
+#define MT_LED_GPIO_MUX3                0x7000505C /* GPIO 26 */
+#define MT_LED_GPIO_SEL_MASK            GENMASK(11, 8)
+
 #define MT_HW_BOUND			0x70010020
 #define MT_HW_CHIPID			0x70010200
 #define MT_HW_REV			0x70010204
@@ -438,6 +443,20 @@
 #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
 #define MT_PCIE_MAC_INT_ENABLE		MT_PCIE_MAC(0x188)
 
+#define MT_LED_TOP_BASE			0x7c013000
+#define MT_LED_PHYS(_n)			(MT_LED_TOP_BASE + (_n))
+
+#define MT_LED_CTRL(_n)			MT_LED_PHYS(0x00 + ((_n) * 4))
+#define MT_LED_CTRL_KICK		BIT(7)
+#define MT_LED_CTRL_BLINK_MODE		BIT(2)
+#define MT_LED_CTRL_POLARITY		BIT(1)
+
+#define MT_LED_TX_BLINK(_n)		MT_LED_PHYS(0x10 + ((_n) * 4))
+#define MT_LED_TX_BLINK_ON_MASK		GENMASK(7, 0)
+#define MT_LED_TX_BLINK_OFF_MASK        GENMASK(15, 8)
+
+#define MT_LED_EN(_n)			MT_LED_PHYS(0x40 + ((_n) * 4))
+
 #define MT_WF_IRPI_BASE			0x83006000
 #define MT_WF_IRPI(ofs)			(MT_WF_IRPI_BASE + ((ofs) << 16))
 
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
