Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010E5ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyWyGm+IWdJHu3gONzDaN2BMjaUIuSwzcpBa+jGOmM8=; b=J2f7MQrkZ7/oWwWd7TZT606SLK
	Olm0C3pCEb/Ypejg2C+VO3utbgBe28Hc8QbiD+tzY4qE7TUyQr9YIIuRT6B752aNyUtD8aHGCjewF
	IADl1O+WVR4n38UGTzxUqQnikThmnwiPA4fmmq9ZVvxDoeeqdRWGhMtpJVhhnZr4Rk6f+oUJ4HFUr
	RHp4yVg3XVpLInyT69HN8+oTz4AHWA3jT4Q7ssuxYJj4t5zvr8GRLsB6ay2wZk96kHbIscPqKZrhC
	/vfJDD/l84SKUS5aAbPWl0MAKENd1XnPDa4qHGHDdUNB1SMtZiCYpD+s7K6SwdVxxXu0Gndosq4eg
	EDlXlldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZXB-00EHtU-Ku; Tue, 06 Sep 2022 14:26:38 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxq-00Dzqm-De; Tue, 06 Sep 2022 13:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472206; x=1694008206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VQzFMWOPVcFhsKxRl9Czr0Mhj2oriMu0x8VLNQGEUCY=;
  b=hcnuI2Y9OnzhMvPJzriKoCKzeg1mdcTsU+pU4YGc8zCXegRuHeyarwXf
   CRuKRV279QQhDn56G3WvdoS/l5jr1+mwOJROViL8H30uYgXLXD1epRv5G
   fHzgDVcc1lRMcqFGHuoxNaANdsFdScRg0kPV57HI0duqPhn2MyQzUJMxm
   cxGuFUp1eB3V/NVDRU/jjebcdYNGxQ+CrHAOa0p4zJ8zGAgf6o2JgzzZe
   QPjVuO59rHsXfZj2+SQLHp5LOuKfYPt2LlM5QSQow9JgZEqmoufzwJ9/u
   OMBv98UYc8e/WrNcplpe+8QvBaRfJeAsdD8j4LZQfk0/UFwJzaUzlehOT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="360544220"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="360544220"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="591269676"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2022 06:50:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AAD8A6D1; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
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
Subject: [PATCH v3 08/11] leds: pca955x: Get rid of custom led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:50:01 +0300
Message-Id: <20220906135004.14885-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065006_561382_05D334A5 
X-CRM114-Status: GOOD (  14.18  )
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
index 81aaf21212d7..8dca6f99e699 100644
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
 
@@ -443,7 +443,6 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
 
 	device_for_each_child_node(&client->dev, child) {
-		const char *state;
 		u32 reg;
 		int res;
 
@@ -454,19 +453,9 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
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
@@ -578,13 +567,11 @@ static int pca955x_probe(struct i2c_client *client)
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
@@ -623,8 +610,7 @@ static int pca955x_probe(struct i2c_client *client)
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


