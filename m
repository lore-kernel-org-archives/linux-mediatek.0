Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080A3ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7w6baOKr4KB2PiuqgQdQHmUSuRlMcuXittrTw63Bx0=; b=eguFR2AUGkFvvyxmBGkQqPGfWg
	KisrwCzq2x7mKNYy7nh3VoHxtN06bCa0//ZwF7FvIyxtJZ34YsgqUoqibMsHS9htMcoMtwUYJ5xvw
	0zUQsXXmBFN+sjU0Af4wH2CLVeDfgmTxgv9UVdhlnvSD7YUBm1tPt1cEiKhCA2GdnYrY5eVV2NpPA
	IiZzodtRmK7aBZdwfCr5wRUPQLUP1S/PHWupDXcnT9U+sxqVSq4kgg4xgrRLYaDS62WvRTV7jiFkz
	QQB+FrECCoCBQ8gNeWoyftN1pY3b/Ksk6JqV9lCz5c0lMrMD/LtioDu/UFfdy2yt9k955JUrA34gN
	9/R5QX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZWk-00EHdC-Qw; Tue, 06 Sep 2022 14:26:11 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxq-00Dzqq-VX; Tue, 06 Sep 2022 13:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472206; x=1694008206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hvI26OhQ+1E3Y1b+RrDqvUOiyVnslqAALa2RhHdwGbY=;
  b=B6Rc3imjmYx3NXgud54mYhyRUS3FSx6x0cRS3zuEGu2IlGzQ3cJBvZdv
   s2rq7+j1jJmySoGE+eQd6Umt58FGz7XbuknX4bO0hazztHEeojVL4DsVZ
   d2OcUttkN/Tvd4C9c1MtzNb9P96/aKe2QYBh9FFNE6qhJWLgHAVGm2mTc
   PZPSVk9P7NS4YT9Tj1zC/dzFWsQTq6NE7JhZu/qUh8ujt11GV3tpIKxfB
   EqZkscJ/KuIcR1GgqsPDQDvHfuSrhjvu2aOe7zgrvX6JvgkrS/jZG+PnT
   cRXtPssU9D31cZ0EaWJtPssUcSyLbjrIXuQOmcw15/OPsA3j7x9lhyCUB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="358311668"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="358311668"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="675694894"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 06 Sep 2022 06:50:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B5018238; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v3 09/11] leds: pm8058: Get rid of custom led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:50:02 +0300
Message-Id: <20220906135004.14885-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065007_099730_FCD212D2 
X-CRM114-Status: GOOD (  13.77  )
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
 drivers/leds/leds-pm8058.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index fb2ab72c0c40..b9233f14b646 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -93,8 +93,8 @@ static int pm8058_led_probe(struct platform_device *pdev)
 	struct device_node *np;
 	int ret;
 	struct regmap *map;
-	const char *state;
 	enum led_brightness maxbright;
+	enum led_default_state state;
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
@@ -125,25 +125,26 @@ static int pm8058_led_probe(struct platform_device *pdev)
 		maxbright = 15; /* 4 bits */
 	led->cdev.max_brightness = maxbright;
 
-	state = of_get_property(np, "default-state", NULL);
-	if (state) {
-		if (!strcmp(state, "keep")) {
-			led->cdev.brightness = pm8058_led_get(&led->cdev);
-		} else if (!strcmp(state, "on")) {
-			led->cdev.brightness = maxbright;
-			pm8058_led_set(&led->cdev, maxbright);
-		} else {
-			led->cdev.brightness = LED_OFF;
-			pm8058_led_set(&led->cdev, LED_OFF);
-		}
+	init_data.fwnode = of_fwnode_handle(np);
+
+	state = led_init_default_state_get(init_data.fwnode);
+	switch (state) {
+	case LEDS_DEFSTATE_ON:
+		led->cdev.brightness = maxbright;
+		pm8058_led_set(&led->cdev, maxbright);
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		led->cdev.brightness = pm8058_led_get(&led->cdev);
+		break;
+	default:
+		led->cdev.brightness = LED_OFF;
+		pm8058_led_set(&led->cdev, LED_OFF);
 	}
 
 	if (led->ledtype == PM8058_LED_TYPE_KEYPAD ||
 	    led->ledtype == PM8058_LED_TYPE_FLASH)
 		led->cdev.flags	= LED_CORE_SUSPENDRESUME;
 
-	init_data.fwnode = of_fwnode_handle(np);
-
 	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (ret)
 		dev_err(dev, "Failed to register LED for %pOF\n", np);
-- 
2.35.1


