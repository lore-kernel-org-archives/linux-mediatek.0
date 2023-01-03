Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A944C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amyx37cUS1Ga7+iBkem0FbcV4SxxuA5yDQCSKvbgEUY=; b=Ps0IvUf/Xao/RerQPLbJ6in3++
	zHZNaQkX2/QfycCR0VSxdXuC6Ak/cQRw28T0QyIWIahLPimVxHVXEtMtb2btodNw8GEJ9v33u6E47
	BeM0VRE5E6mnqCoIlK+mwD9YrE5Jpt9vcpPrujIQesy3u/x5w4EsXUjsjLCy3p1IN3Oj2uMchU/Qv
	ueSyGkJZ1UwxyEwr+bckyYUdJgiEDu0uSE7YI/4qB0oftvdO7bH9VCF5GrzXrl/c1Jv0F1cT23tbv
	aVEpUYnm3BFkyEviQKA6ZAV+x4PfS+UrbBCt9ujg+phT7Inhorm8WTxuNbfVtQBaRcWU0NVSBrYru
	pUSVauSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkC9-002wlC-Cy; Tue, 03 Jan 2023 16:31:21 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh69-001QzV-BF; Tue, 03 Jan 2023 13:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751577; x=1704287577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aeuQDv8IZ9zZxqvE4KXWp0tWzJlo3lpo6FSE4G48zc0=;
  b=N3Meh+JcKfBBuaIxaptmm1MABd9FiPukXRYFwEdlfUx/D6ngBE5SEexE
   TwpkBQTkTKGtuSg8zsY3uxOf0YXN7LS80Toea7xqm7NBg81jvVWIcV/zl
   bh0S+R9DR92CHnmZgysylIuaAVE2pG7X1TAivLQLn0ZWuMpj0TTRiBexl
   5bMF0Sm6r2ys0fpYTJKGLRO3XF/0MXGIAMfmuEXdm7Ah8aN45lucs6uP7
   JMcC43kYAwhK/Q8CL4TkI0diSN4xLCNuNygzF03QxAyneIIqAe9zTXzQ8
   DD8neSMapPf1VXRK4vsa+OBFmU4DLhcRD1JA7hrHruSAhe+qhXHw1jSE2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320367286"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="320367286"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="654781149"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="654781149"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jan 2023 05:12:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C7B4719E; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
Subject: [PATCH v4 08/11] leds: pca955x: Get rid of custom led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:53 +0200
Message-Id: <20230103131256.33894-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051257_716132_6CA7465C 
X-CRM114-Status: GOOD (  15.60  )
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
 drivers/leds/leds-pca955x.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 33ec4543fb4f..1edd092e7894 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -130,7 +130,7 @@ struct pca955x_led {
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
 	u32			type;
-	int			default_state;
+	enum led_default_state	default_state;
 	struct fwnode_handle	*fwnode;
 };
 
@@ -437,7 +437,6 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
 
 	device_for_each_child_node(&client->dev, child) {
-		const char *state;
 		u32 reg;
 		int res;
 
@@ -448,19 +447,9 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		led = &pdata->leds[reg];
 		led->type = PCA955X_TYPE_LED;
 		led->fwnode = child;
-		fwnode_property_read_u32(child, "type", &led->type);
+		led->default_state = led_init_default_state_get(child);
 
-		if (!fwnode_property_read_string(child, "default-state",
-						 &state)) {
-			if (!strcmp(state, "keep"))
-				led->default_state = LEDS_GPIO_DEFSTATE_KEEP;
-			else if (!strcmp(state, "on"))
-				led->default_state = LEDS_GPIO_DEFSTATE_ON;
-			else
-				led->default_state = LEDS_GPIO_DEFSTATE_OFF;
-		} else {
-			led->default_state = LEDS_GPIO_DEFSTATE_OFF;
-		}
+		fwnode_property_read_u32(child, "type", &led->type);
 	}
 
 	pdata->num_leds = chip->bits;
@@ -572,13 +561,11 @@ static int pca955x_probe(struct i2c_client *client)
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
-			if (pdata->leds[i].default_state ==
-			    LEDS_GPIO_DEFSTATE_OFF) {
+			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF) {
 				err = pca955x_led_set(led, LED_OFF);
 				if (err)
 					return err;
-			} else if (pdata->leds[i].default_state ==
-				   LEDS_GPIO_DEFSTATE_ON) {
+			} else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON) {
 				err = pca955x_led_set(led, LED_FULL);
 				if (err)
 					return err;
@@ -617,8 +604,7 @@ static int pca955x_probe(struct i2c_client *client)
 			 * brightness to see if it's using PWM1. If so, PWM1
 			 * should not be written below.
 			 */
-			if (pdata->leds[i].default_state ==
-			    LEDS_GPIO_DEFSTATE_KEEP) {
+			if (pdata->leds[i].default_state == LEDS_DEFSTATE_KEEP) {
 				if (led->brightness != LED_FULL &&
 				    led->brightness != LED_OFF &&
 				    led->brightness != LED_HALF)
-- 
2.35.1


