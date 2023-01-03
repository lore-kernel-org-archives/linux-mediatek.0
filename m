Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0C8C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZIENcKeaf489uFWiNYo7yRg+Cgbsq5yoCtVjXncWKc=; b=CvopFGHmXhYIY6gPK/QnjJPUZ0
	J5ruZHh/54tNXkdoqMEf/uOwi0zhuWHa3Kc2mOlXoQZVTLl8akzs1888Jriqken1b6hGIoItCy4OH
	QwELJR+1q1AVrjwXmA+BGoka8IY+UHjQcQ1EXYpKjb0TWpDnBBCwFzJ0pevn/g00fp/OQdFzpZz/d
	b90pO9m7wtXp8D+ZmPfaiWwlErka68ncOMSEf5i3BXs3OtDOaPkbRUmzau0Ssk7ffEuxQ+oKc3KBy
	7qRapqwxn+XX+OAPK95PyxbCh1bMDeuVvoFfIv0MVQStP2N6i8SGJCParlwI+WCNmpMxNZDDpnnb/
	1JXgTRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCk39-002sTh-Ow; Tue, 03 Jan 2023 16:22:03 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh5r-001R07-B6; Tue, 03 Jan 2023 13:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751559; x=1704287559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fLglo+upgf8/JpSJNXXF1To0jqbOVKWrlAOKnDglss8=;
  b=B4Sprl1QVfuG84QQ/0gBi3dGV8JdAVFH4uXt2/XIWch3L5aYVZRdCEHg
   osiZOqXlLdOYFfNVwAKDhVWXLtGj/gcJebUiL+oCQjDhWfLX2GYgKWkfK
   iAhHf1w8Yl8Y01TOrmQEB9CFsS5VhLsFwmC0DM7SZZTKi4gEbvX4L1Vm/
   h9tK911zs6eSyr8waUKjc320dePqt70/15anbavMerw+/VhwVBnQ2PycH
   Vqj8VuVwV3lB4DVW5iLniL5ppBijD9GU0U7k/Y1ej98k5qVjTnYJweP9C
   14Ol15oZDyJ08vSKAl26nHSuZVRDKLNUQKK1ZJyrHootRHaaD5jMy/9mx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="322887910"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="322887910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="685397924"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="685397924"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 05:12:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9B761252; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Gene Chen <gene_chen@richtek.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v4 04/11] leds: bcm6328: Get rid of custom led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:49 +0200
Message-Id: <20230103131256.33894-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051239_818462_B3BC3C27 
X-CRM114-Status: GOOD (  14.73  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

LED core provides a helper to parse default state from firmware node.
Use it instead of custom implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 49 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 2d4d87957a30..246f1296ab09 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -330,7 +330,9 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 {
 	struct led_init_data init_data = {};
 	struct bcm6328_led *led;
-	const char *state;
+	enum led_default_state state;
+	unsigned long val, shift;
+	void __iomem *mode;
 	int rc;
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
@@ -346,31 +348,29 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 	if (of_property_read_bool(nc, "active-low"))
 		led->active_low = true;
 
-	if (!of_property_read_string(nc, "default-state", &state)) {
-		if (!strcmp(state, "on")) {
+	init_data.fwnode = of_fwnode_handle(nc);
+
+	state = led_init_default_state_get(init_data.fwnode);
+	switch (state) {
+	case LEDS_DEFSTATE_ON:
+		led->cdev.brightness = LED_FULL;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		shift = bcm6328_pin2shift(led->pin);
+		if (shift / 16)
+			mode = mem + BCM6328_REG_MODE_HI;
+		else
+			mode = mem + BCM6328_REG_MODE_LO;
+
+		val = bcm6328_led_read(mode) >> BCM6328_LED_SHIFT(shift % 16);
+		val &= BCM6328_LED_MODE_MASK;
+		if ((led->active_low && val == BCM6328_LED_MODE_OFF) ||
+		    (!led->active_low && val == BCM6328_LED_MODE_ON))
 			led->cdev.brightness = LED_FULL;
-		} else if (!strcmp(state, "keep")) {
-			void __iomem *mode;
-			unsigned long val, shift;
-
-			shift = bcm6328_pin2shift(led->pin);
-			if (shift / 16)
-				mode = mem + BCM6328_REG_MODE_HI;
-			else
-				mode = mem + BCM6328_REG_MODE_LO;
-
-			val = bcm6328_led_read(mode) >>
-			      BCM6328_LED_SHIFT(shift % 16);
-			val &= BCM6328_LED_MODE_MASK;
-			if ((led->active_low && val == BCM6328_LED_MODE_OFF) ||
-			    (!led->active_low && val == BCM6328_LED_MODE_ON))
-				led->cdev.brightness = LED_FULL;
-			else
-				led->cdev.brightness = LED_OFF;
-		} else {
+		else
 			led->cdev.brightness = LED_OFF;
-		}
-	} else {
+		break;
+	default:
 		led->cdev.brightness = LED_OFF;
 	}
 
@@ -378,7 +378,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 
 	led->cdev.brightness_set = bcm6328_led_set;
 	led->cdev.blink_set = bcm6328_blink_set;
-	init_data.fwnode = of_fwnode_handle(nc);
 
 	rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (rc < 0)
-- 
2.35.1


