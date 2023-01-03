Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C97AC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whtg+X8APOE7axzskbilEU6qOgpVAHq4XkJqOAxAWVA=; b=Lq5uhlczBcHWHXG6+u7HeDx1bs
	3A8jaM8RbMNEt6+7PiiGwWu3fnsrXhfXfDigZc4rUwoTZcUxBFUfndMH5THqUGIDkHhDC2+buYh+S
	cPVWl5Lis3IIBagGTt1L2wdIOHt7ttp3ce8tNwq0XlZIpHwIMYHi6aYdME8Ds4BuEtyWH7npJGVHy
	h9mTSYMKz3PWWIgZ13Si1m6EXCJ2L1EP4swHuRp0fnx3rMCmX2bakgTlP9ZuAUvSSgDVKRXlw+6zh
	VvldXi6qsNodEODpVhNej2xepBLuT2kiUo1LOumBjxywrT40D0grcF+VRCgRdgZPzIrfiUWMdnPY4
	Yn1aZgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkBv-002wfg-Ua; Tue, 03 Jan 2023 16:31:08 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh66-001R2D-Jm; Tue, 03 Jan 2023 13:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751574; x=1704287574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2vu7l/6K0nvkzNmUjyptRlngyguT+RoN4sYZnyNxAgU=;
  b=AqTzcltId0q+m5ZIH5uUY33Dfn0fGzKoLTlT+wvg+gio9KbvLHPzSoLf
   pdWuzEjrFHktEvgxy9bq2CMRYRauNclf/e6E+JOuUad50vCy2J7v3Renz
   4WB4Qj1rKb/Psef5H/E/y/0JSpFWiQLWkoBMT/AU6joW9+BEARI1U0yLu
   AFRrYGY21kDSZtRc29F4thPP89m5pkgoAmjUInpdxM0IFEknuYhUOBT67
   vPade1thZrXA/ITiApQ0CqnVi/PucVAG6wlpvORYW4sTwf0pg+0ZaGKuF
   vfS3tEAGtNBegwIDqlGKbLWU3MpM1kmxC7yJrcuyFzzusgybWcmIuSPBb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320367245"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="320367245"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="654781131"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="654781131"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jan 2023 05:12:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 91CA1220; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
Subject: [PATCH v4 03/11] leds: an30259a: Get rid of custom led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:48 +0200
Message-Id: <20230103131256.33894-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051254_861861_59CECB18 
X-CRM114-Status: GOOD (  14.78  )
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
 drivers/leds/leds-an30259a.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index e072ee5409f7..89df267853a9 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -55,10 +55,6 @@
 
 #define AN30259A_NAME "an30259a"
 
-#define STATE_OFF 0
-#define STATE_KEEP 1
-#define STATE_ON 2
-
 struct an30259a;
 
 struct an30259a_led {
@@ -66,7 +62,7 @@ struct an30259a_led {
 	struct fwnode_handle *fwnode;
 	struct led_classdev cdev;
 	u32 num;
-	u32 default_state;
+	enum led_default_state default_state;
 	bool sloping;
 };
 
@@ -205,7 +201,6 @@ static int an30259a_dt_init(struct i2c_client *client,
 	struct device_node *np = dev_of_node(&client->dev), *child;
 	int count, ret;
 	int i = 0;
-	const char *str;
 	struct an30259a_led *led;
 
 	count = of_get_available_child_count(np);
@@ -228,15 +223,7 @@ static int an30259a_dt_init(struct i2c_client *client,
 		led->num = source;
 		led->chip = chip;
 		led->fwnode = of_fwnode_handle(child);
-
-		if (!of_property_read_string(child, "default-state", &str)) {
-			if (!strcmp(str, "on"))
-				led->default_state = STATE_ON;
-			else if (!strcmp(str, "keep"))
-				led->default_state = STATE_KEEP;
-			else
-				led->default_state = STATE_OFF;
-		}
+		led->default_state = led_init_default_state_get(led->fwnode);
 
 		i++;
 	}
@@ -261,10 +248,10 @@ static void an30259a_init_default_state(struct an30259a_led *led)
 	int led_on, err;
 
 	switch (led->default_state) {
-	case STATE_ON:
+	case LEDS_DEFSTATE_ON:
 		led->cdev.brightness = LED_FULL;
 		break;
-	case STATE_KEEP:
+	case LEDS_DEFSTATE_KEEP:
 		err = regmap_read(chip->regmap, AN30259A_REG_LED_ON, &led_on);
 		if (err)
 			break;
-- 
2.35.1


