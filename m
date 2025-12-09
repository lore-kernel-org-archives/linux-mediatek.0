Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F65FD1CDC6
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wcg04tlEy44VWHetyJPa6vtgrSi9hQkJ8Wr3ssO16Z0=; b=sIyJ4KcK3xq05a
	OkoZJYMSeJtBg+ymUx7CiwoEE0PaKLg7Yj39Qvr5/uNq+D/arQ743yL4uaSylzk6jdE2UbAW8ZSYU
	xUGmDHb+cEXCQL094ODbp4j/YkmhQYqiTe+lOkDFiVhmi3+xF1JNeeT3RIZbB1bIO//x2+DkPUjGC
	FxGrC9ybk9vmKfHTpAcNegDwMKodEgkZNAn+2ziV6XLwKK3mu21xmDKpJiXwZBHAMRYn0S2DV6Ta5
	VKoyQyHWiS9RwGuH+j1XdCdMzqn+JgYTDdeYHgt6IyUmAlj6fE0uYjSBEQmeLwggMozsnC3s7oJJR
	yAcjaZeq5gu6zgTjXlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSt3J-0000000DzYg-3ZLC;
	Tue, 09 Dec 2025 08:26:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSt3G-0000000DzXz-0zuj;
	Tue, 09 Dec 2025 08:26:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 348EBC180DF;
	Tue,  9 Dec 2025 08:26:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E33E8606E2;
	Tue,  9 Dec 2025 08:26:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CD79102F0BF6;
	Tue,  9 Dec 2025 09:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765268783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wcg04tlEy44VWHetyJPa6vtgrSi9hQkJ8Wr3ssO16Z0=;
	b=fHyy3p3RXDvWm/ScQ573O19lBfA7i99dTtnNMKIgZo6j5P27qUaUjbhNTv08DA8IFMfpHy
	AgxHwoL/NW76FusS9uDh40xSgmfteD+0AIKiUzKm6X50QBH9u+CGQe/shfCBYk6cYKg2TZ
	8gN2cTM7D1TIOGI5CBJ9VtNcRcbmeEPaK0KH5amKURGuYmw9NosAHrgGe3H35kv5rwXRKw
	4FLoSOslR05puLB4/PTfDmvtHxQZ+eNY+xwyZu7eIBJfZyxeM1KAbSzgzSDiYTjCGWaCLA
	VyDhDTs5Dy0D0lluZeF/pIm4ZgCjPNF9eHgaCtNllGMYqa2jowZM4WLyZc41kQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH v2 0/2] iio: inkern: Use namespaced exports
Date: Tue, 09 Dec 2025 09:25:54 +0100
Message-Id: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLdN2kC/42NQQ6CMBAAv0J6dk13gRA8+Q/DoZRFNkpLWiQYw
 t+t+AGPM4eZTUUOwlFdsk0FXiSKdwnolCk7GHdnkC6xIk0lIlUg4kHcg4ODV2RwZuQ4Gcsd8Dr
 5MEcosLe6JsrbklXqTIF7WY/HrUk8SJx9eB/LBb/2VyeNf9QXBITOYJ2XfaWpyK+t9/NT3Nn6U
 TX7vn8Avu6Bn9QAAAA=
X-Change-ID: 20251127-iio-inkern-use-namespaced-exports-41fc09223b5e
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, 
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hansg@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Matheus Castello <matheus@castello.eng.br>, 
 Saravanan Sekar <sravanhome@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_002630_951388_16F8944C 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Hello everyone,

This is version two of my series which introduces namespaced exports for
the IIO consumer API.

Best Regards,

Romain

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
Changes in v2:
- Separated out ds4424 changes.
- Improved commit descriptions.
- Link to v1: https://lore.kernel.org/r/20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com

---
Romain Gantois (2):
      iio: dac: ds4424: drop unused include IIO consumer header
      iio: inkern: Use namespaced exports

 drivers/extcon/extcon-adc-jack.c                |  1 +
 drivers/hwmon/iio_hwmon.c                       |  1 +
 drivers/hwmon/ntc_thermistor.c                  |  1 +
 drivers/iio/adc/envelope-detector.c             |  1 +
 drivers/iio/afe/iio-rescale.c                   |  1 +
 drivers/iio/buffer/industrialio-buffer-cb.c     |  1 +
 drivers/iio/buffer/industrialio-hw-consumer.c   |  1 +
 drivers/iio/dac/ad8460.c                        |  1 +
 drivers/iio/dac/dpot-dac.c                      |  1 +
 drivers/iio/dac/ds4424.c                        |  1 -
 drivers/iio/inkern.c                            | 54 ++++++++++++-------------
 drivers/iio/light/cm3605.c                      |  1 +
 drivers/iio/light/gp2ap002.c                    |  1 +
 drivers/iio/multiplexer/iio-mux.c               |  1 +
 drivers/iio/potentiostat/lmp91000.c             |  1 +
 drivers/input/joystick/adc-joystick.c           |  1 +
 drivers/input/keyboard/adc-keys.c               |  1 +
 drivers/input/touchscreen/colibri-vf50-ts.c     |  1 +
 drivers/input/touchscreen/resistive-adc-touch.c |  1 +
 drivers/phy/motorola/phy-cpcap-usb.c            |  1 +
 drivers/power/supply/ab8500_btemp.c             |  1 +
 drivers/power/supply/ab8500_charger.c           |  1 +
 drivers/power/supply/ab8500_fg.c                |  1 +
 drivers/power/supply/axp20x_ac_power.c          |  1 +
 drivers/power/supply/axp20x_battery.c           |  1 +
 drivers/power/supply/axp20x_usb_power.c         |  1 +
 drivers/power/supply/axp288_fuel_gauge.c        |  1 +
 drivers/power/supply/cpcap-battery.c            |  1 +
 drivers/power/supply/cpcap-charger.c            |  1 +
 drivers/power/supply/da9150-charger.c           |  1 +
 drivers/power/supply/generic-adc-battery.c      |  1 +
 drivers/power/supply/ingenic-battery.c          |  1 +
 drivers/power/supply/intel_dc_ti_battery.c      |  1 +
 drivers/power/supply/lego_ev3_battery.c         |  1 +
 drivers/power/supply/lp8788-charger.c           |  1 +
 drivers/power/supply/max17040_battery.c         |  1 +
 drivers/power/supply/mp2629_charger.c           |  1 +
 drivers/power/supply/mt6370-charger.c           |  1 +
 drivers/power/supply/qcom_smbx.c                |  1 +
 drivers/power/supply/rn5t618_power.c            |  1 +
 drivers/power/supply/rx51_battery.c             |  1 +
 drivers/power/supply/sc27xx_fuel_gauge.c        |  1 +
 drivers/power/supply/twl4030_charger.c          |  1 +
 drivers/power/supply/twl4030_madc_battery.c     |  1 +
 drivers/power/supply/twl6030_charger.c          |  1 +
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c        |  1 +
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c     |  1 +
 drivers/thermal/renesas/rzg3s_thermal.c         |  1 +
 drivers/thermal/thermal-generic-adc.c           |  1 +
 sound/soc/codecs/audio-iio-aux.c                |  1 +
 sound/soc/samsung/aries_wm8994.c                |  1 +
 sound/soc/samsung/midas_wm1811.c                |  1 +
 sound/soc/stm/stm32_adfsdm.c                    |  1 +
 53 files changed, 78 insertions(+), 28 deletions(-)
---
base-commit: 99fece7ab29c9654d7945312b275b527757ac4b3
change-id: 20251127-iio-inkern-use-namespaced-exports-41fc09223b5e

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


