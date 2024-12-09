Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C64BE7717D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eNBtHB6kkOmYXQFsllHca9ynAId1rCAPXvReJ3swmI=; b=f7KYDSJOa1R73qcSwgUbO1hpgj
	8UexqXcbYTNcjhKVNTYM0pAXFIQQv7LEmy03RzVocPahTA6uuZklXcImDG1fiUumKQoKT0rYxuBll
	N4M7FU8ue97HI4geq9L1+gFl6YRHGBMJgpoEU11r6gmGCxcA5zxXC5DO8FMj5DNAz0V13B5fFh8j8
	k6TCCE+rRPZ+lE8KFW6ZYgbEgrIauRxz4EwKcvsMWkxeyH8M0xtVu+5bVlRHo5n0Be7fleshc4ipw
	Jf8WkC2qNj0XxaKJKg3d/kZQmbmJqSdPHQswqDLo2Aa8G5BHR96V4Eo1+q/7hnIbBafuEDzipMcAV
	L348QSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhAa-00000008ea1-1Rbr;
	Mon, 09 Dec 2024 17:03:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh7a-00000008df6-3HPh;
	Mon, 09 Dec 2024 17:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733763633;
	bh=ngbKgp+VugAMnTJfakPKgA9/ZcuGqv29bbcGUazCC9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qU/Zps7SNpOtgGeGpoNAgZKXrr2A1vsySgTauEmXfAO/oNrtJHcj616NESzgcRoJa
	 2tIoLKxA1fH3IrVYjavkmGyycJm60n9J2K3Tg7hv24TmJAGdMFQQz6rGljv9wy2hBO
	 UHwn2PqrFtewqO617PEBbaUcO6GXhMWjsIn9hbf7KKK7GSXdI+qPMzmWLf4Q8Ki7vX
	 M/qFvqa8Z+/wTlh+o4tx43UKz8p08RovKh6K63lpYsIrX9U7++gjVoBRNzDsAgjK5T
	 JQKJ/NAChkfZ7P+yeyiet4HncgSSyVcr8vXSeHKiMbHBSJp7d2vZAMFZDuZh5uvH8n
	 uR1J/rvnL6ctw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B053417E37C6;
	Mon,  9 Dec 2024 18:00:28 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 09 Dec 2024 14:00:03 -0300
Subject: [PATCH v2 2/5] thermal/drivers/mediatek/lvts: Disable Stage 3
 thermal threshold
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-mt8192-lvts-filtered-suspend-fix-v2-2-5b046a99baa9@collabora.com>
References: <20241209-mt8192-lvts-filtered-suspend-fix-v2-0-5b046a99baa9@collabora.com>
In-Reply-To: <20241209-mt8192-lvts-filtered-suspend-fix-v2-0-5b046a99baa9@collabora.com>
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
X-CRM114-CacheID: sfid-20241209_090034_966336_3DE1D283 
X-CRM114-Status: GOOD (  14.67  )
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
2.47.0


