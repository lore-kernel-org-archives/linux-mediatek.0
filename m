Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBB2C55178
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 08:00:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B48822281
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 08:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g/d7ALtu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l8c33rAG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B48822281
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y2HiViAeIyCr1Ql15A3mvVwlDBLOxDakdTc91x7vbUQ=; b=g/d7ALtuWFs8Q5A4kt5yVHtqe
	kSWMMaY2QJ4kICjSsKGpyXBE6L1kl06ofNyQ2Il9Aeo/sV1/D9XC5MmUeFAfba4kxnW6tcxQqiJjs
	rfg8AT0ve9deUob2ijaOi5CgoqKQR64niE02v1nVu3dsAgnRokVpLEF7eBafbr2mNEuqo47tEVS9d
	W4BuOtIpDtdNB905bOEfvCUeVPahH9pM+9ZwwDMBGrMDtuOtjt2eu+4RsnVTQWCXROMFSZeBAsEdA
	VzaJSZmOCQST42bEigROVCtnv9s042yekYYtqPMq4qW86YZmhwD9QaQgm/op1Vub9ARuKxLvO846U
	j0gDSInsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWETA-0000XY-1E; Sat, 24 Oct 2020 08:00:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWESI-00009j-UR; Sat, 24 Oct 2020 07:59:29 +0000
X-UUID: cfa675ca56ac47dc9f6fa3b0245a2fe2-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=R/Jjqb/z76U92SJd0EoffT2w0zuYvGYBpl22Wzrl7rk=; 
 b=l8c33rAGCCVpgSTOiOZzgTzVOMY/9sWzVvHABNicMQ61vc5GtcbFqhF8i30XZdSobgDe3y6yux85vgEyhCHPm42NPoYGRtXPN9DfqEVfmsW71LnG8itQJFzU/cY/oAZ9p4vbGAGAdmszgio/Qi1dEsf+LlrDGS8JjJTDyECavz0=;
X-UUID: cfa675ca56ac47dc9f6fa3b0245a2fe2-20201023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1005528182; Fri, 23 Oct 2020 23:59:07 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 00:59:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 15:59:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 15:59:00 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 2/9] ASoC: mediatek: mt8192: add platform driver
Date: Sat, 24 Oct 2020 15:58:52 +0800
Message-ID: <1603526339-15005-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 99F71CEED52C41D99CF8B2A764AEFD04A15E7593689CA5E6B598D908A888A7BD2000:8
X-MTK: N
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds mt8192 platform and affiliated drivers.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |   10 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   13 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |    1 +
 sound/soc/mediatek/mt8192/Makefile            |   14 +
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c    |  669 ++++
 sound/soc/mediatek/mt8192/mt8192-afe-clk.h    |  244 ++
 sound/soc/mediatek/mt8192/mt8192-afe-common.h |  170 +
 .../soc/mediatek/mt8192/mt8192-afe-control.c  |  163 +
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  306 ++
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.h   |   19 +
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 2389 +++++++++++++
 .../mediatek/mt8192/mt8192-interconnection.h  |   65 +
 sound/soc/mediatek/mt8192/mt8192-reg.h        | 3131 +++++++++++++++++
 14 files changed, 7191 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/mediatek/mt8192/Makefile
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-gpio.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-reg.h

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index f7bc007bbdec6..10588cf809dc7 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -157,3 +157,13 @@ config SND_SOC_MTK_BTCVSD
 	  BT encoded data to/from BT firmware.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8192
+	tristate "ASoC support for Mediatek MT8192 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for Mediatek MT8192 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 76032cae6d51e..f6cb6b8508e3f 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_SND_SOC_MT2701) += mt2701/
 obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
 obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
 obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
+obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 882cdf86c8bf8..3cb2adf420bbf 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -542,8 +542,13 @@ int mtk_memif_set_format(struct mtk_base_afe *afe,
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 	case SNDRV_PCM_FORMAT_U32_LE:
-		hd_audio = 1;
-		hd_align = 1;
+		if (afe->memif_32bit_supported) {
+			hd_audio = 2;
+			hd_align = 0;
+		} else {
+			hd_audio = 1;
+			hd_align = 1;
+		}
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_U24_LE:
@@ -556,10 +561,10 @@ int mtk_memif_set_format(struct mtk_base_afe *afe,
 	}
 
 	mtk_regmap_update_bits(afe->regmap, memif->data->hd_reg,
-			       1, hd_audio, memif->data->hd_shift);
+			       0x3, hd_audio, memif->data->hd_shift);
 
 	mtk_regmap_update_bits(afe->regmap, memif->data->hd_align_reg,
-			       1, hd_align, memif->data->hd_align_mshift);
+			       0x1, hd_align, memif->data->hd_align_mshift);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index a8cf44d982446..a6f68c68581cc 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -91,6 +91,7 @@ struct mtk_base_afe {
 	int memif_size;
 	struct mtk_base_afe_irq *irqs;
 	int irqs_size;
+	int memif_32bit_supported;
 
 	struct list_head sub_dais;
 	struct snd_soc_dai_driver *dai_drivers;
diff --git a/sound/soc/mediatek/mt8192/Makefile b/sound/soc/mediatek/mt8192/Makefile
new file mode 100644
index 0000000000000..dd18486881708
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# platform driver
+snd-soc-mt8192-afe-objs := \
+	mt8192-afe-pcm.o \
+	mt8192-afe-clk.o \
+	mt8192-afe-gpio.o \
+	mt8192-dai-adda.o \
+	mt8192-afe-control.o \
+	mt8192-dai-i2s.o \
+	mt8192-dai-pcm.o \
+	mt8192-dai-tdm.o
+
+obj-$(CONFIG_SND_SOC_MT8192) += snd-soc-mt8192-afe.o
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
new file mode 100644
index 0000000000000..bba5f3056e8ff
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -0,0 +1,669 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8192-afe-clk.c  --  Mediatek 8192 afe clock ctrl
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Shane Chien <shane.chien@mediatek.com>
+//
+
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+
+#include "mt8192-afe-clk.h"
+#include "mt8192-afe-common.h"
+
+static const char *aud_clks[CLK_NUM] = {
+	[CLK_AFE] = "aud_afe_clk",
+	[CLK_TML] = "aud_tml_clk",
+	[CLK_APLL22M] = "aud_apll22m_clk",
+	[CLK_APLL24M] = "aud_apll24m_clk",
+	[CLK_APLL1_TUNER] = "aud_apll1_tuner_clk",
+	[CLK_APLL2_TUNER] = "aud_apll2_tuner_clk",
+	[CLK_NLE] = "aud_nle",
+	[CLK_INFRA_SYS_AUDIO] = "aud_infra_clk",
+	[CLK_INFRA_AUDIO_26M] = "aud_infra_26m_clk",
+	[CLK_MUX_AUDIO] = "top_mux_audio",
+	[CLK_MUX_AUDIOINTBUS] = "top_mux_audio_int",
+	[CLK_TOP_MAINPLL_D4_D4] = "top_mainpll_d4_d4",
+	[CLK_TOP_MUX_AUD_1] = "top_mux_aud_1",
+	[CLK_TOP_APLL1_CK] = "top_apll1_ck",
+	[CLK_TOP_MUX_AUD_2] = "top_mux_aud_2",
+	[CLK_TOP_APLL2_CK] = "top_apll2_ck",
+	[CLK_TOP_MUX_AUD_ENG1] = "top_mux_aud_eng1",
+	[CLK_TOP_APLL1_D4] = "top_apll1_d4",
+	[CLK_TOP_MUX_AUD_ENG2] = "top_mux_aud_eng2",
+	[CLK_TOP_APLL2_D4] = "top_apll2_d4",
+	[CLK_TOP_MUX_AUDIO_H] = "top_mux_audio_h",
+	[CLK_TOP_I2S0_M_SEL] = "top_i2s0_m_sel",
+	[CLK_TOP_I2S1_M_SEL] = "top_i2s1_m_sel",
+	[CLK_TOP_I2S2_M_SEL] = "top_i2s2_m_sel",
+	[CLK_TOP_I2S3_M_SEL] = "top_i2s3_m_sel",
+	[CLK_TOP_I2S4_M_SEL] = "top_i2s4_m_sel",
+	[CLK_TOP_I2S5_M_SEL] = "top_i2s5_m_sel",
+	[CLK_TOP_I2S6_M_SEL] = "top_i2s6_m_sel",
+	[CLK_TOP_I2S7_M_SEL] = "top_i2s7_m_sel",
+	[CLK_TOP_I2S8_M_SEL] = "top_i2s8_m_sel",
+	[CLK_TOP_I2S9_M_SEL] = "top_i2s9_m_sel",
+	[CLK_TOP_APLL12_DIV0] = "top_apll12_div0",
+	[CLK_TOP_APLL12_DIV1] = "top_apll12_div1",
+	[CLK_TOP_APLL12_DIV2] = "top_apll12_div2",
+	[CLK_TOP_APLL12_DIV3] = "top_apll12_div3",
+	[CLK_TOP_APLL12_DIV4] = "top_apll12_div4",
+	[CLK_TOP_APLL12_DIVB] = "top_apll12_divb",
+	[CLK_TOP_APLL12_DIV5] = "top_apll12_div5",
+	[CLK_TOP_APLL12_DIV6] = "top_apll12_div6",
+	[CLK_TOP_APLL12_DIV7] = "top_apll12_div7",
+	[CLK_TOP_APLL12_DIV8] = "top_apll12_div8",
+	[CLK_TOP_APLL12_DIV9] = "top_apll12_div9",
+	[CLK_CLK26M] = "top_clk26m_clk",
+};
+
+int mt8192_set_audio_int_bus_parent(struct mtk_base_afe *afe,
+				    int clk_id)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	ret = clk_set_parent(afe_priv->clk[CLK_MUX_AUDIOINTBUS],
+			     afe_priv->clk[clk_id]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
+			aud_clks[clk_id], ret);
+	}
+
+	return ret;
+}
+
+static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	if (enable) {
+		ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_1], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+				     afe_priv->clk[CLK_TOP_APLL1_CK]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
+				aud_clks[CLK_TOP_APLL1_CK], ret);
+			goto EXIT;
+		}
+
+		/* 180.6336 / 4 = 45.1584MHz */
+		ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_TOP_APLL1_D4]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
+				aud_clks[CLK_TOP_APLL1_D4], ret);
+			goto EXIT;
+		}
+	} else {
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+	}
+
+EXIT:
+	return ret;
+}
+
+static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	if (enable) {
+		ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_2], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+				     afe_priv->clk[CLK_TOP_APLL2_CK]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
+				aud_clks[CLK_TOP_APLL2_CK], ret);
+			goto EXIT;
+		}
+
+		/* 196.608 / 4 = 49.152MHz */
+		ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_TOP_APLL2_D4]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
+				aud_clks[CLK_TOP_APLL2_D4], ret);
+			goto EXIT;
+		}
+	} else {
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+	}
+
+EXIT:
+	return ret;
+}
+
+int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	dev_info(afe->dev, "%s()\n", __func__);
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_INFRA_SYS_AUDIO], ret);
+		goto EXIT;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_INFRA_AUDIO_26M], ret);
+		goto EXIT;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIO]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_MUX_AUDIO], ret);
+		goto EXIT;
+	}
+	ret = clk_set_parent(afe_priv->clk[CLK_MUX_AUDIO],
+			     afe_priv->clk[CLK_CLK26M]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+			__func__, aud_clks[CLK_MUX_AUDIO],
+			aud_clks[CLK_CLK26M], ret);
+		goto EXIT;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
+		goto EXIT;
+	}
+
+	ret = mt8192_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
+			aud_clks[CLK_CLK26M], ret);
+		goto EXIT;
+	}
+
+	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUDIO_H],
+			     afe_priv->clk[CLK_TOP_APLL2_CK]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+			__func__, aud_clks[CLK_TOP_MUX_AUDIO_H],
+			aud_clks[CLK_TOP_APLL2_CK], ret);
+		goto EXIT;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_AFE], ret);
+		goto EXIT;
+	}
+
+EXIT:
+	return ret;
+}
+
+void mt8192_afe_disable_clock(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+
+	dev_info(afe->dev, "%s()\n", __func__);
+
+	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
+	mt8192_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+}
+
+int mt8192_apll1_enable(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	/* setting for APLL */
+	apll1_mux_setting(afe, true);
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL22M], ret);
+		goto EXIT;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL1_TUNER], ret);
+		goto EXIT;
+	}
+
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   0x0000FFF7, 0x00000832);
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG, 0x1, 0x1);
+
+	regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			   AFE_22M_ON_MASK_SFT,
+			   0x1 << AFE_22M_ON_SFT);
+
+EXIT:
+	return ret;
+}
+
+void mt8192_apll1_disable(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+
+	regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			   AFE_22M_ON_MASK_SFT,
+			   0x0 << AFE_22M_ON_SFT);
+
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG, 0x1, 0x0);
+
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+
+	apll1_mux_setting(afe, false);
+}
+
+int mt8192_apll2_enable(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	/* setting for APLL */
+	apll2_mux_setting(afe, true);
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL24M], ret);
+		goto EXIT;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL2_TUNER], ret);
+		goto EXIT;
+	}
+
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   0x0000FFF7, 0x00000634);
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG, 0x1, 0x1);
+
+	regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			   AFE_24M_ON_MASK_SFT,
+			   0x1 << AFE_24M_ON_SFT);
+
+EXIT:
+	return ret;
+}
+
+void mt8192_apll2_disable(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+
+	regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			   AFE_24M_ON_MASK_SFT,
+			   0x0 << AFE_24M_ON_SFT);
+
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG, 0x1, 0x0);
+
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+
+	apll2_mux_setting(afe, false);
+}
+
+int mt8192_get_apll_rate(struct mtk_base_afe *afe, int apll)
+{
+	return (apll == MT8192_APLL1) ? 180633600 : 196608000;
+}
+
+int mt8192_get_apll_by_rate(struct mtk_base_afe *afe, int rate)
+{
+	return ((rate % 8000) == 0) ? MT8192_APLL2 : MT8192_APLL1;
+}
+
+int mt8192_get_apll_by_name(struct mtk_base_afe *afe, const char *name)
+{
+	if (strcmp(name, APLL1_W_NAME) == 0)
+		return MT8192_APLL1;
+	else
+		return MT8192_APLL2;
+}
+
+/* mck */
+struct mt8192_mck_div {
+	int m_sel_id;
+	int div_clk_id;
+	/* below will be deprecated */
+	int div_pdn_reg;
+	int div_pdn_mask_sft;
+	int div_reg;
+	int div_mask_sft;
+	int div_mask;
+	int div_sft;
+	int div_apll_sel_reg;
+	int div_apll_sel_mask_sft;
+	int div_apll_sel_sft;
+};
+
+static const struct mt8192_mck_div mck_div[MT8192_MCK_NUM] = {
+	[MT8192_I2S0_MCK] = {
+		.m_sel_id = CLK_TOP_I2S0_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV0,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV0_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_2,
+		.div_mask_sft = APLL12_CK_DIV0_MASK_SFT,
+		.div_mask = APLL12_CK_DIV0_MASK,
+		.div_sft = APLL12_CK_DIV0_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S0_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S0_MCK_SEL_SFT,
+	},
+	[MT8192_I2S1_MCK] = {
+		.m_sel_id = CLK_TOP_I2S1_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV1,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV1_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_2,
+		.div_mask_sft = APLL12_CK_DIV1_MASK_SFT,
+		.div_mask = APLL12_CK_DIV1_MASK,
+		.div_sft = APLL12_CK_DIV1_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S1_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S1_MCK_SEL_SFT,
+	},
+	[MT8192_I2S2_MCK] = {
+		.m_sel_id = CLK_TOP_I2S2_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV2,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV2_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_2,
+		.div_mask_sft = APLL12_CK_DIV2_MASK_SFT,
+		.div_mask = APLL12_CK_DIV2_MASK,
+		.div_sft = APLL12_CK_DIV2_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S2_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S2_MCK_SEL_SFT,
+	},
+	[MT8192_I2S3_MCK] = {
+		.m_sel_id = CLK_TOP_I2S3_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV3,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV3_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_2,
+		.div_mask_sft = APLL12_CK_DIV3_MASK_SFT,
+		.div_mask = APLL12_CK_DIV3_MASK,
+		.div_sft = APLL12_CK_DIV3_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S3_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S3_MCK_SEL_SFT,
+	},
+	[MT8192_I2S4_MCK] = {
+		.m_sel_id = CLK_TOP_I2S4_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV4,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV4_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_3,
+		.div_mask_sft = APLL12_CK_DIV4_MASK_SFT,
+		.div_mask = APLL12_CK_DIV4_MASK,
+		.div_sft = APLL12_CK_DIV4_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S4_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S4_MCK_SEL_SFT,
+	},
+	[MT8192_I2S4_BCK] = {
+		.m_sel_id = -1,
+		.div_clk_id = CLK_TOP_APLL12_DIVB,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIVB_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_2,
+		.div_mask_sft = APLL12_CK_DIVB_MASK_SFT,
+		.div_mask = APLL12_CK_DIVB_MASK,
+		.div_sft = APLL12_CK_DIVB_SFT,
+	},
+	[MT8192_I2S5_MCK] = {
+		.m_sel_id = CLK_TOP_I2S5_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV5,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV5_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_3,
+		.div_mask_sft = APLL12_CK_DIV5_MASK_SFT,
+		.div_mask = APLL12_CK_DIV5_MASK,
+		.div_sft = APLL12_CK_DIV5_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S5_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S5_MCK_SEL_SFT,
+	},
+	[MT8192_I2S6_MCK] = {
+		.m_sel_id = CLK_TOP_I2S6_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV6,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV6_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_3,
+		.div_mask_sft = APLL12_CK_DIV6_MASK_SFT,
+		.div_mask = APLL12_CK_DIV6_MASK,
+		.div_sft = APLL12_CK_DIV6_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S6_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S6_MCK_SEL_SFT,
+	},
+	[MT8192_I2S7_MCK] = {
+		.m_sel_id = CLK_TOP_I2S7_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV7,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV7_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_4,
+		.div_mask_sft = APLL12_CK_DIV7_MASK_SFT,
+		.div_mask = APLL12_CK_DIV7_MASK,
+		.div_sft = APLL12_CK_DIV7_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S7_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S7_MCK_SEL_SFT,
+	},
+	[MT8192_I2S8_MCK] = {
+		.m_sel_id = CLK_TOP_I2S8_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV8,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV8_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_4,
+		.div_mask_sft = APLL12_CK_DIV8_MASK_SFT,
+		.div_mask = APLL12_CK_DIV8_MASK,
+		.div_sft = APLL12_CK_DIV8_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S8_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S8_MCK_SEL_SFT,
+	},
+	[MT8192_I2S9_MCK] = {
+		.m_sel_id = CLK_TOP_I2S9_M_SEL,
+		.div_clk_id = CLK_TOP_APLL12_DIV9,
+		.div_pdn_reg = CLK_AUDDIV_0,
+		.div_pdn_mask_sft = APLL12_DIV9_PDN_MASK_SFT,
+		.div_reg = CLK_AUDDIV_4,
+		.div_mask_sft = APLL12_CK_DIV9_MASK_SFT,
+		.div_mask = APLL12_CK_DIV9_MASK,
+		.div_sft = APLL12_CK_DIV9_SFT,
+		.div_apll_sel_reg = CLK_AUDDIV_0,
+		.div_apll_sel_mask_sft = APLL_I2S9_MCK_SEL_MASK_SFT,
+		.div_apll_sel_sft = APLL_I2S9_MCK_SEL_SFT,
+	},
+};
+
+int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int apll = mt8192_get_apll_by_rate(afe, rate);
+	int apll_clk_id = apll == MT8192_APLL1 ?
+			  CLK_TOP_MUX_AUD_1 : CLK_TOP_MUX_AUD_2;
+	int m_sel_id = mck_div[mck_id].m_sel_id;
+	int div_clk_id = mck_div[mck_id].div_clk_id;
+	int ret;
+
+	/* select apll */
+	if (m_sel_id >= 0) {
+		ret = clk_prepare_enable(afe_priv->clk[m_sel_id]);
+		if (ret) {
+			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[m_sel_id], ret);
+			return ret;
+		}
+		ret = clk_set_parent(afe_priv->clk[m_sel_id],
+				     afe_priv->clk[apll_clk_id]);
+		if (ret) {
+			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[m_sel_id],
+				aud_clks[apll_clk_id], ret);
+			return ret;
+		}
+	}
+
+	/* enable div, set rate */
+	ret = clk_prepare_enable(afe_priv->clk[div_clk_id]);
+	if (ret) {
+		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[div_clk_id], ret);
+		return ret;
+	}
+	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
+	if (ret) {
+		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
+			__func__, aud_clks[div_clk_id],
+			rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+void mt8192_mck_disable(struct mtk_base_afe *afe, int mck_id)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int m_sel_id = mck_div[mck_id].m_sel_id;
+	int div_clk_id = mck_div[mck_id].div_clk_id;
+
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+}
+
+int mt8192_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	struct device_node *of_node = afe->dev->of_node;
+	int i = 0;
+
+	afe_priv->clk = devm_kcalloc(afe->dev, CLK_NUM, sizeof(*afe_priv->clk),
+				     GFP_KERNEL);
+	if (!afe_priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < CLK_NUM; i++) {
+		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i])) {
+			dev_warn(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
+				 __func__,
+				 aud_clks[i], PTR_ERR(afe_priv->clk[i]));
+			afe_priv->clk[i] = NULL;
+		}
+	}
+
+	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
+							       "mediatek,apmixedsys");
+	if (IS_ERR(afe_priv->apmixedsys)) {
+		dev_err(afe->dev, "%s() Cannot find apmixedsys controller: %ld\n",
+			__func__, PTR_ERR(afe_priv->apmixedsys));
+		return PTR_ERR(afe_priv->apmixedsys);
+	}
+
+	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(of_node,
+							     "mediatek,topckgen");
+	if (IS_ERR(afe_priv->topckgen)) {
+		dev_err(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
+			__func__, PTR_ERR(afe_priv->topckgen));
+		return PTR_ERR(afe_priv->topckgen);
+	}
+
+	afe_priv->infracfg = syscon_regmap_lookup_by_phandle(of_node,
+							     "mediatek,infracfg");
+	if (IS_ERR(afe_priv->infracfg)) {
+		dev_err(afe->dev, "%s() Cannot find infracfg: %ld\n",
+			__func__, PTR_ERR(afe_priv->infracfg));
+		return PTR_ERR(afe_priv->infracfg);
+	}
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.h b/sound/soc/mediatek/mt8192/mt8192-afe-clk.h
new file mode 100644
index 0000000000000..3adaf027af83c
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.h
@@ -0,0 +1,244 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8192-afe-clk.h  --  Mediatek 8192 afe clock ctrl definition
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Shane Chien <shane.chien@mediatek.com>
+ */
+
+#ifndef _MT8192_AFE_CLOCK_CTRL_H_
+#define _MT8192_AFE_CLOCK_CTRL_H_
+
+#define AP_PLL_CON3 0x0014
+#define APLL1_CON0 0x0318
+#define APLL1_CON1 0x031c
+#define APLL1_CON2 0x0320
+#define APLL1_CON4 0x0328
+#define APLL1_TUNER_CON0 0x0040
+
+#define APLL2_CON0 0x032c
+#define APLL2_CON1 0x0330
+#define APLL2_CON2 0x0334
+#define APLL2_CON4 0x033c
+#define APLL2_TUNER_CON0 0x0044
+
+#define CLK_CFG_7 0x0080
+#define CLK_CFG_8 0x0090
+#define CLK_CFG_11 0x00c0
+#define CLK_CFG_12 0x00d0
+#define CLK_CFG_13 0x00e0
+#define CLK_CFG_15 0x0100
+
+#define CLK_AUDDIV_0 0x0320
+#define CLK_AUDDIV_2 0x0328
+#define CLK_AUDDIV_3 0x0334
+#define CLK_AUDDIV_4 0x0338
+#define CKSYS_AUD_TOP_CFG 0x032c
+#define CKSYS_AUD_TOP_MON 0x0330
+
+#define PERI_BUS_DCM_CTRL 0x0074
+#define MODULE_SW_CG_1_STA 0x0094
+#define MODULE_SW_CG_2_STA 0x00ac
+
+/* CLK_AUDDIV_0 */
+#define APLL12_DIV0_PDN_SFT                0
+#define APLL12_DIV0_PDN_MASK               0x1
+#define APLL12_DIV0_PDN_MASK_SFT           (0x1 << 0)
+#define APLL12_DIV1_PDN_SFT                1
+#define APLL12_DIV1_PDN_MASK               0x1
+#define APLL12_DIV1_PDN_MASK_SFT           (0x1 << 1)
+#define APLL12_DIV2_PDN_SFT                2
+#define APLL12_DIV2_PDN_MASK               0x1
+#define APLL12_DIV2_PDN_MASK_SFT           (0x1 << 2)
+#define APLL12_DIV3_PDN_SFT                3
+#define APLL12_DIV3_PDN_MASK               0x1
+#define APLL12_DIV3_PDN_MASK_SFT           (0x1 << 3)
+#define APLL12_DIV4_PDN_SFT                4
+#define APLL12_DIV4_PDN_MASK               0x1
+#define APLL12_DIV4_PDN_MASK_SFT           (0x1 << 4)
+#define APLL12_DIVB_PDN_SFT                5
+#define APLL12_DIVB_PDN_MASK               0x1
+#define APLL12_DIVB_PDN_MASK_SFT           (0x1 << 5)
+#define APLL12_DIV5_PDN_SFT                6
+#define APLL12_DIV5_PDN_MASK               0x1
+#define APLL12_DIV5_PDN_MASK_SFT           (0x1 << 6)
+#define APLL12_DIV6_PDN_SFT                7
+#define APLL12_DIV6_PDN_MASK               0x1
+#define APLL12_DIV6_PDN_MASK_SFT           (0x1 << 7)
+#define APLL12_DIV7_PDN_SFT                8
+#define APLL12_DIV7_PDN_MASK               0x1
+#define APLL12_DIV7_PDN_MASK_SFT           (0x1 << 8)
+#define APLL12_DIV8_PDN_SFT                9
+#define APLL12_DIV8_PDN_MASK               0x1
+#define APLL12_DIV8_PDN_MASK_SFT           (0x1 << 9)
+#define APLL12_DIV9_PDN_SFT                10
+#define APLL12_DIV9_PDN_MASK               0x1
+#define APLL12_DIV9_PDN_MASK_SFT           (0x1 << 10)
+#define APLL_I2S0_MCK_SEL_SFT              16
+#define APLL_I2S0_MCK_SEL_MASK             0x1
+#define APLL_I2S0_MCK_SEL_MASK_SFT         (0x1 << 16)
+#define APLL_I2S1_MCK_SEL_SFT              17
+#define APLL_I2S1_MCK_SEL_MASK             0x1
+#define APLL_I2S1_MCK_SEL_MASK_SFT         (0x1 << 17)
+#define APLL_I2S2_MCK_SEL_SFT              18
+#define APLL_I2S2_MCK_SEL_MASK             0x1
+#define APLL_I2S2_MCK_SEL_MASK_SFT         (0x1 << 18)
+#define APLL_I2S3_MCK_SEL_SFT              19
+#define APLL_I2S3_MCK_SEL_MASK             0x1
+#define APLL_I2S3_MCK_SEL_MASK_SFT         (0x1 << 19)
+#define APLL_I2S4_MCK_SEL_SFT              20
+#define APLL_I2S4_MCK_SEL_MASK             0x1
+#define APLL_I2S4_MCK_SEL_MASK_SFT         (0x1 << 20)
+#define APLL_I2S5_MCK_SEL_SFT              21
+#define APLL_I2S5_MCK_SEL_MASK             0x1
+#define APLL_I2S5_MCK_SEL_MASK_SFT         (0x1 << 21)
+#define APLL_I2S6_MCK_SEL_SFT              22
+#define APLL_I2S6_MCK_SEL_MASK             0x1
+#define APLL_I2S6_MCK_SEL_MASK_SFT         (0x1 << 22)
+#define APLL_I2S7_MCK_SEL_SFT              23
+#define APLL_I2S7_MCK_SEL_MASK             0x1
+#define APLL_I2S7_MCK_SEL_MASK_SFT         (0x1 << 23)
+#define APLL_I2S8_MCK_SEL_SFT              24
+#define APLL_I2S8_MCK_SEL_MASK             0x1
+#define APLL_I2S8_MCK_SEL_MASK_SFT         (0x1 << 24)
+#define APLL_I2S9_MCK_SEL_SFT              25
+#define APLL_I2S9_MCK_SEL_MASK             0x1
+#define APLL_I2S9_MCK_SEL_MASK_SFT         (0x1 << 25)
+
+/* CLK_AUDDIV_2 */
+#define APLL12_CK_DIV0_SFT                 0
+#define APLL12_CK_DIV0_MASK                0xff
+#define APLL12_CK_DIV0_MASK_SFT            (0xff << 0)
+#define APLL12_CK_DIV1_SFT                 8
+#define APLL12_CK_DIV1_MASK                0xff
+#define APLL12_CK_DIV1_MASK_SFT            (0xff << 8)
+#define APLL12_CK_DIV2_SFT                 16
+#define APLL12_CK_DIV2_MASK                0xff
+#define APLL12_CK_DIV2_MASK_SFT            (0xff << 16)
+#define APLL12_CK_DIV3_SFT                 24
+#define APLL12_CK_DIV3_MASK                0xff
+#define APLL12_CK_DIV3_MASK_SFT            (0xff << 24)
+
+/* CLK_AUDDIV_3 */
+#define APLL12_CK_DIV4_SFT                 0
+#define APLL12_CK_DIV4_MASK                0xff
+#define APLL12_CK_DIV4_MASK_SFT            (0xff << 0)
+#define APLL12_CK_DIVB_SFT                 8
+#define APLL12_CK_DIVB_MASK                0xff
+#define APLL12_CK_DIVB_MASK_SFT            (0xff << 8)
+#define APLL12_CK_DIV5_SFT                 16
+#define APLL12_CK_DIV5_MASK                0xff
+#define APLL12_CK_DIV5_MASK_SFT            (0xff << 16)
+#define APLL12_CK_DIV6_SFT                 24
+#define APLL12_CK_DIV6_MASK                0xff
+#define APLL12_CK_DIV6_MASK_SFT            (0xff << 24)
+
+/* CLK_AUDDIV_4 */
+#define APLL12_CK_DIV7_SFT                 0
+#define APLL12_CK_DIV7_MASK                0xff
+#define APLL12_CK_DIV7_MASK_SFT            (0xff << 0)
+#define APLL12_CK_DIV8_SFT                 8
+#define APLL12_CK_DIV8_MASK                0xff
+#define APLL12_CK_DIV8_MASK_SFT            (0xff << 0)
+#define APLL12_CK_DIV9_SFT                 16
+#define APLL12_CK_DIV9_MASK                0xff
+#define APLL12_CK_DIV9_MASK_SFT            (0xff << 0)
+
+/* AUD_TOP_CFG */
+#define AUD_TOP_CFG_SFT                    0
+#define AUD_TOP_CFG_MASK                   0xffffffff
+#define AUD_TOP_CFG_MASK_SFT               (0xffffffff << 0)
+
+/* AUD_TOP_MON */
+#define AUD_TOP_MON_SFT                    0
+#define AUD_TOP_MON_MASK                   0xffffffff
+#define AUD_TOP_MON_MASK_SFT               (0xffffffff << 0)
+
+/* CLK_AUDDIV_3 */
+#define APLL12_CK_DIV5_MSB_SFT             0
+#define APLL12_CK_DIV5_MSB_MASK            0xf
+#define APLL12_CK_DIV5_MSB_MASK_SFT        (0xf << 0)
+#define RESERVED0_SFT                      4
+#define RESERVED0_MASK                     0xfffffff
+#define RESERVED0_MASK_SFT                 (0xfffffff << 4)
+
+/* APLL */
+#define APLL1_W_NAME "APLL1"
+#define APLL2_W_NAME "APLL2"
+enum {
+	MT8192_APLL1 = 0,
+	MT8192_APLL2,
+};
+
+enum {
+	CLK_AFE = 0,
+	CLK_TML,
+	CLK_APLL22M,
+	CLK_APLL24M,
+	CLK_APLL1_TUNER,
+	CLK_APLL2_TUNER,
+	CLK_NLE,
+	CLK_INFRA_SYS_AUDIO,
+	CLK_INFRA_AUDIO_26M,
+	CLK_MUX_AUDIO,
+	CLK_MUX_AUDIOINTBUS,
+	CLK_TOP_MAINPLL_D4_D4,
+	/* apll related mux */
+	CLK_TOP_MUX_AUD_1,
+	CLK_TOP_APLL1_CK,
+	CLK_TOP_MUX_AUD_2,
+	CLK_TOP_APLL2_CK,
+	CLK_TOP_MUX_AUD_ENG1,
+	CLK_TOP_APLL1_D4,
+	CLK_TOP_MUX_AUD_ENG2,
+	CLK_TOP_APLL2_D4,
+	CLK_TOP_MUX_AUDIO_H,
+	CLK_TOP_I2S0_M_SEL,
+	CLK_TOP_I2S1_M_SEL,
+	CLK_TOP_I2S2_M_SEL,
+	CLK_TOP_I2S3_M_SEL,
+	CLK_TOP_I2S4_M_SEL,
+	CLK_TOP_I2S5_M_SEL,
+	CLK_TOP_I2S6_M_SEL,
+	CLK_TOP_I2S7_M_SEL,
+	CLK_TOP_I2S8_M_SEL,
+	CLK_TOP_I2S9_M_SEL,
+	CLK_TOP_APLL12_DIV0,
+	CLK_TOP_APLL12_DIV1,
+	CLK_TOP_APLL12_DIV2,
+	CLK_TOP_APLL12_DIV3,
+	CLK_TOP_APLL12_DIV4,
+	CLK_TOP_APLL12_DIVB,
+	CLK_TOP_APLL12_DIV5,
+	CLK_TOP_APLL12_DIV6,
+	CLK_TOP_APLL12_DIV7,
+	CLK_TOP_APLL12_DIV8,
+	CLK_TOP_APLL12_DIV9,
+	CLK_CLK26M,
+	CLK_NUM
+};
+
+struct mtk_base_afe;
+
+int mt8192_init_clock(struct mtk_base_afe *afe);
+int mt8192_afe_enable_clock(struct mtk_base_afe *afe);
+void mt8192_afe_disable_clock(struct mtk_base_afe *afe);
+
+int mt8192_apll1_enable(struct mtk_base_afe *afe);
+void mt8192_apll1_disable(struct mtk_base_afe *afe);
+
+int mt8192_apll2_enable(struct mtk_base_afe *afe);
+void mt8192_apll2_disable(struct mtk_base_afe *afe);
+
+int mt8192_get_apll_rate(struct mtk_base_afe *afe, int apll);
+int mt8192_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
+int mt8192_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
+
+/* these will be replaced by using CCF */
+int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
+void mt8192_mck_disable(struct mtk_base_afe *afe, int mck_id);
+
+int mt8192_set_audio_int_bus_parent(struct mtk_base_afe *afe,
+				    int clk_id);
+
+#endif
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-common.h b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
new file mode 100644
index 0000000000000..d55eff46cc7fe
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8192-afe-common.h  --  Mediatek 8192 audio driver definitions
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Shane Chien <shane.chien@mediatek.com>
+ */
+
+#ifndef _MT_8192_AFE_COMMON_H_
+#define _MT_8192_AFE_COMMON_H_
+
+#include <linux/list.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "../common/mtk-base-afe.h"
+#include "mt8192-reg.h"
+
+enum {
+	MT8192_MEMIF_DL1,
+	MT8192_MEMIF_DL12,
+	MT8192_MEMIF_DL2,
+	MT8192_MEMIF_DL3,
+	MT8192_MEMIF_DL4,
+	MT8192_MEMIF_DL5,
+	MT8192_MEMIF_DL6,
+	MT8192_MEMIF_DL7,
+	MT8192_MEMIF_DL8,
+	MT8192_MEMIF_DL9,
+	MT8192_MEMIF_DAI,
+	MT8192_MEMIF_DAI2,
+	MT8192_MEMIF_MOD_DAI,
+	MT8192_MEMIF_VUL12,
+	MT8192_MEMIF_VUL2,
+	MT8192_MEMIF_VUL3,
+	MT8192_MEMIF_VUL4,
+	MT8192_MEMIF_VUL5,
+	MT8192_MEMIF_VUL6,
+	MT8192_MEMIF_AWB,
+	MT8192_MEMIF_AWB2,
+	MT8192_MEMIF_HDMI,
+	MT8192_MEMIF_NUM,
+	MT8192_DAI_ADDA = MT8192_MEMIF_NUM,
+	MT8192_DAI_ADDA_CH34,
+	MT8192_DAI_AP_DMIC,
+	MT8192_DAI_AP_DMIC_CH34,
+	MT8192_DAI_VOW,
+	MT8192_DAI_CONNSYS_I2S,
+	MT8192_DAI_I2S_0,
+	MT8192_DAI_I2S_1,
+	MT8192_DAI_I2S_2,
+	MT8192_DAI_I2S_3,
+	MT8192_DAI_I2S_5,
+	MT8192_DAI_I2S_6,
+	MT8192_DAI_I2S_7,
+	MT8192_DAI_I2S_8,
+	MT8192_DAI_I2S_9,
+	MT8192_DAI_HW_GAIN_1,
+	MT8192_DAI_HW_GAIN_2,
+	MT8192_DAI_SRC_1,
+	MT8192_DAI_SRC_2,
+	MT8192_DAI_PCM_1,
+	MT8192_DAI_PCM_2,
+	MT8192_DAI_TDM,
+	MT8192_DAI_NUM,
+};
+
+enum {
+	MT8192_IRQ_0,
+	MT8192_IRQ_1,
+	MT8192_IRQ_2,
+	MT8192_IRQ_3,
+	MT8192_IRQ_4,
+	MT8192_IRQ_5,
+	MT8192_IRQ_6,
+	MT8192_IRQ_7,
+	MT8192_IRQ_8,
+	MT8192_IRQ_9,
+	MT8192_IRQ_10,
+	MT8192_IRQ_11,
+	MT8192_IRQ_12,
+	MT8192_IRQ_13,
+	MT8192_IRQ_14,
+	MT8192_IRQ_15,
+	MT8192_IRQ_16,
+	MT8192_IRQ_17,
+	MT8192_IRQ_18,
+	MT8192_IRQ_19,
+	MT8192_IRQ_20,
+	MT8192_IRQ_21,
+	MT8192_IRQ_22,
+	MT8192_IRQ_23,
+	MT8192_IRQ_24,
+	MT8192_IRQ_25,
+	MT8192_IRQ_26,
+	MT8192_IRQ_31,	/* used only for TDM */
+	MT8192_IRQ_NUM,
+};
+
+enum {
+	MTKAIF_PROTOCOL_1 = 0,
+	MTKAIF_PROTOCOL_2,
+	MTKAIF_PROTOCOL_2_CLK_P2,
+};
+
+enum {
+	MTK_AFE_ADDA_DL_GAIN_MUTE = 0,
+	MTK_AFE_ADDA_DL_GAIN_NORMAL = 0xf74f,
+	/* SA suggest apply -0.3db to audio/speech path */
+};
+
+/* MCLK */
+enum {
+	MT8192_I2S0_MCK = 0,
+	MT8192_I2S1_MCK,
+	MT8192_I2S2_MCK,
+	MT8192_I2S3_MCK,
+	MT8192_I2S4_MCK,
+	MT8192_I2S4_BCK,
+	MT8192_I2S5_MCK,
+	MT8192_I2S6_MCK,
+	MT8192_I2S7_MCK,
+	MT8192_I2S8_MCK,
+	MT8192_I2S9_MCK,
+	MT8192_MCK_NUM,
+};
+
+struct clk;
+
+struct mt8192_afe_private {
+	struct clk **clk;
+	struct regmap *topckgen;
+	struct regmap *apmixedsys;
+	struct regmap *infracfg;
+	int stf_positive_gain_db;
+	int pm_runtime_bypass_reg_ctl;
+
+	/* dai */
+	bool dai_on[MT8192_DAI_NUM];
+	void *dai_priv[MT8192_DAI_NUM];
+
+	/* adda */
+	int mtkaif_protocol;
+	int mtkaif_chosen_phase[4];
+	int mtkaif_phase_cycle[4];
+	int mtkaif_calibration_num_phase;
+	int mtkaif_dmic;
+	int mtkaif_dmic_ch34;
+	int mtkaif_adda6_only;
+
+	/* mck */
+	int mck_rate[MT8192_MCK_NUM];
+};
+
+int mt8192_dai_adda_register(struct mtk_base_afe *afe);
+int mt8192_dai_i2s_register(struct mtk_base_afe *afe);
+int mt8192_dai_hw_gain_register(struct mtk_base_afe *afe);
+int mt8192_dai_src_register(struct mtk_base_afe *afe);
+int mt8192_dai_pcm_register(struct mtk_base_afe *afe);
+int mt8192_dai_tdm_register(struct mtk_base_afe *afe);
+
+unsigned int mt8192_general_rate_transform(struct device *dev,
+					   unsigned int rate);
+unsigned int mt8192_rate_transform(struct device *dev,
+				   unsigned int rate, int aud_blk);
+
+int mt8192_dai_set_priv(struct mtk_base_afe *afe, int id,
+			int priv_size, const void *priv_data);
+
+#endif
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-control.c b/sound/soc/mediatek/mt8192/mt8192-afe-control.c
new file mode 100644
index 0000000000000..9163e05e54e17
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-control.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// MediaTek ALSA SoC Audio Control
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Shane Chien <shane.chien@mediatek.com>
+//
+
+#include <linux/pm_runtime.h>
+
+#include "mt8192-afe-common.h"
+
+enum {
+	MTK_AFE_RATE_8K = 0,
+	MTK_AFE_RATE_11K = 1,
+	MTK_AFE_RATE_12K = 2,
+	MTK_AFE_RATE_384K = 3,
+	MTK_AFE_RATE_16K = 4,
+	MTK_AFE_RATE_22K = 5,
+	MTK_AFE_RATE_24K = 6,
+	MTK_AFE_RATE_352K = 7,
+	MTK_AFE_RATE_32K = 8,
+	MTK_AFE_RATE_44K = 9,
+	MTK_AFE_RATE_48K = 10,
+	MTK_AFE_RATE_88K = 11,
+	MTK_AFE_RATE_96K = 12,
+	MTK_AFE_RATE_176K = 13,
+	MTK_AFE_RATE_192K = 14,
+	MTK_AFE_RATE_260K = 15,
+};
+
+enum {
+	MTK_AFE_DAI_MEMIF_RATE_8K = 0,
+	MTK_AFE_DAI_MEMIF_RATE_16K = 1,
+	MTK_AFE_DAI_MEMIF_RATE_32K = 2,
+	MTK_AFE_DAI_MEMIF_RATE_48K = 3,
+};
+
+enum {
+	MTK_AFE_PCM_RATE_8K = 0,
+	MTK_AFE_PCM_RATE_16K = 1,
+	MTK_AFE_PCM_RATE_32K = 2,
+	MTK_AFE_PCM_RATE_48K = 3,
+};
+
+unsigned int mt8192_general_rate_transform(struct device *dev,
+					   unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_RATE_8K;
+	case 11025:
+		return MTK_AFE_RATE_11K;
+	case 12000:
+		return MTK_AFE_RATE_12K;
+	case 16000:
+		return MTK_AFE_RATE_16K;
+	case 22050:
+		return MTK_AFE_RATE_22K;
+	case 24000:
+		return MTK_AFE_RATE_24K;
+	case 32000:
+		return MTK_AFE_RATE_32K;
+	case 44100:
+		return MTK_AFE_RATE_44K;
+	case 48000:
+		return MTK_AFE_RATE_48K;
+	case 88200:
+		return MTK_AFE_RATE_88K;
+	case 96000:
+		return MTK_AFE_RATE_96K;
+	case 176400:
+		return MTK_AFE_RATE_176K;
+	case 192000:
+		return MTK_AFE_RATE_192K;
+	case 260000:
+		return MTK_AFE_RATE_260K;
+	case 352800:
+		return MTK_AFE_RATE_352K;
+	case 384000:
+		return MTK_AFE_RATE_384K;
+	default:
+		dev_warn(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_RATE_48K);
+		return MTK_AFE_RATE_48K;
+	}
+}
+
+static unsigned int dai_memif_rate_transform(struct device *dev,
+					     unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_DAI_MEMIF_RATE_8K;
+	case 16000:
+		return MTK_AFE_DAI_MEMIF_RATE_16K;
+	case 32000:
+		return MTK_AFE_DAI_MEMIF_RATE_32K;
+	case 48000:
+		return MTK_AFE_DAI_MEMIF_RATE_48K;
+	default:
+		dev_warn(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_DAI_MEMIF_RATE_16K);
+		return MTK_AFE_DAI_MEMIF_RATE_16K;
+	}
+}
+
+static unsigned int pcm_rate_transform(struct device *dev,
+				       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_PCM_RATE_8K;
+	case 16000:
+		return MTK_AFE_PCM_RATE_16K;
+	case 32000:
+		return MTK_AFE_PCM_RATE_32K;
+	case 48000:
+		return MTK_AFE_PCM_RATE_48K;
+	default:
+		dev_warn(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_PCM_RATE_32K);
+		return MTK_AFE_PCM_RATE_32K;
+	}
+}
+
+unsigned int mt8192_rate_transform(struct device *dev,
+				   unsigned int rate, int aud_blk)
+{
+	switch (aud_blk) {
+	case MT8192_MEMIF_DAI:
+	case MT8192_MEMIF_MOD_DAI:
+		return dai_memif_rate_transform(dev, rate);
+	case MT8192_DAI_PCM_1:
+	case MT8192_DAI_PCM_2:
+		return pcm_rate_transform(dev, rate);
+	default:
+		return mt8192_general_rate_transform(dev, rate);
+	}
+}
+
+int mt8192_dai_set_priv(struct mtk_base_afe *afe, int id,
+			int priv_size, const void *priv_data)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	void *temp_data;
+
+	temp_data = devm_kzalloc(afe->dev,
+				 priv_size,
+				 GFP_KERNEL);
+	if (!temp_data)
+		return -ENOMEM;
+
+	if (priv_data)
+		memcpy(temp_data, priv_data, priv_size);
+
+	afe_priv->dai_priv[id] = temp_data;
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
new file mode 100644
index 0000000000000..ea000888c9e82
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8192-afe-gpio.c  --  Mediatek 8192 afe gpio ctrl
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Shane Chien <shane.chien@mediatek.com>
+//
+
+#include <linux/gpio.h>
+#include <linux/pinctrl/consumer.h>
+
+#include "mt8192-afe-common.h"
+#include "mt8192-afe-gpio.h"
+
+struct pinctrl *aud_pinctrl;
+
+enum mt8192_afe_gpio {
+	MT8192_AFE_GPIO_DAT_MISO_OFF,
+	MT8192_AFE_GPIO_DAT_MISO_ON,
+	MT8192_AFE_GPIO_DAT_MOSI_OFF,
+	MT8192_AFE_GPIO_DAT_MOSI_ON,
+	MT8192_AFE_GPIO_DAT_MISO_CH34_OFF,
+	MT8192_AFE_GPIO_DAT_MISO_CH34_ON,
+	MT8192_AFE_GPIO_DAT_MOSI_CH34_OFF,
+	MT8192_AFE_GPIO_DAT_MOSI_CH34_ON,
+	MT8192_AFE_GPIO_I2S0_OFF,
+	MT8192_AFE_GPIO_I2S0_ON,
+	MT8192_AFE_GPIO_I2S1_OFF,
+	MT8192_AFE_GPIO_I2S1_ON,
+	MT8192_AFE_GPIO_I2S2_OFF,
+	MT8192_AFE_GPIO_I2S2_ON,
+	MT8192_AFE_GPIO_I2S3_OFF,
+	MT8192_AFE_GPIO_I2S3_ON,
+	MT8192_AFE_GPIO_I2S5_OFF,
+	MT8192_AFE_GPIO_I2S5_ON,
+	MT8192_AFE_GPIO_I2S6_OFF,
+	MT8192_AFE_GPIO_I2S6_ON,
+	MT8192_AFE_GPIO_I2S7_OFF,
+	MT8192_AFE_GPIO_I2S7_ON,
+	MT8192_AFE_GPIO_I2S8_OFF,
+	MT8192_AFE_GPIO_I2S8_ON,
+	MT8192_AFE_GPIO_I2S9_OFF,
+	MT8192_AFE_GPIO_I2S9_ON,
+	MT8192_AFE_GPIO_VOW_DAT_OFF,
+	MT8192_AFE_GPIO_VOW_DAT_ON,
+	MT8192_AFE_GPIO_VOW_CLK_OFF,
+	MT8192_AFE_GPIO_VOW_CLK_ON,
+	MT8192_AFE_GPIO_CLK_MOSI_OFF,
+	MT8192_AFE_GPIO_CLK_MOSI_ON,
+	MT8192_AFE_GPIO_TDM_OFF,
+	MT8192_AFE_GPIO_TDM_ON,
+	MT8192_AFE_GPIO_GPIO_NUM
+};
+
+struct audio_gpio_attr {
+	const char *name;
+	bool gpio_prepare;
+	struct pinctrl_state *gpioctrl;
+};
+
+static struct audio_gpio_attr aud_gpios[MT8192_AFE_GPIO_GPIO_NUM] = {
+	[MT8192_AFE_GPIO_DAT_MISO_OFF] = {"aud_dat_miso_off", false, NULL},
+	[MT8192_AFE_GPIO_DAT_MISO_ON] = {"aud_dat_miso_on", false, NULL},
+	[MT8192_AFE_GPIO_DAT_MOSI_OFF] = {"aud_dat_mosi_off", false, NULL},
+	[MT8192_AFE_GPIO_DAT_MOSI_ON] = {"aud_dat_mosi_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S0_OFF] = {"aud_gpio_i2s0_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S0_ON] = {"aud_gpio_i2s0_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S1_OFF] = {"aud_gpio_i2s1_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S1_ON] = {"aud_gpio_i2s1_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S2_OFF] = {"aud_gpio_i2s2_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S2_ON] = {"aud_gpio_i2s2_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S3_OFF] = {"aud_gpio_i2s3_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S3_ON] = {"aud_gpio_i2s3_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S5_OFF] = {"aud_gpio_i2s5_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S5_ON] = {"aud_gpio_i2s5_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S6_OFF] = {"aud_gpio_i2s6_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S6_ON] = {"aud_gpio_i2s6_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S7_OFF] = {"aud_gpio_i2s7_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S7_ON] = {"aud_gpio_i2s7_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S8_OFF] = {"aud_gpio_i2s8_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S8_ON] = {"aud_gpio_i2s8_on", false, NULL},
+	[MT8192_AFE_GPIO_I2S9_OFF] = {"aud_gpio_i2s9_off", false, NULL},
+	[MT8192_AFE_GPIO_I2S9_ON] = {"aud_gpio_i2s9_on", false, NULL},
+	[MT8192_AFE_GPIO_TDM_OFF] = {"aud_gpio_tdm_off", false, NULL},
+	[MT8192_AFE_GPIO_TDM_ON] = {"aud_gpio_tdm_on", false, NULL},
+	[MT8192_AFE_GPIO_VOW_DAT_OFF] = {"vow_dat_miso_off", false, NULL},
+	[MT8192_AFE_GPIO_VOW_DAT_ON] = {"vow_dat_miso_on", false, NULL},
+	[MT8192_AFE_GPIO_VOW_CLK_OFF] = {"vow_clk_miso_off", false, NULL},
+	[MT8192_AFE_GPIO_VOW_CLK_ON] = {"vow_clk_miso_on", false, NULL},
+	[MT8192_AFE_GPIO_DAT_MISO_CH34_OFF] = {"aud_dat_miso_ch34_off",
+					       false, NULL},
+	[MT8192_AFE_GPIO_DAT_MISO_CH34_ON] = {"aud_dat_miso_ch34_on",
+					      false, NULL},
+	[MT8192_AFE_GPIO_DAT_MOSI_CH34_OFF] = {"aud_dat_mosi_ch34_off",
+					       false, NULL},
+	[MT8192_AFE_GPIO_DAT_MOSI_CH34_ON] = {"aud_dat_mosi_ch34_on",
+					      false, NULL},
+	[MT8192_AFE_GPIO_CLK_MOSI_OFF] = {"aud_clk_mosi_off", false, NULL},
+	[MT8192_AFE_GPIO_CLK_MOSI_ON] = {"aud_clk_mosi_on", false, NULL},
+};
+
+static DEFINE_MUTEX(gpio_request_mutex);
+
+static int mt8192_afe_gpio_select(struct device *dev,
+				  enum mt8192_afe_gpio type)
+{
+	int ret;
+
+	if (type < 0 || type >= MT8192_AFE_GPIO_GPIO_NUM) {
+		dev_err(dev, "%s(), error, invalid gpio type %d\n",
+			__func__, type);
+		return -EINVAL;
+	}
+
+	if (!aud_gpios[type].gpio_prepare) {
+		dev_warn(dev, "%s(), error, gpio type %d not prepared\n",
+			 __func__, type);
+		return -EIO;
+	}
+
+	ret = pinctrl_select_state(aud_pinctrl,
+				   aud_gpios[type].gpioctrl);
+	if (ret) {
+		dev_dbg(dev, "%s(), error, can not set gpio type %d\n",
+			__func__, type);
+	}
+
+	return ret;
+}
+
+int mt8192_afe_gpio_init(struct device *dev)
+{
+	int i, ret;
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
+			dev_dbg(dev, "%s(), pinctrl_lookup_state %s fail, ret %d\n",
+				__func__, aud_gpios[i].name, ret);
+		} else {
+			aud_gpios[i].gpio_prepare = true;
+		}
+	}
+
+	mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_CLK_MOSI_ON);
+
+	/* gpio status init */
+	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 0);
+	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 1);
+
+	return 0;
+}
+
+static int mt8192_afe_gpio_adda_dl(struct device *dev, bool enable)
+{
+	if (enable) {
+		return mt8192_afe_gpio_select(dev,
+					      MT8192_AFE_GPIO_DAT_MOSI_ON);
+	} else {
+		return mt8192_afe_gpio_select(dev,
+					      MT8192_AFE_GPIO_DAT_MOSI_OFF);
+	}
+}
+
+static int mt8192_afe_gpio_adda_ul(struct device *dev, bool enable)
+{
+	if (enable) {
+		return mt8192_afe_gpio_select(dev,
+					      MT8192_AFE_GPIO_DAT_MISO_ON);
+	} else {
+		return mt8192_afe_gpio_select(dev,
+					      MT8192_AFE_GPIO_DAT_MISO_OFF);
+	}
+}
+
+static int mt8192_afe_gpio_adda_ch34_dl(struct device *dev, bool enable)
+{
+	if (enable) {
+		return mt8192_afe_gpio_select(dev,
+			MT8192_AFE_GPIO_DAT_MOSI_CH34_ON);
+	} else {
+		return mt8192_afe_gpio_select(dev,
+			MT8192_AFE_GPIO_DAT_MOSI_CH34_OFF);
+	}
+}
+
+static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
+{
+	if (enable) {
+		return mt8192_afe_gpio_select(dev,
+			MT8192_AFE_GPIO_DAT_MISO_CH34_ON);
+	} else {
+		return mt8192_afe_gpio_select(dev,
+			MT8192_AFE_GPIO_DAT_MISO_CH34_OFF);
+	}
+}
+
+int mt8192_afe_gpio_request(struct device *dev, bool enable,
+			    int dai, int uplink)
+{
+	mutex_lock(&gpio_request_mutex);
+	switch (dai) {
+	case MT8192_DAI_ADDA:
+		if (uplink)
+			mt8192_afe_gpio_adda_ul(dev, enable);
+		else
+			mt8192_afe_gpio_adda_dl(dev, enable);
+		break;
+	case MT8192_DAI_ADDA_CH34:
+		if (uplink)
+			mt8192_afe_gpio_adda_ch34_ul(dev, enable);
+		else
+			mt8192_afe_gpio_adda_ch34_dl(dev, enable);
+		break;
+	case MT8192_DAI_I2S_0:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_OFF);
+		break;
+	case MT8192_DAI_I2S_1:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_OFF);
+		break;
+	case MT8192_DAI_I2S_2:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_OFF);
+		break;
+	case MT8192_DAI_I2S_3:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_OFF);
+		break;
+	case MT8192_DAI_I2S_5:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_OFF);
+		break;
+	case MT8192_DAI_I2S_6:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_OFF);
+		break;
+	case MT8192_DAI_I2S_7:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_OFF);
+		break;
+	case MT8192_DAI_I2S_8:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_OFF);
+		break;
+	case MT8192_DAI_I2S_9:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_OFF);
+		break;
+	case MT8192_DAI_TDM:
+		if (enable)
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_ON);
+		else
+			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_OFF);
+		break;
+	case MT8192_DAI_VOW:
+		if (enable) {
+			mt8192_afe_gpio_select(dev,
+					       MT8192_AFE_GPIO_VOW_CLK_ON);
+			mt8192_afe_gpio_select(dev,
+					       MT8192_AFE_GPIO_VOW_DAT_ON);
+		} else {
+			mt8192_afe_gpio_select(dev,
+					       MT8192_AFE_GPIO_VOW_CLK_OFF);
+			mt8192_afe_gpio_select(dev,
+					       MT8192_AFE_GPIO_VOW_DAT_OFF);
+		}
+		break;
+	default:
+		mutex_unlock(&gpio_request_mutex);
+		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
+		return -EINVAL;
+	}
+	mutex_unlock(&gpio_request_mutex);
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.h b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.h
new file mode 100644
index 0000000000000..5d29469da1c15
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8192-afe-gpio.h  --  Mediatek 8192 afe gpio ctrl definition
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Shane Chien <shane.chien@mediatek.com>
+ */
+
+#ifndef _MT8192_AFE_GPIO_H_
+#define _MT8192_AFE_GPIO_H_
+
+struct device;
+
+int mt8192_afe_gpio_init(struct device *dev);
+
+int mt8192_afe_gpio_request(struct device *dev, bool enable,
+			    int dai, int uplink);
+
+#endif
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
new file mode 100644
index 0000000000000..4a4729f254ed0
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -0,0 +1,2389 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Mediatek ALSA SoC AFE platform driver for 8192
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Shane Chien <shane.chien@mediatek.com>
+//
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <sound/soc.h>
+
+#include "../common/mtk-afe-fe-dai.h"
+#include "../common/mtk-afe-platform-driver.h"
+
+#include "mt8192-afe-common.h"
+#include "mt8192-afe-clk.h"
+#include "mt8192-afe-gpio.h"
+#include "mt8192-interconnection.h"
+
+static const struct snd_pcm_hardware mt8192_afe_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP_VALID),
+	.formats = (SNDRV_PCM_FMTBIT_S16_LE |
+		    SNDRV_PCM_FMTBIT_S24_LE |
+		    SNDRV_PCM_FMTBIT_S32_LE),
+	.period_bytes_min = 96,
+	.period_bytes_max = 4 * 48 * 1024,
+	.periods_min = 2,
+	.periods_max = 256,
+	.buffer_bytes_max = 4 * 48 * 1024,
+	.fifo_size = 0,
+};
+
+static int mt8192_memif_fs(struct snd_pcm_substream *substream,
+			   unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+
+	return mt8192_rate_transform(afe->dev, rate, id);
+}
+
+static int mt8192_get_dai_fs(struct mtk_base_afe *afe,
+			     int dai_id, unsigned int rate)
+{
+	return mt8192_rate_transform(afe->dev, rate, dai_id);
+}
+
+static int mt8192_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+
+	return mt8192_general_rate_transform(afe->dev, rate);
+}
+
+int mt8192_get_memif_pbuf_size(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if ((runtime->period_size * 1000) / runtime->rate > 10)
+		return MT8192_MEMIF_PBUF_SIZE_256_BYTES;
+	else
+		return MT8192_MEMIF_PBUF_SIZE_32_BYTES;
+}
+
+#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000_48000 |\
+		       SNDRV_PCM_RATE_88200 |\
+		       SNDRV_PCM_RATE_96000 |\
+		       SNDRV_PCM_RATE_176400 |\
+		       SNDRV_PCM_RATE_192000)
+
+#define MTK_PCM_DAI_RATES (SNDRV_PCM_RATE_8000 |\
+			   SNDRV_PCM_RATE_16000 |\
+			   SNDRV_PCM_RATE_32000 |\
+			   SNDRV_PCM_RATE_48000)
+
+#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mt8192_memif_dai_driver[] = {
+	/* FE DAIs: memory intefaces to CPU */
+	{
+		.name = "DL1",
+		.id = MT8192_MEMIF_DL1,
+		.playback = {
+			.stream_name = "DL1",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL12",
+		.id = MT8192_MEMIF_DL12,
+		.playback = {
+			.stream_name = "DL12",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL2",
+		.id = MT8192_MEMIF_DL2,
+		.playback = {
+			.stream_name = "DL2",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL3",
+		.id = MT8192_MEMIF_DL3,
+		.playback = {
+			.stream_name = "DL3",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL4",
+		.id = MT8192_MEMIF_DL4,
+		.playback = {
+			.stream_name = "DL4",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL5",
+		.id = MT8192_MEMIF_DL5,
+		.playback = {
+			.stream_name = "DL5",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL6",
+		.id = MT8192_MEMIF_DL6,
+		.playback = {
+			.stream_name = "DL6",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL7",
+		.id = MT8192_MEMIF_DL7,
+		.playback = {
+			.stream_name = "DL7",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL8",
+		.id = MT8192_MEMIF_DL8,
+		.playback = {
+			.stream_name = "DL8",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "DL9",
+		.id = MT8192_MEMIF_DL9,
+		.playback = {
+			.stream_name = "DL9",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL1",
+		.id = MT8192_MEMIF_VUL12,
+		.capture = {
+			.stream_name = "UL1",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL2",
+		.id = MT8192_MEMIF_AWB,
+		.capture = {
+			.stream_name = "UL2",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL3",
+		.id = MT8192_MEMIF_VUL2,
+		.capture = {
+			.stream_name = "UL3",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL4",
+		.id = MT8192_MEMIF_AWB2,
+		.capture = {
+			.stream_name = "UL4",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL5",
+		.id = MT8192_MEMIF_VUL3,
+		.capture = {
+			.stream_name = "UL5",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL6",
+		.id = MT8192_MEMIF_VUL4,
+		.capture = {
+			.stream_name = "UL6",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL7",
+		.id = MT8192_MEMIF_VUL5,
+		.capture = {
+			.stream_name = "UL7",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL8",
+		.id = MT8192_MEMIF_VUL6,
+		.capture = {
+			.stream_name = "UL8",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL_MONO_1",
+		.id = MT8192_MEMIF_MOD_DAI,
+		.capture = {
+			.stream_name = "UL_MONO_1",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_DAI_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL_MONO_2",
+		.id = MT8192_MEMIF_DAI,
+		.capture = {
+			.stream_name = "UL_MONO_2",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_DAI_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "UL_MONO_3",
+		.id = MT8192_MEMIF_DAI2,
+		.capture = {
+			.stream_name = "UL_MONO_3",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_DAI_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+	{
+		.name = "HDMI",
+		.id = MT8192_MEMIF_HDMI,
+		.playback = {
+			.stream_name = "HDMI",
+			.channels_min = 2,
+			.channels_max = 8,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_afe_fe_ops,
+	},
+};
+
+static int ul_tinyconn_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int reg_shift;
+	unsigned int reg_mask_shift;
+
+	dev_info(afe->dev, "%s(), event 0x%x\n", __func__, event);
+
+	if (strstr(w->name, "UL1")) {
+		reg_shift = VUL1_USE_TINY_SFT;
+		reg_mask_shift = VUL1_USE_TINY_MASK_SFT;
+	} else if (strstr(w->name, "UL2")) {
+		reg_shift = VUL2_USE_TINY_SFT;
+		reg_mask_shift = VUL2_USE_TINY_MASK_SFT;
+	} else if (strstr(w->name, "UL3")) {
+		reg_shift = VUL12_USE_TINY_SFT;
+		reg_mask_shift = VUL12_USE_TINY_MASK_SFT;
+	} else if (strstr(w->name, "UL4")) {
+		reg_shift = AWB2_USE_TINY_SFT;
+		reg_mask_shift = AWB2_USE_TINY_MASK_SFT;
+	} else {
+		reg_shift = AWB2_USE_TINY_SFT;
+		reg_mask_shift = AWB2_USE_TINY_MASK_SFT;
+		dev_warn(afe->dev, "%s(), err widget name %s, default use UL4",
+			 __func__, w->name);
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		regmap_update_bits(afe->regmap, AFE_MEMIF_CONN, reg_mask_shift,
+				   0x1 << reg_shift);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_update_bits(afe->regmap, AFE_MEMIF_CONN, reg_mask_shift,
+				   0x0 << reg_shift);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+/* dma widget & routes*/
+static const struct snd_kcontrol_new memif_ul1_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN21,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN21,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN21,
+				    I_ADDA_UL_CH3, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN22,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN22,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN22,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN22,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN9,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN9,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN9,
+				    I_ADDA_UL_CH3, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN10,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN10,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN10,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN10,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul2_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1", AFE_CONN5,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN5,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1", AFE_CONN5,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN5,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN5,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN5_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN5_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN5_1,
+				    I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN5,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN5,
+				    I_PCM_2_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1", AFE_CONN5,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S6_CH1", AFE_CONN5_1,
+				    I_I2S6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S8_CH1", AFE_CONN5_1,
+				    I_I2S8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH1", AFE_CONN5_1,
+				    I_CONNSYS_I2S_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("SRC_1_OUT_CH1", AFE_CONN5_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul2_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN6,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN6,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2", AFE_CONN6,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN6,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN6,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN6_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN6_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN6_1,
+				    I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN6,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN6,
+				    I_PCM_2_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2", AFE_CONN6,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S6_CH2", AFE_CONN6_1,
+				    I_I2S6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S8_CH2", AFE_CONN6_1,
+				    I_I2S8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH2", AFE_CONN6_1,
+				    I_CONNSYS_I2S_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("SRC_1_OUT_CH2", AFE_CONN6_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul3_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH1", AFE_CONN32_1,
+				    I_CONNSYS_I2S_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN32,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN32,
+				    I_DL2_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul3_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH2", AFE_CONN33_1,
+				    I_CONNSYS_I2S_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul4_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN38,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1", AFE_CONN38,
+				    I_I2S0_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul4_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN39,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN39,
+				    I_I2S0_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul5_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN44,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul5_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN45,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul6_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN46,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN46,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1", AFE_CONN46,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN46_1,
+				    I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN46,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN46,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN46_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN46,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN46,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul6_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN47,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN47,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2", AFE_CONN47,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN47_1,
+				    I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN47,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN47,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN47_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN47,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN47,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul7_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN48,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul7_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN49,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul8_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN50,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul8_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN51,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_mono_1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN12,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN12,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_mono_2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN11,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_mono_3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN35,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+/* TINYCONN MUX */
+enum {
+	TINYCONN_CH1_MUX_I2S0 = 0x14,
+	TINYCONN_CH2_MUX_I2S0 = 0x15,
+	TINYCONN_CH1_MUX_I2S6 = 0x1a,
+	TINYCONN_CH2_MUX_I2S6 = 0x1b,
+	TINYCONN_CH1_MUX_I2S8 = 0x1c,
+	TINYCONN_CH2_MUX_I2S8 = 0x1d,
+	TINYCONN_MUX_NONE = 0x1f,
+};
+
+static const char * const tinyconn_mux_map[] = {
+	"NONE",
+	"I2S0_CH1",
+	"I2S0_CH2",
+	"I2S6_CH1",
+	"I2S6_CH2",
+	"I2S8_CH1",
+	"I2S8_CH2",
+};
+
+static int tinyconn_mux_map_value[] = {
+	TINYCONN_MUX_NONE,
+	TINYCONN_CH1_MUX_I2S0,
+	TINYCONN_CH2_MUX_I2S0,
+	TINYCONN_CH1_MUX_I2S6,
+	TINYCONN_CH2_MUX_I2S6,
+	TINYCONN_CH1_MUX_I2S8,
+	TINYCONN_CH2_MUX_I2S8,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(ul4_tinyconn_ch1_mux_map_enum,
+				  AFE_TINY_CONN0,
+				  O_2_CFG_SFT,
+				  O_2_CFG_MASK,
+				  tinyconn_mux_map,
+				  tinyconn_mux_map_value);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul4_tinyconn_ch2_mux_map_enum,
+				  AFE_TINY_CONN0,
+				  O_3_CFG_SFT,
+				  O_3_CFG_MASK,
+				  tinyconn_mux_map,
+				  tinyconn_mux_map_value);
+
+static const struct snd_kcontrol_new ul4_tinyconn_ch1_mux_control =
+	SOC_DAPM_ENUM("UL4_TINYCONN_CH1_MUX", ul4_tinyconn_ch1_mux_map_enum);
+static const struct snd_kcontrol_new ul4_tinyconn_ch2_mux_control =
+	SOC_DAPM_ENUM("UL4_TINYCONN_CH2_MUX", ul4_tinyconn_ch2_mux_map_enum);
+
+static const struct snd_soc_dapm_widget mt8192_memif_widgets[] = {
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("UL1_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch1_mix, ARRAY_SIZE(memif_ul1_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL1_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch2_mix, ARRAY_SIZE(memif_ul1_ch2_mix)),
+	SND_SOC_DAPM_MIXER("UL1_CH3", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch3_mix, ARRAY_SIZE(memif_ul1_ch3_mix)),
+	SND_SOC_DAPM_MIXER("UL1_CH4", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch4_mix, ARRAY_SIZE(memif_ul1_ch4_mix)),
+
+	SND_SOC_DAPM_MIXER("UL2_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul2_ch1_mix, ARRAY_SIZE(memif_ul2_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL2_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul2_ch2_mix, ARRAY_SIZE(memif_ul2_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL3_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul3_ch1_mix, ARRAY_SIZE(memif_ul3_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL3_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul3_ch2_mix, ARRAY_SIZE(memif_ul3_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL4_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul4_ch1_mix, ARRAY_SIZE(memif_ul4_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL4_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul4_ch2_mix, ARRAY_SIZE(memif_ul4_ch2_mix)),
+	SND_SOC_DAPM_MUX_E("UL4_TINYCONN_CH1_MUX", SND_SOC_NOPM, 0, 0,
+			   &ul4_tinyconn_ch1_mux_control,
+			   ul_tinyconn_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX_E("UL4_TINYCONN_CH2_MUX", SND_SOC_NOPM, 0, 0,
+			   &ul4_tinyconn_ch2_mux_control,
+			   ul_tinyconn_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_MIXER("UL5_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul5_ch1_mix, ARRAY_SIZE(memif_ul5_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL5_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul5_ch2_mix, ARRAY_SIZE(memif_ul5_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL6_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul6_ch1_mix, ARRAY_SIZE(memif_ul6_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL6_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul6_ch2_mix, ARRAY_SIZE(memif_ul6_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL7_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul7_ch1_mix, ARRAY_SIZE(memif_ul7_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL7_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul7_ch2_mix, ARRAY_SIZE(memif_ul7_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL8_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul8_ch1_mix, ARRAY_SIZE(memif_ul8_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL8_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul8_ch2_mix, ARRAY_SIZE(memif_ul8_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL_MONO_1_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul_mono_1_mix,
+			   ARRAY_SIZE(memif_ul_mono_1_mix)),
+
+	SND_SOC_DAPM_MIXER("UL_MONO_2_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul_mono_2_mix,
+			   ARRAY_SIZE(memif_ul_mono_2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL_MONO_3_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul_mono_3_mix,
+			   ARRAY_SIZE(memif_ul_mono_3_mix)),
+
+	SND_SOC_DAPM_INPUT("UL1_VIRTUAL_INPUT"),
+	SND_SOC_DAPM_INPUT("UL2_VIRTUAL_INPUT"),
+	SND_SOC_DAPM_INPUT("UL6_VIRTUAL_INPUT"),
+};
+
+static const struct snd_soc_dapm_route mt8192_memif_routes[] = {
+	{"UL1", NULL, "UL1_CH1"},
+	{"UL1", NULL, "UL1_CH2"},
+	{"UL1", NULL, "UL1_CH3"},
+	{"UL1", NULL, "UL1_CH4"},
+	{"UL1_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL1_CH1", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL1_CH1", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL1_CH2", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL1_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL1_CH2", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL1_CH2", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},
+	{"UL1_CH3", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL1_CH3", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL1_CH3", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL1_CH4", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL1_CH4", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL1_CH4", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL1_CH4", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},
+
+	{"UL2", NULL, "UL2_CH1"},
+	{"UL2", NULL, "UL2_CH2"},
+	{"UL2_CH1", "I2S0_CH1", "I2S0"},
+	{"UL2_CH2", "I2S0_CH2", "I2S0"},
+	{"UL2_CH1", "I2S2_CH1", "I2S2"},
+	{"UL2_CH2", "I2S2_CH2", "I2S2"},
+	{"UL2_CH1", "I2S6_CH1", "I2S6"},
+	{"UL2_CH2", "I2S6_CH2", "I2S6"},
+	{"UL2_CH1", "I2S8_CH1", "I2S8"},
+	{"UL2_CH2", "I2S8_CH2", "I2S8"},
+
+	{"UL2_CH1", "PCM_1_CAP_CH1", "PCM 1 Capture"},
+	{"UL2_CH2", "PCM_1_CAP_CH1", "PCM 1 Capture"},
+	{"UL2_CH1", "PCM_2_CAP_CH1", "PCM 2 Capture"},
+	{"UL2_CH2", "PCM_2_CAP_CH1", "PCM 2 Capture"},
+
+	{"UL_MONO_1", NULL, "UL_MONO_1_CH1"},
+	{"UL_MONO_1_CH1", "PCM_1_CAP_CH1", "PCM 1 Capture"},
+	{"UL_MONO_1_CH1", "PCM_2_CAP_CH1", "PCM 2 Capture"},
+
+	{"UL_MONO_2", NULL, "UL_MONO_2_CH1"},
+	{"UL_MONO_2_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+
+	{"UL_MONO_3", NULL, "UL_MONO_3_CH1"},
+	{"UL_MONO_3_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+
+	{"UL2_CH1", "CONNSYS_I2S_CH1", "Connsys I2S"},
+	{"UL2_CH2", "CONNSYS_I2S_CH2", "Connsys I2S"},
+
+	{"UL3", NULL, "UL3_CH1"},
+	{"UL3", NULL, "UL3_CH2"},
+	{"UL3_CH1", "CONNSYS_I2S_CH1", "Connsys I2S"},
+	{"UL3_CH2", "CONNSYS_I2S_CH2", "Connsys I2S"},
+
+	{"UL4", NULL, "UL4_CH1"},
+	{"UL4", NULL, "UL4_CH2"},
+	{"UL4", NULL, "UL4_TINYCONN_CH1_MUX"},
+	{"UL4", NULL, "UL4_TINYCONN_CH2_MUX"},
+	{"UL4_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL4_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL4_CH1", "I2S0_CH1", "I2S0"},
+	{"UL4_CH2", "I2S0_CH2", "I2S0"},
+	{"UL4_TINYCONN_CH1_MUX", "I2S0_CH1", "I2S0"},
+	{"UL4_TINYCONN_CH2_MUX", "I2S0_CH2", "I2S0"},
+
+	{"UL5", NULL, "UL5_CH1"},
+	{"UL5", NULL, "UL5_CH2"},
+	{"UL5_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL5_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+
+	{"UL6", NULL, "UL6_CH1"},
+	{"UL6", NULL, "UL6_CH2"},
+
+	{"UL6_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL6_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL6_CH1", "PCM_1_CAP_CH1", "PCM 1 Capture"},
+	{"UL6_CH2", "PCM_1_CAP_CH1", "PCM 1 Capture"},
+	{"UL6_CH1", "PCM_2_CAP_CH1", "PCM 2 Capture"},
+	{"UL6_CH2", "PCM_2_CAP_CH1", "PCM 2 Capture"},
+
+	{"UL7", NULL, "UL7_CH1"},
+	{"UL7", NULL, "UL7_CH2"},
+	{"UL7_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL7_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+
+	{"UL8", NULL, "UL8_CH1"},
+	{"UL8", NULL, "UL8_CH2"},
+	{"UL8_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL8_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+};
+
+static const struct mtk_base_memif_data memif_data[MT8192_MEMIF_NUM] = {
+	[MT8192_MEMIF_DL1] = {
+		.name = "DL1",
+		.id = MT8192_MEMIF_DL1,
+		.reg_ofs_base = AFE_DL1_BASE,
+		.reg_ofs_cur = AFE_DL1_CUR,
+		.reg_ofs_end = AFE_DL1_END,
+		.reg_ofs_base_msb = AFE_DL1_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL1_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL1_END_MSB,
+		.fs_reg = AFE_DL1_CON0,
+		.fs_shift = DL1_MODE_SFT,
+		.fs_maskbit = DL1_MODE_MASK,
+		.mono_reg = AFE_DL1_CON0,
+		.mono_shift = DL1_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL1_ON_SFT,
+		.hd_reg = AFE_DL1_CON0,
+		.hd_shift = DL1_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL1_CON0,
+		.hd_align_mshift = DL1_HALIGN_SFT,
+		.pbuf_reg = AFE_DL1_CON0,
+		.pbuf_shift = DL1_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL1_CON0,
+		.minlen_shift = DL1_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL12] = {
+		.name = "DL12",
+		.id = MT8192_MEMIF_DL12,
+		.reg_ofs_base = AFE_DL12_BASE,
+		.reg_ofs_cur = AFE_DL12_CUR,
+		.reg_ofs_end = AFE_DL12_END,
+		.reg_ofs_base_msb = AFE_DL12_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL12_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL12_END_MSB,
+		.fs_reg = AFE_DL12_CON0,
+		.fs_shift = DL12_MODE_SFT,
+		.fs_maskbit = DL12_MODE_MASK,
+		.mono_reg = AFE_DL12_CON0,
+		.mono_shift = DL12_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL12_ON_SFT,
+		.hd_reg = AFE_DL12_CON0,
+		.hd_shift = DL12_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL12_CON0,
+		.hd_align_mshift = DL12_HALIGN_SFT,
+		.pbuf_reg = AFE_DL12_CON0,
+		.pbuf_shift = DL12_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL12_CON0,
+		.minlen_shift = DL12_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL2] = {
+		.name = "DL2",
+		.id = MT8192_MEMIF_DL2,
+		.reg_ofs_base = AFE_DL2_BASE,
+		.reg_ofs_cur = AFE_DL2_CUR,
+		.reg_ofs_end = AFE_DL2_END,
+		.reg_ofs_base_msb = AFE_DL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL2_END_MSB,
+		.fs_reg = AFE_DL2_CON0,
+		.fs_shift = DL2_MODE_SFT,
+		.fs_maskbit = DL2_MODE_MASK,
+		.mono_reg = AFE_DL2_CON0,
+		.mono_shift = DL2_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL2_ON_SFT,
+		.hd_reg = AFE_DL2_CON0,
+		.hd_shift = DL2_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL2_CON0,
+		.hd_align_mshift = DL2_HALIGN_SFT,
+		.pbuf_reg = AFE_DL2_CON0,
+		.pbuf_shift = DL2_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL2_CON0,
+		.minlen_shift = DL2_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL3] = {
+		.name = "DL3",
+		.id = MT8192_MEMIF_DL3,
+		.reg_ofs_base = AFE_DL3_BASE,
+		.reg_ofs_cur = AFE_DL3_CUR,
+		.reg_ofs_end = AFE_DL3_END,
+		.reg_ofs_base_msb = AFE_DL3_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL3_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL3_END_MSB,
+		.fs_reg = AFE_DL3_CON0,
+		.fs_shift = DL3_MODE_SFT,
+		.fs_maskbit = DL3_MODE_MASK,
+		.mono_reg = AFE_DL3_CON0,
+		.mono_shift = DL3_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL3_ON_SFT,
+		.hd_reg = AFE_DL3_CON0,
+		.hd_shift = DL3_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL3_CON0,
+		.hd_align_mshift = DL3_HALIGN_SFT,
+		.pbuf_reg = AFE_DL3_CON0,
+		.pbuf_shift = DL3_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL3_CON0,
+		.minlen_shift = DL3_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL4] = {
+		.name = "DL4",
+		.id = MT8192_MEMIF_DL4,
+		.reg_ofs_base = AFE_DL4_BASE,
+		.reg_ofs_cur = AFE_DL4_CUR,
+		.reg_ofs_end = AFE_DL4_END,
+		.reg_ofs_base_msb = AFE_DL4_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL4_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL4_END_MSB,
+		.fs_reg = AFE_DL4_CON0,
+		.fs_shift = DL4_MODE_SFT,
+		.fs_maskbit = DL4_MODE_MASK,
+		.mono_reg = AFE_DL4_CON0,
+		.mono_shift = DL4_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL4_ON_SFT,
+		.hd_reg = AFE_DL4_CON0,
+		.hd_shift = DL4_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL4_CON0,
+		.hd_align_mshift = DL4_HALIGN_SFT,
+		.pbuf_reg = AFE_DL4_CON0,
+		.pbuf_shift = DL4_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL4_CON0,
+		.minlen_shift = DL4_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL5] = {
+		.name = "DL5",
+		.id = MT8192_MEMIF_DL5,
+		.reg_ofs_base = AFE_DL5_BASE,
+		.reg_ofs_cur = AFE_DL5_CUR,
+		.reg_ofs_end = AFE_DL5_END,
+		.reg_ofs_base_msb = AFE_DL5_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL5_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL5_END_MSB,
+		.fs_reg = AFE_DL5_CON0,
+		.fs_shift = DL5_MODE_SFT,
+		.fs_maskbit = DL5_MODE_MASK,
+		.mono_reg = AFE_DL5_CON0,
+		.mono_shift = DL5_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL5_ON_SFT,
+		.hd_reg = AFE_DL5_CON0,
+		.hd_shift = DL5_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL5_CON0,
+		.hd_align_mshift = DL5_HALIGN_SFT,
+		.pbuf_reg = AFE_DL5_CON0,
+		.pbuf_shift = DL5_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL5_CON0,
+		.minlen_shift = DL5_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL6] = {
+		.name = "DL6",
+		.id = MT8192_MEMIF_DL6,
+		.reg_ofs_base = AFE_DL6_BASE,
+		.reg_ofs_cur = AFE_DL6_CUR,
+		.reg_ofs_end = AFE_DL6_END,
+		.reg_ofs_base_msb = AFE_DL6_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL6_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL6_END_MSB,
+		.fs_reg = AFE_DL6_CON0,
+		.fs_shift = DL6_MODE_SFT,
+		.fs_maskbit = DL6_MODE_MASK,
+		.mono_reg = AFE_DL6_CON0,
+		.mono_shift = DL6_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL6_ON_SFT,
+		.hd_reg = AFE_DL6_CON0,
+		.hd_shift = DL6_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL6_CON0,
+		.hd_align_mshift = DL6_HALIGN_SFT,
+		.pbuf_reg = AFE_DL6_CON0,
+		.pbuf_shift = DL6_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL6_CON0,
+		.minlen_shift = DL6_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL7] = {
+		.name = "DL7",
+		.id = MT8192_MEMIF_DL7,
+		.reg_ofs_base = AFE_DL7_BASE,
+		.reg_ofs_cur = AFE_DL7_CUR,
+		.reg_ofs_end = AFE_DL7_END,
+		.reg_ofs_base_msb = AFE_DL7_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL7_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL7_END_MSB,
+		.fs_reg = AFE_DL7_CON0,
+		.fs_shift = DL7_MODE_SFT,
+		.fs_maskbit = DL7_MODE_MASK,
+		.mono_reg = AFE_DL7_CON0,
+		.mono_shift = DL7_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL7_ON_SFT,
+		.hd_reg = AFE_DL7_CON0,
+		.hd_shift = DL7_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL7_CON0,
+		.hd_align_mshift = DL7_HALIGN_SFT,
+		.pbuf_reg = AFE_DL7_CON0,
+		.pbuf_shift = DL7_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL7_CON0,
+		.minlen_shift = DL7_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL8] = {
+		.name = "DL8",
+		.id = MT8192_MEMIF_DL8,
+		.reg_ofs_base = AFE_DL8_BASE,
+		.reg_ofs_cur = AFE_DL8_CUR,
+		.reg_ofs_end = AFE_DL8_END,
+		.reg_ofs_base_msb = AFE_DL8_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL8_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL8_END_MSB,
+		.fs_reg = AFE_DL8_CON0,
+		.fs_shift = DL8_MODE_SFT,
+		.fs_maskbit = DL8_MODE_MASK,
+		.mono_reg = AFE_DL8_CON0,
+		.mono_shift = DL8_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL8_ON_SFT,
+		.hd_reg = AFE_DL8_CON0,
+		.hd_shift = DL8_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL8_CON0,
+		.hd_align_mshift = DL8_HALIGN_SFT,
+		.pbuf_reg = AFE_DL8_CON0,
+		.pbuf_shift = DL8_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL8_CON0,
+		.minlen_shift = DL8_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DL9] = {
+		.name = "DL9",
+		.id = MT8192_MEMIF_DL9,
+		.reg_ofs_base = AFE_DL9_BASE,
+		.reg_ofs_cur = AFE_DL9_CUR,
+		.reg_ofs_end = AFE_DL9_END,
+		.reg_ofs_base_msb = AFE_DL9_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL9_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL9_END_MSB,
+		.fs_reg = AFE_DL9_CON0,
+		.fs_shift = DL9_MODE_SFT,
+		.fs_maskbit = DL9_MODE_MASK,
+		.mono_reg = AFE_DL9_CON0,
+		.mono_shift = DL9_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL9_ON_SFT,
+		.hd_reg = AFE_DL9_CON0,
+		.hd_shift = DL9_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL9_CON0,
+		.hd_align_mshift = DL9_HALIGN_SFT,
+		.pbuf_reg = AFE_DL9_CON0,
+		.pbuf_shift = DL9_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL9_CON0,
+		.minlen_shift = DL9_MINLEN_SFT,
+	},
+	[MT8192_MEMIF_DAI] = {
+		.name = "DAI",
+		.id = MT8192_MEMIF_DAI,
+		.reg_ofs_base = AFE_DAI_BASE,
+		.reg_ofs_cur = AFE_DAI_CUR,
+		.reg_ofs_end = AFE_DAI_END,
+		.reg_ofs_base_msb = AFE_DAI_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DAI_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DAI_END_MSB,
+		.fs_reg = AFE_DAI_CON0,
+		.fs_shift = DAI_MODE_SFT,
+		.fs_maskbit = DAI_MODE_MASK,
+		.mono_reg = AFE_DAI_CON0,
+		.mono_shift = DAI_DUPLICATE_WR_SFT,
+		.mono_invert = 1,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DAI_ON_SFT,
+		.hd_reg = AFE_DAI_CON0,
+		.hd_shift = DAI_HD_MODE_SFT,
+		.hd_align_reg = AFE_DAI_CON0,
+		.hd_align_mshift = DAI_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_MOD_DAI] = {
+		.name = "MOD_DAI",
+		.id = MT8192_MEMIF_MOD_DAI,
+		.reg_ofs_base = AFE_MOD_DAI_BASE,
+		.reg_ofs_cur = AFE_MOD_DAI_CUR,
+		.reg_ofs_end = AFE_MOD_DAI_END,
+		.reg_ofs_base_msb = AFE_MOD_DAI_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_MOD_DAI_CUR_MSB,
+		.reg_ofs_end_msb = AFE_MOD_DAI_END_MSB,
+		.fs_reg = AFE_MOD_DAI_CON0,
+		.fs_shift = MOD_DAI_MODE_SFT,
+		.fs_maskbit = MOD_DAI_MODE_MASK,
+		.mono_reg = AFE_MOD_DAI_CON0,
+		.mono_shift = MOD_DAI_DUPLICATE_WR_SFT,
+		.mono_invert = 1,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = MOD_DAI_ON_SFT,
+		.hd_reg = AFE_MOD_DAI_CON0,
+		.hd_shift = MOD_DAI_HD_MODE_SFT,
+		.hd_align_reg = AFE_MOD_DAI_CON0,
+		.hd_align_mshift = MOD_DAI_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_DAI2] = {
+		.name = "DAI2",
+		.id = MT8192_MEMIF_DAI2,
+		.reg_ofs_base = AFE_DAI2_BASE,
+		.reg_ofs_cur = AFE_DAI2_CUR,
+		.reg_ofs_end = AFE_DAI2_END,
+		.reg_ofs_base_msb = AFE_DAI2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DAI2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DAI2_END_MSB,
+		.fs_reg = AFE_DAI2_CON0,
+		.fs_shift = DAI2_MODE_SFT,
+		.fs_maskbit = DAI2_MODE_MASK,
+		.mono_reg = AFE_DAI2_CON0,
+		.mono_shift = DAI2_DUPLICATE_WR_SFT,
+		.mono_invert = 1,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DAI2_ON_SFT,
+		.hd_reg = AFE_DAI2_CON0,
+		.hd_shift = DAI2_HD_MODE_SFT,
+		.hd_align_reg = AFE_DAI2_CON0,
+		.hd_align_mshift = DAI2_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_VUL12] = {
+		.name = "VUL12",
+		.id = MT8192_MEMIF_VUL12,
+		.reg_ofs_base = AFE_VUL12_BASE,
+		.reg_ofs_cur = AFE_VUL12_CUR,
+		.reg_ofs_end = AFE_VUL12_END,
+		.reg_ofs_base_msb = AFE_VUL12_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL12_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL12_END_MSB,
+		.fs_reg = AFE_VUL12_CON0,
+		.fs_shift = VUL12_MODE_SFT,
+		.fs_maskbit = VUL12_MODE_MASK,
+		.mono_reg = AFE_VUL12_CON0,
+		.mono_shift = VUL12_MONO_SFT,
+		.quad_ch_reg = AFE_VUL12_CON0,
+		.quad_ch_shift = VUL12_4CH_EN_SFT,
+		.quad_ch_mask = VUL12_4CH_EN_MASK,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL12_ON_SFT,
+		.hd_reg = AFE_VUL12_CON0,
+		.hd_shift = VUL12_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL12_CON0,
+		.hd_align_mshift = VUL12_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_VUL2] = {
+		.name = "VUL2",
+		.id = MT8192_MEMIF_VUL2,
+		.reg_ofs_base = AFE_VUL2_BASE,
+		.reg_ofs_cur = AFE_VUL2_CUR,
+		.reg_ofs_end = AFE_VUL2_END,
+		.reg_ofs_base_msb = AFE_VUL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL2_END_MSB,
+		.fs_reg = AFE_VUL2_CON0,
+		.fs_shift = VUL2_MODE_SFT,
+		.fs_maskbit = VUL2_MODE_MASK,
+		.mono_reg = AFE_VUL2_CON0,
+		.mono_shift = VUL2_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL2_ON_SFT,
+		.hd_reg = AFE_VUL2_CON0,
+		.hd_shift = VUL2_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL2_CON0,
+		.hd_align_mshift = VUL2_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_AWB] = {
+		.name = "AWB",
+		.id = MT8192_MEMIF_AWB,
+		.reg_ofs_base = AFE_AWB_BASE,
+		.reg_ofs_cur = AFE_AWB_CUR,
+		.reg_ofs_end = AFE_AWB_END,
+		.reg_ofs_base_msb = AFE_AWB_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB_END_MSB,
+		.fs_reg = AFE_AWB_CON0,
+		.fs_shift = AWB_MODE_SFT,
+		.fs_maskbit = AWB_MODE_MASK,
+		.mono_reg = AFE_AWB_CON0,
+		.mono_shift = AWB_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = AWB_ON_SFT,
+		.hd_reg = AFE_AWB_CON0,
+		.hd_shift = AWB_HD_MODE_SFT,
+		.hd_align_reg = AFE_AWB_CON0,
+		.hd_align_mshift = AWB_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_AWB2] = {
+		.name = "AWB2",
+		.id = MT8192_MEMIF_AWB2,
+		.reg_ofs_base = AFE_AWB2_BASE,
+		.reg_ofs_cur = AFE_AWB2_CUR,
+		.reg_ofs_end = AFE_AWB2_END,
+		.reg_ofs_base_msb = AFE_AWB2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB2_END_MSB,
+		.fs_reg = AFE_AWB2_CON0,
+		.fs_shift = AWB2_MODE_SFT,
+		.fs_maskbit = AWB2_MODE_MASK,
+		.mono_reg = AFE_AWB2_CON0,
+		.mono_shift = AWB2_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = AWB2_ON_SFT,
+		.hd_reg = AFE_AWB2_CON0,
+		.hd_shift = AWB2_HD_MODE_SFT,
+		.hd_align_reg = AFE_AWB2_CON0,
+		.hd_align_mshift = AWB2_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_VUL3] = {
+		.name = "VUL3",
+		.id = MT8192_MEMIF_VUL3,
+		.reg_ofs_base = AFE_VUL3_BASE,
+		.reg_ofs_cur = AFE_VUL3_CUR,
+		.reg_ofs_end = AFE_VUL3_END,
+		.reg_ofs_base_msb = AFE_VUL3_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL3_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL3_END_MSB,
+		.fs_reg = AFE_VUL3_CON0,
+		.fs_shift = VUL3_MODE_SFT,
+		.fs_maskbit = VUL3_MODE_MASK,
+		.mono_reg = AFE_VUL3_CON0,
+		.mono_shift = VUL3_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL3_ON_SFT,
+		.hd_reg = AFE_VUL3_CON0,
+		.hd_shift = VUL3_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL3_CON0,
+		.hd_align_mshift = VUL3_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_VUL4] = {
+		.name = "VUL4",
+		.id = MT8192_MEMIF_VUL4,
+		.reg_ofs_base = AFE_VUL4_BASE,
+		.reg_ofs_cur = AFE_VUL4_CUR,
+		.reg_ofs_end = AFE_VUL4_END,
+		.reg_ofs_base_msb = AFE_VUL4_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL4_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL4_END_MSB,
+		.fs_reg = AFE_VUL4_CON0,
+		.fs_shift = VUL4_MODE_SFT,
+		.fs_maskbit = VUL4_MODE_MASK,
+		.mono_reg = AFE_VUL4_CON0,
+		.mono_shift = VUL4_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL4_ON_SFT,
+		.hd_reg = AFE_VUL4_CON0,
+		.hd_shift = VUL4_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL4_CON0,
+		.hd_align_mshift = VUL4_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_VUL5] = {
+		.name = "VUL5",
+		.id = MT8192_MEMIF_VUL5,
+		.reg_ofs_base = AFE_VUL5_BASE,
+		.reg_ofs_cur = AFE_VUL5_CUR,
+		.reg_ofs_end = AFE_VUL5_END,
+		.reg_ofs_base_msb = AFE_VUL5_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL5_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL5_END_MSB,
+		.fs_reg = AFE_VUL5_CON0,
+		.fs_shift = VUL5_MODE_SFT,
+		.fs_maskbit = VUL5_MODE_MASK,
+		.mono_reg = AFE_VUL5_CON0,
+		.mono_shift = VUL5_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL5_ON_SFT,
+		.hd_reg = AFE_VUL5_CON0,
+		.hd_shift = VUL5_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL5_CON0,
+		.hd_align_mshift = VUL5_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_VUL6] = {
+		.name = "VUL6",
+		.id = MT8192_MEMIF_VUL6,
+		.reg_ofs_base = AFE_VUL6_BASE,
+		.reg_ofs_cur = AFE_VUL6_CUR,
+		.reg_ofs_end = AFE_VUL6_END,
+		.reg_ofs_base_msb = AFE_VUL6_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL6_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL6_END_MSB,
+		.fs_reg = AFE_VUL6_CON0,
+		.fs_shift = VUL6_MODE_SFT,
+		.fs_maskbit = VUL6_MODE_MASK,
+		.mono_reg = AFE_VUL6_CON0,
+		.mono_shift = VUL6_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL6_ON_SFT,
+		.hd_reg = AFE_VUL6_CON0,
+		.hd_shift = VUL6_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL6_CON0,
+		.hd_align_mshift = VUL6_HALIGN_SFT,
+	},
+	[MT8192_MEMIF_HDMI] = {
+		.name = "HDMI",
+		.id = MT8192_MEMIF_HDMI,
+		.reg_ofs_base = AFE_HDMI_OUT_BASE,
+		.reg_ofs_cur = AFE_HDMI_OUT_CUR,
+		.reg_ofs_end = AFE_HDMI_OUT_END,
+		.reg_ofs_base_msb = AFE_HDMI_OUT_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_HDMI_OUT_CUR_MSB,
+		.reg_ofs_end_msb = AFE_HDMI_OUT_END_MSB,
+		.fs_reg = -1,
+		.fs_shift = -1,
+		.fs_maskbit = -1,
+		.mono_reg = -1,
+		.mono_shift = -1,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = HDMI_OUT_ON_SFT,
+		.hd_reg = AFE_HDMI_OUT_CON0,
+		.hd_shift = HDMI_OUT_HD_MODE_SFT,
+		.hd_align_reg = AFE_HDMI_OUT_CON0,
+		.hd_align_mshift = HDMI_OUT_HALIGN_SFT,
+		.pbuf_reg = AFE_HDMI_OUT_CON0,
+		.minlen_reg = AFE_HDMI_OUT_CON0,
+		.minlen_shift = HDMI_OUT_MINLEN_SFT,
+	},
+};
+
+static const struct mtk_base_irq_data irq_data[MT8192_IRQ_NUM] = {
+	[MT8192_IRQ_0] = {
+		.id = MT8192_IRQ_0,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT0,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ0_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ0_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ0_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ0_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_1] = {
+		.id = MT8192_IRQ_1,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT1,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ1_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ1_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ1_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ1_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_2] = {
+		.id = MT8192_IRQ_2,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT2,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ2_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ2_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ2_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ2_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_3] = {
+		.id = MT8192_IRQ_3,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT3,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ3_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ3_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ3_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ3_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_4] = {
+		.id = MT8192_IRQ_4,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT4,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ4_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ4_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ4_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ4_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_5] = {
+		.id = MT8192_IRQ_5,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT5,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ5_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ5_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ5_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ5_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_6] = {
+		.id = MT8192_IRQ_6,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT6,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ6_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ6_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ6_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ6_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_7] = {
+		.id = MT8192_IRQ_7,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT7,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ7_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ7_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ7_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ7_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_8] = {
+		.id = MT8192_IRQ_8,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT8,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ8_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ8_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ8_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ8_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_9] = {
+		.id = MT8192_IRQ_9,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT9,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ9_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ9_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ9_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ9_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_10] = {
+		.id = MT8192_IRQ_10,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT10,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ10_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ10_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ10_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ10_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_11] = {
+		.id = MT8192_IRQ_11,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT11,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ11_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ11_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ11_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ11_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_12] = {
+		.id = MT8192_IRQ_12,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT12,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ12_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ12_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ12_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ12_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_13] = {
+		.id = MT8192_IRQ_13,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT13,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ13_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ13_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ13_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ13_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_14] = {
+		.id = MT8192_IRQ_14,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT14,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ14_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ14_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ14_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ14_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_15] = {
+		.id = MT8192_IRQ_15,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT15,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ15_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ15_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ15_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ15_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_16] = {
+		.id = MT8192_IRQ_16,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT16,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ16_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ16_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ16_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ16_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_17] = {
+		.id = MT8192_IRQ_17,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT17,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ17_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ17_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ17_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ17_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_18] = {
+		.id = MT8192_IRQ_18,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT18,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ18_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ18_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ18_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ18_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_19] = {
+		.id = MT8192_IRQ_19,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT19,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ19_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ19_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ19_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ19_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_20] = {
+		.id = MT8192_IRQ_20,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT20,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ20_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ20_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ20_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ20_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_21] = {
+		.id = MT8192_IRQ_21,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT21,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ21_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ21_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ21_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ21_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_22] = {
+		.id = MT8192_IRQ_22,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT22,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ22_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ22_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ22_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ22_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_23] = {
+		.id = MT8192_IRQ_23,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT23,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ23_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ23_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ23_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ23_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_24] = {
+		.id = MT8192_IRQ_24,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT24,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON4,
+		.irq_fs_shift = IRQ24_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ24_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ24_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ24_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_25] = {
+		.id = MT8192_IRQ_25,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT25,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON4,
+		.irq_fs_shift = IRQ25_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ25_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ25_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ25_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_26] = {
+		.id = MT8192_IRQ_26,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT26,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON4,
+		.irq_fs_shift = IRQ26_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ26_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ26_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ26_MCU_CLR_SFT,
+	},
+	[MT8192_IRQ_31] = {
+		.id = MT8192_IRQ_31,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT31,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = -1,
+		.irq_fs_maskbit = -1,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ31_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ31_MCU_CLR_SFT,
+	},
+};
+
+static const int memif_irq_usage[MT8192_MEMIF_NUM] = {
+	[MT8192_MEMIF_DL1] = MT8192_IRQ_0,
+	[MT8192_MEMIF_DL2] = MT8192_IRQ_1,
+	[MT8192_MEMIF_DL3] = MT8192_IRQ_2,
+	[MT8192_MEMIF_DL4] = MT8192_IRQ_3,
+	[MT8192_MEMIF_DL5] = MT8192_IRQ_4,
+	[MT8192_MEMIF_DL6] = MT8192_IRQ_5,
+	[MT8192_MEMIF_DL7] = MT8192_IRQ_6,
+	[MT8192_MEMIF_DL8] = MT8192_IRQ_7,
+	[MT8192_MEMIF_DL9] = MT8192_IRQ_8,
+	[MT8192_MEMIF_DL12] = MT8192_IRQ_9,
+	[MT8192_MEMIF_DAI] = MT8192_IRQ_10,
+	[MT8192_MEMIF_MOD_DAI] = MT8192_IRQ_11,
+	[MT8192_MEMIF_DAI2] = MT8192_IRQ_12,
+	[MT8192_MEMIF_VUL12] = MT8192_IRQ_13,
+	[MT8192_MEMIF_VUL2] = MT8192_IRQ_14,
+	[MT8192_MEMIF_AWB] = MT8192_IRQ_15,
+	[MT8192_MEMIF_AWB2] = MT8192_IRQ_16,
+	[MT8192_MEMIF_VUL3] = MT8192_IRQ_17,
+	[MT8192_MEMIF_VUL4] = MT8192_IRQ_18,
+	[MT8192_MEMIF_VUL5] = MT8192_IRQ_19,
+	[MT8192_MEMIF_VUL6] = MT8192_IRQ_20,
+	[MT8192_MEMIF_HDMI] = MT8192_IRQ_31,
+};
+
+static bool mt8192_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* these auto-gen reg has read-only bit, so put it as volatile */
+	/* volatile reg cannot be cached, so cannot be set when power off */
+	switch (reg) {
+	case AUDIO_TOP_CON0:	/* reg bit controlled by CCF */
+	case AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
+	case AUDIO_TOP_CON2:
+	case AUDIO_TOP_CON3:
+	case AFE_DL1_CUR_MSB:
+	case AFE_DL1_CUR:
+	case AFE_DL1_END:
+	case AFE_DL2_CUR_MSB:
+	case AFE_DL2_CUR:
+	case AFE_DL2_END:
+	case AFE_DL3_CUR_MSB:
+	case AFE_DL3_CUR:
+	case AFE_DL3_END:
+	case AFE_DL4_CUR_MSB:
+	case AFE_DL4_CUR:
+	case AFE_DL4_END:
+	case AFE_DL12_CUR_MSB:
+	case AFE_DL12_CUR:
+	case AFE_DL12_END:
+	case AFE_ADDA_SRC_DEBUG_MON0:
+	case AFE_ADDA_SRC_DEBUG_MON1:
+	case AFE_ADDA_UL_SRC_MON0:
+	case AFE_ADDA_UL_SRC_MON1:
+	case AFE_SECURE_CON0:
+	case AFE_SRAM_BOUND:
+	case AFE_SECURE_CON1:
+	case AFE_VUL_CUR_MSB:
+	case AFE_VUL_CUR:
+	case AFE_VUL_END:
+	case AFE_ADDA_3RD_DAC_DL_SDM_FIFO_MON:
+	case AFE_ADDA_3RD_DAC_DL_SRC_LCH_MON:
+	case AFE_ADDA_3RD_DAC_DL_SRC_RCH_MON:
+	case AFE_ADDA_3RD_DAC_DL_SDM_OUT_MON:
+	case AFE_SIDETONE_MON:
+	case AFE_SIDETONE_CON0:
+	case AFE_SIDETONE_COEFF:
+	case AFE_VUL2_CUR_MSB:
+	case AFE_VUL2_CUR:
+	case AFE_VUL2_END:
+	case AFE_VUL3_CUR_MSB:
+	case AFE_VUL3_CUR:
+	case AFE_VUL3_END:
+	case AFE_I2S_MON:
+	case AFE_DAC_MON:
+	case AFE_IRQ0_MCU_CNT_MON:
+	case AFE_IRQ6_MCU_CNT_MON:
+	case AFE_VUL4_CUR_MSB:
+	case AFE_VUL4_CUR:
+	case AFE_VUL4_END:
+	case AFE_VUL12_CUR_MSB:
+	case AFE_VUL12_CUR:
+	case AFE_VUL12_END:
+	case AFE_IRQ3_MCU_CNT_MON:
+	case AFE_IRQ4_MCU_CNT_MON:
+	case AFE_IRQ_MCU_STATUS:
+	case AFE_IRQ_MCU_CLR:
+	case AFE_IRQ_MCU_MON2:
+	case AFE_IRQ1_MCU_CNT_MON:
+	case AFE_IRQ2_MCU_CNT_MON:
+	case AFE_IRQ5_MCU_CNT_MON:
+	case AFE_IRQ7_MCU_CNT_MON:
+	case AFE_IRQ_MCU_MISS_CLR:
+	case AFE_GAIN1_CUR:
+	case AFE_GAIN2_CUR:
+	case AFE_SRAM_DELSEL_CON1:
+	case PCM_INTF_CON2:
+	case FPGA_CFG0:
+	case FPGA_CFG1:
+	case FPGA_CFG2:
+	case FPGA_CFG3:
+	case AUDIO_TOP_DBG_MON0:
+	case AUDIO_TOP_DBG_MON1:
+	case AFE_IRQ8_MCU_CNT_MON:
+	case AFE_IRQ11_MCU_CNT_MON:
+	case AFE_IRQ12_MCU_CNT_MON:
+	case AFE_IRQ9_MCU_CNT_MON:
+	case AFE_IRQ10_MCU_CNT_MON:
+	case AFE_IRQ13_MCU_CNT_MON:
+	case AFE_IRQ14_MCU_CNT_MON:
+	case AFE_IRQ15_MCU_CNT_MON:
+	case AFE_IRQ16_MCU_CNT_MON:
+	case AFE_IRQ17_MCU_CNT_MON:
+	case AFE_IRQ18_MCU_CNT_MON:
+	case AFE_IRQ19_MCU_CNT_MON:
+	case AFE_IRQ20_MCU_CNT_MON:
+	case AFE_IRQ21_MCU_CNT_MON:
+	case AFE_IRQ22_MCU_CNT_MON:
+	case AFE_IRQ23_MCU_CNT_MON:
+	case AFE_IRQ24_MCU_CNT_MON:
+	case AFE_IRQ25_MCU_CNT_MON:
+	case AFE_IRQ26_MCU_CNT_MON:
+	case AFE_IRQ31_MCU_CNT_MON:
+	case AFE_CBIP_MON0:
+	case AFE_CBIP_SLV_MUX_MON0:
+	case AFE_CBIP_SLV_DECODER_MON0:
+	case AFE_ADDA6_MTKAIF_MON0:
+	case AFE_ADDA6_MTKAIF_MON1:
+	case AFE_AWB_CUR_MSB:
+	case AFE_AWB_CUR:
+	case AFE_AWB_END:
+	case AFE_AWB2_CUR_MSB:
+	case AFE_AWB2_CUR:
+	case AFE_AWB2_END:
+	case AFE_DAI_CUR_MSB:
+	case AFE_DAI_CUR:
+	case AFE_DAI_END:
+	case AFE_DAI2_CUR_MSB:
+	case AFE_DAI2_CUR:
+	case AFE_DAI2_END:
+	case AFE_ADDA6_SRC_DEBUG_MON0:
+	case AFE_ADD6A_UL_SRC_MON0:
+	case AFE_ADDA6_UL_SRC_MON1:
+	case AFE_MOD_DAI_CUR_MSB:
+	case AFE_MOD_DAI_CUR:
+	case AFE_MOD_DAI_END:
+	case AFE_HDMI_OUT_CUR_MSB:
+	case AFE_HDMI_OUT_CUR:
+	case AFE_HDMI_OUT_END:
+	case AFE_AWB_RCH_MON:
+	case AFE_AWB_LCH_MON:
+	case AFE_VUL_RCH_MON:
+	case AFE_VUL_LCH_MON:
+	case AFE_VUL12_RCH_MON:
+	case AFE_VUL12_LCH_MON:
+	case AFE_VUL2_RCH_MON:
+	case AFE_VUL2_LCH_MON:
+	case AFE_DAI_DATA_MON:
+	case AFE_MOD_DAI_DATA_MON:
+	case AFE_DAI2_DATA_MON:
+	case AFE_AWB2_RCH_MON:
+	case AFE_AWB2_LCH_MON:
+	case AFE_VUL3_RCH_MON:
+	case AFE_VUL3_LCH_MON:
+	case AFE_VUL4_RCH_MON:
+	case AFE_VUL4_LCH_MON:
+	case AFE_VUL5_RCH_MON:
+	case AFE_VUL5_LCH_MON:
+	case AFE_VUL6_RCH_MON:
+	case AFE_VUL6_LCH_MON:
+	case AFE_DL1_RCH_MON:
+	case AFE_DL1_LCH_MON:
+	case AFE_DL2_RCH_MON:
+	case AFE_DL2_LCH_MON:
+	case AFE_DL12_RCH1_MON:
+	case AFE_DL12_LCH1_MON:
+	case AFE_DL12_RCH2_MON:
+	case AFE_DL12_LCH2_MON:
+	case AFE_DL3_RCH_MON:
+	case AFE_DL3_LCH_MON:
+	case AFE_DL4_RCH_MON:
+	case AFE_DL4_LCH_MON:
+	case AFE_DL5_RCH_MON:
+	case AFE_DL5_LCH_MON:
+	case AFE_DL6_RCH_MON:
+	case AFE_DL6_LCH_MON:
+	case AFE_DL7_RCH_MON:
+	case AFE_DL7_LCH_MON:
+	case AFE_DL8_RCH_MON:
+	case AFE_DL8_LCH_MON:
+	case AFE_VUL5_CUR_MSB:
+	case AFE_VUL5_CUR:
+	case AFE_VUL5_END:
+	case AFE_VUL6_CUR_MSB:
+	case AFE_VUL6_CUR:
+	case AFE_VUL6_END:
+	case AFE_ADDA_DL_SDM_FIFO_MON:
+	case AFE_ADDA_DL_SRC_LCH_MON:
+	case AFE_ADDA_DL_SRC_RCH_MON:
+	case AFE_ADDA_DL_SDM_OUT_MON:
+	case AFE_CONNSYS_I2S_MON:
+	case AFE_ASRC_2CH_CON0:
+	case AFE_ASRC_2CH_CON2:
+	case AFE_ASRC_2CH_CON3:
+	case AFE_ASRC_2CH_CON4:
+	case AFE_ASRC_2CH_CON5:
+	case AFE_ASRC_2CH_CON7:
+	case AFE_ASRC_2CH_CON8:
+	case AFE_ASRC_2CH_CON12:
+	case AFE_ASRC_2CH_CON13:
+	case AFE_DL9_CUR_MSB:
+	case AFE_DL9_CUR:
+	case AFE_DL9_END:
+	case AFE_ADDA_MTKAIF_MON0:
+	case AFE_ADDA_MTKAIF_MON1:
+	case AFE_DL_NLE_R_MON0:
+	case AFE_DL_NLE_R_MON1:
+	case AFE_DL_NLE_R_MON2:
+	case AFE_DL_NLE_L_MON0:
+	case AFE_DL_NLE_L_MON1:
+	case AFE_DL_NLE_L_MON2:
+	case AFE_GENERAL1_ASRC_2CH_CON0:
+	case AFE_GENERAL1_ASRC_2CH_CON2:
+	case AFE_GENERAL1_ASRC_2CH_CON3:
+	case AFE_GENERAL1_ASRC_2CH_CON4:
+	case AFE_GENERAL1_ASRC_2CH_CON5:
+	case AFE_GENERAL1_ASRC_2CH_CON7:
+	case AFE_GENERAL1_ASRC_2CH_CON8:
+	case AFE_GENERAL1_ASRC_2CH_CON12:
+	case AFE_GENERAL1_ASRC_2CH_CON13:
+	case AFE_GENERAL2_ASRC_2CH_CON0:
+	case AFE_GENERAL2_ASRC_2CH_CON2:
+	case AFE_GENERAL2_ASRC_2CH_CON3:
+	case AFE_GENERAL2_ASRC_2CH_CON4:
+	case AFE_GENERAL2_ASRC_2CH_CON5:
+	case AFE_GENERAL2_ASRC_2CH_CON7:
+	case AFE_GENERAL2_ASRC_2CH_CON8:
+	case AFE_GENERAL2_ASRC_2CH_CON12:
+	case AFE_GENERAL2_ASRC_2CH_CON13:
+	case AFE_DL9_RCH_MON:
+	case AFE_DL9_LCH_MON:
+	case AFE_DL5_CUR_MSB:
+	case AFE_DL5_CUR:
+	case AFE_DL5_END:
+	case AFE_DL6_CUR_MSB:
+	case AFE_DL6_CUR:
+	case AFE_DL6_END:
+	case AFE_DL7_CUR_MSB:
+	case AFE_DL7_CUR:
+	case AFE_DL7_END:
+	case AFE_DL8_CUR_MSB:
+	case AFE_DL8_CUR:
+	case AFE_DL8_END:
+	case AFE_PROT_SIDEBAND_MON:
+	case AFE_DOMAIN_SIDEBAND0_MON:
+	case AFE_DOMAIN_SIDEBAND1_MON:
+	case AFE_DOMAIN_SIDEBAND2_MON:
+	case AFE_DOMAIN_SIDEBAND3_MON:
+	case AFE_APLL1_TUNER_CFG:	/* [20:31] is monitor */
+	case AFE_APLL2_TUNER_CFG:	/* [20:31] is monitor */
+	case AFE_DAC_CON0:
+	case AFE_IRQ_MCU_CON0:
+	case AFE_IRQ_MCU_EN:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config mt8192_afe_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.volatile_reg = mt8192_is_volatile_reg,
+	.max_register = AFE_MAX_REGISTER,
+	.num_reg_defaults_raw = AFE_MAX_REGISTER,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static irqreturn_t mt8192_afe_irq_handler(int irq_id, void *dev)
+{
+	struct mtk_base_afe *afe = dev;
+	struct mtk_base_afe_irq *irq;
+	unsigned int status;
+	unsigned int status_mcu;
+	unsigned int mcu_en;
+	int ret;
+	int i;
+
+	/* get irq that is sent to MCU */
+	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &mcu_en);
+
+	ret = regmap_read(afe->regmap, AFE_IRQ_MCU_STATUS, &status);
+	/* only care IRQ which is sent to MCU */
+	status_mcu = status & mcu_en & AFE_IRQ_STATUS_BITS;
+
+	if (ret || status_mcu == 0) {
+		dev_err(afe->dev, "%s(), irq status err, ret %d, status 0x%x, mcu_en 0x%x\n",
+			__func__, ret, status, mcu_en);
+
+		goto err_irq;
+	}
+
+	for (i = 0; i < MT8192_MEMIF_NUM; i++) {
+		struct mtk_base_afe_memif *memif = &afe->memif[i];
+
+		if (!memif->substream)
+			continue;
+
+		if (memif->irq_usage < 0)
+			continue;
+
+		irq = &afe->irqs[memif->irq_usage];
+
+		if (status_mcu & (1 << irq->irq_data->irq_en_shift))
+			snd_pcm_period_elapsed(memif->substream);
+	}
+
+err_irq:
+	/* clear irq */
+	regmap_write(afe->regmap,
+		     AFE_IRQ_MCU_CLR,
+		     status_mcu);
+
+	return IRQ_HANDLED;
+}
+
+static int mt8192_afe_runtime_suspend(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	unsigned int value;
+	int ret;
+
+	dev_info(afe->dev, "%s()\n", __func__);
+
+	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
+		goto skip_regmap;
+
+	/* disable AFE */
+	regmap_update_bits(afe->regmap, AFE_DAC_CON0, AFE_ON_MASK_SFT, 0x0);
+
+	ret = regmap_read_poll_timeout(afe->regmap,
+				       AFE_DAC_MON,
+				       value,
+				       (value & AFE_ON_RETM_MASK_SFT) == 0,
+				       20,
+				       1 * 1000 * 1000);
+	if (ret)
+		dev_warn(afe->dev, "%s(), ret %d\n", __func__, ret);
+
+	/* make sure all irq status are cleared */
+	regmap_write(afe->regmap, AFE_IRQ_MCU_CLR, 0xffffffff);
+	regmap_write(afe->regmap, AFE_IRQ_MCU_CLR, 0xffffffff);
+
+	/* reset sgen */
+	regmap_write(afe->regmap, AFE_SINEGEN_CON0, 0x0);
+	regmap_update_bits(afe->regmap, AFE_SINEGEN_CON2,
+			   INNER_LOOP_BACK_MODE_MASK_SFT,
+			   0x3f << INNER_LOOP_BACK_MODE_SFT);
+
+	/* cache only */
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+skip_regmap:
+	mt8192_afe_disable_clock(afe);
+	return 0;
+}
+
+static int mt8192_afe_runtime_resume(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	dev_info(afe->dev, "%s()\n", __func__);
+
+	ret = mt8192_afe_enable_clock(afe);
+	if (ret)
+		return ret;
+
+	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
+		goto skip_regmap;
+
+	regcache_cache_only(afe->regmap, false);
+	regcache_sync(afe->regmap);
+
+	/* enable audio sys DCM for power saving */
+	regmap_update_bits(afe_priv->infracfg,
+			   PERI_BUS_DCM_CTRL, 0x1 << 29, 0x1 << 29);
+	regmap_update_bits(afe->regmap, AUDIO_TOP_CON0, 0x1 << 29, 0x1 << 29);
+
+	/* force cpu use 8_24 format when writing 32bit data */
+	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+
+	/* set all output port to 24bit */
+	regmap_write(afe->regmap, AFE_CONN_24BIT, 0xffffffff);
+	regmap_write(afe->regmap, AFE_CONN_24BIT_1, 0xffffffff);
+
+	/* enable AFE */
+	regmap_update_bits(afe->regmap, AFE_DAC_CON0, AFE_ON_MASK_SFT, 0x1);
+
+skip_regmap:
+	return 0;
+}
+
+static int mt8192_afe_component_probe(struct snd_soc_component *component)
+{
+	return mtk_afe_add_sub_dai_control(component);
+}
+
+const struct snd_soc_component_driver mt8192_afe_component = {
+	.name = AFE_PCM_NAME,
+	.probe = mt8192_afe_component_probe,
+	.pointer = mtk_afe_pcm_pointer,
+	.pcm_construct = mtk_afe_pcm_new,
+};
+
+static const struct snd_soc_component_driver mt8192_afe_pcm_component = {
+	.name = "mt8192-afe-pcm-dai",
+};
+
+static int mt8192_dai_memif_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mt8192_memif_dai_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mt8192_memif_dai_driver);
+
+	dai->dapm_widgets = mt8192_memif_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mt8192_memif_widgets);
+	dai->dapm_routes = mt8192_memif_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mt8192_memif_routes);
+	return 0;
+}
+
+typedef int (*dai_register_cb)(struct mtk_base_afe *);
+static const dai_register_cb dai_register_cbs[] = {
+	mt8192_dai_adda_register,
+	mt8192_dai_i2s_register,
+	mt8192_dai_pcm_register,
+	mt8192_dai_tdm_register,
+	mt8192_dai_memif_register,
+};
+
+static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe;
+	struct mt8192_afe_private *afe_priv;
+	struct device *dev;
+	struct reset_control *rstc;
+	int i, ret, irq_id;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	if (ret)
+		return ret;
+
+	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
+	if (!afe)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, afe);
+
+	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
+					  GFP_KERNEL);
+	if (!afe->platform_priv)
+		return -ENOMEM;
+	afe_priv = afe->platform_priv;
+
+	afe->dev = &pdev->dev;
+	dev = afe->dev;
+
+	/* init audio related clock */
+	ret = mt8192_init_clock(afe);
+	if (ret) {
+		dev_err(dev, "init clock error\n");
+		return ret;
+	}
+
+	/* reset controller to reset audio regs before regmap cache */
+	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
+	if (IS_ERR(rstc)) {
+		ret = PTR_ERR(rstc);
+		dev_err(dev, "could not get audiosys reset:%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_reset(rstc);
+	if (ret) {
+		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev))
+		goto err_pm_disable;
+
+	/* regmap init */
+	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(afe->regmap)) {
+		dev_err(dev, "could not get regmap from parent\n");
+		return PTR_ERR(afe->regmap);
+	}
+	ret = regmap_attach_dev(dev, afe->regmap, &mt8192_afe_regmap_config);
+	if (ret) {
+		dev_warn(dev, "regmap_attach_dev fail, ret %d\n", ret);
+		return ret;
+	}
+
+	/* enable clock for regcache get default value from hw */
+	afe_priv->pm_runtime_bypass_reg_ctl = true;
+	pm_runtime_get_sync(&pdev->dev);
+
+	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
+	if (ret) {
+		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put_sync(&pdev->dev);
+	afe_priv->pm_runtime_bypass_reg_ctl = false;
+
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+	/* init memif */
+	afe->memif_size = MT8192_MEMIF_NUM;
+	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
+				  GFP_KERNEL);
+	if (!afe->memif)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->memif_size; i++) {
+		afe->memif[i].data = &memif_data[i];
+		afe->memif[i].irq_usage = memif_irq_usage[i];
+		afe->memif[i].const_irq = 1;
+	}
+
+	mutex_init(&afe->irq_alloc_lock);	/* needed when dynamic irq */
+
+	/* init irq */
+	afe->irqs_size = MT8192_IRQ_NUM;
+	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
+				 GFP_KERNEL);
+	if (!afe->irqs)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->irqs_size; i++)
+		afe->irqs[i].irq_data = &irq_data[i];
+
+	/* request irq */
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id < 0)
+		return irq_id;
+
+	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
+	if (ret) {
+		dev_err(dev, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
+	}
+
+	/* init sub_dais */
+	INIT_LIST_HEAD(&afe->sub_dais);
+
+	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
+		ret = dai_register_cbs[i](afe);
+		if (ret) {
+			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
+				 i, ret);
+			goto err_pm_disable;
+		}
+	}
+
+	/* init dai_driver and component_driver */
+	ret = mtk_afe_combine_sub_dai(afe);
+	if (ret) {
+		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
+			 ret);
+		goto err_pm_disable;
+	}
+
+	/* others */
+	afe->mtk_afe_hardware = &mt8192_afe_hardware;
+	afe->memif_fs = mt8192_memif_fs;
+	afe->irq_fs = mt8192_irq_fs;
+	afe->get_dai_fs = mt8192_get_dai_fs;
+	afe->get_memif_pbuf_size = mt8192_get_memif_pbuf_size;
+	afe->memif_32bit_supported = 1;
+
+	afe->runtime_resume = mt8192_afe_runtime_resume;
+	afe->runtime_suspend = mt8192_afe_runtime_suspend;
+
+	/* register platform */
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &mt8192_afe_component, NULL, 0);
+	if (ret) {
+		dev_warn(dev, "err_platform\n");
+		goto err_pm_disable;
+	}
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &mt8192_afe_pcm_component,
+					      afe->dai_drivers,
+					      afe->num_dai_drivers);
+	if (ret) {
+		dev_warn(dev, "err_dai_component\n");
+		goto err_pm_disable;
+	}
+
+	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static int mt8192_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		mt8192_afe_runtime_suspend(&pdev->dev);
+
+	/* disable afe clock */
+	mt8192_afe_disable_clock(afe);
+	return 0;
+}
+
+static const struct of_device_id mt8192_afe_pcm_dt_match[] = {
+	{ .compatible = "mediatek,mt8192-audio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt8192_afe_pcm_dt_match);
+
+static const struct dev_pm_ops mt8192_afe_pm_ops = {
+	SET_RUNTIME_PM_OPS(mt8192_afe_runtime_suspend,
+			   mt8192_afe_runtime_resume, NULL)
+};
+
+static struct platform_driver mt8192_afe_pcm_driver = {
+	.driver = {
+		   .name = "mt8192-audio",
+		   .of_match_table = mt8192_afe_pcm_dt_match,
+#ifdef CONFIG_PM
+		   .pm = &mt8192_afe_pm_ops,
+#endif
+	},
+	.probe = mt8192_afe_pcm_dev_probe,
+	.remove = mt8192_afe_pcm_dev_remove,
+};
+
+module_platform_driver(mt8192_afe_pcm_driver);
+
+MODULE_DESCRIPTION("Mediatek ALSA SoC AFE platform driver for 8192");
+MODULE_AUTHOR("Shane Chien <shane.chien@mediatek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/mediatek/mt8192/mt8192-interconnection.h b/sound/soc/mediatek/mt8192/mt8192-interconnection.h
new file mode 100644
index 0000000000000..6a1bc7c1a8624
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-interconnection.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Mediatek MT8192 audio driver interconnection definition
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Shane Chien <shane.chien@mediatek.com>
+ */
+
+#ifndef _MT8192_INTERCONNECTION_H_
+#define _MT8192_INTERCONNECTION_H_
+
+/* in port define */
+#define I_I2S0_CH1 0
+#define I_I2S0_CH2 1
+#define I_ADDA_UL_CH1 3
+#define I_ADDA_UL_CH2 4
+#define I_DL1_CH1 5
+#define I_DL1_CH2 6
+#define I_DL2_CH1 7
+#define I_DL2_CH2 8
+#define I_PCM_1_CAP_CH1 9
+#define I_GAIN1_OUT_CH1 10
+#define I_GAIN1_OUT_CH2 11
+#define I_GAIN2_OUT_CH1 12
+#define I_GAIN2_OUT_CH2 13
+#define I_PCM_2_CAP_CH1 14
+#define I_ADDA_UL_CH3 17
+#define I_ADDA_UL_CH4 18
+#define I_DL12_CH1 19
+#define I_DL12_CH2 20
+#define I_PCM_2_CAP_CH2 21
+#define I_PCM_1_CAP_CH2 22
+#define I_DL3_CH1 23
+#define I_DL3_CH2 24
+#define I_I2S2_CH1 25
+#define I_I2S2_CH2 26
+#define I_I2S2_CH3 27
+#define I_I2S2_CH4 28
+
+/* in port define >= 32 */
+#define I_32_OFFSET 32
+#define I_CONNSYS_I2S_CH1 (34 - I_32_OFFSET)
+#define I_CONNSYS_I2S_CH2 (35 - I_32_OFFSET)
+#define I_SRC_1_OUT_CH1 (36 - I_32_OFFSET)
+#define I_SRC_1_OUT_CH2 (37 - I_32_OFFSET)
+#define I_SRC_2_OUT_CH1 (38 - I_32_OFFSET)
+#define I_SRC_2_OUT_CH2 (39 - I_32_OFFSET)
+#define I_DL4_CH1 (40 - I_32_OFFSET)
+#define I_DL4_CH2 (41 - I_32_OFFSET)
+#define I_DL5_CH1 (42 - I_32_OFFSET)
+#define I_DL5_CH2 (43 - I_32_OFFSET)
+#define I_DL6_CH1 (44 - I_32_OFFSET)
+#define I_DL6_CH2 (45 - I_32_OFFSET)
+#define I_DL7_CH1 (46 - I_32_OFFSET)
+#define I_DL7_CH2 (47 - I_32_OFFSET)
+#define I_DL8_CH1 (48 - I_32_OFFSET)
+#define I_DL8_CH2 (49 - I_32_OFFSET)
+#define I_DL9_CH1 (50 - I_32_OFFSET)
+#define I_DL9_CH2 (51 - I_32_OFFSET)
+#define I_I2S6_CH1 (52 - I_32_OFFSET)
+#define I_I2S6_CH2 (53 - I_32_OFFSET)
+#define I_I2S8_CH1 (54 - I_32_OFFSET)
+#define I_I2S8_CH2 (55 - I_32_OFFSET)
+
+#endif
diff --git a/sound/soc/mediatek/mt8192/mt8192-reg.h b/sound/soc/mediatek/mt8192/mt8192-reg.h
new file mode 100644
index 0000000000000..562f25c79c349
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-reg.h
@@ -0,0 +1,3131 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8192-reg.h  --  Mediatek 8192 audio driver reg definition
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Shane Chien <shane.chien@mediatek.com>
+ */
+
+#ifndef _MT8192_REG_H_
+#define _MT8192_REG_H_
+
+/* reg bit enum */
+enum {
+	MT8192_MEMIF_PBUF_SIZE_32_BYTES,
+	MT8192_MEMIF_PBUF_SIZE_64_BYTES,
+	MT8192_MEMIF_PBUF_SIZE_128_BYTES,
+	MT8192_MEMIF_PBUF_SIZE_256_BYTES,
+	MT8192_MEMIF_PBUF_SIZE_NUM,
+};
+
+/*****************************************************************************
+ *                  R E G I S T E R       D E F I N I T I O N
+ *****************************************************************************/
+/* AFE_DAC_CON0 */
+#define VUL12_ON_SFT                                   31
+#define VUL12_ON_MASK                                  0x1
+#define VUL12_ON_MASK_SFT                              (0x1 << 31)
+#define MOD_DAI_ON_SFT                                 30
+#define MOD_DAI_ON_MASK                                0x1
+#define MOD_DAI_ON_MASK_SFT                            (0x1 << 30)
+#define DAI_ON_SFT                                     29
+#define DAI_ON_MASK                                    0x1
+#define DAI_ON_MASK_SFT                                (0x1 << 29)
+#define DAI2_ON_SFT                                    28
+#define DAI2_ON_MASK                                   0x1
+#define DAI2_ON_MASK_SFT                               (0x1 << 28)
+#define VUL6_ON_SFT                                    23
+#define VUL6_ON_MASK                                   0x1
+#define VUL6_ON_MASK_SFT                               (0x1 << 23)
+#define VUL5_ON_SFT                                    22
+#define VUL5_ON_MASK                                   0x1
+#define VUL5_ON_MASK_SFT                               (0x1 << 22)
+#define VUL4_ON_SFT                                    21
+#define VUL4_ON_MASK                                   0x1
+#define VUL4_ON_MASK_SFT                               (0x1 << 21)
+#define VUL3_ON_SFT                                    20
+#define VUL3_ON_MASK                                   0x1
+#define VUL3_ON_MASK_SFT                               (0x1 << 20)
+#define VUL2_ON_SFT                                    19
+#define VUL2_ON_MASK                                   0x1
+#define VUL2_ON_MASK_SFT                               (0x1 << 19)
+#define VUL_ON_SFT                                     18
+#define VUL_ON_MASK                                    0x1
+#define VUL_ON_MASK_SFT                                (0x1 << 18)
+#define AWB2_ON_SFT                                    17
+#define AWB2_ON_MASK                                   0x1
+#define AWB2_ON_MASK_SFT                               (0x1 << 17)
+#define AWB_ON_SFT                                     16
+#define AWB_ON_MASK                                    0x1
+#define AWB_ON_MASK_SFT                                (0x1 << 16)
+#define DL12_ON_SFT                                    15
+#define DL12_ON_MASK                                   0x1
+#define DL12_ON_MASK_SFT                               (0x1 << 15)
+#define DL9_ON_SFT                                     12
+#define DL9_ON_MASK                                    0x1
+#define DL9_ON_MASK_SFT                                (0x1 << 12)
+#define DL8_ON_SFT                                     11
+#define DL8_ON_MASK                                    0x1
+#define DL8_ON_MASK_SFT                                (0x1 << 11)
+#define DL7_ON_SFT                                     10
+#define DL7_ON_MASK                                    0x1
+#define DL7_ON_MASK_SFT                                (0x1 << 10)
+#define DL6_ON_SFT                                     9
+#define DL6_ON_MASK                                    0x1
+#define DL6_ON_MASK_SFT                                (0x1 << 9)
+#define DL5_ON_SFT                                     8
+#define DL5_ON_MASK                                    0x1
+#define DL5_ON_MASK_SFT                                (0x1 << 8)
+#define DL4_ON_SFT                                     7
+#define DL4_ON_MASK                                    0x1
+#define DL4_ON_MASK_SFT                                (0x1 << 7)
+#define DL3_ON_SFT                                     6
+#define DL3_ON_MASK                                    0x1
+#define DL3_ON_MASK_SFT                                (0x1 << 6)
+#define DL2_ON_SFT                                     5
+#define DL2_ON_MASK                                    0x1
+#define DL2_ON_MASK_SFT                                (0x1 << 5)
+#define DL1_ON_SFT                                     4
+#define DL1_ON_MASK                                    0x1
+#define DL1_ON_MASK_SFT                                (0x1 << 4)
+#define HDMI_OUT_ON_SFT                                1
+#define HDMI_OUT_ON_MASK                               0x1
+#define HDMI_OUT_ON_MASK_SFT                           (0x1 << 1)
+#define AFE_ON_SFT                                     0
+#define AFE_ON_MASK                                    0x1
+#define AFE_ON_MASK_SFT                                (0x1 << 0)
+
+/* AFE_DAC_MON */
+#define AFE_ON_RETM_SFT                                0
+#define AFE_ON_RETM_MASK                               0x1
+#define AFE_ON_RETM_MASK_SFT                           (0x1 << 0)
+
+/* AFE_I2S_CON */
+#define BCK_NEG_EG_LATCH_SFT                           30
+#define BCK_NEG_EG_LATCH_MASK                          0x1
+#define BCK_NEG_EG_LATCH_MASK_SFT                      (0x1 << 30)
+#define BCK_INV_SFT                                    29
+#define BCK_INV_MASK                                   0x1
+#define BCK_INV_MASK_SFT                               (0x1 << 29)
+#define I2SIN_PAD_SEL_SFT                              28
+#define I2SIN_PAD_SEL_MASK                             0x1
+#define I2SIN_PAD_SEL_MASK_SFT                         (0x1 << 28)
+#define I2S_LOOPBACK_SFT                               20
+#define I2S_LOOPBACK_MASK                              0x1
+#define I2S_LOOPBACK_MASK_SFT                          (0x1 << 20)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S1_HD_EN_SFT                                 12
+#define I2S1_HD_EN_MASK                                0x1
+#define I2S1_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S_OUT_MODE_SFT                               8
+#define I2S_OUT_MODE_MASK                              0xf
+#define I2S_OUT_MODE_MASK_SFT                          (0xf << 8)
+#define INV_PAD_CTRL_SFT                               7
+#define INV_PAD_CTRL_MASK                              0x1
+#define INV_PAD_CTRL_MASK_SFT                          (0x1 << 7)
+#define I2S_BYPSRC_SFT                                 6
+#define I2S_BYPSRC_MASK                                0x1
+#define I2S_BYPSRC_MASK_SFT                            (0x1 << 6)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S_FMT_SFT                                    3
+#define I2S_FMT_MASK                                   0x1
+#define I2S_FMT_MASK_SFT                               (0x1 << 3)
+#define I2S_SRC_SFT                                    2
+#define I2S_SRC_MASK                                   0x1
+#define I2S_SRC_MASK_SFT                               (0x1 << 2)
+#define I2S_WLEN_SFT                                   1
+#define I2S_WLEN_MASK                                  0x1
+#define I2S_WLEN_MASK_SFT                              (0x1 << 1)
+#define I2S_EN_SFT                                     0
+#define I2S_EN_MASK                                    0x1
+#define I2S_EN_MASK_SFT                                (0x1 << 0)
+
+/* AFE_I2S_CON1 */
+#define I2S2_LR_SWAP_SFT                               31
+#define I2S2_LR_SWAP_MASK                              0x1
+#define I2S2_LR_SWAP_MASK_SFT                          (0x1 << 31)
+#define I2S2_SEL_O19_O20_SFT                           18
+#define I2S2_SEL_O19_O20_MASK                          0x1
+#define I2S2_SEL_O19_O20_MASK_SFT                      (0x1 << 18)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S2_SEL_O03_O04_SFT                           16
+#define I2S2_SEL_O03_O04_MASK                          0x1
+#define I2S2_SEL_O03_O04_MASK_SFT                      (0x1 << 16)
+#define I2S2_32BIT_EN_SFT                              13
+#define I2S2_32BIT_EN_MASK                             0x1
+#define I2S2_32BIT_EN_MASK_SFT                         (0x1 << 13)
+#define I2S2_HD_EN_SFT                                 12
+#define I2S2_HD_EN_MASK                                0x1
+#define I2S2_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S2_OUT_MODE_SFT                              8
+#define I2S2_OUT_MODE_MASK                             0xf
+#define I2S2_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S2_FMT_SFT                                   3
+#define I2S2_FMT_MASK                                  0x1
+#define I2S2_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S2_WLEN_SFT                                  1
+#define I2S2_WLEN_MASK                                 0x1
+#define I2S2_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S2_EN_SFT                                    0
+#define I2S2_EN_MASK                                   0x1
+#define I2S2_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_I2S_CON2 */
+#define I2S3_LR_SWAP_SFT                               31
+#define I2S3_LR_SWAP_MASK                              0x1
+#define I2S3_LR_SWAP_MASK_SFT                          (0x1 << 31)
+#define I2S3_UPDATE_WORD_SFT                           24
+#define I2S3_UPDATE_WORD_MASK                          0x1f
+#define I2S3_UPDATE_WORD_MASK_SFT                      (0x1f << 24)
+#define I2S3_BCK_INV_SFT                               23
+#define I2S3_BCK_INV_MASK                              0x1
+#define I2S3_BCK_INV_MASK_SFT                          (0x1 << 23)
+#define I2S3_FPGA_BIT_TEST_SFT                         22
+#define I2S3_FPGA_BIT_TEST_MASK                        0x1
+#define I2S3_FPGA_BIT_TEST_MASK_SFT                    (0x1 << 22)
+#define I2S3_FPGA_BIT_SFT                              21
+#define I2S3_FPGA_BIT_MASK                             0x1
+#define I2S3_FPGA_BIT_MASK_SFT                         (0x1 << 21)
+#define I2S3_LOOPBACK_SFT                              20
+#define I2S3_LOOPBACK_MASK                             0x1
+#define I2S3_LOOPBACK_MASK_SFT                         (0x1 << 20)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S3_HD_EN_SFT                                 12
+#define I2S3_HD_EN_MASK                                0x1
+#define I2S3_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S3_OUT_MODE_SFT                              8
+#define I2S3_OUT_MODE_MASK                             0xf
+#define I2S3_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define I2S3_FMT_SFT                                   3
+#define I2S3_FMT_MASK                                  0x1
+#define I2S3_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S3_WLEN_SFT                                  1
+#define I2S3_WLEN_MASK                                 0x1
+#define I2S3_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S3_EN_SFT                                    0
+#define I2S3_EN_MASK                                   0x1
+#define I2S3_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_I2S_CON3 */
+#define I2S4_LR_SWAP_SFT                               31
+#define I2S4_LR_SWAP_MASK                              0x1
+#define I2S4_LR_SWAP_MASK_SFT                          (0x1 << 31)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S4_32BIT_EN_SFT                              13
+#define I2S4_32BIT_EN_MASK                             0x1
+#define I2S4_32BIT_EN_MASK_SFT                         (0x1 << 13)
+#define I2S4_HD_EN_SFT                                 12
+#define I2S4_HD_EN_MASK                                0x1
+#define I2S4_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S4_OUT_MODE_SFT                              8
+#define I2S4_OUT_MODE_MASK                             0xf
+#define I2S4_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S4_FMT_SFT                                   3
+#define I2S4_FMT_MASK                                  0x1
+#define I2S4_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S4_WLEN_SFT                                  1
+#define I2S4_WLEN_MASK                                 0x1
+#define I2S4_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S4_EN_SFT                                    0
+#define I2S4_EN_MASK                                   0x1
+#define I2S4_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_I2S_CON4 */
+#define I2S5_LR_SWAP_SFT                               31
+#define I2S5_LR_SWAP_MASK                              0x1
+#define I2S5_LR_SWAP_MASK_SFT                          (0x1 << 31)
+#define I2S_LOOPBACK_SFT                               20
+#define I2S_LOOPBACK_MASK                              0x1
+#define I2S_LOOPBACK_MASK_SFT                          (0x1 << 20)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S5_32BIT_EN_SFT                              13
+#define I2S5_32BIT_EN_MASK                             0x1
+#define I2S5_32BIT_EN_MASK_SFT                         (0x1 << 13)
+#define I2S5_HD_EN_SFT                                 12
+#define I2S5_HD_EN_MASK                                0x1
+#define I2S5_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S5_OUT_MODE_SFT                              8
+#define I2S5_OUT_MODE_MASK                             0xf
+#define I2S5_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S5_FMT_SFT                                   3
+#define I2S5_FMT_MASK                                  0x1
+#define I2S5_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S5_WLEN_SFT                                  1
+#define I2S5_WLEN_MASK                                 0x1
+#define I2S5_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S5_EN_SFT                                    0
+#define I2S5_EN_MASK                                   0x1
+#define I2S5_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_CONNSYS_I2S_CON */
+#define BCK_NEG_EG_LATCH_SFT                           30
+#define BCK_NEG_EG_LATCH_MASK                          0x1
+#define BCK_NEG_EG_LATCH_MASK_SFT                      (0x1 << 30)
+#define BCK_INV_SFT                                    29
+#define BCK_INV_MASK                                   0x1
+#define BCK_INV_MASK_SFT                               (0x1 << 29)
+#define I2SIN_PAD_SEL_SFT                              28
+#define I2SIN_PAD_SEL_MASK                             0x1
+#define I2SIN_PAD_SEL_MASK_SFT                         (0x1 << 28)
+#define I2S_LOOPBACK_SFT                               20
+#define I2S_LOOPBACK_MASK                              0x1
+#define I2S_LOOPBACK_MASK_SFT                          (0x1 << 20)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S_MODE_SFT                                   8
+#define I2S_MODE_MASK                                  0xf
+#define I2S_MODE_MASK_SFT                              (0xf << 8)
+#define INV_PAD_CTRL_SFT                               7
+#define INV_PAD_CTRL_MASK                              0x1
+#define INV_PAD_CTRL_MASK_SFT                          (0x1 << 7)
+#define I2S_BYPSRC_SFT                                 6
+#define I2S_BYPSRC_MASK                                0x1
+#define I2S_BYPSRC_MASK_SFT                            (0x1 << 6)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S_FMT_SFT                                    3
+#define I2S_FMT_MASK                                   0x1
+#define I2S_FMT_MASK_SFT                               (0x1 << 3)
+#define I2S_SRC_SFT                                    2
+#define I2S_SRC_MASK                                   0x1
+#define I2S_SRC_MASK_SFT                               (0x1 << 2)
+#define I2S_WLEN_SFT                                   1
+#define I2S_WLEN_MASK                                  0x1
+#define I2S_WLEN_MASK_SFT                              (0x1 << 1)
+#define I2S_EN_SFT                                     0
+#define I2S_EN_MASK                                    0x1
+#define I2S_EN_MASK_SFT                                (0x1 << 0)
+
+/* AFE_I2S_CON6 */
+#define BCK_NEG_EG_LATCH_SFT                           30
+#define BCK_NEG_EG_LATCH_MASK                          0x1
+#define BCK_NEG_EG_LATCH_MASK_SFT                      (0x1 << 30)
+#define BCK_INV_SFT                                    29
+#define BCK_INV_MASK                                   0x1
+#define BCK_INV_MASK_SFT                               (0x1 << 29)
+#define I2S6_LOOPBACK_SFT                              20
+#define I2S6_LOOPBACK_MASK                             0x1
+#define I2S6_LOOPBACK_MASK_SFT                         (0x1 << 20)
+#define I2S6_ONOFF_NOT_RESET_CK_ENABLE_SFT             17
+#define I2S6_ONOFF_NOT_RESET_CK_ENABLE_MASK            0x1
+#define I2S6_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT        (0x1 << 17)
+#define I2S6_HD_EN_SFT                                 12
+#define I2S6_HD_EN_MASK                                0x1
+#define I2S6_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S6_OUT_MODE_SFT                              8
+#define I2S6_OUT_MODE_MASK                             0xf
+#define I2S6_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define I2S6_BYPSRC_SFT                                6
+#define I2S6_BYPSRC_MASK                               0x1
+#define I2S6_BYPSRC_MASK_SFT                           (0x1 << 6)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S6_FMT_SFT                                   3
+#define I2S6_FMT_MASK                                  0x1
+#define I2S6_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S6_SRC_SFT                                   2
+#define I2S6_SRC_MASK                                  0x1
+#define I2S6_SRC_MASK_SFT                              (0x1 << 2)
+#define I2S6_WLEN_SFT                                  1
+#define I2S6_WLEN_MASK                                 0x1
+#define I2S6_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S6_EN_SFT                                    0
+#define I2S6_EN_MASK                                   0x1
+#define I2S6_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_I2S_CON7 */
+#define I2S7_LR_SWAP_SFT                               31
+#define I2S7_LR_SWAP_MASK                              0x1
+#define I2S7_LR_SWAP_MASK_SFT                          (0x1 << 31)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S7_32BIT_EN_SFT                              13
+#define I2S7_32BIT_EN_MASK                             0x1
+#define I2S7_32BIT_EN_MASK_SFT                         (0x1 << 13)
+#define I2S7_HD_EN_SFT                                 12
+#define I2S7_HD_EN_MASK                                0x1
+#define I2S7_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S7_OUT_MODE_SFT                              8
+#define I2S7_OUT_MODE_MASK                             0xf
+#define I2S7_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S7_FMT_SFT                                   3
+#define I2S7_FMT_MASK                                  0x1
+#define I2S7_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S7_WLEN_SFT                                  1
+#define I2S7_WLEN_MASK                                 0x1
+#define I2S7_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S7_EN_SFT                                    0
+#define I2S7_EN_MASK                                   0x1
+#define I2S7_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_I2S_CON8 */
+#define BCK_NEG_EG_LATCH_SFT                           30
+#define BCK_NEG_EG_LATCH_MASK                          0x1
+#define BCK_NEG_EG_LATCH_MASK_SFT                      (0x1 << 30)
+#define BCK_INV_SFT                                    29
+#define BCK_INV_MASK                                   0x1
+#define BCK_INV_MASK_SFT                               (0x1 << 29)
+#define I2S8_LOOPBACK_SFT                              20
+#define I2S8_LOOPBACK_MASK                             0x1
+#define I2S8_LOOPBACK_MASK_SFT                         (0x1 << 20)
+#define I2S8_ONOFF_NOT_RESET_CK_ENABLE_SFT             17
+#define I2S8_ONOFF_NOT_RESET_CK_ENABLE_MASK            0x1
+#define I2S8_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT        (0x1 << 17)
+#define I2S8_HD_EN_SFT                                 12
+#define I2S8_HD_EN_MASK                                0x1
+#define I2S8_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S8_OUT_MODE_SFT                              8
+#define I2S8_OUT_MODE_MASK                             0xf
+#define I2S8_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define I2S8_BYPSRC_SFT                                6
+#define I2S8_BYPSRC_MASK                               0x1
+#define I2S8_BYPSRC_MASK_SFT                           (0x1 << 6)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S8_FMT_SFT                                   3
+#define I2S8_FMT_MASK                                  0x1
+#define I2S8_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S8_SRC_SFT                                   2
+#define I2S8_SRC_MASK                                  0x1
+#define I2S8_SRC_MASK_SFT                              (0x1 << 2)
+#define I2S8_WLEN_SFT                                  1
+#define I2S8_WLEN_MASK                                 0x1
+#define I2S8_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S8_EN_SFT                                    0
+#define I2S8_EN_MASK                                   0x1
+#define I2S8_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_I2S_CON9 */
+#define I2S9_LR_SWAP_SFT                               31
+#define I2S9_LR_SWAP_MASK                              0x1
+#define I2S9_LR_SWAP_MASK_SFT                          (0x1 << 31)
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_SFT              17
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK             0x1
+#define I2S_ONOFF_NOT_RESET_CK_ENABLE_MASK_SFT         (0x1 << 17)
+#define I2S9_32BIT_EN_SFT                              13
+#define I2S9_32BIT_EN_MASK                             0x1
+#define I2S9_32BIT_EN_MASK_SFT                         (0x1 << 13)
+#define I2S9_HD_EN_SFT                                 12
+#define I2S9_HD_EN_MASK                                0x1
+#define I2S9_HD_EN_MASK_SFT                            (0x1 << 12)
+#define I2S9_OUT_MODE_SFT                              8
+#define I2S9_OUT_MODE_MASK                             0xf
+#define I2S9_OUT_MODE_MASK_SFT                         (0xf << 8)
+#define INV_LRCK_SFT                                   5
+#define INV_LRCK_MASK                                  0x1
+#define INV_LRCK_MASK_SFT                              (0x1 << 5)
+#define I2S9_FMT_SFT                                   3
+#define I2S9_FMT_MASK                                  0x1
+#define I2S9_FMT_MASK_SFT                              (0x1 << 3)
+#define I2S9_WLEN_SFT                                  1
+#define I2S9_WLEN_MASK                                 0x1
+#define I2S9_WLEN_MASK_SFT                             (0x1 << 1)
+#define I2S9_EN_SFT                                    0
+#define I2S9_EN_MASK                                   0x1
+#define I2S9_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_ASRC_2CH_CON2 */
+#define CHSET_O16BIT_SFT                               19
+#define CHSET_O16BIT_MASK                              0x1
+#define CHSET_O16BIT_MASK_SFT                          (0x1 << 19)
+#define CHSET_CLR_IIR_HISTORY_SFT                      17
+#define CHSET_CLR_IIR_HISTORY_MASK                     0x1
+#define CHSET_CLR_IIR_HISTORY_MASK_SFT                 (0x1 << 17)
+#define CHSET_IS_MONO_SFT                              16
+#define CHSET_IS_MONO_MASK                             0x1
+#define CHSET_IS_MONO_MASK_SFT                         (0x1 << 16)
+#define CHSET_IIR_EN_SFT                               11
+#define CHSET_IIR_EN_MASK                              0x1
+#define CHSET_IIR_EN_MASK_SFT                          (0x1 << 11)
+#define CHSET_IIR_STAGE_SFT                            8
+#define CHSET_IIR_STAGE_MASK                           0x7
+#define CHSET_IIR_STAGE_MASK_SFT                       (0x7 << 8)
+#define CHSET_STR_CLR_SFT                              5
+#define CHSET_STR_CLR_MASK                             0x1
+#define CHSET_STR_CLR_MASK_SFT                         (0x1 << 5)
+#define CHSET_ON_SFT                                   2
+#define CHSET_ON_MASK                                  0x1
+#define CHSET_ON_MASK_SFT                              (0x1 << 2)
+#define COEFF_SRAM_CTRL_SFT                            1
+#define COEFF_SRAM_CTRL_MASK                           0x1
+#define COEFF_SRAM_CTRL_MASK_SFT                       (0x1 << 1)
+#define ASM_ON_SFT                                     0
+#define ASM_ON_MASK                                    0x1
+#define ASM_ON_MASK_SFT                                (0x1 << 0)
+
+/* AFE_GAIN1_CON0 */
+#define GAIN1_SAMPLE_PER_STEP_SFT                      8
+#define GAIN1_SAMPLE_PER_STEP_MASK                     0xff
+#define GAIN1_SAMPLE_PER_STEP_MASK_SFT                 (0xff << 8)
+#define GAIN1_MODE_SFT                                 4
+#define GAIN1_MODE_MASK                                0xf
+#define GAIN1_MODE_MASK_SFT                            (0xf << 4)
+#define GAIN1_ON_SFT                                   0
+#define GAIN1_ON_MASK                                  0x1
+#define GAIN1_ON_MASK_SFT                              (0x1 << 0)
+
+/* AFE_GAIN1_CON1 */
+#define GAIN1_TARGET_SFT                               0
+#define GAIN1_TARGET_MASK                              0xfffffff
+#define GAIN1_TARGET_MASK_SFT                          (0xfffffff << 0)
+
+/* AFE_GAIN2_CON0 */
+#define GAIN2_SAMPLE_PER_STEP_SFT                      8
+#define GAIN2_SAMPLE_PER_STEP_MASK                     0xff
+#define GAIN2_SAMPLE_PER_STEP_MASK_SFT                 (0xff << 8)
+#define GAIN2_MODE_SFT                                 4
+#define GAIN2_MODE_MASK                                0xf
+#define GAIN2_MODE_MASK_SFT                            (0xf << 4)
+#define GAIN2_ON_SFT                                   0
+#define GAIN2_ON_MASK                                  0x1
+#define GAIN2_ON_MASK_SFT                              (0x1 << 0)
+
+/* AFE_GAIN2_CON1 */
+#define GAIN2_TARGET_SFT                               0
+#define GAIN2_TARGET_MASK                              0xfffffff
+#define GAIN2_TARGET_MASK_SFT                          (0xfffffff << 0)
+
+/* AFE_GAIN1_CUR */
+#define AFE_GAIN1_CUR_SFT                              0
+#define AFE_GAIN1_CUR_MASK                             0xfffffff
+#define AFE_GAIN1_CUR_MASK_SFT                         (0xfffffff << 0)
+
+/* AFE_GAIN2_CUR */
+#define AFE_GAIN2_CUR_SFT                              0
+#define AFE_GAIN2_CUR_MASK                             0xfffffff
+#define AFE_GAIN2_CUR_MASK_SFT                         (0xfffffff << 0)
+
+/* PCM_INTF_CON1 */
+#define PCM_FIX_VALUE_SEL_SFT                          31
+#define PCM_FIX_VALUE_SEL_MASK                         0x1
+#define PCM_FIX_VALUE_SEL_MASK_SFT                     (0x1 << 31)
+#define PCM_BUFFER_LOOPBACK_SFT                        30
+#define PCM_BUFFER_LOOPBACK_MASK                       0x1
+#define PCM_BUFFER_LOOPBACK_MASK_SFT                   (0x1 << 30)
+#define PCM_PARALLEL_LOOPBACK_SFT                      29
+#define PCM_PARALLEL_LOOPBACK_MASK                     0x1
+#define PCM_PARALLEL_LOOPBACK_MASK_SFT                 (0x1 << 29)
+#define PCM_SERIAL_LOOPBACK_SFT                        28
+#define PCM_SERIAL_LOOPBACK_MASK                       0x1
+#define PCM_SERIAL_LOOPBACK_MASK_SFT                   (0x1 << 28)
+#define PCM_DAI_PCM_LOOPBACK_SFT                       27
+#define PCM_DAI_PCM_LOOPBACK_MASK                      0x1
+#define PCM_DAI_PCM_LOOPBACK_MASK_SFT                  (0x1 << 27)
+#define PCM_I2S_PCM_LOOPBACK_SFT                       26
+#define PCM_I2S_PCM_LOOPBACK_MASK                      0x1
+#define PCM_I2S_PCM_LOOPBACK_MASK_SFT                  (0x1 << 26)
+#define PCM_SYNC_DELSEL_SFT                            25
+#define PCM_SYNC_DELSEL_MASK                           0x1
+#define PCM_SYNC_DELSEL_MASK_SFT                       (0x1 << 25)
+#define PCM_TX_LR_SWAP_SFT                             24
+#define PCM_TX_LR_SWAP_MASK                            0x1
+#define PCM_TX_LR_SWAP_MASK_SFT                        (0x1 << 24)
+#define PCM_SYNC_OUT_INV_SFT                           23
+#define PCM_SYNC_OUT_INV_MASK                          0x1
+#define PCM_SYNC_OUT_INV_MASK_SFT                      (0x1 << 23)
+#define PCM_BCLK_OUT_INV_SFT                           22
+#define PCM_BCLK_OUT_INV_MASK                          0x1
+#define PCM_BCLK_OUT_INV_MASK_SFT                      (0x1 << 22)
+#define PCM_SYNC_IN_INV_SFT                            21
+#define PCM_SYNC_IN_INV_MASK                           0x1
+#define PCM_SYNC_IN_INV_MASK_SFT                       (0x1 << 21)
+#define PCM_BCLK_IN_INV_SFT                            20
+#define PCM_BCLK_IN_INV_MASK                           0x1
+#define PCM_BCLK_IN_INV_MASK_SFT                       (0x1 << 20)
+#define PCM_TX_LCH_RPT_SFT                             19
+#define PCM_TX_LCH_RPT_MASK                            0x1
+#define PCM_TX_LCH_RPT_MASK_SFT                        (0x1 << 19)
+#define PCM_VBT_16K_MODE_SFT                           18
+#define PCM_VBT_16K_MODE_MASK                          0x1
+#define PCM_VBT_16K_MODE_MASK_SFT                      (0x1 << 18)
+#define PCM_EXT_MODEM_SFT                              17
+#define PCM_EXT_MODEM_MASK                             0x1
+#define PCM_EXT_MODEM_MASK_SFT                         (0x1 << 17)
+#define PCM_24BIT_SFT                                  16
+#define PCM_24BIT_MASK                                 0x1
+#define PCM_24BIT_MASK_SFT                             (0x1 << 16)
+#define PCM_WLEN_SFT                                   14
+#define PCM_WLEN_MASK                                  0x3
+#define PCM_WLEN_MASK_SFT                              (0x3 << 14)
+#define PCM_SYNC_LENGTH_SFT                            9
+#define PCM_SYNC_LENGTH_MASK                           0x1f
+#define PCM_SYNC_LENGTH_MASK_SFT                       (0x1f << 9)
+#define PCM_SYNC_TYPE_SFT                              8
+#define PCM_SYNC_TYPE_MASK                             0x1
+#define PCM_SYNC_TYPE_MASK_SFT                         (0x1 << 8)
+#define PCM_BT_MODE_SFT                                7
+#define PCM_BT_MODE_MASK                               0x1
+#define PCM_BT_MODE_MASK_SFT                           (0x1 << 7)
+#define PCM_BYP_ASRC_SFT                               6
+#define PCM_BYP_ASRC_MASK                              0x1
+#define PCM_BYP_ASRC_MASK_SFT                          (0x1 << 6)
+#define PCM_SLAVE_SFT                                  5
+#define PCM_SLAVE_MASK                                 0x1
+#define PCM_SLAVE_MASK_SFT                             (0x1 << 5)
+#define PCM_MODE_SFT                                   3
+#define PCM_MODE_MASK                                  0x3
+#define PCM_MODE_MASK_SFT                              (0x3 << 3)
+#define PCM_FMT_SFT                                    1
+#define PCM_FMT_MASK                                   0x3
+#define PCM_FMT_MASK_SFT                               (0x3 << 1)
+#define PCM_EN_SFT                                     0
+#define PCM_EN_MASK                                    0x1
+#define PCM_EN_MASK_SFT                                (0x1 << 0)
+
+/* PCM_INTF_CON2 */
+#define PCM1_TX_FIFO_OV_SFT                            31
+#define PCM1_TX_FIFO_OV_MASK                           0x1
+#define PCM1_TX_FIFO_OV_MASK_SFT                       (0x1 << 31)
+#define PCM1_RX_FIFO_OV_SFT                            30
+#define PCM1_RX_FIFO_OV_MASK                           0x1
+#define PCM1_RX_FIFO_OV_MASK_SFT                       (0x1 << 30)
+#define PCM2_TX_FIFO_OV_SFT                            29
+#define PCM2_TX_FIFO_OV_MASK                           0x1
+#define PCM2_TX_FIFO_OV_MASK_SFT                       (0x1 << 29)
+#define PCM2_RX_FIFO_OV_SFT                            28
+#define PCM2_RX_FIFO_OV_MASK                           0x1
+#define PCM2_RX_FIFO_OV_MASK_SFT                       (0x1 << 28)
+#define PCM1_SYNC_GLITCH_SFT                           27
+#define PCM1_SYNC_GLITCH_MASK                          0x1
+#define PCM1_SYNC_GLITCH_MASK_SFT                      (0x1 << 27)
+#define PCM2_SYNC_GLITCH_SFT                           26
+#define PCM2_SYNC_GLITCH_MASK                          0x1
+#define PCM2_SYNC_GLITCH_MASK_SFT                      (0x1 << 26)
+#define TX3_RCH_DBG_MODE_SFT                           17
+#define TX3_RCH_DBG_MODE_MASK                          0x1
+#define TX3_RCH_DBG_MODE_MASK_SFT                      (0x1 << 17)
+#define PCM1_PCM2_LOOPBACK_SFT                         16
+#define PCM1_PCM2_LOOPBACK_MASK                        0x1
+#define PCM1_PCM2_LOOPBACK_MASK_SFT                    (0x1 << 16)
+#define DAI_PCM_LOOPBACK_CH_SFT                        14
+#define DAI_PCM_LOOPBACK_CH_MASK                       0x3
+#define DAI_PCM_LOOPBACK_CH_MASK_SFT                   (0x3 << 14)
+#define I2S_PCM_LOOPBACK_CH_SFT                        12
+#define I2S_PCM_LOOPBACK_CH_MASK                       0x3
+#define I2S_PCM_LOOPBACK_CH_MASK_SFT                   (0x3 << 12)
+#define TX_FIX_VALUE_SFT                               0
+#define TX_FIX_VALUE_MASK                              0xff
+#define TX_FIX_VALUE_MASK_SFT                          (0xff << 0)
+
+/* PCM2_INTF_CON */
+#define PCM2_TX_FIX_VALUE_SFT                          24
+#define PCM2_TX_FIX_VALUE_MASK                         0xff
+#define PCM2_TX_FIX_VALUE_MASK_SFT                     (0xff << 24)
+#define PCM2_FIX_VALUE_SEL_SFT                         23
+#define PCM2_FIX_VALUE_SEL_MASK                        0x1
+#define PCM2_FIX_VALUE_SEL_MASK_SFT                    (0x1 << 23)
+#define PCM2_BUFFER_LOOPBACK_SFT                       22
+#define PCM2_BUFFER_LOOPBACK_MASK                      0x1
+#define PCM2_BUFFER_LOOPBACK_MASK_SFT                  (0x1 << 22)
+#define PCM2_PARALLEL_LOOPBACK_SFT                     21
+#define PCM2_PARALLEL_LOOPBACK_MASK                    0x1
+#define PCM2_PARALLEL_LOOPBACK_MASK_SFT                (0x1 << 21)
+#define PCM2_SERIAL_LOOPBACK_SFT                       20
+#define PCM2_SERIAL_LOOPBACK_MASK                      0x1
+#define PCM2_SERIAL_LOOPBACK_MASK_SFT                  (0x1 << 20)
+#define PCM2_DAI_PCM_LOOPBACK_SFT                      19
+#define PCM2_DAI_PCM_LOOPBACK_MASK                     0x1
+#define PCM2_DAI_PCM_LOOPBACK_MASK_SFT                 (0x1 << 19)
+#define PCM2_I2S_PCM_LOOPBACK_SFT                      18
+#define PCM2_I2S_PCM_LOOPBACK_MASK                     0x1
+#define PCM2_I2S_PCM_LOOPBACK_MASK_SFT                 (0x1 << 18)
+#define PCM2_SYNC_DELSEL_SFT                           17
+#define PCM2_SYNC_DELSEL_MASK                          0x1
+#define PCM2_SYNC_DELSEL_MASK_SFT                      (0x1 << 17)
+#define PCM2_TX_LR_SWAP_SFT                            16
+#define PCM2_TX_LR_SWAP_MASK                           0x1
+#define PCM2_TX_LR_SWAP_MASK_SFT                       (0x1 << 16)
+#define PCM2_SYNC_IN_INV_SFT                           15
+#define PCM2_SYNC_IN_INV_MASK                          0x1
+#define PCM2_SYNC_IN_INV_MASK_SFT                      (0x1 << 15)
+#define PCM2_BCLK_IN_INV_SFT                           14
+#define PCM2_BCLK_IN_INV_MASK                          0x1
+#define PCM2_BCLK_IN_INV_MASK_SFT                      (0x1 << 14)
+#define PCM2_TX_LCH_RPT_SFT                            13
+#define PCM2_TX_LCH_RPT_MASK                           0x1
+#define PCM2_TX_LCH_RPT_MASK_SFT                       (0x1 << 13)
+#define PCM2_VBT_16K_MODE_SFT                          12
+#define PCM2_VBT_16K_MODE_MASK                         0x1
+#define PCM2_VBT_16K_MODE_MASK_SFT                     (0x1 << 12)
+#define PCM2_LOOPBACK_CH_SEL_SFT                       10
+#define PCM2_LOOPBACK_CH_SEL_MASK                      0x3
+#define PCM2_LOOPBACK_CH_SEL_MASK_SFT                  (0x3 << 10)
+#define PCM2_TX2_BT_MODE_SFT                           8
+#define PCM2_TX2_BT_MODE_MASK                          0x1
+#define PCM2_TX2_BT_MODE_MASK_SFT                      (0x1 << 8)
+#define PCM2_BT_MODE_SFT                               7
+#define PCM2_BT_MODE_MASK                              0x1
+#define PCM2_BT_MODE_MASK_SFT                          (0x1 << 7)
+#define PCM2_AFIFO_SFT                                 6
+#define PCM2_AFIFO_MASK                                0x1
+#define PCM2_AFIFO_MASK_SFT                            (0x1 << 6)
+#define PCM2_WLEN_SFT                                  5
+#define PCM2_WLEN_MASK                                 0x1
+#define PCM2_WLEN_MASK_SFT                             (0x1 << 5)
+#define PCM2_MODE_SFT                                  3
+#define PCM2_MODE_MASK                                 0x3
+#define PCM2_MODE_MASK_SFT                             (0x3 << 3)
+#define PCM2_FMT_SFT                                   1
+#define PCM2_FMT_MASK                                  0x3
+#define PCM2_FMT_MASK_SFT                              (0x3 << 1)
+#define PCM2_EN_SFT                                    0
+#define PCM2_EN_MASK                                   0x1
+#define PCM2_EN_MASK_SFT                               (0x1 << 0)
+
+/* AFE_ADDA_MTKAIF_CFG0 */
+#define MTKAIF_RXIF_CLKINV_ADC_SFT                     31
+#define MTKAIF_RXIF_CLKINV_ADC_MASK                    0x1
+#define MTKAIF_RXIF_CLKINV_ADC_MASK_SFT                (0x1 << 31)
+#define MTKAIF_RXIF_BYPASS_SRC_SFT                     17
+#define MTKAIF_RXIF_BYPASS_SRC_MASK                    0x1
+#define MTKAIF_RXIF_BYPASS_SRC_MASK_SFT                (0x1 << 17)
+#define MTKAIF_RXIF_PROTOCOL2_SFT                      16
+#define MTKAIF_RXIF_PROTOCOL2_MASK                     0x1
+#define MTKAIF_RXIF_PROTOCOL2_MASK_SFT                 (0x1 << 16)
+#define MTKAIF_TXIF_BYPASS_SRC_SFT                     5
+#define MTKAIF_TXIF_BYPASS_SRC_MASK                    0x1
+#define MTKAIF_TXIF_BYPASS_SRC_MASK_SFT                (0x1 << 5)
+#define MTKAIF_TXIF_PROTOCOL2_SFT                      4
+#define MTKAIF_TXIF_PROTOCOL2_MASK                     0x1
+#define MTKAIF_TXIF_PROTOCOL2_MASK_SFT                 (0x1 << 4)
+#define MTKAIF_TXIF_8TO5_SFT                           2
+#define MTKAIF_TXIF_8TO5_MASK                          0x1
+#define MTKAIF_TXIF_8TO5_MASK_SFT                      (0x1 << 2)
+#define MTKAIF_RXIF_8TO5_SFT                           1
+#define MTKAIF_RXIF_8TO5_MASK                          0x1
+#define MTKAIF_RXIF_8TO5_MASK_SFT                      (0x1 << 1)
+#define MTKAIF_IF_LOOPBACK1_SFT                        0
+#define MTKAIF_IF_LOOPBACK1_MASK                       0x1
+#define MTKAIF_IF_LOOPBACK1_MASK_SFT                   (0x1 << 0)
+
+/* AFE_ADDA_MTKAIF_RX_CFG2 */
+#define MTKAIF_RXIF_DETECT_ON_PROTOCOL2_SFT            16
+#define MTKAIF_RXIF_DETECT_ON_PROTOCOL2_MASK           0x1
+#define MTKAIF_RXIF_DETECT_ON_PROTOCOL2_MASK_SFT       (0x1 << 16)
+#define MTKAIF_RXIF_DELAY_CYCLE_SFT                    12
+#define MTKAIF_RXIF_DELAY_CYCLE_MASK                   0xf
+#define MTKAIF_RXIF_DELAY_CYCLE_MASK_SFT               (0xf << 12)
+#define MTKAIF_RXIF_DELAY_DATA_SFT                     8
+#define MTKAIF_RXIF_DELAY_DATA_MASK                    0x1
+#define MTKAIF_RXIF_DELAY_DATA_MASK_SFT                (0x1 << 8)
+#define MTKAIF_RXIF_FIFO_RSP_PROTOCOL2_SFT             4
+#define MTKAIF_RXIF_FIFO_RSP_PROTOCOL2_MASK            0x7
+#define MTKAIF_RXIF_FIFO_RSP_PROTOCOL2_MASK_SFT        (0x7 << 4)
+
+/* AFE_ADDA_DL_SRC2_CON0 */
+#define DL_2_INPUT_MODE_CTL_SFT                        28
+#define DL_2_INPUT_MODE_CTL_MASK                       0xf
+#define DL_2_INPUT_MODE_CTL_MASK_SFT                   (0xf << 28)
+#define DL_2_CH1_SATURATION_EN_CTL_SFT                 27
+#define DL_2_CH1_SATURATION_EN_CTL_MASK                0x1
+#define DL_2_CH1_SATURATION_EN_CTL_MASK_SFT            (0x1 << 27)
+#define DL_2_CH2_SATURATION_EN_CTL_SFT                 26
+#define DL_2_CH2_SATURATION_EN_CTL_MASK                0x1
+#define DL_2_CH2_SATURATION_EN_CTL_MASK_SFT            (0x1 << 26)
+#define DL_2_OUTPUT_SEL_CTL_SFT                        24
+#define DL_2_OUTPUT_SEL_CTL_MASK                       0x3
+#define DL_2_OUTPUT_SEL_CTL_MASK_SFT                   (0x3 << 24)
+#define DL_2_FADEIN_0START_EN_SFT                      16
+#define DL_2_FADEIN_0START_EN_MASK                     0x3
+#define DL_2_FADEIN_0START_EN_MASK_SFT                 (0x3 << 16)
+#define DL_DISABLE_HW_CG_CTL_SFT                       15
+#define DL_DISABLE_HW_CG_CTL_MASK                      0x1
+#define DL_DISABLE_HW_CG_CTL_MASK_SFT                  (0x1 << 15)
+#define C_DATA_EN_SEL_CTL_PRE_SFT                      14
+#define C_DATA_EN_SEL_CTL_PRE_MASK                     0x1
+#define C_DATA_EN_SEL_CTL_PRE_MASK_SFT                 (0x1 << 14)
+#define DL_2_SIDE_TONE_ON_CTL_PRE_SFT                  13
+#define DL_2_SIDE_TONE_ON_CTL_PRE_MASK                 0x1
+#define DL_2_SIDE_TONE_ON_CTL_PRE_MASK_SFT             (0x1 << 13)
+#define DL_2_MUTE_CH1_OFF_CTL_PRE_SFT                  12
+#define DL_2_MUTE_CH1_OFF_CTL_PRE_MASK                 0x1
+#define DL_2_MUTE_CH1_OFF_CTL_PRE_MASK_SFT             (0x1 << 12)
+#define DL_2_MUTE_CH2_OFF_CTL_PRE_SFT                  11
+#define DL_2_MUTE_CH2_OFF_CTL_PRE_MASK                 0x1
+#define DL_2_MUTE_CH2_OFF_CTL_PRE_MASK_SFT             (0x1 << 11)
+#define DL2_ARAMPSP_CTL_PRE_SFT                        9
+#define DL2_ARAMPSP_CTL_PRE_MASK                       0x3
+#define DL2_ARAMPSP_CTL_PRE_MASK_SFT                   (0x3 << 9)
+#define DL_2_IIRMODE_CTL_PRE_SFT                       6
+#define DL_2_IIRMODE_CTL_PRE_MASK                      0x7
+#define DL_2_IIRMODE_CTL_PRE_MASK_SFT                  (0x7 << 6)
+#define DL_2_VOICE_MODE_CTL_PRE_SFT                    5
+#define DL_2_VOICE_MODE_CTL_PRE_MASK                   0x1
+#define DL_2_VOICE_MODE_CTL_PRE_MASK_SFT               (0x1 << 5)
+#define D2_2_MUTE_CH1_ON_CTL_PRE_SFT                   4
+#define D2_2_MUTE_CH1_ON_CTL_PRE_MASK                  0x1
+#define D2_2_MUTE_CH1_ON_CTL_PRE_MASK_SFT              (0x1 << 4)
+#define D2_2_MUTE_CH2_ON_CTL_PRE_SFT                   3
+#define D2_2_MUTE_CH2_ON_CTL_PRE_MASK                  0x1
+#define D2_2_MUTE_CH2_ON_CTL_PRE_MASK_SFT              (0x1 << 3)
+#define DL_2_IIR_ON_CTL_PRE_SFT                        2
+#define DL_2_IIR_ON_CTL_PRE_MASK                       0x1
+#define DL_2_IIR_ON_CTL_PRE_MASK_SFT                   (0x1 << 2)
+#define DL_2_GAIN_ON_CTL_PRE_SFT                       1
+#define DL_2_GAIN_ON_CTL_PRE_MASK                      0x1
+#define DL_2_GAIN_ON_CTL_PRE_MASK_SFT                  (0x1 << 1)
+#define DL_2_SRC_ON_TMP_CTL_PRE_SFT                    0
+#define DL_2_SRC_ON_TMP_CTL_PRE_MASK                   0x1
+#define DL_2_SRC_ON_TMP_CTL_PRE_MASK_SFT               (0x1 << 0)
+
+/* AFE_ADDA_DL_SRC2_CON1 */
+#define DL_2_GAIN_CTL_PRE_SFT                          16
+#define DL_2_GAIN_CTL_PRE_MASK                         0xffff
+#define DL_2_GAIN_CTL_PRE_MASK_SFT                     (0xffff << 16)
+#define DL_2_GAIN_MODE_CTL_SFT                         0
+#define DL_2_GAIN_MODE_CTL_MASK                        0x1
+#define DL_2_GAIN_MODE_CTL_MASK_SFT                    (0x1 << 0)
+
+/* AFE_ADDA_UL_SRC_CON0 */
+#define ULCF_CFG_EN_CTL_SFT                            31
+#define ULCF_CFG_EN_CTL_MASK                           0x1
+#define ULCF_CFG_EN_CTL_MASK_SFT                       (0x1 << 31)
+#define UL_DMIC_PHASE_SEL_CH1_SFT                      27
+#define UL_DMIC_PHASE_SEL_CH1_MASK                     0x7
+#define UL_DMIC_PHASE_SEL_CH1_MASK_SFT                 (0x7 << 27)
+#define UL_DMIC_PHASE_SEL_CH2_SFT                      24
+#define UL_DMIC_PHASE_SEL_CH2_MASK                     0x7
+#define UL_DMIC_PHASE_SEL_CH2_MASK_SFT                 (0x7 << 24)
+#define UL_MODE_3P25M_CH2_CTL_SFT                      22
+#define UL_MODE_3P25M_CH2_CTL_MASK                     0x1
+#define UL_MODE_3P25M_CH2_CTL_MASK_SFT                 (0x1 << 22)
+#define UL_MODE_3P25M_CH1_CTL_SFT                      21
+#define UL_MODE_3P25M_CH1_CTL_MASK                     0x1
+#define UL_MODE_3P25M_CH1_CTL_MASK_SFT                 (0x1 << 21)
+#define UL_VOICE_MODE_CH1_CH2_CTL_SFT                  17
+#define UL_VOICE_MODE_CH1_CH2_CTL_MASK                 0x7
+#define UL_VOICE_MODE_CH1_CH2_CTL_MASK_SFT             (0x7 << 17)
+#define UL_AP_DMIC_ON_SFT                              16
+#define UL_AP_DMIC_ON_MASK                             0x1
+#define UL_AP_DMIC_ON_MASK_SFT                         (0x1 << 16)
+#define DMIC_LOW_POWER_MODE_CTL_SFT                    14
+#define DMIC_LOW_POWER_MODE_CTL_MASK                   0x3
+#define DMIC_LOW_POWER_MODE_CTL_MASK_SFT               (0x3 << 14)
+#define UL_DISABLE_HW_CG_CTL_SFT                       12
+#define UL_DISABLE_HW_CG_CTL_MASK                      0x1
+#define UL_DISABLE_HW_CG_CTL_MASK_SFT                  (0x1 << 12)
+#define UL_IIR_ON_TMP_CTL_SFT                          10
+#define UL_IIR_ON_TMP_CTL_MASK                         0x1
+#define UL_IIR_ON_TMP_CTL_MASK_SFT                     (0x1 << 10)
+#define UL_IIRMODE_CTL_SFT                             7
+#define UL_IIRMODE_CTL_MASK                            0x7
+#define UL_IIRMODE_CTL_MASK_SFT                        (0x7 << 7)
+#define DIGMIC_4P33M_SEL_SFT                           6
+#define DIGMIC_4P33M_SEL_MASK                          0x1
+#define DIGMIC_4P33M_SEL_MASK_SFT                      (0x1 << 6)
+#define DIGMIC_3P25M_1P625M_SEL_CTL_SFT                5
+#define DIGMIC_3P25M_1P625M_SEL_CTL_MASK               0x1
+#define DIGMIC_3P25M_1P625M_SEL_CTL_MASK_SFT           (0x1 << 5)
+#define UL_LOOP_BACK_MODE_CTL_SFT                      2
+#define UL_LOOP_BACK_MODE_CTL_MASK                     0x1
+#define UL_LOOP_BACK_MODE_CTL_MASK_SFT                 (0x1 << 2)
+#define UL_SDM_3_LEVEL_CTL_SFT                         1
+#define UL_SDM_3_LEVEL_CTL_MASK                        0x1
+#define UL_SDM_3_LEVEL_CTL_MASK_SFT                    (0x1 << 1)
+#define UL_SRC_ON_TMP_CTL_SFT                          0
+#define UL_SRC_ON_TMP_CTL_MASK                         0x1
+#define UL_SRC_ON_TMP_CTL_MASK_SFT                     (0x1 << 0)
+
+/* AFE_ADDA_UL_SRC_CON1 */
+#define C_DAC_EN_CTL_SFT                               27
+#define C_DAC_EN_CTL_MASK                              0x1
+#define C_DAC_EN_CTL_MASK_SFT                          (0x1 << 27)
+#define C_MUTE_SW_CTL_SFT                              26
+#define C_MUTE_SW_CTL_MASK                             0x1
+#define C_MUTE_SW_CTL_MASK_SFT                         (0x1 << 26)
+#define ASDM_SRC_SEL_CTL_SFT                           25
+#define ASDM_SRC_SEL_CTL_MASK                          0x1
+#define ASDM_SRC_SEL_CTL_MASK_SFT                      (0x1 << 25)
+#define C_AMP_DIV_CH2_CTL_SFT                          21
+#define C_AMP_DIV_CH2_CTL_MASK                         0x7
+#define C_AMP_DIV_CH2_CTL_MASK_SFT                     (0x7 << 21)
+#define C_FREQ_DIV_CH2_CTL_SFT                         16
+#define C_FREQ_DIV_CH2_CTL_MASK                        0x1f
+#define C_FREQ_DIV_CH2_CTL_MASK_SFT                    (0x1f << 16)
+#define C_SINE_MODE_CH2_CTL_SFT                        12
+#define C_SINE_MODE_CH2_CTL_MASK                       0xf
+#define C_SINE_MODE_CH2_CTL_MASK_SFT                   (0xf << 12)
+#define C_AMP_DIV_CH1_CTL_SFT                          9
+#define C_AMP_DIV_CH1_CTL_MASK                         0x7
+#define C_AMP_DIV_CH1_CTL_MASK_SFT                     (0x7 << 9)
+#define C_FREQ_DIV_CH1_CTL_SFT                         4
+#define C_FREQ_DIV_CH1_CTL_MASK                        0x1f
+#define C_FREQ_DIV_CH1_CTL_MASK_SFT                    (0x1f << 4)
+#define C_SINE_MODE_CH1_CTL_SFT                        0
+#define C_SINE_MODE_CH1_CTL_MASK                       0xf
+#define C_SINE_MODE_CH1_CTL_MASK_SFT                   (0xf << 0)
+
+/* AFE_ADDA_TOP_CON0 */
+#define C_LOOP_BACK_MODE_CTL_SFT                       12
+#define C_LOOP_BACK_MODE_CTL_MASK                      0xf
+#define C_LOOP_BACK_MODE_CTL_MASK_SFT                  (0xf << 12)
+#define ADDA_UL_GAIN_MODE_SFT                          8
+#define ADDA_UL_GAIN_MODE_MASK                         0x3
+#define ADDA_UL_GAIN_MODE_MASK_SFT                     (0x3 << 8)
+#define C_EXT_ADC_CTL_SFT                              0
+#define C_EXT_ADC_CTL_MASK                             0x1
+#define C_EXT_ADC_CTL_MASK_SFT                         (0x1 << 0)
+
+/* AFE_ADDA_UL_DL_CON0 */
+#define AFE_ADDA_UL_LR_SWAP_SFT                        31
+#define AFE_ADDA_UL_LR_SWAP_MASK                       0x1
+#define AFE_ADDA_UL_LR_SWAP_MASK_SFT                   (0x1 << 31)
+#define AFE_ADDA_CKDIV_RST_SFT                         30
+#define AFE_ADDA_CKDIV_RST_MASK                        0x1
+#define AFE_ADDA_CKDIV_RST_MASK_SFT                    (0x1 << 30)
+#define AFE_ADDA_FIFO_AUTO_RST_SFT                     29
+#define AFE_ADDA_FIFO_AUTO_RST_MASK                    0x1
+#define AFE_ADDA_FIFO_AUTO_RST_MASK_SFT                (0x1 << 29)
+#define AFE_ADDA_UL_FIFO_DIGMIC_TESTIN_SFT             21
+#define AFE_ADDA_UL_FIFO_DIGMIC_TESTIN_MASK            0x3
+#define AFE_ADDA_UL_FIFO_DIGMIC_TESTIN_MASK_SFT        (0x3 << 21)
+#define AFE_ADDA_UL_FIFO_DIGMIC_WDATA_TESTEN_SFT       20
+#define AFE_ADDA_UL_FIFO_DIGMIC_WDATA_TESTEN_MASK      0x1
+#define AFE_ADDA_UL_FIFO_DIGMIC_WDATA_TESTEN_MASK_SFT  (0x1 << 20)
+#define AFE_ADDA6_UL_LR_SWAP_SFT                       15
+#define AFE_ADDA6_UL_LR_SWAP_MASK                      0x1
+#define AFE_ADDA6_UL_LR_SWAP_MASK_SFT                  (0x1 << 15)
+#define AFE_ADDA6_CKDIV_RST_SFT                        14
+#define AFE_ADDA6_CKDIV_RST_MASK                       0x1
+#define AFE_ADDA6_CKDIV_RST_MASK_SFT                   (0x1 << 14)
+#define AFE_ADDA6_FIFO_AUTO_RST_SFT                    13
+#define AFE_ADDA6_FIFO_AUTO_RST_MASK                   0x1
+#define AFE_ADDA6_FIFO_AUTO_RST_MASK_SFT               (0x1 << 13)
+#define AFE_ADDA6_UL_FIFO_DIGMIC_TESTIN_SFT            5
+#define AFE_ADDA6_UL_FIFO_DIGMIC_TESTIN_MASK           0x3
+#define AFE_ADDA6_UL_FIFO_DIGMIC_TESTIN_MASK_SFT       (0x3 << 5)
+#define AFE_ADDA6_UL_FIFO_DIGMIC_WDATA_TESTEN_SFT      4
+#define AFE_ADDA6_UL_FIFO_DIGMIC_WDATA_TESTEN_MASK     0x1
+#define AFE_ADDA6_UL_FIFO_DIGMIC_WDATA_TESTEN_MASK_SFT (0x1 << 4)
+#define ADDA_AFE_ON_SFT                                0
+#define ADDA_AFE_ON_MASK                               0x1
+#define ADDA_AFE_ON_MASK_SFT                           (0x1 << 0)
+
+/* AFE_SIDETONE_CON0 */
+#define R_RDY_SFT                                      30
+#define R_RDY_MASK                                     0x1
+#define R_RDY_MASK_SFT                                 (0x1 << 30)
+#define W_RDY_SFT                                      29
+#define W_RDY_MASK                                     0x1
+#define W_RDY_MASK_SFT                                 (0x1 << 29)
+#define R_W_EN_SFT                                     25
+#define R_W_EN_MASK                                    0x1
+#define R_W_EN_MASK_SFT                                (0x1 << 25)
+#define R_W_SEL_SFT                                    24
+#define R_W_SEL_MASK                                   0x1
+#define R_W_SEL_MASK_SFT                               (0x1 << 24)
+#define SEL_CH2_SFT                                    23
+#define SEL_CH2_MASK                                   0x1
+#define SEL_CH2_MASK_SFT                               (0x1 << 23)
+#define SIDE_TONE_COEFFICIENT_ADDR_SFT                 16
+#define SIDE_TONE_COEFFICIENT_ADDR_MASK                0x1f
+#define SIDE_TONE_COEFFICIENT_ADDR_MASK_SFT            (0x1f << 16)
+#define SIDE_TONE_COEFFICIENT_SFT                      0
+#define SIDE_TONE_COEFFICIENT_MASK                     0xffff
+#define SIDE_TONE_COEFFICIENT_MASK_SFT                 (0xffff << 0)
+
+/* AFE_SIDETONE_COEFF */
+#define SIDE_TONE_COEFF_SFT                            0
+#define SIDE_TONE_COEFF_MASK                           0xffff
+#define SIDE_TONE_COEFF_MASK_SFT                       (0xffff << 0)
+
+/* AFE_SIDETONE_CON1 */
+#define STF_BYPASS_MODE_SFT                            31
+#define STF_BYPASS_MODE_MASK                           0x1
+#define STF_BYPASS_MODE_MASK_SFT                       (0x1 << 31)
+#define STF_BYPASS_MODE_O28_O29_SFT                    30
+#define STF_BYPASS_MODE_O28_O29_MASK                   0x1
+#define STF_BYPASS_MODE_O28_O29_MASK_SFT               (0x1 << 30)
+#define STF_BYPASS_MODE_I2S4_SFT                       29
+#define STF_BYPASS_MODE_I2S4_MASK                      0x1
+#define STF_BYPASS_MODE_I2S4_MASK_SFT                  (0x1 << 29)
+#define STF_BYPASS_MODE_I2S5_SFT                       28
+#define STF_BYPASS_MODE_I2S5_MASK                      0x1
+#define STF_BYPASS_MODE_I2S5_MASK_SFT                  (0x1 << 28)
+#define STF_BYPASS_MODE_DL3_SFT                        27
+#define STF_BYPASS_MODE_DL3_MASK                       0x1
+#define STF_BYPASS_MODE_DL3_MASK_SFT                   (0x1 << 27)
+#define STF_BYPASS_MODE_I2S7_SFT                       26
+#define STF_BYPASS_MODE_I2S7_MASK                      0x1
+#define STF_BYPASS_MODE_I2S7_MASK_SFT                  (0x1 << 26)
+#define STF_BYPASS_MODE_I2S9_SFT                       25
+#define STF_BYPASS_MODE_I2S9_MASK                      0x1
+#define STF_BYPASS_MODE_I2S9_MASK_SFT                  (0x1 << 25)
+#define STF_O19O20_OUT_EN_SEL_SFT                      13
+#define STF_O19O20_OUT_EN_SEL_MASK                     0x1
+#define STF_O19O20_OUT_EN_SEL_MASK_SFT                 (0x1 << 13)
+#define STF_SOURCE_FROM_O19O20_SFT                     12
+#define STF_SOURCE_FROM_O19O20_MASK                    0x1
+#define STF_SOURCE_FROM_O19O20_MASK_SFT                (0x1 << 12)
+#define SIDE_TONE_ON_SFT                               8
+#define SIDE_TONE_ON_MASK                              0x1
+#define SIDE_TONE_ON_MASK_SFT                          (0x1 << 8)
+#define SIDE_TONE_HALF_TAP_NUM_SFT                     0
+#define SIDE_TONE_HALF_TAP_NUM_MASK                    0x3f
+#define SIDE_TONE_HALF_TAP_NUM_MASK_SFT                (0x3f << 0)
+
+/* AFE_SIDETONE_GAIN */
+#define POSITIVE_GAIN_SFT                              16
+#define POSITIVE_GAIN_MASK                             0x7
+#define POSITIVE_GAIN_MASK_SFT                         (0x7 << 16)
+#define SIDE_TONE_GAIN_SFT                             0
+#define SIDE_TONE_GAIN_MASK                            0xffff
+#define SIDE_TONE_GAIN_MASK_SFT                        (0xffff << 0)
+
+/* AFE_ADDA_DL_SDM_DCCOMP_CON */
+#define USE_3RD_SDM_SFT                                28
+#define USE_3RD_SDM_MASK                               0x1
+#define USE_3RD_SDM_MASK_SFT                           (0x1 << 28)
+#define DL_FIFO_START_POINT_SFT                        24
+#define DL_FIFO_START_POINT_MASK                       0x7
+#define DL_FIFO_START_POINT_MASK_SFT                   (0x7 << 24)
+#define DL_FIFO_SWAP_SFT                               20
+#define DL_FIFO_SWAP_MASK                              0x1
+#define DL_FIFO_SWAP_MASK_SFT                          (0x1 << 20)
+#define C_AUDSDM1ORDSELECT_CTL_SFT                     19
+#define C_AUDSDM1ORDSELECT_CTL_MASK                    0x1
+#define C_AUDSDM1ORDSELECT_CTL_MASK_SFT                (0x1 << 19)
+#define C_SDM7BITSEL_CTL_SFT                           18
+#define C_SDM7BITSEL_CTL_MASK                          0x1
+#define C_SDM7BITSEL_CTL_MASK_SFT                      (0x1 << 18)
+#define GAIN_AT_SDM_RST_PRE_CTL_SFT                    15
+#define GAIN_AT_SDM_RST_PRE_CTL_MASK                   0x1
+#define GAIN_AT_SDM_RST_PRE_CTL_MASK_SFT               (0x1 << 15)
+#define DL_DCM_AUTO_IDLE_EN_SFT                        14
+#define DL_DCM_AUTO_IDLE_EN_MASK                       0x1
+#define DL_DCM_AUTO_IDLE_EN_MASK_SFT                   (0x1 << 14)
+#define AFE_DL_SRC_DCM_EN_SFT                          13
+#define AFE_DL_SRC_DCM_EN_MASK                         0x1
+#define AFE_DL_SRC_DCM_EN_MASK_SFT                     (0x1 << 13)
+#define AFE_DL_POST_SRC_DCM_EN_SFT                     12
+#define AFE_DL_POST_SRC_DCM_EN_MASK                    0x1
+#define AFE_DL_POST_SRC_DCM_EN_MASK_SFT                (0x1 << 12)
+#define AUD_SDM_MONO_SFT                               9
+#define AUD_SDM_MONO_MASK                              0x1
+#define AUD_SDM_MONO_MASK_SFT                          (0x1 << 9)
+#define AUD_DC_COMP_EN_SFT                             8
+#define AUD_DC_COMP_EN_MASK                            0x1
+#define AUD_DC_COMP_EN_MASK_SFT                        (0x1 << 8)
+#define ATTGAIN_CTL_SFT                                0
+#define ATTGAIN_CTL_MASK                               0x3f
+#define ATTGAIN_CTL_MASK_SFT                           (0x3f << 0)
+
+/* AFE_SINEGEN_CON0 */
+#define DAC_EN_SFT                                     26
+#define DAC_EN_MASK                                    0x1
+#define DAC_EN_MASK_SFT                                (0x1 << 26)
+#define MUTE_SW_CH2_SFT                                25
+#define MUTE_SW_CH2_MASK                               0x1
+#define MUTE_SW_CH2_MASK_SFT                           (0x1 << 25)
+#define MUTE_SW_CH1_SFT                                24
+#define MUTE_SW_CH1_MASK                               0x1
+#define MUTE_SW_CH1_MASK_SFT                           (0x1 << 24)
+#define SINE_MODE_CH2_SFT                              20
+#define SINE_MODE_CH2_MASK                             0xf
+#define SINE_MODE_CH2_MASK_SFT                         (0xf << 20)
+#define AMP_DIV_CH2_SFT                                17
+#define AMP_DIV_CH2_MASK                               0x7
+#define AMP_DIV_CH2_MASK_SFT                           (0x7 << 17)
+#define FREQ_DIV_CH2_SFT                               12
+#define FREQ_DIV_CH2_MASK                              0x1f
+#define FREQ_DIV_CH2_MASK_SFT                          (0x1f << 12)
+#define SINE_MODE_CH1_SFT                              8
+#define SINE_MODE_CH1_MASK                             0xf
+#define SINE_MODE_CH1_MASK_SFT                         (0xf << 8)
+#define AMP_DIV_CH1_SFT                                5
+#define AMP_DIV_CH1_MASK                               0x7
+#define AMP_DIV_CH1_MASK_SFT                           (0x7 << 5)
+#define FREQ_DIV_CH1_SFT                               0
+#define FREQ_DIV_CH1_MASK                              0x1f
+#define FREQ_DIV_CH1_MASK_SFT                          (0x1f << 0)
+
+/* AFE_SINEGEN_CON2 */
+#define INNER_LOOP_BACK_MODE_SFT                       0
+#define INNER_LOOP_BACK_MODE_MASK                      0x3f
+#define INNER_LOOP_BACK_MODE_MASK_SFT                  (0x3f << 0)
+
+/* AFE_HD_ENGEN_ENABLE */
+#define AFE_24M_ON_SFT                                 1
+#define AFE_24M_ON_MASK                                0x1
+#define AFE_24M_ON_MASK_SFT                            (0x1 << 1)
+#define AFE_22M_ON_SFT                                 0
+#define AFE_22M_ON_MASK                                0x1
+#define AFE_22M_ON_MASK_SFT                            (0x1 << 0)
+
+/* AFE_ADDA_DL_NLE_FIFO_MON */
+#define DL_NLE_FIFO_WBIN_SFT                           8
+#define DL_NLE_FIFO_WBIN_MASK                          0xf
+#define DL_NLE_FIFO_WBIN_MASK_SFT                      (0xf << 8)
+#define DL_NLE_FIFO_RBIN_SFT                           4
+#define DL_NLE_FIFO_RBIN_MASK                          0xf
+#define DL_NLE_FIFO_RBIN_MASK_SFT                      (0xf << 4)
+#define DL_NLE_FIFO_RDACTIVE_SFT                       3
+#define DL_NLE_FIFO_RDACTIVE_MASK                      0x1
+#define DL_NLE_FIFO_RDACTIVE_MASK_SFT                  (0x1 << 3)
+#define DL_NLE_FIFO_STARTRD_SFT                        2
+#define DL_NLE_FIFO_STARTRD_MASK                       0x1
+#define DL_NLE_FIFO_STARTRD_MASK_SFT                   (0x1 << 2)
+#define DL_NLE_FIFO_RD_EMPTY_SFT                       1
+#define DL_NLE_FIFO_RD_EMPTY_MASK                      0x1
+#define DL_NLE_FIFO_RD_EMPTY_MASK_SFT                  (0x1 << 1)
+#define DL_NLE_FIFO_WR_FULL_SFT                        0
+#define DL_NLE_FIFO_WR_FULL_MASK                       0x1
+#define DL_NLE_FIFO_WR_FULL_MASK_SFT                   (0x1 << 0)
+
+/* AFE_DL1_CON0 */
+#define DL1_MODE_SFT                                   24
+#define DL1_MODE_MASK                                  0xf
+#define DL1_MODE_MASK_SFT                              (0xf << 24)
+#define DL1_MINLEN_SFT                                 20
+#define DL1_MINLEN_MASK                                0xf
+#define DL1_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL1_MAXLEN_SFT                                 16
+#define DL1_MAXLEN_MASK                                0xf
+#define DL1_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL1_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL1_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL1_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL1_PBUF_SIZE_SFT                              12
+#define DL1_PBUF_SIZE_MASK                             0x3
+#define DL1_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL1_MONO_SFT                                   8
+#define DL1_MONO_MASK                                  0x1
+#define DL1_MONO_MASK_SFT                              (0x1 << 8)
+#define DL1_NORMAL_MODE_SFT                            5
+#define DL1_NORMAL_MODE_MASK                           0x1
+#define DL1_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL1_HALIGN_SFT                                 4
+#define DL1_HALIGN_MASK                                0x1
+#define DL1_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL1_HD_MODE_SFT                                0
+#define DL1_HD_MODE_MASK                               0x3
+#define DL1_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL2_CON0 */
+#define DL2_MODE_SFT                                   24
+#define DL2_MODE_MASK                                  0xf
+#define DL2_MODE_MASK_SFT                              (0xf << 24)
+#define DL2_MINLEN_SFT                                 20
+#define DL2_MINLEN_MASK                                0xf
+#define DL2_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL2_MAXLEN_SFT                                 16
+#define DL2_MAXLEN_MASK                                0xf
+#define DL2_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL2_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL2_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL2_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL2_PBUF_SIZE_SFT                              12
+#define DL2_PBUF_SIZE_MASK                             0x3
+#define DL2_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL2_MONO_SFT                                   8
+#define DL2_MONO_MASK                                  0x1
+#define DL2_MONO_MASK_SFT                              (0x1 << 8)
+#define DL2_NORMAL_MODE_SFT                            5
+#define DL2_NORMAL_MODE_MASK                           0x1
+#define DL2_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL2_HALIGN_SFT                                 4
+#define DL2_HALIGN_MASK                                0x1
+#define DL2_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL2_HD_MODE_SFT                                0
+#define DL2_HD_MODE_MASK                               0x3
+#define DL2_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL3_CON0 */
+#define DL3_MODE_SFT                                   24
+#define DL3_MODE_MASK                                  0xf
+#define DL3_MODE_MASK_SFT                              (0xf << 24)
+#define DL3_MINLEN_SFT                                 20
+#define DL3_MINLEN_MASK                                0xf
+#define DL3_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL3_MAXLEN_SFT                                 16
+#define DL3_MAXLEN_MASK                                0xf
+#define DL3_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL3_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL3_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL3_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL3_PBUF_SIZE_SFT                              12
+#define DL3_PBUF_SIZE_MASK                             0x3
+#define DL3_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL3_MONO_SFT                                   8
+#define DL3_MONO_MASK                                  0x1
+#define DL3_MONO_MASK_SFT                              (0x1 << 8)
+#define DL3_NORMAL_MODE_SFT                            5
+#define DL3_NORMAL_MODE_MASK                           0x1
+#define DL3_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL3_HALIGN_SFT                                 4
+#define DL3_HALIGN_MASK                                0x1
+#define DL3_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL3_HD_MODE_SFT                                0
+#define DL3_HD_MODE_MASK                               0x3
+#define DL3_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL4_CON0 */
+#define DL4_MODE_SFT                                   24
+#define DL4_MODE_MASK                                  0xf
+#define DL4_MODE_MASK_SFT                              (0xf << 24)
+#define DL4_MINLEN_SFT                                 20
+#define DL4_MINLEN_MASK                                0xf
+#define DL4_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL4_MAXLEN_SFT                                 16
+#define DL4_MAXLEN_MASK                                0xf
+#define DL4_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL4_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL4_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL4_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL4_PBUF_SIZE_SFT                              12
+#define DL4_PBUF_SIZE_MASK                             0x3
+#define DL4_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL4_MONO_SFT                                   8
+#define DL4_MONO_MASK                                  0x1
+#define DL4_MONO_MASK_SFT                              (0x1 << 8)
+#define DL4_NORMAL_MODE_SFT                            5
+#define DL4_NORMAL_MODE_MASK                           0x1
+#define DL4_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL4_HALIGN_SFT                                 4
+#define DL4_HALIGN_MASK                                0x1
+#define DL4_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL4_HD_MODE_SFT                                0
+#define DL4_HD_MODE_MASK                               0x3
+#define DL4_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL5_CON0 */
+#define DL5_MODE_SFT                                   24
+#define DL5_MODE_MASK                                  0xf
+#define DL5_MODE_MASK_SFT                              (0xf << 24)
+#define DL5_MINLEN_SFT                                 20
+#define DL5_MINLEN_MASK                                0xf
+#define DL5_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL5_MAXLEN_SFT                                 16
+#define DL5_MAXLEN_MASK                                0xf
+#define DL5_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL5_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL5_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL5_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL5_PBUF_SIZE_SFT                              12
+#define DL5_PBUF_SIZE_MASK                             0x3
+#define DL5_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL5_MONO_SFT                                   8
+#define DL5_MONO_MASK                                  0x1
+#define DL5_MONO_MASK_SFT                              (0x1 << 8)
+#define DL5_NORMAL_MODE_SFT                            5
+#define DL5_NORMAL_MODE_MASK                           0x1
+#define DL5_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL5_HALIGN_SFT                                 4
+#define DL5_HALIGN_MASK                                0x1
+#define DL5_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL5_HD_MODE_SFT                                0
+#define DL5_HD_MODE_MASK                               0x3
+#define DL5_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL6_CON0 */
+#define DL6_MODE_SFT                                   24
+#define DL6_MODE_MASK                                  0xf
+#define DL6_MODE_MASK_SFT                              (0xf << 24)
+#define DL6_MINLEN_SFT                                 20
+#define DL6_MINLEN_MASK                                0xf
+#define DL6_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL6_MAXLEN_SFT                                 16
+#define DL6_MAXLEN_MASK                                0xf
+#define DL6_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL6_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL6_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL6_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL6_PBUF_SIZE_SFT                              12
+#define DL6_PBUF_SIZE_MASK                             0x3
+#define DL6_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL6_MONO_SFT                                   8
+#define DL6_MONO_MASK                                  0x1
+#define DL6_MONO_MASK_SFT                              (0x1 << 8)
+#define DL6_NORMAL_MODE_SFT                            5
+#define DL6_NORMAL_MODE_MASK                           0x1
+#define DL6_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL6_HALIGN_SFT                                 4
+#define DL6_HALIGN_MASK                                0x1
+#define DL6_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL6_HD_MODE_SFT                                0
+#define DL6_HD_MODE_MASK                               0x3
+#define DL6_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL7_CON0 */
+#define DL7_MODE_SFT                                   24
+#define DL7_MODE_MASK                                  0xf
+#define DL7_MODE_MASK_SFT                              (0xf << 24)
+#define DL7_MINLEN_SFT                                 20
+#define DL7_MINLEN_MASK                                0xf
+#define DL7_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL7_MAXLEN_SFT                                 16
+#define DL7_MAXLEN_MASK                                0xf
+#define DL7_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL7_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL7_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL7_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL7_PBUF_SIZE_SFT                              12
+#define DL7_PBUF_SIZE_MASK                             0x3
+#define DL7_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL7_MONO_SFT                                   8
+#define DL7_MONO_MASK                                  0x1
+#define DL7_MONO_MASK_SFT                              (0x1 << 8)
+#define DL7_NORMAL_MODE_SFT                            5
+#define DL7_NORMAL_MODE_MASK                           0x1
+#define DL7_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL7_HALIGN_SFT                                 4
+#define DL7_HALIGN_MASK                                0x1
+#define DL7_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL7_HD_MODE_SFT                                0
+#define DL7_HD_MODE_MASK                               0x3
+#define DL7_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL8_CON0 */
+#define DL8_MODE_SFT                                   24
+#define DL8_MODE_MASK                                  0xf
+#define DL8_MODE_MASK_SFT                              (0xf << 24)
+#define DL8_MINLEN_SFT                                 20
+#define DL8_MINLEN_MASK                                0xf
+#define DL8_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL8_MAXLEN_SFT                                 16
+#define DL8_MAXLEN_MASK                                0xf
+#define DL8_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL8_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL8_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL8_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL8_PBUF_SIZE_SFT                              12
+#define DL8_PBUF_SIZE_MASK                             0x3
+#define DL8_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL8_MONO_SFT                                   8
+#define DL8_MONO_MASK                                  0x1
+#define DL8_MONO_MASK_SFT                              (0x1 << 8)
+#define DL8_NORMAL_MODE_SFT                            5
+#define DL8_NORMAL_MODE_MASK                           0x1
+#define DL8_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL8_HALIGN_SFT                                 4
+#define DL8_HALIGN_MASK                                0x1
+#define DL8_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL8_HD_MODE_SFT                                0
+#define DL8_HD_MODE_MASK                               0x3
+#define DL8_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL9_CON0 */
+#define DL9_MODE_SFT                                   24
+#define DL9_MODE_MASK                                  0xf
+#define DL9_MODE_MASK_SFT                              (0xf << 24)
+#define DL9_MINLEN_SFT                                 20
+#define DL9_MINLEN_MASK                                0xf
+#define DL9_MINLEN_MASK_SFT                            (0xf << 20)
+#define DL9_MAXLEN_SFT                                 16
+#define DL9_MAXLEN_MASK                                0xf
+#define DL9_MAXLEN_MASK_SFT                            (0xf << 16)
+#define DL9_SW_CLEAR_BUF_EMPTY_SFT                     15
+#define DL9_SW_CLEAR_BUF_EMPTY_MASK                    0x1
+#define DL9_SW_CLEAR_BUF_EMPTY_MASK_SFT                (0x1 << 15)
+#define DL9_PBUF_SIZE_SFT                              12
+#define DL9_PBUF_SIZE_MASK                             0x3
+#define DL9_PBUF_SIZE_MASK_SFT                         (0x3 << 12)
+#define DL9_MONO_SFT                                   8
+#define DL9_MONO_MASK                                  0x1
+#define DL9_MONO_MASK_SFT                              (0x1 << 8)
+#define DL9_NORMAL_MODE_SFT                            5
+#define DL9_NORMAL_MODE_MASK                           0x1
+#define DL9_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DL9_HALIGN_SFT                                 4
+#define DL9_HALIGN_MASK                                0x1
+#define DL9_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DL9_HD_MODE_SFT                                0
+#define DL9_HD_MODE_MASK                               0x3
+#define DL9_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_DL12_CON0 */
+#define DL12_MODE_SFT                                  24
+#define DL12_MODE_MASK                                 0xf
+#define DL12_MODE_MASK_SFT                             (0xf << 24)
+#define DL12_MINLEN_SFT                                20
+#define DL12_MINLEN_MASK                               0xf
+#define DL12_MINLEN_MASK_SFT                           (0xf << 20)
+#define DL12_MAXLEN_SFT                                16
+#define DL12_MAXLEN_MASK                               0xf
+#define DL12_MAXLEN_MASK_SFT                           (0xf << 16)
+#define DL12_SW_CLEAR_BUF_EMPTY_SFT                    15
+#define DL12_SW_CLEAR_BUF_EMPTY_MASK                   0x1
+#define DL12_SW_CLEAR_BUF_EMPTY_MASK_SFT               (0x1 << 15)
+#define DL12_PBUF_SIZE_SFT                             12
+#define DL12_PBUF_SIZE_MASK                            0x3
+#define DL12_PBUF_SIZE_MASK_SFT                        (0x3 << 12)
+#define DL12_4CH_EN_SFT                                11
+#define DL12_4CH_EN_MASK                               0x1
+#define DL12_4CH_EN_MASK_SFT                           (0x1 << 11)
+#define DL12_MONO_SFT                                  8
+#define DL12_MONO_MASK                                 0x1
+#define DL12_MONO_MASK_SFT                             (0x1 << 8)
+#define DL12_NORMAL_MODE_SFT                           5
+#define DL12_NORMAL_MODE_MASK                          0x1
+#define DL12_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define DL12_HALIGN_SFT                                4
+#define DL12_HALIGN_MASK                               0x1
+#define DL12_HALIGN_MASK_SFT                           (0x1 << 4)
+#define DL12_HD_MODE_SFT                               0
+#define DL12_HD_MODE_MASK                              0x3
+#define DL12_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_AWB_CON0 */
+#define AWB_MODE_SFT                                   24
+#define AWB_MODE_MASK                                  0xf
+#define AWB_MODE_MASK_SFT                              (0xf << 24)
+#define AWB_SW_CLEAR_BUF_FULL_SFT                      15
+#define AWB_SW_CLEAR_BUF_FULL_MASK                     0x1
+#define AWB_SW_CLEAR_BUF_FULL_MASK_SFT                 (0x1 << 15)
+#define AWB_R_MONO_SFT                                 9
+#define AWB_R_MONO_MASK                                0x1
+#define AWB_R_MONO_MASK_SFT                            (0x1 << 9)
+#define AWB_MONO_SFT                                   8
+#define AWB_MONO_MASK                                  0x1
+#define AWB_MONO_MASK_SFT                              (0x1 << 8)
+#define AWB_WR_SIGN_SFT                                6
+#define AWB_WR_SIGN_MASK                               0x1
+#define AWB_WR_SIGN_MASK_SFT                           (0x1 << 6)
+#define AWB_NORMAL_MODE_SFT                            5
+#define AWB_NORMAL_MODE_MASK                           0x1
+#define AWB_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define AWB_HALIGN_SFT                                 4
+#define AWB_HALIGN_MASK                                0x1
+#define AWB_HALIGN_MASK_SFT                            (0x1 << 4)
+#define AWB_HD_MODE_SFT                                0
+#define AWB_HD_MODE_MASK                               0x3
+#define AWB_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_AWB2_CON0 */
+#define AWB2_MODE_SFT                                  24
+#define AWB2_MODE_MASK                                 0xf
+#define AWB2_MODE_MASK_SFT                             (0xf << 24)
+#define AWB2_SW_CLEAR_BUF_FULL_SFT                     15
+#define AWB2_SW_CLEAR_BUF_FULL_MASK                    0x1
+#define AWB2_SW_CLEAR_BUF_FULL_MASK_SFT                (0x1 << 15)
+#define AWB2_R_MONO_SFT                                9
+#define AWB2_R_MONO_MASK                               0x1
+#define AWB2_R_MONO_MASK_SFT                           (0x1 << 9)
+#define AWB2_MONO_SFT                                  8
+#define AWB2_MONO_MASK                                 0x1
+#define AWB2_MONO_MASK_SFT                             (0x1 << 8)
+#define AWB2_WR_SIGN_SFT                               6
+#define AWB2_WR_SIGN_MASK                              0x1
+#define AWB2_WR_SIGN_MASK_SFT                          (0x1 << 6)
+#define AWB2_NORMAL_MODE_SFT                           5
+#define AWB2_NORMAL_MODE_MASK                          0x1
+#define AWB2_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define AWB2_HALIGN_SFT                                4
+#define AWB2_HALIGN_MASK                               0x1
+#define AWB2_HALIGN_MASK_SFT                           (0x1 << 4)
+#define AWB2_HD_MODE_SFT                               0
+#define AWB2_HD_MODE_MASK                              0x3
+#define AWB2_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_VUL_CON0 */
+#define VUL_MODE_SFT                                   24
+#define VUL_MODE_MASK                                  0xf
+#define VUL_MODE_MASK_SFT                              (0xf << 24)
+#define VUL_SW_CLEAR_BUF_FULL_SFT                      15
+#define VUL_SW_CLEAR_BUF_FULL_MASK                     0x1
+#define VUL_SW_CLEAR_BUF_FULL_MASK_SFT                 (0x1 << 15)
+#define VUL_R_MONO_SFT                                 9
+#define VUL_R_MONO_MASK                                0x1
+#define VUL_R_MONO_MASK_SFT                            (0x1 << 9)
+#define VUL_MONO_SFT                                   8
+#define VUL_MONO_MASK                                  0x1
+#define VUL_MONO_MASK_SFT                              (0x1 << 8)
+#define VUL_WR_SIGN_SFT                                6
+#define VUL_WR_SIGN_MASK                               0x1
+#define VUL_WR_SIGN_MASK_SFT                           (0x1 << 6)
+#define VUL_NORMAL_MODE_SFT                            5
+#define VUL_NORMAL_MODE_MASK                           0x1
+#define VUL_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define VUL_HALIGN_SFT                                 4
+#define VUL_HALIGN_MASK                                0x1
+#define VUL_HALIGN_MASK_SFT                            (0x1 << 4)
+#define VUL_HD_MODE_SFT                                0
+#define VUL_HD_MODE_MASK                               0x3
+#define VUL_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_VUL12_CON0 */
+#define VUL12_MODE_SFT                                 24
+#define VUL12_MODE_MASK                                0xf
+#define VUL12_MODE_MASK_SFT                            (0xf << 24)
+#define VUL12_SW_CLEAR_BUF_FULL_SFT                    15
+#define VUL12_SW_CLEAR_BUF_FULL_MASK                   0x1
+#define VUL12_SW_CLEAR_BUF_FULL_MASK_SFT               (0x1 << 15)
+#define VUL12_4CH_EN_SFT                               11
+#define VUL12_4CH_EN_MASK                              0x1
+#define VUL12_4CH_EN_MASK_SFT                          (0x1 << 11)
+#define VUL12_R_MONO_SFT                               9
+#define VUL12_R_MONO_MASK                              0x1
+#define VUL12_R_MONO_MASK_SFT                          (0x1 << 9)
+#define VUL12_MONO_SFT                                 8
+#define VUL12_MONO_MASK                                0x1
+#define VUL12_MONO_MASK_SFT                            (0x1 << 8)
+#define VUL12_WR_SIGN_SFT                              6
+#define VUL12_WR_SIGN_MASK                             0x1
+#define VUL12_WR_SIGN_MASK_SFT                         (0x1 << 6)
+#define VUL12_NORMAL_MODE_SFT                          5
+#define VUL12_NORMAL_MODE_MASK                         0x1
+#define VUL12_NORMAL_MODE_MASK_SFT                     (0x1 << 5)
+#define VUL12_HALIGN_SFT                               4
+#define VUL12_HALIGN_MASK                              0x1
+#define VUL12_HALIGN_MASK_SFT                          (0x1 << 4)
+#define VUL12_HD_MODE_SFT                              0
+#define VUL12_HD_MODE_MASK                             0x3
+#define VUL12_HD_MODE_MASK_SFT                         (0x3 << 0)
+
+/* AFE_VUL2_CON0 */
+#define VUL2_MODE_SFT                                  24
+#define VUL2_MODE_MASK                                 0xf
+#define VUL2_MODE_MASK_SFT                             (0xf << 24)
+#define VUL2_SW_CLEAR_BUF_FULL_SFT                     15
+#define VUL2_SW_CLEAR_BUF_FULL_MASK                    0x1
+#define VUL2_SW_CLEAR_BUF_FULL_MASK_SFT                (0x1 << 15)
+#define VUL2_R_MONO_SFT                                9
+#define VUL2_R_MONO_MASK                               0x1
+#define VUL2_R_MONO_MASK_SFT                           (0x1 << 9)
+#define VUL2_MONO_SFT                                  8
+#define VUL2_MONO_MASK                                 0x1
+#define VUL2_MONO_MASK_SFT                             (0x1 << 8)
+#define VUL2_WR_SIGN_SFT                               6
+#define VUL2_WR_SIGN_MASK                              0x1
+#define VUL2_WR_SIGN_MASK_SFT                          (0x1 << 6)
+#define VUL2_NORMAL_MODE_SFT                           5
+#define VUL2_NORMAL_MODE_MASK                          0x1
+#define VUL2_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define VUL2_HALIGN_SFT                                4
+#define VUL2_HALIGN_MASK                               0x1
+#define VUL2_HALIGN_MASK_SFT                           (0x1 << 4)
+#define VUL2_HD_MODE_SFT                               0
+#define VUL2_HD_MODE_MASK                              0x3
+#define VUL2_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_VUL3_CON0 */
+#define VUL3_MODE_SFT                                  24
+#define VUL3_MODE_MASK                                 0xf
+#define VUL3_MODE_MASK_SFT                             (0xf << 24)
+#define VUL3_SW_CLEAR_BUF_FULL_SFT                     15
+#define VUL3_SW_CLEAR_BUF_FULL_MASK                    0x1
+#define VUL3_SW_CLEAR_BUF_FULL_MASK_SFT                (0x1 << 15)
+#define VUL3_R_MONO_SFT                                9
+#define VUL3_R_MONO_MASK                               0x1
+#define VUL3_R_MONO_MASK_SFT                           (0x1 << 9)
+#define VUL3_MONO_SFT                                  8
+#define VUL3_MONO_MASK                                 0x1
+#define VUL3_MONO_MASK_SFT                             (0x1 << 8)
+#define VUL3_WR_SIGN_SFT                               6
+#define VUL3_WR_SIGN_MASK                              0x1
+#define VUL3_WR_SIGN_MASK_SFT                          (0x1 << 6)
+#define VUL3_NORMAL_MODE_SFT                           5
+#define VUL3_NORMAL_MODE_MASK                          0x1
+#define VUL3_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define VUL3_HALIGN_SFT                                4
+#define VUL3_HALIGN_MASK                               0x1
+#define VUL3_HALIGN_MASK_SFT                           (0x1 << 4)
+#define VUL3_HD_MODE_SFT                               0
+#define VUL3_HD_MODE_MASK                              0x3
+#define VUL3_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_VUL4_CON0 */
+#define VUL4_MODE_SFT                                  24
+#define VUL4_MODE_MASK                                 0xf
+#define VUL4_MODE_MASK_SFT                             (0xf << 24)
+#define VUL4_SW_CLEAR_BUF_FULL_SFT                     15
+#define VUL4_SW_CLEAR_BUF_FULL_MASK                    0x1
+#define VUL4_SW_CLEAR_BUF_FULL_MASK_SFT                (0x1 << 15)
+#define VUL4_R_MONO_SFT                                9
+#define VUL4_R_MONO_MASK                               0x1
+#define VUL4_R_MONO_MASK_SFT                           (0x1 << 9)
+#define VUL4_MONO_SFT                                  8
+#define VUL4_MONO_MASK                                 0x1
+#define VUL4_MONO_MASK_SFT                             (0x1 << 8)
+#define VUL4_WR_SIGN_SFT                               6
+#define VUL4_WR_SIGN_MASK                              0x1
+#define VUL4_WR_SIGN_MASK_SFT                          (0x1 << 6)
+#define VUL4_NORMAL_MODE_SFT                           5
+#define VUL4_NORMAL_MODE_MASK                          0x1
+#define VUL4_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define VUL4_HALIGN_SFT                                4
+#define VUL4_HALIGN_MASK                               0x1
+#define VUL4_HALIGN_MASK_SFT                           (0x1 << 4)
+#define VUL4_HD_MODE_SFT                               0
+#define VUL4_HD_MODE_MASK                              0x3
+#define VUL4_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_VUL5_CON0 */
+#define VUL5_MODE_SFT                                  24
+#define VUL5_MODE_MASK                                 0xf
+#define VUL5_MODE_MASK_SFT                             (0xf << 24)
+#define VUL5_SW_CLEAR_BUF_FULL_SFT                     15
+#define VUL5_SW_CLEAR_BUF_FULL_MASK                    0x1
+#define VUL5_SW_CLEAR_BUF_FULL_MASK_SFT                (0x1 << 15)
+#define VUL5_R_MONO_SFT                                9
+#define VUL5_R_MONO_MASK                               0x1
+#define VUL5_R_MONO_MASK_SFT                           (0x1 << 9)
+#define VUL5_MONO_SFT                                  8
+#define VUL5_MONO_MASK                                 0x1
+#define VUL5_MONO_MASK_SFT                             (0x1 << 8)
+#define VUL5_WR_SIGN_SFT                               6
+#define VUL5_WR_SIGN_MASK                              0x1
+#define VUL5_WR_SIGN_MASK_SFT                          (0x1 << 6)
+#define VUL5_NORMAL_MODE_SFT                           5
+#define VUL5_NORMAL_MODE_MASK                          0x1
+#define VUL5_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define VUL5_HALIGN_SFT                                4
+#define VUL5_HALIGN_MASK                               0x1
+#define VUL5_HALIGN_MASK_SFT                           (0x1 << 4)
+#define VUL5_HD_MODE_SFT                               0
+#define VUL5_HD_MODE_MASK                              0x3
+#define VUL5_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_VUL6_CON0 */
+#define VUL6_MODE_SFT                                  24
+#define VUL6_MODE_MASK                                 0xf
+#define VUL6_MODE_MASK_SFT                             (0xf << 24)
+#define VUL6_SW_CLEAR_BUF_FULL_SFT                     15
+#define VUL6_SW_CLEAR_BUF_FULL_MASK                    0x1
+#define VUL6_SW_CLEAR_BUF_FULL_MASK_SFT                (0x1 << 15)
+#define VUL6_R_MONO_SFT                                9
+#define VUL6_R_MONO_MASK                               0x1
+#define VUL6_R_MONO_MASK_SFT                           (0x1 << 9)
+#define VUL6_MONO_SFT                                  8
+#define VUL6_MONO_MASK                                 0x1
+#define VUL6_MONO_MASK_SFT                             (0x1 << 8)
+#define VUL6_WR_SIGN_SFT                               6
+#define VUL6_WR_SIGN_MASK                              0x1
+#define VUL6_WR_SIGN_MASK_SFT                          (0x1 << 6)
+#define VUL6_NORMAL_MODE_SFT                           5
+#define VUL6_NORMAL_MODE_MASK                          0x1
+#define VUL6_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define VUL6_HALIGN_SFT                                4
+#define VUL6_HALIGN_MASK                               0x1
+#define VUL6_HALIGN_MASK_SFT                           (0x1 << 4)
+#define VUL6_HD_MODE_SFT                               0
+#define VUL6_HD_MODE_MASK                              0x3
+#define VUL6_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_DAI_CON0 */
+#define DAI_MODE_SFT                                   24
+#define DAI_MODE_MASK                                  0x3
+#define DAI_MODE_MASK_SFT                              (0x3 << 24)
+#define DAI_SW_CLEAR_BUF_FULL_SFT                      15
+#define DAI_SW_CLEAR_BUF_FULL_MASK                     0x1
+#define DAI_SW_CLEAR_BUF_FULL_MASK_SFT                 (0x1 << 15)
+#define DAI_DUPLICATE_WR_SFT                           10
+#define DAI_DUPLICATE_WR_MASK                          0x1
+#define DAI_DUPLICATE_WR_MASK_SFT                      (0x1 << 10)
+#define DAI_MONO_SFT                                   8
+#define DAI_MONO_MASK                                  0x1
+#define DAI_MONO_MASK_SFT                              (0x1 << 8)
+#define DAI_WR_SIGN_SFT                                6
+#define DAI_WR_SIGN_MASK                               0x1
+#define DAI_WR_SIGN_MASK_SFT                           (0x1 << 6)
+#define DAI_NORMAL_MODE_SFT                            5
+#define DAI_NORMAL_MODE_MASK                           0x1
+#define DAI_NORMAL_MODE_MASK_SFT                       (0x1 << 5)
+#define DAI_HALIGN_SFT                                 4
+#define DAI_HALIGN_MASK                                0x1
+#define DAI_HALIGN_MASK_SFT                            (0x1 << 4)
+#define DAI_HD_MODE_SFT                                0
+#define DAI_HD_MODE_MASK                               0x3
+#define DAI_HD_MODE_MASK_SFT                           (0x3 << 0)
+
+/* AFE_MOD_DAI_CON0 */
+#define MOD_DAI_MODE_SFT                               24
+#define MOD_DAI_MODE_MASK                              0x3
+#define MOD_DAI_MODE_MASK_SFT                          (0x3 << 24)
+#define MOD_DAI_SW_CLEAR_BUF_FULL_SFT                  15
+#define MOD_DAI_SW_CLEAR_BUF_FULL_MASK                 0x1
+#define MOD_DAI_SW_CLEAR_BUF_FULL_MASK_SFT             (0x1 << 15)
+#define MOD_DAI_DUPLICATE_WR_SFT                       10
+#define MOD_DAI_DUPLICATE_WR_MASK                      0x1
+#define MOD_DAI_DUPLICATE_WR_MASK_SFT                  (0x1 << 10)
+#define MOD_DAI_MONO_SFT                               8
+#define MOD_DAI_MONO_MASK                              0x1
+#define MOD_DAI_MONO_MASK_SFT                          (0x1 << 8)
+#define MOD_DAI_WR_SIGN_SFT                            6
+#define MOD_DAI_WR_SIGN_MASK                           0x1
+#define MOD_DAI_WR_SIGN_MASK_SFT                       (0x1 << 6)
+#define MOD_DAI_NORMAL_MODE_SFT                        5
+#define MOD_DAI_NORMAL_MODE_MASK                       0x1
+#define MOD_DAI_NORMAL_MODE_MASK_SFT                   (0x1 << 5)
+#define MOD_DAI_HALIGN_SFT                             4
+#define MOD_DAI_HALIGN_MASK                            0x1
+#define MOD_DAI_HALIGN_MASK_SFT                        (0x1 << 4)
+#define MOD_DAI_HD_MODE_SFT                            0
+#define MOD_DAI_HD_MODE_MASK                           0x3
+#define MOD_DAI_HD_MODE_MASK_SFT                       (0x3 << 0)
+
+/* AFE_DAI2_CON0 */
+#define DAI2_MODE_SFT                                  24
+#define DAI2_MODE_MASK                                 0xf
+#define DAI2_MODE_MASK_SFT                             (0xf << 24)
+#define DAI2_SW_CLEAR_BUF_FULL_SFT                     15
+#define DAI2_SW_CLEAR_BUF_FULL_MASK                    0x1
+#define DAI2_SW_CLEAR_BUF_FULL_MASK_SFT                (0x1 << 15)
+#define DAI2_DUPLICATE_WR_SFT                          10
+#define DAI2_DUPLICATE_WR_MASK                         0x1
+#define DAI2_DUPLICATE_WR_MASK_SFT                     (0x1 << 10)
+#define DAI2_MONO_SFT                                  8
+#define DAI2_MONO_MASK                                 0x1
+#define DAI2_MONO_MASK_SFT                             (0x1 << 8)
+#define DAI2_WR_SIGN_SFT                               6
+#define DAI2_WR_SIGN_MASK                              0x1
+#define DAI2_WR_SIGN_MASK_SFT                          (0x1 << 6)
+#define DAI2_NORMAL_MODE_SFT                           5
+#define DAI2_NORMAL_MODE_MASK                          0x1
+#define DAI2_NORMAL_MODE_MASK_SFT                      (0x1 << 5)
+#define DAI2_HALIGN_SFT                                4
+#define DAI2_HALIGN_MASK                               0x1
+#define DAI2_HALIGN_MASK_SFT                           (0x1 << 4)
+#define DAI2_HD_MODE_SFT                               0
+#define DAI2_HD_MODE_MASK                              0x3
+#define DAI2_HD_MODE_MASK_SFT                          (0x3 << 0)
+
+/* AFE_MEMIF_CON0 */
+#define CPU_COMPACT_MODE_SFT                           2
+#define CPU_COMPACT_MODE_MASK                          0x1
+#define CPU_COMPACT_MODE_MASK_SFT                      (0x1 << 2)
+#define CPU_HD_ALIGN_SFT                               1
+#define CPU_HD_ALIGN_MASK                              0x1
+#define CPU_HD_ALIGN_MASK_SFT                          (0x1 << 1)
+#define SYSRAM_SIGN_SFT                                0
+#define SYSRAM_SIGN_MASK                               0x1
+#define SYSRAM_SIGN_MASK_SFT                           (0x1 << 0)
+
+/* AFE_HDMI_OUT_CON0 */
+#define HDMI_CH_NUM_SFT                                24
+#define HDMI_CH_NUM_MASK                               0xf
+#define HDMI_CH_NUM_MASK_SFT                           (0xf << 24)
+#define HDMI_OUT_MINLEN_SFT                            20
+#define HDMI_OUT_MINLEN_MASK                           0xf
+#define HDMI_OUT_MINLEN_MASK_SFT                       (0xf << 20)
+#define HDMI_OUT_MAXLEN_SFT                            16
+#define HDMI_OUT_MAXLEN_MASK                           0xf
+#define HDMI_OUT_MAXLEN_MASK_SFT                       (0xf << 16)
+#define HDMI_OUT_SW_CLEAR_BUF_EMPTY_SFT                15
+#define HDMI_OUT_SW_CLEAR_BUF_EMPTY_MASK               0x1
+#define HDMI_OUT_SW_CLEAR_BUF_EMPTY_MASK_SFT           (0x1 << 15)
+#define HDMI_OUT_PBUF_SIZE_SFT                         12
+#define HDMI_OUT_PBUF_SIZE_MASK                        0x3
+#define HDMI_OUT_PBUF_SIZE_MASK_SFT                    (0x3 << 12)
+#define HDMI_OUT_NORMAL_MODE_SFT                       5
+#define HDMI_OUT_NORMAL_MODE_MASK                      0x1
+#define HDMI_OUT_NORMAL_MODE_MASK_SFT                  (0x1 << 5)
+#define HDMI_OUT_HALIGN_SFT                            4
+#define HDMI_OUT_HALIGN_MASK                           0x1
+#define HDMI_OUT_HALIGN_MASK_SFT                       (0x1 << 4)
+#define HDMI_OUT_HD_MODE_SFT                           0
+#define HDMI_OUT_HD_MODE_MASK                          0x3
+#define HDMI_OUT_HD_MODE_MASK_SFT                      (0x3 << 0)
+
+/* AFE_IRQ_MCU_CON0 */
+#define IRQ31_MCU_ON_SFT                               31
+#define IRQ31_MCU_ON_MASK                              0x1
+#define IRQ31_MCU_ON_MASK_SFT                          (0x1 << 31)
+#define IRQ26_MCU_ON_SFT                               26
+#define IRQ26_MCU_ON_MASK                              0x1
+#define IRQ26_MCU_ON_MASK_SFT                          (0x1 << 26)
+#define IRQ25_MCU_ON_SFT                               25
+#define IRQ25_MCU_ON_MASK                              0x1
+#define IRQ25_MCU_ON_MASK_SFT                          (0x1 << 25)
+#define IRQ24_MCU_ON_SFT                               24
+#define IRQ24_MCU_ON_MASK                              0x1
+#define IRQ24_MCU_ON_MASK_SFT                          (0x1 << 24)
+#define IRQ23_MCU_ON_SFT                               23
+#define IRQ23_MCU_ON_MASK                              0x1
+#define IRQ23_MCU_ON_MASK_SFT                          (0x1 << 23)
+#define IRQ22_MCU_ON_SFT                               22
+#define IRQ22_MCU_ON_MASK                              0x1
+#define IRQ22_MCU_ON_MASK_SFT                          (0x1 << 22)
+#define IRQ21_MCU_ON_SFT                               21
+#define IRQ21_MCU_ON_MASK                              0x1
+#define IRQ21_MCU_ON_MASK_SFT                          (0x1 << 21)
+#define IRQ20_MCU_ON_SFT                               20
+#define IRQ20_MCU_ON_MASK                              0x1
+#define IRQ20_MCU_ON_MASK_SFT                          (0x1 << 20)
+#define IRQ19_MCU_ON_SFT                               19
+#define IRQ19_MCU_ON_MASK                              0x1
+#define IRQ19_MCU_ON_MASK_SFT                          (0x1 << 19)
+#define IRQ18_MCU_ON_SFT                               18
+#define IRQ18_MCU_ON_MASK                              0x1
+#define IRQ18_MCU_ON_MASK_SFT                          (0x1 << 18)
+#define IRQ17_MCU_ON_SFT                               17
+#define IRQ17_MCU_ON_MASK                              0x1
+#define IRQ17_MCU_ON_MASK_SFT                          (0x1 << 17)
+#define IRQ16_MCU_ON_SFT                               16
+#define IRQ16_MCU_ON_MASK                              0x1
+#define IRQ16_MCU_ON_MASK_SFT                          (0x1 << 16)
+#define IRQ15_MCU_ON_SFT                               15
+#define IRQ15_MCU_ON_MASK                              0x1
+#define IRQ15_MCU_ON_MASK_SFT                          (0x1 << 15)
+#define IRQ14_MCU_ON_SFT                               14
+#define IRQ14_MCU_ON_MASK                              0x1
+#define IRQ14_MCU_ON_MASK_SFT                          (0x1 << 14)
+#define IRQ13_MCU_ON_SFT                               13
+#define IRQ13_MCU_ON_MASK                              0x1
+#define IRQ13_MCU_ON_MASK_SFT                          (0x1 << 13)
+#define IRQ12_MCU_ON_SFT                               12
+#define IRQ12_MCU_ON_MASK                              0x1
+#define IRQ12_MCU_ON_MASK_SFT                          (0x1 << 12)
+#define IRQ11_MCU_ON_SFT                               11
+#define IRQ11_MCU_ON_MASK                              0x1
+#define IRQ11_MCU_ON_MASK_SFT                          (0x1 << 11)
+#define IRQ10_MCU_ON_SFT                               10
+#define IRQ10_MCU_ON_MASK                              0x1
+#define IRQ10_MCU_ON_MASK_SFT                          (0x1 << 10)
+#define IRQ9_MCU_ON_SFT                                9
+#define IRQ9_MCU_ON_MASK                               0x1
+#define IRQ9_MCU_ON_MASK_SFT                           (0x1 << 9)
+#define IRQ8_MCU_ON_SFT                                8
+#define IRQ8_MCU_ON_MASK                               0x1
+#define IRQ8_MCU_ON_MASK_SFT                           (0x1 << 8)
+#define IRQ7_MCU_ON_SFT                                7
+#define IRQ7_MCU_ON_MASK                               0x1
+#define IRQ7_MCU_ON_MASK_SFT                           (0x1 << 7)
+#define IRQ6_MCU_ON_SFT                                6
+#define IRQ6_MCU_ON_MASK                               0x1
+#define IRQ6_MCU_ON_MASK_SFT                           (0x1 << 6)
+#define IRQ5_MCU_ON_SFT                                5
+#define IRQ5_MCU_ON_MASK                               0x1
+#define IRQ5_MCU_ON_MASK_SFT                           (0x1 << 5)
+#define IRQ4_MCU_ON_SFT                                4
+#define IRQ4_MCU_ON_MASK                               0x1
+#define IRQ4_MCU_ON_MASK_SFT                           (0x1 << 4)
+#define IRQ3_MCU_ON_SFT                                3
+#define IRQ3_MCU_ON_MASK                               0x1
+#define IRQ3_MCU_ON_MASK_SFT                           (0x1 << 3)
+#define IRQ2_MCU_ON_SFT                                2
+#define IRQ2_MCU_ON_MASK                               0x1
+#define IRQ2_MCU_ON_MASK_SFT                           (0x1 << 2)
+#define IRQ1_MCU_ON_SFT                                1
+#define IRQ1_MCU_ON_MASK                               0x1
+#define IRQ1_MCU_ON_MASK_SFT                           (0x1 << 1)
+#define IRQ0_MCU_ON_SFT                                0
+#define IRQ0_MCU_ON_MASK                               0x1
+#define IRQ0_MCU_ON_MASK_SFT                           (0x1 << 0)
+
+/* AFE_IRQ_MCU_CON1 */
+#define IRQ7_MCU_MODE_SFT                              28
+#define IRQ7_MCU_MODE_MASK                             0xf
+#define IRQ7_MCU_MODE_MASK_SFT                         (0xf << 28)
+#define IRQ6_MCU_MODE_SFT                              24
+#define IRQ6_MCU_MODE_MASK                             0xf
+#define IRQ6_MCU_MODE_MASK_SFT                         (0xf << 24)
+#define IRQ5_MCU_MODE_SFT                              20
+#define IRQ5_MCU_MODE_MASK                             0xf
+#define IRQ5_MCU_MODE_MASK_SFT                         (0xf << 20)
+#define IRQ4_MCU_MODE_SFT                              16
+#define IRQ4_MCU_MODE_MASK                             0xf
+#define IRQ4_MCU_MODE_MASK_SFT                         (0xf << 16)
+#define IRQ3_MCU_MODE_SFT                              12
+#define IRQ3_MCU_MODE_MASK                             0xf
+#define IRQ3_MCU_MODE_MASK_SFT                         (0xf << 12)
+#define IRQ2_MCU_MODE_SFT                              8
+#define IRQ2_MCU_MODE_MASK                             0xf
+#define IRQ2_MCU_MODE_MASK_SFT                         (0xf << 8)
+#define IRQ1_MCU_MODE_SFT                              4
+#define IRQ1_MCU_MODE_MASK                             0xf
+#define IRQ1_MCU_MODE_MASK_SFT                         (0xf << 4)
+#define IRQ0_MCU_MODE_SFT                              0
+#define IRQ0_MCU_MODE_MASK                             0xf
+#define IRQ0_MCU_MODE_MASK_SFT                         (0xf << 0)
+
+/* AFE_IRQ_MCU_CON2 */
+#define IRQ15_MCU_MODE_SFT                             28
+#define IRQ15_MCU_MODE_MASK                            0xf
+#define IRQ15_MCU_MODE_MASK_SFT                        (0xf << 28)
+#define IRQ14_MCU_MODE_SFT                             24
+#define IRQ14_MCU_MODE_MASK                            0xf
+#define IRQ14_MCU_MODE_MASK_SFT                        (0xf << 24)
+#define IRQ13_MCU_MODE_SFT                             20
+#define IRQ13_MCU_MODE_MASK                            0xf
+#define IRQ13_MCU_MODE_MASK_SFT                        (0xf << 20)
+#define IRQ12_MCU_MODE_SFT                             16
+#define IRQ12_MCU_MODE_MASK                            0xf
+#define IRQ12_MCU_MODE_MASK_SFT                        (0xf << 16)
+#define IRQ11_MCU_MODE_SFT                             12
+#define IRQ11_MCU_MODE_MASK                            0xf
+#define IRQ11_MCU_MODE_MASK_SFT                        (0xf << 12)
+#define IRQ10_MCU_MODE_SFT                             8
+#define IRQ10_MCU_MODE_MASK                            0xf
+#define IRQ10_MCU_MODE_MASK_SFT                        (0xf << 8)
+#define IRQ9_MCU_MODE_SFT                              4
+#define IRQ9_MCU_MODE_MASK                             0xf
+#define IRQ9_MCU_MODE_MASK_SFT                         (0xf << 4)
+#define IRQ8_MCU_MODE_SFT                              0
+#define IRQ8_MCU_MODE_MASK                             0xf
+#define IRQ8_MCU_MODE_MASK_SFT                         (0xf << 0)
+
+/* AFE_IRQ_MCU_CON3 */
+#define IRQ23_MCU_MODE_SFT                             28
+#define IRQ23_MCU_MODE_MASK                            0xf
+#define IRQ23_MCU_MODE_MASK_SFT                        (0xf << 28)
+#define IRQ22_MCU_MODE_SFT                             24
+#define IRQ22_MCU_MODE_MASK                            0xf
+#define IRQ22_MCU_MODE_MASK_SFT                        (0xf << 24)
+#define IRQ21_MCU_MODE_SFT                             20
+#define IRQ21_MCU_MODE_MASK                            0xf
+#define IRQ21_MCU_MODE_MASK_SFT                        (0xf << 20)
+#define IRQ20_MCU_MODE_SFT                             16
+#define IRQ20_MCU_MODE_MASK                            0xf
+#define IRQ20_MCU_MODE_MASK_SFT                        (0xf << 16)
+#define IRQ19_MCU_MODE_SFT                             12
+#define IRQ19_MCU_MODE_MASK                            0xf
+#define IRQ19_MCU_MODE_MASK_SFT                        (0xf << 12)
+#define IRQ18_MCU_MODE_SFT                             8
+#define IRQ18_MCU_MODE_MASK                            0xf
+#define IRQ18_MCU_MODE_MASK_SFT                        (0xf << 8)
+#define IRQ17_MCU_MODE_SFT                             4
+#define IRQ17_MCU_MODE_MASK                            0xf
+#define IRQ17_MCU_MODE_MASK_SFT                        (0xf << 4)
+#define IRQ16_MCU_MODE_SFT                             0
+#define IRQ16_MCU_MODE_MASK                            0xf
+#define IRQ16_MCU_MODE_MASK_SFT                        (0xf << 0)
+
+/* AFE_IRQ_MCU_CON4 */
+#define IRQ26_MCU_MODE_SFT                             8
+#define IRQ26_MCU_MODE_MASK                            0xf
+#define IRQ26_MCU_MODE_MASK_SFT                        (0xf << 8)
+#define IRQ25_MCU_MODE_SFT                             4
+#define IRQ25_MCU_MODE_MASK                            0xf
+#define IRQ25_MCU_MODE_MASK_SFT                        (0xf << 4)
+#define IRQ24_MCU_MODE_SFT                             0
+#define IRQ24_MCU_MODE_MASK                            0xf
+#define IRQ24_MCU_MODE_MASK_SFT                        (0xf << 0)
+
+/* AFE_IRQ_MCU_CLR */
+#define IRQ31_MCU_CLR_SFT                              31
+#define IRQ31_MCU_CLR_MASK                             0x1
+#define IRQ31_MCU_CLR_MASK_SFT                         (0x1 << 31)
+#define IRQ26_MCU_CLR_SFT                              26
+#define IRQ26_MCU_CLR_MASK                             0x1
+#define IRQ26_MCU_CLR_MASK_SFT                         (0x1 << 26)
+#define IRQ25_MCU_CLR_SFT                              25
+#define IRQ25_MCU_CLR_MASK                             0x1
+#define IRQ25_MCU_CLR_MASK_SFT                         (0x1 << 25)
+#define IRQ24_MCU_CLR_SFT                              24
+#define IRQ24_MCU_CLR_MASK                             0x1
+#define IRQ24_MCU_CLR_MASK_SFT                         (0x1 << 24)
+#define IRQ23_MCU_CLR_SFT                              23
+#define IRQ23_MCU_CLR_MASK                             0x1
+#define IRQ23_MCU_CLR_MASK_SFT                         (0x1 << 23)
+#define IRQ22_MCU_CLR_SFT                              22
+#define IRQ22_MCU_CLR_MASK                             0x1
+#define IRQ22_MCU_CLR_MASK_SFT                         (0x1 << 22)
+#define IRQ21_MCU_CLR_SFT                              21
+#define IRQ21_MCU_CLR_MASK                             0x1
+#define IRQ21_MCU_CLR_MASK_SFT                         (0x1 << 21)
+#define IRQ20_MCU_CLR_SFT                              20
+#define IRQ20_MCU_CLR_MASK                             0x1
+#define IRQ20_MCU_CLR_MASK_SFT                         (0x1 << 20)
+#define IRQ19_MCU_CLR_SFT                              19
+#define IRQ19_MCU_CLR_MASK                             0x1
+#define IRQ19_MCU_CLR_MASK_SFT                         (0x1 << 19)
+#define IRQ18_MCU_CLR_SFT                              18
+#define IRQ18_MCU_CLR_MASK                             0x1
+#define IRQ18_MCU_CLR_MASK_SFT                         (0x1 << 18)
+#define IRQ17_MCU_CLR_SFT                              17
+#define IRQ17_MCU_CLR_MASK                             0x1
+#define IRQ17_MCU_CLR_MASK_SFT                         (0x1 << 17)
+#define IRQ16_MCU_CLR_SFT                              16
+#define IRQ16_MCU_CLR_MASK                             0x1
+#define IRQ16_MCU_CLR_MASK_SFT                         (0x1 << 16)
+#define IRQ15_MCU_CLR_SFT                              15
+#define IRQ15_MCU_CLR_MASK                             0x1
+#define IRQ15_MCU_CLR_MASK_SFT                         (0x1 << 15)
+#define IRQ14_MCU_CLR_SFT                              14
+#define IRQ14_MCU_CLR_MASK                             0x1
+#define IRQ14_MCU_CLR_MASK_SFT                         (0x1 << 14)
+#define IRQ13_MCU_CLR_SFT                              13
+#define IRQ13_MCU_CLR_MASK                             0x1
+#define IRQ13_MCU_CLR_MASK_SFT                         (0x1 << 13)
+#define IRQ12_MCU_CLR_SFT                              12
+#define IRQ12_MCU_CLR_MASK                             0x1
+#define IRQ12_MCU_CLR_MASK_SFT                         (0x1 << 12)
+#define IRQ11_MCU_CLR_SFT                              11
+#define IRQ11_MCU_CLR_MASK                             0x1
+#define IRQ11_MCU_CLR_MASK_SFT                         (0x1 << 11)
+#define IRQ10_MCU_CLR_SFT                              10
+#define IRQ10_MCU_CLR_MASK                             0x1
+#define IRQ10_MCU_CLR_MASK_SFT                         (0x1 << 10)
+#define IRQ9_MCU_CLR_SFT                               9
+#define IRQ9_MCU_CLR_MASK                              0x1
+#define IRQ9_MCU_CLR_MASK_SFT                          (0x1 << 9)
+#define IRQ8_MCU_CLR_SFT                               8
+#define IRQ8_MCU_CLR_MASK                              0x1
+#define IRQ8_MCU_CLR_MASK_SFT                          (0x1 << 8)
+#define IRQ7_MCU_CLR_SFT                               7
+#define IRQ7_MCU_CLR_MASK                              0x1
+#define IRQ7_MCU_CLR_MASK_SFT                          (0x1 << 7)
+#define IRQ6_MCU_CLR_SFT                               6
+#define IRQ6_MCU_CLR_MASK                              0x1
+#define IRQ6_MCU_CLR_MASK_SFT                          (0x1 << 6)
+#define IRQ5_MCU_CLR_SFT                               5
+#define IRQ5_MCU_CLR_MASK                              0x1
+#define IRQ5_MCU_CLR_MASK_SFT                          (0x1 << 5)
+#define IRQ4_MCU_CLR_SFT                               4
+#define IRQ4_MCU_CLR_MASK                              0x1
+#define IRQ4_MCU_CLR_MASK_SFT                          (0x1 << 4)
+#define IRQ3_MCU_CLR_SFT                               3
+#define IRQ3_MCU_CLR_MASK                              0x1
+#define IRQ3_MCU_CLR_MASK_SFT                          (0x1 << 3)
+#define IRQ2_MCU_CLR_SFT                               2
+#define IRQ2_MCU_CLR_MASK                              0x1
+#define IRQ2_MCU_CLR_MASK_SFT                          (0x1 << 2)
+#define IRQ1_MCU_CLR_SFT                               1
+#define IRQ1_MCU_CLR_MASK                              0x1
+#define IRQ1_MCU_CLR_MASK_SFT                          (0x1 << 1)
+#define IRQ0_MCU_CLR_SFT                               0
+#define IRQ0_MCU_CLR_MASK                              0x1
+#define IRQ0_MCU_CLR_MASK_SFT                          (0x1 << 0)
+
+/* AFE_IRQ_MCU_EN */
+#define IRQ31_MCU_EN_SFT                               31
+#define IRQ30_MCU_EN_SFT                               30
+#define IRQ29_MCU_EN_SFT                               29
+#define IRQ28_MCU_EN_SFT                               28
+#define IRQ27_MCU_EN_SFT                               27
+#define IRQ26_MCU_EN_SFT                               26
+#define IRQ25_MCU_EN_SFT                               25
+#define IRQ24_MCU_EN_SFT                               24
+#define IRQ23_MCU_EN_SFT                               23
+#define IRQ22_MCU_EN_SFT                               22
+#define IRQ21_MCU_EN_SFT                               21
+#define IRQ20_MCU_EN_SFT                               20
+#define IRQ19_MCU_EN_SFT                               19
+#define IRQ18_MCU_EN_SFT                               18
+#define IRQ17_MCU_EN_SFT                               17
+#define IRQ16_MCU_EN_SFT                               16
+#define IRQ15_MCU_EN_SFT                               15
+#define IRQ14_MCU_EN_SFT                               14
+#define IRQ13_MCU_EN_SFT                               13
+#define IRQ12_MCU_EN_SFT                               12
+#define IRQ11_MCU_EN_SFT                               11
+#define IRQ10_MCU_EN_SFT                               10
+#define IRQ9_MCU_EN_SFT                                9
+#define IRQ8_MCU_EN_SFT                                8
+#define IRQ7_MCU_EN_SFT                                7
+#define IRQ6_MCU_EN_SFT                                6
+#define IRQ5_MCU_EN_SFT                                5
+#define IRQ4_MCU_EN_SFT                                4
+#define IRQ3_MCU_EN_SFT                                3
+#define IRQ2_MCU_EN_SFT                                2
+#define IRQ1_MCU_EN_SFT                                1
+#define IRQ0_MCU_EN_SFT                                0
+
+/* AFE_IRQ_MCU_SCP_EN */
+#define IRQ31_MCU_SCP_EN_SFT                           31
+#define IRQ30_MCU_SCP_EN_SFT                           30
+#define IRQ29_MCU_SCP_EN_SFT                           29
+#define IRQ28_MCU_SCP_EN_SFT                           28
+#define IRQ27_MCU_SCP_EN_SFT                           27
+#define IRQ26_MCU_SCP_EN_SFT                           26
+#define IRQ25_MCU_SCP_EN_SFT                           25
+#define IRQ24_MCU_SCP_EN_SFT                           24
+#define IRQ23_MCU_SCP_EN_SFT                           23
+#define IRQ22_MCU_SCP_EN_SFT                           22
+#define IRQ21_MCU_SCP_EN_SFT                           21
+#define IRQ20_MCU_SCP_EN_SFT                           20
+#define IRQ19_MCU_SCP_EN_SFT                           19
+#define IRQ18_MCU_SCP_EN_SFT                           18
+#define IRQ17_MCU_SCP_EN_SFT                           17
+#define IRQ16_MCU_SCP_EN_SFT                           16
+#define IRQ15_MCU_SCP_EN_SFT                           15
+#define IRQ14_MCU_SCP_EN_SFT                           14
+#define IRQ13_MCU_SCP_EN_SFT                           13
+#define IRQ12_MCU_SCP_EN_SFT                           12
+#define IRQ11_MCU_SCP_EN_SFT                           11
+#define IRQ10_MCU_SCP_EN_SFT                           10
+#define IRQ9_MCU_SCP_EN_SFT                            9
+#define IRQ8_MCU_SCP_EN_SFT                            8
+#define IRQ7_MCU_SCP_EN_SFT                            7
+#define IRQ6_MCU_SCP_EN_SFT                            6
+#define IRQ5_MCU_SCP_EN_SFT                            5
+#define IRQ4_MCU_SCP_EN_SFT                            4
+#define IRQ3_MCU_SCP_EN_SFT                            3
+#define IRQ2_MCU_SCP_EN_SFT                            2
+#define IRQ1_MCU_SCP_EN_SFT                            1
+#define IRQ0_MCU_SCP_EN_SFT                            0
+
+/* AFE_TDM_CON1 */
+#define TDM_EN_SFT                                     0
+#define TDM_EN_MASK                                    0x1
+#define TDM_EN_MASK_SFT                                (0x1 << 0)
+#define BCK_INVERSE_SFT                                1
+#define BCK_INVERSE_MASK                               0x1
+#define BCK_INVERSE_MASK_SFT                           (0x1 << 1)
+#define LRCK_INVERSE_SFT                               2
+#define LRCK_INVERSE_MASK                              0x1
+#define LRCK_INVERSE_MASK_SFT                          (0x1 << 2)
+#define DELAY_DATA_SFT                                 3
+#define DELAY_DATA_MASK                                0x1
+#define DELAY_DATA_MASK_SFT                            (0x1 << 3)
+#define LEFT_ALIGN_SFT                                 4
+#define LEFT_ALIGN_MASK                                0x1
+#define LEFT_ALIGN_MASK_SFT                            (0x1 << 4)
+#define WLEN_SFT                                       8
+#define WLEN_MASK                                      0x3
+#define WLEN_MASK_SFT                                  (0x3 << 8)
+#define CHANNEL_NUM_SFT                                10
+#define CHANNEL_NUM_MASK                               0x3
+#define CHANNEL_NUM_MASK_SFT                           (0x3 << 10)
+#define CHANNEL_BCK_CYCLES_SFT                         12
+#define CHANNEL_BCK_CYCLES_MASK                        0x3
+#define CHANNEL_BCK_CYCLES_MASK_SFT                    (0x3 << 12)
+#define DAC_BIT_NUM_SFT                                16
+#define DAC_BIT_NUM_MASK                               0x1f
+#define DAC_BIT_NUM_MASK_SFT                           (0x1f << 16)
+#define LRCK_TDM_WIDTH_SFT                             24
+#define LRCK_TDM_WIDTH_MASK                            0xff
+#define LRCK_TDM_WIDTH_MASK_SFT                        (0xff << 24)
+
+/* AFE_TDM_CON2 */
+#define ST_CH_PAIR_SOUT0_SFT                           0
+#define ST_CH_PAIR_SOUT0_MASK                          0x7
+#define ST_CH_PAIR_SOUT0_MASK_SFT                      (0x7 << 0)
+#define ST_CH_PAIR_SOUT1_SFT                           4
+#define ST_CH_PAIR_SOUT1_MASK                          0x7
+#define ST_CH_PAIR_SOUT1_MASK_SFT                      (0x7 << 4)
+#define ST_CH_PAIR_SOUT2_SFT                           8
+#define ST_CH_PAIR_SOUT2_MASK                          0x7
+#define ST_CH_PAIR_SOUT2_MASK_SFT                      (0x7 << 8)
+#define ST_CH_PAIR_SOUT3_SFT                           12
+#define ST_CH_PAIR_SOUT3_MASK                          0x7
+#define ST_CH_PAIR_SOUT3_MASK_SFT                      (0x7 << 12)
+#define TDM_FIX_VALUE_SEL_SFT                          16
+#define TDM_FIX_VALUE_SEL_MASK                         0x1
+#define TDM_FIX_VALUE_SEL_MASK_SFT                     (0x1 << 16)
+#define TDM_I2S_LOOPBACK_SFT                           20
+#define TDM_I2S_LOOPBACK_MASK                          0x1
+#define TDM_I2S_LOOPBACK_MASK_SFT                      (0x1 << 20)
+#define TDM_I2S_LOOPBACK_CH_SFT                        21
+#define TDM_I2S_LOOPBACK_CH_MASK                       0x3
+#define TDM_I2S_LOOPBACK_CH_MASK_SFT                   (0x3 << 21)
+#define TDM_FIX_VALUE_SFT                              24
+#define TDM_FIX_VALUE_MASK                             0xff
+#define TDM_FIX_VALUE_MASK_SFT                         (0xff << 24)
+
+/* AFE_HDMI_CONN0 */
+#define HDMI_O_7_SFT                                   21
+#define HDMI_O_7_MASK                                  0x7
+#define HDMI_O_7_MASK_SFT                              (0x7 << 21)
+#define HDMI_O_6_SFT                                   18
+#define HDMI_O_6_MASK                                  0x7
+#define HDMI_O_6_MASK_SFT                              (0x7 << 18)
+#define HDMI_O_5_SFT                                   15
+#define HDMI_O_5_MASK                                  0x7
+#define HDMI_O_5_MASK_SFT                              (0x7 << 15)
+#define HDMI_O_4_SFT                                   12
+#define HDMI_O_4_MASK                                  0x7
+#define HDMI_O_4_MASK_SFT                              (0x7 << 12)
+#define HDMI_O_3_SFT                                   9
+#define HDMI_O_3_MASK                                  0x7
+#define HDMI_O_3_MASK_SFT                              (0x7 << 9)
+#define HDMI_O_2_SFT                                   6
+#define HDMI_O_2_MASK                                  0x7
+#define HDMI_O_2_MASK_SFT                              (0x7 << 6)
+#define HDMI_O_1_SFT                                   3
+#define HDMI_O_1_MASK                                  0x7
+#define HDMI_O_1_MASK_SFT                              (0x7 << 3)
+#define HDMI_O_0_SFT                                   0
+#define HDMI_O_0_MASK                                  0x7
+#define HDMI_O_0_MASK_SFT                              (0x7 << 0)
+
+/* AFE_AUD_PAD_TOP */
+#define AUD_PAD_TOP_MON_SFT                            15
+#define AUD_PAD_TOP_MON_MASK                           0x1ffff
+#define AUD_PAD_TOP_MON_MASK_SFT                       (0x1ffff << 15)
+#define AUD_PAD_TOP_FIFO_RSP_SFT                       4
+#define AUD_PAD_TOP_FIFO_RSP_MASK                      0xf
+#define AUD_PAD_TOP_FIFO_RSP_MASK_SFT                  (0xf << 4)
+#define RG_RX_PROTOCOL2_SFT                            3
+#define RG_RX_PROTOCOL2_MASK                           0x1
+#define RG_RX_PROTOCOL2_MASK_SFT                       (0x1 << 3)
+#define RESERVDED_01_SFT                               1
+#define RESERVDED_01_MASK                              0x3
+#define RESERVDED_01_MASK_SFT                          (0x3 << 1)
+#define RG_RX_FIFO_ON_SFT                              0
+#define RG_RX_FIFO_ON_MASK                             0x1
+#define RG_RX_FIFO_ON_MASK_SFT                         (0x1 << 0)
+
+/* AFE_ADDA_MTKAIF_SYNCWORD_CFG */
+#define RG_ADDA6_MTKAIF_RX_SYNC_WORD2_DISABLE_SFT      23
+#define RG_ADDA6_MTKAIF_RX_SYNC_WORD2_DISABLE_MASK     0x1
+#define RG_ADDA6_MTKAIF_RX_SYNC_WORD2_DISABLE_MASK_SFT (0x1 << 23)
+
+/* AFE_ADDA_MTKAIF_RX_CFG0 */
+#define MTKAIF_RXIF_VOICE_MODE_SFT                     20
+#define MTKAIF_RXIF_VOICE_MODE_MASK                    0xf
+#define MTKAIF_RXIF_VOICE_MODE_MASK_SFT                (0xf << 20)
+#define MTKAIF_RXIF_DETECT_ON_SFT                      16
+#define MTKAIF_RXIF_DETECT_ON_MASK                     0x1
+#define MTKAIF_RXIF_DETECT_ON_MASK_SFT                 (0x1 << 16)
+#define MTKAIF_RXIF_DATA_BIT_SFT                       8
+#define MTKAIF_RXIF_DATA_BIT_MASK                      0x7
+#define MTKAIF_RXIF_DATA_BIT_MASK_SFT                  (0x7 << 8)
+#define MTKAIF_RXIF_FIFO_RSP_SFT                       4
+#define MTKAIF_RXIF_FIFO_RSP_MASK                      0x7
+#define MTKAIF_RXIF_FIFO_RSP_MASK_SFT                  (0x7 << 4)
+#define MTKAIF_RXIF_DATA_MODE_SFT                      0
+#define MTKAIF_RXIF_DATA_MODE_MASK                     0x1
+#define MTKAIF_RXIF_DATA_MODE_MASK_SFT                 (0x1 << 0)
+
+/* GENERAL_ASRC_MODE */
+#define GENERAL2_ASRCOUT_MODE_SFT                      12
+#define GENERAL2_ASRCOUT_MODE_MASK                     0xf
+#define GENERAL2_ASRCOUT_MODE_MASK_SFT                 (0xf << 12)
+#define GENERAL2_ASRCIN_MODE_SFT                       8
+#define GENERAL2_ASRCIN_MODE_MASK                      0xf
+#define GENERAL2_ASRCIN_MODE_MASK_SFT                  (0xf << 8)
+#define GENERAL1_ASRCOUT_MODE_SFT                      4
+#define GENERAL1_ASRCOUT_MODE_MASK                     0xf
+#define GENERAL1_ASRCOUT_MODE_MASK_SFT                 (0xf << 4)
+#define GENERAL1_ASRCIN_MODE_SFT                       0
+#define GENERAL1_ASRCIN_MODE_MASK                      0xf
+#define GENERAL1_ASRCIN_MODE_MASK_SFT                  (0xf << 0)
+
+/* GENERAL_ASRC_EN_ON */
+#define GENERAL2_ASRC_EN_ON_SFT                        1
+#define GENERAL2_ASRC_EN_ON_MASK                       0x1
+#define GENERAL2_ASRC_EN_ON_MASK_SFT                   (0x1 << 1)
+#define GENERAL1_ASRC_EN_ON_SFT                        0
+#define GENERAL1_ASRC_EN_ON_MASK                       0x1
+#define GENERAL1_ASRC_EN_ON_MASK_SFT                   (0x1 << 0)
+
+/* AFE_GENERAL1_ASRC_2CH_CON0 */
+#define G_SRC_CHSET_STR_CLR_SFT                        4
+#define G_SRC_CHSET_STR_CLR_MASK                       0x1
+#define G_SRC_CHSET_STR_CLR_MASK_SFT                   (0x1 << 4)
+#define G_SRC_CHSET_ON_SFT                             2
+#define G_SRC_CHSET_ON_MASK                            0x1
+#define G_SRC_CHSET_ON_MASK_SFT                        (0x1 << 2)
+#define G_SRC_COEFF_SRAM_CTRL_SFT                      1
+#define G_SRC_COEFF_SRAM_CTRL_MASK                     0x1
+#define G_SRC_COEFF_SRAM_CTRL_MASK_SFT                 (0x1 << 1)
+#define G_SRC_ASM_ON_SFT                               0
+#define G_SRC_ASM_ON_MASK                              0x1
+#define G_SRC_ASM_ON_MASK_SFT                          (0x1 << 0)
+
+/* AFE_GENERAL1_ASRC_2CH_CON3 */
+#define G_SRC_ASM_FREQ_4_SFT                           0
+#define G_SRC_ASM_FREQ_4_MASK                          0xffffff
+#define G_SRC_ASM_FREQ_4_MASK_SFT                      (0xffffff << 0)
+
+/* AFE_GENERAL1_ASRC_2CH_CON4 */
+#define G_SRC_ASM_FREQ_5_SFT                           0
+#define G_SRC_ASM_FREQ_5_MASK                          0xffffff
+#define G_SRC_ASM_FREQ_5_MASK_SFT                      (0xffffff << 0)
+
+/* AFE_GENERAL1_ASRC_2CH_CON13 */
+#define G_SRC_COEFF_SRAM_ADR_SFT                       0
+#define G_SRC_COEFF_SRAM_ADR_MASK                      0x3f
+#define G_SRC_COEFF_SRAM_ADR_MASK_SFT                  (0x3f << 0)
+
+/* AFE_GENERAL1_ASRC_2CH_CON2 */
+#define G_SRC_CHSET_O16BIT_SFT                         19
+#define G_SRC_CHSET_O16BIT_MASK                        0x1
+#define G_SRC_CHSET_O16BIT_MASK_SFT                    (0x1 << 19)
+#define G_SRC_CHSET_CLR_IIR_HISTORY_SFT                17
+#define G_SRC_CHSET_CLR_IIR_HISTORY_MASK               0x1
+#define G_SRC_CHSET_CLR_IIR_HISTORY_MASK_SFT           (0x1 << 17)
+#define G_SRC_CHSET_IS_MONO_SFT                        16
+#define G_SRC_CHSET_IS_MONO_MASK                       0x1
+#define G_SRC_CHSET_IS_MONO_MASK_SFT                   (0x1 << 16)
+#define G_SRC_CHSET_IIR_EN_SFT                         11
+#define G_SRC_CHSET_IIR_EN_MASK                        0x1
+#define G_SRC_CHSET_IIR_EN_MASK_SFT                    (0x1 << 11)
+#define G_SRC_CHSET_IIR_STAGE_SFT                      8
+#define G_SRC_CHSET_IIR_STAGE_MASK                     0x7
+#define G_SRC_CHSET_IIR_STAGE_MASK_SFT                 (0x7 << 8)
+#define G_SRC_CHSET_STR_CLR_RU_SFT                     5
+#define G_SRC_CHSET_STR_CLR_RU_MASK                    0x1
+#define G_SRC_CHSET_STR_CLR_RU_MASK_SFT                (0x1 << 5)
+#define G_SRC_CHSET_ON_SFT                             2
+#define G_SRC_CHSET_ON_MASK                            0x1
+#define G_SRC_CHSET_ON_MASK_SFT                        (0x1 << 2)
+#define G_SRC_COEFF_SRAM_CTRL_SFT                      1
+#define G_SRC_COEFF_SRAM_CTRL_MASK                     0x1
+#define G_SRC_COEFF_SRAM_CTRL_MASK_SFT                 (0x1 << 1)
+#define G_SRC_ASM_ON_SFT                               0
+#define G_SRC_ASM_ON_MASK                              0x1
+#define G_SRC_ASM_ON_MASK_SFT                          (0x1 << 0)
+
+/* AFE_ADDA_DL_SDM_AUTO_RESET_CON */
+#define ADDA_SDM_AUTO_RESET_ONOFF_SFT                  31
+#define ADDA_SDM_AUTO_RESET_ONOFF_MASK                 0x1
+#define ADDA_SDM_AUTO_RESET_ONOFF_MASK_SFT             (0x1 << 31)
+
+/* AFE_ADDA_3RD_DAC_DL_SDM_AUTO_RESET_CON */
+#define ADDA_3RD_DAC_SDM_AUTO_RESET_ONOFF_SFT          31
+#define ADDA_3RD_DAC_SDM_AUTO_RESET_ONOFF_MASK         0x1
+#define ADDA_3RD_DAC_SDM_AUTO_RESET_ONOFF_MASK_SFT     (0x1 << 31)
+
+/* AFE_TINY_CONN0 */
+#define O_3_CFG_SFT                                    24
+#define O_3_CFG_MASK                                   0x1f
+#define O_3_CFG_MASK_SFT                               (0x1f << 24)
+#define O_2_CFG_SFT                                    16
+#define O_2_CFG_MASK                                   0x1f
+#define O_2_CFG_MASK_SFT                               (0x1f << 16)
+#define O_1_CFG_SFT                                    8
+#define O_1_CFG_MASK                                   0x1f
+#define O_1_CFG_MASK_SFT                               (0x1f << 8)
+#define O_0_CFG_SFT                                    0
+#define O_0_CFG_MASK                                   0x1f
+#define O_0_CFG_MASK_SFT                               (0x1f << 0)
+
+/* AFE_TINY_CONN5 */
+#define O_23_CFG_SFT                                    24
+#define O_23_CFG_MASK                                   0x1f
+#define O_23_CFG_MASK_SFT                               (0x1f << 24)
+#define O_22_CFG_SFT                                    16
+#define O_22_CFG_MASK                                   0x1f
+#define O_22_CFG_MASK_SFT                               (0x1f << 16)
+#define O_21_CFG_SFT                                    8
+#define O_21_CFG_MASK                                   0x1f
+#define O_21_CFG_MASK_SFT                               (0x1f << 8)
+#define O_20_CFG_SFT                                    0
+#define O_20_CFG_MASK                                   0x1f
+#define O_20_CFG_MASK_SFT                               (0x1f << 0)
+
+/* AFE_MEMIF_CONN */
+#define VUL6_USE_TINY_SFT                              8
+#define VUL6_USE_TINY_MASK                             1
+#define VUL6_USE_TINY_MASK_SFT                         (0x1 << 8)
+#define VUL5_USE_TINY_SFT                              7
+#define VUL5_USE_TINY_MASK                             1
+#define VUL5_USE_TINY_MASK_SFT                         (0x1 << 7)
+#define VUL4_USE_TINY_SFT                              6
+#define VUL4_USE_TINY_MASK                             1
+#define VUL4_USE_TINY_MASK_SFT                         (0x1 << 6)
+#define VUL3_USE_TINY_SFT                              5
+#define VUL3_USE_TINY_MASK                             1
+#define VUL3_USE_TINY_MASK_SFT                         (0x1 << 5)
+#define AWB2_USE_TINY_SFT                              4
+#define AWB2_USE_TINY_MASK                             1
+#define AWB2_USE_TINY_MASK_SFT                         (0x1 << 4)
+#define AWB_USE_TINY_SFT                               3
+#define AWB_USE_TINY_MASK                              1
+#define AWB_USE_TINY_MASK_SFT                          (0x1 << 3)
+#define VUL12_USE_TINY_SFT                             2
+#define VUL12_USE_TINY_MASK                            1
+#define VUL12_USE_TINY_MASK_SFT                        (0x1 << 2)
+#define VUL2_USE_TINY_SFT                              1
+#define VUL2_USE_TINY_MASK                             1
+#define VUL2_USE_TINY_MASK_SFT                         (0x1 << 1)
+#define VUL1_USE_TINY_SFT                              0
+#define VUL1_USE_TINY_MASK                             1
+#define VUL1_USE_TINY_MASK_SFT                         (0x1 << 0)
+
+/* AFE_ASRC_2CH_CON0 */
+#define CON0_CHSET_STR_CLR_SFT                         4
+#define CON0_CHSET_STR_CLR_MASK                        1
+#define CON0_CHSET_STR_CLR_MASK_SFT                    (0x1 << 4)
+#define CON0_ASM_ON_SFT                                0
+#define CON0_ASM_ON_MASK                               1
+#define CON0_ASM_ON_MASK_SFT                           (0x1 << 0)
+
+/* AFE_ASRC_2CH_CON5 */
+#define CALI_EN_SFT                                    0
+#define CALI_EN_MASK                                   1
+#define CALI_EN_MASK_SFT                               (0x1 << 0)
+
+#define AUDIO_TOP_CON0                                 0x0000
+#define AUDIO_TOP_CON1                                 0x0004
+#define AUDIO_TOP_CON2                                 0x0008
+#define AUDIO_TOP_CON3                                 0x000c
+#define AFE_DAC_CON0                                   0x0010
+#define AFE_I2S_CON                                    0x0018
+#define AFE_CONN0                                      0x0020
+#define AFE_CONN1                                      0x0024
+#define AFE_CONN2                                      0x0028
+#define AFE_CONN3                                      0x002c
+#define AFE_CONN4                                      0x0030
+#define AFE_I2S_CON1                                   0x0034
+#define AFE_I2S_CON2                                   0x0038
+#define AFE_I2S_CON3                                   0x0040
+#define AFE_CONN5                                      0x0044
+#define AFE_CONN_24BIT                                 0x0048
+#define AFE_DL1_CON0                                   0x004c
+#define AFE_DL1_BASE_MSB                               0x0050
+#define AFE_DL1_BASE                                   0x0054
+#define AFE_DL1_CUR_MSB                                0x0058
+#define AFE_DL1_CUR                                    0x005c
+#define AFE_DL1_END_MSB                                0x0060
+#define AFE_DL1_END                                    0x0064
+#define AFE_DL2_CON0                                   0x0068
+#define AFE_DL2_BASE_MSB                               0x006c
+#define AFE_DL2_BASE                                   0x0070
+#define AFE_DL2_CUR_MSB                                0x0074
+#define AFE_DL2_CUR                                    0x0078
+#define AFE_DL2_END_MSB                                0x007c
+#define AFE_DL2_END                                    0x0080
+#define AFE_DL3_CON0                                   0x0084
+#define AFE_DL3_BASE_MSB                               0x0088
+#define AFE_DL3_BASE                                   0x008c
+#define AFE_DL3_CUR_MSB                                0x0090
+#define AFE_DL3_CUR                                    0x0094
+#define AFE_DL3_END_MSB                                0x0098
+#define AFE_DL3_END                                    0x009c
+#define AFE_CONN6                                      0x00bc
+#define AFE_DL4_CON0                                   0x00cc
+#define AFE_DL4_BASE_MSB                               0x00d0
+#define AFE_DL4_BASE                                   0x00d4
+#define AFE_DL4_CUR_MSB                                0x00d8
+#define AFE_DL4_CUR                                    0x00dc
+#define AFE_DL4_END_MSB                                0x00e0
+#define AFE_DL4_END                                    0x00e4
+#define AFE_DL12_CON0                                  0x00e8
+#define AFE_DL12_BASE_MSB                              0x00ec
+#define AFE_DL12_BASE                                  0x00f0
+#define AFE_DL12_CUR_MSB                               0x00f4
+#define AFE_DL12_CUR                                   0x00f8
+#define AFE_DL12_END_MSB                               0x00fc
+#define AFE_DL12_END                                   0x0100
+#define AFE_ADDA_DL_SRC2_CON0                          0x0108
+#define AFE_ADDA_DL_SRC2_CON1                          0x010c
+#define AFE_ADDA_UL_SRC_CON0                           0x0114
+#define AFE_ADDA_UL_SRC_CON1                           0x0118
+#define AFE_ADDA_TOP_CON0                              0x0120
+#define AFE_ADDA_UL_DL_CON0                            0x0124
+#define AFE_ADDA_SRC_DEBUG                             0x012c
+#define AFE_ADDA_SRC_DEBUG_MON0                        0x0130
+#define AFE_ADDA_SRC_DEBUG_MON1                        0x0134
+#define AFE_ADDA_UL_SRC_MON0                           0x0148
+#define AFE_ADDA_UL_SRC_MON1                           0x014c
+#define AFE_SECURE_CON0                                0x0150
+#define AFE_SRAM_BOUND                                 0x0154
+#define AFE_SECURE_CON1                                0x0158
+#define AFE_SECURE_CONN0                               0x015c
+#define AFE_VUL_CON0                                   0x0170
+#define AFE_VUL_BASE_MSB                               0x0174
+#define AFE_VUL_BASE                                   0x0178
+#define AFE_VUL_CUR_MSB                                0x017c
+#define AFE_VUL_CUR                                    0x0180
+#define AFE_VUL_END_MSB                                0x0184
+#define AFE_VUL_END                                    0x0188
+#define AFE_ADDA_3RD_DAC_DL_SDM_AUTO_RESET_CON         0x018c
+#define AFE_ADDA_3RD_DAC_DL_SRC2_CON0                  0x0190
+#define AFE_ADDA_3RD_DAC_DL_SRC2_CON1                  0x0194
+#define AFE_ADDA_3RD_DAC_PREDIS_CON0                   0x01a0
+#define AFE_ADDA_3RD_DAC_PREDIS_CON1                   0x01a4
+#define AFE_ADDA_3RD_DAC_PREDIS_CON2                   0x01a8
+#define AFE_ADDA_3RD_DAC_PREDIS_CON3                   0x01ac
+#define AFE_ADDA_3RD_DAC_DL_SDM_DCCOMP_CON             0x01b0
+#define AFE_ADDA_3RD_DAC_DL_SDM_TEST                   0x01b4
+#define AFE_ADDA_3RD_DAC_DL_DC_COMP_CFG0               0x01b8
+#define AFE_ADDA_3RD_DAC_DL_DC_COMP_CFG1               0x01bc
+#define AFE_ADDA_3RD_DAC_DL_SDM_FIFO_MON               0x01c0
+#define AFE_ADDA_3RD_DAC_DL_SRC_LCH_MON                0x01c4
+#define AFE_ADDA_3RD_DAC_DL_SRC_RCH_MON                0x01c8
+#define AFE_ADDA_3RD_DAC_DL_SDM_OUT_MON                0x01cc
+#define AFE_SIDETONE_DEBUG                             0x01d0
+#define AFE_SIDETONE_MON                               0x01d4
+#define AFE_ADDA_3RD_DAC_DL_SDM_DITHER_CON             0x01d8
+#define AFE_SINEGEN_CON2                               0x01dc
+#define AFE_SIDETONE_CON0                              0x01e0
+#define AFE_SIDETONE_COEFF                             0x01e4
+#define AFE_SIDETONE_CON1                              0x01e8
+#define AFE_SIDETONE_GAIN                              0x01ec
+#define AFE_SINEGEN_CON0                               0x01f0
+#define AFE_I2S_MON2                                   0x01f8
+#define AFE_SINEGEN_CON_TDM                            0x01fc
+#define AFE_TOP_CON0                                   0x0200
+#define AFE_VUL2_CON0                                  0x020c
+#define AFE_VUL2_BASE_MSB                              0x0210
+#define AFE_VUL2_BASE                                  0x0214
+#define AFE_VUL2_CUR_MSB                               0x0218
+#define AFE_VUL2_CUR                                   0x021c
+#define AFE_VUL2_END_MSB                               0x0220
+#define AFE_VUL2_END                                   0x0224
+#define AFE_VUL3_CON0                                  0x0228
+#define AFE_VUL3_BASE_MSB                              0x022c
+#define AFE_VUL3_BASE                                  0x0230
+#define AFE_VUL3_CUR_MSB                               0x0234
+#define AFE_VUL3_CUR                                   0x0238
+#define AFE_VUL3_END_MSB                               0x023c
+#define AFE_VUL3_END                                   0x0240
+#define AFE_BUSY                                       0x0244
+#define AFE_BUS_CFG                                    0x0250
+#define AFE_ADDA_PREDIS_CON0                           0x0260
+#define AFE_ADDA_PREDIS_CON1                           0x0264
+#define AFE_I2S_MON                                    0x027c
+#define AFE_ADDA_IIR_COEF_02_01                        0x0290
+#define AFE_ADDA_IIR_COEF_04_03                        0x0294
+#define AFE_ADDA_IIR_COEF_06_05                        0x0298
+#define AFE_ADDA_IIR_COEF_08_07                        0x029c
+#define AFE_ADDA_IIR_COEF_10_09                        0x02a0
+#define AFE_IRQ_MCU_CON1                               0x02e4
+#define AFE_IRQ_MCU_CON2                               0x02e8
+#define AFE_DAC_MON                                    0x02ec
+#define AFE_IRQ_MCU_CON3                               0x02f0
+#define AFE_IRQ_MCU_CON4                               0x02f4
+#define AFE_IRQ_MCU_CNT0                               0x0300
+#define AFE_IRQ_MCU_CNT6                               0x0304
+#define AFE_IRQ_MCU_CNT8                               0x0308
+#define AFE_IRQ_MCU_DSP2_EN                            0x030c
+#define AFE_IRQ0_MCU_CNT_MON                           0x0310
+#define AFE_IRQ6_MCU_CNT_MON                           0x0314
+#define AFE_VUL4_CON0                                  0x0358
+#define AFE_VUL4_BASE_MSB                              0x035c
+#define AFE_VUL4_BASE                                  0x0360
+#define AFE_VUL4_CUR_MSB                               0x0364
+#define AFE_VUL4_CUR                                   0x0368
+#define AFE_VUL4_END_MSB                               0x036c
+#define AFE_VUL4_END                                   0x0370
+#define AFE_VUL12_CON0                                 0x0374
+#define AFE_VUL12_BASE_MSB                             0x0378
+#define AFE_VUL12_BASE                                 0x037c
+#define AFE_VUL12_CUR_MSB                              0x0380
+#define AFE_VUL12_CUR                                  0x0384
+#define AFE_VUL12_END_MSB                              0x0388
+#define AFE_VUL12_END                                  0x038c
+#define AFE_HDMI_CONN0                                 0x0390
+#define AFE_IRQ3_MCU_CNT_MON                           0x0398
+#define AFE_IRQ4_MCU_CNT_MON                           0x039c
+#define AFE_IRQ_MCU_CON0                               0x03a0
+#define AFE_IRQ_MCU_STATUS                             0x03a4
+#define AFE_IRQ_MCU_CLR                                0x03a8
+#define AFE_IRQ_MCU_CNT1                               0x03ac
+#define AFE_IRQ_MCU_CNT2                               0x03b0
+#define AFE_IRQ_MCU_EN                                 0x03b4
+#define AFE_IRQ_MCU_MON2                               0x03b8
+#define AFE_IRQ_MCU_CNT5                               0x03bc
+#define AFE_IRQ1_MCU_CNT_MON                           0x03c0
+#define AFE_IRQ2_MCU_CNT_MON                           0x03c4
+#define AFE_IRQ5_MCU_CNT_MON                           0x03cc
+#define AFE_IRQ_MCU_DSP_EN                             0x03d0
+#define AFE_IRQ_MCU_SCP_EN                             0x03d4
+#define AFE_IRQ_MCU_CNT7                               0x03dc
+#define AFE_IRQ7_MCU_CNT_MON                           0x03e0
+#define AFE_IRQ_MCU_CNT3                               0x03e4
+#define AFE_IRQ_MCU_CNT4                               0x03e8
+#define AFE_IRQ_MCU_CNT11                              0x03ec
+#define AFE_APLL1_TUNER_CFG                            0x03f0
+#define AFE_APLL2_TUNER_CFG                            0x03f4
+#define AFE_IRQ_MCU_MISS_CLR                           0x03f8
+#define AFE_CONN33                                     0x0408
+#define AFE_IRQ_MCU_CNT12                              0x040c
+#define AFE_GAIN1_CON0                                 0x0410
+#define AFE_GAIN1_CON1                                 0x0414
+#define AFE_GAIN1_CON2                                 0x0418
+#define AFE_GAIN1_CON3                                 0x041c
+#define AFE_CONN7                                      0x0420
+#define AFE_GAIN1_CUR                                  0x0424
+#define AFE_GAIN2_CON0                                 0x0428
+#define AFE_GAIN2_CON1                                 0x042c
+#define AFE_GAIN2_CON2                                 0x0430
+#define AFE_GAIN2_CON3                                 0x0434
+#define AFE_CONN8                                      0x0438
+#define AFE_GAIN2_CUR                                  0x043c
+#define AFE_CONN9                                      0x0440
+#define AFE_CONN10                                     0x0444
+#define AFE_CONN11                                     0x0448
+#define AFE_CONN12                                     0x044c
+#define AFE_CONN13                                     0x0450
+#define AFE_CONN14                                     0x0454
+#define AFE_CONN15                                     0x0458
+#define AFE_CONN16                                     0x045c
+#define AFE_CONN17                                     0x0460
+#define AFE_CONN18                                     0x0464
+#define AFE_CONN19                                     0x0468
+#define AFE_CONN20                                     0x046c
+#define AFE_CONN21                                     0x0470
+#define AFE_CONN22                                     0x0474
+#define AFE_CONN23                                     0x0478
+#define AFE_CONN24                                     0x047c
+#define AFE_CONN_RS                                    0x0494
+#define AFE_CONN_DI                                    0x0498
+#define AFE_CONN25                                     0x04b0
+#define AFE_CONN26                                     0x04b4
+#define AFE_CONN27                                     0x04b8
+#define AFE_CONN28                                     0x04bc
+#define AFE_CONN29                                     0x04c0
+#define AFE_CONN30                                     0x04c4
+#define AFE_CONN31                                     0x04c8
+#define AFE_CONN32                                     0x04cc
+#define AFE_SRAM_DELSEL_CON1                           0x04f4
+#define AFE_CONN56                                     0x0500
+#define AFE_CONN57                                     0x0504
+#define AFE_CONN56_1                                   0x0510
+#define AFE_CONN57_1                                   0x0514
+#define AFE_TINY_CONN2                                 0x0520
+#define AFE_TINY_CONN3                                 0x0524
+#define AFE_TINY_CONN4                                 0x0528
+#define AFE_TINY_CONN5                                 0x052c
+#define PCM_INTF_CON1                                  0x0530
+#define PCM_INTF_CON2                                  0x0538
+#define PCM2_INTF_CON                                  0x053c
+#define AFE_TDM_CON1                                   0x0548
+#define AFE_TDM_CON2                                   0x054c
+#define AFE_I2S_CON6                                   0x0564
+#define AFE_I2S_CON7                                   0x0568
+#define AFE_I2S_CON8                                   0x056c
+#define AFE_I2S_CON9                                   0x0570
+#define AFE_CONN34                                     0x0580
+#define FPGA_CFG0                                      0x05b0
+#define FPGA_CFG1                                      0x05b4
+#define FPGA_CFG2                                      0x05c0
+#define FPGA_CFG3                                      0x05c4
+#define AUDIO_TOP_DBG_CON                              0x05c8
+#define AUDIO_TOP_DBG_MON0                             0x05cc
+#define AUDIO_TOP_DBG_MON1                             0x05d0
+#define AFE_IRQ8_MCU_CNT_MON                           0x05e4
+#define AFE_IRQ11_MCU_CNT_MON                          0x05e8
+#define AFE_IRQ12_MCU_CNT_MON                          0x05ec
+#define AFE_IRQ_MCU_CNT9                               0x0600
+#define AFE_IRQ_MCU_CNT10                              0x0604
+#define AFE_IRQ_MCU_CNT13                              0x0608
+#define AFE_IRQ_MCU_CNT14                              0x060c
+#define AFE_IRQ_MCU_CNT15                              0x0610
+#define AFE_IRQ_MCU_CNT16                              0x0614
+#define AFE_IRQ_MCU_CNT17                              0x0618
+#define AFE_IRQ_MCU_CNT18                              0x061c
+#define AFE_IRQ_MCU_CNT19                              0x0620
+#define AFE_IRQ_MCU_CNT20                              0x0624
+#define AFE_IRQ_MCU_CNT21                              0x0628
+#define AFE_IRQ_MCU_CNT22                              0x062c
+#define AFE_IRQ_MCU_CNT23                              0x0630
+#define AFE_IRQ_MCU_CNT24                              0x0634
+#define AFE_IRQ_MCU_CNT25                              0x0638
+#define AFE_IRQ_MCU_CNT26                              0x063c
+#define AFE_IRQ_MCU_CNT31                              0x0640
+#define AFE_TINY_CONN6                                 0x0650
+#define AFE_TINY_CONN7                                 0x0654
+#define AFE_IRQ9_MCU_CNT_MON                           0x0660
+#define AFE_IRQ10_MCU_CNT_MON                          0x0664
+#define AFE_IRQ13_MCU_CNT_MON                          0x0668
+#define AFE_IRQ14_MCU_CNT_MON                          0x066c
+#define AFE_IRQ15_MCU_CNT_MON                          0x0670
+#define AFE_IRQ16_MCU_CNT_MON                          0x0674
+#define AFE_IRQ17_MCU_CNT_MON                          0x0678
+#define AFE_IRQ18_MCU_CNT_MON                          0x067c
+#define AFE_IRQ19_MCU_CNT_MON                          0x0680
+#define AFE_IRQ20_MCU_CNT_MON                          0x0684
+#define AFE_IRQ21_MCU_CNT_MON                          0x0688
+#define AFE_IRQ22_MCU_CNT_MON                          0x068c
+#define AFE_IRQ23_MCU_CNT_MON                          0x0690
+#define AFE_IRQ24_MCU_CNT_MON                          0x0694
+#define AFE_IRQ25_MCU_CNT_MON                          0x0698
+#define AFE_IRQ26_MCU_CNT_MON                          0x069c
+#define AFE_IRQ31_MCU_CNT_MON                          0x06a0
+#define AFE_GENERAL_REG0                               0x0800
+#define AFE_GENERAL_REG1                               0x0804
+#define AFE_GENERAL_REG2                               0x0808
+#define AFE_GENERAL_REG3                               0x080c
+#define AFE_GENERAL_REG4                               0x0810
+#define AFE_GENERAL_REG5                               0x0814
+#define AFE_GENERAL_REG6                               0x0818
+#define AFE_GENERAL_REG7                               0x081c
+#define AFE_GENERAL_REG8                               0x0820
+#define AFE_GENERAL_REG9                               0x0824
+#define AFE_GENERAL_REG10                              0x0828
+#define AFE_GENERAL_REG11                              0x082c
+#define AFE_GENERAL_REG12                              0x0830
+#define AFE_GENERAL_REG13                              0x0834
+#define AFE_GENERAL_REG14                              0x0838
+#define AFE_GENERAL_REG15                              0x083c
+#define AFE_CBIP_CFG0                                  0x0840
+#define AFE_CBIP_MON0                                  0x0844
+#define AFE_CBIP_SLV_MUX_MON0                          0x0848
+#define AFE_CBIP_SLV_DECODER_MON0                      0x084c
+#define AFE_ADDA6_MTKAIF_MON0                          0x0854
+#define AFE_ADDA6_MTKAIF_MON1                          0x0858
+#define AFE_AWB_CON0                                   0x085c
+#define AFE_AWB_BASE_MSB                               0x0860
+#define AFE_AWB_BASE                                   0x0864
+#define AFE_AWB_CUR_MSB                                0x0868
+#define AFE_AWB_CUR                                    0x086c
+#define AFE_AWB_END_MSB                                0x0870
+#define AFE_AWB_END                                    0x0874
+#define AFE_AWB2_CON0                                  0x0878
+#define AFE_AWB2_BASE_MSB                              0x087c
+#define AFE_AWB2_BASE                                  0x0880
+#define AFE_AWB2_CUR_MSB                               0x0884
+#define AFE_AWB2_CUR                                   0x0888
+#define AFE_AWB2_END_MSB                               0x088c
+#define AFE_AWB2_END                                   0x0890
+#define AFE_DAI_CON0                                   0x0894
+#define AFE_DAI_BASE_MSB                               0x0898
+#define AFE_DAI_BASE                                   0x089c
+#define AFE_DAI_CUR_MSB                                0x08a0
+#define AFE_DAI_CUR                                    0x08a4
+#define AFE_DAI_END_MSB                                0x08a8
+#define AFE_DAI_END                                    0x08ac
+#define AFE_DAI2_CON0                                  0x08b0
+#define AFE_DAI2_BASE_MSB                              0x08b4
+#define AFE_DAI2_BASE                                  0x08b8
+#define AFE_DAI2_CUR_MSB                               0x08bc
+#define AFE_DAI2_CUR                                   0x08c0
+#define AFE_DAI2_END_MSB                               0x08c4
+#define AFE_DAI2_END                                   0x08c8
+#define AFE_MEMIF_CON0                                 0x08cc
+#define AFE_CONN0_1                                    0x0900
+#define AFE_CONN1_1                                    0x0904
+#define AFE_CONN2_1                                    0x0908
+#define AFE_CONN3_1                                    0x090c
+#define AFE_CONN4_1                                    0x0910
+#define AFE_CONN5_1                                    0x0914
+#define AFE_CONN6_1                                    0x0918
+#define AFE_CONN7_1                                    0x091c
+#define AFE_CONN8_1                                    0x0920
+#define AFE_CONN9_1                                    0x0924
+#define AFE_CONN10_1                                   0x0928
+#define AFE_CONN11_1                                   0x092c
+#define AFE_CONN12_1                                   0x0930
+#define AFE_CONN13_1                                   0x0934
+#define AFE_CONN14_1                                   0x0938
+#define AFE_CONN15_1                                   0x093c
+#define AFE_CONN16_1                                   0x0940
+#define AFE_CONN17_1                                   0x0944
+#define AFE_CONN18_1                                   0x0948
+#define AFE_CONN19_1                                   0x094c
+#define AFE_CONN20_1                                   0x0950
+#define AFE_CONN21_1                                   0x0954
+#define AFE_CONN22_1                                   0x0958
+#define AFE_CONN23_1                                   0x095c
+#define AFE_CONN24_1                                   0x0960
+#define AFE_CONN25_1                                   0x0964
+#define AFE_CONN26_1                                   0x0968
+#define AFE_CONN27_1                                   0x096c
+#define AFE_CONN28_1                                   0x0970
+#define AFE_CONN29_1                                   0x0974
+#define AFE_CONN30_1                                   0x0978
+#define AFE_CONN31_1                                   0x097c
+#define AFE_CONN32_1                                   0x0980
+#define AFE_CONN33_1                                   0x0984
+#define AFE_CONN34_1                                   0x0988
+#define AFE_CONN_RS_1                                  0x098c
+#define AFE_CONN_DI_1                                  0x0990
+#define AFE_CONN_24BIT_1                               0x0994
+#define AFE_CONN_REG                                   0x0998
+#define AFE_CONN35                                     0x09a0
+#define AFE_CONN36                                     0x09a4
+#define AFE_CONN37                                     0x09a8
+#define AFE_CONN38                                     0x09ac
+#define AFE_CONN35_1                                   0x09b0
+#define AFE_CONN36_1                                   0x09b4
+#define AFE_CONN37_1                                   0x09b8
+#define AFE_CONN38_1                                   0x09bc
+#define AFE_CONN39                                     0x09c0
+#define AFE_CONN40                                     0x09c4
+#define AFE_CONN41                                     0x09c8
+#define AFE_CONN42                                     0x09cc
+#define AFE_SGEN_CON_SGEN32                            0x09d0
+#define AFE_CONN39_1                                   0x09e0
+#define AFE_CONN40_1                                   0x09e4
+#define AFE_CONN41_1                                   0x09e8
+#define AFE_CONN42_1                                   0x09ec
+#define AFE_I2S_CON4                                   0x09f8
+#define AFE_ADDA6_TOP_CON0                             0x0a80
+#define AFE_ADDA6_UL_SRC_CON0                          0x0a84
+#define AFE_ADDA6_UL_SRC_CON1                          0x0a88
+#define AFE_ADDA6_SRC_DEBUG                            0x0a8c
+#define AFE_ADDA6_SRC_DEBUG_MON0                       0x0a90
+#define AFE_ADDA6_ULCF_CFG_02_01                       0x0aa0
+#define AFE_ADDA6_ULCF_CFG_04_03                       0x0aa4
+#define AFE_ADDA6_ULCF_CFG_06_05                       0x0aa8
+#define AFE_ADDA6_ULCF_CFG_08_07                       0x0aac
+#define AFE_ADDA6_ULCF_CFG_10_09                       0x0ab0
+#define AFE_ADDA6_ULCF_CFG_12_11                       0x0ab4
+#define AFE_ADDA6_ULCF_CFG_14_13                       0x0ab8
+#define AFE_ADDA6_ULCF_CFG_16_15                       0x0abc
+#define AFE_ADDA6_ULCF_CFG_18_17                       0x0ac0
+#define AFE_ADDA6_ULCF_CFG_20_19                       0x0ac4
+#define AFE_ADDA6_ULCF_CFG_22_21                       0x0ac8
+#define AFE_ADDA6_ULCF_CFG_24_23                       0x0acc
+#define AFE_ADDA6_ULCF_CFG_26_25                       0x0ad0
+#define AFE_ADDA6_ULCF_CFG_28_27                       0x0ad4
+#define AFE_ADDA6_ULCF_CFG_30_29                       0x0ad8
+#define AFE_ADD6A_UL_SRC_MON0                          0x0ae4
+#define AFE_ADDA6_UL_SRC_MON1                          0x0ae8
+#define AFE_TINY_CONN0                                 0x0af0
+#define AFE_TINY_CONN1                                 0x0af4
+#define AFE_CONN43                                     0x0af8
+#define AFE_CONN43_1                                   0x0afc
+#define AFE_MOD_DAI_CON0                               0x0b00
+#define AFE_MOD_DAI_BASE_MSB                           0x0b04
+#define AFE_MOD_DAI_BASE                               0x0b08
+#define AFE_MOD_DAI_CUR_MSB                            0x0b0c
+#define AFE_MOD_DAI_CUR                                0x0b10
+#define AFE_MOD_DAI_END_MSB                            0x0b14
+#define AFE_MOD_DAI_END                                0x0b18
+#define AFE_HDMI_OUT_CON0                              0x0b1c
+#define AFE_HDMI_OUT_BASE_MSB                          0x0b20
+#define AFE_HDMI_OUT_BASE                              0x0b24
+#define AFE_HDMI_OUT_CUR_MSB                           0x0b28
+#define AFE_HDMI_OUT_CUR                               0x0b2c
+#define AFE_HDMI_OUT_END_MSB                           0x0b30
+#define AFE_HDMI_OUT_END                               0x0b34
+#define AFE_AWB_RCH_MON                                0x0b70
+#define AFE_AWB_LCH_MON                                0x0b74
+#define AFE_VUL_RCH_MON                                0x0b78
+#define AFE_VUL_LCH_MON                                0x0b7c
+#define AFE_VUL12_RCH_MON                              0x0b80
+#define AFE_VUL12_LCH_MON                              0x0b84
+#define AFE_VUL2_RCH_MON                               0x0b88
+#define AFE_VUL2_LCH_MON                               0x0b8c
+#define AFE_DAI_DATA_MON                               0x0b90
+#define AFE_MOD_DAI_DATA_MON                           0x0b94
+#define AFE_DAI2_DATA_MON                              0x0b98
+#define AFE_AWB2_RCH_MON                               0x0b9c
+#define AFE_AWB2_LCH_MON                               0x0ba0
+#define AFE_VUL3_RCH_MON                               0x0ba4
+#define AFE_VUL3_LCH_MON                               0x0ba8
+#define AFE_VUL4_RCH_MON                               0x0bac
+#define AFE_VUL4_LCH_MON                               0x0bb0
+#define AFE_VUL5_RCH_MON                               0x0bb4
+#define AFE_VUL5_LCH_MON                               0x0bb8
+#define AFE_VUL6_RCH_MON                               0x0bbc
+#define AFE_VUL6_LCH_MON                               0x0bc0
+#define AFE_DL1_RCH_MON                                0x0bc4
+#define AFE_DL1_LCH_MON                                0x0bc8
+#define AFE_DL2_RCH_MON                                0x0bcc
+#define AFE_DL2_LCH_MON                                0x0bd0
+#define AFE_DL12_RCH1_MON                              0x0bd4
+#define AFE_DL12_LCH1_MON                              0x0bd8
+#define AFE_DL12_RCH2_MON                              0x0bdc
+#define AFE_DL12_LCH2_MON                              0x0be0
+#define AFE_DL3_RCH_MON                                0x0be4
+#define AFE_DL3_LCH_MON                                0x0be8
+#define AFE_DL4_RCH_MON                                0x0bec
+#define AFE_DL4_LCH_MON                                0x0bf0
+#define AFE_DL5_RCH_MON                                0x0bf4
+#define AFE_DL5_LCH_MON                                0x0bf8
+#define AFE_DL6_RCH_MON                                0x0bfc
+#define AFE_DL6_LCH_MON                                0x0c00
+#define AFE_DL7_RCH_MON                                0x0c04
+#define AFE_DL7_LCH_MON                                0x0c08
+#define AFE_DL8_RCH_MON                                0x0c0c
+#define AFE_DL8_LCH_MON                                0x0c10
+#define AFE_VUL5_CON0                                  0x0c14
+#define AFE_VUL5_BASE_MSB                              0x0c18
+#define AFE_VUL5_BASE                                  0x0c1c
+#define AFE_VUL5_CUR_MSB                               0x0c20
+#define AFE_VUL5_CUR                                   0x0c24
+#define AFE_VUL5_END_MSB                               0x0c28
+#define AFE_VUL5_END                                   0x0c2c
+#define AFE_VUL6_CON0                                  0x0c30
+#define AFE_VUL6_BASE_MSB                              0x0c34
+#define AFE_VUL6_BASE                                  0x0c38
+#define AFE_VUL6_CUR_MSB                               0x0c3c
+#define AFE_VUL6_CUR                                   0x0c40
+#define AFE_VUL6_END_MSB                               0x0c44
+#define AFE_VUL6_END                                   0x0c48
+#define AFE_ADDA_DL_SDM_DCCOMP_CON                     0x0c50
+#define AFE_ADDA_DL_SDM_TEST                           0x0c54
+#define AFE_ADDA_DL_DC_COMP_CFG0                       0x0c58
+#define AFE_ADDA_DL_DC_COMP_CFG1                       0x0c5c
+#define AFE_ADDA_DL_SDM_FIFO_MON                       0x0c60
+#define AFE_ADDA_DL_SRC_LCH_MON                        0x0c64
+#define AFE_ADDA_DL_SRC_RCH_MON                        0x0c68
+#define AFE_ADDA_DL_SDM_OUT_MON                        0x0c6c
+#define AFE_ADDA_DL_SDM_DITHER_CON                     0x0c70
+#define AFE_ADDA_DL_SDM_AUTO_RESET_CON                 0x0c74
+#define AFE_CONNSYS_I2S_CON                            0x0c78
+#define AFE_CONNSYS_I2S_MON                            0x0c7c
+#define AFE_ASRC_2CH_CON0                              0x0c80
+#define AFE_ASRC_2CH_CON1                              0x0c84
+#define AFE_ASRC_2CH_CON2                              0x0c88
+#define AFE_ASRC_2CH_CON3                              0x0c8c
+#define AFE_ASRC_2CH_CON4                              0x0c90
+#define AFE_ASRC_2CH_CON5                              0x0c94
+#define AFE_ASRC_2CH_CON6                              0x0c98
+#define AFE_ASRC_2CH_CON7                              0x0c9c
+#define AFE_ASRC_2CH_CON8                              0x0ca0
+#define AFE_ASRC_2CH_CON9                              0x0ca4
+#define AFE_ASRC_2CH_CON10                             0x0ca8
+#define AFE_ASRC_2CH_CON12                             0x0cb0
+#define AFE_ASRC_2CH_CON13                             0x0cb4
+#define AFE_ADDA6_IIR_COEF_02_01                       0x0ce0
+#define AFE_ADDA6_IIR_COEF_04_03                       0x0ce4
+#define AFE_ADDA6_IIR_COEF_06_05                       0x0ce8
+#define AFE_ADDA6_IIR_COEF_08_07                       0x0cec
+#define AFE_ADDA6_IIR_COEF_10_09                       0x0cf0
+#define AFE_SE_PROT_SIDEBAND                           0x0d38
+#define AFE_SE_DOMAIN_SIDEBAND0                        0x0d3c
+#define AFE_ADDA_PREDIS_CON2                           0x0d40
+#define AFE_ADDA_PREDIS_CON3                           0x0d44
+#define AFE_MEMIF_CONN                                 0x0d50
+#define AFE_SE_DOMAIN_SIDEBAND1                        0x0d54
+#define AFE_SE_DOMAIN_SIDEBAND2                        0x0d58
+#define AFE_SE_DOMAIN_SIDEBAND3                        0x0d5c
+#define AFE_CONN44                                     0x0d70
+#define AFE_CONN45                                     0x0d74
+#define AFE_CONN46                                     0x0d78
+#define AFE_CONN47                                     0x0d7c
+#define AFE_CONN44_1                                   0x0d80
+#define AFE_CONN45_1                                   0x0d84
+#define AFE_CONN46_1                                   0x0d88
+#define AFE_CONN47_1                                   0x0d8c
+#define AFE_DL9_CUR_MSB                                0x0dc0
+#define AFE_DL9_CUR                                    0x0dc4
+#define AFE_DL9_END_MSB                                0x0dc8
+#define AFE_DL9_END                                    0x0dcc
+#define AFE_HD_ENGEN_ENABLE                            0x0dd0
+#define AFE_ADDA_DL_NLE_FIFO_MON                       0x0dfc
+#define AFE_ADDA_MTKAIF_CFG0                           0x0e00
+#define AFE_ADDA_MTKAIF_SYNCWORD_CFG                   0x0e14
+#define AFE_ADDA_MTKAIF_RX_CFG0                        0x0e20
+#define AFE_ADDA_MTKAIF_RX_CFG1                        0x0e24
+#define AFE_ADDA_MTKAIF_RX_CFG2                        0x0e28
+#define AFE_ADDA_MTKAIF_MON0                           0x0e34
+#define AFE_ADDA_MTKAIF_MON1                           0x0e38
+#define AFE_AUD_PAD_TOP                                0x0e40
+#define AFE_DL_NLE_R_CFG0                              0x0e44
+#define AFE_DL_NLE_R_CFG1                              0x0e48
+#define AFE_DL_NLE_L_CFG0                              0x0e4c
+#define AFE_DL_NLE_L_CFG1                              0x0e50
+#define AFE_DL_NLE_R_MON0                              0x0e54
+#define AFE_DL_NLE_R_MON1                              0x0e58
+#define AFE_DL_NLE_R_MON2                              0x0e5c
+#define AFE_DL_NLE_L_MON0                              0x0e60
+#define AFE_DL_NLE_L_MON1                              0x0e64
+#define AFE_DL_NLE_L_MON2                              0x0e68
+#define AFE_DL_NLE_GAIN_CFG0                           0x0e6c
+#define AFE_ADDA6_MTKAIF_CFG0                          0x0e70
+#define AFE_ADDA6_MTKAIF_RX_CFG0                       0x0e74
+#define AFE_ADDA6_MTKAIF_RX_CFG1                       0x0e78
+#define AFE_ADDA6_MTKAIF_RX_CFG2                       0x0e7c
+#define AFE_GENERAL1_ASRC_2CH_CON0                     0x0e80
+#define AFE_GENERAL1_ASRC_2CH_CON1                     0x0e84
+#define AFE_GENERAL1_ASRC_2CH_CON2                     0x0e88
+#define AFE_GENERAL1_ASRC_2CH_CON3                     0x0e8c
+#define AFE_GENERAL1_ASRC_2CH_CON4                     0x0e90
+#define AFE_GENERAL1_ASRC_2CH_CON5                     0x0e94
+#define AFE_GENERAL1_ASRC_2CH_CON6                     0x0e98
+#define AFE_GENERAL1_ASRC_2CH_CON7                     0x0e9c
+#define AFE_GENERAL1_ASRC_2CH_CON8                     0x0ea0
+#define AFE_GENERAL1_ASRC_2CH_CON9                     0x0ea4
+#define AFE_GENERAL1_ASRC_2CH_CON10                    0x0ea8
+#define AFE_GENERAL1_ASRC_2CH_CON12                    0x0eb0
+#define AFE_GENERAL1_ASRC_2CH_CON13                    0x0eb4
+#define GENERAL_ASRC_MODE                              0x0eb8
+#define GENERAL_ASRC_EN_ON                             0x0ebc
+#define AFE_CONN48                                     0x0ec0
+#define AFE_CONN49                                     0x0ec4
+#define AFE_CONN50                                     0x0ec8
+#define AFE_CONN51                                     0x0ecc
+#define AFE_CONN52                                     0x0ed0
+#define AFE_CONN53                                     0x0ed4
+#define AFE_CONN54                                     0x0ed8
+#define AFE_CONN55                                     0x0edc
+#define AFE_CONN48_1                                   0x0ee0
+#define AFE_CONN49_1                                   0x0ee4
+#define AFE_CONN50_1                                   0x0ee8
+#define AFE_CONN51_1                                   0x0eec
+#define AFE_CONN52_1                                   0x0ef0
+#define AFE_CONN53_1                                   0x0ef4
+#define AFE_CONN54_1                                   0x0ef8
+#define AFE_CONN55_1                                   0x0efc
+#define AFE_GENERAL2_ASRC_2CH_CON0                     0x0f00
+#define AFE_GENERAL2_ASRC_2CH_CON1                     0x0f04
+#define AFE_GENERAL2_ASRC_2CH_CON2                     0x0f08
+#define AFE_GENERAL2_ASRC_2CH_CON3                     0x0f0c
+#define AFE_GENERAL2_ASRC_2CH_CON4                     0x0f10
+#define AFE_GENERAL2_ASRC_2CH_CON5                     0x0f14
+#define AFE_GENERAL2_ASRC_2CH_CON6                     0x0f18
+#define AFE_GENERAL2_ASRC_2CH_CON7                     0x0f1c
+#define AFE_GENERAL2_ASRC_2CH_CON8                     0x0f20
+#define AFE_GENERAL2_ASRC_2CH_CON9                     0x0f24
+#define AFE_GENERAL2_ASRC_2CH_CON10                    0x0f28
+#define AFE_GENERAL2_ASRC_2CH_CON12                    0x0f30
+#define AFE_GENERAL2_ASRC_2CH_CON13                    0x0f34
+#define AFE_DL9_RCH_MON                                0x0f38
+#define AFE_DL9_LCH_MON                                0x0f3c
+#define AFE_DL5_CON0                                   0x0f4c
+#define AFE_DL5_BASE_MSB                               0x0f50
+#define AFE_DL5_BASE                                   0x0f54
+#define AFE_DL5_CUR_MSB                                0x0f58
+#define AFE_DL5_CUR                                    0x0f5c
+#define AFE_DL5_END_MSB                                0x0f60
+#define AFE_DL5_END                                    0x0f64
+#define AFE_DL6_CON0                                   0x0f68
+#define AFE_DL6_BASE_MSB                               0x0f6c
+#define AFE_DL6_BASE                                   0x0f70
+#define AFE_DL6_CUR_MSB                                0x0f74
+#define AFE_DL6_CUR                                    0x0f78
+#define AFE_DL6_END_MSB                                0x0f7c
+#define AFE_DL6_END                                    0x0f80
+#define AFE_DL7_CON0                                   0x0f84
+#define AFE_DL7_BASE_MSB                               0x0f88
+#define AFE_DL7_BASE                                   0x0f8c
+#define AFE_DL7_CUR_MSB                                0x0f90
+#define AFE_DL7_CUR                                    0x0f94
+#define AFE_DL7_END_MSB                                0x0f98
+#define AFE_DL7_END                                    0x0f9c
+#define AFE_DL8_CON0                                   0x0fa0
+#define AFE_DL8_BASE_MSB                               0x0fa4
+#define AFE_DL8_BASE                                   0x0fa8
+#define AFE_DL8_CUR_MSB                                0x0fac
+#define AFE_DL8_CUR                                    0x0fb0
+#define AFE_DL8_END_MSB                                0x0fb4
+#define AFE_DL8_END                                    0x0fb8
+#define AFE_DL9_CON0                                   0x0fbc
+#define AFE_DL9_BASE_MSB                               0x0fc0
+#define AFE_DL9_BASE                                   0x0fc4
+#define AFE_SE_SECURE_CON                              0x1004
+#define AFE_PROT_SIDEBAND_MON                          0x1008
+#define AFE_DOMAIN_SIDEBAND0_MON                       0x100c
+#define AFE_DOMAIN_SIDEBAND1_MON                       0x1010
+#define AFE_DOMAIN_SIDEBAND2_MON                       0x1014
+#define AFE_DOMAIN_SIDEBAND3_MON                       0x1018
+#define AFE_SECURE_MASK_CONN0                          0x1020
+#define AFE_SECURE_MASK_CONN1                          0x1024
+#define AFE_SECURE_MASK_CONN2                          0x1028
+#define AFE_SECURE_MASK_CONN3                          0x102c
+#define AFE_SECURE_MASK_CONN4                          0x1030
+#define AFE_SECURE_MASK_CONN5                          0x1034
+#define AFE_SECURE_MASK_CONN6                          0x1038
+#define AFE_SECURE_MASK_CONN7                          0x103c
+#define AFE_SECURE_MASK_CONN8                          0x1040
+#define AFE_SECURE_MASK_CONN9                          0x1044
+#define AFE_SECURE_MASK_CONN10                         0x1048
+#define AFE_SECURE_MASK_CONN11                         0x104c
+#define AFE_SECURE_MASK_CONN12                         0x1050
+#define AFE_SECURE_MASK_CONN13                         0x1054
+#define AFE_SECURE_MASK_CONN14                         0x1058
+#define AFE_SECURE_MASK_CONN15                         0x105c
+#define AFE_SECURE_MASK_CONN16                         0x1060
+#define AFE_SECURE_MASK_CONN17                         0x1064
+#define AFE_SECURE_MASK_CONN18                         0x1068
+#define AFE_SECURE_MASK_CONN19                         0x106c
+#define AFE_SECURE_MASK_CONN20                         0x1070
+#define AFE_SECURE_MASK_CONN21                         0x1074
+#define AFE_SECURE_MASK_CONN22                         0x1078
+#define AFE_SECURE_MASK_CONN23                         0x107c
+#define AFE_SECURE_MASK_CONN24                         0x1080
+#define AFE_SECURE_MASK_CONN25                         0x1084
+#define AFE_SECURE_MASK_CONN26                         0x1088
+#define AFE_SECURE_MASK_CONN27                         0x108c
+#define AFE_SECURE_MASK_CONN28                         0x1090
+#define AFE_SECURE_MASK_CONN29                         0x1094
+#define AFE_SECURE_MASK_CONN30                         0x1098
+#define AFE_SECURE_MASK_CONN31                         0x109c
+#define AFE_SECURE_MASK_CONN32                         0x10a0
+#define AFE_SECURE_MASK_CONN33                         0x10a4
+#define AFE_SECURE_MASK_CONN34                         0x10a8
+#define AFE_SECURE_MASK_CONN35                         0x10ac
+#define AFE_SECURE_MASK_CONN36                         0x10b0
+#define AFE_SECURE_MASK_CONN37                         0x10b4
+#define AFE_SECURE_MASK_CONN38                         0x10b8
+#define AFE_SECURE_MASK_CONN39                         0x10bc
+#define AFE_SECURE_MASK_CONN40                         0x10c0
+#define AFE_SECURE_MASK_CONN41                         0x10c4
+#define AFE_SECURE_MASK_CONN42                         0x10c8
+#define AFE_SECURE_MASK_CONN43                         0x10cc
+#define AFE_SECURE_MASK_CONN44                         0x10d0
+#define AFE_SECURE_MASK_CONN45                         0x10d4
+#define AFE_SECURE_MASK_CONN46                         0x10d8
+#define AFE_SECURE_MASK_CONN47                         0x10dc
+#define AFE_SECURE_MASK_CONN48                         0x10e0
+#define AFE_SECURE_MASK_CONN49                         0x10e4
+#define AFE_SECURE_MASK_CONN50                         0x10e8
+#define AFE_SECURE_MASK_CONN51                         0x10ec
+#define AFE_SECURE_MASK_CONN52                         0x10f0
+#define AFE_SECURE_MASK_CONN53                         0x10f4
+#define AFE_SECURE_MASK_CONN54                         0x10f8
+#define AFE_SECURE_MASK_CONN55                         0x10fc
+#define AFE_SECURE_MASK_CONN56                         0x1100
+#define AFE_SECURE_MASK_CONN57                         0x1104
+#define AFE_SECURE_MASK_CONN0_1                        0x1108
+#define AFE_SECURE_MASK_CONN1_1                        0x110c
+#define AFE_SECURE_MASK_CONN2_1                        0x1110
+#define AFE_SECURE_MASK_CONN3_1                        0x1114
+#define AFE_SECURE_MASK_CONN4_1                        0x1118
+#define AFE_SECURE_MASK_CONN5_1                        0x111c
+#define AFE_SECURE_MASK_CONN6_1                        0x1120
+#define AFE_SECURE_MASK_CONN7_1                        0x1124
+#define AFE_SECURE_MASK_CONN8_1                        0x1128
+#define AFE_SECURE_MASK_CONN9_1                        0x112c
+#define AFE_SECURE_MASK_CONN10_1                       0x1130
+#define AFE_SECURE_MASK_CONN11_1                       0x1134
+#define AFE_SECURE_MASK_CONN12_1                       0x1138
+#define AFE_SECURE_MASK_CONN13_1                       0x113c
+#define AFE_SECURE_MASK_CONN14_1                       0x1140
+#define AFE_SECURE_MASK_CONN15_1                       0x1144
+#define AFE_SECURE_MASK_CONN16_1                       0x1148
+#define AFE_SECURE_MASK_CONN17_1                       0x114c
+#define AFE_SECURE_MASK_CONN18_1                       0x1150
+#define AFE_SECURE_MASK_CONN19_1                       0x1154
+#define AFE_SECURE_MASK_CONN20_1                       0x1158
+#define AFE_SECURE_MASK_CONN21_1                       0x115c
+#define AFE_SECURE_MASK_CONN22_1                       0x1160
+#define AFE_SECURE_MASK_CONN23_1                       0x1164
+#define AFE_SECURE_MASK_CONN24_1                       0x1168
+#define AFE_SECURE_MASK_CONN25_1                       0x116c
+#define AFE_SECURE_MASK_CONN26_1                       0x1170
+#define AFE_SECURE_MASK_CONN27_1                       0x1174
+#define AFE_SECURE_MASK_CONN28_1                       0x1178
+#define AFE_SECURE_MASK_CONN29_1                       0x117c
+#define AFE_SECURE_MASK_CONN30_1                       0x1180
+#define AFE_SECURE_MASK_CONN31_1                       0x1184
+#define AFE_SECURE_MASK_CONN32_1                       0x1188
+#define AFE_SECURE_MASK_CONN33_1                       0x118c
+#define AFE_SECURE_MASK_CONN34_1                       0x1190
+#define AFE_SECURE_MASK_CONN35_1                       0x1194
+#define AFE_SECURE_MASK_CONN36_1                       0x1198
+#define AFE_SECURE_MASK_CONN37_1                       0x119c
+#define AFE_SECURE_MASK_CONN38_1                       0x11a0
+#define AFE_SECURE_MASK_CONN39_1                       0x11a4
+#define AFE_SECURE_MASK_CONN40_1                       0x11a8
+#define AFE_SECURE_MASK_CONN41_1                       0x11ac
+#define AFE_SECURE_MASK_CONN42_1                       0x11b0
+#define AFE_SECURE_MASK_CONN43_1                       0x11b4
+#define AFE_SECURE_MASK_CONN44_1                       0x11b8
+#define AFE_SECURE_MASK_CONN45_1                       0x11bc
+#define AFE_SECURE_MASK_CONN46_1                       0x11c0
+#define AFE_SECURE_MASK_CONN47_1                       0x11c4
+#define AFE_SECURE_MASK_CONN48_1                       0x11c8
+#define AFE_SECURE_MASK_CONN49_1                       0x11cc
+#define AFE_SECURE_MASK_CONN50_1                       0x11d0
+#define AFE_SECURE_MASK_CONN51_1                       0x11d4
+#define AFE_SECURE_MASK_CONN52_1                       0x11d8
+#define AFE_SECURE_MASK_CONN53_1                       0x11dc
+#define AFE_SECURE_MASK_CONN54_1                       0x11e0
+#define AFE_SECURE_MASK_CONN55_1                       0x11e4
+#define AFE_SECURE_MASK_CONN56_1                       0x11e8
+#define AFE_SECURE_MASK_TINY_CONN0                     0x1200
+#define AFE_SECURE_MASK_TINY_CONN1                     0x1204
+#define AFE_SECURE_MASK_TINY_CONN2                     0x1208
+#define AFE_SECURE_MASK_TINY_CONN3                     0x120c
+#define AFE_SECURE_MASK_TINY_CONN4                     0x1210
+#define AFE_SECURE_MASK_TINY_CONN5                     0x1214
+#define AFE_SECURE_MASK_TINY_CONN6                     0x1218
+#define AFE_SECURE_MASK_TINY_CONN7                     0x121c
+
+#define AFE_MAX_REGISTER AFE_SECURE_MASK_TINY_CONN7
+
+#define AFE_IRQ_STATUS_BITS 0x87FFFFFF
+#define AFE_IRQ_CNT_SHIFT 0
+#define AFE_IRQ_CNT_MASK 0x3ffff
+
+#endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
