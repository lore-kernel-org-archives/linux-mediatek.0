Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AADFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgqSX9mc8b42YmJyC2mAPluAXbVfXkeG46/b1/ra+4k=; b=Ro8giURKw8Z4Re
	vVQlgSgycbCVmag2vG7sxlJ1BLrFT5wYSRbomtjdCmgqZQSP8WgfkV4O/fPnOYqhX4N5hX4iBFNjD
	Z9tyR/hg8KNJU27oUt8mOeI+QdhwHD58bQe2+L2RZP7f1EPn3j9ECJ/PDJ8yBi/gHuIrMqsgBgx9J
	aRjgiyZ7oihKLIHahiCpKrrQ56UANiun90wrHaZsHcogY67rVw68E5hRmpZnJzeO6lF7F/Nvpiks+
	8LuLuMUesc8BumJw60Hniey1UrN3PpcXMtJb4Kt2EW82lgOgQXkMnRzMlSqUFFib5lMgdaePZ29kx
	rAIYtw6zZtbWfeJmXixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhH8-00AnKt-Fp; Thu, 17 Feb 2022 13:56:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhBh-00AkbA-MD; Thu, 17 Feb 2022 13:51:15 +0000
X-UUID: ead4aaee6f0a4aad9831fab99302f7ce-20220217
X-UUID: ead4aaee6f0a4aad9831fab99302f7ce-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 674211240; Thu, 17 Feb 2022 06:51:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 05:42:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 21:42:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:42:22 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [v2 11/17] ASoC: mediatek: mt8186: support gpio control in platform
 driver
Date: Thu, 17 Feb 2022 21:41:59 +0800
Message-ID: <20220217134205.15400-12-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_055113_767247_DF358D50 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch add gpio control for all audio interface separately.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 210 ++++++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h |  19 ++
 2 files changed, 229 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
