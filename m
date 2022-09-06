Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CA8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx2FQRVWWgw6WPYO+fmeKD7FqE4cN7FhKtaqgCAtLVA=; b=sSrD/x9gZPh4DwdIYt3kthj1Et
	U40Pf03xie+OokM4wnITw8aOnMgFt8RiFVqAkTEa2sHTcpgh4F+xtwVSn/f/+oPlUQCVNuiMIegAZ
	xQRDvQ+GUGVoStxPKguSZohDK6X6wN/ryKanrnERfh0MA4eiogACCojcjQSms4Sldz1eKZXhA6STf
	Cgt0tv6r0IBL3cemEyK5bAK9NuJGP7jzIDPdA28fu75In12s6OXvuYZp9WD8ZhMRlkuXubEVgfI8F
	nTGWhBZ39VmecxJU+wPBKdkBJRh6+J5Da933G9hsmYQWajfj/zCOoAjDPCjnRqJgryjf0uWLjYBNC
	UKzFl/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZZK-00EIwy-FJ; Tue, 06 Sep 2022 14:28:50 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYy0-00Dzsd-Bu; Tue, 06 Sep 2022 13:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472216; x=1694008216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6f8YWbifkD3gaKrThtIFn69fcF7c6kePJ4btJm1Xl8s=;
  b=fRq9TRuxMNulBiWKaR9GYlXKwV6hXjtkD029STmaDBH25hXGMxjrBNBl
   JRNr0p9PJBRnQSjMgDs6gqfhxLoa38RZfnQdAB4mIGZFon97sCov2BJ+3
   kGx1jkoznz5D+DPFZe//Su1zdgTiek1Bc2+S696VqQypFJnARTya8HRjp
   i7YDGSniYzCi1PozJi3CsfYpEQ/suR/Mhtul3GTcefD9eilC58hqQwRCV
   qizlrD9Q5zVEFQJCvlG1pYg1VSvr+NzWuffVZTGVX7WyVLThZew7G5cBp
   HjJh5d49WdDtE0tOUSqDaMd/j4/ef0uT5q/eUelEz6hPF0x6z5AEnedLy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276990327"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="276990327"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="859264824"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2022 06:50:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9E9636CD; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
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
Subject: [PATCH v3 07/11] leds: mt6360: Get rid of custom led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:50:00 +0300
Message-Id: <20220906135004.14885-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065016_680506_545652C6 
X-CRM114-Status: GOOD (  14.47  )
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
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/leds/flash/leds-mt6360.c | 38 +++++---------------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index e1066a52d2d2..1af6c5898343 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -71,10 +71,6 @@ enum {
 #define MT6360_STRBTO_STEPUS		32000
 #define MT6360_STRBTO_MAXUS		2432000
 
-#define STATE_OFF			0
-#define STATE_KEEP			1
-#define STATE_ON			2
-
 struct mt6360_led {
 	union {
 		struct led_classdev isnk;
@@ -84,7 +80,7 @@ struct mt6360_led {
 	struct v4l2_flash *v4l2_flash;
 	struct mt6360_priv *priv;
 	u32 led_no;
-	u32 default_state;
+	enum led_default_state default_state;
 };
 
 struct mt6360_priv {
@@ -405,10 +401,10 @@ static int mt6360_isnk_init_default_state(struct mt6360_led *led)
 		level = LED_OFF;
 
 	switch (led->default_state) {
-	case STATE_ON:
+	case LEDS_DEFSTATE_ON:
 		led->isnk.brightness = led->isnk.max_brightness;
 		break;
-	case STATE_KEEP:
+	case LEDS_DEFSTATE_KEEP:
 		led->isnk.brightness = min(level, led->isnk.max_brightness);
 		break;
 	default:
@@ -443,10 +439,10 @@ static int mt6360_flash_init_default_state(struct mt6360_led *led)
 		level = LED_OFF;
 
 	switch (led->default_state) {
-	case STATE_ON:
+	case LEDS_DEFSTATE_ON:
 		flash->led_cdev.brightness = flash->led_cdev.max_brightness;
 		break;
-	case STATE_KEEP:
+	case LEDS_DEFSTATE_KEEP:
 		flash->led_cdev.brightness =
 			min(level, flash->led_cdev.max_brightness);
 		break;
@@ -760,25 +756,6 @@ static int mt6360_init_flash_properties(struct mt6360_led *led,
 	return 0;
 }
 
-static int mt6360_init_common_properties(struct mt6360_led *led,
-					 struct led_init_data *init_data)
-{
-	const char *const states[] = { "off", "keep", "on" };
-	const char *str;
-	int ret;
-
-	if (!fwnode_property_read_string(init_data->fwnode,
-					 "default-state", &str)) {
-		ret = match_string(states, ARRAY_SIZE(states), str);
-		if (ret < 0)
-			ret = STATE_OFF;
-
-		led->default_state = ret;
-	}
-
-	return 0;
-}
-
 static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
 {
 	int i;
@@ -852,10 +829,7 @@ static int mt6360_led_probe(struct platform_device *pdev)
 
 		led->led_no = reg;
 		led->priv = priv;
-
-		ret = mt6360_init_common_properties(led, &init_data);
-		if (ret)
-			goto out_flash_release;
+		led->default_state = led_init_default_state_get(child);
 
 		if (reg == MT6360_VIRTUAL_MULTICOLOR ||
 		    reg <= MT6360_LED_ISNKML)
-- 
2.35.1


