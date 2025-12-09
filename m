Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC43D1CDC6
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m78Ml2oAhSe1A01ovJ9j5MEiBZnMD25VYhSFXxFMl0A=; b=kQ8Puy8f3rjEVAKMeiVH2SDHq8
	+4AaLnHW3cojebn0h+liclsE8NJNfi2tCUBABNIzLzafySbsLGspBRkti13CbSuQEC684t0sfAQUJ
	rLkyqQTbHMXjWYm4Rvqr/vLx7FT7bToEq21nkflxhvIdUOOiNOSNITOan6fr9hwi1d0zejKMrNBoU
	kXHLd66rkWVGEYHPxEbq2Dwp8Vb8z/P5fKfStg5lzjzjemOSZL9brI3jQ8coZuXI6hgq5yUe7zPjZ
	4Az2WqaueZT+JNYK+YGnA9mP+KNfgS116AqSH33+59AOjC8CDhZyqc2osZgoo7IlgYe/aXzTriv15
	UwowsRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSt3Q-0000000DzcA-0KgA;
	Tue, 09 Dec 2025 08:26:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSt3N-0000000Dza8-3Q3Y
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Dec 2025 08:26:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C9E11A2062;
	Tue,  9 Dec 2025 08:26:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10B33606E2;
	Tue,  9 Dec 2025 08:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DF9B11930218;
	Tue,  9 Dec 2025 09:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765268791; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m78Ml2oAhSe1A01ovJ9j5MEiBZnMD25VYhSFXxFMl0A=;
	b=Kr2rj9dt3DwTQ0zXnGEE+qsFaAgzY22oPRHZfzZBZ3E97W635VYnUkjJca17PQJdRtFE67
	VBgYxJ5xssTJmoBCoeP2s+zIq9bSkrcln5YBJoTtsIDGhQklcD5weke9rOtBYidAzj4SYF
	PPD5ANfHIabK+a4AWo6jZWCm0Q79+1reut4xjAlJ9njk4jiwUPj4u63TjnBhgM7mni0HDk
	qjAposkcjYmzbXslhn9p3TfrAlTu0DDNPxKWrv00AP3M/YiXWLwkz0XKLm3jyuuYP2T9Hu
	lZt+0ZRf5m96Nm4l9rODhUNkUILQmqRnnFBzrpf7wMWd99YRs2yqIqzHvkyDYQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 09 Dec 2025 09:25:55 +0100
Subject: [PATCH v2 1/2] iio: dac: ds4424: drop unused include IIO consumer
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_002637_980760_D130F996 
X-CRM114-Status: GOOD (  11.23  )
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

To prepare for the introduction of namespaced exports for the IIO consumer
API, remove this include directive which isn't actually used by the driver.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/iio/dac/ds4424.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
index a8198ba4f98a..6dda8918975a 100644
--- a/drivers/iio/dac/ds4424.c
+++ b/drivers/iio/dac/ds4424.c
@@ -14,7 +14,6 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/driver.h>
 #include <linux/iio/machine.h>
-#include <linux/iio/consumer.h>
 
 #define DS4422_MAX_DAC_CHANNELS		2
 #define DS4424_MAX_DAC_CHANNELS		4

-- 
2.51.2