new file mode 100644
index 000000000000..6faec5c95bf3
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8186-afe-gpio.c  --  Mediatek 8186 afe gpio ctrl
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+#include <linux/gpio.h>
+#include <linux/pinctrl/consumer.h>
+
+#include "mt8186-afe-common.h"
+#include "mt8186-afe-gpio.h"
+
+struct pinctrl *aud_pinctrl;
+
+enum mt8186_afe_gpio {
+	MT8186_AFE_GPIO_CLK_MOSI_OFF,
+	MT8186_AFE_GPIO_CLK_MOSI_ON,
+	MT8186_AFE_GPIO_CLK_MISO_OFF,
+	MT8186_AFE_GPIO_CLK_MISO_ON,
+	MT8186_AFE_GPIO_DAT_MISO_OFF,
+	MT8186_AFE_GPIO_DAT_MISO_ON,
+	MT8186_AFE_GPIO_DAT_MOSI_OFF,
+	MT8186_AFE_GPIO_DAT_MOSI_ON,
+	MT8186_AFE_GPIO_I2S0_OFF,
+	MT8186_AFE_GPIO_I2S0_ON,
+	MT8186_AFE_GPIO_I2S1_OFF,
+	MT8186_AFE_GPIO_I2S1_ON,
+	MT8186_AFE_GPIO_I2S2_OFF,
+	MT8186_AFE_GPIO_I2S2_ON,
+	MT8186_AFE_GPIO_I2S3_OFF,
+	MT8186_AFE_GPIO_I2S3_ON,
+	MT8186_AFE_GPIO_TDM_OFF,
+	MT8186_AFE_GPIO_TDM_ON,
+	MT8186_AFE_GPIO_PCM_OFF,
+	MT8186_AFE_GPIO_PCM_ON,
+	MT8186_AFE_GPIO_GPIO_NUM
+};
+
+struct audio_gpio_attr {
+	const char *name;
+	bool gpio_prepare;
+	struct pinctrl_state *gpioctrl;
+};
+
+static struct audio_gpio_attr aud_gpios[MT8186_AFE_GPIO_GPIO_NUM] = {
+	[MT8186_AFE_GPIO_CLK_MOSI_OFF] = {"aud_clk_mosi_off", false, NULL},
+	[MT8186_AFE_GPIO_CLK_MOSI_ON] = {"aud_clk_mosi_on", false, NULL},
+	[MT8186_AFE_GPIO_CLK_MISO_OFF] = {"aud_clk_miso_off", false, NULL},
+	[MT8186_AFE_GPIO_CLK_MISO_ON] = {"aud_clk_miso_on", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MISO_OFF] = {"aud_dat_miso_off", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MISO_ON] = {"aud_dat_miso_on", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MOSI_OFF] = {"aud_dat_mosi_off", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MOSI_ON] = {"aud_dat_mosi_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S0_OFF] = {"aud_gpio_i2s0_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S0_ON] = {"aud_gpio_i2s0_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S1_OFF] = {"aud_gpio_i2s1_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S1_ON] = {"aud_gpio_i2s1_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S2_OFF] = {"aud_gpio_i2s2_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S2_ON] = {"aud_gpio_i2s2_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S3_OFF] = {"aud_gpio_i2s3_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S3_ON] = {"aud_gpio_i2s3_on", false, NULL},
+	[MT8186_AFE_GPIO_TDM_OFF] = {"aud_gpio_tdm_off", false, NULL},
+	[MT8186_AFE_GPIO_TDM_ON] = {"aud_gpio_tdm_on", false, NULL},
+	[MT8186_AFE_GPIO_PCM_OFF] = {"aud_gpio_pcm_off", false, NULL},
+	[MT8186_AFE_GPIO_PCM_ON] = {"aud_gpio_pcm_on", false, NULL},
+};
+
+static DEFINE_MUTEX(gpio_request_mutex);
+
+int mt8186_afe_gpio_init(struct device *dev)
+{
+	int ret;
+	int i = 0;
+
+	aud_pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(aud_pinctrl)) {
+		ret = PTR_ERR(aud_pinctrl);
+		dev_info(dev, "%s(), ret %d, cannot get aud_pinctrl!\n",
+			 __func__, ret);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(aud_gpios); i++) {
+		aud_gpios[i].gpioctrl = pinctrl_lookup_state(aud_pinctrl,
+							     aud_gpios[i].name);
+		if (IS_ERR(aud_gpios[i].gpioctrl)) {
+			ret = PTR_ERR(aud_gpios[i].gpioctrl);
+			dev_info(dev, "%s(), pinctrl_lookup_state %s fail, ret %d\n",
+				 __func__, aud_gpios[i].name, ret);
+		} else {
+			aud_gpios[i].gpio_prepare = true;
+		}
+	}
+
+	/* gpio status init */
+	mt8186_afe_gpio_request(dev, false, MT8186_DAI_ADDA, 0);
+	mt8186_afe_gpio_request(dev, false, MT8186_DAI_ADDA, 1);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8186_afe_gpio_init);
+
+static int mt8186_afe_gpio_select(struct device *dev,
+				  enum mt8186_afe_gpio type)
+{
+	int ret = 0;
+
+	if (type < 0 || type >= MT8186_AFE_GPIO_GPIO_NUM) {
+		dev_info(dev, "%s(), error, invalid gpio type %d\n",
+			 __func__, type);
+		return -EINVAL;
+	}
+
+	if (!aud_gpios[type].gpio_prepare) {
+		dev_info(dev, "%s(), error, gpio type %d not prepared\n",
+			 __func__, type);
+		return -EIO;
+	}
+
+	ret = pinctrl_select_state(aud_pinctrl,
+				   aud_gpios[type].gpioctrl);
+	if (ret)
+		dev_info(dev, "%s(), error, can not set gpio type %d\n",
+			 __func__, type);
+
+	return ret;
+}
+
+static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
+{
+	if (enable) {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_ON);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
+	} else {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_OFF);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
+	}
+
+	return 0;
+}
+
+static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
+{
+	if (enable) {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_ON);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
+	} else {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_OFF);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
+	}
+
+	return 0;
+}
+
+int mt8186_afe_gpio_request(struct device *dev, bool enable,
+			    int dai, int uplink)
+{
+	mutex_lock(&gpio_request_mutex);
+	switch (dai) {
+	case MT8186_DAI_ADDA:
+		if (uplink)
+			mt8186_afe_gpio_adda_ul(dev, enable);
+		else
+			mt8186_afe_gpio_adda_dl(dev, enable);
+		break;
+	case MT8186_DAI_I2S_0:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S0_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S0_OFF);
+		break;
+	case MT8186_DAI_I2S_1:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S1_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S1_OFF);
+		break;
+	case MT8186_DAI_I2S_2:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S2_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S2_OFF);
+		break;
+	case MT8186_DAI_I2S_3:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S3_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S3_OFF);
+		break;
+	case MT8186_DAI_TDM_IN:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_TDM_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_TDM_OFF);
+		break;
+	case MT8186_DAI_PCM:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_PCM_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_PCM_OFF);
+		break;
+	default:
+		mutex_unlock(&gpio_request_mutex);
+		dev_info(dev, "%s(), invalid dai %d\n", __func__, dai);
+		return -EINVAL;
+	}
+	mutex_unlock(&gpio_request_mutex);
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
new file mode 100644
index 000000000000..1ddc27838eb1
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * mt6833-afe-gpio.h  --  Mediatek 6833 afe gpio ctrl definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+ */
+
+#ifndef _MT8186_AFE_GPIO_H_
+#define _MT8186_AFE_GPIO_H_
+
+struct mtk_base_afe;
+
+int mt8186_afe_gpio_init(struct device *dev);
+
+int mt8186_afe_gpio_request(struct device *dev, bool enable,
+			    int dai, int uplink);
+
+#endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
