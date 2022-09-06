Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A56C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whtg+X8APOE7axzskbilEU6qOgpVAHq4XkJqOAxAWVA=; b=bVWnjBKuCczsLYOjSrh/+D0rbB
	BUK/PIO1TCfLuVV6jX8r7vnOwA5RAu9NxEW9JRR/GhoG5XzKNTLAopw4rHCBnJoaeYeo9M0n5TY0t
	MDWOIE+OhVuS7p2/Q2laJ6hnbyodgi3h26zv2oqpRn4Dnm7Yob+K1bknmUvh79gmwVSROdJROIzg5
	EgzOFpPL6DU6lD77R98eTPxPlmP+ZDD6mPVfMoJAGsJW6r4dO+gsvbHoPEDWNPgyTwxogEkKlF+1q
	5/5JwReBiMNole8QKTabwEgTWVJkBEgyBxMTUqyah2kRUp+fWeLVNkdfzTpfGkH5mXfDF1L2cZwsc
	Ckr5tTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZLQ-00EC7N-LX; Tue, 06 Sep 2022 14:14:28 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxn-00Dzmz-9E; Tue, 06 Sep 2022 13:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472203; x=1694008203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2vu7l/6K0nvkzNmUjyptRlngyguT+RoN4sYZnyNxAgU=;
  b=g8F6IIpfhCpcrGsrjNPqxntDoJ3rsmbfW+N548CpBHgHzaGmyva1nMF8
   QD4f62KGH9EiunHzCTx3xVM4zG3aydEV3Q+e9HEmC9Ub0gasuSuMLUVPb
   Q24//Yw8gvAFf8yOekfRXGaucYeeCbfGMTy9Q5Ho5QNvtC+Bm3VeNl+Gj
   mi5iKzAfCuJe3FAmsg3fqi/MgSDbi5EVSVBJ9v8FlHXR3jXog91TXah9C
   7ioqGUqQloXHyIQUGchmuUKR8/Lihcc/MgH7C9yozRlWb2P6u9gY/0K8F
   2oMkjpmYqXJpuYFQ1ffLfQ4JnUA5EyCwQ7NF0zsfNrdapAxnpzbM3vpx4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="322771122"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="322771122"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="756372523"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2022 06:49:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6F82145C; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
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
Subject: [PATCH v3 03/11] leds: an30259a: Get rid of custom led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:49:56 +0300
Message-Id: <20220906135004.14885-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065003_445318_343F76FC 
X-CRM114-Status: GOOD (  16.39  )
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


