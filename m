Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084A4EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rP7YSKrK7QOdq2cTVWIUBjQTkAd26boifb+rwrwHqp8=; b=LQGukWpDcQtJAimOmxgBBiepZK
	a3PD6gxlKHt5FT8Ezzs69vRCmxyoMjFzh4HDSJqYHfqeivdDDb20uN6rmxOtQMTe/9u1Sj7iibkdJ
	0Icnhb7Tk5ru4VNjWuVgbLq8HT1kW+uBsGuxbHUe2TP4IKgqyowtNuT4Z4Qt51n0HBHcEIokI2BFL
	S9Gz3M6wrgzgAG2L+QsPaEdE2TN++KMBZrfTgJHQ4xSc2akmTmhjSPDcNXgL8e0NGcjvpWgFlYlb3
	usG9vP0Oktb0SexCWpI0kCqq9SLez8WKAhnSzGj44gRu1Y+JFpovshA3U3nHqIwt+SMcc1Ci6qaV7
	3rUO5LbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR4N-0022BG-2O;
	Thu, 06 Jul 2023 15:38:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR4J-00226G-22;
	Thu, 06 Jul 2023 15:38:57 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B8D716606FD9;
	Thu,  6 Jul 2023 16:38:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688657934;
	bh=dJTr4Fra6XCnvElvkzfEUd21h3YHU5NwbyqkcQSlbsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRKd3WJg5vhbUiSg1waIao8H9x5rZYlMgv88Fx80VTSw6lixB1dGsJ0g91Lm8dIad
	 SfWcvn+fp14BnsOfutfnlEaga1h9J9RT3P/Rba50IW/jWelTIPP2Adn70kYDDtbxQM
	 gpbzPK9rqbCvqr6oEH5Ypioonhjiw8RZG32yG6JvI8SV1e+6PtQxnC3sN7H5KASAU1
	 QxVyyZ7DGe6+M5va+UXSVjtE+KirLJb2Br6eH6UoTzW1YMcJlkG+lJzN5RPI/4jmAa
	 ww3lssaBFps/NJKUCC0cgnlalmV69Xuhm64GUyRR+pgb0n7rl73++8gtWdHg74hGLt
	 enJp4Q8bam8Bw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 5/6] thermal/drivers/mediatek/lvts_thermal: Don't leave threshold zeroed
Date: Thu,  6 Jul 2023 11:37:36 -0400
Message-ID: <20230706153823.201943-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706153823.201943-1-nfraprado@collabora.com>
References: <20230706153823.201943-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_083855_809624_98158AB3 
X-CRM114-Status: GOOD (  15.09  )
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

The thermal framework might leave the low threshold unset if there
aren't any lower trip points. This leaves the register zeroed, which
translates to a very high temperature for the low threshold. The
interrupt for this threshold is then immediately triggered, and the
state machine gets stuck, preventing any other temperature monitoring
interrupts to ever trigger.

(The same happens by not setting the Cold or Hot to Normal thresholds
when using those)

Set the unused threshold to a valid low value. This value was chosen so
that for any valid golden temperature read from the efuse, when the
value is converted to raw and back again to milliCelsius, the result
doesn't underflow.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v3:
- Converted MINIMUM_THRESHOLD earlier to eliminate need for extra branch
- Fixed typo: MINIUM -> MINIMUM

Changes in v2:
- Added this commit

 drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index e6dd4d120e54..7552e1d59dc9 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -83,6 +83,8 @@
 
 #define LVTS_HW_SHUTDOWN_MT8195		105000
 
+#define LVTS_MINIMUM_THRESHOLD		20000
+
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
 static int coeff_b = LVTS_COEFF_B;
 
@@ -294,7 +296,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
 	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);
 	void __iomem *base = lvts_sensor->base;
-	u32 raw_low = lvts_temp_to_raw(low);
+	u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD);
 	u32 raw_high = lvts_temp_to_raw(high);
 
 	/*
@@ -306,11 +308,9 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 *
 	 * 14-0 : Raw temperature for threshold
 	 */
-	if (low != -INT_MAX) {
-		pr_debug("%s: Setting low limit temperature interrupt: %d\n",
-			 thermal_zone_device_type(tz), low);
-		writel(raw_low, LVTS_OFFSETL(base));
-	}
+	pr_debug("%s: Setting low limit temperature interrupt: %d\n",
+		 thermal_zone_device_type(tz), low);
+	writel(raw_low, LVTS_OFFSETL(base));
 
 	/*
 	 * High offset temperature threshold
-- 
2.41.0


