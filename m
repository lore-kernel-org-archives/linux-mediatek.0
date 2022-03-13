Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD635C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 15:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlazAJyMurXcvoZkDLCpYh+IdoCTG9bEF9pO1M1A6hw=; b=34clBuiS/yUplu
	w14n4NcpiRE2wFAQjoBm+czj7QmiVlsgMx1hZTn9u/eLX45HotWVNZ8MJYrgwGt6D+5/cUz6G+4mU
	YTiSzHl43y4AgxQbmtnZr4gXjFi11jMfkAiipf5VoflbOko2Yg96SJey6rSyCAEnm9AlrcTis1w95
	cwwRVhouft9i8u7VE6ERwbjUTDVp3ujcPKW3xxYubwllbhhZuoQ6hFEczxKFTAM3OJwUbJYp7xgPE
	4UdbCFETGykY6MvV0uJIIz/vRURVqoFW0iScWNT8ftmYtFSTdo/b1JTpn5gXRZsaVJJgeV/mw8TB8
	uBO+gNcTFw8caLEe1zQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTPtr-002wT7-Oj; Sun, 13 Mar 2022 15:12:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTPrr-002v7y-T4; Sun, 13 Mar 2022 15:10:49 +0000
X-UUID: 4574e026eeff43468fc68a6f092b4a53-20220313
X-UUID: 4574e026eeff43468fc68a6f092b4a53-20220313
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1979746396; Sun, 13 Mar 2022 08:10:41 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Mar 2022 08:10:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Mar 2022 23:10:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Mar 2022 23:10:36 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <julianbraha@gmail.com>,
 <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [v3 12/19] ASoC: mediatek: mt8186: support gpio control in platform
 driver
Date: Sun, 13 Mar 2022 23:10:16 +0800
Message-ID: <20220313151023.21229-13-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_081048_020450_1D8302FB 
X-CRM114-Status: GOOD (  17.19  )
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

Add gpio control for all audio interface separately.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 244 ++++++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h |  19 ++
 2 files changed, 263 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
new file mode 100644
index 000000000000..5ba28095b7da
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -0,0 +1,244 @@
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
+	int i, j, ret;
+
+	aud_pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(aud_pinctrl)) {
+		ret = PTR_ERR(aud_pinctrl);
+		dev_err(dev, "%s(), ret %d, cannot get aud_pinctrl!\n",
+			__func__, ret);
+		return ret;
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
+	for (i = MT8186_DAI_ADDA; i <= MT8186_DAI_TDM_IN; i++) {
+		for (j = 0; j <= 1; j++)
+			mt8186_afe_gpio_request(dev, false, i, j);
+	}
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
+		dev_err(dev, "%s(), error, invalid gpio type %d\n",
+			__func__, type);
+		return -EINVAL;
+	}
+
+	if (!aud_gpios[type].gpio_prepare) {
+		dev_err(dev, "%s(), error, gpio type %d not prepared\n",
+			__func__, type);
+		return -EIO;
+	}
+
+	ret = pinctrl_select_state(aud_pinctrl,
+				   aud_gpios[type].gpioctrl);
+	if (ret) {
+		dev_err(dev, "%s(), error, can not set gpio type %d\n",
+			__func__, type);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
+{
+	int ret;
+
+	if (enable) {
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_ON);
+		if (ret) {
+			dev_err(dev, "%s(), MOSI CLK ON slect fail!\n", __func__);
+			return ret;
+		}
+
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
+		if (ret) {
+			dev_err(dev, "%s(), MOSI DAT ON slect fail!\n", __func__);
+			return ret;
+		}
+	} else {
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_OFF);
+		if (ret) {
+			dev_err(dev, "%s(), MOSI DAT OFF slect fail!\n", __func__);
+			return ret;
+		}
+
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
+		if (ret) {
+			dev_err(dev, "%s(), MOSI CLK ON slect fail!\n", __func__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
+{
+	int ret;
+
+	if (enable) {
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_ON);
+		if (ret) {
+			dev_err(dev, "%s(), MISO CLK ON slect fail!\n", __func__);
+			return ret;
+		}
+
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
+		if (ret) {
+			dev_err(dev, "%s(), MISO DAT ON slect fail!\n", __func__);
+			return ret;
+		}
+	} else {
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_OFF);
+		if (ret) {
+			dev_err(dev, "%s(), MISO DAT OFF slect fail!\n", __func__);
+			return ret;
+		}
+
+		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
+		if (ret) {
+			dev_err(dev, "%s(), MISO CLK OFF slect fail!\n", __func__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int mt8186_afe_gpio_request(struct device *dev, bool enable,
+			    int dai, int uplink)
+{
+	enum mt8186_afe_gpio sel;
+	int ret = -EINVAL;
+
+	mutex_lock(&gpio_request_mutex);
+
+	switch (dai) {
+	case MT8186_DAI_ADDA:
+		if (uplink)
+			ret = mt8186_afe_gpio_adda_ul(dev, enable);
+		else
+			ret = mt8186_afe_gpio_adda_dl(dev, enable);
+		goto unlock;
+	case MT8186_DAI_I2S_0:
+		sel = enable ? MT8186_AFE_GPIO_I2S0_ON : MT8186_AFE_GPIO_I2S0_OFF;
+		break;
+	case MT8186_DAI_I2S_1:
+		sel = enable ? MT8186_AFE_GPIO_I2S1_ON : MT8186_AFE_GPIO_I2S1_OFF;
+		break;
+	case MT8186_DAI_I2S_2:
+		sel = enable ? MT8186_AFE_GPIO_I2S2_ON : MT8186_AFE_GPIO_I2S2_OFF;
+		break;
+	case MT8186_DAI_I2S_3:
+		sel = enable ? MT8186_AFE_GPIO_I2S3_ON : MT8186_AFE_GPIO_I2S3_OFF;
+		break;
+	case MT8186_DAI_TDM_IN:
+		sel = enable ? MT8186_AFE_GPIO_TDM_ON : MT8186_AFE_GPIO_TDM_OFF;
+		break;
+	case MT8186_DAI_PCM:
+		sel = enable ? MT8186_AFE_GPIO_PCM_ON : MT8186_AFE_GPIO_PCM_OFF;
+		break;
+	default:
+		mutex_unlock(&gpio_request_mutex);
+		dev_err(dev, "%s(), invalid dai %d\n", __func__, dai);
+		goto unlock;
+	}
+
+	ret = mt8186_afe_gpio_select(dev, sel);
+
+unlock:
+	mutex_unlock(&gpio_request_mutex);
+
+	return ret;
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
