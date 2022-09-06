Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7246ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1QxN/MVkmbtPgFiMVZumDBjcbxGPv7gkFEK3COMvWI=; b=VUn4110k52qIj1q4BbCcp7XqbS
	5D3T4u2kMxhm/pmWQ0p1ruKV4KyhQF4fMHMzd9UxDNwFGx0U7JY+uPTlQchCt22fUmmBeTr3iyz4x
	htWzroHwxwL0cEfCU3v48KOzOHfzXNWaaoKW44rE59f/e4QpHwlxLLrxlZ2ZHzjQjOKZyE7AQFCpQ
	jr3xjnpFKnO6XW1lqJ4HCosoJqEEEcDOSlhbmYeHuJsfVHCxFfpfd/fIG4ITiFI0Tkh2Fwr8FBZ+O
	mSpZuRiDO92IR8PU7mhL7zqagv+2FE9XfUDg0EraS5NXH0545RyOvEIuj+VuIPbuNefI95NxTEVbf
	lGhgKXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZWx-00EHka-8X; Tue, 06 Sep 2022 14:26:23 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxt-00Dzsd-2w; Tue, 06 Sep 2022 13:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472209; x=1694008209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvEYSO7lW++ymJ0bBLH7ZRL0Q9IiAhclprxNUtYU6Os=;
  b=QhcGXKdoUkO8rbN06j/WAXB23IoT+V1aRtaGlyX5jWZ8pNc/liURw06W
   diBGaLw/IG2yOsekGghYPMXlRsg9VmziXfqaMaqg4VlQ/qTh9pQaXNXvU
   sW9eBfvGEx8UJ6I7Cs5gHI4k6jF0MJSRlosAUi4InDd5D2Jas635WFYao
   KiFML5fNTQyVDU2981og9XsWiKbTFSDqNklYFr93qcionwJyJaBYt4cnS
   qdnykHi1bKD6ay+duMsklXlOmOVBJ61zcLo8tN5/RtzeSoQZbzVL5KLyD
   ETUPj35F1iNUSTq/2MXl4WryVwPd7itlUTm3/h8Fp0Y7aFVtmFpWQfoqU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276990324"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="276990324"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="859264825"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2022 06:50:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C9088725; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
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
Subject: [PATCH v3 10/11] leds: syscon: Get rid of custom led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:50:03 +0300
Message-Id: <20220906135004.14885-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065009_304586_90DA7531 
X-CRM114-Status: GOOD (  14.56  )
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
 drivers/leds/leds-syscon.c | 49 ++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index 7eddb8ecb44e..e38abb5e60c1 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -61,7 +61,8 @@ static int syscon_led_probe(struct platform_device *pdev)
 	struct device *parent;
 	struct regmap *map;
 	struct syscon_led *sled;
-	const char *state;
+	enum led_default_state state;
+	u32 value;
 	int ret;
 
 	parent = dev->parent;
@@ -86,34 +87,30 @@ static int syscon_led_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "mask", &sled->mask))
 		return -EINVAL;
 
-	state = of_get_property(np, "default-state", NULL);
-	if (state) {
-		if (!strcmp(state, "keep")) {
-			u32 val;
-
-			ret = regmap_read(map, sled->offset, &val);
-			if (ret < 0)
-				return ret;
-			sled->state = !!(val & sled->mask);
-		} else if (!strcmp(state, "on")) {
-			sled->state = true;
-			ret = regmap_update_bits(map, sled->offset,
-						 sled->mask,
-						 sled->mask);
-			if (ret < 0)
-				return ret;
-		} else {
-			sled->state = false;
-			ret = regmap_update_bits(map, sled->offset,
-						 sled->mask, 0);
-			if (ret < 0)
-				return ret;
-		}
+	init_data.fwnode = of_fwnode_handle(np);
+
+	state = led_init_default_state_get(init_data.fwnode);
+	switch (state) {
+	case LEDS_DEFSTATE_ON:
+		ret = regmap_update_bits(map, sled->offset, sled->mask, sled->mask);
+		if (ret < 0)
+			return ret;
+		sled->state = true;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		ret = regmap_read(map, sled->offset, &value);
+		if (ret < 0)
+			return ret;
+		sled->state = !!(value & sled->mask);
+		break;
+	default:
+		ret = regmap_update_bits(map, sled->offset, sled->mask, 0);
+		if (ret < 0)
+			return ret;
+		sled->state = false;
 	}
 	sled->cdev.brightness_set = syscon_led_set;
 
-	init_data.fwnode = of_fwnode_handle(np);
-
 	ret = devm_led_classdev_register_ext(dev, &sled->cdev, &init_data);
 	if (ret < 0)
 		return ret;
-- 
2.35.1


