Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64FBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 12:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 718F561359
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 12:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 718F561359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vXEVKF9EtLgNAyboYm34kUuNzgXPOeh6KkXE6uZizY=; b=k9jNRLTgO7QbN8
	K75Ux2XkwSC1edFnL7q4zeJyI9mA4Ujb//YaAWThLa6OP4bwLSfD9AJYDhA9wHOabZSC2i0Pm5bRC
	JURks97zoADzEsh5Ty3EMdsJT8zacaC+ap18GrC8TkmY2omkXK59L8JVJ0017KvQL/v3QUuM3fxBj
	Qwfz1Pk6J21v0BZmwvv/PB/y1YKmhW1QFY2bvRjX9F+DTsdAFXE+oWfKMEdrO2hzcjFRKOBNB6MLe
	aWEfh1bj5bjAA51MyJ6XOKFy5xZf4PRpECgxP3f5j20zshrCf3eiwI2YMZqTe6dGcaGhEKHReXZCE
	ZzmTcvZc+6pbhXNzGZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdAHv-004OyD-DL; Wed, 20 Oct 2021 12:01:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdAHs-004Oxi-11; Wed, 20 Oct 2021 12:01:41 +0000
X-UUID: 0742495191fc451ab70d7b24ac7313b8-20211020
X-UUID: 0742495191fc451ab70d7b24ac7313b8-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 907196165; Wed, 20 Oct 2021 05:01:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 04:52:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 20 Oct 2021 19:52:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 19:52:19 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <yc.hung@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <daniel.baluta@nxp.com>, <trevor.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
Date: Wed, 20 Oct 2021 19:51:54 +0800
Message-ID: <20211020115155.9909-2-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211020115155.9909-1-yc.hung@mediatek.com>
References: <20211020115155.9909-1-yc.hung@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_050140_100155_2BD1DC90 
X-CRM114-Status: GOOD (  21.19  )
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

Add adsp clock on/off support on mt8195 platform.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/mediatek/mt8195/Makefile     |   2 +-
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 164 +++++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195-clk.h |  29 ++++
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  23 ++-
 4 files changed, 215 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h

