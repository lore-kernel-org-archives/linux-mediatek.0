Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201E9C25B07
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XGRNK6g52C7X/515WzTohcGM8UPH7GUkkMWKZ/Lbck=; b=CBRoxbS6R+9jV2vhY/V3y+nFcM
	Ux5jcdnUQDepLrKHG4SJ4skGKk1kSSM97ees9xxYT0jGJKNsBRIK8psmjRDs41Qk7RFSQ3KCbD7fQ
	3AB+HvmutwFs/VyRjHL8ksIG2g2D0cAeWOmzJPVAhkxrPV2MLXvvKcp/OGpi+X16ytaVVf+IizjiT
	URljt/uKSALVazLMsAItrtUDkQ7RaD0fnTaHJWB9g9caRYldmdAiYfM+bfibPv92aQ7B5x/891qEV
	2c3JQ/nMC0p5MjytbvpU17fv/YFkOLvsd4FfXeOyJ/Bo+4nEY7uM7HWxFG4cjgtzIgZqkvkw73+hK
	uhkJ5BFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzca-00GSHS-2O; Fri, 05 Aug 2022 15:52:20 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzZc-00GQAj-8C; Fri, 05 Aug 2022 15:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659714556; x=1691250556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LCJNwKIb2JZh9SO69nCDrOY4AomaNFhl38g2hoPWX0w=;
  b=lA7TxeLnUugM0QJBbRSM6Ryxh+UXgilgkULGY1AjvqSUByy7GRRNYMN3
   ZiIJQj6kNB4D2k4ji3D9h3qR01DAEbBPbPV2qBE5EYFUYlxsl3UvV0mRU
   FnIDI6GNxGgSng4DQPI0eQDHFdSpz7Gn9bWIggK9AqkOK1RO0dzQydq40
   RpuTeyzm6rpb0/oIGhIkdmsZ5IAF+u3u4FkJpZR+u710M/7zWndKjXv3T
   Obo1FWlhZfaOX5M6dV2spZ6YF0/l9/+BzfHGPDbbX7Sly5BNMvA1cHJYm
   Beb3Ue5Iatap5jtis/G+DQ9R1IcePZk2xlVOPnQF3UN+TKYujIGzcQ8zf
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="291003129"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="291003129"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 08:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="671727790"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2022 08:49:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AFA151DF; Fri,  5 Aug 2022 18:49:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Eddie James <eajames@linux.ibm.com>,
	Denis Osterland-Heim <Denis.Osterland@diehl.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 04/11] leds: bcm6328: Get rid of custom led_init_default_state_get()
Date: Fri,  5 Aug 2022 18:49:00 +0300
Message-Id: <20220805154907.32263-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
References: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_084916_412897_D6B480D4 
X-CRM114-Status: GOOD (  15.79  )
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


