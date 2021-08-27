Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F57C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 20:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C52B60295
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 20:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C52B60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kl6x2lS5RXpzkWlCSSLGbpYMUBV9YrTL9N901hQQ0ho=; b=NaogER/reSTP6F
	KIP9ovcjostcelKyolkgoHHNvQ42dXTZPCB3Ur7s7vkpUkZIcPWBUM8UHn+q8TI1XyjrOXbRIT3gO
	j3wnLCib6ZGMQgyB2u1vkRe6vYBjWdGPNeDgCTL/cPfe/CCpd5OXtueJ6T2fD6AEnij4kSeNKb8pw
	gbd9gSUiYqUv0sKUuCLcWhvEjnf2KZD3urlBEFcfHBQuts9guwZb1OQt2v796yuDgeBpkiWdRHUpI
	OVT2ftVFMsZSN3HIP2Sbc1z5dJq++uoSWuv6cjCuoIyfl4QiS+1RzrNpnM6jc+oaLL+gJfMqfDU75
	Q2BVtr/IliHQVQ5Xme1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJiV7-00DD6r-0G; Fri, 27 Aug 2021 20:30:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJiV1-00DD5x-AM
 for linux-mediatek@lists.infradead.org; Fri, 27 Aug 2021 20:30:55 +0000
X-UUID: 00550934c3a84e20948bce3353d28ee6-20210827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LykohKqFn58EcRC/hHydjQYGQVNwcMgn2SPSMpll580=; 
 b=GmzWwKxSLBPASnzqpomWyiC6qeQAttK8P0C5FpgOVGBy2nIJn1ZwmgATyF7Kmpw7PaY1VmgtHuhViNbyqlfr1D3QihHGK5z5F18m8QQSpdUKzjCv3Dy3yTYmzZeJIGY1oRruba5bHfmn7D6MeIpfYjb1LzwL/x3NR4Dy/mnW6zQ=;
X-UUID: 00550934c3a84e20948bce3353d28ee6-20210827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1820406415; Fri, 27 Aug 2021 13:30:47 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Aug 2021 13:30:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 28 Aug 2021 04:30:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 28 Aug 2021 04:30:44 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 MeiChia Chiu <meichia.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
 Money Wang <money.wang@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: add LED support
Date: Sat, 28 Aug 2021 04:30:43 +0800
Message-ID: <748e894194ced01ceda3af6bf7a7202f9cb34054.1630095891.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_133051_720288_B4109D98 
X-CRM114-Status: GOOD (  16.05  )
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
The base 0x7c000000 is MCU space so driver can't touch it, and should
map the LED base to host's view 0x18000000.

Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Money Wang <money.wang@mediatek.com>
---
v2 - define the registers as being in the 0x18000000 range
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 69 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 19 +++++
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index ba41ed38a4c5..a73b0d9499bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -187,6 +187,64 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
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
@@ -341,6 +399,11 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
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
@@ -847,6 +910,12 @@ int mt7915_register_device(struct mt7915_dev *dev)
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
index bb5522446eab..1f6ba306c850 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -95,8 +95,7 @@ static u32 __mt7915_reg_addr(struct mt7915_dev *dev, u32 addr)
 	}
 
 	if ((addr >= 0x18000000 && addr < 0x18c00000) ||
-	    (addr >= 0x70000000 && addr < 0x78000000) ||
-	    (addr >= 0x7c000000 && addr < 0x7c400000))
+	    (addr >= 0x70000000 && addr < 0x78000000))
 		return mt7915_reg_map_l1(dev, addr);
 
 	return mt7915_reg_map_l2(dev, addr);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 724988f16107..05eb70645a7c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -57,6 +57,7 @@
 #define MT_WF_TMAC(_band, ofs)		(MT_WF_TMAC_BASE(_band) + (ofs))
 
 #define MT_TMAC_TCR0(_band)		MT_WF_TMAC(_band, 0)
+#define MT_TMAC_TCR0_TX_BLINK		GENMASK(7, 6)
 #define MT_TMAC_TCR0_TBTT_STOP_CTRL	BIT(25)
 
 #define MT_TMAC_CDTR(_band)		MT_WF_TMAC(_band, 0x090)
@@ -435,6 +436,20 @@
 #define MT_SWDEF_ICAP_MODE		1
 #define MT_SWDEF_SPECTRUM_MODE		2
 
+#define MT_LED_TOP_BASE			0x18013000
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
 #define MT_TOP_BASE			0x18060000
 #define MT_TOP(ofs)			(MT_TOP_BASE + (ofs))
 
@@ -445,6 +460,10 @@
 #define MT_TOP_MISC			MT_TOP(0xf0)
 #define MT_TOP_MISC_FW_STATE		GENMASK(2, 0)
 
+#define MT_LED_GPIO_MUX2                0x70005058 /* GPIO 18 */
+#define MT_LED_GPIO_MUX3                0x7000505C /* GPIO 26 */
+#define MT_LED_GPIO_SEL_MASK            GENMASK(11, 8)
+
 #define MT_HW_BOUND			0x70010020
 #define MT_HW_CHIPID			0x70010200
 #define MT_HW_REV			0x70010204
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
