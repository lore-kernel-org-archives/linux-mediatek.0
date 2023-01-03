Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BAC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7w6baOKr4KB2PiuqgQdQHmUSuRlMcuXittrTw63Bx0=; b=RxTOgDkuEmPBgAUSzVgrPNV5G6
	JmJGLYKXrNDDc1zxgiJrIUO2W+0LIzA16p7xiI8mOCPTcISddqHwbNXk+EpHO91uj+D5+nIBsAf58
	iVO8jQ+jg9B66joUOMReOG+caVzI29kr+pc0/8ymNVVtnpVwe93FC01a8PAM3vq88o5d/2/8MIaDZ
	iudgyFZEk5E5v0j6zowacaiyVD08dzl15fkAmC/rPqeXv1VLtH3ZXLZB6zb5wGFQuS9gIuV6B80tY
	j0CqZQpQ/xHFoImaHqaux6AafgfPMS926KCDcuLd1F3n5RMUvafxNoT/9leGWc3HNLwQu8P1EWmr/
	kh4rPm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkCL-002ws9-L6; Tue, 03 Jan 2023 16:31:33 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh69-001R2D-8k; Tue, 03 Jan 2023 13:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751577; x=1704287577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hvI26OhQ+1E3Y1b+RrDqvUOiyVnslqAALa2RhHdwGbY=;
  b=n0Mq9QYwvV0RWCA+tg9mygbcN/d/x2R/UQW79v1SBNJNtqxPobuBBIQo
   6WfxZ2c5CCbTAByr2/hKKvvWGqE3qcH32X1RvS9gvwxI0mc0M3LAnzD1Z
   MYfawwBWqGFvRDkIcZ0WFX5QIkIiIRbPLv83fUPqkRl4xmx+hTrbs9sOK
   wCV4Q7dyceg0eKrX/FKzq79mvjLyCoi6RBLXmeGAbeAjhjSP1rpRFEi+v
   taqdthrR6IXzoV5C7kRHbwoKCRosFEG6sg3FJLhCbZRTDBqw0LNutxqe6
   nBBoZb0l0yZFm5UcTLbV9FLnv3vb+rvc37b8xFMeViwYc+A2RqLD9khBr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320367275"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="320367275"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="654781148"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="654781148"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jan 2023 05:12:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D30BE3FD; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
Subject: [PATCH v4 09/11] leds: pm8058: Get rid of custom led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:54 +0200
Message-Id: <20230103131256.33894-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051257_402043_AA49EBF2 
X-CRM114-Status: GOOD (  15.08  )
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


