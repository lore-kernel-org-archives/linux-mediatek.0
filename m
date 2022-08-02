Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BF5C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 21:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IR6Jzv3DBB4LPS3wuwZKNqFeWntYIN0Fg0BDCjTo7Pc=; b=Is0c38xSAINl/H0l7aSG9ptty7
	aO3LID8nFfyz1xP3+9DFe9HrZXf7OWVuVlPyEJ8thzCJ3pQ8lUnZTHYOq97c1UtJExqEIgRt8B3Lh
	9Al+HeBTp57sAyWKtfTPv0FSkuAyEWjZEtI/vXmuKcK6+t7VgCpHF/2ypLKz4sX67nHOyF+TEvikD
	bcTmC8qVFFB8wIqnz/eHW0dON/gza1hOB3ef5x7sPOqD8jm9oGAqgeMX8Lv7oz9efJq25B7IQEvWQ
	0qU8adZ8tYCM8ujnIJfiF3CQMAyGjN5368AZidN00VclGzEcQfYxqLMqBrf6eS7Q+gH/ZHIe5UpzS
	aPmodw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIzP2-00HZJg-Py; Tue, 02 Aug 2022 21:26:12 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIzOi-00HZ9A-Ug; Tue, 02 Aug 2022 21:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659475554; x=1691011554;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OunVwjFJhL1Q/tamMZepaupTRMyzPHvHM30RUkvfBQg=;
  b=lchJ1HY0c+41VXiy4HoAvbO5YbKzFH16ZgckKATSsyoMkycrUh5kLBw9
   JMMPNG8KhJg8+hZ9t2W+Qnl7oHFvWYGzGqkhrEdr76g7YMy1Ij6QAmqgz
   8Lbxv+xiVLbO4pNWAsDomtnySFt3y9Rv4nBRwDanFDBZRrPQNP/LYmKHi
   eop+DXMA9iI77dPamdc0VCqGbxVDoF/5T5gAu9Yxgekh9yXxx1ug311WL
   sSyeL5aBld7zuGhunvWxJezYM3hgmFPXanJfwHniK1BtPcQ3avHOj4B3N
   fBMvwj5lngvkLf+xlShcSPPMfHxXYjF7yprO+8FcU13FJgRepNoBczMSA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="290738011"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="290738011"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 14:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="606163580"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 02 Aug 2022 14:25:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A8D44F7; Wed,  3 Aug 2022 00:25:40 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/1] leds: mt6323: Get rid of custom led_init_default_state_get()
Date: Wed,  3 Aug 2022 00:25:37 +0300
Message-Id: <20220802212537.7122-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_142554_531081_AA66E54D 
X-CRM114-Status: GOOD (  13.53  )
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


