Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DAFC46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GthTiGe9APuzkJw47QDQSsVQv1XQO85t7aEoWiJvnWg=; b=k38niJnhP4pC2DsPknbZNAGEdj
	ONPhkLkZCEriQdO9HwZfa6ktAHqH9POKmcSpmMUvAQP34vg5KhvOGXIWaXnFNsVMYzVyAFvshY2gM
	KGok0B0HZGXU13OHGD0b/ZQEzZR2z+m6cDjHaFGc+bSJ00+RIx+HMe/u7xrIpW+he+oLy2dlMDgdq
	kumLIEr4ovzCF0ZjifKqd9h5ppvu+gFTrPsiQP1e5LmHx/5qkpd1JV4IhoyKFN9J9vFYxQ1v8UJSm
	Tvgd6SQ2/E0qYRBwQb/UD0nwMxYpZ2P7GSW1E0K7hUl11jTluRuAduxGsroHqwK8FPnu06gKr1fOA
	sDC6KthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCk52-002tOa-TY; Tue, 03 Jan 2023 16:24:00 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh5v-001R20-GU; Tue, 03 Jan 2023 13:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751563; x=1704287563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1oxY1AfVW3M6ZngxBRWmFDZ/ISoe8vMKVfgIGcibtG0=;
  b=efLumPIVwQhQ2Yykj0ZPhghBe6+ArbuSGlt/Kz+BBc5Oryh+GjKV/P4g
   iZM5JTdwYwED8YzkJE0/5gm0PB7X3Bs6xBQzFWhElQY8lGGtU+d3P0XJH
   5QDaDpKc3svZiTa3mzABXWi9lKPojynNSnmHbHejEWKU0HYQeWKriHp83
   QzEphT6sE4MivkxAHFdHBxJKJSqEikbA/BmbT1zbwm2nUXQkLS+neF4pf
   jZHR89qJT0fbMDKo5sCYzQqBHOvVrGCxWaAgzXhNcZHADPQlTPpB6Nhxd
   KZfJdjJm3ybRX642PzF343x/p35JngH8f4cmr0fhUKprxBZ6CwA9+GsHH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="322887945"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="322887945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="685397945"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="685397945"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 05:12:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BC69F3B3; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
	Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 07/11] leds: mt6360: Get rid of custom led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:52 +0200
Message-Id: <20230103131256.33894-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051243_894885_912CFDB1 
X-CRM114-Status: GOOD (  14.74  )
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
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/leds/flash/leds-mt6360.c | 38 +++++---------------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index e1066a52d2d2..1af6c5898343 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -71,10 +71,6 @@ enum {
 #define MT6360_STRBTO_STEPUS		32000
 #define MT6360_STRBTO_MAXUS		2432000
 
-#define STATE_OFF			0
-#define STATE_KEEP			1
-#define STATE_ON			2
-
 struct mt6360_led {
 	union {
 		struct led_classdev isnk;
@@ -84,7 +80,7 @@ struct mt6360_led {
 	struct v4l2_flash *v4l2_flash;
 	struct mt6360_priv *priv;
 	u32 led_no;
-	u32 default_state;
+	enum led_default_state default_state;
 };
 
 struct mt6360_priv {
@@ -405,10 +401,10 @@ static int mt6360_isnk_init_default_state(struct mt6360_led *led)
 		level = LED_OFF;
 
 	switch (led->default_state) {
-	case STATE_ON:
+	case LEDS_DEFSTATE_ON:
 		led->isnk.brightness = led->isnk.max_brightness;
 		break;
-	case STATE_KEEP:
+	case LEDS_DEFSTATE_KEEP:
 		led->isnk.brightness = min(level, led->isnk.max_brightness);
 		break;
 	default:
@@ -443,10 +439,10 @@ static int mt6360_flash_init_default_state(struct mt6360_led *led)
 		level = LED_OFF;
 
 	switch (led->default_state) {
-	case STATE_ON:
+	case LEDS_DEFSTATE_ON:
 		flash->led_cdev.brightness = flash->led_cdev.max_brightness;
 		break;
-	case STATE_KEEP:
+	case LEDS_DEFSTATE_KEEP:
 		flash->led_cdev.brightness =
 			min(level, flash->led_cdev.max_brightness);
 		break;
@@ -760,25 +756,6 @@ static int mt6360_init_flash_properties(struct mt6360_led *led,
 	return 0;
 }
 
-static int mt6360_init_common_properties(struct mt6360_led *led,
-					 struct led_init_data *init_data)
-{
-	const char *const states[] = { "off", "keep", "on" };
-	const char *str;
-	int ret;
-
-	if (!fwnode_property_read_string(init_data->fwnode,
-					 "default-state", &str)) {
-		ret = match_string(states, ARRAY_SIZE(states), str);
-		if (ret < 0)
-			ret = STATE_OFF;
-
-		led->default_state = ret;
-	}
-
-	return 0;
-}
-
 static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
 {
 	int i;
@@ -852,10 +829,7 @@ static int mt6360_led_probe(struct platform_device *pdev)
 
 		led->led_no = reg;
 		led->priv = priv;
-
-		ret = mt6360_init_common_properties(led, &init_data);
-		if (ret)
-			goto out_flash_release;
+		led->default_state = led_init_default_state_get(child);
 
 		if (reg == MT6360_VIRTUAL_MULTICOLOR ||
 		    reg <= MT6360_LED_ISNKML)
-- 
2.35.1