diff --git a/sound/soc/sof/mediatek/mt8195/Makefile b/sound/soc/sof/mediatek/mt8195/Makefile
index 60fca24c068a..650f4bce99b2 100644
--- a/sound/soc/sof/mediatek/mt8195/Makefile
+++ b/sound/soc/sof/mediatek/mt8195/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8195-objs := mt8195.o mt8195-loader.o
+snd-sof-mt8195-objs := mt8195.o mt8195-clk.o mt8195-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8195) += snd-sof-mt8195.o
 
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
new file mode 100644
index 000000000000..1988421f7f7b
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2021 Mediatek Corporation. All rights reserved.
+//
+// Author: YC Hung <yc.hung@mediatek.com>
+//
+// Hardware interface for mt8195 DSP clock
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/io.h>
+#include "mt8195.h"
+#include "mt8195-clk.h"
+
+struct clk *clk_handle[ADSP_CLK_NUM];
+
+int platform_parse_clock(struct device *dev)
+{
+	clk_handle[CLK_TOP_ADSP] = devm_clk_get(dev, "adsp_sel");
+	if (IS_ERR(clk_handle[CLK_TOP_ADSP])) {
+		dev_err(dev, "clk_get(\"adsp_sel\") failed\n");
+		return PTR_ERR(clk_handle[CLK_TOP_ADSP]);
+	}
+
+	clk_handle[CLK_TOP_CLK26M] = devm_clk_get(dev, "clk26m_ck");
+	if (IS_ERR(clk_handle[CLK_TOP_CLK26M])) {
+		dev_err(dev, "clk_get(\"clk26m_ck\") failed\n");
+		return PTR_ERR(clk_handle[CLK_TOP_CLK26M]);
+	}
+
+	clk_handle[CLK_TOP_AUDIO_LOCAL_BUS] = devm_clk_get(dev, "audio_local_bus");
+	if (IS_ERR(clk_handle[CLK_TOP_AUDIO_LOCAL_BUS])) {
+		dev_err(dev, "clk_get(\"audio_local_bus\") failed\n");
+		return PTR_ERR(clk_handle[CLK_TOP_AUDIO_LOCAL_BUS]);
+	}
+
+	clk_handle[CLK_TOP_MAINPLL_D7_D2] = devm_clk_get(dev, "mainpll_d7_d2");
+	if (IS_ERR(clk_handle[CLK_TOP_MAINPLL_D7_D2])) {
+		dev_err(dev, "clk_get(\"mainpll_d7_d2\") failed\n");
+		return PTR_ERR(clk_handle[CLK_TOP_MAINPLL_D7_D2]);
+	}
+
+	clk_handle[CLK_SCP_ADSP_AUDIODSP] = devm_clk_get(dev, "scp_adsp_audiodsp");
+	if (IS_ERR(clk_handle[CLK_SCP_ADSP_AUDIODSP])) {
+		dev_err(dev, "clk_get(\"scp_adsp_audiodsp\") failed\n");
+		return PTR_ERR(clk_handle[CLK_SCP_ADSP_AUDIODSP]);
+	}
+
+	clk_handle[CLK_TOP_AUDIO_H] = devm_clk_get(dev, "audio_h");
+	if (IS_ERR(clk_handle[CLK_TOP_AUDIO_H])) {
+		dev_err(dev, "clk_get(\"audio_h_sel\") failed\n");
+		return PTR_ERR(clk_handle[CLK_TOP_AUDIO_H]);
+	}
+
+	return 0;
+}
+
+int adsp_enable_clock(struct device *dev)
+{
+	int ret;
+
+	ret = clk_prepare_enable(clk_handle[CLK_TOP_MAINPLL_D7_D2]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(mainpll_d7_d2) fail %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(clk_handle[CLK_TOP_ADSP]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(adsp_sel) fail %d\n",
+			__func__, ret);
+		goto disable_mainpll_d7_d2_clk;
+	}
+
+	ret = clk_prepare_enable(clk_handle[CLK_TOP_AUDIO_LOCAL_BUS]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(audio_local_bus) fail %d\n",
+			__func__, ret);
+		goto disable_dsp_sel_clk;
+	}
+
+	ret = clk_prepare_enable(clk_handle[CLK_SCP_ADSP_AUDIODSP]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(scp_adsp_audiodsp) fail %d\n",
+			__func__, ret);
+		goto disable_audio_local_bus_clk;
+	}
+
+	ret = clk_prepare_enable(clk_handle[CLK_TOP_AUDIO_H]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(audio_h) fail %d\n",
+			__func__, ret);
+		goto disable_scp_adsp_audiodsp_clk;
+	}
+
+	return 0;
+
+disable_scp_adsp_audiodsp_clk:
+	clk_disable_unprepare(clk_handle[CLK_SCP_ADSP_AUDIODSP]);
+disable_audio_local_bus_clk:
+	clk_disable_unprepare(clk_handle[CLK_TOP_AUDIO_LOCAL_BUS]);
+disable_dsp_sel_clk:
+	clk_disable_unprepare(clk_handle[CLK_TOP_ADSP]);
+disable_mainpll_d7_d2_clk:
+	clk_disable_unprepare(clk_handle[CLK_TOP_MAINPLL_D7_D2]);
+
+	return ret;
+}
+
+void adsp_disable_clock(struct device *dev)
+{
+	clk_disable_unprepare(clk_handle[CLK_TOP_AUDIO_H]);
+	clk_disable_unprepare(clk_handle[CLK_SCP_ADSP_AUDIODSP]);
+	clk_disable_unprepare(clk_handle[CLK_TOP_AUDIO_LOCAL_BUS]);
+	clk_disable_unprepare(clk_handle[CLK_TOP_ADSP]);
+	clk_disable_unprepare(clk_handle[CLK_TOP_MAINPLL_D7_D2]);
+}
+
+int adsp_default_clk_init(struct device *dev, int enable)
+{
+	int ret = 0;
+
+	dev_dbg(dev, "%s: %s\n", __func__, enable ? "on" : "off");
+
+	if (enable) {
+		ret = clk_set_parent(clk_handle[CLK_TOP_ADSP],
+				     clk_handle[CLK_TOP_CLK26M]);
+		if (ret) {
+			dev_err(dev, "failed to set dsp_sel to clk26m: %d\n", ret);
+			return ret;
+		}
+
+		ret = clk_set_parent(clk_handle[CLK_TOP_AUDIO_LOCAL_BUS],
+				     clk_handle[CLK_TOP_MAINPLL_D7_D2]);
+		if (ret) {
+			dev_err(dev, "set audio_local_bus failed %d\n", ret);
+			return ret;
+		}
+
+		ret = adsp_enable_clock(dev);
+		if (ret)
+			dev_err(dev, "failed to adsp_enable_clock: %d\n", ret);
+
+		return ret;
+	}
+
+	adsp_disable_clock(dev);
+
+	return ret;
+}
+
+int adsp_clock_on(struct device *dev)
+{
+	/* Open ADSP clock */
+	return adsp_default_clk_init(dev, 1);
+}
+
+int adsp_clock_off(struct device *dev)
+{
+	/* Close ADSP clock */
+	return adsp_default_clk_init(dev, 0);
+}
+
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.h b/sound/soc/sof/mediatek/mt8195/mt8195-clk.h
new file mode 100644
index 000000000000..f985d141552a
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ *
+ *  Header file for the mt8195 DSP clock  definition
+ */
+
+#ifndef __MT8195_CLK_H
+#define __MT8195_CLK_H
+
+/*DSP clock*/
+enum ADSP_CLK_ID {
+	CLK_TOP_ADSP,
+	CLK_TOP_CLK26M,
+	CLK_TOP_AUDIO_LOCAL_BUS,
+	CLK_TOP_MAINPLL_D7_D2,
+	CLK_SCP_ADSP_AUDIODSP,
+	CLK_TOP_AUDIO_H,
+	ADSP_CLK_NUM
+};
+
+int platform_parse_clock(struct device *dev);
+int adsp_default_clk_init(struct device *dev, int enable);
+int adsp_enable_clock(struct device *dev);
+void adsp_disable_clock(struct device *dev);
+int adsp_clock_on(struct device *dev);
+int adsp_clock_off(struct device *dev);
+#endif
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 99075598a35a..f323da58057b 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -25,6 +25,7 @@
 #include "../adsp_helper.h"
 #include "../mediatek-ops.h"
 #include "mt8195.h"
