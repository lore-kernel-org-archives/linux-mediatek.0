Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB0CC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR6Jzv3DBB4LPS3wuwZKNqFeWntYIN0Fg0BDCjTo7Pc=; b=SfU8IyI5LMyInU3HGCKn+FNFno
	UEH2vsCX1nrJPEBn7SH21lqFCd6yvp4ovhEGaPZtopaD6A6z0wVPMT1eZIwwOMvnUDl697wdb02BK
	9h/quH/PPLrHkNVCUV+jKM8iQ5ZCQIbIqs3t8YlObis9VwPBsgTwa8AZik1WFkY87bnYr2jOODwHI
	C1C8mNaqu6wOD4BqyDlMo3R4ufq5VtCk1GEMkGY+R/Ro7IWRpzLfqnWtfT931/TW03OeSu9Ef0Y0X
	GMUBzo62sLZXt5jPKti5f/b1RSwfMfPxZBHq3EeaguuxeYOXgTH0bDH7HlxsfTHWBXuMhT5MmXpEh
	WtT7vneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzfs-00GUSm-2l; Fri, 05 Aug 2022 15:55:44 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzZo-00GQLd-Ed; Fri, 05 Aug 2022 15:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659714568; x=1691250568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OunVwjFJhL1Q/tamMZepaupTRMyzPHvHM30RUkvfBQg=;
  b=RzkCwn+LJAI35cNKKjuaKnGSUAQaHauyGrjcwnlCFsjYpuVXRjh7fZqg
   vPn45ZYRUKQEd2X2yubyyyh55nGAm/MZutdPtjI/Jyltro3d44iEL6FYG
   SGhcSse+9mp2OAGNyaPKbabsdBUzestHmyRuDFH8W/TKXyjcLW+3n1+ZO
   TNtZTN2BGj0sxAf5Tu5dzeUGM3gKEur2KDq6Lr1QZDpkD9tMtkW+xOXDe
   2jMiWbMlzGnx29acSQiKBu2GBSMokEDGlF3uLz46EigKB4CAfktW2GqxY
   2dWvzcYfq9gul1trUWFbXBn8TnqJvmxxMvpqJs1c5Re6sLgtG1hMYjs/S
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="288988428"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="288988428"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 08:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="693037586"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2022 08:49:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C8674347; Fri,  5 Aug 2022 18:49:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Eddie James <eajames@linux.ibm.com>,
	Denis Osterland-Heim <Denis.Osterland@diehl.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 06/11] leds: mt6323: Get rid of custom led_init_default_state_get()
Date: Fri,  5 Aug 2022 18:49:02 +0300
Message-Id: <20220805154907.32263-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
References: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_084928_587908_C8F7E9CE 
X-CRM114-Status: GOOD (  15.02  )
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


