Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743CBC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1QxN/MVkmbtPgFiMVZumDBjcbxGPv7gkFEK3COMvWI=; b=3ywoQjxYqaiMrCDxKj2Fbp5uU7
	eh9Nyzp//iLdU3fbT+s0aiAOnDwqPpHYk654AGmt/e7KylNAgGy778+uFuBo6txqHY0/0dbVOmfCX
	oBnH93Owo95lo0xHr7CmCF7Dq8NtgagrSwM74vd8wNubx3PhNRw/uyWLnqK5nWnICp+8fy2T2XNHv
	nPSLy8rUuzEONIlOHZ4pdfo+noE6NUKhVgE/V7oNpk6+QhpOK1NX8PAgNnml1lR6tLjJy2p0nf405
	GFGAluzSAetQ12MF4Qp7UffDj6oMin44A7lAFl766uN0tSlXu5v34/tar3980vliJDSBeEZVod+7D
	xCip56wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCk5f-002tjf-4x; Tue, 03 Jan 2023 16:24:39 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh5s-001R3F-Po; Tue, 03 Jan 2023 13:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751560; x=1704287560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvEYSO7lW++ymJ0bBLH7ZRL0Q9IiAhclprxNUtYU6Os=;
  b=TEbDYR+oV1uojHKgWUEqXAOt51pjF6ap4o8qCwFTaGCpZj/n6Bj+MH27
   hf1syD06MQ0/o1O5xxBM5k2ALNkN7stv4inr2rLFalJtmzFUxkuTW+wc5
   uOblp9lFvznKO9HZAoAHn0/ukQAGKJFS30TlRrsbS8Lf4NsCje7s7JFJD
   UIgYo2RvtwZ+ICCTbg13D2rk+BedEFYYfnHlIWxP6JZAz3oqNsbMgCF3Y
   0bG9oyde7cuG+7qfxW8hIgWxwvewXqGZULqR4yv2eNGLpJBndOGmhIVLF
   xjAUDk6ce+5nfr9/MaHr47LYZtSInnRuG9ikWQio39JRfa+05KVW78SE0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="322887963"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="322887963"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="685397946"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="685397946"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 05:12:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E24663BC; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
Subject: [PATCH v4 10/11] leds: syscon: Get rid of custom led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:55 +0200
Message-Id: <20230103131256.33894-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051241_313415_AA58A10B 
X-CRM114-Status: GOOD (  14.73  )
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


