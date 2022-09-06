Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A645ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR6Jzv3DBB4LPS3wuwZKNqFeWntYIN0Fg0BDCjTo7Pc=; b=4mZmeqUArb9lgStt5iLpLH8Vmu
	YyMa/k1Ddbtj7yEekHGx1xXQ0SuMnjYoegmvuec2uIgxkDrEV9eKl2MCp29MIkcVyo6vKe1Ieit9x
	sVQZfU8W1r9cBGVKFJ2l5fMvFLuIjj69qKcrC3dRyE643CEFgsq531uElUNfRYUOTZBpsDIYaSJAz
	iRcx3nMA7zd97IM/dYAEPz6rvyQUITxhQCtNuufuY7c/uqlRY5k+9w3Ct9sfjLzUBCVbBY0hvsitG
	ow9OCiEN+EhJY8f7W2ocUouGKaKsEJthrSx2bZxNtlal3LcO8pEoS9iu2JFVUDSdhSp+kWoxPT4Rw
	BdTZhqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZX6-00EHq6-AS; Tue, 06 Sep 2022 14:26:32 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxr-00Dzrm-E2; Tue, 06 Sep 2022 13:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472207; x=1694008207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OunVwjFJhL1Q/tamMZepaupTRMyzPHvHM30RUkvfBQg=;
  b=PVAY6PhECevtaoVXXdXR/OubRwP2sN7vKsil8Y2CVD18zr/6xu6OQveY
   QTEgCOczSOQDvs3DSKvP7K1hVt2G3s5eT7Uo0EOZe66fBhdTr65D1Sium
   P9Yo5xRQuHEwo+wqMIEaGXXu7evQQcn5Kf7uH2Sjvw1CaM4QYbOQNZUS1
   vOVamzJxpI4A/BSkL9AeKymF2e9gI/3EPggNRg7KCl8wmTmi4wEbpCla3
   5L9kE0nkTNHGmfiyj/9nvdayJWHPkphb27FIIeqgABG3KRBuZ0iNapJIC
   YnyxQvyyoOkioBrJvs90JrrCZvqni2caemKa9MbhYqIeK6lyw0ZYPc4Vu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="297908833"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="297908833"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="717702934"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2022 06:50:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 923FE5E4; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
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
Subject: [PATCH v3 06/11] leds: mt6323: Get rid of custom led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:49:59 +0300
Message-Id: <20220906135004.14885-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065007_680371_68C6DF14 
X-CRM114-Status: GOOD (  15.95  )
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
 drivers/leds/leds-mt6323.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index f59e0e8bda8b..17ee88043f52 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -339,23 +339,23 @@ static int mt6323_led_set_dt_default(struct led_classdev *cdev,
 				     struct device_node *np)
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
-	const char *state;
+	enum led_default_state state;
 	int ret = 0;
 
-	state = of_get_property(np, "default-state", NULL);
-	if (state) {
-		if (!strcmp(state, "keep")) {
-			ret = mt6323_get_led_hw_brightness(cdev);
-			if (ret < 0)
-				return ret;
-			led->current_brightness = ret;
-			ret = 0;
-		} else if (!strcmp(state, "on")) {
-			ret =
-			mt6323_led_set_brightness(cdev, cdev->max_brightness);
-		} else  {
-			ret = mt6323_led_set_brightness(cdev, LED_OFF);
-		}
+	state = led_init_default_state_get(of_fwnode_handle(np));
+	switch (state) {
+	case LEDS_DEFSTATE_ON:
+		ret = mt6323_led_set_brightness(cdev, cdev->max_brightness);
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		ret = mt6323_get_led_hw_brightness(cdev);
+		if (ret < 0)
+			return ret;
+		led->current_brightness = ret;
+		ret = 0;
+		break;
+	default:
+		ret = mt6323_led_set_brightness(cdev, LED_OFF);
 	}
 
 	return ret;
-- 
2.35.1


