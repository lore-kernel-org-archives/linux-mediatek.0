Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02DDC46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhiFLBFtyTtS9hkNkQi647HtLFPenm1IJPibK3iL+8U=; b=K74Dz8jiMntrFZ7qD/Hln6VZcz
	pGRgKNUYdgppaHLkrKM23iE4ragc5lOiVAYGMv3hKJRG8vHulpiGKncuHN0AUc225bEPkphoLyM8R
	5OkgVhdOwTeGyGfm6/Zxbfp2KONLUUqK4WoRf6NjaL/8dqDD0YYX3NapgWZnAwXUuY46dWFBCFLSk
	yWALA5a2JUX+UyCL6FhHYZZyQ9Xkb4mtDhdwCkqGgeENOoxx/x+qzk2ttvAy8OqsQu65UQa1ixTpv
	yuihdcrCT8TvQ3HOgbdO7ot6r6hzMhgJZjp60nl4yIJM5M24hlyMtWk6Iq0JUXYb3F+HPAok0Nqze
	xWi/aXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCk67-002tzj-CV; Tue, 03 Jan 2023 16:25:07 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh5w-001R3F-Ap; Tue, 03 Jan 2023 13:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751564; x=1704287564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7p6zWbQRFO6BWGKdmzxHibs27PU9es81+rcbWbLCG20=;
  b=j722cG7A2lXzw/ka6jI1UYD83qpkWlRMTyb/+mfQJwHTjYrJiRIt1ngc
   mB+xPxgwjsgNCrNpXXUcY2kgrXbVG5olZbG2VhkQ8EiUqNR2prKGlkKmI
   Z21JqNnLBGOys8YQG+4TApLmTOSjlML1vZIOrfcD/Qtf6kB+dSx3oiM8F
   HJm6L/YUTkc6A6bmEDZg+ivX9aKIFHOJYxsRdzh5YbemjJ6ZxfIgnHzEH
   Rzqixq7bv9Pm5xxfKPGL1mnmkWM7dfgawQch8EqQlImC33+54tqqCb3o+
   VWE/PCRSGjZdRnmfYQsv3ZvcAiJCVMdpjDwOmXDtYl2fvkcgq8GZMDa1a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="322887975"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="322887975"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="685397941"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="685397941"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 05:12:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A5E0C2AA; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
Subject: [PATCH v4 05/11] leds: bcm6358: Get rid of custom led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:50 +0200
Message-Id: <20230103131256.33894-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051244_539140_91965394 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/leds/leds-bcm6358.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 9d2e487fa08a..86e51d44a5a7 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -96,7 +96,8 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 {
 	struct led_init_data init_data = {};
 	struct bcm6358_led *led;
-	const char *state;
+	enum led_default_state state;
+	unsigned long val;
 	int rc;
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
@@ -110,29 +111,28 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
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
+		val = bcm6358_led_read(led->mem + BCM6358_REG_MODE);
+		val &= BIT(led->pin);
+		if ((led->active_low && !val) || (!led->active_low && val))
 			led->cdev.brightness = LED_FULL;
-		} else if (!strcmp(state, "keep")) {
-			unsigned long val;
-			val = bcm6358_led_read(led->mem + BCM6358_REG_MODE);
-			val &= BIT(led->pin);
-			if ((led->active_low && !val) ||
-			    (!led->active_low && val))
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
 
 	bcm6358_led_set(&led->cdev, led->cdev.brightness);
 
 	led->cdev.brightness_set = bcm6358_led_set;
-	init_data.fwnode = of_fwnode_handle(nc);
 
 	rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (rc < 0)
-- 
2.35.1


