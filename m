Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD3BC6FA86
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB9RCZahTy8yJATnLOpF1pfodSkHXOFYZBuM0cS+Q/E=; b=pQfLhqmDSdMope5Vxxvtvj3Ha1
	cJGaqWFFQiTX9LygNFxWfg5Ul3t2le/k9vKJZiv5JH3b9X9p6booG7ys6iYW2l/oJDsii70+xZ7Xw
	a52ldReL38LyOM+hGidKcMmYw3ony3Q++algXWxsqg/5I1cAPB2Ka2httegj3+dXExHi/hvlAu6vL
	GIA5CTS8FsFmfndmrP1vMF+91laaljve2URF/L7lz4NjI0+gxw/NpbH4NFYl7Aww77HM2ckVxbQ5X
	VkezY95qwZqUUdTm5FJpvDzv/hF6cx730SUjqOyvpxgOo5Qi5lKL25yMMHLzVk7MfmFR07pz99FXw
	x34zcS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZWe-00EHZM-6D; Tue, 06 Sep 2022 14:26:04 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxq-00Dzqs-Ot; Tue, 06 Sep 2022 13:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472206; x=1694008206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WhGrjx6LzV2jk/LAfomo4zdb3Tdn1LBofxlORU1JDv0=;
  b=fyv/ZN0dJdALwLITnmVAFVZZsMFz0grqM4qUPkalxRv0THtaJGUUkkIG
   evB0rjRh7WC1zmlKm6QCIpULGiWyhsiZ5TKuXo8xkgXRhFDOnbKaaqVJo
   qyOclGqILlalbvb7bJd+9KdmFt0f9T4gbjP9yYt6lV16rc5fOFUbRlbf9
   iflLgn1COLLEN6kNNehFFZeH0qJBCvUyHxofnmSZV+q9q+uqku454Y7YH
   dRXqMfOmQ56GslsGeQGjLZdWPUuIRXWroMoVS6xfSPZUxnePhmc9zWtey
   h2UqmwKxJkuTVGsxqoZG6ihYa/3ZqGQbIy7RX2PSKD8nDhIUz+HFGf4oN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276334191"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="276334191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="614098830"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2022 06:50:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D6828781; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
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
Subject: [PATCH v3 11/11] net: dsa: hellcreek: Get rid of custom led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:50:04 +0300
Message-Id: <20220906135004.14885-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065006_875154_24DBFD3F 
X-CRM114-Status: GOOD (  13.67  )
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
Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/dsa/hirschmann/hellcreek_ptp.c | 45 ++++++++++++----------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/dsa/hirschmann/hellcreek_ptp.c b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
index b28baab6d56a..793b2c296314 100644
--- a/drivers/net/dsa/hirschmann/hellcreek_ptp.c
+++ b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
@@ -297,7 +297,8 @@ static enum led_brightness hellcreek_led_is_gm_get(struct led_classdev *ldev)
 static int hellcreek_led_setup(struct hellcreek *hellcreek)
 {
 	struct device_node *leds, *led = NULL;
-	const char *label, *state;
+	enum led_default_state state;
+	const char *label;
 	int ret = -EINVAL;
 
 	of_node_get(hellcreek->dev->of_node);
@@ -318,16 +319,17 @@ static int hellcreek_led_setup(struct hellcreek *hellcreek)
 	ret = of_property_read_string(led, "label", &label);
 	hellcreek->led_sync_good.name = ret ? "sync_good" : label;
 
-	ret = of_property_read_string(led, "default-state", &state);
-	if (!ret) {
-		if (!strcmp(state, "on"))
-			hellcreek->led_sync_good.brightness = 1;
-		else if (!strcmp(state, "off"))
-			hellcreek->led_sync_good.brightness = 0;
-		else if (!strcmp(state, "keep"))
-			hellcreek->led_sync_good.brightness =
-				hellcreek_get_brightness(hellcreek,
-							 STATUS_OUT_SYNC_GOOD);
+	state = led_init_default_state_get(of_fwnode_handle(led));
+	switch (state) {
+	case LEDS_DEFSTATE_ON:
+		hellcreek->led_sync_good.brightness = 1;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		hellcreek->led_sync_good.brightness =
+				hellcreek_get_brightness(hellcreek, STATUS_OUT_SYNC_GOOD);
+		break;
+	default:
+		hellcreek->led_sync_good.brightness = 0;
 	}
 
 	hellcreek->led_sync_good.max_brightness = 1;
@@ -344,16 +346,17 @@ static int hellcreek_led_setup(struct hellcreek *hellcreek)
 	ret = of_property_read_string(led, "label", &label);
 	hellcreek->led_is_gm.name = ret ? "is_gm" : label;
 
-	ret = of_property_read_string(led, "default-state", &state);
-	if (!ret) {
-		if (!strcmp(state, "on"))
-			hellcreek->led_is_gm.brightness = 1;
-		else if (!strcmp(state, "off"))
-			hellcreek->led_is_gm.brightness = 0;
-		else if (!strcmp(state, "keep"))
-			hellcreek->led_is_gm.brightness =
-				hellcreek_get_brightness(hellcreek,
-							 STATUS_OUT_IS_GM);
+	state = led_init_default_state_get(of_fwnode_handle(led));
+	switch (state) {
+	case LEDS_DEFSTATE_ON:
+		hellcreek->led_is_gm.brightness = 1;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		hellcreek->led_is_gm.brightness =
+				hellcreek_get_brightness(hellcreek, STATUS_OUT_IS_GM);
+		break;
+	default:
+		hellcreek->led_is_gm.brightness = 0;
 	}
 
 	hellcreek->led_is_gm.max_brightness = 1;
-- 
2.35.1


