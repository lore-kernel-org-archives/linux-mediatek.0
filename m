Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7B6FEDA07
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 18:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jITvgy6W9V0ZjL2HN2g4X8oAqibIQBDVRpwgqXTuyEY=; b=fwTDENAeciPAiGhWfdaFzJJGBo
	1kVe5uteW6/9ZuzlPShqzVrA4eOORzD+C0dDA6MO3ShO4QlSnWtXb+RgjQR3TGhmAEO0XdyFVWwyF
	N8cZaJSCbLYW89Lg22BjirX62jS43F85AyIzzdz6FqJAC6SZNyLE3em4/4WhcXf0u0Jmyies2e3co
	gYxPP7l2TmmhVAvrwqlHfKfqA4FgNtMQprCKqsUSPrXyYc1PJm8/Z0/Kfit/ta+py/1kBZ9Nt1nhF
	7MIHwIB4yg6XxGpqsipxqaTV/UZDxOLbT15qrghQcq8FRPSH4bbPfj/Kn0lmHCLFIYHiL2fjutQ2Q
	StPLhcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZRS-0000000751E-3uVI;
	Tue, 17 Mar 2026 18:46:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZRP-000000074xG-2ASY
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 18:46:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43b48ac2727so1430473f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773213; x=1774378013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jITvgy6W9V0ZjL2HN2g4X8oAqibIQBDVRpwgqXTuyEY=;
        b=ImHZkx4GJLq141J/aJ+iZtibB7IPNRe6vouAqPVc3ODS3PVduitP+zfblchFYFWSVe
         Ntmhc/i2sg6QyjmnSWu0d115QDh3837KOYfokoY5TLiAjWiKq/xFysYOk72cWDieepdW
         IFWfLvotL7VsIHVrnEcW1paSJlLSmg5VXir+YS8Y31IYwLOMM+3hQU8785QxPNjoyE5F
         3Qxk3IfnliMd6+eIhzew5IXAote5fsajbOmyib+McvfaFuqTFqn77ofDs+BVHljuV8mX
         ObZHwBf86tf0Z1sI42l4kdCG7rsGTEo0KesW2gaGJbyPskS73nr95daxJCXHwIfMWZmW
         nc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773213; x=1774378013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jITvgy6W9V0ZjL2HN2g4X8oAqibIQBDVRpwgqXTuyEY=;
        b=Rds1mi9tzqVKG9BMGIQ+QR3cxNkJI1qPowO6heF80gN5pmHzB5vbrL1WdmVF4DJOx+
         dZs5w9pYqrOJmciTEGs4mP7INn2wxCLFW21jP+pNQDRbYcsoSV4s6YpedJf5M9jdfEBS
         GUSA1vau0r6l/76RpC5EuHdX5VeWjoYQdwm871nMYdeVaWAIF3tMRO0t77Jo6cNyDLVa
         oDuAsaElYBb9mDfru2YtcCLolmZYnbCJ4xa5ReWq+3LPWBqQs6EydaQ+9ANlFoKmzc6r
         CZ7ZHXI5spqyBc0a4WWpEocCN5OqGi82E2vQIGRlyCn9NQaylOODugwCMPrP1s2u45+5
         kqSw==
X-Gm-Message-State: AOJu0Ywtq36YJfY28jFVD2OE4AJA0mw9DIL99wenwkmL8+6psHyiN2PM
	S/h31e7/3tX+9RV78jlr7m4z8YyIe97jCNr4B4PxdcOX5718+0Dl4IXkAdvZUxQK
X-Gm-Gg: ATEYQzwEHVVr2eMu4yf+4yhisVmottFKIUdr16CT3f3ke99cUsDVZMHYEGSv+544qEh
	opwuNX0cnA5L7z2np80ymMBfMID3sS30ehE/mAONvJ78zLWwTg4pUopFdmsDhlH3wUcAezx7iL9
	7CkO2DxFb6gTtrTrKtGq576eSUz9PcxuFC8MuXETmnER7LeENiv76Ty3lbd5PGYnwKFczhMujh4
	5JyTBHCNQJRyUpAqzGJ6nwOyl3gKuYllz/l6qY9kjZQU0bCFHlqzagNO9hGGbc44PJuBfERrWSw
	w8axAcD/MARDIqOB15KHqEYQAE4XEv6j9v4Iqjs0yHVyeGZEi1UIK/C9aF/OXJLj5ki8TxIp791
	vSok8GM1YF1Tp6hgQYWG1orXjmnOdoE8X7VVefY/FVF3NJXn2rHApJm5I7t741/PwFEsFdfalAV
	ziIXrUsIDEcNykc1YLEQAMSWlvkL2YMg==
X-Received: by 2002:a05:600c:198c:b0:483:7980:4687 with SMTP id 5b1f17b1804b1-486f457232dmr11127115e9.17.1773773212953;
        Tue, 17 Mar 2026 11:46:52 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:46:52 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 8/9] pinctrl: mediatek: mt6397: Add support for MT6392 variant