+#include "mt8195-clk.h"
 
 static int platform_parse_resource(struct platform_device *pdev, void *data)
 {
@@ -231,10 +232,23 @@ static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret)
 		return ret;
 
+	ret = platform_parse_clock(&pdev->dev);
+	if (ret) {
+		dev_err(sdev->dev, "platform_parse_clock failed\n");
+		return -EINVAL;
+	}
+
+	ret = adsp_clock_on(&pdev->dev);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		return -EINVAL;
+	}
+
 	ret = adsp_sram_power_on(sdev->dev, true);
 	if (ret) {
 		dev_err(sdev->dev, "adsp_sram_power_on fail!\n");
-		return ret;
+		ret = -EINVAL;
+		goto exit_clk_disable;
 	}
 
 	ret = adsp_memory_remap_init(&pdev->dev, priv->adsp);
@@ -282,6 +296,8 @@ static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 
 err_adsp_sram_power_off:
 	adsp_sram_power_on(&pdev->dev, false);
+exit_clk_disable:
+	adsp_clock_off(&pdev->dev);
 
 	return ret;
 }
@@ -290,7 +306,10 @@ static int mt8195_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
 
-	return adsp_sram_power_on(&pdev->dev, false);
+	adsp_sram_power_on(&pdev->dev, false);
+	adsp_clock_off(&pdev->dev);
+
+	return 0;
 }
 
 /* on mt8195 there is 1 to 1 match between type and BAR idx */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
