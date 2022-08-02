Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C0AC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 21:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RjxUmAQZZJA+Sr+Oi7iKG+P3RMRSgda2os7HBZXW14I=; b=nJ/IXwy1GfsJQxYpdq3P1WPMjp
	S0hNA2CY8/mxVonH3kdUgB/aa/T/nwIi02f32mkpBKJsbm0ZjVBNu4iIqh7chbvFb8sSVZAR+rFGD
	0xnELTjPWGESF0lgBVXL8XckoJda1Qu1sA0nDfKS/wUodEGLl4RDVSJTXrsaIYRNf8UDM4fAXXCHk
	91Uyl/MtnozGyD9oAfXuTKrYLax+Vn2SIpcfTD3G4b7EidBxJrIqlD19xwDm2M2OB7sePZMDKreMp
	ceBpVbhAolMJNYgoL7R9IM9gqBTSvELALVgU34C8wKS6mO334BFTZ6hfa90D4IZmLCEO2xio4gUBQ
	uCWFovcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIzOs-00HZDg-Db; Tue, 02 Aug 2022 21:26:02 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIzOe-00HZ5G-HD; Tue, 02 Aug 2022 21:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659475548; x=1691011548;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mgh1Q/iYrR7c+5WIQR2LnizOf2yoyOvx+PCFB6RnRFU=;
  b=RBAzQ1qTT2vNtg/Mn0jcSjYVXMDwO10aLfUIdmd7DwCzz97FHHsH8FWV
   id0HvvQa9466vVaaco6Jiboqww0Kvr4CKz4MCSAlb5AyN5Lzt4TZMkNCo
   zuh0xzdRF8c+0EOCsYGuqjvZNSs0qfW+bo8tBvUbrgBM5IXuN4g+tbJwV
   sdGueLxkBG2gkDWHUCrsGs9gPCGzhoK1EScvZhkWWBh5A5VQIV8Mu12HK
   SDKI/Tf5j5w+Z3FuPyoRPa0YrejTv/QUZv1oFvyp3omnp1lGJQdcwy16k
   Slr3iLQhXu8JSprMZG+i681H9uPHuP8HISso8EHDyXV2IKcccPfgUCh4d
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="269292766"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="269292766"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 14:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="705535752"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2022 14:25:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DFA6FF7; Wed,  3 Aug 2022 00:25:34 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/1] leds: mt6360: Get rid of custom led_init_default_state_get()
Date: Wed,  3 Aug 2022 00:25:32 +0300
Message-Id: <20220802212532.7091-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_142548_605396_9EEC2B81 
X-CRM114-Status: GOOD (  14.92  )
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