Date: Tue, 17 Mar 2026 18:43:11 +0000
Message-ID: <20260317184507.523060-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114655_584549_2E99C445 
X-CRM114-Status: GOOD (  19.42  )
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

Add support for the MT6392 pinctrl device, which is very similar to
MT6397 with a handful of different property values and its own pins
definition.

Update the MT6397 driver to retrieve device data from the match table and
use it for driver init.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     | 37 ++++++++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h | 64 +++++++++++++++++++
 2 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 03d0f65d7bcc..8ba02e70595c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -12,10 +12,32 @@
 #include <linux/mfd/mt6397/core.h>
 
 #include "pinctrl-mtk-common.h"
+#include "pinctrl-mtk-mt6392.h"
 #include "pinctrl-mtk-mt6397.h"
 
 #define MT6397_PIN_REG_BASE  0xc000
 
+static const struct mtk_pinctrl_devdata mt6392_pinctrl_data = {
+	.pins = mtk_pins_mt6392,
+	.npins = ARRAY_SIZE(mtk_pins_mt6392),
+	.dir_offset = (MT6397_PIN_REG_BASE + 0x000),
+	.ies_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.smt_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.pullen_offset = (MT6397_PIN_REG_BASE + 0x020),
+	.pullsel_offset = (MT6397_PIN_REG_BASE + 0x040),
+	.dout_offset = (MT6397_PIN_REG_BASE + 0x080),
+	.din_offset = (MT6397_PIN_REG_BASE + 0x0a0),
+	.pinmux_offset = (MT6397_PIN_REG_BASE + 0x0c0),
+	.type1_start = 7,
+	.type1_end = 7,
+	.port_shf = 3,
+	.port_mask = 0x3,
+	.port_align = 2,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
+};
+
 static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 	.pins = mtk_pins_mt6397,
 	.npins = ARRAY_SIZE(mtk_pins_mt6397),
@@ -40,13 +62,24 @@ static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 static int mt6397_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397;
+	const struct mtk_pinctrl_devdata *data;
+
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENOENT;
 
 	mt6397 = dev_get_drvdata(pdev->dev.parent);
-	return mtk_pctrl_init(pdev, &mt6397_pinctrl_data, mt6397->regmap);
+	return mtk_pctrl_init(pdev, data, mt6397->regmap);
 }
 
 static const struct of_device_id mt6397_pctrl_match[] = {
-	{ .compatible = "mediatek,mt6397-pinctrl", },
+	{
+		.compatible = "mediatek,mt6392-pinctrl",
+		.data = &mt6392_pinctrl_data
+	}, {
+		.compatible = "mediatek,mt6397-pinctrl",
+		.data = &mt6397_pinctrl_data
+	},
 	{ }
 };
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
new file mode 100644
index 000000000000..e7241af28fdb
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PINCTRL_MTK_MT6392_H
+#define __PINCTRL_MTK_MT6392_H
+
+#include <linux/pinctrl/pinctrl.h>
+#include "pinctrl-mtk-common.h"
+
+static const struct mtk_desc_pin mtk_pins_mt6392[] = {
+	MTK_PIN(PINCTRL_PIN(0, "INT"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "INT"),
+		MTK_FUNCTION(5, "TEST_CK2"),
+		MTK_FUNCTION(6, "TEST_IN1"),
+		MTK_FUNCTION(7, "TEST_OUT1")
+	),
+	MTK_PIN(PINCTRL_PIN(1, "SRCLKEN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "SRCLKEN"),
+		MTK_FUNCTION(5, "TEST_CK0"),
+		MTK_FUNCTION(6, "TEST_IN2"),
+		MTK_FUNCTION(7, "TEST_OUT2")
+	),
+	MTK_PIN(PINCTRL_PIN(2, "RTC_32K1V8"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "RTC_32K1V8"),
+		MTK_FUNCTION(5, "TEST_CK1"),
+		MTK_FUNCTION(6, "TEST_IN3"),
+		MTK_FUNCTION(7, "TEST_OUT3")
+	),
+	MTK_PIN(PINCTRL_PIN(3, "SPI_CLK"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "SPI_CLK")
+	),
+	MTK_PIN(PINCTRL_PIN(4, "SPI_CSN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "SPI_CSN")
+	),
+	MTK_PIN(PINCTRL_PIN(5, "SPI_MOSI"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "SPI_MOSI")
+	),
+	MTK_PIN(PINCTRL_PIN(6, "SPI_MISO"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "SPI_MISO"),
+		MTK_FUNCTION(6, "TEST_IN4"),
+		MTK_FUNCTION(7, "TEST_OUT4")
+	),
+};
+
+#endif /* __PINCTRL_MTK_MT6392_H */
-- 
2.43.0


