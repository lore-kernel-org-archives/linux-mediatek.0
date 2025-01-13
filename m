Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFDE7719F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZHtXnVNZ8PBeFRS1yAA34RSuGFAwsO2zMrZT3EubUc=; b=1VIjwBXzVGgxOfNPoxrfWOKmG3
	02D8FF7bL19r8WmwSJs/1+2B/JZxAkPKFFSeX9AsKgMxbph2J+AZH4ZFgbwIi9rQT6/60sgX+qGcQ
	Drjsg0egYOmeSolLLWBghEXqNIjkHF+nGlofrf8tGU6+A4GJDTaps6wW8F7X6akENL8gdHWVu79B8
	xthoxi1rv5JukU5t98U6iR1FAmxfWwM+fv3Uo+AJxnKfm1HEsBIyeQIU+MWpbi8Oj1qj1NwS5nqm9
	hUZO5f02m6g0FIOxdi/w44cvvykbzSM1k/knxh622WOUT8Q1z7ae+AgWSjq/9cezhhtV2jRB3OKJn
	d7uq0RHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKXg-00000005FmG-437F;
	Mon, 13 Jan 2025 13:31:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKU9-00000005F4g-4C6G;
	Mon, 13 Jan 2025 13:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736774884;
	bh=vEIDXIbkeYyVL5RhjAFFnU72bWHMybRsLnqNbiv0BGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PNLbx066YYR9h8fsaS05opAPQMNgc7SJjwUPjniLx3laMm0UkMVLB3rQPEeGddJXN
	 KGm80CvrsYFntNwBancnn5jBNDJWeBaVdRykgo3Jk9XCt0THJvGTrlOS/iDAhFODR3
	 TdZ2Y+uUFXYHGMGYG9ckAHJerYxZvUAz3w9gCHOuJH0SFPqSlMQhLZrGF1SP7EAyeq
	 WaeKE3CQ5HyOcpVBUR9rtK+Nk1W0fU7zvvmYVQIiUnsuO7/LfabbwyABSNyGk12C9a
	 UUepPXJ4r8lXIAl8IcOGRA9BEj4jTk8M0yqEny7ZzL5v7/iqukHYs6+BlTgJw+ZVPE
	 Fa5oy6+HTpWZg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9392517E0E9D;
	Mon, 13 Jan 2025 14:28:00 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 13 Jan 2025 10:27:13 -0300
Subject: [PATCH RESEND v2 2/5] thermal/drivers/mediatek/lvts: Disable Stage
 3 thermal threshold
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250113-mt8192-lvts-filtered-suspend-fix-v2-2-07a25200c7c6@collabora.com>
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
In-Reply-To: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_052806_181281_C6BE3D63 
X-CRM114-Status: GOOD (  14.40  )
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

The Stage 3 thermal threshold is currently configured during
the controller initialization to 105 Celsius. From the kernel
perspective, this configuration is harmful because:
* The stage 3 interrupt that gets triggered when the threshold is
  crossed is not handled in any way by the IRQ handler, it just gets
  cleared. Besides, the temperature used for stage 3 comes from the
  sensors, and the critical thermal trip points described in the
  Devicetree will already cause a shutdown when crossed (at a lower
  temperature, of 100 Celsius, for all SoCs currently using this
  driver).
* The only effect of crossing the stage 3 threshold that has been
  observed is that it causes the machine to no longer be able to enter
  suspend. Even if that was a result of a momentary glitch in the
  temperature reading of a sensor (as has been observed on the
  MT8192-based Chromebooks).

For those reasons, disable the Stage 3 thermal threshold configuration.

Cc: stable@vger.kernel.org
Reported-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
Closes: https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/
Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index a1a438ebad33c1fff8ca9781e12ef9e278eef785..0aaa44b734ca43e6abfd97b2ca4ce34dc6f15826 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -65,7 +65,7 @@
 #define LVTS_HW_FILTER				0x0
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
-#define LVTS_MONINT_CONF			0x8300318C
+#define LVTS_MONINT_CONF			0x0300318C
 
 #define LVTS_MONINT_OFFSET_SENSOR0		0xC
 #define LVTS_MONINT_OFFSET_SENSOR1		0x180
@@ -91,8 +91,6 @@
 #define LVTS_MSR_READ_TIMEOUT_US	400
 #define LVTS_MSR_READ_WAIT_US		(LVTS_MSR_READ_TIMEOUT_US / 2)
 
-#define LVTS_HW_TSHUT_TEMP		105000
-
 #define LVTS_MINIMUM_THRESHOLD		20000
 
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
@@ -145,7 +143,6 @@ struct lvts_ctrl {
 	struct lvts_sensor sensors[LVTS_SENSOR_MAX];
 	const struct lvts_data *lvts_data;
 	u32 calibration[LVTS_SENSOR_MAX];
-	u32 hw_tshut_raw_temp;
 	u8 valid_sensor_mask;
 	int mode;
 	void __iomem *base;
@@ -837,14 +834,6 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
 		 */
 		lvts_ctrl[i].mode = lvts_data->lvts_ctrl[i].mode;
 
-		/*
-		 * The temperature to raw temperature must be done
-		 * after initializing the calibration.
-		 */
-		lvts_ctrl[i].hw_tshut_raw_temp =
-			lvts_temp_to_raw(LVTS_HW_TSHUT_TEMP,
-					 lvts_data->temp_factor);
-
 		lvts_ctrl[i].low_thresh = INT_MIN;
 		lvts_ctrl[i].high_thresh = INT_MIN;
 	}
@@ -919,7 +908,6 @@ static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
 	 *         10 : Selected sensor with bits 19-18
 	 *         11 : Reserved
 	 */
-	writel(BIT(16), LVTS_PROTCTL(lvts_ctrl->base));
 
 	/*
 	 * LVTS_PROTTA : Stage 1 temperature threshold
@@ -932,8 +920,8 @@ static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
 	 *
 	 * writel(0x0, LVTS_PROTTA(lvts_ctrl->base));
 	 * writel(0x0, LVTS_PROTTB(lvts_ctrl->base));
+	 * writel(0x0, LVTS_PROTTC(lvts_ctrl->base));
 	 */
-	writel(lvts_ctrl->hw_tshut_raw_temp, LVTS_PROTTC(lvts_ctrl->base));
 
 	/*
 	 * LVTS_MONINT : Interrupt configuration register

-- 
2.47.1


