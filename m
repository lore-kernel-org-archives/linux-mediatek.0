Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5923DC3F2CE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 03:34:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD8920848
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 03:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FILQRouP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Apu6Zm91"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD8920848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zUYRdEswWofmvnTS479TIm+JbG/Rbee8oIkGMlX8Ps=; b=FILQRouPhLwodg
	Dx/DscjqLfNv16bCTE1OltXiiXGc0eTVIMbgJ5AIA/U+yYHAgp1QIhR5l+9fw2bCnEFJvDHedcdqW
	0BSMM5UMQ+fJ2h9V0osH7NAkPzpmd1/QhuRorZGvrjgeq9JFS9d2hxMYkXfL34FoPbr6ipqTeZiRo
	rDODO3peciL3ZGZbDh+O6VFkTTztjnF7+wmZl6+sRKZHS3ThbZGNzkLkra82fJhiE1YaR5fP2iXNG
	Qu13F/EigmKK8HZQdL8QMnBzVIdEWj8k/RQoHJ9Y6kyKFpdQJYKaSCau3IYcec5uftlL34ta0J/+B
	qQZSFEiM1fVvjSzWZB+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA3kW-0000dZ-4s; Fri, 06 Mar 2020 03:34:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA3kQ-0000b0-H0
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 03:34:06 +0000
X-UUID: d9d3ae3f1080462d908b33090335f1db-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hLc2+xjINbO8wojgBZ2ySqlH9CLWkV4QmBkz3m9O/tY=; 
 b=Apu6Zm91xe+N4kqZtLtsZTWW2s3/dyylk9lOTf0ehgYlGz7rMFrMtRvpNbnAG9IVb7klAYIzKo0cUXVnSrcb1+xZNsKhTl0c8sLaaypNW437VXD+di7Vpv2pNfba4Duf+viq0d2RIazRXKz57gJjlx4wlS7459zqOcIv4gdhNbE=;
X-UUID: d9d3ae3f1080462d908b33090335f1db-20200305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1544587307; Thu, 05 Mar 2020 19:33:59 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 19:34:18 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Mar 2020 11:31:12 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 6 Mar 2020 11:33:55 +0800
From: Eason Yen <eason.yen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: codec: mediatek: add mt6359 codec driver
Date: Fri, 6 Mar 2020 11:33:42 +0800
Message-ID: <1583465622-16628-3-git-send-email-eason.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583465622-16628-1-git-send-email-eason.yen@mediatek.com>
References: <1583465622-16628-1-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 29BC24707111F40CD0C70860686FB26D24EEDB8961775097A156B4DCEF7C36E62000:8
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt6359 codec driver

Signed-off-by: Eason Yen <eason.yen@mediatek.com>
---
 sound/soc/codecs/Kconfig  |    9 +
 sound/soc/codecs/Makefile |    2 +
 sound/soc/codecs/mt6359.c | 4217 +++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/mt6359.h | 3212 ++++++++++++++++++++++++++++++++++
 4 files changed, 7440 insertions(+)
 create mode 100644 sound/soc/codecs/mt6359.c
 create mode 100644 sound/soc/codecs/mt6359.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6aee70e..6d71267 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -125,6 +125,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ML26124
 	imply SND_SOC_MT6351
 	imply SND_SOC_MT6358
+	imply SND_SOC_MT6359
 	imply SND_SOC_MT6660
 	imply SND_SOC_NAU8540
 	imply SND_SOC_NAU8810
@@ -1681,6 +1682,14 @@ config SND_SOC_MT6358
 	  Enable support for the platform which uses MT6358 as
 	  external codec device.
 
+config SND_SOC_MT6359
+        tristate "MediaTek MT6359 Codec driver"
+        help
+          MediaTek MT6359 is a codec which contain
+          three ADC for uplink path(MICs), and
+          three DAC for downlink path(handset,
+          headset, lineout).
+
 config SND_SOC_MT6660
 	tristate "Mediatek MT6660 Speaker Amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 03533157..0c7f84e 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -123,6 +123,7 @@ snd-soc-msm8916-analog-objs := msm8916-wcd-analog.o
 snd-soc-msm8916-digital-objs := msm8916-wcd-digital.o
 snd-soc-mt6351-objs := mt6351.o
 snd-soc-mt6358-objs := mt6358.o
+snd-soc-mt6359-objs := mt6359.o
 snd-soc-mt6660-objs := mt6660.o
 snd-soc-nau8540-objs := nau8540.o
 snd-soc-nau8810-objs := nau8810.o
@@ -423,6 +424,7 @@ obj-$(CONFIG_SND_SOC_MSM8916_WCD_ANALOG) +=snd-soc-msm8916-analog.o
 obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=snd-soc-msm8916-digital.o
 obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
+obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
 obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
 obj-$(CONFIG_SND_SOC_NAU8810)   += snd-soc-nau8810.o
diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
new file mode 100644
index 0000000..383efbf
--- /dev/null
+++ b/sound/soc/codecs/mt6359.c
@@ -0,0 +1,4217 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt6359.c  --  mt6359 ALSA SoC audio codec driver
+//
+// Copyright (c) 2018 MediaTek Inc.
+// Author: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/sched.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/regulator/consumer.h>
+#include <sound/tlv.h>
+#include <sound/soc.h>
+#include "mt6359.h"
+
+enum {
+	MT6359_AIF_1 = 0,	/* dl: hp, rcv, hp+lo */
+	MT6359_AIF_2,		/* dl: lo only */
+	MT6359_AIF_VOW,
+	MT6359_AIF_NUM,
+};
+
+enum {
+	AUDIO_ANALOG_VOLUME_HSOUTL,
+	AUDIO_ANALOG_VOLUME_HSOUTR,
+	AUDIO_ANALOG_VOLUME_HPOUTL,
+	AUDIO_ANALOG_VOLUME_HPOUTR,
+	AUDIO_ANALOG_VOLUME_LINEOUTL,
+	AUDIO_ANALOG_VOLUME_LINEOUTR,
+	AUDIO_ANALOG_VOLUME_MICAMP1,
+	AUDIO_ANALOG_VOLUME_MICAMP2,
+	AUDIO_ANALOG_VOLUME_MICAMP3,
+	AUDIO_ANALOG_VOLUME_TYPE_MAX
+};
+
+enum {
+	MUX_MIC_TYPE_0,	/* ain0, micbias 0 */
+	MUX_MIC_TYPE_1,	/* ain1, micbias 1 */
+	MUX_MIC_TYPE_2,	/* ain2/3, micbias 2 */
+	MUX_PGA_L,
+	MUX_PGA_R,
+	MUX_PGA_3,
+	MUX_HP_L,
+	MUX_HP_R,
+	MUX_NUM,
+};
+
+enum {
+	DEVICE_HP,
+	DEVICE_LO,
+	DEVICE_RCV,
+	DEVICE_MIC1,
+	DEVICE_MIC2,
+	DEVICE_NUM
+};
+
+enum {
+	HP_GAIN_CTL_ZCD = 0,
+	HP_GAIN_CTL_NLE,
+	HP_GAIN_CTL_NUM,
+};
+
+/* Supply widget subseq */
+enum {
+	/* common */
+	SUPPLY_SEQ_CLK_BUF,
+	SUPPLY_SEQ_LDO_VAUD18,
+	SUPPLY_SEQ_AUD_GLB,
+	SUPPLY_SEQ_AUD_GLB_VOW,
+	SUPPLY_SEQ_DL_GPIO,
+	SUPPLY_SEQ_UL_GPIO,
+	SUPPLY_SEQ_HP_PULL_DOWN,
+	SUPPLY_SEQ_CLKSQ,
+	SUPPLY_SEQ_ADC_CLKGEN,
+	SUPPLY_SEQ_VOW_AUD_LPW,
+	SUPPLY_SEQ_AUD_VOW,
+	SUPPLY_SEQ_VOW_CLK,
+	SUPPLY_SEQ_VOW_LDO,
+	SUPPLY_SEQ_TOP_CK,
+	SUPPLY_SEQ_TOP_CK_LAST,
+	SUPPLY_SEQ_DCC_CLK,
+	SUPPLY_SEQ_MIC_BIAS,
+	SUPPLY_SEQ_DMIC,
+	SUPPLY_SEQ_VOW_DIG_CFG,
+	SUPPLY_SEQ_VOW_PERIODIC_CFG,
+	SUPPLY_SEQ_AUD_TOP,
+	SUPPLY_SEQ_AUD_TOP_LAST,
+	SUPPLY_SEQ_DL_SDM_FIFO_CLK,
+	SUPPLY_SEQ_DL_SDM,
+	SUPPLY_SEQ_DL_NCP,
+	SUPPLY_SEQ_AFE,
+	/* playback */
+	SUPPLY_SEQ_DL_SRC,
+	SUPPLY_SEQ_DL_ESD_RESIST,
+	SUPPLY_SEQ_HP_DAMPING_OFF_RESET_CMFB,
+	SUPPLY_SEQ_HP_MUTE,
+	SUPPLY_SEQ_DL_LDO_REMOTE_SENSE,
+	SUPPLY_SEQ_DL_LDO,
+	SUPPLY_SEQ_DL_NV,
+	SUPPLY_SEQ_HP_ANA_TRIM,
+	SUPPLY_SEQ_DL_IBIST,
+	/* capture */
+	SUPPLY_SEQ_UL_PGA,
+	SUPPLY_SEQ_UL_ADC,
+	SUPPLY_SEQ_UL_MTKAIF,
+	SUPPLY_SEQ_UL_SRC_DMIC,
+	SUPPLY_SEQ_UL_SRC,
+};
+
+enum {
+	CH_L = 0,
+	CH_R,
+	NUM_CH,
+};
+
+/* dl bias */
+#define DRBIAS_MASK 0x7
+#define DRBIAS_HP_SFT (RG_AUDBIASADJ_0_VAUDP32_SFT + 0)
+#define DRBIAS_HP_MASK_SFT (DRBIAS_MASK << DRBIAS_HP_SFT)
+#define DRBIAS_HS_SFT (RG_AUDBIASADJ_0_VAUDP32_SFT + 3)
+#define DRBIAS_HS_MASK_SFT (DRBIAS_MASK << DRBIAS_HS_SFT)
+#define DRBIAS_LO_SFT (RG_AUDBIASADJ_0_VAUDP32_SFT + 6)
+#define DRBIAS_LO_MASK_SFT (DRBIAS_MASK << DRBIAS_LO_SFT)
+
+enum {
+	DRBIAS_4UA = 0,
+	DRBIAS_5UA,
+	DRBIAS_6UA,
+	DRBIAS_7UA,
+	DRBIAS_8UA,
+	DRBIAS_9UA,
+	DRBIAS_10UA,
+	DRBIAS_11UA,
+};
+
+#define IBIAS_MASK 0x3
+#define IBIAS_HP_SFT (RG_AUDBIASADJ_1_VAUDP32_SFT + 0)
+#define IBIAS_HP_MASK_SFT (IBIAS_MASK << IBIAS_HP_SFT)
+#define IBIAS_HS_SFT (RG_AUDBIASADJ_1_VAUDP32_SFT + 2)
+#define IBIAS_HS_MASK_SFT (IBIAS_MASK << IBIAS_HS_SFT)
+#define IBIAS_LO_SFT (RG_AUDBIASADJ_1_VAUDP32_SFT + 4)
+#define IBIAS_LO_MASK_SFT (IBIAS_MASK << IBIAS_LO_SFT)
+#define IBIAS_ZCD_SFT (RG_AUDBIASADJ_1_VAUDP32_SFT + 6)
+#define IBIAS_ZCD_MASK_SFT (IBIAS_MASK << IBIAS_ZCD_SFT)
+
+enum {
+	IBIAS_4UA = 0,
+	IBIAS_5UA,
+	IBIAS_6UA,
+	IBIAS_7UA,
+};
+
+enum {
+	IBIAS_ZCD_3UA = 0,
+	IBIAS_ZCD_4UA,
+	IBIAS_ZCD_5UA,
+	IBIAS_ZCD_6UA,
+};
+
+enum {
+	MIC_BIAS_1P7 = 0,
+	MIC_BIAS_1P8,
+	MIC_BIAS_1P9,
+	MIC_BIAS_2P0,
+	MIC_BIAS_2P1,
+	MIC_BIAS_2P5,
+	MIC_BIAS_2P6,
+	MIC_BIAS_2P7,
+};
+
+struct mt6359_vow_periodic_on_off_data {
+	unsigned long long pga_on;
+	unsigned long long precg_on;
+	unsigned long long adc_on;
+	unsigned long long micbias0_on;
+	unsigned long long micbias1_on;
+	unsigned long long dcxo_on;
+	unsigned long long audglb_on;
+	unsigned long long vow_on;
+	unsigned long long pga_off;
+	unsigned long long precg_off;
+	unsigned long long adc_off;
+	unsigned long long micbias0_off;
+	unsigned long long micbias1_off;
+	unsigned long long dcxo_off;
+	unsigned long long audglb_off;
+	unsigned long long vow_off;
+};
+
+struct mt6359_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned int dl_rate[MT6359_AIF_NUM];
+	unsigned int ul_rate[MT6359_AIF_NUM];
+	int ana_gain[AUDIO_ANALOG_VOLUME_TYPE_MAX];
+	unsigned int mux_select[MUX_NUM];
+	int dev_counter[DEVICE_NUM];
+	int hp_gain_ctl;
+	int hp_hifi_mode;
+	int mtkaif_protocol;
+	struct regulator *avdd_reg;
+
+	/* vow control */
+	int vow_enable;
+	int reg_afe_vow_vad_cfg0;
+	int reg_afe_vow_vad_cfg1;
+	int reg_afe_vow_vad_cfg2;
+	int reg_afe_vow_vad_cfg3;
+	int reg_afe_vow_vad_cfg4;
+	int reg_afe_vow_vad_cfg5;
+	int reg_afe_vow_periodic;
+	unsigned int vow_channel;
+	struct mt6359_vow_periodic_on_off_data vow_periodic_param;
+};
+
+/* static function declaration */
+int mt6359_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
+			       int mtkaif_protocol)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	priv->mtkaif_protocol = mtkaif_protocol;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt6359_set_mtkaif_protocol);
+
+static void playback_gpio_set(struct mt6359_priv *priv)
+{
+	/* set gpio mosi mode, clk / data mosi */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE2_CLR, 0x0ffe);
+	regmap_write(priv->regmap, MT6359_GPIO_MODE2_SET, 0x0249);
+	regmap_write(priv->regmap, MT6359_GPIO_MODE2, 0x0249);
+
+	/* sync mosi */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_CLR, 0x6);
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_SET, 0x1);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE3,
+			   0x7, 0x1);
+}
+
+static void playback_gpio_reset(struct mt6359_priv *priv)
+{
+	/* set pad_aud_*_mosi to GPIO mode and dir input
+	 * reason:
+	 * pad_aud_dat_mosi*, because the pin is used as boot strap
+	 * don't clean clk/sync, for mtkaif protocol 2
+	 */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE2_CLR, 0x0ff8);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE2,
+			   0x0ff8, 0x0000);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_DIR0,
+			   0x7 << 9, 0x0);
+}
+
+static void capture_gpio_set(struct mt6359_priv *priv)
+{
+	/* set gpio miso mode */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_CLR, 0x0e00);
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_SET, 0x0200);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE3,
+			   0x0e00, 0x0200);
+
+	regmap_write(priv->regmap, MT6359_GPIO_MODE4_CLR, 0x003f);
+	regmap_write(priv->regmap, MT6359_GPIO_MODE4_SET, 0x0009);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE4,
+			   0x03f, 0x0009);
+}
+
+static void capture_gpio_reset(struct mt6359_priv *priv)
+{
+	/* set pad_aud_*_miso to GPIO mode and dir input
+	 * reason:
+	 * pad_aud_clk_miso, because when playback only the miso_clk
+	 * will also have 26m, so will have power leak
+	 * pad_aud_dat_miso*, because the pin is used as boot strap
+	 */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_CLR, 0x0e00);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE3,
+			   0x0e00, 0x0000);
+
+	regmap_write(priv->regmap, MT6359_GPIO_MODE4_CLR, 0x003f);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE4,
+			   0x003f, 0x0000);
+
+	regmap_update_bits(priv->regmap, MT6359_GPIO_DIR0,
+			   0x7 << 13, 0x0);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_DIR1,
+			   0x3 << 0, 0x0);
+}
+
+static void vow_gpio_set(struct mt6359_priv *priv)
+{
+	/* vow gpio set (data) */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_CLR, 0x0e00);
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_SET, 0x0800);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE3,
+			   0x0e00, 0x0800);
+	/* vow gpio set (clock) */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE4_CLR, 0x0007);
+	regmap_write(priv->regmap, MT6359_GPIO_MODE4_SET, 0x0004);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE4,
+			   0x0007, 0x0004);
+}
+
+static void vow_gpio_reset(struct mt6359_priv *priv)
+{
+	/* set pad_aud_*_miso to GPIO mode and dir input
+	 * reason:
+	 * pad_aud_clk_miso, because when playback only the miso_clk
+	 * will also have 26m, so will have power leak
+	 * pad_aud_dat_miso*, because the pin is used as boot strap
+	 */
+	/* vow gpio clear (data) */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE3_CLR, 0x0e00);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE3,
+			   0x0e00, 0x0000);
+	/* vow gpio clear (clock) */
+	regmap_write(priv->regmap, MT6359_GPIO_MODE4_CLR, 0x0007);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_MODE4,
+			   0x0007, 0x0000);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_DIR0,
+			   0x1 << 15, 0x0);
+	regmap_update_bits(priv->regmap, MT6359_GPIO_DIR1,
+			   0x1 << 0, 0x0);
+}
+
+/* use only when not govern by DAPM */
+static int mt6359_set_dcxo(struct mt6359_priv *priv, bool enable)
+{
+	regmap_update_bits(priv->regmap, MT6359_DCXO_CW12,
+			   0x1 << RG_XO_AUDIO_EN_M_SFT,
+			   (enable ? 1 : 0) << RG_XO_AUDIO_EN_M_SFT);
+	return 0;
+}
+
+/* use only when not govern by DAPM */
+static int mt6359_set_clksq(struct mt6359_priv *priv, bool enable)
+{
+	/* audio clk source from internal dcxo */
+	regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON23,
+			   RG_CLKSQ_IN_SEL_TEST_MASK_SFT,
+			   0x0);
+
+	/* Enable/disable CLKSQ 26MHz */
+	regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON23,
+			   RG_CLKSQ_EN_MASK_SFT,
+			   (enable ? 1 : 0) << RG_CLKSQ_EN_SFT);
+	return 0;
+}
+
+/* use only when not govern by DAPM */
+static int mt6359_set_aud_global_bias(struct mt6359_priv *priv, bool enable)
+{
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON13,
+			   RG_AUDGLB_PWRDN_VA32_MASK_SFT,
+			   (enable ? 0 : 1) << RG_AUDGLB_PWRDN_VA32_SFT);
+	return 0;
+}
+
+/* use only when not govern by DAPM */
+static int mt6359_set_topck(struct mt6359_priv *priv, bool enable)
+{
+	regmap_update_bits(priv->regmap, MT6359_AUD_TOP_CKPDN_CON0,
+			   0x0066, enable ? 0x0 : 0x66);
+	return 0;
+}
+
+static int mt6359_set_decoder_clk(struct mt6359_priv *priv, bool enable)
+{
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON13,
+			   RG_RSTB_DECODER_VA32_MASK_SFT,
+			   (enable ? 1 : 0) << RG_RSTB_DECODER_VA32_SFT);
+	return 0;
+}
+
+static int mt6359_mtkaif_tx_enable(struct mt6359_priv *priv)
+{
+	switch (priv->mtkaif_protocol) {
+	case MT6359_MTKAIF_PROTOCOL_2_CLK_P2:
+		/* MTKAIF TX format setting */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_ADDA_MTKAIF_CFG0,
+				   0xffff, 0x0210);
+		/* enable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_AUD_PAD_TOP,
+				   0xff00, 0x3800);
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_AUD_PAD_TOP,
+				   0xff00, 0x3900);
+		break;
+	case MT6359_MTKAIF_PROTOCOL_2:
+		/* MTKAIF TX format setting */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_ADDA_MTKAIF_CFG0,
+				   0xffff, 0x0210);
+		/* enable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_AUD_PAD_TOP,
+				   0xff00, 0x3100);
+		break;
+	case MT6359_MTKAIF_PROTOCOL_1:
+	default:
+		/* MTKAIF TX format setting */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_ADDA_MTKAIF_CFG0,
+				   0xffff, 0x0000);
+		/* enable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_AUD_PAD_TOP,
+				   0xff00, 0x3100);
+		break;
+	}
+	return 0;
+}
+
+static int mt6359_mtkaif_tx_disable(struct mt6359_priv *priv)
+{
+	/* disable aud_pad TX fifos */
+	regmap_update_bits(priv->regmap, MT6359_AFE_AUD_PAD_TOP,
+			   0xff00, 0x3000);
+	return 0;
+}
+
+int mt6359_mtkaif_calibration_enable(struct snd_soc_component *cmpnt)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	playback_gpio_set(priv);
+	capture_gpio_set(priv);
+	mt6359_mtkaif_tx_enable(priv);
+
+	mt6359_set_dcxo(priv, true);
+	mt6359_set_aud_global_bias(priv, true);
+	mt6359_set_clksq(priv, true);
+	mt6359_set_topck(priv, true);
+
+	/* set dat_miso_loopback on */
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK_SFT,
+			   1 << RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK_SFT,
+			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG1,
+			   RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_MASK_SFT,
+			   1 << RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_SFT);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_enable);
+
+int mt6359_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	/* set dat_miso_loopback off */
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK_SFT,
+			   0 << RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK_SFT,
+			   0 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG1,
+			   RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_MASK_SFT,
+			   0 << RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_SFT);
+
+	mt6359_set_topck(priv, false);
+	mt6359_set_clksq(priv, false);
+	mt6359_set_aud_global_bias(priv, false);
+	mt6359_set_dcxo(priv, false);
+
+	mt6359_mtkaif_tx_disable(priv);
+	playback_gpio_reset(priv);
+	capture_gpio_reset(priv);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_disable);
+
+int mt6359_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
+					int phase_1, int phase_2, int phase_3)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_PHASE_MODE_MASK_SFT,
+			   phase_1 << RG_AUD_PAD_TOP_PHASE_MODE_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_PHASE_MODE2_MASK_SFT,
+			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG1,
+			   RG_AUD_PAD_TOP_PHASE_MODE3_MASK_SFT,
+			   phase_3 << RG_AUD_PAD_TOP_PHASE_MODE3_SFT);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt6359_set_mtkaif_calibration_phase);
+
+/* dl pga gain */
+enum {
+	DL_GAIN_8DB = 0,
+	DL_GAIN_0DB = 8,
+	DL_GAIN_N_1DB = 9,
+	DL_GAIN_N_10DB = 18,
+	DL_GAIN_N_22DB = 30,
+	DL_GAIN_N_40DB = 0x1f,
+};
+
+#define DL_GAIN_N_10DB_REG (DL_GAIN_N_10DB << 7 | DL_GAIN_N_10DB)
+#define DL_GAIN_N_22DB_REG (DL_GAIN_N_22DB << 7 | DL_GAIN_N_22DB)
+#define DL_GAIN_N_40DB_REG (DL_GAIN_N_40DB << 7 | DL_GAIN_N_40DB)
+#define DL_GAIN_REG_MASK 0x0f9f
+
+/* reg idx for -40dB*/
+#define PGA_MINUS_40_DB_REG_VAL 0x1f
+#define HP_PGA_MINUS_40_DB_REG_VAL 0x3f
+static const char *const dl_pga_gain[] = {
+	"8Db", "7Db", "6Db", "5Db", "4Db",
+	"3Db", "2Db", "1Db", "0Db", "-1Db",
+	"-2Db", "-3Db",	"-4Db", "-5Db", "-6Db",
+	"-7Db", "-8Db", "-9Db", "-10Db", "-40Db"
+};
+
+static const char *const hp_dl_pga_gain[] = {
+	"8Db", "7Db", "6Db", "5Db", "4Db",
+	"3Db", "2Db", "1Db", "0Db", "-1Db",
+	"-2Db", "-3Db",	"-4Db", "-5Db", "-6Db",
+	"-7Db", "-8Db", "-9Db", "-10Db", "-11Db",
+	"-12Db", "-13Db", "-14Db", "-15Db", "-16Db",
+	"-17Db", "-18Db", "-19Db", "-20Db", "-21Db",
+	"-22Db", "-40Db"
+};
+
+static void zcd_disable(struct mt6359_priv *priv)
+{
+	regmap_write(priv->regmap, MT6359_ZCD_CON0, 0x0000);
+}
+
+static void hp_main_output_ramp(struct mt6359_priv *priv, bool up)
+{
+	int i = 0, stage = 0;
+	int target = 7;
+
+	/* Enable/Reduce HPL/R main output stage step by step */
+	for (i = 0; i <= target; i++) {
+		stage = up ? i : target - i;
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON1,
+				   RG_HPLOUTSTGCTRL_VAUDP32_MASK_SFT,
+				   stage << RG_HPLOUTSTGCTRL_VAUDP32_SFT);
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON1,
+				   RG_HPROUTSTGCTRL_VAUDP32_MASK_SFT,
+				   stage << RG_HPROUTSTGCTRL_VAUDP32_SFT);
+		usleep_range(600, 650);
+	}
+}
+
+static void hp_aux_feedback_loop_gain_ramp(struct mt6359_priv *priv, bool up)
+{
+	int i = 0, stage = 0;
+
+	/* Reduce HP aux feedback loop gain step by step */
+	for (i = 0; i <= 0xf; i++) {
+		stage = up ? i : 0xf - i;
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON9,
+				   0xf << 12, stage << 12);
+		usleep_range(600, 650);
+	}
+}
+
+static void hp_in_pair_current(struct mt6359_priv *priv, bool increase)
+{
+	int i = 0, stage = 0;
+	int target = 0x3;
+
+	/* Set input diff pair bias select (Hi-Fi mode) */
+	if (priv->hp_hifi_mode) {
+		/* Reduce HP aux feedback loop gain step by step */
+		for (i = 0; i <= target; i++) {
+			stage = increase ? i : target - i;
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDDEC_ANA_CON10,
+					   0x3 << 3, stage << 3);
+			usleep_range(100, 150);
+		}
+	}
+}
+
+static void hp_pull_down(struct mt6359_priv *priv, bool enable)
+{
+	int i;
+
+	if (enable) {
+		for (i = 0x0; i <= 0x7; i++) {
+			regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON2,
+					   RG_HPPSHORT2VCM_VAUDP32_MASK_SFT,
+					   i << RG_HPPSHORT2VCM_VAUDP32_SFT);
+			usleep_range(100, 150);
+		}
+	} else {
+		for (i = 0x7; i >= 0x0; i--) {
+			regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON2,
+					   RG_HPPSHORT2VCM_VAUDP32_MASK_SFT,
+					   i << RG_HPPSHORT2VCM_VAUDP32_SFT);
+			usleep_range(100, 150);
+		}
+	}
+}
+
+static int hp_gain_ctl_select(struct mt6359_priv *priv,
+			      unsigned int hp_gain_ctl)
+{
+	if (hp_gain_ctl >= HP_GAIN_CTL_NUM) {
+		dev_warn(priv->dev, "%s(), hp_gain_ctl %d invalid\n",
+			 __func__, hp_gain_ctl);
+		return -EINVAL;
+	}
+
+	priv->hp_gain_ctl = hp_gain_ctl;
+	regmap_update_bits(priv->regmap, MT6359_AFE_DL_NLE_CFG,
+			   NLE_LCH_HPGAIN_SEL_MASK_SFT,
+			   hp_gain_ctl << NLE_LCH_HPGAIN_SEL_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AFE_DL_NLE_CFG,
+			   NLE_RCH_HPGAIN_SEL_MASK_SFT,
+			   hp_gain_ctl << NLE_RCH_HPGAIN_SEL_SFT);
+
+	return 0;
+}
+
+static bool is_valid_hp_pga_idx(int reg_idx)
+{
+	return (reg_idx >= DL_GAIN_8DB && reg_idx <= DL_GAIN_N_22DB) ||
+	       reg_idx == DL_GAIN_N_40DB;
+}
+
+static void headset_volume_ramp(struct mt6359_priv *priv,
+				int from, int to)
+{
+	int offset = 0, count = 1, reg_idx;
+
+	if (!is_valid_hp_pga_idx(from) || !is_valid_hp_pga_idx(to))
+		dev_warn(priv->dev, "%s(), volume index is not valid, from %d, to %d\n",
+			 __func__, from, to);
+
+	dev_info(priv->dev, "%s(), from %d, to %d\n",
+		 __func__, from, to);
+
+	if (to > from)
+		offset = to - from;
+	else
+		offset = from - to;
+
+	while (offset > 0) {
+		if (to > from)
+			reg_idx = from + count;
+		else
+			reg_idx = from - count;
+
+		if (is_valid_hp_pga_idx(reg_idx)) {
+			regmap_update_bits(priv->regmap,
+					   MT6359_ZCD_CON2,
+					   DL_GAIN_REG_MASK,
+					   (reg_idx << 7) | reg_idx);
+			usleep_range(600, 650);
+		}
+		offset--;
+		count++;
+	}
+}
+
+#define MT_SOC_ENUM_EXT_ID(xname, xenum, xhandler_get, xhandler_put, id) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, .device = id,\
+	.info = snd_soc_info_enum_double, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = (unsigned long)&(xenum) }
+
+/* Mic Type MUX */
+enum {
+	MIC_TYPE_MUX_IDLE = 0,
+	MIC_TYPE_MUX_ACC,
+	MIC_TYPE_MUX_DMIC,
+	MIC_TYPE_MUX_DCC,
+	MIC_TYPE_MUX_DCC_ECM_DIFF,
+	MIC_TYPE_MUX_DCC_ECM_SINGLE,
+	MIC_TYPE_MUX_VOW_ACC,
+	MIC_TYPE_MUX_VOW_DMIC,
+	MIC_TYPE_MUX_VOW_DMIC_LP,
+	MIC_TYPE_MUX_VOW_DCC,
+	MIC_TYPE_MUX_VOW_DCC_ECM_DIFF,
+	MIC_TYPE_MUX_VOW_DCC_ECM_SINGLE,
+};
+
+#define IS_VOW_DCC_BASE(type) ((type) == MIC_TYPE_MUX_VOW_DCC || \
+			       (type) == MIC_TYPE_MUX_VOW_DCC_ECM_DIFF || \
+			       (type) == MIC_TYPE_MUX_VOW_DCC_ECM_SINGLE)
+
+#define IS_DCC_BASE(type) ((type) == MIC_TYPE_MUX_DCC || \
+			   (type) == MIC_TYPE_MUX_DCC_ECM_DIFF || \
+			   (type) == MIC_TYPE_MUX_DCC_ECM_SINGLE || \
+			   IS_VOW_DCC_BASE((type)))
+
+#define IS_VOW_AMIC_BASE(type) ((type) == MIC_TYPE_MUX_VOW_ACC || \
+				IS_VOW_DCC_BASE((type)))
+
+#define IS_VOW_BASE(type) ((type) == MIC_TYPE_MUX_VOW_DMIC || \
+			   (type) == MIC_TYPE_MUX_VOW_DMIC_LP || \
+			   IS_VOW_AMIC_BASE((type)))
+
+static const char *const mic_type_mux_map[] = {
+	"Idle",
+	"ACC",
+	"DMIC",
+	"DCC",
+	"DCC_ECM_DIFF",
+	"DCC_ECM_SINGLE",
+	"VOW_ACC",
+	"VOW_DMIC",
+	"VOW_DMIC_LP",
+	"VOW_DCC",
+	"VOW_DCC_ECM_DIFF",
+	"VOW_DCC_ECM_SINGLE"
+};
+
+static const struct soc_enum mic_type_mux_enum[] = {
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mic_type_mux_map), mic_type_mux_map),
+};
+
+static int mic_type_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.integer.value[0] =
+		priv->mux_select[kcontrol->id.device];
+	return 0;
+}
+
+static int mic_type_set(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int index = ucontrol->value.integer.value[0];
+	unsigned int id = kcontrol->id.device;
+
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
+	priv->mux_select[id] = index;
+	return 0;
+}
+
+static int mt6359_put_volsw(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+			(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int reg;
+	int index = ucontrol->value.integer.value[0];
+	int ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+	if (ret < 0)
+		return ret;
+
+	switch (mc->reg) {
+	case MT6359_ZCD_CON2:
+		regmap_read(priv->regmap, MT6359_ZCD_CON2, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] =
+			(reg >> RG_AUDHPLGAIN_SFT) & RG_AUDHPLGAIN_MASK;
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] =
+			(reg >> RG_AUDHPRGAIN_SFT) & RG_AUDHPRGAIN_MASK;
+		break;
+	case MT6359_ZCD_CON1:
+		regmap_read(priv->regmap, MT6359_ZCD_CON1, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_LINEOUTL] =
+			(reg >> RG_AUDLOLGAIN_SFT) & RG_AUDLOLGAIN_MASK;
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_LINEOUTR] =
+			(reg >> RG_AUDLORGAIN_SFT) & RG_AUDLORGAIN_MASK;
+		break;
+	case MT6359_ZCD_CON3:
+		regmap_read(priv->regmap, MT6359_ZCD_CON3, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_HSOUTL] =
+			(reg >> RG_AUDHSGAIN_SFT) & RG_AUDHSGAIN_MASK;
+		break;
+	case MT6359_AUDENC_ANA_CON0:
+		regmap_read(priv->regmap, MT6359_AUDENC_ANA_CON0, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1] =
+			(reg >> RG_AUDPREAMPLGAIN_SFT) & RG_AUDPREAMPLGAIN_MASK;
+		break;
+	case MT6359_AUDENC_ANA_CON1:
+		regmap_read(priv->regmap, MT6359_AUDENC_ANA_CON1, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2] =
+			(reg >> RG_AUDPREAMPRGAIN_SFT) & RG_AUDPREAMPRGAIN_MASK;
+		break;
+	case MT6359_AUDENC_ANA_CON2:
+		regmap_read(priv->regmap, MT6359_AUDENC_ANA_CON2, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP3] =
+			(reg >> RG_AUDPREAMP3GAIN_SFT) & RG_AUDPREAMP3GAIN_MASK;
+
+		break;
+	}
+
+	dev_info(priv->dev, "%s(), name %s, reg(0x%x) = 0x%x, set index = %x\n",
+		 __func__, kcontrol->id.name, mc->reg, reg, index);
+
+	return ret;
+}
+
+static const DECLARE_TLV_DB_SCALE(hp_playback_tlv, -2200, 100, 0);
+static const DECLARE_TLV_DB_SCALE(playback_tlv, -1000, 100, 0);
+static const DECLARE_TLV_DB_SCALE(capture_tlv, 0, 600, 0);
+
+static const struct snd_kcontrol_new mt6359_snd_controls[] = {
+	/* dl pga gain */
+	SOC_SINGLE_EXT_TLV("HeadsetL Volume",
+			   MT6359_ZCD_CON2, 0, 0x1E, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw,
+			   hp_playback_tlv),
+	SOC_SINGLE_EXT_TLV("HeadsetR Volume",
+			   MT6359_ZCD_CON2, 7, 0x1E, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw,
+			   hp_playback_tlv),
+	SOC_SINGLE_EXT_TLV("LineoutL Volume",
+			   MT6359_ZCD_CON1, 0, 0x12, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw, playback_tlv),
+	SOC_SINGLE_EXT_TLV("LineoutR Volume",
+			   MT6359_ZCD_CON1, 7, 0x12, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw, playback_tlv),
+	SOC_SINGLE_EXT_TLV("Handset Volume",
+			   MT6359_ZCD_CON3, 0, 0x12, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw, playback_tlv),
+
+	/* ul pga gain */
+	SOC_SINGLE_EXT_TLV("PGAL Volume",
+			   MT6359_AUDENC_ANA_CON0, RG_AUDPREAMPLGAIN_SFT, 4, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw, capture_tlv),
+	SOC_SINGLE_EXT_TLV("PGAR Volume",
+			   MT6359_AUDENC_ANA_CON1, RG_AUDPREAMPRGAIN_SFT, 4, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw, capture_tlv),
+	SOC_SINGLE_EXT_TLV("PGA3 Volume",
+			   MT6359_AUDENC_ANA_CON2, RG_AUDPREAMP3GAIN_SFT, 4, 0,
+			   snd_soc_get_volsw, mt6359_put_volsw, capture_tlv),
+
+	/* mix type mux */
+	MT_SOC_ENUM_EXT_ID("Mic_Type_Mux_0", mic_type_mux_enum[0],
+			   mic_type_get, mic_type_set,
+			   MUX_MIC_TYPE_0),
+	MT_SOC_ENUM_EXT_ID("Mic_Type_Mux_1", mic_type_mux_enum[0],
+			   mic_type_get, mic_type_set,
+			   MUX_MIC_TYPE_1),
+	MT_SOC_ENUM_EXT_ID("Mic_Type_Mux_2", mic_type_mux_enum[0],
+			   mic_type_get, mic_type_set,
+			   MUX_MIC_TYPE_2),
+};
+
+/* MUX */
+
+/* LOL MUX */
+enum {
+	LO_MUX_OPEN = 0,
+	LO_MUX_L_DAC,
+	LO_MUX_3RD_DAC,
+	LO_MUX_TEST_MODE,
+	LO_MUX_MASK = 0x3,
+};
+
+static const char * const lo_in_mux_map[] = {
+	"Open", "Playback_L_DAC", "Playback", "Test Mode"
+};
+
+static int lo_in_mux_map_value[] = {
+	0x0, 0x1, 0x2, 0x3,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(lo_in_mux_map_enum,
+				  SND_SOC_NOPM,
+				  0,
+				  LO_MUX_MASK,
+				  lo_in_mux_map,
+				  lo_in_mux_map_value);
+
+static const struct snd_kcontrol_new lo_in_mux_control =
+	SOC_DAPM_ENUM("LO Select", lo_in_mux_map_enum);
+
+/*HP MUX */
+enum {
+	HP_MUX_OPEN = 0,
+	HP_MUX_HPSPK,
+	HP_MUX_HP,
+	HP_MUX_TEST_MODE,
+	HP_MUX_HP_IMPEDANCE,
+	HP_MUX_MASK = 0x7,
+};
+
+static const char * const hp_in_mux_map[] = {
+	"Open",
+	"LoudSPK Playback",
+	"Audio Playback",
+	"Test Mode",
+	"HP Impedance",
+	"undefined1",
+	"undefined2",
+	"undefined3",
+};
+
+static int hp_in_mux_map_value[] = {
+	HP_MUX_OPEN,
+	HP_MUX_HPSPK,
+	HP_MUX_HP,
+	HP_MUX_TEST_MODE,
+	HP_MUX_HP_IMPEDANCE,
+	HP_MUX_OPEN,
+	HP_MUX_OPEN,
+	HP_MUX_OPEN,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hpl_in_mux_map_enum,
+				  SND_SOC_NOPM,
+				  0,
+				  HP_MUX_MASK,
+				  hp_in_mux_map,
+				  hp_in_mux_map_value);
+
+static const struct snd_kcontrol_new hpl_in_mux_control =
+	SOC_DAPM_ENUM("HPL Select", hpl_in_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hpr_in_mux_map_enum,
+				  SND_SOC_NOPM,
+				  0,
+				  HP_MUX_MASK,
+				  hp_in_mux_map,
+				  hp_in_mux_map_value);
+
+static const struct snd_kcontrol_new hpr_in_mux_control =
+	SOC_DAPM_ENUM("HPR Select", hpr_in_mux_map_enum);
+
+/* RCV MUX */
+enum {
+	RCV_MUX_OPEN = 0,
+	RCV_MUX_MUTE,
+	RCV_MUX_VOICE_PLAYBACK,
+	RCV_MUX_TEST_MODE,
+	RCV_MUX_MASK = 0x3,
+};
+
+static const char * const rcv_in_mux_map[] = {
+	"Open", "Mute", "Voice Playback", "Test Mode"
+};
+
+static int rcv_in_mux_map_value[] = {
+	RCV_MUX_OPEN,
+	RCV_MUX_MUTE,
+	RCV_MUX_VOICE_PLAYBACK,
+	RCV_MUX_TEST_MODE,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(rcv_in_mux_map_enum,
+				  SND_SOC_NOPM,
+				  0,
+				  RCV_MUX_MASK,
+				  rcv_in_mux_map,
+				  rcv_in_mux_map_value);
+
+static const struct snd_kcontrol_new rcv_in_mux_control =
+	SOC_DAPM_ENUM("RCV Select", rcv_in_mux_map_enum);
+
+/* DAC In MUX */
+static const char * const dac_in_mux_map[] = {
+	"Normal Path", "Sgen"
+};
+
+static int dac_in_mux_map_value[] = {
+	0x0, 0x1,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dac_in_mux_map_enum,
+				  MT6359_AFE_TOP_CON0,
+				  DL_SINE_ON_SFT,
+				  DL_SINE_ON_MASK,
+				  dac_in_mux_map,
+				  dac_in_mux_map_value);
+
+static const struct snd_kcontrol_new dac_in_mux_control =
+	SOC_DAPM_ENUM("DAC Select", dac_in_mux_map_enum);
+
+/* AIF Out MUX */
+static SOC_VALUE_ENUM_SINGLE_DECL(aif_out_mux_map_enum,
+				  MT6359_AFE_TOP_CON0,
+				  UL_SINE_ON_SFT,
+				  UL_SINE_ON_MASK,
+				  dac_in_mux_map,
+				  dac_in_mux_map_value);
+
+static const struct snd_kcontrol_new aif_out_mux_control =
+	SOC_DAPM_ENUM("AIF Out Select", aif_out_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(aif2_out_mux_map_enum,
+				  MT6359_AFE_TOP_CON0,
+				  ADDA6_UL_SINE_ON_SFT,
+				  ADDA6_UL_SINE_ON_MASK,
+				  dac_in_mux_map,
+				  dac_in_mux_map_value);
+
+static const struct snd_kcontrol_new aif2_out_mux_control =
+	SOC_DAPM_ENUM("AIF Out Select", aif2_out_mux_map_enum);
+
+/* UL SRC MUX */
+enum {
+	UL_SRC_MUX_AMIC = 0,
+	UL_SRC_MUX_DMIC,
+};
+
+static const char * const ul_src_mux_map[] = {
+	"AMIC",
+	"DMIC",
+};
+
+static int ul_src_mux_map_value[] = {
+	UL_SRC_MUX_AMIC,
+	UL_SRC_MUX_DMIC,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(ul_src_mux_map_enum,
+				  MT6359_AFE_UL_SRC_CON0_L,
+				  UL_SDM_3_LEVEL_CTL_SFT,
+				  UL_SDM_3_LEVEL_CTL_MASK,
+				  ul_src_mux_map,
+				  ul_src_mux_map_value);
+
+static const struct snd_kcontrol_new ul_src_mux_control =
+	SOC_DAPM_ENUM("UL_SRC_MUX Select", ul_src_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(ul2_src_mux_map_enum,
+				  MT6359_AFE_ADDA6_UL_SRC_CON0_L,
+				  ADDA6_UL_SDM_3_LEVEL_CTL_SFT,
+				  ADDA6_UL_SDM_3_LEVEL_CTL_MASK,
+				  ul_src_mux_map,
+				  ul_src_mux_map_value);
+
+static const struct snd_kcontrol_new ul2_src_mux_control =
+	SOC_DAPM_ENUM("UL_SRC_MUX Select", ul2_src_mux_map_enum);
+
+/* VOW UL SRC MUX */
+static SOC_VALUE_ENUM_SINGLE_DECL(vow_ul_src_mux_map_enum,
+				  MT6359_AFE_VOW_TOP_CON0,
+				  VOW_SDM_3_LEVEL_SFT,
+				  VOW_SDM_3_LEVEL_MASK,
+				  ul_src_mux_map,
+				  ul_src_mux_map_value);
+
+static const struct snd_kcontrol_new vow_ul_src_mux_control =
+	SOC_DAPM_ENUM("VOW_UL_SRC_MUX Select", vow_ul_src_mux_map_enum);
+
+/* MISO MUX */
+enum {
+	MISO_MUX_UL1_CH1 = 0,
+	MISO_MUX_UL1_CH2,
+	MISO_MUX_UL2_CH1,
+	MISO_MUX_UL2_CH2,
+};
+
+static const char * const miso_mux_map[] = {
+	"UL1_CH1",
+	"UL1_CH2",
+	"UL2_CH1",
+	"UL2_CH2",
+};
+
+static int miso_mux_map_value[] = {
+	MISO_MUX_UL1_CH1,
+	MISO_MUX_UL1_CH2,
+	MISO_MUX_UL2_CH1,
+	MISO_MUX_UL2_CH2,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(miso0_mux_map_enum,
+				  MT6359_AFE_MTKAIF_MUX_CFG,
+				  RG_ADDA_CH1_SEL_SFT,
+				  RG_ADDA_CH1_SEL_MASK,
+				  miso_mux_map,
+				  miso_mux_map_value);
+
+static const struct snd_kcontrol_new miso0_mux_control =
+	SOC_DAPM_ENUM("MISO_MUX Select", miso0_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(miso1_mux_map_enum,
+				  MT6359_AFE_MTKAIF_MUX_CFG,
+				  RG_ADDA_CH2_SEL_SFT,
+				  RG_ADDA_CH2_SEL_MASK,
+				  miso_mux_map,
+				  miso_mux_map_value);
+
+static const struct snd_kcontrol_new miso1_mux_control =
+	SOC_DAPM_ENUM("MISO_MUX Select", miso1_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(miso2_mux_map_enum,
+				  MT6359_AFE_MTKAIF_MUX_CFG,
+				  RG_ADDA6_CH1_SEL_SFT,
+				  RG_ADDA6_CH1_SEL_MASK,
+				  miso_mux_map,
+				  miso_mux_map_value);
+
+static const struct snd_kcontrol_new miso2_mux_control =
+	SOC_DAPM_ENUM("MISO_MUX Select", miso2_mux_map_enum);
+
+/* VOW AMIC MUX */
+enum {
+	VOW_AMIC_MUX_ADC_L = 0,
+	VOW_AMIC_MUX_ADC_R,
+	VOW_AMIC_MUX_ADC_T,
+};
+
+static const char * const vow_amic_mux_map[] = {
+	"ADC_L",
+	"ADC_R",
+	"ADC_T",
+};
+
+static int vow_amic_mux_map_value[] = {
+	VOW_AMIC_MUX_ADC_L,
+	VOW_AMIC_MUX_ADC_R,
+	VOW_AMIC_MUX_ADC_T,
+};
+
+/* VOW AMIC MUX */
+static SOC_VALUE_ENUM_SINGLE_DECL(vow_amic0_mux_map_enum,
+				  MT6359_AFE_VOW_TOP_CON4,
+				  RG_VOW_AMIC_ADC1_SOURCE_SEL_SFT,
+				  RG_VOW_AMIC_ADC1_SOURCE_SEL_MASK,
+				  vow_amic_mux_map,
+				  vow_amic_mux_map_value);
+
+static const struct snd_kcontrol_new vow_amic0_mux_control =
+	SOC_DAPM_ENUM("VOW_AMIC_MUX Select", vow_amic0_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(vow_amic1_mux_map_enum,
+				  MT6359_AFE_VOW_TOP_CON4,
+				  RG_VOW_AMIC_ADC2_SOURCE_SEL_SFT,
+				  RG_VOW_AMIC_ADC2_SOURCE_SEL_MASK,
+				  vow_amic_mux_map,
+				  vow_amic_mux_map_value);
+
+static const struct snd_kcontrol_new vow_amic1_mux_control =
+	SOC_DAPM_ENUM("VOW_AMIC_MUX Select", vow_amic1_mux_map_enum);
+
+/* DMIC MUX */
+enum {
+	DMIC_MUX_DMIC_DATA0 = 0,
+	DMIC_MUX_DMIC_DATA1_L,
+	DMIC_MUX_DMIC_DATA1_L_1,
+	DMIC_MUX_DMIC_DATA1_R,
+};
+
+static const char * const dmic_mux_map[] = {
+	"DMIC_DATA0",
+	"DMIC_DATA1_L",
+	"DMIC_DATA1_L_1",
+	"DMIC_DATA1_R",
+};
+
+static int dmic_mux_map_value[] = {
+	DMIC_MUX_DMIC_DATA0,
+	DMIC_MUX_DMIC_DATA1_L,
+	DMIC_MUX_DMIC_DATA1_L_1,
+	DMIC_MUX_DMIC_DATA1_R,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dmic0_mux_map_enum,
+				  MT6359_AFE_MIC_ARRAY_CFG,
+				  RG_DMIC_ADC1_SOURCE_SEL_SFT,
+				  RG_DMIC_ADC1_SOURCE_SEL_MASK,
+				  dmic_mux_map,
+				  dmic_mux_map_value);
+
+static const struct snd_kcontrol_new dmic0_mux_control =
+	SOC_DAPM_ENUM("DMIC_MUX Select", dmic0_mux_map_enum);
+
+/* ul1 ch2 use RG_DMIC_ADC3_SOURCE_SEL */
+static SOC_VALUE_ENUM_SINGLE_DECL(dmic1_mux_map_enum,
+				  MT6359_AFE_MIC_ARRAY_CFG,
+				  RG_DMIC_ADC3_SOURCE_SEL_SFT,
+				  RG_DMIC_ADC3_SOURCE_SEL_MASK,
+				  dmic_mux_map,
+				  dmic_mux_map_value);
+
+static const struct snd_kcontrol_new dmic1_mux_control =
+	SOC_DAPM_ENUM("DMIC_MUX Select", dmic1_mux_map_enum);
+
+/* ul2 ch1 use RG_DMIC_ADC2_SOURCE_SEL */
+static SOC_VALUE_ENUM_SINGLE_DECL(dmic2_mux_map_enum,
+				  MT6359_AFE_MIC_ARRAY_CFG,
+				  RG_DMIC_ADC2_SOURCE_SEL_SFT,
+				  RG_DMIC_ADC2_SOURCE_SEL_MASK,
+				  dmic_mux_map,
+				  dmic_mux_map_value);
+
+static const struct snd_kcontrol_new dmic2_mux_control =
+	SOC_DAPM_ENUM("DMIC_MUX Select", dmic2_mux_map_enum);
+
+/* ADC L MUX */
+enum {
+	ADC_MUX_IDLE = 0,
+	ADC_MUX_AIN0,
+	ADC_MUX_PREAMPLIFIER,
+	ADC_MUX_IDLE1,
+};
+
+static const char * const adc_left_mux_map[] = {
+	"Idle", "AIN0", "Left Preamplifier", "Idle_1"
+};
+
+static int adc_mux_map_value[] = {
+	ADC_MUX_IDLE,
+	ADC_MUX_AIN0,
+	ADC_MUX_PREAMPLIFIER,
+	ADC_MUX_IDLE1,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(adc_left_mux_map_enum,
+				  MT6359_AUDENC_ANA_CON0,
+				  RG_AUDADCLINPUTSEL_SFT,
+				  RG_AUDADCLINPUTSEL_MASK,
+				  adc_left_mux_map,
+				  adc_mux_map_value);
+
+static const struct snd_kcontrol_new adc_left_mux_control =
+	SOC_DAPM_ENUM("ADC L Select", adc_left_mux_map_enum);
+
+/* ADC R MUX */
+static const char * const adc_right_mux_map[] = {
+	"Idle", "AIN0", "Right Preamplifier", "Idle_1"
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(adc_right_mux_map_enum,
+				  MT6359_AUDENC_ANA_CON1,
+				  RG_AUDADCRINPUTSEL_SFT,
+				  RG_AUDADCRINPUTSEL_MASK,
+				  adc_right_mux_map,
+				  adc_mux_map_value);
+
+static const struct snd_kcontrol_new adc_right_mux_control =
+	SOC_DAPM_ENUM("ADC R Select", adc_right_mux_map_enum);
+
+/* ADC 3 MUX */
+static const char * const adc_3_mux_map[] = {
+	"Idle", "AIN0", "Preamplifier", "Idle_1"
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(adc_3_mux_map_enum,
+				  MT6359_AUDENC_ANA_CON2,
+				  RG_AUDADC3INPUTSEL_SFT,
+				  RG_AUDADC3INPUTSEL_MASK,
+				  adc_3_mux_map,
+				  adc_mux_map_value);
+
+static const struct snd_kcontrol_new adc_3_mux_control =
+	SOC_DAPM_ENUM("ADC 3 Select", adc_3_mux_map_enum);
+
+/* PGA L MUX */
+enum {
+	PGA_L_MUX_NONE = 0,
+	PGA_L_MUX_AIN0,
+	PGA_L_MUX_AIN1,
+};
+
+static const char * const pga_l_mux_map[] = {
+	"None", "AIN0", "AIN1"
+};
+
+static int pga_l_mux_map_value[] = {
+	PGA_L_MUX_NONE,
+	PGA_L_MUX_AIN0,
+	PGA_L_MUX_AIN1
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(pga_left_mux_map_enum,
+				  MT6359_AUDENC_ANA_CON0,
+				  RG_AUDPREAMPLINPUTSEL_SFT,
+				  RG_AUDPREAMPLINPUTSEL_MASK,
+				  pga_l_mux_map,
+				  pga_l_mux_map_value);
+
+static const struct snd_kcontrol_new pga_left_mux_control =
+	SOC_DAPM_ENUM("PGA L Select", pga_left_mux_map_enum);
+
+/* PGA R MUX */
+enum {
+	PGA_R_MUX_NONE = 0,
+	PGA_R_MUX_AIN2,
+	PGA_R_MUX_AIN3,
+	PGA_R_MUX_AIN0,
+};
+
+static const char * const pga_r_mux_map[] = {
+	"None", "AIN2", "AIN3", "AIN0"
+};
+
+static int pga_r_mux_map_value[] = {
+	PGA_R_MUX_NONE,
+	PGA_R_MUX_AIN2,
+	PGA_R_MUX_AIN3,
+	PGA_R_MUX_AIN0
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(pga_right_mux_map_enum,
+				  MT6359_AUDENC_ANA_CON1,
+				  RG_AUDPREAMPRINPUTSEL_SFT,
+				  RG_AUDPREAMPRINPUTSEL_MASK,
+				  pga_r_mux_map,
+				  pga_r_mux_map_value);
+
+static const struct snd_kcontrol_new pga_right_mux_control =
+	SOC_DAPM_ENUM("PGA R Select", pga_right_mux_map_enum);
+
+/* PGA 3 MUX */
+enum {
+	PGA_3_MUX_NONE = 0,
+	PGA_3_MUX_AIN3,
+	PGA_3_MUX_AIN2,
+};
+
+static const char * const pga_3_mux_map[] = {
+	"None", "AIN3", "AIN2"
+};
+
+static int pga_3_mux_map_value[] = {
+	PGA_3_MUX_NONE,
+	PGA_3_MUX_AIN3,
+	PGA_3_MUX_AIN2
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(pga_3_mux_map_enum,
+				  MT6359_AUDENC_ANA_CON2,
+				  RG_AUDPREAMP3INPUTSEL_SFT,
+				  RG_AUDPREAMP3INPUTSEL_MASK,
+				  pga_3_mux_map,
+				  pga_3_mux_map_value);
+
+static const struct snd_kcontrol_new pga_3_mux_control =
+	SOC_DAPM_ENUM("PGA 3 Select", pga_3_mux_map_enum);
+
+static int mt_clksq_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* audio clk source from internal dcxo */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON23,
+				   RG_CLKSQ_IN_SEL_TEST_MASK_SFT,
+				   0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_sgen_event(struct snd_soc_dapm_widget *w,
+			 struct snd_kcontrol *kcontrol,
+			 int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* sdm audio fifo clock power on */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON2, 0x0006);
+		/* scrambler clock on enable */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON0, 0xCBA1);
+		/* sdm power on */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON2, 0x0003);
+		/* sdm fifo enable */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON2, 0x000B);
+
+		regmap_update_bits(priv->regmap, MT6359_AFE_SGEN_CFG0,
+				   0xff3f,
+				   0x0000);
+		regmap_update_bits(priv->regmap, MT6359_AFE_SGEN_CFG1,
+				   0xffff,
+				   0x0001);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* DL scrambler disabling sequence */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON2, 0x0000);
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON0, 0xcba0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_hp_enable(struct mt6359_priv *priv)
+{
+	if (priv->hp_hifi_mode) {
+		/* Set HP DR bias current optimization, 010: 6uA */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON11,
+				   DRBIAS_HP_MASK_SFT,
+				   DRBIAS_6UA << DRBIAS_HP_SFT);
+		/* Set HP & ZCD bias current optimization */
+		/* 01: ZCD: 4uA, HP/HS/LO: 5uA */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON12,
+				   IBIAS_ZCD_MASK_SFT,
+				   IBIAS_ZCD_4UA << IBIAS_ZCD_SFT);
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON12,
+				   IBIAS_HP_MASK_SFT,
+				   IBIAS_5UA << IBIAS_HP_SFT);
+	} else {
+		/* Set HP DR bias current optimization, 001: 5uA */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON11,
+				   DRBIAS_HP_MASK_SFT,
+				   DRBIAS_5UA << DRBIAS_HP_SFT);
+		/* Set HP & ZCD bias current optimization */
+		/* 00: ZCD: 3uA, HP/HS/LO: 4uA */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON12,
+				   IBIAS_ZCD_MASK_SFT,
+				   IBIAS_ZCD_3UA << IBIAS_ZCD_SFT);
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON12,
+				   IBIAS_HP_MASK_SFT,
+				   IBIAS_4UA << IBIAS_HP_SFT);
+	}
+
+	/* HP damp circuit enable */
+	/*Enable HPRN/HPLN output 4K to VCM */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON10, 0x0087);
+
+	/* HP Feedback Cap select 2'b00: 15pF */
+	/* for >= 96KHz sampling rate: 2'b01: 10.5pF */
+	if (priv->dl_rate[MT6359_AIF_1] >= 96000)
+		regmap_update_bits(priv->regmap,
+				   MT6359_AUDDEC_ANA_CON4,
+				   RG_AUDHPHFCOMPBUFGAINSEL_VAUDP32_MASK_SFT,
+				   0x1 << RG_AUDHPHFCOMPBUFGAINSEL_VAUDP32_SFT);
+	else
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON4, 0x0000);
+
+	/* Set HPP/N STB enhance circuits */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON2, 0xf133);
+
+	/* Enable HP aux output stage */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x000c);
+	/* Enable HP aux feedback loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x003c);
+	/* Enable HP aux CMFB loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0c00);
+	/* Enable HP driver bias circuits */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x30c0);
+	/* Enable HP driver core circuits */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x30f0);
+	/* Short HP main output to HP aux output stage */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x00fc);
+
+	/* Increase HP input pair current to HPM step by step */
+	hp_in_pair_current(priv, true);
+
+	/* Enable HP main CMFB loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0e00);
+	/* Disable HP aux CMFB loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0200);
+
+	/* Enable HP main output stage */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x00ff);
+	/* Enable HPR/L main output stage step by step */
+	hp_main_output_ramp(priv, true);
+
+	/* Reduce HP aux feedback loop gain */
+	hp_aux_feedback_loop_gain_ramp(priv, true);
+	/* Disable HP aux feedback loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x77cf);
+
+	/* apply volume setting */
+	headset_volume_ramp(priv,
+			    DL_GAIN_N_22DB,
+			    priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL]);
+
+	/* Disable HP aux output stage */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x77c3);
+	/* Unshort HP main output to HP aux output stage */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x7703);
+	usleep_range(100, 120);
+
+	/* Enable AUD_CLK */
+	mt6359_set_decoder_clk(priv, true);
+
+	/* Enable Audio DAC  */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x30ff);
+	if (priv->hp_hifi_mode) {
+		/* Enable low-noise mode of DAC */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0xf201);
+	} else {
+		/* Disable low-noise mode of DAC */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0xf200);
+	}
+	usleep_range(100, 120);
+
+	/* Switch HPL MUX to audio DAC */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x32ff);
+	/* Switch HPR MUX to audio DAC */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x3aff);
+
+	/* Disable Pull-down HPL/R to AVSS28_AUD */
+	hp_pull_down(priv, false);
+
+	return 0;
+}
+
+static int mtk_hp_disable(struct mt6359_priv *priv)
+{
+	/* Pull-down HPL/R to AVSS28_AUD */
+	hp_pull_down(priv, true);
+
+	/* HPR/HPL mux to open */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+			   0x0f00, 0x0000);
+
+	/* Disable low-noise mode of DAC */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON9,
+			   0x0001, 0x0000);
+
+	/* Disable Audio DAC */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+			   0x000f, 0x0000);
+
+	/* Disable AUD_CLK */
+	mt6359_set_decoder_clk(priv, false);
+
+	/* Short HP main output to HP aux output stage */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x77c3);
+	/* Enable HP aux output stage */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x77cf);
+
+	/* decrease HPL/R gain to normal gain step by step */
+	headset_volume_ramp(priv,
+			    priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL],
+			    DL_GAIN_N_22DB);
+
+	/* Enable HP aux feedback loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x77ff);
+
+	/* Reduce HP aux feedback loop gain */
+	hp_aux_feedback_loop_gain_ramp(priv, false);
+
+	/* decrease HPR/L main output stage step by step */
+	hp_main_output_ramp(priv, false);
+
+	/* Disable HP main output stage */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON1, 0x3, 0x0);
+
+	/* Enable HP aux CMFB loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0e01);
+
+	/* Disable HP main CMFB loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0c01);
+
+	/* Decrease HP input pair current to 2'b00 step by step */
+	hp_in_pair_current(priv, false);
+
+	/* Unshort HP main output to HP aux output stage */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON1,
+			   0x3 << 6, 0x0);
+
+	/* Disable HP driver core circuits */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+			   0x3 << 4, 0x0);
+
+	/* Disable HP driver bias circuits */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+			   0x3 << 6, 0x0);
+
+	/* Disable HP aux CMFB loop */
+	regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x201);
+
+	/* Disable HP aux feedback loop */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON1,
+			   0x3 << 4, 0x0);
+
+	/* Disable HP aux output stage */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON1,
+			   0x3 << 2, 0x0);
+	return 0;
+}
+
+static int mt_hp_event(struct snd_soc_dapm_widget *w,
+		       struct snd_kcontrol *kcontrol,
+		       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	int device = DEVICE_HP;
+
+	dev_info(priv->dev, "%s(), event 0x%x, dev_counter[DEV_HP] %d, mux %u\n",
+		 __func__,
+		 event,
+		 priv->dev_counter[device],
+		 mux);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		priv->dev_counter[device]++;
+		if (priv->dev_counter[device] > 1)
+			break;	/* already enabled, do nothing */
+		else if (priv->dev_counter[device] <= 0)
+			dev_warn(priv->dev, "%s(), dev_counter[DEV_HP] %d <= 0\n",
+				 __func__,
+				 priv->dev_counter[device]);
+
+		priv->mux_select[MUX_HP_L] = mux;
+
+		if (mux == HP_MUX_HP)
+			mtk_hp_enable(priv);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		priv->dev_counter[device]--;
+		if (priv->dev_counter[device] > 0)
+			break;	/* still being used, don't close */
+		else if (priv->dev_counter[device] < 0) {
+			dev_warn(priv->dev, "%s(), dev_counter[DEV_HP] %d < 0\n",
+				 __func__,
+				 priv->dev_counter[device]);
+			priv->dev_counter[device] = 0;
+			break;
+		}
+
+		if (priv->mux_select[MUX_HP_L] == HP_MUX_HP)
+			mtk_hp_disable(priv);
+
+		priv->mux_select[MUX_HP_L] = mux;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_rcv_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol,
+			int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event 0x%x, mux %u\n",
+		 __func__,
+		 event,
+		 dapm_kcontrol_get_value(w->kcontrols[0]));
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Disable handset short-circuit protection */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON6, 0x0010);
+
+		/* Set RCV DR bias current optimization, 010: 6uA */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON11,
+				   DRBIAS_HS_MASK_SFT,
+				   DRBIAS_6UA << DRBIAS_HS_SFT);
+		/* Set RCV & ZCD bias current optimization */
+		/* 01: ZCD: 4uA, HP/HS/LO: 5uA */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON12,
+				   IBIAS_ZCD_MASK_SFT,
+				   IBIAS_ZCD_4UA << IBIAS_ZCD_SFT);
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON12,
+				   IBIAS_HS_MASK_SFT,
+				   IBIAS_5UA << IBIAS_HS_SFT);
+
+		/* Set HS STB enhance circuits */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON6, 0x0090);
+
+		/* Set HS output stage (3'b111 = 8x) */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON10, 0x7000);
+
+		/* Enable HS driver bias circuits */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON6, 0x0092);
+		/* Enable HS driver core circuits */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON6, 0x0093);
+
+		/* Set HS gain to normal gain step by step */
+		regmap_write(priv->regmap, MT6359_ZCD_CON3,
+			     priv->ana_gain[AUDIO_ANALOG_VOLUME_HSOUTL]);
+
+		/* Enable AUD_CLK */
+		mt6359_set_decoder_clk(priv, true);
+
+		/* Enable Audio DAC  */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x0009);
+		/* Enable low-noise mode of DAC */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0001);
+		/* Switch HS MUX to audio DAC */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON6, 0x009b);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* HS mux to open */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON6,
+				   RG_AUDHSMUXINPUTSEL_VAUDP32_MASK_SFT,
+				   RCV_MUX_OPEN);
+
+		/* Disable Audio DAC */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+				   0x000f, 0x0000);
+
+		/* Disable AUD_CLK */
+		mt6359_set_decoder_clk(priv, false);
+
+		/* decrease HS gain to minimum gain step by step */
+		regmap_write(priv->regmap, MT6359_ZCD_CON3, DL_GAIN_N_40DB);
+
+		/* Disable HS driver core circuits */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON6,
+				   RG_AUDHSPWRUP_VAUDP32_MASK_SFT, 0x0);
+
+		/* Disable HS driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON6,
+				   RG_AUDHSPWRUP_IBIAS_VAUDP32_MASK_SFT, 0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_lo_event(struct snd_soc_dapm_widget *w,
+		       struct snd_kcontrol *kcontrol,
+		       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event 0x%x, mux %u\n",
+		 __func__,
+		 event,
+		 dapm_kcontrol_get_value(w->kcontrols[0]));
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Disable handset short-circuit protection */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x0010);
+
+		/* Set LO DR bias current optimization, 010: 6uA */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON11,
+				   DRBIAS_LO_MASK_SFT,
+				   DRBIAS_6UA << DRBIAS_LO_SFT);
+		/* Set LO & ZCD bias current optimization */
+		/* 01: ZCD: 4uA, HP/HS/LO: 5uA */
+		if (priv->dev_counter[DEVICE_HP] == 0)
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDDEC_ANA_CON12,
+					   IBIAS_ZCD_MASK_SFT,
+					   IBIAS_ZCD_4UA << IBIAS_ZCD_SFT);
+
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON12,
+				   IBIAS_LO_MASK_SFT,
+				   IBIAS_5UA << IBIAS_LO_SFT);
+
+		/* Set LO STB enhance circuits */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x0110);
+
+		/* Enable LO driver bias circuits */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x0112);
+		/* Enable LO driver core circuits */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x0113);
+
+		/* Set LO gain to normal gain step by step */
+		regmap_write(priv->regmap, MT6359_ZCD_CON1,
+			     priv->ana_gain[AUDIO_ANALOG_VOLUME_LINEOUTL]);
+
+		/* Enable AUD_CLK */
+		mt6359_set_decoder_clk(priv, true);
+
+		/* Enable Audio DAC (3rd DAC) */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x3113);
+		/* Enable low-noise mode of DAC */
+		if (priv->dev_counter[DEVICE_HP] == 0)
+			regmap_write(priv->regmap,
+				     MT6359_AUDDEC_ANA_CON9, 0x0001);
+		/* Switch LOL MUX to audio 3rd DAC */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x311b);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Switch LOL MUX to open */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON7,
+				   RG_AUDLOLMUXINPUTSEL_VAUDP32_MASK_SFT,
+				   LO_MUX_OPEN);
+
+		/* Disable Audio DAC */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+				   0x000f, 0x0000);
+
+		/* Disable AUD_CLK */
+		mt6359_set_decoder_clk(priv, false);
+
+		/* decrease LO gain to minimum gain step by step */
+		regmap_write(priv->regmap, MT6359_ZCD_CON1, DL_GAIN_N_40DB);
+
+		/* Disable LO driver core circuits */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON7,
+				   RG_AUDLOLPWRUP_VAUDP32_MASK_SFT, 0x0);
+
+		/* Disable LO driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON7,
+				   RG_AUDLOLPWRUP_IBIAS_VAUDP32_MASK_SFT, 0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_adc_clk_gen_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol,
+				int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event 0x%x, vow_enable %d\n",
+		 __func__, event, priv->vow_enable);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		if (priv->vow_enable) {
+			/* ADC CLK from CLKGEN (3.25MHz) */
+			dev_info(priv->dev, "%s(), vow mode\n", __func__);
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKRSTB_MASK_SFT, 0x0);
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKSOURCE_MASK_SFT,
+					   0x1 << RG_AUDADCCLKSOURCE_SFT);
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKSEL_MASK_SFT,
+					   0x1 << RG_AUDADCCLKSEL_SFT);
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKGENMODE_MASK_SFT, 0x0);
+		} else {
+			/* ADC CLK from CLKGEN (6.5MHz) */
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKRSTB_MASK_SFT,
+					   0x1 << RG_AUDADCCLKRSTB_SFT);
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKSOURCE_MASK_SFT, 0x0);
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKSEL_MASK_SFT, 0x0);
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+					   RG_AUDADCCLKGENMODE_MASK_SFT,
+					   0x1 << RG_AUDADCCLKGENMODE_SFT);
+		}
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+				   RG_AUDADCCLKSOURCE_MASK_SFT, 0x0);
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+				   RG_AUDADCCLKSEL_MASK_SFT, 0x0);
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+				   RG_AUDADCCLKGENMODE_MASK_SFT, 0x0);
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON5,
+				   RG_AUDADCCLKRSTB_MASK_SFT, 0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_dcc_clk_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* DCC 50k CLK (from 26M) */
+		/* MT6359_AFE_DCCLK_CFG0, bit 3 for dm ck swap */
+		regmap_update_bits(priv->regmap, MT6359_AFE_DCCLK_CFG0,
+				   0xfff7, 0x2062);
+		regmap_update_bits(priv->regmap, MT6359_AFE_DCCLK_CFG0,
+				   0xfff7, 0x2060);
+		if (priv->vow_enable)
+			regmap_update_bits(priv->regmap, MT6359_AFE_DCCLK_CFG0,
+					   0xfff7, 0x2065);
+		else
+			regmap_update_bits(priv->regmap, MT6359_AFE_DCCLK_CFG0,
+					   0xfff7, 0x2061);
+
+		regmap_write(priv->regmap, MT6359_AFE_DCCLK_CFG1, 0x0100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_update_bits(priv->regmap, MT6359_AFE_DCCLK_CFG0,
+				   0xfff7, 0x2060);
+		regmap_update_bits(priv->regmap, MT6359_AFE_DCCLK_CFG0,
+				   0xfff7, 0x2062);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_mic_bias_0_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol,
+			       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mic_type = priv->mux_select[MUX_MIC_TYPE_0];
+
+	dev_info(priv->dev, "%s(), event 0x%x, mic_type %d\n",
+		 __func__, event, mic_type);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch (mic_type) {
+		case MIC_TYPE_MUX_DCC_ECM_DIFF:
+		case MIC_TYPE_MUX_VOW_DCC_ECM_DIFF:
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDENC_ANA_CON15,
+					   0xff00, 0x7700);
+			break;
+		case MIC_TYPE_MUX_DCC_ECM_SINGLE:
+		case MIC_TYPE_MUX_VOW_DCC_ECM_SINGLE:
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDENC_ANA_CON15,
+					   0xff00, 0x1100);
+			break;
+		default:
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDENC_ANA_CON15,
+					   0xff00, 0x0000);
+			break;
+		}
+
+		/* MISBIAS0 = 1P9V */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON15,
+				   RG_AUDMICBIAS0VREF_MASK_SFT,
+				   MIC_BIAS_1P9 << RG_AUDMICBIAS0VREF_SFT);
+		/* vow low power select */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON15,
+				   RG_AUDMICBIAS0LOWPEN_MASK_SFT,
+				   (IS_VOW_AMIC_BASE(mic_type) ? 1 : 0) <<
+				   RG_AUDMICBIAS0LOWPEN_SFT);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable MICBIAS0, MISBIAS0 = 1P7V */
+		regmap_write(priv->regmap, MT6359_AUDENC_ANA_CON15, 0x0000);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_mic_bias_1_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol,
+			       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mic_type = priv->mux_select[MUX_MIC_TYPE_1];
+
+	dev_info(priv->dev, "%s(), event 0x%x, mic_type %d\n",
+		 __func__, event, mic_type);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* MISBIAS1 = 2P6V */
+		if (mic_type == MIC_TYPE_MUX_DCC_ECM_SINGLE)
+			regmap_write(priv->regmap,
+				     MT6359_AUDENC_ANA_CON16, 0x0160);
+		else
+			regmap_write(priv->regmap,
+				     MT6359_AUDENC_ANA_CON16, 0x0060);
+
+		/* vow low power select */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON16,
+				   RG_AUDMICBIAS1LOWPEN_MASK_SFT,
+				   (IS_VOW_AMIC_BASE(mic_type) ? 1 : 0) <<
+				   RG_AUDMICBIAS1LOWPEN_SFT);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_mic_bias_2_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol,
+			       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mic_type = priv->mux_select[MUX_MIC_TYPE_2];
+
+	dev_info(priv->dev, "%s(), event 0x%x, mic_type %d\n",
+		 __func__, event, mic_type);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch (mic_type) {
+		case MIC_TYPE_MUX_DCC_ECM_DIFF:
+		case MIC_TYPE_MUX_VOW_DCC_ECM_DIFF:
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDENC_ANA_CON17,
+					   0xff00, 0x7700);
+			break;
+		case MIC_TYPE_MUX_DCC_ECM_SINGLE:
+		case MIC_TYPE_MUX_VOW_DCC_ECM_SINGLE:
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDENC_ANA_CON17,
+					   0xff00, 0x1100);
+			break;
+		default:
+			regmap_update_bits(priv->regmap,
+					   MT6359_AUDENC_ANA_CON17,
+					   0xff00, 0x0000);
+			break;
+		}
+
+		/* MISBIAS2 = 1P9V */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON17,
+				   RG_AUDMICBIAS2VREF_MASK_SFT,
+				   MIC_BIAS_1P9 << RG_AUDMICBIAS2VREF_SFT);
+		/* vow low power select */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON17,
+				   RG_AUDMICBIAS2LOWPEN_MASK_SFT,
+				   (IS_VOW_BASE(mic_type) ? 1 : 0) <<
+				   RG_AUDMICBIAS2LOWPEN_SFT);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable MICBIAS2, MISBIAS0 = 1P7V */
+		regmap_write(priv->regmap, MT6359_AUDENC_ANA_CON17, 0x0000);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_vow_aud_lpw_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol,
+				int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Enable audio uplink LPW mode */
+		/* Enable Audio ADC 1st Stage LPW */
+		/* Enable Audio ADC 2nd & 3rd LPW */
+		/* Enable Audio ADC flash Audio ADC flash */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON3,
+				   0x0039, 0x0039);
+		if (priv->vow_channel == 2)
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON4,
+					   0x0039, 0x0039);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable audio uplink LPW mode */
+		/* Disable Audio ADC 1st Stage LPW */
+		/* Disable Audio ADC 2nd & 3rd LPW */
+		/* Disable Audio ADC flash Audio ADC flash */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON3,
+				   0x0039, 0x0000);
+		if (priv->vow_channel == 2)
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON4,
+					   0x0039, 0x0000);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static void vow_periodic_on_off_set(struct mt6359_priv *priv)
+{
+	regmap_update_bits(priv->regmap,
+			   MT6359_AUD_TOP_CKPDN_CON0,
+			   RG_VOW32K_CK_PDN_MASK_SFT,
+			   0x0);
+	/* Pre On */
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG2,
+		     priv->vow_periodic_param.pga_on);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG3,
+		     priv->vow_periodic_param.precg_on);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG4,
+		     priv->vow_periodic_param.adc_on);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG7,
+		     priv->vow_periodic_param.micbias0_on);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG8,
+		     priv->vow_periodic_param.micbias1_on);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG9,
+		     priv->vow_periodic_param.dcxo_on);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG10,
+		     priv->vow_periodic_param.audglb_on);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG11,
+		     priv->vow_periodic_param.vow_on);
+	/* Delay Off */
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG13,
+		     priv->vow_periodic_param.pga_off);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG14,
+		     priv->vow_periodic_param.precg_off);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG15,
+		     priv->vow_periodic_param.adc_off);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG18,
+		     priv->vow_periodic_param.micbias0_off);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG19,
+		     priv->vow_periodic_param.micbias1_off);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG20,
+		     priv->vow_periodic_param.dcxo_off);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG21,
+		     priv->vow_periodic_param.audglb_off);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG22,
+		     priv->vow_periodic_param.vow_off);
+
+	if (priv->vow_channel == 2) {
+		/* Pre On */
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG24,
+			     priv->vow_periodic_param.pga_on);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG25,
+			     priv->vow_periodic_param.precg_on);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG26,
+			     priv->vow_periodic_param.adc_on);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG29,
+			     priv->vow_periodic_param.micbias1_on);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG30,
+			     priv->vow_periodic_param.vow_on);
+		/* Delay Off */
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG32,
+			     priv->vow_periodic_param.pga_off);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG33,
+			     priv->vow_periodic_param.precg_off);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG34,
+			     priv->vow_periodic_param.adc_off);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG37,
+			     priv->vow_periodic_param.micbias1_off);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG38,
+			     priv->vow_periodic_param.vow_off);
+	}
+	/* vow periodic enable */
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG0, 0x999A);
+}
+
+static void vow_periodic_on_off_reset(struct mt6359_priv *priv)
+{
+	regmap_update_bits(priv->regmap,
+			   MT6359_AUD_TOP_CKPDN_CON0,
+			   RG_VOW32K_CK_PDN_MASK_SFT,
+			   0x1 << RG_VOW32K_CK_PDN_SFT);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG0, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG1, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG2, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG3, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG4, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG5, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG6, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG7, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG8, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG9, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG10, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG11, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG12, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG13, 0x8000);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG14, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG15, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG16, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG17, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG18, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG19, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG20, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG21, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG22, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG23, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG24, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG25, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG26, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG27, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG28, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG29, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG30, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG31, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG32, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG33, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG34, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG35, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG36, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG37, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG38, 0x0);
+	regmap_write(priv->regmap, MT6359_AFE_VOW_PERIODIC_CFG39, 0x0);
+}
+
+static int mt_vow_periodic_cfg_event(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol,
+				     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Periodic On/Off */
+		if (priv->reg_afe_vow_periodic == 0)
+			vow_periodic_on_off_reset(priv);
+		else
+			vow_periodic_on_off_set(priv);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		vow_periodic_on_off_reset(priv);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+/* VOW MTKIF TX setting */
+enum {
+	VOW_MTKIF_TX_SET_MONO = 1,
+	VOW_MTKIF_TX_SET_STEREO = 0,
+};
+
+#define VOW_MCLK 13000
+#define VOW_MTKIF_TX_MONO_CLK 650
+#define VOW_MTKIF_TX_STEREO_CLK 1083
+
+static int mt_vow_digital_cfg_event(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol,
+				    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mic_type0 = priv->mux_select[MUX_MIC_TYPE_0];
+	unsigned int mic_type2 = priv->mux_select[MUX_MIC_TYPE_2];
+	unsigned int vow_ch = 0;
+	unsigned int vow_mtkif_tx_div = 0;
+	unsigned int vow_top_con3 = 0x0000;
+	unsigned int is_dmic = 0;
+
+	dev_info(priv->dev, "%s(), event 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* AMIC/DMIC VOW Config Setting */
+		if (mic_type0 == MIC_TYPE_MUX_VOW_DMIC_LP ||
+		    mic_type2 == MIC_TYPE_MUX_VOW_DMIC_LP) {
+			/* LP DMIC settings : 812.5k */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON0,
+					   0x7C00, 0x3800);
+			is_dmic = 1;
+		} else if ((mic_type0 == MIC_TYPE_MUX_VOW_DMIC) ||
+			   (mic_type2 == MIC_TYPE_MUX_VOW_DMIC)) {
+			/* DMIC settings : 1600k */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON0,
+					   0x7C00, 0x1000);
+			is_dmic = 1;
+		} else {
+			/* AMIC settings */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON0,
+					   0x7C00, 0x0000);
+			is_dmic = 0;
+		}
+
+		/* Enable vow cfg setting */
+		/* VOW CH1 Config */
+		regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG0,
+			     priv->reg_afe_vow_vad_cfg0);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG2,
+			     priv->reg_afe_vow_vad_cfg1);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG4,
+			     priv->reg_afe_vow_vad_cfg2);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG6,
+			     priv->reg_afe_vow_vad_cfg3);
+		regmap_update_bits(priv->regmap, MT6359_AFE_VOW_VAD_CFG12,
+				   K_GAMMA_CH1_MASK_SFT,
+				   priv->reg_afe_vow_vad_cfg4 <<
+				   K_GAMMA_CH1_SFT);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG8,
+			     priv->reg_afe_vow_vad_cfg5);
+		if (is_dmic) {
+			/* VOW CH1 */
+			/* VOW ADC clk gate power off */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON1,
+					   VOW_ADC_CK_PDN_CH1_MASK_SFT,
+					   0x1 << VOW_ADC_CK_PDN_CH1_SFT);
+			/* VOW clk gate power on */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON1,
+					   VOW_CK_PDN_CH1_MASK_SFT,
+					   0x0);
+			/* DMIC power on */
+			/* DMIC select: dmic */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON1,
+					   0x3 << VOW_DIGMIC_ON_CH1_SFT,
+					   0x1 << VOW_DIGMIC_ON_CH1_SFT);
+		} else {
+			/* VOW CH1 */
+			/* VOW ADC clk gate power on */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON1,
+					   VOW_ADC_CK_PDN_CH1_MASK_SFT,
+					   0x0);
+			/* VOW clk gate power on */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON1,
+					   VOW_CK_PDN_CH1_MASK_SFT,
+					   0x0);
+			/* DMIC power off */
+			/* DMIC select: amic */
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_TOP_CON1,
+					   0x3 << VOW_DIGMIC_ON_CH1_SFT,
+					   0x2 << VOW_DIGMIC_ON_CH1_SFT);
+		}
+		/* MTKIF TX Setting */
+		vow_ch = VOW_MTKIF_TX_SET_MONO;  /* mono */
+		vow_mtkif_tx_div = VOW_MCLK / (VOW_MTKIF_TX_MONO_CLK * 2);
+
+		/* VOW CH2 Config */
+		if (priv->vow_channel == 2) {
+			regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG1,
+				     priv->reg_afe_vow_vad_cfg0);
+			regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG3,
+				     priv->reg_afe_vow_vad_cfg1);
+			regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG5,
+				     priv->reg_afe_vow_vad_cfg2);
+			regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG7,
+				     priv->reg_afe_vow_vad_cfg3);
+			regmap_update_bits(priv->regmap,
+					   MT6359_AFE_VOW_VAD_CFG12,
+					   K_GAMMA_CH2_MASK_SFT,
+					   priv->reg_afe_vow_vad_cfg4 <<
+					   K_GAMMA_CH2_SFT);
+			regmap_write(priv->regmap, MT6359_AFE_VOW_VAD_CFG9,
+				     priv->reg_afe_vow_vad_cfg5);
+			if (is_dmic) {
+				/* VOW CH2 */
+				/* VOW ADC clk gate power off */
+				regmap_update_bits(priv->regmap,
+						   MT6359_AFE_VOW_TOP_CON2,
+						   VOW_ADC_CK_PDN_CH2_MASK_SFT,
+						   0x1 <<
+						   VOW_ADC_CK_PDN_CH2_SFT);
+				/* VOW clk gate power on */
+				regmap_update_bits(priv->regmap,
+						   MT6359_AFE_VOW_TOP_CON2,
+						   VOW_CK_PDN_CH2_MASK_SFT,
+						   0x0);
+				/* DMIC power on */
+				/* DMIC select: dmic */
+				regmap_update_bits(priv->regmap,
+						   MT6359_AFE_VOW_TOP_CON2,
+						   0x3 << VOW_DIGMIC_ON_CH2_SFT,
+						   0x1 <<
+						   VOW_DIGMIC_ON_CH2_SFT);
+			} else {
+				/* VOW CH2 */
+				/* VOW ADC clk gate power on */
+				regmap_update_bits(priv->regmap,
+						   MT6359_AFE_VOW_TOP_CON2,
+						   VOW_ADC_CK_PDN_CH2_MASK_SFT,
+						   0x0);
+				/* VOW clk gate power on */
+				regmap_update_bits(priv->regmap,
+						   MT6359_AFE_VOW_TOP_CON2,
+						   VOW_CK_PDN_CH2_MASK_SFT,
+						   0x0);
+				/* DMIC power off */
+				/* DMIC select: amic */
+				regmap_update_bits(priv->regmap,
+						   MT6359_AFE_VOW_TOP_CON2,
+						   0x3 << VOW_DIGMIC_ON_CH2_SFT,
+						   0x2 <<
+						   VOW_DIGMIC_ON_CH2_SFT);
+			}
+			/* MTKIF TX Setting */
+			vow_ch = VOW_MTKIF_TX_SET_STEREO;  /* stereo */
+			/* MTKIF TX DIV */
+			vow_mtkif_tx_div = VOW_MCLK /
+					   (VOW_MTKIF_TX_STEREO_CLK * 2);
+		}
+		vow_top_con3 = 0x0000;
+		/* disable SNRDET Auto power down */
+		vow_top_con3 |= (1 << VOW_P2_SNRDET_AUTO_PDN_SFT);
+		vow_top_con3 |= (vow_ch << VOW_TXIF_MONO_SFT);
+		vow_top_con3 |= (vow_mtkif_tx_div << VOW_TXIF_SCK_DIV_SFT);
+		regmap_write(priv->regmap, MT6359_AFE_VOW_TOP_CON3,
+			     vow_top_con3);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* AMIC/DMIC VOW Config Setting */
+		/* AMIC settings */
+		regmap_update_bits(priv->regmap, MT6359_AFE_VOW_TOP_CON0,
+				   0x7C00, 0x0000);
+		/* VOW CH1 */
+		/* VOW ADC clk gate power off */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_VOW_TOP_CON1,
+				   VOW_ADC_CK_PDN_CH1_MASK_SFT,
+				   0x1 << VOW_ADC_CK_PDN_CH1_SFT);
+		/* VOW clk gate power off */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_VOW_TOP_CON1,
+				   VOW_CK_PDN_CH1_MASK_SFT,
+				   0x1 << VOW_CK_PDN_CH1_SFT);
+		/* DMIC power off */
+		/* DMIC select: amic */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_VOW_TOP_CON1,
+				   0x3 << VOW_DIGMIC_ON_CH1_SFT,
+				   0x2 << VOW_DIGMIC_ON_CH1_SFT);
+		/* VOW CH2 */
+		/* VOW ADC clk gate power off */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_VOW_TOP_CON2,
+				   VOW_ADC_CK_PDN_CH2_MASK_SFT,
+				   0x1 << VOW_ADC_CK_PDN_CH2_SFT);
+		/* VOW clk gate power off */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_VOW_TOP_CON2,
+				   VOW_CK_PDN_CH2_MASK_SFT,
+				   0x1 << VOW_CK_PDN_CH2_SFT);
+		/* DMIC power off */
+		/* DMIC select: amic */
+		regmap_update_bits(priv->regmap,
+				   MT6359_AFE_VOW_TOP_CON2,
+				   0x3 << VOW_DIGMIC_ON_CH2_SFT,
+				   0x2 << VOW_DIGMIC_ON_CH2_SFT);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int mt_vow_out_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_WILL_PMU:
+		priv->vow_enable = 1;
+		break;
+	case SND_SOC_DAPM_PRE_PMU:
+		vow_gpio_set(priv);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		vow_gpio_reset(priv);
+		priv->vow_enable = 0;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_mtkaif_tx_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt6359_mtkaif_tx_enable(priv);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		mt6359_mtkaif_tx_disable(priv);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_ul_src_dmic_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol,
+				int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* default two wire, 3.25M */
+		regmap_write(priv->regmap, MT6359_AFE_UL_SRC_CON0_H, 0x0080);
+		regmap_update_bits(priv->regmap, MT6359_AFE_UL_SRC_CON0_L,
+				   0xfffc, 0x0000);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_write(priv->regmap,
+			     MT6359_AFE_UL_SRC_CON0_H, 0x0000);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_ul_src_34_dmic_event(struct snd_soc_dapm_widget *w,
+				   struct snd_kcontrol *kcontrol,
+				   int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* default two wire, 3.25M */
+		regmap_write(priv->regmap,
+			     MT6359_AFE_ADDA6_L_SRC_CON0_H, 0x0080);
+		regmap_update_bits(priv->regmap, MT6359_AFE_ADDA6_UL_SRC_CON0_L,
+				   0xfffc, 0x0000);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_write(priv->regmap,
+			     MT6359_AFE_ADDA6_L_SRC_CON0_H, 0x0000);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_adc_l_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(100, 120);
+		/* Audio L preamplifier DCC precharge off */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON0,
+				   RG_AUDPREAMPLDCPRECHARGE_MASK_SFT,
+				   0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_adc_r_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(100, 120);
+		/* Audio R preamplifier DCC precharge off */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON1,
+				   RG_AUDPREAMPRDCPRECHARGE_MASK_SFT,
+				   0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_adc_3_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(100, 120);
+		/* Audio R preamplifier DCC precharge off */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON2,
+				   RG_AUDPREAMP3DCPRECHARGE_MASK_SFT,
+				   0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_pga_l_mux_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+
+	dev_info(priv->dev, "%s(), mux %d\n", __func__, mux);
+	priv->mux_select[MUX_PGA_L] = mux >> RG_AUDPREAMPLINPUTSEL_SFT;
+	return 0;
+}
+
+static int mt_pga_r_mux_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+
+	dev_info(priv->dev, "%s(), mux %d\n", __func__, mux);
+	priv->mux_select[MUX_PGA_R] = mux >> RG_AUDPREAMPRINPUTSEL_SFT;
+	return 0;
+}
+
+static int mt_pga_3_mux_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+
+	dev_info(priv->dev, "%s(), mux %d\n", __func__, mux);
+	priv->mux_select[MUX_PGA_3] = mux >> RG_AUDPREAMP3INPUTSEL_SFT;
+	return 0;
+}
+
+static int mt_pga_l_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	int mic_gain_l = priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1];
+	unsigned int mux_pga = priv->mux_select[MUX_PGA_L];
+	unsigned int mic_type;
+
+	switch (mux_pga) {
+	case PGA_L_MUX_AIN0:
+		mic_type = priv->mux_select[MUX_MIC_TYPE_0];
+		break;
+	case PGA_L_MUX_AIN1:
+		mic_type = priv->mux_select[MUX_MIC_TYPE_1];
+		break;
+	default:
+		dev_err(priv->dev, "%s(), invalid pga mux %d\n",
+			__func__, mux_pga);
+		return -EINVAL;
+	}
+	/* if is VOW, then force 24dB */
+	if (IS_VOW_BASE(mic_type))
+		mic_gain_l = 4;
+	dev_dbg(priv->dev, "%s(), event = 0x%x, mic_type %d, mic_gain_l %d, mux_pga %d\n",
+		__func__, event, mic_type, mic_gain_l, mux_pga);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (IS_DCC_BASE(mic_type)) {
+			/* Audio L preamplifier DCC precharge */
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON0,
+					   RG_AUDPREAMPLDCPRECHARGE_MASK_SFT,
+					   0x1 << RG_AUDPREAMPLDCPRECHARGE_SFT);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* set mic pga gain */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON0,
+				   RG_AUDPREAMPLGAIN_MASK_SFT,
+				   mic_gain_l << RG_AUDPREAMPLGAIN_SFT);
+
+		if (IS_DCC_BASE(mic_type)) {
+			/* L preamplifier DCCEN */
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON0,
+					   RG_AUDPREAMPLDCCEN_MASK_SFT,
+					   0x1 << RG_AUDPREAMPLDCCEN_SFT);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* L preamplifier DCCEN */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON0,
+				   RG_AUDPREAMPLDCCEN_MASK_SFT,
+				   0x0 << RG_AUDPREAMPLDCCEN_SFT);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_pga_r_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	int mic_gain_r = priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2];
+	unsigned int mux_pga = priv->mux_select[MUX_PGA_R];
+	unsigned int mic_type;
+
+	switch (mux_pga) {
+	case PGA_R_MUX_AIN0:
+		mic_type = priv->mux_select[MUX_MIC_TYPE_0];
+		break;
+	case PGA_R_MUX_AIN2:
+	case PGA_R_MUX_AIN3:
+		mic_type = priv->mux_select[MUX_MIC_TYPE_2];
+		break;
+	default:
+		dev_err(priv->dev, "%s(), invalid pga mux %d\n",
+			__func__, mux_pga);
+		return -EINVAL;
+	}
+	/* if is VOW, then force 24dB */
+	if (IS_VOW_BASE(mic_type))
+		mic_gain_r = 4;
+	dev_dbg(priv->dev, "%s(), event = 0x%x, mic_type %d, mic_gain_r %d, mux_pga %d\n",
+		__func__, event, mic_type, mic_gain_r, mux_pga);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (IS_DCC_BASE(mic_type)) {
+			/* Audio R preamplifier DCC precharge */
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON1,
+					   RG_AUDPREAMPRDCPRECHARGE_MASK_SFT,
+					   0x1 << RG_AUDPREAMPRDCPRECHARGE_SFT);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* set mic pga gain */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON1,
+				   RG_AUDPREAMPRGAIN_MASK_SFT,
+				   mic_gain_r << RG_AUDPREAMPRGAIN_SFT);
+
+		if (IS_DCC_BASE(mic_type)) {
+			/* R preamplifier DCCEN */
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON1,
+					   RG_AUDPREAMPRDCCEN_MASK_SFT,
+					   0x1 << RG_AUDPREAMPRDCCEN_SFT);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* R preamplifier DCCEN */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON1,
+				   RG_AUDPREAMPRDCCEN_MASK_SFT,
+				   0x0 << RG_AUDPREAMPRDCCEN_SFT);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_pga_3_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	int mic_gain_3 = priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP3];
+	unsigned int mux_pga = priv->mux_select[MUX_PGA_3];
+	unsigned int mic_type;
+
+	switch (mux_pga) {
+	case PGA_3_MUX_AIN2:
+	case PGA_3_MUX_AIN3:
+		mic_type = priv->mux_select[MUX_MIC_TYPE_2];
+		break;
+	default:
+		dev_err(priv->dev, "%s(), invalid pga mux %d\n",
+			__func__, mux_pga);
+		return -EINVAL;
+	}
+	/* if is VOW, then force 24dB */
+	if (IS_VOW_BASE(mic_type))
+		mic_gain_3 = 4;
+	dev_dbg(priv->dev, "%s(), event = 0x%x, mic_type %d, mic_gain_3 %d, mux_pga %d\n",
+		__func__, event, mic_type, mic_gain_3, mux_pga);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (IS_DCC_BASE(mic_type)) {
+			/* Audio 3 preamplifier DCC precharge */
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON2,
+					   RG_AUDPREAMP3DCPRECHARGE_MASK_SFT,
+					   0x1 << RG_AUDPREAMP3DCPRECHARGE_SFT);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* set mic pga gain */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON2,
+				   RG_AUDPREAMP3GAIN_MASK_SFT,
+				   mic_gain_3 << RG_AUDPREAMP3GAIN_SFT);
+
+		if (IS_DCC_BASE(mic_type)) {
+			/* 3 preamplifier DCCEN */
+			regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON2,
+					   RG_AUDPREAMP3DCCEN_MASK_SFT,
+					   0x1 << RG_AUDPREAMP3DCCEN_SFT);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* 3 preamplifier DCCEN */
+		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON2,
+				   RG_AUDPREAMP3DCCEN_MASK_SFT,
+				   0x0 << RG_AUDPREAMP3DCCEN_SFT);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_delay_250_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+	case SND_SOC_DAPM_PRE_PMD:
+		usleep_range(250, 270);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_delay_100_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+	case SND_SOC_DAPM_PRE_PMD:
+		usleep_range(100, 120);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_hp_pull_down_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol,
+				 int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		hp_pull_down(priv, true);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		hp_pull_down(priv, false);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_hp_mute_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Set HPR/HPL gain to -22dB */
+		regmap_write(priv->regmap, MT6359_ZCD_CON2, DL_GAIN_N_22DB_REG);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Set HPL/HPR gain to mute */
+		regmap_write(priv->regmap, MT6359_ZCD_CON2, DL_GAIN_N_40DB_REG);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_hp_damp_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable HP damping circuit & HPN 4K load */
+		/* reset CMFB PW level */
+		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON10, 0x0000);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_esd_resist_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol,
+			       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Reduce ESD resistance of AU_REFN */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON2,
+				   RG_AUDREFN_DERES_EN_VAUDP32_MASK_SFT,
+				   0x1 << RG_AUDREFN_DERES_EN_VAUDP32_SFT);
+		usleep_range(250, 270);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Increase ESD resistance of AU_REFN */
+		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON2,
+				   RG_AUDREFN_DERES_EN_VAUDP32_MASK_SFT, 0x0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_sdm_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol,
+			int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* sdm audio fifo clock power on */
+		regmap_update_bits(priv->regmap, MT6359_AFUNC_AUD_CON2,
+				   0xfffd, 0x0006);
+		/* scrambler clock on enable */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON0, 0xCBA1);
+		/* sdm power on */
+		regmap_update_bits(priv->regmap, MT6359_AFUNC_AUD_CON2,
+				   0xfffd, 0x0003);
+		/* sdm fifo enable */
+		regmap_update_bits(priv->regmap, MT6359_AFUNC_AUD_CON2,
+				   0xfffd, 0x000B);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* DL scrambler disabling sequence */
+		regmap_update_bits(priv->regmap, MT6359_AFUNC_AUD_CON2,
+				   0xfffd, 0x0000);
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON0, 0xcba0);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int mt_sdm_3rd_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* sdm audio fifo clock power on */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON11, 0x0006);
+		/* scrambler clock on enable */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON9, 0xCBA1);
+		/* sdm power on */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON11, 0x0003);
+		/* sdm fifo enable */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON11, 0x000B);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* DL scrambler disabling sequence */
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON11, 0x0000);
+		regmap_write(priv->regmap, MT6359_AFUNC_AUD_CON9, 0xcba0);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int mt_ncp_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol,
+			int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		regmap_write(priv->regmap, MT6359_AFE_NCP_CFG0, 0xc800);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int mt_dl_gpio_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		playback_gpio_set(priv);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		playback_gpio_reset(priv);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int mt_ul_gpio_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		capture_gpio_set(priv);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		capture_gpio_reset(priv);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+/* DAPM Widgets */
+static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
+	/* Global Supply*/
+	SND_SOC_DAPM_SUPPLY_S("CLK_BUF", SUPPLY_SEQ_CLK_BUF,
+			      MT6359_DCXO_CW12,
+			      RG_XO_AUDIO_EN_M_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("LDO_VAUD18", SUPPLY_SEQ_LDO_VAUD18,
+			      MT6359_LDO_VAUD18_CON0,
+			      RG_LDO_VAUD18_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDGLB", SUPPLY_SEQ_AUD_GLB,
+			      MT6359_AUDDEC_ANA_CON13,
+			      RG_AUDGLB_PWRDN_VA32_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDGLB_VOW", SUPPLY_SEQ_AUD_GLB_VOW,
+			      MT6359_AUDDEC_ANA_CON13,
+			      RG_AUDGLB_LP2_VOW_EN_VA32_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("CLKSQ Audio", SUPPLY_SEQ_CLKSQ,
+			      MT6359_AUDENC_ANA_CON23,
+			      RG_CLKSQ_EN_SFT, 0,
+			      mt_clksq_event,
+			      SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SUPPLY_S("AUDNCP_CK", SUPPLY_SEQ_TOP_CK,
+			      MT6359_AUD_TOP_CKPDN_CON0,
+			      RG_AUDNCP_CK_PDN_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("ZCD13M_CK", SUPPLY_SEQ_TOP_CK,
+			      MT6359_AUD_TOP_CKPDN_CON0,
+			      RG_ZCD13M_CK_PDN_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUD_CK", SUPPLY_SEQ_TOP_CK_LAST,
+			      MT6359_AUD_TOP_CKPDN_CON0,
+			      RG_AUD_CK_PDN_SFT, 1,
+			      mt_delay_250_event,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY_S("AUDIF_CK", SUPPLY_SEQ_TOP_CK,
+			      MT6359_AUD_TOP_CKPDN_CON0,
+			      RG_AUDIF_CK_PDN_SFT, 1, NULL, 0),
+	/* vow */
+	SND_SOC_DAPM_SUPPLY_S("VOW_AUD_LPW", SUPPLY_SEQ_VOW_AUD_LPW,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_vow_aud_lpw_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("AUD_VOW", SUPPLY_SEQ_AUD_VOW,
+			      MT6359_AUDENC_ANA_CON23,
+			      RG_AUDIO_VOW_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("VOW_CLK", SUPPLY_SEQ_VOW_CLK,
+			      MT6359_DCXO_CW11,
+			      RG_XO_VOW_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("VOW_LDO", SUPPLY_SEQ_VOW_LDO,
+			      MT6359_AUDENC_ANA_CON23,
+			      RG_CLKSQ_EN_VOW_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("VOW_DIG_CFG", SUPPLY_SEQ_VOW_DIG_CFG,
+			      MT6359_AUD_TOP_CKPDN_CON0,
+			      RG_VOW13M_CK_PDN_SFT, 1,
+			      mt_vow_digital_cfg_event,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY_S("VOW_PERIODIC_CFG", SUPPLY_SEQ_VOW_PERIODIC_CFG,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_vow_periodic_cfg_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	/* Digital Clock */
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_AFE_CTL", SUPPLY_SEQ_AUD_TOP_LAST,
+			      MT6359_AUDIO_TOP_CON0,
+			      PDN_AFE_CTL_SFT, 1,
+			      mt_delay_250_event,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_DAC_CTL", SUPPLY_SEQ_AUD_TOP,
+			      MT6359_AUDIO_TOP_CON0,
+			      PDN_DAC_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_ADC_CTL", SUPPLY_SEQ_AUD_TOP,
+			      MT6359_AUDIO_TOP_CON0,
+			      PDN_ADC_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_ADDA6_ADC_CTL", SUPPLY_SEQ_AUD_TOP,
+			      MT6359_AUDIO_TOP_CON0,
+			      PDN_ADDA6_ADC_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_I2S_DL", SUPPLY_SEQ_AUD_TOP,
+			      MT6359_AUDIO_TOP_CON0,
+			      PDN_I2S_DL_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_PWR_CLK", SUPPLY_SEQ_AUD_TOP,
+			      MT6359_AUDIO_TOP_CON0,
+			      PWR_CLK_DIS_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_PDN_AFE_TESTMODEL", SUPPLY_SEQ_AUD_TOP,
+			      MT6359_AUDIO_TOP_CON0,
+			      PDN_AFE_TESTMODEL_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_PDN_RESERVED", SUPPLY_SEQ_AUD_TOP,
+			      MT6359_AUDIO_TOP_CON0,
+			      PDN_RESERVED_SFT, 1, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("SDM", SUPPLY_SEQ_DL_SDM,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_sdm_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("SDM_3RD", SUPPLY_SEQ_DL_SDM,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_sdm_3rd_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* ch123 share SDM FIFO CLK */
+	SND_SOC_DAPM_SUPPLY_S("SDM_FIFO_CLK", SUPPLY_SEQ_DL_SDM_FIFO_CLK,
+			      MT6359_AFUNC_AUD_CON2,
+			      CCI_AFIFO_CLK_PWDB_SFT, 0,
+			      NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("NCP", SUPPLY_SEQ_DL_NCP,
+			      MT6359_AFE_NCP_CFG0,
+			      RG_NCP_ON_SFT, 0,
+			      mt_ncp_event,
+			      SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_SUPPLY("DL Digital Clock", SND_SOC_NOPM,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DL Digital Clock CH_1_2", SND_SOC_NOPM,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DL Digital Clock CH_3", SND_SOC_NOPM,
+			    0, 0, NULL, 0),
+
+	/* AFE ON */
+	SND_SOC_DAPM_SUPPLY_S("AFE_ON", SUPPLY_SEQ_AFE,
+			      MT6359_AFE_UL_DL_CON0, AFE_ON_SFT, 0,
+			      NULL, 0),
+
+	/* GPIO */
+	SND_SOC_DAPM_SUPPLY_S("DL_GPIO", SUPPLY_SEQ_DL_GPIO,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_dl_gpio_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("UL_GPIO", SUPPLY_SEQ_UL_GPIO,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_ul_gpio_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* AIF Rx*/
+	SND_SOC_DAPM_AIF_IN("AIF_RX", "AIF1 Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("AIF2_RX", "AIF2 Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("AFE_DL_SRC", SUPPLY_SEQ_DL_SRC,
+			      MT6359_AFE_DL_SRC2_CON0_L,
+			      DL_2_SRC_ON_TMP_CTL_PRE_SFT, 0,
+			      NULL, 0),
+
+	/* DL Supply */
+	SND_SOC_DAPM_SUPPLY("DL Power Supply", SND_SOC_NOPM,
+			    0, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("ESD_RESIST", SUPPLY_SEQ_DL_ESD_RESIST,
+			      SND_SOC_NOPM,
+			      0, 0,
+			      mt_esd_resist_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("LDO", SUPPLY_SEQ_DL_LDO,
+			      MT6359_AUDDEC_ANA_CON14,
+			      RG_LCLDO_DEC_EN_VA32_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("LDO_REMOTE", SUPPLY_SEQ_DL_LDO_REMOTE_SENSE,
+			      MT6359_AUDDEC_ANA_CON14,
+			      RG_LCLDO_DEC_REMOTE_SENSE_VA18_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("NV_REGULATOR", SUPPLY_SEQ_DL_NV,
+			      MT6359_AUDDEC_ANA_CON14,
+			      RG_NVREG_EN_VAUDP32_SFT, 0,
+			      mt_delay_100_event, SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SUPPLY_S("IBIST", SUPPLY_SEQ_DL_IBIST,
+			      MT6359_AUDDEC_ANA_CON12,
+			      RG_AUDIBIASPWRDN_VAUDP32_SFT, 1,
+			      NULL, 0),
+
+	/* DAC */
+	SND_SOC_DAPM_MUX("DAC In Mux", SND_SOC_NOPM, 0, 0, &dac_in_mux_control),
+
+	SND_SOC_DAPM_DAC("DACL", NULL, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_DAC("DACR", NULL, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_DAC("DAC_3RD", NULL, SND_SOC_NOPM, 0, 0),
+
+	/* Headphone */
+	SND_SOC_DAPM_MUX_E("HPL Mux", SND_SOC_NOPM, 0, 0,
+			   &hpl_in_mux_control,
+			   mt_hp_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_MUX_E("HPR Mux", SND_SOC_NOPM, 0, 0,
+			   &hpr_in_mux_control,
+			   mt_hp_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_SUPPLY("HP_Supply", SND_SOC_NOPM,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("HP_PULL_DOWN", SUPPLY_SEQ_HP_PULL_DOWN,
+			      SND_SOC_NOPM,
+			      0, 0,
+			      mt_hp_pull_down_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("HP_MUTE", SUPPLY_SEQ_HP_MUTE,
+			      SND_SOC_NOPM,
+			      0, 0,
+			      mt_hp_mute_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("HP_DAMP", SUPPLY_SEQ_HP_DAMPING_OFF_RESET_CMFB,
+			      SND_SOC_NOPM,
+			      0, 0,
+			      mt_hp_damp_event,
+			      SND_SOC_DAPM_POST_PMD),
+
+	/* Receiver */
+	SND_SOC_DAPM_MUX_E("RCV Mux", SND_SOC_NOPM, 0, 0,
+			   &rcv_in_mux_control,
+			   mt_rcv_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	/* LOL */
+	SND_SOC_DAPM_MUX_E("LOL Mux", SND_SOC_NOPM, 0, 0,
+			   &lo_in_mux_control,
+			   mt_lo_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	/* Outputs */
+	SND_SOC_DAPM_OUTPUT("Receiver"),
+	SND_SOC_DAPM_OUTPUT("Headphone L"),
+	SND_SOC_DAPM_OUTPUT("Headphone R"),
+	SND_SOC_DAPM_OUTPUT("Headphone L Ext Spk Amp"),
+	SND_SOC_DAPM_OUTPUT("Headphone R Ext Spk Amp"),
+	SND_SOC_DAPM_OUTPUT("LINEOUT L"),
+
+	/* SGEN */
+	SND_SOC_DAPM_SUPPLY("SGEN DL Enable", MT6359_AFE_SGEN_CFG0,
+			    SGEN_DAC_EN_CTL_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SGEN MUTE", MT6359_AFE_SGEN_CFG0,
+			    SGEN_MUTE_SW_CTL_SFT, 1,
+			    mt_sgen_event,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("SGEN DL SRC", MT6359_AFE_DL_SRC2_CON0_L,
+			    DL_2_SRC_ON_TMP_CTL_PRE_SFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_INPUT("SGEN DL"),
+
+	/* Uplinks */
+	SND_SOC_DAPM_AIF_OUT("AIF1TX", "AIF1 Capture", 0,
+			     SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF2TX", "AIF2 Capture", 0,
+			     SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("ADC_CLKGEN", SUPPLY_SEQ_ADC_CLKGEN,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_adc_clk_gen_event,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("DCC_CLK", SUPPLY_SEQ_DCC_CLK,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_dcc_clk_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* Uplinks MUX */
+	SND_SOC_DAPM_MUX("AIF Out Mux", SND_SOC_NOPM, 0, 0,
+			 &aif_out_mux_control),
+
+	SND_SOC_DAPM_MUX("AIF2 Out Mux", SND_SOC_NOPM, 0, 0,
+			 &aif2_out_mux_control),
+
+	SND_SOC_DAPM_SUPPLY("AIFTX_Supply", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("MTKAIF_TX", SUPPLY_SEQ_UL_MTKAIF,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_mtkaif_tx_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("UL_SRC", SUPPLY_SEQ_UL_SRC,
+			      MT6359_AFE_UL_SRC_CON0_L,
+			      UL_SRC_ON_TMP_CTL_SFT, 0,
+			      NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("UL_SRC_DMIC", SUPPLY_SEQ_UL_SRC_DMIC,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_ul_src_dmic_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("UL_SRC_34", SUPPLY_SEQ_UL_SRC,
+			      MT6359_AFE_ADDA6_UL_SRC_CON0_L,
+			      ADDA6_UL_SRC_ON_TMP_CTL_SFT, 0,
+			      NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("UL_SRC_34_DMIC", SUPPLY_SEQ_UL_SRC_DMIC,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_ul_src_34_dmic_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("MISO0_MUX", SND_SOC_NOPM, 0, 0, &miso0_mux_control),
+	SND_SOC_DAPM_MUX("MISO1_MUX", SND_SOC_NOPM, 0, 0, &miso1_mux_control),
+	SND_SOC_DAPM_MUX("MISO2_MUX", SND_SOC_NOPM, 0, 0, &miso2_mux_control),
+
+	SND_SOC_DAPM_MUX("UL_SRC_MUX", SND_SOC_NOPM, 0, 0,
+			 &ul_src_mux_control),
+	SND_SOC_DAPM_MUX("UL2_SRC_MUX", SND_SOC_NOPM, 0, 0,
+			 &ul2_src_mux_control),
+	SND_SOC_DAPM_MUX("VOW_UL_SRC_MUX", SND_SOC_NOPM, 0, 0,
+			 &vow_ul_src_mux_control),
+
+	SND_SOC_DAPM_MUX("DMIC0_MUX", SND_SOC_NOPM, 0, 0, &dmic0_mux_control),
+	SND_SOC_DAPM_MUX("DMIC1_MUX", SND_SOC_NOPM, 0, 0, &dmic1_mux_control),
+	SND_SOC_DAPM_MUX("DMIC2_MUX", SND_SOC_NOPM, 0, 0, &dmic2_mux_control),
+
+	SND_SOC_DAPM_MUX("VOW_AMIC0_MUX", SND_SOC_NOPM, 0, 0,
+			 &vow_amic0_mux_control),
+	SND_SOC_DAPM_MUX("VOW_AMIC1_MUX", SND_SOC_NOPM, 0, 0,
+			 &vow_amic1_mux_control),
+
+	SND_SOC_DAPM_MUX_E("ADC_L_Mux", SND_SOC_NOPM, 0, 0,
+			   &adc_left_mux_control, NULL, 0),
+	SND_SOC_DAPM_MUX_E("ADC_R_Mux", SND_SOC_NOPM, 0, 0,
+			   &adc_right_mux_control, NULL, 0),
+	SND_SOC_DAPM_MUX_E("ADC_3_Mux", SND_SOC_NOPM, 0, 0,
+			   &adc_3_mux_control, NULL, 0),
+
+	SND_SOC_DAPM_ADC("ADC_L", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("ADC_R", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("ADC_3", NULL, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("ADC_L_EN", SUPPLY_SEQ_UL_ADC,
+			      MT6359_AUDENC_ANA_CON0,
+			      RG_AUDADCLPWRUP_SFT, 0,
+			      mt_adc_l_event,
+			      SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SUPPLY_S("ADC_R_EN", SUPPLY_SEQ_UL_ADC,
+			      MT6359_AUDENC_ANA_CON1,
+			      RG_AUDADCRPWRUP_SFT, 0,
+			      mt_adc_r_event,
+			      SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SUPPLY_S("ADC_3_EN", SUPPLY_SEQ_UL_ADC,
+			      MT6359_AUDENC_ANA_CON2,
+			      RG_AUDADC3PWRUP_SFT, 0,
+			      mt_adc_3_event,
+			      SND_SOC_DAPM_POST_PMU),
+
+	SND_SOC_DAPM_MUX_E("PGA_L_Mux", SND_SOC_NOPM, 0, 0,
+			   &pga_left_mux_control,
+			   mt_pga_l_mux_event,
+			   SND_SOC_DAPM_WILL_PMU),
+	SND_SOC_DAPM_MUX_E("PGA_R_Mux", SND_SOC_NOPM, 0, 0,
+			   &pga_right_mux_control,
+			   mt_pga_r_mux_event,
+			   SND_SOC_DAPM_WILL_PMU),
+	SND_SOC_DAPM_MUX_E("PGA_3_Mux", SND_SOC_NOPM, 0, 0,
+			   &pga_3_mux_control,
+			   mt_pga_3_mux_event,
+			   SND_SOC_DAPM_WILL_PMU),
+
+	SND_SOC_DAPM_PGA("PGA_L", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("PGA_R", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("PGA_3", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("PGA_L_EN", SUPPLY_SEQ_UL_PGA,
+			      MT6359_AUDENC_ANA_CON0,
+			      RG_AUDPREAMPLON_SFT, 0,
+			      mt_pga_l_event,
+			      SND_SOC_DAPM_PRE_PMU |
+			      SND_SOC_DAPM_POST_PMU |
+			      SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("PGA_R_EN", SUPPLY_SEQ_UL_PGA,
+			      MT6359_AUDENC_ANA_CON1,
+			      RG_AUDPREAMPRON_SFT, 0,
+			      mt_pga_r_event,
+			      SND_SOC_DAPM_PRE_PMU |
+			      SND_SOC_DAPM_POST_PMU |
+			      SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("PGA_3_EN", SUPPLY_SEQ_UL_PGA,
+			      MT6359_AUDENC_ANA_CON2,
+			      RG_AUDPREAMP3ON_SFT, 0,
+			      mt_pga_3_event,
+			      SND_SOC_DAPM_PRE_PMU |
+			      SND_SOC_DAPM_POST_PMU |
+			      SND_SOC_DAPM_POST_PMD),
+
+	/* UL input */
+	SND_SOC_DAPM_INPUT("AIN0"),
+	SND_SOC_DAPM_INPUT("AIN1"),
+	SND_SOC_DAPM_INPUT("AIN2"),
+	SND_SOC_DAPM_INPUT("AIN3"),
+
+	SND_SOC_DAPM_INPUT("AIN0_DMIC"),
+	SND_SOC_DAPM_INPUT("AIN2_DMIC"),
+	SND_SOC_DAPM_INPUT("AIN3_DMIC"),
+
+	/* mic bias */
+	SND_SOC_DAPM_SUPPLY_S("MIC_BIAS_0", SUPPLY_SEQ_MIC_BIAS,
+			      MT6359_AUDENC_ANA_CON15,
+			      RG_AUDPWDBMICBIAS0_SFT, 0,
+			      mt_mic_bias_0_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("MIC_BIAS_1", SUPPLY_SEQ_MIC_BIAS,
+			      MT6359_AUDENC_ANA_CON16,
+			      RG_AUDPWDBMICBIAS1_SFT, 0,
+			      mt_mic_bias_1_event,
+			      SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SUPPLY_S("MIC_BIAS_2", SUPPLY_SEQ_MIC_BIAS,
+			      MT6359_AUDENC_ANA_CON17,
+			      RG_AUDPWDBMICBIAS2_SFT, 0,
+			      mt_mic_bias_2_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* dmic */
+	SND_SOC_DAPM_SUPPLY_S("DMIC_0", SUPPLY_SEQ_DMIC,
+			      MT6359_AUDENC_ANA_CON13,
+			      RG_AUDDIGMICEN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("DMIC_1", SUPPLY_SEQ_DMIC,
+			      MT6359_AUDENC_ANA_CON14,
+			      RG_AUDDIGMIC1EN_SFT, 0,
+			      NULL, 0),
+
+	/* VOW */
+	SND_SOC_DAPM_AIF_OUT_E("VOW TX", "VOW Capture", 0,
+			       SND_SOC_NOPM, 0, 0,
+			       mt_vow_out_event,
+			       SND_SOC_DAPM_WILL_PMU |
+			       SND_SOC_DAPM_PRE_PMU |
+			       SND_SOC_DAPM_POST_PMD),
+};
+
+static int mt_vow_amic_connect(struct snd_soc_dapm_widget *source,
+			       struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	if (IS_VOW_AMIC_BASE(priv->mux_select[MUX_MIC_TYPE_0]) ||
+	    IS_VOW_AMIC_BASE(priv->mux_select[MUX_MIC_TYPE_1]) ||
+	    IS_VOW_AMIC_BASE(priv->mux_select[MUX_MIC_TYPE_2]))
+		return 1;
+	else
+		return 0;
+}
+
+static int mt_vow_amic_dcc_connect(struct snd_soc_dapm_widget *source,
+				   struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	if (IS_VOW_DCC_BASE(priv->mux_select[MUX_MIC_TYPE_0]) ||
+	    IS_VOW_DCC_BASE(priv->mux_select[MUX_MIC_TYPE_1]) ||
+	    IS_VOW_DCC_BASE(priv->mux_select[MUX_MIC_TYPE_2]))
+		return 1;
+	else
+		return 0;
+}
+
+static int mt_dcc_clk_connect(struct snd_soc_dapm_widget *source,
+			      struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	if (IS_DCC_BASE(priv->mux_select[MUX_MIC_TYPE_0]) ||
+	    IS_DCC_BASE(priv->mux_select[MUX_MIC_TYPE_1]) ||
+	    IS_DCC_BASE(priv->mux_select[MUX_MIC_TYPE_2]))
+		return 1;
+	else
+		return 0;
+}
+
+static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
+	/* Capture */
+	{"AIFTX_Supply", NULL, "CLK_BUF"},
+	{"AIFTX_Supply", NULL, "LDO_VAUD18"},
+	{"AIFTX_Supply", NULL, "AUDGLB"},
+	{"AIFTX_Supply", NULL, "CLKSQ Audio"},
+	{"AIFTX_Supply", NULL, "AUD_CK"},
+	{"AIFTX_Supply", NULL, "AUDIF_CK"},
+	{"AIFTX_Supply", NULL, "AUDIO_TOP_AFE_CTL"},
+	{"AIFTX_Supply", NULL, "AUDIO_TOP_PWR_CLK"},
+	{"AIFTX_Supply", NULL, "AUDIO_TOP_PDN_RESERVED"},
+	{"AIFTX_Supply", NULL, "AUDIO_TOP_I2S_DL"},
+	/*
+	 * *_ADC_CTL should enable only if UL_SRC in use,
+	 * but dm ck may be needed even UL_SRC_x not in use
+	 */
+	{"AIFTX_Supply", NULL, "AUDIO_TOP_ADC_CTL"},
+	{"AIFTX_Supply", NULL, "AUDIO_TOP_ADDA6_ADC_CTL"},
+	{"AIFTX_Supply", NULL, "AFE_ON"},
+
+	/* ul ch 12 */
+	{"AIF1TX", NULL, "AIF Out Mux"},
+	{"AIF1TX", NULL, "AIFTX_Supply"},
+	{"AIF1TX", NULL, "UL_GPIO"},
+	{"AIF1TX", NULL, "MTKAIF_TX"},
+
+	{"AIF2TX", NULL, "AIF2 Out Mux"},
+	{"AIF2TX", NULL, "AIFTX_Supply"},
+	{"AIF2TX", NULL, "UL_GPIO"},
+	{"AIF2TX", NULL, "MTKAIF_TX"},
+
+	{"AIF Out Mux", "Normal Path", "MISO0_MUX"},
+	{"AIF Out Mux", "Normal Path", "MISO1_MUX"},
+	{"AIF2 Out Mux", "Normal Path", "MISO2_MUX"},
+
+	{"MISO0_MUX", "UL1_CH1", "UL_SRC_MUX"},
+	{"MISO0_MUX", "UL1_CH2", "UL_SRC_MUX"},
+	{"MISO0_MUX", "UL2_CH1", "UL2_SRC_MUX"},
+	{"MISO0_MUX", "UL2_CH2", "UL2_SRC_MUX"},
+
+	{"MISO1_MUX", "UL1_CH1", "UL_SRC_MUX"},
+	{"MISO1_MUX", "UL1_CH2", "UL_SRC_MUX"},
+	{"MISO1_MUX", "UL2_CH1", "UL2_SRC_MUX"},
+	{"MISO1_MUX", "UL2_CH2", "UL2_SRC_MUX"},
+
+	{"MISO2_MUX", "UL1_CH1", "UL_SRC_MUX"},
+	{"MISO2_MUX", "UL1_CH2", "UL_SRC_MUX"},
+	{"MISO2_MUX", "UL2_CH1", "UL2_SRC_MUX"},
+	{"MISO2_MUX", "UL2_CH2", "UL2_SRC_MUX"},
+
+	{"UL_SRC_MUX", "AMIC", "ADC_L"},
+	{"UL_SRC_MUX", "AMIC", "ADC_R"},
+	{"UL_SRC_MUX", "DMIC", "DMIC0_MUX"},
+	{"UL_SRC_MUX", "DMIC", "DMIC1_MUX"},
+	{"UL_SRC_MUX", NULL, "UL_SRC"},
+
+	{"UL2_SRC_MUX", "AMIC", "ADC_3"},
+	{"UL2_SRC_MUX", "DMIC", "DMIC2_MUX"},
+	{"UL2_SRC_MUX", NULL, "UL_SRC_34"},
+
+	{"DMIC0_MUX", "DMIC_DATA0", "AIN0_DMIC"},
+	{"DMIC0_MUX", "DMIC_DATA1_L", "AIN2_DMIC"},
+	{"DMIC0_MUX", "DMIC_DATA1_L_1", "AIN2_DMIC"},
+	{"DMIC0_MUX", "DMIC_DATA1_R", "AIN3_DMIC"},
+	{"DMIC1_MUX", "DMIC_DATA0", "AIN0_DMIC"},
+	{"DMIC1_MUX", "DMIC_DATA1_L", "AIN2_DMIC"},
+	{"DMIC1_MUX", "DMIC_DATA1_L_1", "AIN2_DMIC"},
+	{"DMIC1_MUX", "DMIC_DATA1_R", "AIN3_DMIC"},
+	{"DMIC2_MUX", "DMIC_DATA0", "AIN0_DMIC"},
+	{"DMIC2_MUX", "DMIC_DATA1_L", "AIN2_DMIC"},
+	{"DMIC2_MUX", "DMIC_DATA1_L_1", "AIN2_DMIC"},
+	{"DMIC2_MUX", "DMIC_DATA1_R", "AIN3_DMIC"},
+
+	{"DMIC0_MUX", NULL, "UL_SRC_DMIC"},
+	{"DMIC1_MUX", NULL, "UL_SRC_DMIC"},
+	{"DMIC2_MUX", NULL, "UL_SRC_34_DMIC"},
+
+	{"AIN0_DMIC", NULL, "DMIC_0"},
+	{"AIN2_DMIC", NULL, "DMIC_1"},
+	{"AIN3_DMIC", NULL, "DMIC_1"},
+	{"AIN2_DMIC", NULL, "MIC_BIAS_2"},
+	{"AIN3_DMIC", NULL, "MIC_BIAS_2"},
+
+	/* adc */
+	{"ADC_L", NULL, "ADC_L_Mux"},
+	{"ADC_L", NULL, "ADC_CLKGEN"},
+	{"ADC_L", NULL, "ADC_L_EN"},
+	{"ADC_R", NULL, "ADC_R_Mux"},
+	{"ADC_R", NULL, "ADC_CLKGEN"},
+	{"ADC_R", NULL, "ADC_R_EN"},
+	/*
+	 * amic fifo ch1/2 clk from ADC_L,
+	 * enable ADC_L even use ADC_R only
+	 */
+	{"ADC_R", NULL, "ADC_L_EN"},
+	{"ADC_3", NULL, "ADC_3_Mux"},
+	{"ADC_3", NULL, "ADC_CLKGEN"},
+	{"ADC_3", NULL, "ADC_3_EN"},
+
+	{"ADC_L_Mux", "Left Preamplifier", "PGA_L"},
+	{"ADC_R_Mux", "Right Preamplifier", "PGA_R"},
+	{"ADC_3_Mux", "Preamplifier", "PGA_3"},
+
+	{"PGA_L", NULL, "PGA_L_Mux"},
+	{"PGA_L", NULL, "PGA_L_EN"},
+	{"PGA_R", NULL, "PGA_R_Mux"},
+	{"PGA_R", NULL, "PGA_R_EN"},
+	{"PGA_3", NULL, "PGA_3_Mux"},
+	{"PGA_3", NULL, "PGA_3_EN"},
+
+	{"PGA_L", NULL, "DCC_CLK", mt_dcc_clk_connect},
+	{"PGA_R", NULL, "DCC_CLK", mt_dcc_clk_connect},
+	{"PGA_3", NULL, "DCC_CLK", mt_dcc_clk_connect},
+
+	{"PGA_L_Mux", "AIN0", "AIN0"},
+	{"PGA_L_Mux", "AIN1", "AIN1"},
+
+	{"PGA_R_Mux", "AIN0", "AIN0"},
+	{"PGA_R_Mux", "AIN2", "AIN2"},
+	{"PGA_R_Mux", "AIN3", "AIN3"},
+
+	{"PGA_3_Mux", "AIN2", "AIN2"},
+	{"PGA_3_Mux", "AIN3", "AIN3"},
+
+	{"AIN0", NULL, "MIC_BIAS_0"},
+	{"AIN1", NULL, "MIC_BIAS_1"},
+	{"AIN2", NULL, "MIC_BIAS_0"},
+	{"AIN2", NULL, "MIC_BIAS_2"},
+	{"AIN3", NULL, "MIC_BIAS_2"},
+
+	/* DL Supply */
+	{"DL Power Supply", NULL, "CLK_BUF"},
+	{"DL Power Supply", NULL, "LDO_VAUD18"},
+	{"DL Power Supply", NULL, "AUDGLB"},
+	{"DL Power Supply", NULL, "CLKSQ Audio"},
+
+	{"DL Power Supply", NULL, "AUDNCP_CK"},
+	{"DL Power Supply", NULL, "ZCD13M_CK"},
+	{"DL Power Supply", NULL, "AUD_CK"},
+	{"DL Power Supply", NULL, "AUDIF_CK"},
+
+	{"DL Power Supply", NULL, "ESD_RESIST"},
+	{"DL Power Supply", NULL, "LDO"},
+	{"DL Power Supply", NULL, "LDO_REMOTE"},
+	{"DL Power Supply", NULL, "NV_REGULATOR"},
+	{"DL Power Supply", NULL, "IBIST"},
+
+	/* DL Digital Supply */
+	{"DL Digital Clock", NULL, "AUDIO_TOP_AFE_CTL"},
+	{"DL Digital Clock", NULL, "AUDIO_TOP_DAC_CTL"},
+	{"DL Digital Clock", NULL, "AUDIO_TOP_PWR_CLK"},
+	{"DL Digital Clock", NULL, "AUDIO_TOP_PDN_RESERVED"},
+
+	{"DL Digital Clock", NULL, "SDM_FIFO_CLK"},
+	{"DL Digital Clock", NULL, "NCP"},
+
+	{"DL Digital Clock", NULL, "AFE_ON"},
+	{"DL Digital Clock", NULL, "AFE_DL_SRC"},
+
+	{"DL Digital Clock CH_1_2", NULL, "DL Digital Clock"},
+	{"DL Digital Clock CH_1_2", NULL, "SDM"},
+
+	{"DL Digital Clock CH_3", NULL, "DL Digital Clock"},
+	{"DL Digital Clock CH_3", NULL, "SDM_3RD"},
+
+	{"AIF_RX", NULL, "DL Digital Clock CH_1_2"},
+	{"AIF_RX", NULL, "DL_GPIO"},
+
+	{"AIF2_RX", NULL, "DL Digital Clock CH_3"},
+	{"AIF2_RX", NULL, "DL_GPIO"},
+
+	/* DL Path */
+	{"DAC In Mux", "Normal Path", "AIF_RX"},
+	{"DAC In Mux", "Sgen", "SGEN DL"},
+	{"SGEN DL", NULL, "SGEN DL SRC"},
+	{"SGEN DL", NULL, "SGEN MUTE"},
+	{"SGEN DL", NULL, "SGEN DL Enable"},
+	{"SGEN DL", NULL, "DL Digital Clock CH_1_2"},
+	{"SGEN DL", NULL, "DL Digital Clock CH_3"},
+	{"SGEN DL", NULL, "AUDIO_TOP_PDN_AFE_TESTMODEL"},
+
+	{"DACL", NULL, "DAC In Mux"},
+	{"DACL", NULL, "DL Power Supply"},
+
+	{"DACR", NULL, "DAC In Mux"},
+	{"DACR", NULL, "DL Power Supply"},
+
+	/* DAC 3RD */
+	{"DAC In Mux", "Normal Path", "AIF2_RX"},
+	{"DAC_3RD", NULL, "DAC In Mux"},
+	{"DAC_3RD", NULL, "DL Power Supply"},
+
+	/* Lineout Path */
+	{"LOL Mux", "Playback", "DAC_3RD"},
+	{"LINEOUT L", NULL, "LOL Mux"},
+
+	/* Headphone Path */
+	{"HP_Supply", NULL, "HP_PULL_DOWN"},
+	{"HP_Supply", NULL, "HP_MUTE"},
+	{"HP_Supply", NULL, "HP_DAMP"},
+	{"HPL Mux", NULL, "HP_Supply"},
+	{"HPR Mux", NULL, "HP_Supply"},
+
+	{"HPL Mux", "Audio Playback", "DACL"},
+	{"HPR Mux", "Audio Playback", "DACR"},
+	{"HPL Mux", "HP Impedance", "DACL"},
+	{"HPR Mux", "HP Impedance", "DACR"},
+	{"HPL Mux", "LoudSPK Playback", "DACL"},
+	{"HPR Mux", "LoudSPK Playback", "DACR"},
+
+	{"Headphone L", NULL, "HPL Mux"},
+	{"Headphone R", NULL, "HPR Mux"},
+	{"Headphone L Ext Spk Amp", NULL, "HPL Mux"},
+	{"Headphone R Ext Spk Amp", NULL, "HPR Mux"},
+
+	/* Receiver Path */
+	{"RCV Mux", "Voice Playback", "DACL"},
+	{"Receiver", NULL, "RCV Mux"},
+
+	/* VOW */
+	{"VOW TX", NULL, "VOW_UL_SRC_MUX"},
+	{"VOW TX", NULL, "CLK_BUF"},
+	{"VOW TX", NULL, "LDO_VAUD18"},
+	{"VOW TX", NULL, "AUDGLB"},
+	{"VOW TX", NULL, "AUDGLB_VOW", mt_vow_amic_connect},
+	{"VOW TX", NULL, "AUD_CK", mt_vow_amic_connect},
+	{"VOW TX", NULL, "VOW_AUD_LPW", mt_vow_amic_connect},
+	{"VOW TX", NULL, "VOW_CLK"},
+	{"VOW TX", NULL, "AUD_VOW"},
+	{"VOW TX", NULL, "VOW_LDO", mt_vow_amic_connect},
+	{"VOW TX", NULL, "VOW_DIG_CFG"},
+	{"VOW TX", NULL, "VOW_PERIODIC_CFG", mt_vow_amic_dcc_connect},
+	{"VOW_UL_SRC_MUX", "AMIC", "VOW_AMIC0_MUX"},
+	{"VOW_UL_SRC_MUX", "AMIC", "VOW_AMIC1_MUX"},
+	{"VOW_UL_SRC_MUX", "DMIC", "DMIC0_MUX"},
+	{"VOW_UL_SRC_MUX", "DMIC", "DMIC1_MUX"},
+	{"VOW_AMIC0_MUX", "ADC_L", "ADC_L"},
+	{"VOW_AMIC0_MUX", "ADC_R", "ADC_R"},
+	{"VOW_AMIC0_MUX", "ADC_T", "ADC_3"},
+	{"VOW_AMIC1_MUX", "ADC_L", "ADC_L"},
+	{"VOW_AMIC1_MUX", "ADC_R", "ADC_R"},
+	{"VOW_AMIC1_MUX", "ADC_T", "ADC_3"},
+};
+
+static int mt6359_codec_dai_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *cmpnt = dai->component;
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int rate = params_rate(params);
+	int id = dai->id;
+
+	dev_info(priv->dev, "%s(), id %d, substream->stream %d, rate %d, number %d\n",
+		 __func__,
+		 id,
+		 substream->stream,
+		 rate,
+		 substream->number);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		priv->dl_rate[id] = rate;
+	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		priv->ul_rate[id] = rate;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt6359_codec_dai_ops = {
+	.hw_params = mt6359_codec_dai_hw_params,
+};
+
+static int mt6359_codec_dai_vow_hw_params(struct snd_pcm_substream *substream,
+					  struct snd_pcm_hw_params *params,
+					  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *cmpnt = dai->component;
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int channel = params_channels(params);
+
+	dev_info(priv->dev, "%s(), substream->stream %d, channel %d, number %d\n",
+		 __func__,
+		 substream->stream,
+		 channel,
+		 substream->number);
+
+	priv->vow_channel = channel;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt6359_codec_dai_vow_ops = {
+	.hw_params = mt6359_codec_dai_vow_hw_params,
+};
+
+#define MT6359_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
+			SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |\
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
+			SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |\
+			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
+			SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE)
+
+static struct snd_soc_dai_driver mt6359_dai_driver[] = {
+	{
+		.id = MT6359_AIF_1,
+		.name = "mt6359-snd-codec-aif1",
+		.playback = {
+			.stream_name = "AIF1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000 |
+				 SNDRV_PCM_RATE_96000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = MT6359_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000 |
+				 SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000 |
+				 SNDRV_PCM_RATE_96000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = MT6359_FORMATS,
+		},
+		.ops = &mt6359_codec_dai_ops,
+	},
+	{
+		.id = MT6359_AIF_2,
+		.name = "mt6359-snd-codec-aif2",
+		.playback = {
+			.stream_name = "AIF2 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000 |
+				 SNDRV_PCM_RATE_96000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = MT6359_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF2 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000 |
+				 SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = MT6359_FORMATS,
+		},
+		.ops = &mt6359_codec_dai_ops,
+	},
+	{
+		.id = MT6359_AIF_VOW,
+		.name = "mt6359-snd-codec-vow",
+		.capture = {
+			.stream_name = "VOW Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_16000,
+			.formats = MT6359_FORMATS,
+		},
+		.ops = &mt6359_codec_dai_vow_ops,
+	},
+};
+
+/* vow control */
+static void *get_vow_coeff_by_name(struct mt6359_priv *priv,
+				   const char *name)
+{
+	if (strcmp(name, "Audio VOWCFG0 Data") == 0)
+		return &priv->reg_afe_vow_vad_cfg0;
+	else if (strcmp(name, "Audio VOWCFG1 Data") == 0)
+		return &priv->reg_afe_vow_vad_cfg1;
+	else if (strcmp(name, "Audio VOWCFG2 Data") == 0)
+		return &priv->reg_afe_vow_vad_cfg2;
+	else if (strcmp(name, "Audio VOWCFG3 Data") == 0)
+		return &priv->reg_afe_vow_vad_cfg3;
+	else if (strcmp(name, "Audio VOWCFG4 Data") == 0)
+		return &priv->reg_afe_vow_vad_cfg4;
+	else if (strcmp(name, "Audio VOWCFG5 Data") == 0)
+		return &priv->reg_afe_vow_vad_cfg5;
+	else if (strcmp(name, "Audio_VOW_Periodic") == 0)
+		return &priv->reg_afe_vow_periodic;
+	else if (strcmp(name, "Audio_VOW_Periodic_Param") == 0)
+		return (void *)&priv->vow_periodic_param;
+	else
+		return NULL;
+}
+
+static int audio_vow_cfg_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	int *vow_cfg;
+
+	vow_cfg = (int *)get_vow_coeff_by_name(priv, kcontrol->id.name);
+	if (!vow_cfg) {
+		dev_err(priv->dev, "%s(), vow_cfg == NULL\n", __func__);
+		return -EINVAL;
+	}
+	dev_info(priv->dev, "%s(), %s = 0x%x\n",
+		 __func__, kcontrol->id.name, *vow_cfg);
+
+	ucontrol->value.integer.value[0] = *vow_cfg;
+	return 0;
+}
+
+static int audio_vow_cfg_set(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	int index = ucontrol->value.integer.value[0];
+	int *vow_cfg;
+
+	vow_cfg = (int *)get_vow_coeff_by_name(priv, kcontrol->id.name);
+	if (!vow_cfg) {
+		dev_err(priv->dev, "%s(), vow_cfg == NULL\n", __func__);
+		return -EINVAL;
+	}
+	dev_info(priv->dev, "%s(), %s = 0x%x\n",
+		 __func__, kcontrol->id.name, index);
+
+	*vow_cfg = index;
+	return 0;
+}
+
+static int audio_vow_periodic_parm_get(struct snd_kcontrol *kcontrol,
+				       unsigned int __user *data,
+				       unsigned int size)
+{
+	return 0;
+}
+
+static int audio_vow_periodic_parm_set(struct snd_kcontrol *kcontrol,
+				       const unsigned int __user *data,
+				       unsigned int size)
+{
+	int ret = 0;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	struct mt6359_vow_periodic_on_off_data *vow_param_cfg;
+
+	dev_info(priv->dev, "%s(), size = %d\n", __func__, size);
+	if (size > sizeof(struct mt6359_vow_periodic_on_off_data))
+		return -EINVAL;
+	vow_param_cfg = (struct mt6359_vow_periodic_on_off_data *)
+			get_vow_coeff_by_name(priv, kcontrol->id.name);
+	if (copy_from_user(vow_param_cfg, data,
+			   sizeof(struct mt6359_vow_periodic_on_off_data))) {
+		dev_info(priv->dev, "%s(),Fail copy to user Ptr:%p,r_sz:%zu\n",
+			 __func__,
+			 data,
+			 sizeof(struct mt6359_vow_periodic_on_off_data));
+		ret = -EFAULT;
+	}
+	return ret;
+}
+
+/* vow control */
+static const struct snd_kcontrol_new mt6359_snd_vow_controls[] = {
+	SOC_SINGLE_EXT("Audio VOWCFG0 Data",
+		       SND_SOC_NOPM, 0, 0x80000, 0,
+		       audio_vow_cfg_get, audio_vow_cfg_set),
+	SOC_SINGLE_EXT("Audio VOWCFG1 Data",
+		       SND_SOC_NOPM, 0, 0x80000, 0,
+		       audio_vow_cfg_get, audio_vow_cfg_set),
+	SOC_SINGLE_EXT("Audio VOWCFG2 Data",
+		       SND_SOC_NOPM, 0, 0x80000, 0,
+		       audio_vow_cfg_get, audio_vow_cfg_set),
+	SOC_SINGLE_EXT("Audio VOWCFG3 Data",
+		       SND_SOC_NOPM, 0, 0x80000, 0,
+		       audio_vow_cfg_get, audio_vow_cfg_set),
+	SOC_SINGLE_EXT("Audio VOWCFG4 Data",
+		       SND_SOC_NOPM, 0, 0x80000, 0,
+		       audio_vow_cfg_get, audio_vow_cfg_set),
+	SOC_SINGLE_EXT("Audio VOWCFG5 Data",
+		       SND_SOC_NOPM, 0, 0x80000, 0,
+		       audio_vow_cfg_get, audio_vow_cfg_set),
+	SOC_SINGLE_EXT("Audio_VOW_Periodic",
+		       SND_SOC_NOPM, 0, 0x80000, 0,
+		       audio_vow_cfg_get, audio_vow_cfg_set),
+	SND_SOC_BYTES_TLV("Audio_VOW_Periodic_Param",
+			  sizeof(struct mt6359_vow_periodic_on_off_data),
+			  audio_vow_periodic_parm_get,
+			  audio_vow_periodic_parm_set),
+};
+
+static int mt6359_codec_init_reg(struct mt6359_priv *priv)
+{
+	int ret = 0;
+
+	/* enable clk buf */
+	regmap_update_bits(priv->regmap, MT6359_DCXO_CW12,
+			   0x1 << RG_XO_AUDIO_EN_M_SFT,
+			   0x1 << RG_XO_AUDIO_EN_M_SFT);
+
+	/* set those not controlled by dapm widget */
+
+	/* audio clk source from internal dcxo */
+	regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON23,
+			   RG_CLKSQ_IN_SEL_TEST_MASK_SFT,
+			   0x0);
+
+	/* Disable HeadphoneL/HeadphoneR short circuit protection */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+			   RG_AUDHPLSCDISABLE_VAUDP32_MASK_SFT,
+			   0x1 << RG_AUDHPLSCDISABLE_VAUDP32_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+			   RG_AUDHPRSCDISABLE_VAUDP32_MASK_SFT,
+			   0x1 << RG_AUDHPRSCDISABLE_VAUDP32_SFT);
+	/* Disable voice short circuit protection */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON6,
+			   RG_AUDHSSCDISABLE_VAUDP32_MASK_SFT,
+			   0x1 << RG_AUDHSSCDISABLE_VAUDP32_SFT);
+	/* disable LO buffer left short circuit protection */
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON7,
+			   RG_AUDLOLSCDISABLE_VAUDP32_MASK_SFT,
+			   0x1 << RG_AUDLOLSCDISABLE_VAUDP32_SFT);
+
+	/* set gpio */
+	playback_gpio_reset(priv);
+	capture_gpio_reset(priv);
+
+	/* hp gain ctl default choose ZCD */
+	priv->hp_gain_ctl = HP_GAIN_CTL_ZCD;
+	hp_gain_ctl_select(priv, priv->hp_gain_ctl);
+
+	/* hp hifi mode, default normal mode */
+	priv->hp_hifi_mode = 0;
+
+	/* Disable AUD_ZCD */
+	zcd_disable(priv);
+
+	/* disable clk buf */
+	regmap_update_bits(priv->regmap, MT6359_DCXO_CW12,
+			   0x1 << RG_XO_AUDIO_EN_M_SFT,
+			   0x0);
+
+	return ret;
+}
+
+static int mt6359_codec_probe(struct snd_soc_component *cmpnt)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
+
+	snd_soc_component_init_regmap(cmpnt, priv->regmap);
+
+	snd_soc_add_component_controls(cmpnt,
+				       mt6359_snd_vow_controls,
+				       ARRAY_SIZE(mt6359_snd_vow_controls));
+
+	mt6359_codec_init_reg(priv);
+
+	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] = 8;
+	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] = 8;
+	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1] = 3;
+	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2] = 3;
+	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP3] = 3;
+
+	priv->avdd_reg = devm_regulator_get(priv->dev, "vaud18");
+	if (IS_ERR(priv->avdd_reg)) {
+		dev_err(priv->dev, "%s(), have no vaud18 supply", __func__);
+		return PTR_ERR(priv->avdd_reg);
+	}
+
+	ret = regulator_enable(priv->avdd_reg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver mt6359_soc_component_driver = {
+	.name = CODEC_MT6359_NAME,
+	.probe = mt6359_codec_probe,
+	.controls = mt6359_snd_controls,
+	.num_controls = ARRAY_SIZE(mt6359_snd_controls),
+	.dapm_widgets = mt6359_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt6359_dapm_widgets),
+	.dapm_routes = mt6359_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt6359_dapm_routes),
+};
+
+static int mt6359_platform_driver_probe(struct platform_device *pdev)
+{
+	struct mt6359_priv *priv;
+	int ret;
+	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
+
+	priv = devm_kzalloc(&pdev->dev,
+			    sizeof(struct mt6359_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = mt6397->regmap;
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	dev_set_drvdata(&pdev->dev, priv);
+	priv->dev = &pdev->dev;
+
+	dev_info(&pdev->dev, "%s(), dev name %s\n",
+		 __func__, dev_name(&pdev->dev));
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &mt6359_soc_component_driver,
+					      mt6359_dai_driver,
+					      ARRAY_SIZE(mt6359_dai_driver));
+
+	dev_info(&pdev->dev, "%s(), ret = %d\n", __func__, ret);
+	return ret;
+}
+
+static const struct of_device_id mt6359_of_match[] = {
+	{.compatible = "mediatek,mt6359-sound",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6359_of_match);
+
+static struct platform_driver mt6359_platform_driver = {
+	.driver = {
+		.name = "mt6359-sound",
+		.of_match_table = mt6359_of_match,
+	},
+	.probe = mt6359_platform_driver_probe,
+};
+
+module_platform_driver(mt6359_platform_driver)
+
+/* Module information */
+MODULE_DESCRIPTION("MT6359 ALSA SoC codec driver");
+MODULE_AUTHOR("KaiChieh Chuang <kaichieh.chuang@mediatek.com>");
+MODULE_AUTHOR("Eason Yen <eason.yen@mediatek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
new file mode 100644
index 0000000..e319d69
--- /dev/null
+++ b/sound/soc/codecs/mt6359.h
@@ -0,0 +1,3212 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ * Author: Argus Lin <argus.lin@mediatek.com>
+ */
+
+#ifndef _MT6359_H_
+#define _MT6359_H_
+
+/*************Register Bit Define*************/
+#define PMIC_ACCDET_IRQ_SHIFT			0
+#define PMIC_ACCDET_EINT0_IRQ_SHIFT		2
+#define PMIC_ACCDET_EINT1_IRQ_SHIFT		3
+#define PMIC_ACCDET_IRQ_CLR_SHIFT		8
+#define PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT		10
+#define PMIC_ACCDET_EINT1_IRQ_CLR_SHIFT		11
+#define PMIC_RG_INT_STATUS_ACCDET_SHIFT		5
+#define PMIC_RG_INT_STATUS_ACCDET_EINT0_SHIFT	6
+#define PMIC_RG_INT_STATUS_ACCDET_EINT1_SHIFT	7
+#define PMIC_RG_EINT0CONFIGACCDET_SHIFT		11
+#define PMIC_RG_EINT1CONFIGACCDET_SHIFT		0
+#define PMIC_ACCDET_EINT0_INVERTER_SW_EN_SHIFT	6
+#define PMIC_ACCDET_EINT1_INVERTER_SW_EN_SHIFT	8
+#define PMIC_RG_MTEST_EN_SHIFT			8
+#define PMIC_RG_MTEST_SEL_SHIFT			9
+#define PMIC_ACCDET_EINT0_M_SW_EN_SHIFT		10
+#define PMIC_ACCDET_EINT1_M_SW_EN_SHIFT		11
+#define PMIC_ACCDET_EINT0_CEN_STABLE_SHIFT	5
+#define PMIC_ACCDET_EINT1_CEN_STABLE_SHIFT	10
+#define PMIC_ACCDET_DA_STABLE_SHIFT		0
+#define PMIC_ACCDET_EINT0_EN_STABLE_SHIFT	1
+#define PMIC_ACCDET_EINT0_CMPEN_STABLE_SHIFT	2
+#define PMIC_ACCDET_EINT1_EN_STABLE_SHIFT	6
+#define PMIC_ACCDET_EINT1_CMPEN_STABLE_SHIFT	7
+#define PMIC_ACCDET_EINT_CTURBO_SEL_SHIFT	7
+#define PMIC_ACCDET_EINT0_CTURBO_SW_SHIFT	7
+#define PMIC_RG_EINTCOMPVTH_SHIFT		4
+#define PMIC_RG_EINT0HIRENB_SHIFT		12
+#define PMIC_RG_EINT0NOHYS_SHIFT		10
+#define PMIC_ACCDET_SW_EN_SHIFT			0
+#define PMIC_ACCDET_EINT0_MEM_IN_SHIFT		6
+#define PMIC_ACCDET_MEM_IN_SHIFT		6
+#define PMIC_ACCDET_EINT_DEBOUNCE0_SHIFT	0
+#define PMIC_ACCDET_EINT_DEBOUNCE1_SHIFT	4
+#define PMIC_ACCDET_EINT_DEBOUNCE2_SHIFT	8
+#define PMIC_ACCDET_EINT_DEBOUNCE3_SHIFT	12
+#define PMIC_RG_ACCDET2AUXSWEN_SHIFT		14
+#define PMIC_AUDACCDETAUXADCSWCTRL_SEL_SHIFT	9
+#define PMIC_AUDACCDETAUXADCSWCTRL_SW_SHIFT	10
+#define PMIC_RG_EINT0CTURBO_SHIFT		5
+#define PMIC_RG_EINT1CTURBO_SHIFT		13
+#define PMIC_ACCDET_EINT_M_PLUG_IN_NUM_SHIFT	12
+#define PMIC_ACCDET_EINT_M_DETECT_EN_SHIFT	12
+#define PMIC_ACCDET_EINT0_SW_EN_SHIFT		2
+#define PMIC_ACCDET_EINT1_SW_EN_SHIFT		4
+#define PMIC_ACCDET_EINT_CMPMOUT_SEL_SHIFT	12
+#define PMIC_ACCDET_EINT_CMPMEN_SEL_SHIFT	6
+#define PMIC_RG_HPLOUTPUTSTBENH_VAUDP32_SHIFT	0
+#define PMIC_RG_HPROUTPUTSTBENH_VAUDP32_SHIFT	4
+#define PMIC_RG_EINT0EN_SHIFT			2
+#define PMIC_RG_EINT1EN_SHIFT			10
+#define PMIC_RG_NCP_PDDIS_EN_SHIFT		0
+#define PMIC_RG_ACCDETSPARE_SHIFT		0
+#define PMIC_RG_ACCDET_RST_SHIFT		1
+#define PMIC_RG_AUDMICBIAS1HVEN_SHIFT		12
+#define PMIC_RG_AUDMICBIAS1VREF_SHIFT		4
+#define PMIC_RG_ANALOGFDEN_SHIFT		12
+#define PMIC_RG_AUDMICBIAS1DCSW1PEN_SHIFT	8
+#define PMIC_RG_AUDMICBIAS1LOWPEN_SHIFT		2
+#define PMIC_ACCDET_SEQ_INIT_SHIFT		1
+
+#define PMIC_RG_EINTCOMPVTH_MASK		0xF
+#define PMIC_ACCDET_EINT0_MEM_IN_MASK		0x3
+#define PMIC_ACCDET_EINT_DEBOUNCE0_MASK		0xF
+#define PMIC_ACCDET_EINT_DEBOUNCE1_MASK		0xF
+#define PMIC_ACCDET_EINT_DEBOUNCE2_MASK		0xF
+#define PMIC_ACCDET_EINT_DEBOUNCE3_MASK		0xF
+
+#define PMIC_ACCDET_EINT0_IRQ_SHIFT		2
+#define PMIC_ACCDET_EINT1_IRQ_SHIFT		3
+/* AUDENC_ANA_CON16: */
+#define RG_AUD_MICBIAS1_LOWP_EN		BIT(PMIC_RG_AUDMICBIAS1LOWPEN_SHIFT)
+
+/* AUDENC_ANA_CON18: */
+#define RG_ACCDET_MODE_ANA11_MODE1		(0x000F)
+#define RG_ACCDET_MODE_ANA11_MODE2		(0x008F)
+#define RG_ACCDET_MODE_ANA11_MODE6		(0x008F)
+
+/* AUXADC_ADC5:  Auxadc CH5 read data */
+#define AUXADC_DATA_RDY_CH5			BIT(15)
+#define AUXADC_DATA_PROCEED_CH5			BIT(15)
+#define AUXADC_DATA_MASK			(0x0FFF)
+
+/* AUXADC_RQST0_SET:  Auxadc CH5 request, relevant 0x07EC */
+#define AUXADC_RQST_CH5_SET			BIT(5)
+/* AUXADC_RQST0_CLR:  Auxadc CH5 request, relevant 0x07EC */
+#define AUXADC_RQST_CH5_CLR			BIT(5)
+
+#define ACCDET_CALI_MASK0			(0xFF)
+#define ACCDET_CALI_MASK1			(0xFF << 8)
+#define ACCDET_CALI_MASK2			(0xFF)
+#define ACCDET_CALI_MASK3			(0xFF << 8)
+#define ACCDET_CALI_MASK4			(0xFF)
+
+#define ACCDET_EINT1_IRQ_CLR_B11	BIT(PMIC_ACCDET_EINT1_IRQ_CLR_SHIFT)
+#define ACCDET_EINT0_IRQ_CLR_B10	BIT(PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT)
+#define ACCDET_EINT_IRQ_CLR_B10_11	(0x03 << \
+					 PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT)
+#define ACCDET_IRQ_CLR_B8		BIT(PMIC_ACCDET_IRQ_CLR_SHIFT)
+
+#define ACCDET_EINT1_IRQ_B3		BIT(PMIC_ACCDET_EINT1_IRQ_SHIFT)
+#define ACCDET_EINT0_IRQ_B2		BIT(PMIC_ACCDET_EINT0_IRQ_SHIFT)
+#define ACCDET_EINT_IRQ_B2_B3		(0x03 << PMIC_ACCDET_EINT0_IRQ_SHIFT)
+#define ACCDET_IRQ_B0			BIT(PMIC_ACCDET_IRQ_SHIFT)
+
+/* ACCDET_CON25: RO, accdet FSM state,etc.*/
+#define ACCDET_STATE_MEM_IN_OFFSET	(PMIC_ACCDET_MEM_IN_SHIFT)
+#define ACCDET_STATE_AB_MASK		(0x03)
+#define ACCDET_STATE_AB_00			(0x00)
+#define ACCDET_STATE_AB_01			(0x01)
+#define ACCDET_STATE_AB_10			(0x02)
+#define ACCDET_STATE_AB_11			(0x03)
+
+/* ACCDET_CON19 */
+#define ACCDET_EINT0_STABLE_VAL ((1 << PMIC_ACCDET_DA_STABLE_SHIFT) | \
+				(1 << PMIC_ACCDET_EINT0_EN_STABLE_SHIFT) | \
+				(1 << PMIC_ACCDET_EINT0_CMPEN_STABLE_SHIFT) | \
+				(1 << PMIC_ACCDET_EINT0_CEN_STABLE_SHIFT))
+
+#define ACCDET_EINT1_STABLE_VAL ((1 << PMIC_ACCDET_DA_STABLE_SHIFT) | \
+				(1 << PMIC_ACCDET_EINT1_EN_STABLE_SHIFT) | \
+				(1 << PMIC_ACCDET_EINT1_CMPEN_STABLE_SHIFT) | \
+				(1 << PMIC_ACCDET_EINT1_CEN_STABLE_SHIFT))
+
+/* The following are used for mt6359.c */
+/* MT6359_DCXO_CW12 */
+#define RG_XO_AUDIO_EN_M_SFT 13
+
+/* MT6359_DCXO_CW11 */
+#define RG_XO_VOW_EN_SFT 9
+
+/* LDO_VAUD18_CON0 */
+#define RG_LDO_VAUD18_EN_SFT                        0
+#define RG_LDO_VAUD18_EN_MASK                       0x1
+#define RG_LDO_VAUD18_EN_MASK_SFT                   (0x1 << 0)
+
+/* AUD_TOP_CKPDN_CON0 */
+#define RG_VOW13M_CK_PDN_SFT                        13
+#define RG_VOW13M_CK_PDN_MASK                       0x1
+#define RG_VOW13M_CK_PDN_MASK_SFT                   (0x1 << 13)
+#define RG_VOW32K_CK_PDN_SFT                        12
+#define RG_VOW32K_CK_PDN_MASK                       0x1
+#define RG_VOW32K_CK_PDN_MASK_SFT                   (0x1 << 12)
+#define RG_AUD_INTRP_CK_PDN_SFT                     8
+#define RG_AUD_INTRP_CK_PDN_MASK                    0x1
+#define RG_AUD_INTRP_CK_PDN_MASK_SFT                (0x1 << 8)
+#define RG_PAD_AUD_CLK_MISO_CK_PDN_SFT              7
+#define RG_PAD_AUD_CLK_MISO_CK_PDN_MASK             0x1
+#define RG_PAD_AUD_CLK_MISO_CK_PDN_MASK_SFT         (0x1 << 7)
+#define RG_AUDNCP_CK_PDN_SFT                        6
+#define RG_AUDNCP_CK_PDN_MASK                       0x1
+#define RG_AUDNCP_CK_PDN_MASK_SFT                   (0x1 << 6)
+#define RG_ZCD13M_CK_PDN_SFT                        5
+#define RG_ZCD13M_CK_PDN_MASK                       0x1
+#define RG_ZCD13M_CK_PDN_MASK_SFT                   (0x1 << 5)
+#define RG_AUDIF_CK_PDN_SFT                         2
+#define RG_AUDIF_CK_PDN_MASK                        0x1
+#define RG_AUDIF_CK_PDN_MASK_SFT                    (0x1 << 2)
+#define RG_AUD_CK_PDN_SFT                           1
+#define RG_AUD_CK_PDN_MASK                          0x1
+#define RG_AUD_CK_PDN_MASK_SFT                      (0x1 << 1)
+#define RG_ACCDET_CK_PDN_SFT                        0
+#define RG_ACCDET_CK_PDN_MASK                       0x1
+#define RG_ACCDET_CK_PDN_MASK_SFT                   (0x1 << 0)
+
+/* AUD_TOP_CKPDN_CON0_SET */
+#define RG_AUD_TOP_CKPDN_CON0_SET_SFT               0
+#define RG_AUD_TOP_CKPDN_CON0_SET_MASK              0x3fff
+#define RG_AUD_TOP_CKPDN_CON0_SET_MASK_SFT          (0x3fff << 0)
+
+/* AUD_TOP_CKPDN_CON0_CLR */
+#define RG_AUD_TOP_CKPDN_CON0_CLR_SFT               0
+#define RG_AUD_TOP_CKPDN_CON0_CLR_MASK              0x3fff
+#define RG_AUD_TOP_CKPDN_CON0_CLR_MASK_SFT          (0x3fff << 0)
+
+/* AUD_TOP_CKSEL_CON0 */
+#define RG_AUDIF_CK_CKSEL_SFT                       3
+#define RG_AUDIF_CK_CKSEL_MASK                      0x1
+#define RG_AUDIF_CK_CKSEL_MASK_SFT                  (0x1 << 3)
+#define RG_AUD_CK_CKSEL_SFT                         2
+#define RG_AUD_CK_CKSEL_MASK                        0x1
+#define RG_AUD_CK_CKSEL_MASK_SFT                    (0x1 << 2)
+
+/* AUD_TOP_CKSEL_CON0_SET */
+#define RG_AUD_TOP_CKSEL_CON0_SET_SFT               0
+#define RG_AUD_TOP_CKSEL_CON0_SET_MASK              0xf
+#define RG_AUD_TOP_CKSEL_CON0_SET_MASK_SFT          (0xf << 0)
+
+/* AUD_TOP_CKSEL_CON0_CLR */
+#define RG_AUD_TOP_CKSEL_CON0_CLR_SFT               0
+#define RG_AUD_TOP_CKSEL_CON0_CLR_MASK              0xf
+#define RG_AUD_TOP_CKSEL_CON0_CLR_MASK_SFT          (0xf << 0)
+
+/* AUD_TOP_CKTST_CON0 */
+#define RG_VOW13M_CK_TSTSEL_SFT                     9
+#define RG_VOW13M_CK_TSTSEL_MASK                    0x1
+#define RG_VOW13M_CK_TSTSEL_MASK_SFT                (0x1 << 9)
+#define RG_VOW13M_CK_TST_DIS_SFT                    8
+#define RG_VOW13M_CK_TST_DIS_MASK                   0x1
+#define RG_VOW13M_CK_TST_DIS_MASK_SFT               (0x1 << 8)
+#define RG_AUD26M_CK_TSTSEL_SFT                     4
+#define RG_AUD26M_CK_TSTSEL_MASK                    0x1
+#define RG_AUD26M_CK_TSTSEL_MASK_SFT                (0x1 << 4)
+#define RG_AUDIF_CK_TSTSEL_SFT                      3
+#define RG_AUDIF_CK_TSTSEL_MASK                     0x1
+#define RG_AUDIF_CK_TSTSEL_MASK_SFT                 (0x1 << 3)
+#define RG_AUD_CK_TSTSEL_SFT                        2
+#define RG_AUD_CK_TSTSEL_MASK                       0x1
+#define RG_AUD_CK_TSTSEL_MASK_SFT                   (0x1 << 2)
+#define RG_AUD26M_CK_TST_DIS_SFT                    0
+#define RG_AUD26M_CK_TST_DIS_MASK                   0x1
+#define RG_AUD26M_CK_TST_DIS_MASK_SFT               (0x1 << 0)
+
+/* AUD_TOP_CLK_HWEN_CON0 */
+#define RG_AUD_INTRP_CK_PDN_HWEN_SFT                0
+#define RG_AUD_INTRP_CK_PDN_HWEN_MASK               0x1
+#define RG_AUD_INTRP_CK_PDN_HWEN_MASK_SFT           (0x1 << 0)
+
+/* AUD_TOP_CLK_HWEN_CON0_SET */
+#define RG_AUD_INTRP_CK_PND_HWEN_CON0_SET_SFT       0
+#define RG_AUD_INTRP_CK_PND_HWEN_CON0_SET_MASK      0xffff
+#define RG_AUD_INTRP_CK_PND_HWEN_CON0_SET_MASK_SFT  (0xffff << 0)
+
+/* AUD_TOP_CLK_HWEN_CON0_CLR */
+#define RG_AUD_INTRP_CLK_PDN_HWEN_CON0_CLR_SFT      0
+#define RG_AUD_INTRP_CLK_PDN_HWEN_CON0_CLR_MASK     0xffff
+#define RG_AUD_INTRP_CLK_PDN_HWEN_CON0_CLR_MASK_SFT (0xffff << 0)
+
+/* AUD_TOP_RST_CON0 */
+#define RG_AUDNCP_RST_SFT                           3
+#define RG_AUDNCP_RST_MASK                          0x1
+#define RG_AUDNCP_RST_MASK_SFT                      (0x1 << 3)
+#define RG_ZCD_RST_SFT                              2
+#define RG_ZCD_RST_MASK                             0x1
+#define RG_ZCD_RST_MASK_SFT                         (0x1 << 2)
+#define RG_ACCDET_RST_SFT                           1
+#define RG_ACCDET_RST_MASK                          0x1
+#define RG_ACCDET_RST_MASK_SFT                      (0x1 << 1)
+#define RG_AUDIO_RST_SFT                            0
+#define RG_AUDIO_RST_MASK                           0x1
+#define RG_AUDIO_RST_MASK_SFT                       (0x1 << 0)
+
+/* AUD_TOP_RST_CON0_SET */
+#define RG_AUD_TOP_RST_CON0_SET_SFT                 0
+#define RG_AUD_TOP_RST_CON0_SET_MASK                0xf
+#define RG_AUD_TOP_RST_CON0_SET_MASK_SFT            (0xf << 0)
+
+/* AUD_TOP_RST_CON0_CLR */
+#define RG_AUD_TOP_RST_CON0_CLR_SFT                 0
+#define RG_AUD_TOP_RST_CON0_CLR_MASK                0xf
+#define RG_AUD_TOP_RST_CON0_CLR_MASK_SFT            (0xf << 0)
+
+/* AUD_TOP_RST_BANK_CON0 */
+#define BANK_AUDZCD_SWRST_SFT                       2
+#define BANK_AUDZCD_SWRST_MASK                      0x1
+#define BANK_AUDZCD_SWRST_MASK_SFT                  (0x1 << 2)
+#define BANK_AUDIO_SWRST_SFT                        1
+#define BANK_AUDIO_SWRST_MASK                       0x1
+#define BANK_AUDIO_SWRST_MASK_SFT                   (0x1 << 1)
+#define BANK_ACCDET_SWRST_SFT                       0
+#define BANK_ACCDET_SWRST_MASK                      0x1
+#define BANK_ACCDET_SWRST_MASK_SFT                  (0x1 << 0)
+
+/* AFE_UL_DL_CON0 */
+#define AFE_UL_LR_SWAP_SFT                               15
+#define AFE_UL_LR_SWAP_MASK                              0x1
+#define AFE_UL_LR_SWAP_MASK_SFT                          (0x1 << 15)
+#define AFE_DL_LR_SWAP_SFT                               14
+#define AFE_DL_LR_SWAP_MASK                              0x1
+#define AFE_DL_LR_SWAP_MASK_SFT                          (0x1 << 14)
+#define AFE_ON_SFT                                       0
+#define AFE_ON_MASK                                      0x1
+#define AFE_ON_MASK_SFT                                  (0x1 << 0)
+
+/* AFE_DL_SRC2_CON0_L */
+#define DL_2_SRC_ON_TMP_CTL_PRE_SFT                      0
+#define DL_2_SRC_ON_TMP_CTL_PRE_MASK                     0x1
+#define DL_2_SRC_ON_TMP_CTL_PRE_MASK_SFT                 (0x1 << 0)
+
+/* AFE_UL_SRC_CON0_H */
+#define C_DIGMIC_PHASE_SEL_CH1_CTL_SFT                   11
+#define C_DIGMIC_PHASE_SEL_CH1_CTL_MASK                  0x7
+#define C_DIGMIC_PHASE_SEL_CH1_CTL_MASK_SFT              (0x7 << 11)
+#define C_DIGMIC_PHASE_SEL_CH2_CTL_SFT                   8
+#define C_DIGMIC_PHASE_SEL_CH2_CTL_MASK                  0x7
+#define C_DIGMIC_PHASE_SEL_CH2_CTL_MASK_SFT              (0x7 << 8)
+#define C_TWO_DIGITAL_MIC_CTL_SFT                        7
+#define C_TWO_DIGITAL_MIC_CTL_MASK                       0x1
+#define C_TWO_DIGITAL_MIC_CTL_MASK_SFT                   (0x1 << 7)
+
+/* AFE_UL_SRC_CON0_L */
+#define DMIC_LOW_POWER_MODE_CTL_SFT                      14
+#define DMIC_LOW_POWER_MODE_CTL_MASK                     0x3
+#define DMIC_LOW_POWER_MODE_CTL_MASK_SFT                 (0x3 << 14)
+#define DIGMIC_4P33M_SEL_CTL_SFT                         6
+#define DIGMIC_4P33M_SEL_CTL_MASK                        0x1
+#define DIGMIC_4P33M_SEL_CTL_MASK_SFT                    (0x1 << 6)
+#define DIGMIC_3P25M_1P625M_SEL_CTL_SFT                  5
+#define DIGMIC_3P25M_1P625M_SEL_CTL_MASK                 0x1
+#define DIGMIC_3P25M_1P625M_SEL_CTL_MASK_SFT             (0x1 << 5)
+#define UL_LOOP_BACK_MODE_CTL_SFT                        2
+#define UL_LOOP_BACK_MODE_CTL_MASK                       0x1
+#define UL_LOOP_BACK_MODE_CTL_MASK_SFT                   (0x1 << 2)
+#define UL_SDM_3_LEVEL_CTL_SFT                           1
+#define UL_SDM_3_LEVEL_CTL_MASK                          0x1
+#define UL_SDM_3_LEVEL_CTL_MASK_SFT                      (0x1 << 1)
+#define UL_SRC_ON_TMP_CTL_SFT                            0
+#define UL_SRC_ON_TMP_CTL_MASK                           0x1
+#define UL_SRC_ON_TMP_CTL_MASK_SFT                       (0x1 << 0)
+
+/* AFE_ADDA6_L_SRC_CON0_H */
+#define ADDA6_C_DIGMIC_PHASE_SEL_CH1_CTL_SFT             11
+#define ADDA6_C_DIGMIC_PHASE_SEL_CH1_CTL_MASK            0x7
+#define ADDA6_C_DIGMIC_PHASE_SEL_CH1_CTL_MASK_SFT        (0x7 << 11)
+#define ADDA6_C_DIGMIC_PHASE_SEL_CH2_CTL_SFT             8
+#define ADDA6_C_DIGMIC_PHASE_SEL_CH2_CTL_MASK            0x7
+#define ADDA6_C_DIGMIC_PHASE_SEL_CH2_CTL_MASK_SFT        (0x7 << 8)
+#define ADDA6_C_TWO_DIGITAL_MIC_CTL_SFT                  7
+#define ADDA6_C_TWO_DIGITAL_MIC_CTL_MASK                 0x1
+#define ADDA6_C_TWO_DIGITAL_MIC_CTL_MASK_SFT             (0x1 << 7)
+
+/* AFE_ADDA6_UL_SRC_CON0_L */
+#define ADDA6_DMIC_LOW_POWER_MODE_CTL_SFT                14
+#define ADDA6_DMIC_LOW_POWER_MODE_CTL_MASK               0x3
+#define ADDA6_DMIC_LOW_POWER_MODE_CTL_MASK_SFT           (0x3 << 14)
+#define ADDA6_DIGMIC_4P33M_SEL_CTL_SFT                   6
+#define ADDA6_DIGMIC_4P33M_SEL_CTL_MASK                  0x1
+#define ADDA6_DIGMIC_4P33M_SEL_CTL_MASK_SFT              (0x1 << 6)
+#define ADDA6_DIGMIC_3P25M_1P625M_SEL_CTL_SFT            5
+#define ADDA6_DIGMIC_3P25M_1P625M_SEL_CTL_MASK           0x1
+#define ADDA6_DIGMIC_3P25M_1P625M_SEL_CTL_MASK_SFT       (0x1 << 5)
+#define ADDA6_UL_LOOP_BACK_MODE_CTL_SFT                  2
+#define ADDA6_UL_LOOP_BACK_MODE_CTL_MASK                 0x1
+#define ADDA6_UL_LOOP_BACK_MODE_CTL_MASK_SFT             (0x1 << 2)
+#define ADDA6_UL_SDM_3_LEVEL_CTL_SFT                     1
+#define ADDA6_UL_SDM_3_LEVEL_CTL_MASK                    0x1
+#define ADDA6_UL_SDM_3_LEVEL_CTL_MASK_SFT                (0x1 << 1)
+#define ADDA6_UL_SRC_ON_TMP_CTL_SFT                      0
+#define ADDA6_UL_SRC_ON_TMP_CTL_MASK                     0x1
+#define ADDA6_UL_SRC_ON_TMP_CTL_MASK_SFT                 (0x1 << 0)
+
+/* AFE_TOP_CON0 */
+#define ADDA6_MTKAIF_SINE_ON_SFT                         4
+#define ADDA6_MTKAIF_SINE_ON_MASK                        0x1
+#define ADDA6_MTKAIF_SINE_ON_MASK_SFT                    (0x1 << 4)
+#define ADDA6_UL_SINE_ON_SFT                             3
+#define ADDA6_UL_SINE_ON_MASK                            0x1
+#define ADDA6_UL_SINE_ON_MASK_SFT                        (0x1 << 3)
+#define MTKAIF_SINE_ON_SFT                               2
+#define MTKAIF_SINE_ON_MASK                              0x1
+#define MTKAIF_SINE_ON_MASK_SFT                          (0x1 << 2)
+#define UL_SINE_ON_SFT                                   1
+#define UL_SINE_ON_MASK                                  0x1
+#define UL_SINE_ON_MASK_SFT                              (0x1 << 1)
+#define DL_SINE_ON_SFT                                   0
+#define DL_SINE_ON_MASK                                  0x1
+#define DL_SINE_ON_MASK_SFT                              (0x1 << 0)
+
+/* AUDIO_TOP_CON0 */
+#define PDN_AFE_CTL_SFT                                  7
+#define PDN_AFE_CTL_MASK                                 0x1
+#define PDN_AFE_CTL_MASK_SFT                             (0x1 << 7)
+#define PDN_DAC_CTL_SFT                                  6
+#define PDN_DAC_CTL_MASK                                 0x1
+#define PDN_DAC_CTL_MASK_SFT                             (0x1 << 6)
+#define PDN_ADC_CTL_SFT                                  5
+#define PDN_ADC_CTL_MASK                                 0x1
+#define PDN_ADC_CTL_MASK_SFT                             (0x1 << 5)
+#define PDN_ADDA6_ADC_CTL_SFT                            4
+#define PDN_ADDA6_ADC_CTL_MASK                           0x1
+#define PDN_ADDA6_ADC_CTL_MASK_SFT                       (0x1 << 4)
+#define PDN_I2S_DL_CTL_SFT                               3
+#define PDN_I2S_DL_CTL_MASK                              0x1
+#define PDN_I2S_DL_CTL_MASK_SFT                          (0x1 << 3)
+#define PWR_CLK_DIS_CTL_SFT                              2
+#define PWR_CLK_DIS_CTL_MASK                             0x1
+#define PWR_CLK_DIS_CTL_MASK_SFT                         (0x1 << 2)
+#define PDN_AFE_TESTMODEL_CTL_SFT                        1
+#define PDN_AFE_TESTMODEL_CTL_MASK                       0x1
+#define PDN_AFE_TESTMODEL_CTL_MASK_SFT                   (0x1 << 1)
+#define PDN_RESERVED_SFT                                 0
+#define PDN_RESERVED_MASK                                0x1
+#define PDN_RESERVED_MASK_SFT                            (0x1 << 0)
+
+/* AFE_MON_DEBUG0 */
+#define AUDIO_SYS_TOP_MON_SWAP_SFT                       14
+#define AUDIO_SYS_TOP_MON_SWAP_MASK                      0x3
+#define AUDIO_SYS_TOP_MON_SWAP_MASK_SFT                  (0x3 << 14)
+#define AUDIO_SYS_TOP_MON_SEL_SFT                        8
+#define AUDIO_SYS_TOP_MON_SEL_MASK                       0x1f
+#define AUDIO_SYS_TOP_MON_SEL_MASK_SFT                   (0x1f << 8)
+#define AFE_MON_SEL_SFT                                  0
+#define AFE_MON_SEL_MASK                                 0xff
+#define AFE_MON_SEL_MASK_SFT                             (0xff << 0)
+
+/* AFUNC_AUD_CON0 */
+#define CCI_AUD_ANACK_SEL_SFT                            15
+#define CCI_AUD_ANACK_SEL_MASK                           0x1
+#define CCI_AUD_ANACK_SEL_MASK_SFT                       (0x1 << 15)
+#define CCI_AUDIO_FIFO_WPTR_SFT                          12
+#define CCI_AUDIO_FIFO_WPTR_MASK                         0x7
+#define CCI_AUDIO_FIFO_WPTR_MASK_SFT                     (0x7 << 12)
+#define CCI_SCRAMBLER_CG_EN_SFT                          11
+#define CCI_SCRAMBLER_CG_EN_MASK                         0x1
+#define CCI_SCRAMBLER_CG_EN_MASK_SFT                     (0x1 << 11)
+#define CCI_LCH_INV_SFT                                  10
+#define CCI_LCH_INV_MASK                                 0x1
+#define CCI_LCH_INV_MASK_SFT                             (0x1 << 10)
+#define CCI_RAND_EN_SFT                                  9
+#define CCI_RAND_EN_MASK                                 0x1
+#define CCI_RAND_EN_MASK_SFT                             (0x1 << 9)
+#define CCI_SPLT_SCRMB_CLK_ON_SFT                        8
+#define CCI_SPLT_SCRMB_CLK_ON_MASK                       0x1
+#define CCI_SPLT_SCRMB_CLK_ON_MASK_SFT                   (0x1 << 8)
+#define CCI_SPLT_SCRMB_ON_SFT                            7
+#define CCI_SPLT_SCRMB_ON_MASK                           0x1
+#define CCI_SPLT_SCRMB_ON_MASK_SFT                       (0x1 << 7)
+#define CCI_AUD_IDAC_TEST_EN_SFT                         6
+#define CCI_AUD_IDAC_TEST_EN_MASK                        0x1
+#define CCI_AUD_IDAC_TEST_EN_MASK_SFT                    (0x1 << 6)
+#define CCI_ZERO_PAD_DISABLE_SFT                         5
+#define CCI_ZERO_PAD_DISABLE_MASK                        0x1
+#define CCI_ZERO_PAD_DISABLE_MASK_SFT                    (0x1 << 5)
+#define CCI_AUD_SPLIT_TEST_EN_SFT                        4
+#define CCI_AUD_SPLIT_TEST_EN_MASK                       0x1
+#define CCI_AUD_SPLIT_TEST_EN_MASK_SFT                   (0x1 << 4)
+#define CCI_AUD_SDM_MUTEL_SFT                            3
+#define CCI_AUD_SDM_MUTEL_MASK                           0x1
+#define CCI_AUD_SDM_MUTEL_MASK_SFT                       (0x1 << 3)
+#define CCI_AUD_SDM_MUTER_SFT                            2
+#define CCI_AUD_SDM_MUTER_MASK                           0x1
+#define CCI_AUD_SDM_MUTER_MASK_SFT                       (0x1 << 2)
+#define CCI_AUD_SDM_7BIT_SEL_SFT                         1
+#define CCI_AUD_SDM_7BIT_SEL_MASK                        0x1
+#define CCI_AUD_SDM_7BIT_SEL_MASK_SFT                    (0x1 << 1)
+#define CCI_SCRAMBLER_EN_SFT                             0
+#define CCI_SCRAMBLER_EN_MASK                            0x1
+#define CCI_SCRAMBLER_EN_MASK_SFT                        (0x1 << 0)
+
+/* AFUNC_AUD_CON1 */
+#define AUD_SDM_TEST_L_SFT                               8
+#define AUD_SDM_TEST_L_MASK                              0xff
+#define AUD_SDM_TEST_L_MASK_SFT                          (0xff << 8)
+#define AUD_SDM_TEST_R_SFT                               0
+#define AUD_SDM_TEST_R_MASK                              0xff
+#define AUD_SDM_TEST_R_MASK_SFT                          (0xff << 0)
+
+/* AFUNC_AUD_CON2 */
+#define CCI_AUD_DAC_ANA_MUTE_SFT                         7
+#define CCI_AUD_DAC_ANA_MUTE_MASK                        0x1
+#define CCI_AUD_DAC_ANA_MUTE_MASK_SFT                    (0x1 << 7)
+#define CCI_AUD_DAC_ANA_RSTB_SEL_SFT                     6
+#define CCI_AUD_DAC_ANA_RSTB_SEL_MASK                    0x1
+#define CCI_AUD_DAC_ANA_RSTB_SEL_MASK_SFT                (0x1 << 6)
+#define CCI_AUDIO_FIFO_CLKIN_INV_SFT                     4
+#define CCI_AUDIO_FIFO_CLKIN_INV_MASK                    0x1
+#define CCI_AUDIO_FIFO_CLKIN_INV_MASK_SFT                (0x1 << 4)
+#define CCI_AUDIO_FIFO_ENABLE_SFT                        3
+#define CCI_AUDIO_FIFO_ENABLE_MASK                       0x1
+#define CCI_AUDIO_FIFO_ENABLE_MASK_SFT                   (0x1 << 3)
+#define CCI_ACD_MODE_SFT                                 2
+#define CCI_ACD_MODE_MASK                                0x1
+#define CCI_ACD_MODE_MASK_SFT                            (0x1 << 2)
+#define CCI_AFIFO_CLK_PWDB_SFT                           1
+#define CCI_AFIFO_CLK_PWDB_MASK                          0x1
+#define CCI_AFIFO_CLK_PWDB_MASK_SFT                      (0x1 << 1)
+#define CCI_ACD_FUNC_RSTB_SFT                            0
+#define CCI_ACD_FUNC_RSTB_MASK                           0x1
+#define CCI_ACD_FUNC_RSTB_MASK_SFT                       (0x1 << 0)
+
+/* AFUNC_AUD_CON3 */
+#define SDM_ANA13M_TESTCK_SEL_SFT                        15
+#define SDM_ANA13M_TESTCK_SEL_MASK                       0x1
+#define SDM_ANA13M_TESTCK_SEL_MASK_SFT                   (0x1 << 15)
+#define SDM_ANA13M_TESTCK_SRC_SEL_SFT                    12
+#define SDM_ANA13M_TESTCK_SRC_SEL_MASK                   0x7
+#define SDM_ANA13M_TESTCK_SRC_SEL_MASK_SFT               (0x7 << 12)
+#define SDM_TESTCK_SRC_SEL_SFT                           8
+#define SDM_TESTCK_SRC_SEL_MASK                          0x7
+#define SDM_TESTCK_SRC_SEL_MASK_SFT                      (0x7 << 8)
+#define DIGMIC_TESTCK_SRC_SEL_SFT                        4
+#define DIGMIC_TESTCK_SRC_SEL_MASK                       0x7
+#define DIGMIC_TESTCK_SRC_SEL_MASK_SFT                   (0x7 << 4)
+#define DIGMIC_TESTCK_SEL_SFT                            0
+#define DIGMIC_TESTCK_SEL_MASK                           0x1
+#define DIGMIC_TESTCK_SEL_MASK_SFT                       (0x1 << 0)
+
+/* AFUNC_AUD_CON4 */
+#define UL_FIFO_WCLK_INV_SFT                             8
+#define UL_FIFO_WCLK_INV_MASK                            0x1
+#define UL_FIFO_WCLK_INV_MASK_SFT                        (0x1 << 8)
+#define UL_FIFO_DIGMIC_WDATA_TESTSRC_SEL_SFT             6
+#define UL_FIFO_DIGMIC_WDATA_TESTSRC_SEL_MASK            0x1
+#define UL_FIFO_DIGMIC_WDATA_TESTSRC_SEL_MASK_SFT        (0x1 << 6)
+#define UL_FIFO_WDATA_TESTEN_SFT                         5
+#define UL_FIFO_WDATA_TESTEN_MASK                        0x1
+#define UL_FIFO_WDATA_TESTEN_MASK_SFT                    (0x1 << 5)
+#define UL_FIFO_WDATA_TESTSRC_SEL_SFT                    4
+#define UL_FIFO_WDATA_TESTSRC_SEL_MASK                   0x1
+#define UL_FIFO_WDATA_TESTSRC_SEL_MASK_SFT               (0x1 << 4)
+#define UL_FIFO_WCLK_6P5M_TESTCK_SEL_SFT                 3
+#define UL_FIFO_WCLK_6P5M_TESTCK_SEL_MASK                0x1
+#define UL_FIFO_WCLK_6P5M_TESTCK_SEL_MASK_SFT            (0x1 << 3)
+#define UL_FIFO_WCLK_6P5M_TESTCK_SRC_SEL_SFT             0
+#define UL_FIFO_WCLK_6P5M_TESTCK_SRC_SEL_MASK            0x7
+#define UL_FIFO_WCLK_6P5M_TESTCK_SRC_SEL_MASK_SFT        (0x7 << 0)
+
+/* AFUNC_AUD_CON5 */
+#define R_AUD_DAC_POS_LARGE_MONO_SFT                     8
+#define R_AUD_DAC_POS_LARGE_MONO_MASK                    0xff
+#define R_AUD_DAC_POS_LARGE_MONO_MASK_SFT                (0xff << 8)
+#define R_AUD_DAC_NEG_LARGE_MONO_SFT                     0
+#define R_AUD_DAC_NEG_LARGE_MONO_MASK                    0xff
+#define R_AUD_DAC_NEG_LARGE_MONO_MASK_SFT                (0xff << 0)
+
+/* AFUNC_AUD_CON6 */
+#define R_AUD_DAC_POS_SMALL_MONO_SFT                     12
+#define R_AUD_DAC_POS_SMALL_MONO_MASK                    0xf
+#define R_AUD_DAC_POS_SMALL_MONO_MASK_SFT                (0xf << 12)
+#define R_AUD_DAC_NEG_SMALL_MONO_SFT                     8
+#define R_AUD_DAC_NEG_SMALL_MONO_MASK                    0xf
+#define R_AUD_DAC_NEG_SMALL_MONO_MASK_SFT                (0xf << 8)
+#define R_AUD_DAC_POS_TINY_MONO_SFT                      6
+#define R_AUD_DAC_POS_TINY_MONO_MASK                     0x3
+#define R_AUD_DAC_POS_TINY_MONO_MASK_SFT                 (0x3 << 6)
+#define R_AUD_DAC_NEG_TINY_MONO_SFT                      4
+#define R_AUD_DAC_NEG_TINY_MONO_MASK                     0x3
+#define R_AUD_DAC_NEG_TINY_MONO_MASK_SFT                 (0x3 << 4)
+#define R_AUD_DAC_MONO_SEL_SFT                           3
+#define R_AUD_DAC_MONO_SEL_MASK                          0x1
+#define R_AUD_DAC_MONO_SEL_MASK_SFT                      (0x1 << 3)
+#define R_AUD_DAC_3TH_SEL_SFT                            1
+#define R_AUD_DAC_3TH_SEL_MASK                           0x1
+#define R_AUD_DAC_3TH_SEL_MASK_SFT                       (0x1 << 1)
+#define R_AUD_DAC_SW_RSTB_SFT                            0
+#define R_AUD_DAC_SW_RSTB_MASK                           0x1
+#define R_AUD_DAC_SW_RSTB_MASK_SFT                       (0x1 << 0)
+
+/* AFUNC_AUD_CON7 */
+#define UL2_DIGMIC_TESTCK_SRC_SEL_SFT                    10
+#define UL2_DIGMIC_TESTCK_SRC_SEL_MASK                   0x7
+#define UL2_DIGMIC_TESTCK_SRC_SEL_MASK_SFT               (0x7 << 10)
+#define UL2_DIGMIC_TESTCK_SEL_SFT                        9
+#define UL2_DIGMIC_TESTCK_SEL_MASK                       0x1
+#define UL2_DIGMIC_TESTCK_SEL_MASK_SFT                   (0x1 << 9)
+#define UL2_FIFO_WCLK_INV_SFT                            8
+#define UL2_FIFO_WCLK_INV_MASK                           0x1
+#define UL2_FIFO_WCLK_INV_MASK_SFT                       (0x1 << 8)
+#define UL2_FIFO_DIGMIC_WDATA_TESTSRC_SEL_SFT            6
+#define UL2_FIFO_DIGMIC_WDATA_TESTSRC_SEL_MASK           0x1
+#define UL2_FIFO_DIGMIC_WDATA_TESTSRC_SEL_MASK_SFT       (0x1 << 6)
+#define UL2_FIFO_WDATA_TESTEN_SFT                        5
+#define UL2_FIFO_WDATA_TESTEN_MASK                       0x1
+#define UL2_FIFO_WDATA_TESTEN_MASK_SFT                   (0x1 << 5)
+#define UL2_FIFO_WDATA_TESTSRC_SEL_SFT                   4
+#define UL2_FIFO_WDATA_TESTSRC_SEL_MASK                  0x1
+#define UL2_FIFO_WDATA_TESTSRC_SEL_MASK_SFT              (0x1 << 4)
+#define UL2_FIFO_WCLK_6P5M_TESTCK_SEL_SFT                3
+#define UL2_FIFO_WCLK_6P5M_TESTCK_SEL_MASK               0x1
+#define UL2_FIFO_WCLK_6P5M_TESTCK_SEL_MASK_SFT           (0x1 << 3)
+#define UL2_FIFO_WCLK_6P5M_TESTCK_SRC_SEL_SFT            0
+#define UL2_FIFO_WCLK_6P5M_TESTCK_SRC_SEL_MASK           0x7
+#define UL2_FIFO_WCLK_6P5M_TESTCK_SRC_SEL_MASK_SFT       (0x7 << 0)
+
+/* AFUNC_AUD_CON8 */
+#define SPLITTER2_DITHER_EN_SFT                          9
+#define SPLITTER2_DITHER_EN_MASK                         0x1
+#define SPLITTER2_DITHER_EN_MASK_SFT                     (0x1 << 9)
+#define SPLITTER1_DITHER_EN_SFT                          8
+#define SPLITTER1_DITHER_EN_MASK                         0x1
+#define SPLITTER1_DITHER_EN_MASK_SFT                     (0x1 << 8)
+#define SPLITTER2_DITHER_GAIN_SFT                        4
+#define SPLITTER2_DITHER_GAIN_MASK                       0xf
+#define SPLITTER2_DITHER_GAIN_MASK_SFT                   (0xf << 4)
+#define SPLITTER1_DITHER_GAIN_SFT                        0
+#define SPLITTER1_DITHER_GAIN_MASK                       0xf
+#define SPLITTER1_DITHER_GAIN_MASK_SFT                   (0xf << 0)
+
+/* AFUNC_AUD_CON9 */
+#define CCI_AUD_ANACK_SEL_2ND_SFT                        15
+#define CCI_AUD_ANACK_SEL_2ND_MASK                       0x1
+#define CCI_AUD_ANACK_SEL_2ND_MASK_SFT                   (0x1 << 15)
+#define CCI_AUDIO_FIFO_WPTR_2ND_SFT                      12
+#define CCI_AUDIO_FIFO_WPTR_2ND_MASK                     0x7
+#define CCI_AUDIO_FIFO_WPTR_2ND_MASK_SFT                 (0x7 << 12)
+#define CCI_SCRAMBLER_CG_EN_2ND_SFT                      11
+#define CCI_SCRAMBLER_CG_EN_2ND_MASK                     0x1
+#define CCI_SCRAMBLER_CG_EN_2ND_MASK_SFT                 (0x1 << 11)
+#define CCI_LCH_INV_2ND_SFT                              10
+#define CCI_LCH_INV_2ND_MASK                             0x1
+#define CCI_LCH_INV_2ND_MASK_SFT                         (0x1 << 10)
+#define CCI_RAND_EN_2ND_SFT                              9
+#define CCI_RAND_EN_2ND_MASK                             0x1
+#define CCI_RAND_EN_2ND_MASK_SFT                         (0x1 << 9)
+#define CCI_SPLT_SCRMB_CLK_ON_2ND_SFT                    8
+#define CCI_SPLT_SCRMB_CLK_ON_2ND_MASK                   0x1
+#define CCI_SPLT_SCRMB_CLK_ON_2ND_MASK_SFT               (0x1 << 8)
+#define CCI_SPLT_SCRMB_ON_2ND_SFT                        7
+#define CCI_SPLT_SCRMB_ON_2ND_MASK                       0x1
+#define CCI_SPLT_SCRMB_ON_2ND_MASK_SFT                   (0x1 << 7)
+#define CCI_AUD_IDAC_TEST_EN_2ND_SFT                     6
+#define CCI_AUD_IDAC_TEST_EN_2ND_MASK                    0x1
+#define CCI_AUD_IDAC_TEST_EN_2ND_MASK_SFT                (0x1 << 6)
+#define CCI_ZERO_PAD_DISABLE_2ND_SFT                     5
+#define CCI_ZERO_PAD_DISABLE_2ND_MASK                    0x1
+#define CCI_ZERO_PAD_DISABLE_2ND_MASK_SFT                (0x1 << 5)
+#define CCI_AUD_SPLIT_TEST_EN_2ND_SFT                    4
+#define CCI_AUD_SPLIT_TEST_EN_2ND_MASK                   0x1
+#define CCI_AUD_SPLIT_TEST_EN_2ND_MASK_SFT               (0x1 << 4)
+#define CCI_AUD_SDM_MUTEL_2ND_SFT                        3
+#define CCI_AUD_SDM_MUTEL_2ND_MASK                       0x1
+#define CCI_AUD_SDM_MUTEL_2ND_MASK_SFT                   (0x1 << 3)
+#define CCI_AUD_SDM_MUTER_2ND_SFT                        2
+#define CCI_AUD_SDM_MUTER_2ND_MASK                       0x1
+#define CCI_AUD_SDM_MUTER_2ND_MASK_SFT                   (0x1 << 2)
+#define CCI_AUD_SDM_7BIT_SEL_2ND_SFT                     1
+#define CCI_AUD_SDM_7BIT_SEL_2ND_MASK                    0x1
+#define CCI_AUD_SDM_7BIT_SEL_2ND_MASK_SFT                (0x1 << 1)
+#define CCI_SCRAMBLER_EN_2ND_SFT                         0
+#define CCI_SCRAMBLER_EN_2ND_MASK                        0x1
+#define CCI_SCRAMBLER_EN_2ND_MASK_SFT                    (0x1 << 0)
+
+/* AFUNC_AUD_CON10 */
+#define AUD_SDM_TEST_L_2ND_SFT                           8
+#define AUD_SDM_TEST_L_2ND_MASK                          0xff
+#define AUD_SDM_TEST_L_2ND_MASK_SFT                      (0xff << 8)
+#define AUD_SDM_TEST_R_2ND_SFT                           0
+#define AUD_SDM_TEST_R_2ND_MASK                          0xff
+#define AUD_SDM_TEST_R_2ND_MASK_SFT                      (0xff << 0)
+
+/* AFUNC_AUD_CON11 */
+#define CCI_AUD_DAC_ANA_MUTE_2ND_SFT                     7
+#define CCI_AUD_DAC_ANA_MUTE_2ND_MASK                    0x1
+#define CCI_AUD_DAC_ANA_MUTE_2ND_MASK_SFT                (0x1 << 7)
+#define CCI_AUD_DAC_ANA_RSTB_SEL_2ND_SFT                 6
+#define CCI_AUD_DAC_ANA_RSTB_SEL_2ND_MASK                0x1
+#define CCI_AUD_DAC_ANA_RSTB_SEL_2ND_MASK_SFT            (0x1 << 6)
+#define CCI_AUDIO_FIFO_CLKIN_INV_2ND_SFT                 4
+#define CCI_AUDIO_FIFO_CLKIN_INV_2ND_MASK                0x1
+#define CCI_AUDIO_FIFO_CLKIN_INV_2ND_MASK_SFT            (0x1 << 4)
+#define CCI_AUDIO_FIFO_ENABLE_2ND_SFT                    3
+#define CCI_AUDIO_FIFO_ENABLE_2ND_MASK                   0x1
+#define CCI_AUDIO_FIFO_ENABLE_2ND_MASK_SFT               (0x1 << 3)
+#define CCI_ACD_MODE_2ND_SFT                             2
+#define CCI_ACD_MODE_2ND_MASK                            0x1
+#define CCI_ACD_MODE_2ND_MASK_SFT                        (0x1 << 2)
+#define CCI_AFIFO_CLK_PWDB_2ND_SFT                       1
+#define CCI_AFIFO_CLK_PWDB_2ND_MASK                      0x1
+#define CCI_AFIFO_CLK_PWDB_2ND_MASK_SFT                  (0x1 << 1)
+#define CCI_ACD_FUNC_RSTB_2ND_SFT                        0
+#define CCI_ACD_FUNC_RSTB_2ND_MASK                       0x1
+#define CCI_ACD_FUNC_RSTB_2ND_MASK_SFT                   (0x1 << 0)
+
+/* AFUNC_AUD_CON12 */
+#define SPLITTER2_DITHER_EN_2ND_SFT                      9
+#define SPLITTER2_DITHER_EN_2ND_MASK                     0x1
+#define SPLITTER2_DITHER_EN_2ND_MASK_SFT                 (0x1 << 9)
+#define SPLITTER1_DITHER_EN_2ND_SFT                      8
+#define SPLITTER1_DITHER_EN_2ND_MASK                     0x1
+#define SPLITTER1_DITHER_EN_2ND_MASK_SFT                 (0x1 << 8)
+#define SPLITTER2_DITHER_GAIN_2ND_SFT                    4
+#define SPLITTER2_DITHER_GAIN_2ND_MASK                   0xf
+#define SPLITTER2_DITHER_GAIN_2ND_MASK_SFT               (0xf << 4)
+#define SPLITTER1_DITHER_GAIN_2ND_SFT                    0
+#define SPLITTER1_DITHER_GAIN_2ND_MASK                   0xf
+#define SPLITTER1_DITHER_GAIN_2ND_MASK_SFT               (0xf << 0)
+
+/* AFUNC_AUD_MON0 */
+#define AUD_SCR_OUT_L_SFT                                8
+#define AUD_SCR_OUT_L_MASK                               0xff
+#define AUD_SCR_OUT_L_MASK_SFT                           (0xff << 8)
+#define AUD_SCR_OUT_R_SFT                                0
+#define AUD_SCR_OUT_R_MASK                               0xff
+#define AUD_SCR_OUT_R_MASK_SFT                           (0xff << 0)
+
+/* AFUNC_AUD_MON1 */
+#define AUD_SCR_OUT_L_2ND_SFT                            8
+#define AUD_SCR_OUT_L_2ND_MASK                           0xff
+#define AUD_SCR_OUT_L_2ND_MASK_SFT                       (0xff << 8)
+#define AUD_SCR_OUT_R_2ND_SFT                            0
+#define AUD_SCR_OUT_R_2ND_MASK                           0xff
+#define AUD_SCR_OUT_R_2ND_MASK_SFT                       (0xff << 0)
+
+/* AUDRC_TUNE_MON0 */
+#define ASYNC_TEST_OUT_BCK_SFT                           15
+#define ASYNC_TEST_OUT_BCK_MASK                          0x1
+#define ASYNC_TEST_OUT_BCK_MASK_SFT                      (0x1 << 15)
+#define RGS_AUDRCTUNE1READ_SFT                           8
+#define RGS_AUDRCTUNE1READ_MASK                          0x1f
+#define RGS_AUDRCTUNE1READ_MASK_SFT                      (0x1f << 8)
+#define RGS_AUDRCTUNE0READ_SFT                           0
+#define RGS_AUDRCTUNE0READ_MASK                          0x1f
+#define RGS_AUDRCTUNE0READ_MASK_SFT                      (0x1f << 0)
+
+/* AFE_ADDA_MTKAIF_FIFO_CFG0 */
+#define AFE_RESERVED_SFT                                 1
+#define AFE_RESERVED_MASK                                0x7fff
+#define AFE_RESERVED_MASK_SFT                            (0x7fff << 1)
+#define RG_MTKAIF_RXIF_FIFO_INTEN_SFT                    0
+#define RG_MTKAIF_RXIF_FIFO_INTEN_MASK                   0x1
+#define RG_MTKAIF_RXIF_FIFO_INTEN_MASK_SFT               (0x1 << 0)
+
+/* AFE_ADDA_MTKAIF_FIFO_LOG_MON1 */
+#define MTKAIF_RXIF_WR_FULL_STATUS_SFT                   1
+#define MTKAIF_RXIF_WR_FULL_STATUS_MASK                  0x1
+#define MTKAIF_RXIF_WR_FULL_STATUS_MASK_SFT              (0x1 << 1)
+#define MTKAIF_RXIF_RD_EMPTY_STATUS_SFT                  0
+#define MTKAIF_RXIF_RD_EMPTY_STATUS_MASK                 0x1
+#define MTKAIF_RXIF_RD_EMPTY_STATUS_MASK_SFT             (0x1 << 0)
+
+/* AFE_ADDA_MTKAIF_MON0 */
+#define MTKAIFTX_V3_SYNC_OUT_SFT                         15
+#define MTKAIFTX_V3_SYNC_OUT_MASK                        0x1
+#define MTKAIFTX_V3_SYNC_OUT_MASK_SFT                    (0x1 << 15)
+#define MTKAIFTX_V3_SDATA_OUT3_SFT                       14
+#define MTKAIFTX_V3_SDATA_OUT3_MASK                      0x1
+#define MTKAIFTX_V3_SDATA_OUT3_MASK_SFT                  (0x1 << 14)
+#define MTKAIFTX_V3_SDATA_OUT2_SFT                       13
+#define MTKAIFTX_V3_SDATA_OUT2_MASK                      0x1
+#define MTKAIFTX_V3_SDATA_OUT2_MASK_SFT                  (0x1 << 13)
+#define MTKAIFTX_V3_SDATA_OUT1_SFT                       12
+#define MTKAIFTX_V3_SDATA_OUT1_MASK                      0x1
+#define MTKAIFTX_V3_SDATA_OUT1_MASK_SFT                  (0x1 << 12)
+#define MTKAIF_RXIF_FIFO_STATUS_SFT                      0
+#define MTKAIF_RXIF_FIFO_STATUS_MASK                     0xfff
+#define MTKAIF_RXIF_FIFO_STATUS_MASK_SFT                 (0xfff << 0)
+
+/* AFE_ADDA_MTKAIF_MON1 */
+#define MTKAIFRX_V3_SYNC_IN_SFT                          15
+#define MTKAIFRX_V3_SYNC_IN_MASK                         0x1
+#define MTKAIFRX_V3_SYNC_IN_MASK_SFT                     (0x1 << 15)
+#define MTKAIFRX_V3_SDATA_IN3_SFT                        14
+#define MTKAIFRX_V3_SDATA_IN3_MASK                       0x1
+#define MTKAIFRX_V3_SDATA_IN3_MASK_SFT                   (0x1 << 14)
+#define MTKAIFRX_V3_SDATA_IN2_SFT                        13
+#define MTKAIFRX_V3_SDATA_IN2_MASK                       0x1
+#define MTKAIFRX_V3_SDATA_IN2_MASK_SFT                   (0x1 << 13)
+#define MTKAIFRX_V3_SDATA_IN1_SFT                        12
+#define MTKAIFRX_V3_SDATA_IN1_MASK                       0x1
+#define MTKAIFRX_V3_SDATA_IN1_MASK_SFT                   (0x1 << 12)
+#define MTKAIF_RXIF_SEARCH_FAIL_FLAG_SFT                 11
+#define MTKAIF_RXIF_SEARCH_FAIL_FLAG_MASK                0x1
+#define MTKAIF_RXIF_SEARCH_FAIL_FLAG_MASK_SFT            (0x1 << 11)
+#define MTKAIF_RXIF_INVALID_FLAG_SFT                     8
+#define MTKAIF_RXIF_INVALID_FLAG_MASK                    0x1
+#define MTKAIF_RXIF_INVALID_FLAG_MASK_SFT                (0x1 << 8)
+#define MTKAIF_RXIF_INVALID_CYCLE_SFT                    0
+#define MTKAIF_RXIF_INVALID_CYCLE_MASK                   0xff
+#define MTKAIF_RXIF_INVALID_CYCLE_MASK_SFT               (0xff << 0)
+
+/* AFE_ADDA_MTKAIF_MON2 */
+#define MTKAIF_TXIF_IN_CH2_SFT                           8
+#define MTKAIF_TXIF_IN_CH2_MASK                          0xff
+#define MTKAIF_TXIF_IN_CH2_MASK_SFT                      (0xff << 8)
+#define MTKAIF_TXIF_IN_CH1_SFT                           0
+#define MTKAIF_TXIF_IN_CH1_MASK                          0xff
+#define MTKAIF_TXIF_IN_CH1_MASK_SFT                      (0xff << 0)
+
+/* AFE_ADDA6_MTKAIF_MON3 */
+#define ADDA6_MTKAIF_TXIF_IN_CH2_SFT                     8
+#define ADDA6_MTKAIF_TXIF_IN_CH2_MASK                    0xff
+#define ADDA6_MTKAIF_TXIF_IN_CH2_MASK_SFT                (0xff << 8)
+#define ADDA6_MTKAIF_TXIF_IN_CH1_SFT                     0
+#define ADDA6_MTKAIF_TXIF_IN_CH1_MASK                    0xff
+#define ADDA6_MTKAIF_TXIF_IN_CH1_MASK_SFT                (0xff << 0)
+
+/* AFE_ADDA_MTKAIF_MON4 */
+#define MTKAIF_RXIF_OUT_CH2_SFT                          8
+#define MTKAIF_RXIF_OUT_CH2_MASK                         0xff
+#define MTKAIF_RXIF_OUT_CH2_MASK_SFT                     (0xff << 8)
+#define MTKAIF_RXIF_OUT_CH1_SFT                          0
+#define MTKAIF_RXIF_OUT_CH1_MASK                         0xff
+#define MTKAIF_RXIF_OUT_CH1_MASK_SFT                     (0xff << 0)
+
+/* AFE_ADDA_MTKAIF_MON5 */
+#define MTKAIF_RXIF_OUT_CH3_SFT                          0
+#define MTKAIF_RXIF_OUT_CH3_MASK                         0xff
+#define MTKAIF_RXIF_OUT_CH3_MASK_SFT                     (0xff << 0)
+
+/* AFE_ADDA_MTKAIF_CFG0 */
+#define RG_MTKAIF_RXIF_CLKINV_SFT                        15
+#define RG_MTKAIF_RXIF_CLKINV_MASK                       0x1
+#define RG_MTKAIF_RXIF_CLKINV_MASK_SFT                   (0x1 << 15)
+#define RG_ADDA6_MTKAIF_TXIF_PROTOCOL2_SFT               9
+#define RG_ADDA6_MTKAIF_TXIF_PROTOCOL2_MASK              0x1
+#define RG_ADDA6_MTKAIF_TXIF_PROTOCOL2_MASK_SFT          (0x1 << 9)
+#define RG_MTKAIF_RXIF_PROTOCOL2_SFT                     8
+#define RG_MTKAIF_RXIF_PROTOCOL2_MASK                    0x1
+#define RG_MTKAIF_RXIF_PROTOCOL2_MASK_SFT                (0x1 << 8)
+#define RG_MTKAIF_BYPASS_SRC_MODE_SFT                    6
+#define RG_MTKAIF_BYPASS_SRC_MODE_MASK                   0x3
+#define RG_MTKAIF_BYPASS_SRC_MODE_MASK_SFT               (0x3 << 6)
+#define RG_MTKAIF_BYPASS_SRC_TEST_SFT                    5
+#define RG_MTKAIF_BYPASS_SRC_TEST_MASK                   0x1
+#define RG_MTKAIF_BYPASS_SRC_TEST_MASK_SFT               (0x1 << 5)
+#define RG_MTKAIF_TXIF_PROTOCOL2_SFT                     4
+#define RG_MTKAIF_TXIF_PROTOCOL2_MASK                    0x1
+#define RG_MTKAIF_TXIF_PROTOCOL2_MASK_SFT                (0x1 << 4)
+#define RG_ADDA6_MTKAIF_PMIC_TXIF_8TO5_SFT               3
+#define RG_ADDA6_MTKAIF_PMIC_TXIF_8TO5_MASK              0x1
+#define RG_ADDA6_MTKAIF_PMIC_TXIF_8TO5_MASK_SFT          (0x1 << 3)
+#define RG_MTKAIF_PMIC_TXIF_8TO5_SFT                     2
+#define RG_MTKAIF_PMIC_TXIF_8TO5_MASK                    0x1
+#define RG_MTKAIF_PMIC_TXIF_8TO5_MASK_SFT                (0x1 << 2)
+#define RG_MTKAIF_LOOPBACK_TEST2_SFT                     1
+#define RG_MTKAIF_LOOPBACK_TEST2_MASK                    0x1
+#define RG_MTKAIF_LOOPBACK_TEST2_MASK_SFT                (0x1 << 1)
+#define RG_MTKAIF_LOOPBACK_TEST1_SFT                     0
+#define RG_MTKAIF_LOOPBACK_TEST1_MASK                    0x1
+#define RG_MTKAIF_LOOPBACK_TEST1_MASK_SFT                (0x1 << 0)
+
+/* AFE_ADDA_MTKAIF_RX_CFG0 */
+#define RG_MTKAIF_RXIF_VOICE_MODE_SFT                    12
+#define RG_MTKAIF_RXIF_VOICE_MODE_MASK                   0xf
+#define RG_MTKAIF_RXIF_VOICE_MODE_MASK_SFT               (0xf << 12)
+#define RG_MTKAIF_RXIF_DATA_BIT_SFT                      8
+#define RG_MTKAIF_RXIF_DATA_BIT_MASK                     0x7
+#define RG_MTKAIF_RXIF_DATA_BIT_MASK_SFT                 (0x7 << 8)
+#define RG_MTKAIF_RXIF_FIFO_RSP_SFT                      4
+#define RG_MTKAIF_RXIF_FIFO_RSP_MASK                     0x7
+#define RG_MTKAIF_RXIF_FIFO_RSP_MASK_SFT                 (0x7 << 4)
+#define RG_MTKAIF_RXIF_DETECT_ON_SFT                     3
+#define RG_MTKAIF_RXIF_DETECT_ON_MASK                    0x1
+#define RG_MTKAIF_RXIF_DETECT_ON_MASK_SFT                (0x1 << 3)
+#define RG_MTKAIF_RXIF_DATA_MODE_SFT                     0
+#define RG_MTKAIF_RXIF_DATA_MODE_MASK                    0x1
+#define RG_MTKAIF_RXIF_DATA_MODE_MASK_SFT                (0x1 << 0)
+
+/* AFE_ADDA_MTKAIF_RX_CFG1 */
+#define RG_MTKAIF_RXIF_SYNC_SEARCH_TABLE_SFT             12
+#define RG_MTKAIF_RXIF_SYNC_SEARCH_TABLE_MASK            0xf
+#define RG_MTKAIF_RXIF_SYNC_SEARCH_TABLE_MASK_SFT        (0xf << 12)
+#define RG_MTKAIF_RXIF_INVALID_SYNC_CHECK_ROUND_SFT      8
+#define RG_MTKAIF_RXIF_INVALID_SYNC_CHECK_ROUND_MASK     0xf
+#define RG_MTKAIF_RXIF_INVALID_SYNC_CHECK_ROUND_MASK_SFT (0xf << 8)
+#define RG_MTKAIF_RXIF_SYNC_CHECK_ROUND_SFT              4
+#define RG_MTKAIF_RXIF_SYNC_CHECK_ROUND_MASK             0xf
+#define RG_MTKAIF_RXIF_SYNC_CHECK_ROUND_MASK_SFT         (0xf << 4)
+#define RG_MTKAIF_RXIF_VOICE_MODE_PROTOCOL2_SFT          0
+#define RG_MTKAIF_RXIF_VOICE_MODE_PROTOCOL2_MASK         0xf
+#define RG_MTKAIF_RXIF_VOICE_MODE_PROTOCOL2_MASK_SFT     (0xf << 0)
+
+/* AFE_ADDA_MTKAIF_RX_CFG2 */
+#define RG_MTKAIF_RXIF_P2_INPUT_SEL_SFT                  15
+#define RG_MTKAIF_RXIF_P2_INPUT_SEL_MASK                 0x1
+#define RG_MTKAIF_RXIF_P2_INPUT_SEL_MASK_SFT             (0x1 << 15)
+#define RG_MTKAIF_RXIF_SYNC_WORD2_DISABLE_SFT            14
+#define RG_MTKAIF_RXIF_SYNC_WORD2_DISABLE_MASK           0x1
+#define RG_MTKAIF_RXIF_SYNC_WORD2_DISABLE_MASK_SFT       (0x1 << 14)
+#define RG_MTKAIF_RXIF_SYNC_WORD1_DISABLE_SFT            13
+#define RG_MTKAIF_RXIF_SYNC_WORD1_DISABLE_MASK           0x1
+#define RG_MTKAIF_RXIF_SYNC_WORD1_DISABLE_MASK_SFT       (0x1 << 13)
+#define RG_MTKAIF_RXIF_CLEAR_SYNC_FAIL_SFT               12
+#define RG_MTKAIF_RXIF_CLEAR_SYNC_FAIL_MASK              0x1
+#define RG_MTKAIF_RXIF_CLEAR_SYNC_FAIL_MASK_SFT          (0x1 << 12)
+#define RG_MTKAIF_RXIF_SYNC_CNT_TABLE_SFT                0
+#define RG_MTKAIF_RXIF_SYNC_CNT_TABLE_MASK               0xfff
+#define RG_MTKAIF_RXIF_SYNC_CNT_TABLE_MASK_SFT           (0xfff << 0)
+
+/* AFE_ADDA_MTKAIF_RX_CFG3 */
+#define RG_MTKAIF_RXIF_LOOPBACK_USE_NLE_SFT              7
+#define RG_MTKAIF_RXIF_LOOPBACK_USE_NLE_MASK             0x1
+#define RG_MTKAIF_RXIF_LOOPBACK_USE_NLE_MASK_SFT         (0x1 << 7)
+#define RG_MTKAIF_RXIF_FIFO_RSP_PROTOCOL2_SFT            4
+#define RG_MTKAIF_RXIF_FIFO_RSP_PROTOCOL2_MASK           0x7
+#define RG_MTKAIF_RXIF_FIFO_RSP_PROTOCOL2_MASK_SFT       (0x7 << 4)
+#define RG_MTKAIF_RXIF_DETECT_ON_PROTOCOL2_SFT           3
+#define RG_MTKAIF_RXIF_DETECT_ON_PROTOCOL2_MASK          0x1
+#define RG_MTKAIF_RXIF_DETECT_ON_PROTOCOL2_MASK_SFT      (0x1 << 3)
+
+/* AFE_ADDA_MTKAIF_SYNCWORD_CFG0 */
+#define RG_MTKAIF_RX_SYNC_WORD2_SFT                      4
+#define RG_MTKAIF_RX_SYNC_WORD2_MASK                     0x7
+#define RG_MTKAIF_RX_SYNC_WORD2_MASK_SFT                 (0x7 << 4)
+#define RG_MTKAIF_RX_SYNC_WORD1_SFT                      0
+#define RG_MTKAIF_RX_SYNC_WORD1_MASK                     0x7
+#define RG_MTKAIF_RX_SYNC_WORD1_MASK_SFT                 (0x7 << 0)
+
+/* AFE_ADDA_MTKAIF_SYNCWORD_CFG1 */
+#define RG_ADDA6_MTKAIF_TX_SYNC_WORD2_SFT                12
+#define RG_ADDA6_MTKAIF_TX_SYNC_WORD2_MASK               0x7
+#define RG_ADDA6_MTKAIF_TX_SYNC_WORD2_MASK_SFT           (0x7 << 12)
+#define RG_ADDA6_MTKAIF_TX_SYNC_WORD1_SFT                8
+#define RG_ADDA6_MTKAIF_TX_SYNC_WORD1_MASK               0x7
+#define RG_ADDA6_MTKAIF_TX_SYNC_WORD1_MASK_SFT           (0x7 << 8)
+#define RG_ADDA_MTKAIF_TX_SYNC_WORD2_SFT                 4
+#define RG_ADDA_MTKAIF_TX_SYNC_WORD2_MASK                0x7
+#define RG_ADDA_MTKAIF_TX_SYNC_WORD2_MASK_SFT            (0x7 << 4)
+#define RG_ADDA_MTKAIF_TX_SYNC_WORD1_SFT                 0
+#define RG_ADDA_MTKAIF_TX_SYNC_WORD1_MASK                0x7
+#define RG_ADDA_MTKAIF_TX_SYNC_WORD1_MASK_SFT            (0x7 << 0)
+
+/* AFE_SGEN_CFG0 */
+#define SGEN_AMP_DIV_CH1_CTL_SFT                         12
+#define SGEN_AMP_DIV_CH1_CTL_MASK                        0xf
+#define SGEN_AMP_DIV_CH1_CTL_MASK_SFT                    (0xf << 12)
+#define SGEN_DAC_EN_CTL_SFT                              7
+#define SGEN_DAC_EN_CTL_MASK                             0x1
+#define SGEN_DAC_EN_CTL_MASK_SFT                         (0x1 << 7)
+#define SGEN_MUTE_SW_CTL_SFT                             6
+#define SGEN_MUTE_SW_CTL_MASK                            0x1
+#define SGEN_MUTE_SW_CTL_MASK_SFT                        (0x1 << 6)
+#define R_AUD_SDM_MUTE_L_SFT                             5
+#define R_AUD_SDM_MUTE_L_MASK                            0x1
+#define R_AUD_SDM_MUTE_L_MASK_SFT                        (0x1 << 5)
+#define R_AUD_SDM_MUTE_R_SFT                             4
+#define R_AUD_SDM_MUTE_R_MASK                            0x1
+#define R_AUD_SDM_MUTE_R_MASK_SFT                        (0x1 << 4)
+#define R_AUD_SDM_MUTE_L_2ND_SFT                         3
+#define R_AUD_SDM_MUTE_L_2ND_MASK                        0x1
+#define R_AUD_SDM_MUTE_L_2ND_MASK_SFT                    (0x1 << 3)
+#define R_AUD_SDM_MUTE_R_2ND_SFT                         2
+#define R_AUD_SDM_MUTE_R_2ND_MASK                        0x1
+#define R_AUD_SDM_MUTE_R_2ND_MASK_SFT                    (0x1 << 2)
+
+/* AFE_SGEN_CFG1 */
+#define C_SGEN_RCH_INV_5BIT_SFT                          15
+#define C_SGEN_RCH_INV_5BIT_MASK                         0x1
+#define C_SGEN_RCH_INV_5BIT_MASK_SFT                     (0x1 << 15)
+#define C_SGEN_RCH_INV_8BIT_SFT                          14
+#define C_SGEN_RCH_INV_8BIT_MASK                         0x1
+#define C_SGEN_RCH_INV_8BIT_MASK_SFT                     (0x1 << 14)
+#define SGEN_FREQ_DIV_CH1_CTL_SFT                        0
+#define SGEN_FREQ_DIV_CH1_CTL_MASK                       0x1f
+#define SGEN_FREQ_DIV_CH1_CTL_MASK_SFT                   (0x1f << 0)
+
+/* AFE_ADC_ASYNC_FIFO_CFG */
+#define RG_UL_ASYNC_FIFO_SOFT_RST_EN_SFT                 5
+#define RG_UL_ASYNC_FIFO_SOFT_RST_EN_MASK                0x1
+#define RG_UL_ASYNC_FIFO_SOFT_RST_EN_MASK_SFT            (0x1 << 5)
+#define RG_UL_ASYNC_FIFO_SOFT_RST_SFT                    4
+#define RG_UL_ASYNC_FIFO_SOFT_RST_MASK                   0x1
+#define RG_UL_ASYNC_FIFO_SOFT_RST_MASK_SFT               (0x1 << 4)
+#define RG_AMIC_UL_ADC_CLK_SEL_SFT                       1
+#define RG_AMIC_UL_ADC_CLK_SEL_MASK                      0x1
+#define RG_AMIC_UL_ADC_CLK_SEL_MASK_SFT                  (0x1 << 1)
+
+/* AFE_ADC_ASYNC_FIFO_CFG1 */
+#define RG_UL2_ASYNC_FIFO_SOFT_RST_EN_SFT                5
+#define RG_UL2_ASYNC_FIFO_SOFT_RST_EN_MASK               0x1
+#define RG_UL2_ASYNC_FIFO_SOFT_RST_EN_MASK_SFT           (0x1 << 5)
+#define RG_UL2_ASYNC_FIFO_SOFT_RST_SFT                   4
+#define RG_UL2_ASYNC_FIFO_SOFT_RST_MASK                  0x1
+#define RG_UL2_ASYNC_FIFO_SOFT_RST_MASK_SFT              (0x1 << 4)
+
+/* AFE_DCCLK_CFG0 */
+#define DCCLK_DIV_SFT                                    5
+#define DCCLK_DIV_MASK                                   0x7ff
+#define DCCLK_DIV_MASK_SFT                               (0x7ff << 5)
+#define DCCLK_INV_SFT                                    4
+#define DCCLK_INV_MASK                                   0x1
+#define DCCLK_INV_MASK_SFT                               (0x1 << 4)
+#define DCCLK_REF_CK_SEL_SFT                             2
+#define DCCLK_REF_CK_SEL_MASK                            0x3
+#define DCCLK_REF_CK_SEL_MASK_SFT                        (0x3 << 2)
+#define DCCLK_PDN_SFT                                    1
+#define DCCLK_PDN_MASK                                   0x1
+#define DCCLK_PDN_MASK_SFT                               (0x1 << 1)
+#define DCCLK_GEN_ON_SFT                                 0
+#define DCCLK_GEN_ON_MASK                                0x1
+#define DCCLK_GEN_ON_MASK_SFT                            (0x1 << 0)
+
+/* AFE_DCCLK_CFG1 */
+#define RESYNC_SRC_SEL_SFT                               10
+#define RESYNC_SRC_SEL_MASK                              0x3
+#define RESYNC_SRC_SEL_MASK_SFT                          (0x3 << 10)
+#define RESYNC_SRC_CK_INV_SFT                            9
+#define RESYNC_SRC_CK_INV_MASK                           0x1
+#define RESYNC_SRC_CK_INV_MASK_SFT                       (0x1 << 9)
+#define DCCLK_RESYNC_BYPASS_SFT                          8
+#define DCCLK_RESYNC_BYPASS_MASK                         0x1
+#define DCCLK_RESYNC_BYPASS_MASK_SFT                     (0x1 << 8)
+#define DCCLK_PHASE_SEL_SFT                              4
+#define DCCLK_PHASE_SEL_MASK                             0xf
+#define DCCLK_PHASE_SEL_MASK_SFT                         (0xf << 4)
+
+/* AUDIO_DIG_CFG */
+#define RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_SFT            15
+#define RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK           0x1
+#define RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK_SFT       (0x1 << 15)
+#define RG_AUD_PAD_TOP_PHASE_MODE2_SFT                   8
+#define RG_AUD_PAD_TOP_PHASE_MODE2_MASK                  0x7f
+#define RG_AUD_PAD_TOP_PHASE_MODE2_MASK_SFT              (0x7f << 8)
+#define RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT             7
+#define RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK            0x1
+#define RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK_SFT        (0x1 << 7)
+#define RG_AUD_PAD_TOP_PHASE_MODE_SFT                    0
+#define RG_AUD_PAD_TOP_PHASE_MODE_MASK                   0x7f
+#define RG_AUD_PAD_TOP_PHASE_MODE_MASK_SFT               (0x7f << 0)
+
+/* AUDIO_DIG_CFG1 */
+#define RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_SFT            7
+#define RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_MASK           0x1
+#define RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_MASK_SFT       (0x1 << 7)
+#define RG_AUD_PAD_TOP_PHASE_MODE3_SFT                   0
+#define RG_AUD_PAD_TOP_PHASE_MODE3_MASK                  0x7f
+#define RG_AUD_PAD_TOP_PHASE_MODE3_MASK_SFT              (0x7f << 0)
+
+/* AFE_AUD_PAD_TOP */
+#define RG_AUD_PAD_TOP_TX_FIFO_RSP_SFT                   12
+#define RG_AUD_PAD_TOP_TX_FIFO_RSP_MASK                  0x7
+#define RG_AUD_PAD_TOP_TX_FIFO_RSP_MASK_SFT              (0x7 << 12)
+#define RG_AUD_PAD_TOP_MTKAIF_CLK_PROTOCOL2_SFT          11
+#define RG_AUD_PAD_TOP_MTKAIF_CLK_PROTOCOL2_MASK         0x1
+#define RG_AUD_PAD_TOP_MTKAIF_CLK_PROTOCOL2_MASK_SFT     (0x1 << 11)
+#define RG_AUD_PAD_TOP_TX_FIFO_ON_SFT                    8
+#define RG_AUD_PAD_TOP_TX_FIFO_ON_MASK                   0x1
+#define RG_AUD_PAD_TOP_TX_FIFO_ON_MASK_SFT               (0x1 << 8)
+
+/* AFE_AUD_PAD_TOP_MON */
+#define ADDA_AUD_PAD_TOP_MON_SFT                         0
+#define ADDA_AUD_PAD_TOP_MON_MASK                        0xffff
+#define ADDA_AUD_PAD_TOP_MON_MASK_SFT                    (0xffff << 0)
+
+/* AFE_AUD_PAD_TOP_MON1 */
+#define ADDA_AUD_PAD_TOP_MON1_SFT                        0
+#define ADDA_AUD_PAD_TOP_MON1_MASK                       0xffff
+#define ADDA_AUD_PAD_TOP_MON1_MASK_SFT                   (0xffff << 0)
+
+/* AFE_AUD_PAD_TOP_MON2 */
+#define ADDA_AUD_PAD_TOP_MON2_SFT                        0
+#define ADDA_AUD_PAD_TOP_MON2_MASK                       0xffff
+#define ADDA_AUD_PAD_TOP_MON2_MASK_SFT                   (0xffff << 0)
+
+/* AFE_DL_NLE_CFG */
+#define NLE_RCH_HPGAIN_SEL_SFT                           10
+#define NLE_RCH_HPGAIN_SEL_MASK                          0x1
+#define NLE_RCH_HPGAIN_SEL_MASK_SFT                      (0x1 << 10)
+#define NLE_RCH_CH_SEL_SFT                               9
+#define NLE_RCH_CH_SEL_MASK                              0x1
+#define NLE_RCH_CH_SEL_MASK_SFT                          (0x1 << 9)
+#define NLE_RCH_ON_SFT                                   8
+#define NLE_RCH_ON_MASK                                  0x1
+#define NLE_RCH_ON_MASK_SFT                              (0x1 << 8)
+#define NLE_LCH_HPGAIN_SEL_SFT                           2
+#define NLE_LCH_HPGAIN_SEL_MASK                          0x1
+#define NLE_LCH_HPGAIN_SEL_MASK_SFT                      (0x1 << 2)
+#define NLE_LCH_CH_SEL_SFT                               1
+#define NLE_LCH_CH_SEL_MASK                              0x1
+#define NLE_LCH_CH_SEL_MASK_SFT                          (0x1 << 1)
+#define NLE_LCH_ON_SFT                                   0
+#define NLE_LCH_ON_MASK                                  0x1
+#define NLE_LCH_ON_MASK_SFT                              (0x1 << 0)
+
+/* AFE_DL_NLE_MON */
+#define NLE_MONITOR_SFT                                  0
+#define NLE_MONITOR_MASK                                 0x3fff
+#define NLE_MONITOR_MASK_SFT                             (0x3fff << 0)
+
+/* AFE_CG_EN_MON */
+#define CK_CG_EN_MON_SFT                                 0
+#define CK_CG_EN_MON_MASK                                0x3f
+#define CK_CG_EN_MON_MASK_SFT                            (0x3f << 0)
+
+/* AFE_MIC_ARRAY_CFG */
+#define RG_AMIC_ADC1_SOURCE_SEL_SFT                      10
+#define RG_AMIC_ADC1_SOURCE_SEL_MASK                     0x3
+#define RG_AMIC_ADC1_SOURCE_SEL_MASK_SFT                 (0x3 << 10)
+#define RG_AMIC_ADC2_SOURCE_SEL_SFT                      8
+#define RG_AMIC_ADC2_SOURCE_SEL_MASK                     0x3
+#define RG_AMIC_ADC2_SOURCE_SEL_MASK_SFT                 (0x3 << 8)
+#define RG_AMIC_ADC3_SOURCE_SEL_SFT                      6
+#define RG_AMIC_ADC3_SOURCE_SEL_MASK                     0x3
+#define RG_AMIC_ADC3_SOURCE_SEL_MASK_SFT                 (0x3 << 6)
+#define RG_DMIC_ADC1_SOURCE_SEL_SFT                      4
+#define RG_DMIC_ADC1_SOURCE_SEL_MASK                     0x3
+#define RG_DMIC_ADC1_SOURCE_SEL_MASK_SFT                 (0x3 << 4)
+#define RG_DMIC_ADC2_SOURCE_SEL_SFT                      2
+#define RG_DMIC_ADC2_SOURCE_SEL_MASK                     0x3
+#define RG_DMIC_ADC2_SOURCE_SEL_MASK_SFT                 (0x3 << 2)
+#define RG_DMIC_ADC3_SOURCE_SEL_SFT                      0
+#define RG_DMIC_ADC3_SOURCE_SEL_MASK                     0x3
+#define RG_DMIC_ADC3_SOURCE_SEL_MASK_SFT                 (0x3 << 0)
+
+/* AFE_CHOP_CFG0 */
+#define RG_CHOP_DIV_SEL_SFT                              4
+#define RG_CHOP_DIV_SEL_MASK                             0x1f
+#define RG_CHOP_DIV_SEL_MASK_SFT                         (0x1f << 4)
+#define RG_CHOP_DIV_EN_SFT                               0
+#define RG_CHOP_DIV_EN_MASK                              0x1
+#define RG_CHOP_DIV_EN_MASK_SFT                          (0x1 << 0)
+
+/* AFE_MTKAIF_MUX_CFG */
+#define RG_ADDA6_EN_SEL_SFT                              12
+#define RG_ADDA6_EN_SEL_MASK                             0x1
+#define RG_ADDA6_EN_SEL_MASK_SFT                         (0x1 << 12)
+#define RG_ADDA6_CH2_SEL_SFT                             10
+#define RG_ADDA6_CH2_SEL_MASK                            0x3
+#define RG_ADDA6_CH2_SEL_MASK_SFT                        (0x3 << 10)
+#define RG_ADDA6_CH1_SEL_SFT                             8
+#define RG_ADDA6_CH1_SEL_MASK                            0x3
+#define RG_ADDA6_CH1_SEL_MASK_SFT                        (0x3 << 8)
+#define RG_ADDA_EN_SEL_SFT                               4
+#define RG_ADDA_EN_SEL_MASK                              0x1
+#define RG_ADDA_EN_SEL_MASK_SFT                          (0x1 << 4)
+#define RG_ADDA_CH2_SEL_SFT                              2
+#define RG_ADDA_CH2_SEL_MASK                             0x3
+#define RG_ADDA_CH2_SEL_MASK_SFT                         (0x3 << 2)
+#define RG_ADDA_CH1_SEL_SFT                              0
+#define RG_ADDA_CH1_SEL_MASK                             0x3
+#define RG_ADDA_CH1_SEL_MASK_SFT                         (0x3 << 0)
+
+/* AFE_PMIC_NEWIF_CFG3 */
+#define RG_UP8X_SYNC_WORD_SFT                0
+#define RG_UP8X_SYNC_WORD_MASK               0xffff
+#define RG_UP8X_SYNC_WORD_MASK_SFT           (0xffff << 0)
+
+/* AFE_VOW_TOP_CON0 */
+#define PDN_VOW_SFT                          15
+#define PDN_VOW_MASK                         0x1
+#define PDN_VOW_MASK_SFT                     (0x1 << 15)
+#define VOW_DMIC_CK_SEL_SFT                  13
+#define VOW_DMIC_CK_SEL_MASK                 0x3
+#define VOW_DMIC_CK_SEL_MASK_SFT             (0x3 << 13)
+#define MAIN_DMIC_CK_VOW_SEL_SFT             12
+#define MAIN_DMIC_CK_VOW_SEL_MASK            0x1
+#define MAIN_DMIC_CK_VOW_SEL_MASK_SFT        (0x1 << 12)
+#define VOW_CIC_MODE_SEL_SFT                 10
+#define VOW_CIC_MODE_SEL_MASK                0x3
+#define VOW_CIC_MODE_SEL_MASK_SFT            (0x3 << 10)
+#define VOW_SDM_3_LEVEL_SFT                  9
+#define VOW_SDM_3_LEVEL_MASK                 0x1
+#define VOW_SDM_3_LEVEL_MASK_SFT             (0x1 << 9)
+#define VOW_LOOP_BACK_MODE_SFT               8
+#define VOW_LOOP_BACK_MODE_MASK              0x1
+#define VOW_LOOP_BACK_MODE_MASK_SFT          (0x1 << 8)
+#define VOW_INTR_SW_MODE_SFT                 7
+#define VOW_INTR_SW_MODE_MASK                0x1
+#define VOW_INTR_SW_MODE_MASK_SFT            (0x1 << 7)
+#define VOW_INTR_SW_VAL_SFT                  6
+#define VOW_INTR_SW_VAL_MASK                 0x1
+#define VOW_INTR_SW_VAL_MASK_SFT             (0x1 << 6)
+#define RG_VOW_INTR_MODE_SEL_SFT             2
+#define RG_VOW_INTR_MODE_SEL_MASK            0x3
+#define RG_VOW_INTR_MODE_SEL_MASK_SFT        (0x3 << 2)
+
+/* AFE_VOW_TOP_CON1 */
+#define VOW_DMIC0_CK_PDN_SFT                 15
+#define VOW_DMIC0_CK_PDN_MASK                0x1
+#define VOW_DMIC0_CK_PDN_MASK_SFT            (0x1 << 15)
+#define VOW_DIGMIC_ON_CH1_SFT                14
+#define VOW_DIGMIC_ON_CH1_MASK               0x1
+#define VOW_DIGMIC_ON_CH1_MASK_SFT           (0x1 << 14)
+#define VOW_CK_DIV_RST_CH1_SFT               13
+#define VOW_CK_DIV_RST_CH1_MASK              0x1
+#define VOW_CK_DIV_RST_CH1_MASK_SFT          (0x1 << 13)
+#define VOW_ADC_CK_PDN_CH1_SFT               12
+#define VOW_ADC_CK_PDN_CH1_MASK              0x1
+#define VOW_ADC_CK_PDN_CH1_MASK_SFT          (0x1 << 12)
+#define VOW_CK_PDN_CH1_SFT                   11
+#define VOW_CK_PDN_CH1_MASK                  0x1
+#define VOW_CK_PDN_CH1_MASK_SFT              (0x1 << 11)
+#define VOW_DIGMIC_CK_PHASE_SEL_CH1_SFT      6
+#define VOW_DIGMIC_CK_PHASE_SEL_CH1_MASK     0x1f
+#define VOW_DIGMIC_CK_PHASE_SEL_CH1_MASK_SFT (0x1f << 6)
+#define VOW_ADC_CLK_INV_CH1_SFT              5
+#define VOW_ADC_CLK_INV_CH1_MASK             0x1
+#define VOW_ADC_CLK_INV_CH1_MASK_SFT         (0x1 << 5)
+#define VOW_INTR_SOURCE_SEL_CH1_SFT          4
+#define VOW_INTR_SOURCE_SEL_CH1_MASK         0x1
+#define VOW_INTR_SOURCE_SEL_CH1_MASK_SFT     (0x1 << 4)
+#define VOW_INTR_CLR_CH1_SFT                 3
+#define VOW_INTR_CLR_CH1_MASK                0x1
+#define VOW_INTR_CLR_CH1_MASK_SFT            (0x1 << 3)
+#define S_N_VALUE_RST_CH1_SFT                2
+#define S_N_VALUE_RST_CH1_MASK               0x1
+#define S_N_VALUE_RST_CH1_MASK_SFT           (0x1 << 2)
+#define SAMPLE_BASE_MODE_CH1_SFT             1
+#define SAMPLE_BASE_MODE_CH1_MASK            0x1
+#define SAMPLE_BASE_MODE_CH1_MASK_SFT        (0x1 << 1)
+#define VOW_ON_CH1_SFT                       0
+#define VOW_ON_CH1_MASK                      0x1
+#define VOW_ON_CH1_MASK_SFT                  (0x1 << 0)
+
+/* AFE_VOW_TOP_CON2 */
+#define VOW_DMIC1_CK_PDN_SFT                 15
+#define VOW_DMIC1_CK_PDN_MASK                0x1
+#define VOW_DMIC1_CK_PDN_MASK_SFT            (0x1 << 15)
+#define VOW_DIGMIC_ON_CH2_SFT                14
+#define VOW_DIGMIC_ON_CH2_MASK               0x1
+#define VOW_DIGMIC_ON_CH2_MASK_SFT           (0x1 << 14)
+#define VOW_CK_DIV_RST_CH2_SFT               13
+#define VOW_CK_DIV_RST_CH2_MASK              0x1
+#define VOW_CK_DIV_RST_CH2_MASK_SFT          (0x1 << 13)
+#define VOW_ADC_CK_PDN_CH2_SFT               12
+#define VOW_ADC_CK_PDN_CH2_MASK              0x1
+#define VOW_ADC_CK_PDN_CH2_MASK_SFT          (0x1 << 12)
+#define VOW_CK_PDN_CH2_SFT                   11
+#define VOW_CK_PDN_CH2_MASK                  0x1
+#define VOW_CK_PDN_CH2_MASK_SFT              (0x1 << 11)
+#define VOW_DIGMIC_CK_PHASE_SEL_CH2_SFT      6
+#define VOW_DIGMIC_CK_PHASE_SEL_CH2_MASK     0x1f
+#define VOW_DIGMIC_CK_PHASE_SEL_CH2_MASK_SFT (0x1f << 6)
+#define VOW_ADC_CLK_INV_CH2_SFT              5
+#define VOW_ADC_CLK_INV_CH2_MASK             0x1
+#define VOW_ADC_CLK_INV_CH2_MASK_SFT         (0x1 << 5)
+#define VOW_INTR_SOURCE_SEL_CH2_SFT          4
+#define VOW_INTR_SOURCE_SEL_CH2_MASK         0x1
+#define VOW_INTR_SOURCE_SEL_CH2_MASK_SFT     (0x1 << 4)
+#define VOW_INTR_CLR_CH2_SFT                 3
+#define VOW_INTR_CLR_CH2_MASK                0x1
+#define VOW_INTR_CLR_CH2_MASK_SFT            (0x1 << 3)
+#define S_N_VALUE_RST_CH2_SFT                2
+#define S_N_VALUE_RST_CH2_MASK               0x1
+#define S_N_VALUE_RST_CH2_MASK_SFT           (0x1 << 2)
+#define SAMPLE_BASE_MODE_CH2_SFT             1
+#define SAMPLE_BASE_MODE_CH2_MASK            0x1
+#define SAMPLE_BASE_MODE_CH2_MASK_SFT        (0x1 << 1)
+#define VOW_ON_CH2_SFT                       0
+#define VOW_ON_CH2_MASK                      0x1
+#define VOW_ON_CH2_MASK_SFT                  (0x1 << 0)
+
+/* AFE_VOW_TOP_CON3 */
+#define VOW_TXIF_SCK_INV_SFT                 15
+#define VOW_TXIF_SCK_INV_MASK                0x1
+#define VOW_TXIF_SCK_INV_MASK_SFT            (0x1 << 15)
+#define VOW_ADC_TESTCK_SRC_SEL_SFT           12
+#define VOW_ADC_TESTCK_SRC_SEL_MASK          0x7
+#define VOW_ADC_TESTCK_SRC_SEL_MASK_SFT      (0x7 << 12)
+#define VOW_ADC_TESTCK_SEL_SFT               11
+#define VOW_ADC_TESTCK_SEL_MASK              0x1
+#define VOW_ADC_TESTCK_SEL_MASK_SFT          (0x1 << 11)
+#define VOW_TXIF_MONO_SFT                    9
+#define VOW_TXIF_MONO_MASK                   0x1
+#define VOW_TXIF_MONO_MASK_SFT               (0x1 << 9)
+#define VOW_TXIF_SCK_DIV_SFT                 4
+#define VOW_TXIF_SCK_DIV_MASK                0x1f
+#define VOW_TXIF_SCK_DIV_MASK_SFT            (0x1f << 4)
+#define VOW_P2_SNRDET_AUTO_PDN_SFT           0
+#define VOW_P2_SNRDET_AUTO_PDN_MASK          0x1
+#define VOW_P2_SNRDET_AUTO_PDN_MASK_SFT      (0x1 << 0)
+
+/* AFE_VOW_TOP_CON4 */
+#define RG_VOW_AMIC_ADC1_SOURCE_SEL_SFT      4
+#define RG_VOW_AMIC_ADC1_SOURCE_SEL_MASK     0x3
+#define RG_VOW_AMIC_ADC1_SOURCE_SEL_MASK_SFT (0x3 << 4)
+#define RG_VOW_AMIC_ADC2_SOURCE_SEL_SFT      0
+#define RG_VOW_AMIC_ADC2_SOURCE_SEL_MASK     0x3
+#define RG_VOW_AMIC_ADC2_SOURCE_SEL_MASK_SFT (0x3 << 0)
+
+/* AFE_VOW_TOP_MON0 */
+#define BUCK_DVFS_DONE_SFT                   8
+#define BUCK_DVFS_DONE_MASK                  0x1
+#define BUCK_DVFS_DONE_MASK_SFT              (0x1 << 8)
+#define VOW_INTR_SFT                         4
+#define VOW_INTR_MASK                        0x1
+#define VOW_INTR_MASK_SFT                    (0x1 << 4)
+#define VOW_INTR_FLAG_CH1_SFT                1
+#define VOW_INTR_FLAG_CH1_MASK               0x1
+#define VOW_INTR_FLAG_CH1_MASK_SFT           (0x1 << 1)
+#define VOW_INTR_FLAG_CH2_SFT                0
+#define VOW_INTR_FLAG_CH2_MASK               0x1
+#define VOW_INTR_FLAG_CH2_MASK_SFT           (0x1 << 0)
+
+/* AFE_VOW_VAD_CFG0 */
+#define AMPREF_CH1_SFT                       0
+#define AMPREF_CH1_MASK                      0xffff
+#define AMPREF_CH1_MASK_SFT                  (0xffff << 0)
+
+/* AFE_VOW_VAD_CFG1 */
+#define AMPREF_CH2_SFT                       0
+#define AMPREF_CH2_MASK                      0xffff
+#define AMPREF_CH2_MASK_SFT                  (0xffff << 0)
+
+/* AFE_VOW_VAD_CFG2 */
+#define TIMERINI_CH1_SFT                     0
+#define TIMERINI_CH1_MASK                    0xffff
+#define TIMERINI_CH1_MASK_SFT                (0xffff << 0)
+
+/* AFE_VOW_VAD_CFG3 */
+#define TIMERINI_CH2_SFT                     0
+#define TIMERINI_CH2_MASK                    0xffff
+#define TIMERINI_CH2_MASK_SFT                (0xffff << 0)
+
+/* AFE_VOW_VAD_CFG4 */
+#define VOW_IRQ_LATCH_SNR_EN_CH1_SFT         15
+#define VOW_IRQ_LATCH_SNR_EN_CH1_MASK        0x1
+#define VOW_IRQ_LATCH_SNR_EN_CH1_MASK_SFT    (0x1 << 15)
+#define B_DEFAULT_CH1_SFT                    12
+#define B_DEFAULT_CH1_MASK                   0x7
+#define B_DEFAULT_CH1_MASK_SFT               (0x7 << 12)
+#define A_DEFAULT_CH1_SFT                    8
+#define A_DEFAULT_CH1_MASK                   0x7
+#define A_DEFAULT_CH1_MASK_SFT               (0x7 << 8)
+#define B_INI_CH1_SFT                        4
+#define B_INI_CH1_MASK                       0x7
+#define B_INI_CH1_MASK_SFT                   (0x7 << 4)
+#define A_INI_CH1_SFT                        0
+#define A_INI_CH1_MASK                       0x7
+#define A_INI_CH1_MASK_SFT                   (0x7 << 0)
+
+/* AFE_VOW_VAD_CFG5 */
+#define VOW_IRQ_LATCH_SNR_EN_CH2_SFT         15
+#define VOW_IRQ_LATCH_SNR_EN_CH2_MASK        0x1
+#define VOW_IRQ_LATCH_SNR_EN_CH2_MASK_SFT    (0x1 << 15)
+#define B_DEFAULT_CH2_SFT                    12
+#define B_DEFAULT_CH2_MASK                   0x7
+#define B_DEFAULT_CH2_MASK_SFT               (0x7 << 12)
+#define A_DEFAULT_CH2_SFT                    8
+#define A_DEFAULT_CH2_MASK                   0x7
+#define A_DEFAULT_CH2_MASK_SFT               (0x7 << 8)
+#define B_INI_CH2_SFT                        4
+#define B_INI_CH2_MASK                       0x7
+#define B_INI_CH2_MASK_SFT                   (0x7 << 4)
+#define A_INI_CH2_SFT                        0
+#define A_INI_CH2_MASK                       0x7
+#define A_INI_CH2_MASK_SFT                   (0x7 << 0)
+
+/* AFE_VOW_VAD_CFG6 */
+#define K_BETA_RISE_CH1_SFT                  12
+#define K_BETA_RISE_CH1_MASK                 0xf
+#define K_BETA_RISE_CH1_MASK_SFT             (0xf << 12)
+#define K_BETA_FALL_CH1_SFT                  8
+#define K_BETA_FALL_CH1_MASK                 0xf
+#define K_BETA_FALL_CH1_MASK_SFT             (0xf << 8)
+#define K_ALPHA_RISE_CH1_SFT                 4
+#define K_ALPHA_RISE_CH1_MASK                0xf
+#define K_ALPHA_RISE_CH1_MASK_SFT            (0xf << 4)
+#define K_ALPHA_FALL_CH1_SFT                 0
+#define K_ALPHA_FALL_CH1_MASK                0xf
+#define K_ALPHA_FALL_CH1_MASK_SFT            (0xf << 0)
+
+/* AFE_VOW_VAD_CFG7 */
+#define K_BETA_RISE_CH2_SFT                  12
+#define K_BETA_RISE_CH2_MASK                 0xf
+#define K_BETA_RISE_CH2_MASK_SFT             (0xf << 12)
+#define K_BETA_FALL_CH2_SFT                  8
+#define K_BETA_FALL_CH2_MASK                 0xf
+#define K_BETA_FALL_CH2_MASK_SFT             (0xf << 8)
+#define K_ALPHA_RISE_CH2_SFT                 4
+#define K_ALPHA_RISE_CH2_MASK                0xf
+#define K_ALPHA_RISE_CH2_MASK_SFT            (0xf << 4)
+#define K_ALPHA_FALL_CH2_SFT                 0
+#define K_ALPHA_FALL_CH2_MASK                0xf
+#define K_ALPHA_FALL_CH2_MASK_SFT            (0xf << 0)
+
+/* AFE_VOW_VAD_CFG8 */
+#define N_MIN_CH1_SFT                        0
+#define N_MIN_CH1_MASK                       0xffff
+#define N_MIN_CH1_MASK_SFT                   (0xffff << 0)
+
+/* AFE_VOW_VAD_CFG9 */
+#define N_MIN_CH2_SFT                        0
+#define N_MIN_CH2_MASK                       0xffff
+#define N_MIN_CH2_MASK_SFT                   (0xffff << 0)
+
+/* AFE_VOW_VAD_CFG10 */
+#define VOW_SN_INI_CFG_EN_CH1_SFT            15
+#define VOW_SN_INI_CFG_EN_CH1_MASK           0x1
+#define VOW_SN_INI_CFG_EN_CH1_MASK_SFT       (0x1 << 15)
+#define VOW_SN_INI_CFG_VAL_CH1_SFT           0
+#define VOW_SN_INI_CFG_VAL_CH1_MASK          0x7fff
+#define VOW_SN_INI_CFG_VAL_CH1_MASK_SFT      (0x7fff << 0)
+
+/* AFE_VOW_VAD_CFG11 */
+#define VOW_SN_INI_CFG_EN_CH2_SFT            15
+#define VOW_SN_INI_CFG_EN_CH2_MASK           0x1
+#define VOW_SN_INI_CFG_EN_CH2_MASK_SFT       (0x1 << 15)
+#define VOW_SN_INI_CFG_VAL_CH2_SFT           0
+#define VOW_SN_INI_CFG_VAL_CH2_MASK          0x7fff
+#define VOW_SN_INI_CFG_VAL_CH2_MASK_SFT      (0x7fff << 0)
+
+/* AFE_VOW_VAD_CFG12 */
+#define K_GAMMA_CH1_SFT                      8
+#define K_GAMMA_CH1_MASK                     0xf
+#define K_GAMMA_CH1_MASK_SFT                 (0xf << 8)
+#define K_GAMMA_CH2_SFT                      0
+#define K_GAMMA_CH2_MASK                     0xf
+#define K_GAMMA_CH2_MASK_SFT                 (0xf << 0)
+
+/* AFE_VOW_VAD_MON0 */
+#define VOW_DOWNCNT_CH1_SFT                  0
+#define VOW_DOWNCNT_CH1_MASK                 0xffff
+#define VOW_DOWNCNT_CH1_MASK_SFT             (0xffff << 0)
+
+/* AFE_VOW_VAD_MON1 */
+#define VOW_DOWNCNT_CH2_SFT                  0
+#define VOW_DOWNCNT_CH2_MASK                 0xffff
+#define VOW_DOWNCNT_CH2_MASK_SFT             (0xffff << 0)
+
+/* AFE_VOW_VAD_MON2 */
+#define K_TMP_MON_CH1_SFT                    10
+#define K_TMP_MON_CH1_MASK                   0xf
+#define K_TMP_MON_CH1_MASK_SFT               (0xf << 10)
+#define SLT_COUNTER_MON_CH1_SFT              7
+#define SLT_COUNTER_MON_CH1_MASK             0x7
+#define SLT_COUNTER_MON_CH1_MASK_SFT         (0x7 << 7)
+#define VOW_B_CH1_SFT                        4
+#define VOW_B_CH1_MASK                       0x7
+#define VOW_B_CH1_MASK_SFT                   (0x7 << 4)
+#define VOW_A_CH1_SFT                        1
+#define VOW_A_CH1_MASK                       0x7
+#define VOW_A_CH1_MASK_SFT                   (0x7 << 1)
+#define SECOND_CNT_START_CH1_SFT             0
+#define SECOND_CNT_START_CH1_MASK            0x1
+#define SECOND_CNT_START_CH1_MASK_SFT        (0x1 << 0)
+
+/* AFE_VOW_VAD_MON3 */
+#define K_TMP_MON_CH2_SFT                    10
+#define K_TMP_MON_CH2_MASK                   0xf
+#define K_TMP_MON_CH2_MASK_SFT               (0xf << 10)
+#define SLT_COUNTER_MON_CH2_SFT              7
+#define SLT_COUNTER_MON_CH2_MASK             0x7
+#define SLT_COUNTER_MON_CH2_MASK_SFT         (0x7 << 7)
+#define VOW_B_CH2_SFT                        4
+#define VOW_B_CH2_MASK                       0x7
+#define VOW_B_CH2_MASK_SFT                   (0x7 << 4)
+#define VOW_A_CH2_SFT                        1
+#define VOW_A_CH2_MASK                       0x7
+#define VOW_A_CH2_MASK_SFT                   (0x7 << 1)
+#define SECOND_CNT_START_CH2_SFT             0
+#define SECOND_CNT_START_CH2_MASK            0x1
+#define SECOND_CNT_START_CH2_MASK_SFT        (0x1 << 0)
+
+/* AFE_VOW_VAD_MON4 */
+#define VOW_S_L_CH1_SFT                      0
+#define VOW_S_L_CH1_MASK                     0xffff
+#define VOW_S_L_CH1_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_VAD_MON5 */
+#define VOW_S_L_CH2_SFT                      0
+#define VOW_S_L_CH2_MASK                     0xffff
+#define VOW_S_L_CH2_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_VAD_MON6 */
+#define VOW_S_H_CH1_SFT                      0
+#define VOW_S_H_CH1_MASK                     0xffff
+#define VOW_S_H_CH1_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_VAD_MON7 */
+#define VOW_S_H_CH2_SFT                      0
+#define VOW_S_H_CH2_MASK                     0xffff
+#define VOW_S_H_CH2_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_VAD_MON8 */
+#define VOW_N_L_CH1_SFT                      0
+#define VOW_N_L_CH1_MASK                     0xffff
+#define VOW_N_L_CH1_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_VAD_MON9 */
+#define VOW_N_L_CH2_SFT                      0
+#define VOW_N_L_CH2_MASK                     0xffff
+#define VOW_N_L_CH2_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_VAD_MON10 */
+#define VOW_N_H_CH1_SFT                      0
+#define VOW_N_H_CH1_MASK                     0xffff
+#define VOW_N_H_CH1_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_VAD_MON11 */
+#define VOW_N_H_CH2_SFT                      0
+#define VOW_N_H_CH2_MASK                     0xffff
+#define VOW_N_H_CH2_MASK_SFT                 (0xffff << 0)
+
+/* AFE_VOW_TGEN_CFG0 */
+#define VOW_TGEN_EN_CH1_SFT                  15
+#define VOW_TGEN_EN_CH1_MASK                 0x1
+#define VOW_TGEN_EN_CH1_MASK_SFT             (0x1 << 15)
+#define VOW_TGEN_MUTE_SW_CH1_SFT             14
+#define VOW_TGEN_MUTE_SW_CH1_MASK            0x1
+#define VOW_TGEN_MUTE_SW_CH1_MASK_SFT        (0x1 << 14)
+#define VOW_TGEN_FREQ_DIV_CH1_SFT            0
+#define VOW_TGEN_FREQ_DIV_CH1_MASK           0x3fff
+#define VOW_TGEN_FREQ_DIV_CH1_MASK_SFT       (0x3fff << 0)
+
+/* AFE_VOW_TGEN_CFG1 */
+#define VOW_TGEN_EN_CH2_SFT                  15
+#define VOW_TGEN_EN_CH2_MASK                 0x1
+#define VOW_TGEN_EN_CH2_MASK_SFT             (0x1 << 15)
+#define VOW_TGEN_MUTE_SW_CH2_SFT             14
+#define VOW_TGEN_MUTE_SW_CH2_MASK            0x1
+#define VOW_TGEN_MUTE_SW_CH2_MASK_SFT        (0x1 << 14)
+#define VOW_TGEN_FREQ_DIV_CH2_SFT            0
+#define VOW_TGEN_FREQ_DIV_CH2_MASK           0x3fff
+#define VOW_TGEN_FREQ_DIV_CH2_MASK_SFT       (0x3fff << 0)
+
+/* AFE_VOW_HPF_CFG0 */
+#define VOW_HPF_DC_TEST_CH1_SFT              12
+#define VOW_HPF_DC_TEST_CH1_MASK             0xf
+#define VOW_HPF_DC_TEST_CH1_MASK_SFT         (0xf << 12)
+#define RG_BASELINE_ALPHA_ORDER_CH1_SFT      4
+#define RG_BASELINE_ALPHA_ORDER_CH1_MASK     0xf
+#define RG_BASELINE_ALPHA_ORDER_CH1_MASK_SFT (0xf << 4)
+#define RG_MTKAIF_HPF_BYPASS_CH1_SFT         2
+#define RG_MTKAIF_HPF_BYPASS_CH1_MASK        0x1
+#define RG_MTKAIF_HPF_BYPASS_CH1_MASK_SFT    (0x1 << 2)
+#define RG_SNRDET_HPF_BYPASS_CH1_SFT         1
+#define RG_SNRDET_HPF_BYPASS_CH1_MASK        0x1
+#define RG_SNRDET_HPF_BYPASS_CH1_MASK_SFT    (0x1 << 1)
+#define RG_HPF_ON_CH1_SFT                    0
+#define RG_HPF_ON_CH1_MASK                   0x1
+#define RG_HPF_ON_CH1_MASK_SFT               (0x1 << 0)
+
+/* AFE_VOW_HPF_CFG1 */
+#define VOW_HPF_DC_TEST_CH2_SFT              12
+#define VOW_HPF_DC_TEST_CH2_MASK             0xf
+#define VOW_HPF_DC_TEST_CH2_MASK_SFT         (0xf << 12)
+#define RG_BASELINE_ALPHA_ORDER_CH2_SFT      4
+#define RG_BASELINE_ALPHA_ORDER_CH2_MASK     0xf
+#define RG_BASELINE_ALPHA_ORDER_CH2_MASK_SFT (0xf << 4)
+#define RG_MTKAIF_HPF_BYPASS_CH2_SFT         2
+#define RG_MTKAIF_HPF_BYPASS_CH2_MASK        0x1
+#define RG_MTKAIF_HPF_BYPASS_CH2_MASK_SFT    (0x1 << 2)
+#define RG_SNRDET_HPF_BYPASS_CH2_SFT         1
+#define RG_SNRDET_HPF_BYPASS_CH2_MASK        0x1
+#define RG_SNRDET_HPF_BYPASS_CH2_MASK_SFT    (0x1 << 1)
+#define RG_HPF_ON_CH2_SFT                    0
+#define RG_HPF_ON_CH2_MASK                   0x1
+#define RG_HPF_ON_CH2_MASK_SFT               (0x1 << 0)
+
+/* AFE_VOW_PERIODIC_CFG0 */
+#define RG_PERIODIC_EN_SFT                                15
+#define RG_PERIODIC_EN_MASK                               0x1
+#define RG_PERIODIC_EN_MASK_SFT                           (0x1 << 15)
+#define RG_PERIODIC_CNT_CLR_SFT                           14
+#define RG_PERIODIC_CNT_CLR_MASK                          0x1
+#define RG_PERIODIC_CNT_CLR_MASK_SFT                      (0x1 << 14)
+#define RG_PERIODIC_CNT_PERIOD_SFT                        0
+#define RG_PERIODIC_CNT_PERIOD_MASK                       0x3fff
+#define RG_PERIODIC_CNT_PERIOD_MASK_SFT                   (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG1 */
+#define RG_PERIODIC_CNT_SET_SFT                           15
+#define RG_PERIODIC_CNT_SET_MASK                          0x1
+#define RG_PERIODIC_CNT_SET_MASK_SFT                      (0x1 << 15)
+#define RG_PERIODIC_CNT_PAUSE_SFT                         14
+#define RG_PERIODIC_CNT_PAUSE_MASK                        0x1
+#define RG_PERIODIC_CNT_PAUSE_MASK_SFT                    (0x1 << 14)
+#define RG_PERIODIC_CNT_SET_VALUE_SFT                     0
+#define RG_PERIODIC_CNT_SET_VALUE_MASK                    0x3fff
+#define RG_PERIODIC_CNT_SET_VALUE_MASK_SFT                (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG2 */
+#define AUDPREAMPLON_PERIODIC_MODE_SFT                    15
+#define AUDPREAMPLON_PERIODIC_MODE_MASK                   0x1
+#define AUDPREAMPLON_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define AUDPREAMPLON_PERIODIC_INVERSE_SFT                 14
+#define AUDPREAMPLON_PERIODIC_INVERSE_MASK                0x1
+#define AUDPREAMPLON_PERIODIC_INVERSE_MASK_SFT            (0x1 << 14)
+#define AUDPREAMPLON_PERIODIC_ON_CYCLE_SFT                0
+#define AUDPREAMPLON_PERIODIC_ON_CYCLE_MASK               0x3fff
+#define AUDPREAMPLON_PERIODIC_ON_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG3 */
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_MODE_SFT           15
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_MODE_MASK          0x1
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_MODE_MASK_SFT      (0x1 << 15)
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_INVERSE_SFT        14
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_INVERSE_MASK       0x1
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_INVERSE_MASK_SFT   (0x1 << 14)
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_ON_CYCLE_SFT       0
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_ON_CYCLE_MASK      0x3fff
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_ON_CYCLE_MASK_SFT  (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG4 */
+#define AUDADCLPWRUP_PERIODIC_MODE_SFT                    15
+#define AUDADCLPWRUP_PERIODIC_MODE_MASK                   0x1
+#define AUDADCLPWRUP_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define AUDADCLPWRUP_PERIODIC_INVERSE_SFT                 14
+#define AUDADCLPWRUP_PERIODIC_INVERSE_MASK                0x1
+#define AUDADCLPWRUP_PERIODIC_INVERSE_MASK_SFT            (0x1 << 14)
+#define AUDADCLPWRUP_PERIODIC_ON_CYCLE_SFT                0
+#define AUDADCLPWRUP_PERIODIC_ON_CYCLE_MASK               0x3fff
+#define AUDADCLPWRUP_PERIODIC_ON_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG5 */
+#define AUDGLBVOWLPWEN_PERIODIC_MODE_SFT                  15
+#define AUDGLBVOWLPWEN_PERIODIC_MODE_MASK                 0x1
+#define AUDGLBVOWLPWEN_PERIODIC_MODE_MASK_SFT             (0x1 << 15)
+#define AUDGLBVOWLPWEN_PERIODIC_INVERSE_SFT               14
+#define AUDGLBVOWLPWEN_PERIODIC_INVERSE_MASK              0x1
+#define AUDGLBVOWLPWEN_PERIODIC_INVERSE_MASK_SFT          (0x1 << 14)
+#define AUDGLBVOWLPWEN_PERIODIC_ON_CYCLE_SFT              0
+#define AUDGLBVOWLPWEN_PERIODIC_ON_CYCLE_MASK             0x3fff
+#define AUDGLBVOWLPWEN_PERIODIC_ON_CYCLE_MASK_SFT         (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG6 */
+#define AUDDIGMICEN_PERIODIC_MODE_SFT                     15
+#define AUDDIGMICEN_PERIODIC_MODE_MASK                    0x1
+#define AUDDIGMICEN_PERIODIC_MODE_MASK_SFT                (0x1 << 15)
+#define AUDDIGMICEN_PERIODIC_INVERSE_SFT                  14
+#define AUDDIGMICEN_PERIODIC_INVERSE_MASK                 0x1
+#define AUDDIGMICEN_PERIODIC_INVERSE_MASK_SFT             (0x1 << 14)
+#define AUDDIGMICEN_PERIODIC_ON_CYCLE_SFT                 0
+#define AUDDIGMICEN_PERIODIC_ON_CYCLE_MASK                0x3fff
+#define AUDDIGMICEN_PERIODIC_ON_CYCLE_MASK_SFT            (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG7 */
+#define AUDPWDBMICBIAS0_PERIODIC_MODE_SFT                 15
+#define AUDPWDBMICBIAS0_PERIODIC_MODE_MASK                0x1
+#define AUDPWDBMICBIAS0_PERIODIC_MODE_MASK_SFT            (0x1 << 15)
+#define AUDPWDBMICBIAS0_PERIODIC_INVERSE_SFT              14
+#define AUDPWDBMICBIAS0_PERIODIC_INVERSE_MASK             0x1
+#define AUDPWDBMICBIAS0_PERIODIC_INVERSE_MASK_SFT         (0x1 << 14)
+#define AUDPWDBMICBIAS0_PERIODIC_ON_CYCLE_SFT             0
+#define AUDPWDBMICBIAS0_PERIODIC_ON_CYCLE_MASK            0x3fff
+#define AUDPWDBMICBIAS0_PERIODIC_ON_CYCLE_MASK_SFT        (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG8 */
+#define AUDPWDBMICBIAS1_PERIODIC_MODE_SFT                 15
+#define AUDPWDBMICBIAS1_PERIODIC_MODE_MASK                0x1
+#define AUDPWDBMICBIAS1_PERIODIC_MODE_MASK_SFT            (0x1 << 15)
+#define AUDPWDBMICBIAS1_PERIODIC_INVERSE_SFT              14
+#define AUDPWDBMICBIAS1_PERIODIC_INVERSE_MASK             0x1
+#define AUDPWDBMICBIAS1_PERIODIC_INVERSE_MASK_SFT         (0x1 << 14)
+#define AUDPWDBMICBIAS1_PERIODIC_ON_CYCLE_SFT             0
+#define AUDPWDBMICBIAS1_PERIODIC_ON_CYCLE_MASK            0x3fff
+#define AUDPWDBMICBIAS1_PERIODIC_ON_CYCLE_MASK_SFT        (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG9 */
+#define XO_VOW_CK_EN_PERIODIC_MODE_SFT                    15
+#define XO_VOW_CK_EN_PERIODIC_MODE_MASK                   0x1
+#define XO_VOW_CK_EN_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define XO_VOW_CK_EN_PERIODIC_INVERSE_SFT                 14
+#define XO_VOW_CK_EN_PERIODIC_INVERSE_MASK                0x1
+#define XO_VOW_CK_EN_PERIODIC_INVERSE_MASK_SFT            (0x1 << 14)
+#define XO_VOW_CK_EN_PERIODIC_ON_CYCLE_SFT                0
+#define XO_VOW_CK_EN_PERIODIC_ON_CYCLE_MASK               0x3fff
+#define XO_VOW_CK_EN_PERIODIC_ON_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG10 */
+#define AUDGLB_PWRDN_PERIODIC_MODE_SFT                    15
+#define AUDGLB_PWRDN_PERIODIC_MODE_MASK                   0x1
+#define AUDGLB_PWRDN_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define AUDGLB_PWRDN_PERIODIC_INVERSE_SFT                 14
+#define AUDGLB_PWRDN_PERIODIC_INVERSE_MASK                0x1
+#define AUDGLB_PWRDN_PERIODIC_INVERSE_MASK_SFT            (0x1 << 14)
+#define AUDGLB_PWRDN_PERIODIC_ON_CYCLE_SFT                0
+#define AUDGLB_PWRDN_PERIODIC_ON_CYCLE_MASK               0x3fff
+#define AUDGLB_PWRDN_PERIODIC_ON_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG11 */
+#define VOW_ON_CH1_PERIODIC_MODE_SFT                      15
+#define VOW_ON_CH1_PERIODIC_MODE_MASK                     0x1
+#define VOW_ON_CH1_PERIODIC_MODE_MASK_SFT                 (0x1 << 15)
+#define VOW_ON_CH1_PERIODIC_INVERSE_SFT                   14
+#define VOW_ON_CH1_PERIODIC_INVERSE_MASK                  0x1
+#define VOW_ON_CH1_PERIODIC_INVERSE_MASK_SFT              (0x1 << 14)
+#define VOW_ON_CH1_PERIODIC_ON_CYCLE_SFT                  0
+#define VOW_ON_CH1_PERIODIC_ON_CYCLE_MASK                 0x3fff
+#define VOW_ON_CH1_PERIODIC_ON_CYCLE_MASK_SFT             (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG12 */
+#define DMIC_ON_CH1_PERIODIC_MODE_SFT                     15
+#define DMIC_ON_CH1_PERIODIC_MODE_MASK                    0x1
+#define DMIC_ON_CH1_PERIODIC_MODE_MASK_SFT                (0x1 << 15)
+#define DMIC_ON_CH1_PERIODIC_INVERSE_SFT                  14
+#define DMIC_ON_CH1_PERIODIC_INVERSE_MASK                 0x1
+#define DMIC_ON_CH1_PERIODIC_INVERSE_MASK_SFT             (0x1 << 14)
+#define DMIC_ON_CH1_PERIODIC_ON_CYCLE_SFT                 0
+#define DMIC_ON_CH1_PERIODIC_ON_CYCLE_MASK                0x3fff
+#define DMIC_ON_CH1_PERIODIC_ON_CYCLE_MASK_SFT            (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG13 */
+#define PDN_VOW_F32K_CK_SFT                               15
+#define PDN_VOW_F32K_CK_MASK                              0x1
+#define PDN_VOW_F32K_CK_MASK_SFT                          (0x1 << 15)
+#define AUDPREAMPLON_PERIODIC_OFF_CYCLE_SFT               0
+#define AUDPREAMPLON_PERIODIC_OFF_CYCLE_MASK              0x3fff
+#define AUDPREAMPLON_PERIODIC_OFF_CYCLE_MASK_SFT          (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG14 */
+#define VOW_SNRDET_PERIODIC_CFG_SFT                       15
+#define VOW_SNRDET_PERIODIC_CFG_MASK                      0x1
+#define VOW_SNRDET_PERIODIC_CFG_MASK_SFT                  (0x1 << 15)
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_OFF_CYCLE_SFT      0
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_OFF_CYCLE_MASK     0x3fff
+#define AUDPREAMPLDCPRECHARGE_PERIODIC_OFF_CYCLE_MASK_SFT (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG15 */
+#define AUDADCLPWRUP_PERIODIC_OFF_CYCLE_SFT               0
+#define AUDADCLPWRUP_PERIODIC_OFF_CYCLE_MASK              0x3fff
+#define AUDADCLPWRUP_PERIODIC_OFF_CYCLE_MASK_SFT          (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG16 */
+#define AUDGLBVOWLPWEN_PERIODIC_OFF_CYCLE_SFT             0
+#define AUDGLBVOWLPWEN_PERIODIC_OFF_CYCLE_MASK            0x3fff
+#define AUDGLBVOWLPWEN_PERIODIC_OFF_CYCLE_MASK_SFT        (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG17 */
+#define AUDDIGMICEN_PERIODIC_OFF_CYCLE_SFT                0
+#define AUDDIGMICEN_PERIODIC_OFF_CYCLE_MASK               0x3fff
+#define AUDDIGMICEN_PERIODIC_OFF_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG18 */
+#define AUDPWDBMICBIAS0_PERIODIC_OFF_CYCLE_SFT            0
+#define AUDPWDBMICBIAS0_PERIODIC_OFF_CYCLE_MASK           0x3fff
+#define AUDPWDBMICBIAS0_PERIODIC_OFF_CYCLE_MASK_SFT       (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG19 */
+#define AUDPWDBMICBIAS1_PERIODIC_OFF_CYCLE_SFT            0
+#define AUDPWDBMICBIAS1_PERIODIC_OFF_CYCLE_MASK           0x3fff
+#define AUDPWDBMICBIAS1_PERIODIC_OFF_CYCLE_MASK_SFT       (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG20 */
+#define CLKSQ_EN_VOW_PERIODIC_MODE_SFT                    15
+#define CLKSQ_EN_VOW_PERIODIC_MODE_MASK                   0x1
+#define CLKSQ_EN_VOW_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define XO_VOW_CK_EN_PERIODIC_OFF_CYCLE_SFT               0
+#define XO_VOW_CK_EN_PERIODIC_OFF_CYCLE_MASK              0x3fff
+#define XO_VOW_CK_EN_PERIODIC_OFF_CYCLE_MASK_SFT          (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG21 */
+#define AUDGLB_PWRDN_PERIODIC_OFF_CYCLE_SFT               0
+#define AUDGLB_PWRDN_PERIODIC_OFF_CYCLE_MASK              0x3fff
+#define AUDGLB_PWRDN_PERIODIC_OFF_CYCLE_MASK_SFT          (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG22 */
+#define VOW_ON_CH1_PERIODIC_OFF_CYCLE_SFT                 0
+#define VOW_ON_CH1_PERIODIC_OFF_CYCLE_MASK                0x3fff
+#define VOW_ON_CH1_PERIODIC_OFF_CYCLE_MASK_SFT            (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG23 */
+#define DMIC_ON_CH1_PERIODIC_OFF_CYCLE_SFT                0
+#define DMIC_ON_CH1_PERIODIC_OFF_CYCLE_MASK               0x3fff
+#define DMIC_ON_CH1_PERIODIC_OFF_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG24 */
+#define AUDPREAMPRON_PERIODIC_MODE_SFT                    15
+#define AUDPREAMPRON_PERIODIC_MODE_MASK                   0x1
+#define AUDPREAMPRON_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define AUDPREAMPRON_PERIODIC_INVERSE_SFT                 14
+#define AUDPREAMPRON_PERIODIC_INVERSE_MASK                0x1
+#define AUDPREAMPRON_PERIODIC_INVERSE_MASK_SFT            (0x1 << 14)
+#define AUDPREAMPRON_PERIODIC_ON_CYCLE_SFT                0
+#define AUDPREAMPRON_PERIODIC_ON_CYCLE_MASK               0x3fff
+#define AUDPREAMPRON_PERIODIC_ON_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG25 */
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_MODE_SFT           15
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_MODE_MASK          0x1
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_MODE_MASK_SFT      (0x1 << 15)
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_INVERSE_SFT        14
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_INVERSE_MASK       0x1
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_INVERSE_MASK_SFT   (0x1 << 14)
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_ON_CYCLE_SFT       0
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_ON_CYCLE_MASK      0x3fff
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_ON_CYCLE_MASK_SFT  (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG26 */
+#define AUDADCRPWRUP_PERIODIC_MODE_SFT                    15
+#define AUDADCRPWRUP_PERIODIC_MODE_MASK                   0x1
+#define AUDADCRPWRUP_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define AUDADCRPWRUP_PERIODIC_INVERSE_SFT                 14
+#define AUDADCRPWRUP_PERIODIC_INVERSE_MASK                0x1
+#define AUDADCRPWRUP_PERIODIC_INVERSE_MASK_SFT            (0x1 << 14)
+#define AUDADCRPWRUP_PERIODIC_ON_CYCLE_SFT                0
+#define AUDADCRPWRUP_PERIODIC_ON_CYCLE_MASK               0x3fff
+#define AUDADCRPWRUP_PERIODIC_ON_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG27 */
+#define AUDGLBRVOWLPWEN_PERIODIC_MODE_SFT                 15
+#define AUDGLBRVOWLPWEN_PERIODIC_MODE_MASK                0x1
+#define AUDGLBRVOWLPWEN_PERIODIC_MODE_MASK_SFT            (0x1 << 15)
+#define AUDGLBRVOWLPWEN_PERIODIC_INVERSE_SFT              14
+#define AUDGLBRVOWLPWEN_PERIODIC_INVERSE_MASK             0x1
+#define AUDGLBRVOWLPWEN_PERIODIC_INVERSE_MASK_SFT         (0x1 << 14)
+#define AUDGLBRVOWLPWEN_PERIODIC_ON_CYCLE_SFT             0
+#define AUDGLBRVOWLPWEN_PERIODIC_ON_CYCLE_MASK            0x3fff
+#define AUDGLBRVOWLPWEN_PERIODIC_ON_CYCLE_MASK_SFT        (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG28 */
+#define AUDDIGMIC1EN_PERIODIC_MODE_SFT                    15
+#define AUDDIGMIC1EN_PERIODIC_MODE_MASK                   0x1
+#define AUDDIGMIC1EN_PERIODIC_MODE_MASK_SFT               (0x1 << 15)
+#define AUDDIGMIC1EN_PERIODIC_INVERSE_SFT                 14
+#define AUDDIGMIC1EN_PERIODIC_INVERSE_MASK                0x1
+#define AUDDIGMIC1EN_PERIODIC_INVERSE_MASK_SFT            (0x1 << 14)
+#define AUDDIGMIC1EN_PERIODIC_ON_CYCLE_SFT                0
+#define AUDDIGMIC1EN_PERIODIC_ON_CYCLE_MASK               0x3fff
+#define AUDDIGMIC1EN_PERIODIC_ON_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG29 */
+#define AUDPWDBMICBIAS2_PERIODIC_MODE_SFT                 15
+#define AUDPWDBMICBIAS2_PERIODIC_MODE_MASK                0x1
+#define AUDPWDBMICBIAS2_PERIODIC_MODE_MASK_SFT            (0x1 << 15)
+#define AUDPWDBMICBIAS2_PERIODIC_INVERSE_SFT              14
+#define AUDPWDBMICBIAS2_PERIODIC_INVERSE_MASK             0x1
+#define AUDPWDBMICBIAS2_PERIODIC_INVERSE_MASK_SFT         (0x1 << 14)
+#define AUDPWDBMICBIAS2_PERIODIC_ON_CYCLE_SFT             0
+#define AUDPWDBMICBIAS2_PERIODIC_ON_CYCLE_MASK            0x3fff
+#define AUDPWDBMICBIAS2_PERIODIC_ON_CYCLE_MASK_SFT        (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG30 */
+#define VOW_ON_CH2_PERIODIC_MODE_SFT                      15
+#define VOW_ON_CH2_PERIODIC_MODE_MASK                     0x1
+#define VOW_ON_CH2_PERIODIC_MODE_MASK_SFT                 (0x1 << 15)
+#define VOW_ON_CH2_PERIODIC_INVERSE_SFT                   14
+#define VOW_ON_CH2_PERIODIC_INVERSE_MASK                  0x1
+#define VOW_ON_CH2_PERIODIC_INVERSE_MASK_SFT              (0x1 << 14)
+#define VOW_ON_CH2_PERIODIC_ON_CYCLE_SFT                  0
+#define VOW_ON_CH2_PERIODIC_ON_CYCLE_MASK                 0x3fff
+#define VOW_ON_CH2_PERIODIC_ON_CYCLE_MASK_SFT             (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG31 */
+#define DMIC_ON_CH2_PERIODIC_MODE_SFT                     15
+#define DMIC_ON_CH2_PERIODIC_MODE_MASK                    0x1
+#define DMIC_ON_CH2_PERIODIC_MODE_MASK_SFT                (0x1 << 15)
+#define DMIC_ON_CH2_PERIODIC_INVERSE_SFT                  14
+#define DMIC_ON_CH2_PERIODIC_INVERSE_MASK                 0x1
+#define DMIC_ON_CH2_PERIODIC_INVERSE_MASK_SFT             (0x1 << 14)
+#define DMIC_ON_CH2_PERIODIC_ON_CYCLE_SFT                 0
+#define DMIC_ON_CH2_PERIODIC_ON_CYCLE_MASK                0x3fff
+#define DMIC_ON_CH2_PERIODIC_ON_CYCLE_MASK_SFT            (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG32 */
+#define AUDPREAMPRON_PERIODIC_OFF_CYCLE_SFT               0
+#define AUDPREAMPRON_PERIODIC_OFF_CYCLE_MASK              0x3fff
+#define AUDPREAMPRON_PERIODIC_OFF_CYCLE_MASK_SFT          (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG33 */
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_OFF_CYCLE_SFT      0
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_OFF_CYCLE_MASK     0x3fff
+#define AUDPREAMPRDCPRECHARGE_PERIODIC_OFF_CYCLE_MASK_SFT (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG34 */
+#define AUDADCRPWRUP_PERIODIC_OFF_CYCLE_SFT               0
+#define AUDADCRPWRUP_PERIODIC_OFF_CYCLE_MASK              0x3fff
+#define AUDADCRPWRUP_PERIODIC_OFF_CYCLE_MASK_SFT          (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG35 */
+#define AUDGLBRVOWLPWEN_PERIODIC_OFF_CYCLE_SFT            0
+#define AUDGLBRVOWLPWEN_PERIODIC_OFF_CYCLE_MASK           0x3fff
+#define AUDGLBRVOWLPWEN_PERIODIC_OFF_CYCLE_MASK_SFT       (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG36 */
+#define AUDDIGMIC1EN_PERIODIC_OFF_CYCLE_SFT               0
+#define AUDDIGMIC1EN_PERIODIC_OFF_CYCLE_MASK              0x3fff
+#define AUDDIGMIC1EN_PERIODIC_OFF_CYCLE_MASK_SFT          (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG37 */
+#define AUDPWDBMICBIAS2_PERIODIC_OFF_CYCLE_SFT            0
+#define AUDPWDBMICBIAS2_PERIODIC_OFF_CYCLE_MASK           0x3fff
+#define AUDPWDBMICBIAS2_PERIODIC_OFF_CYCLE_MASK_SFT       (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG38 */
+#define VOW_ON_CH2_PERIODIC_OFF_CYCLE_SFT                 0
+#define VOW_ON_CH2_PERIODIC_OFF_CYCLE_MASK                0x3fff
+#define VOW_ON_CH2_PERIODIC_OFF_CYCLE_MASK_SFT            (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_CFG39 */
+#define DMIC_ON_CH2_PERIODIC_OFF_CYCLE_SFT                0
+#define DMIC_ON_CH2_PERIODIC_OFF_CYCLE_MASK               0x3fff
+#define DMIC_ON_CH2_PERIODIC_OFF_CYCLE_MASK_SFT           (0x3fff << 0)
+
+/* AFE_VOW_PERIODIC_MON0 */
+#define VOW_PERIODIC_MON0_SFT                             0
+#define VOW_PERIODIC_MON0_MASK                            0xffff
+#define VOW_PERIODIC_MON0_MASK_SFT                        (0xffff << 0)
+
+/* AFE_VOW_PERIODIC_MON1 */
+#define VOW_PERIODIC_MON1_SFT                             0
+#define VOW_PERIODIC_MON1_MASK                            0xffff
+#define VOW_PERIODIC_MON1_MASK_SFT                        (0xffff << 0)
+
+/* AFE_VOW_PERIODIC_MON2 */
+#define VOW_PERIODIC_COUNT_MON_SFT                        0
+#define VOW_PERIODIC_COUNT_MON_MASK                       0xffff
+#define VOW_PERIODIC_COUNT_MON_MASK_SFT                   (0xffff << 0)
+
+/* AFE_NCP_CFG0 */
+#define  RG_NCP_CK1_VALID_CNT_SFT                         9
+#define  RG_NCP_CK1_VALID_CNT_MASK                        0x7f
+#define  RG_NCP_CK1_VALID_CNT_MASK_SFT                    (0x7f << 9)
+#define RG_NCP_ADITH_SFT                                  8
+#define RG_NCP_ADITH_MASK                                 0x1
+#define RG_NCP_ADITH_MASK_SFT                             (0x1 << 8)
+#define RG_NCP_DITHER_EN_SFT                              7
+#define RG_NCP_DITHER_EN_MASK                             0x1
+#define RG_NCP_DITHER_EN_MASK_SFT                         (0x1 << 7)
+#define RG_NCP_DITHER_FIXED_CK0_ACK1_2P_SFT               4
+#define RG_NCP_DITHER_FIXED_CK0_ACK1_2P_MASK              0x7
+#define RG_NCP_DITHER_FIXED_CK0_ACK1_2P_MASK_SFT          (0x7 << 4)
+#define RG_NCP_DITHER_FIXED_CK0_ACK2_2P_SFT               1
+#define RG_NCP_DITHER_FIXED_CK0_ACK2_2P_MASK              0x7
+#define RG_NCP_DITHER_FIXED_CK0_ACK2_2P_MASK_SFT          (0x7 << 1)
+#define RG_NCP_ON_SFT                                     0
+#define RG_NCP_ON_MASK                                    0x1
+#define RG_NCP_ON_MASK_SFT                                (0x1 << 0)
+
+/* AFE_NCP_CFG1 */
+#define RG_XY_VAL_CFG_EN_SFT                              15
+#define RG_XY_VAL_CFG_EN_MASK                             0x1
+#define RG_XY_VAL_CFG_EN_MASK_SFT                         (0x1 << 15)
+#define RG_X_VAL_CFG_SFT                                  8
+#define RG_X_VAL_CFG_MASK                                 0x7f
+#define RG_X_VAL_CFG_MASK_SFT                             (0x7f << 8)
+#define RG_Y_VAL_CFG_SFT                                  0
+#define RG_Y_VAL_CFG_MASK                                 0x7f
+#define RG_Y_VAL_CFG_MASK_SFT                             (0x7f << 0)
+
+/* AFE_NCP_CFG2 */
+#define RG_NCP_NONCLK_SET_SFT                             1
+#define RG_NCP_NONCLK_SET_MASK                            0x1
+#define RG_NCP_NONCLK_SET_MASK_SFT                        (0x1 << 1)
+#define RG_NCP_PDDIS_EN_SFT                               0
+#define RG_NCP_PDDIS_EN_MASK                              0x1
+#define RG_NCP_PDDIS_EN_MASK_SFT                          (0x1 << 0)
+
+/* AUDENC_ANA_CON0 */
+#define RG_AUDPREAMPLON_SFT                  0
+#define RG_AUDPREAMPLON_MASK                 0x1
+#define RG_AUDPREAMPLON_MASK_SFT             (0x1 << 0)
+#define RG_AUDPREAMPLDCCEN_SFT               1
+#define RG_AUDPREAMPLDCCEN_MASK              0x1
+#define RG_AUDPREAMPLDCCEN_MASK_SFT          (0x1 << 1)
+#define RG_AUDPREAMPLDCPRECHARGE_SFT         2
+#define RG_AUDPREAMPLDCPRECHARGE_MASK        0x1
+#define RG_AUDPREAMPLDCPRECHARGE_MASK_SFT    (0x1 << 2)
+#define RG_AUDPREAMPLPGATEST_SFT             3
+#define RG_AUDPREAMPLPGATEST_MASK            0x1
+#define RG_AUDPREAMPLPGATEST_MASK_SFT        (0x1 << 3)
+#define RG_AUDPREAMPLVSCALE_SFT              4
+#define RG_AUDPREAMPLVSCALE_MASK             0x3
+#define RG_AUDPREAMPLVSCALE_MASK_SFT         (0x3 << 4)
+#define RG_AUDPREAMPLINPUTSEL_SFT            6
+#define RG_AUDPREAMPLINPUTSEL_MASK           0x3
+#define RG_AUDPREAMPLINPUTSEL_MASK_SFT       (0x3 << 6)
+#define RG_AUDPREAMPLGAIN_SFT                8
+#define RG_AUDPREAMPLGAIN_MASK               0x7
+#define RG_AUDPREAMPLGAIN_MASK_SFT           (0x7 << 8)
+#define RG_BULKL_VCM_EN_SFT                  11
+#define RG_BULKL_VCM_EN_MASK                 0x1
+#define RG_BULKL_VCM_EN_MASK_SFT             (0x1 << 11)
+#define RG_AUDADCLPWRUP_SFT                  12
+#define RG_AUDADCLPWRUP_MASK                 0x1
+#define RG_AUDADCLPWRUP_MASK_SFT             (0x1 << 12)
+#define RG_AUDADCLINPUTSEL_SFT               13
+#define RG_AUDADCLINPUTSEL_MASK              0x3
+#define RG_AUDADCLINPUTSEL_MASK_SFT          (0x3 << 13)
+
+/* AUDENC_ANA_CON1 */
+#define RG_AUDPREAMPRON_SFT                  0
+#define RG_AUDPREAMPRON_MASK                 0x1
+#define RG_AUDPREAMPRON_MASK_SFT             (0x1 << 0)
+#define RG_AUDPREAMPRDCCEN_SFT               1
+#define RG_AUDPREAMPRDCCEN_MASK              0x1
+#define RG_AUDPREAMPRDCCEN_MASK_SFT          (0x1 << 1)
+#define RG_AUDPREAMPRDCPRECHARGE_SFT         2
+#define RG_AUDPREAMPRDCPRECHARGE_MASK        0x1
+#define RG_AUDPREAMPRDCPRECHARGE_MASK_SFT    (0x1 << 2)
+#define RG_AUDPREAMPRPGATEST_SFT             3
+#define RG_AUDPREAMPRPGATEST_MASK            0x1
+#define RG_AUDPREAMPRPGATEST_MASK_SFT        (0x1 << 3)
+#define RG_AUDPREAMPRVSCALE_SFT              4
+#define RG_AUDPREAMPRVSCALE_MASK             0x3
+#define RG_AUDPREAMPRVSCALE_MASK_SFT         (0x3 << 4)
+#define RG_AUDPREAMPRINPUTSEL_SFT            6
+#define RG_AUDPREAMPRINPUTSEL_MASK           0x3
+#define RG_AUDPREAMPRINPUTSEL_MASK_SFT       (0x3 << 6)
+#define RG_AUDPREAMPRGAIN_SFT                8
+#define RG_AUDPREAMPRGAIN_MASK               0x7
+#define RG_AUDPREAMPRGAIN_MASK_SFT           (0x7 << 8)
+#define RG_BULKR_VCM_EN_SFT                  11
+#define RG_BULKR_VCM_EN_MASK                 0x1
+#define RG_BULKR_VCM_EN_MASK_SFT             (0x1 << 11)
+#define RG_AUDADCRPWRUP_SFT                  12
+#define RG_AUDADCRPWRUP_MASK                 0x1
+#define RG_AUDADCRPWRUP_MASK_SFT             (0x1 << 12)
+#define RG_AUDADCRINPUTSEL_SFT               13
+#define RG_AUDADCRINPUTSEL_MASK              0x3
+#define RG_AUDADCRINPUTSEL_MASK_SFT          (0x3 << 13)
+
+/* AUDENC_ANA_CON2 */
+#define RG_AUDPREAMP3ON_SFT                  0
+#define RG_AUDPREAMP3ON_MASK                 0x1
+#define RG_AUDPREAMP3ON_MASK_SFT             (0x1 << 0)
+#define RG_AUDPREAMP3DCCEN_SFT               1
+#define RG_AUDPREAMP3DCCEN_MASK              0x1
+#define RG_AUDPREAMP3DCCEN_MASK_SFT          (0x1 << 1)
+#define RG_AUDPREAMP3DCPRECHARGE_SFT         2
+#define RG_AUDPREAMP3DCPRECHARGE_MASK        0x1
+#define RG_AUDPREAMP3DCPRECHARGE_MASK_SFT    (0x1 << 2)
+#define RG_AUDPREAMP3PGATEST_SFT             3
+#define RG_AUDPREAMP3PGATEST_MASK            0x1
+#define RG_AUDPREAMP3PGATEST_MASK_SFT        (0x1 << 3)
+#define RG_AUDPREAMP3VSCALE_SFT              4
+#define RG_AUDPREAMP3VSCALE_MASK             0x3
+#define RG_AUDPREAMP3VSCALE_MASK_SFT         (0x3 << 4)
+#define RG_AUDPREAMP3INPUTSEL_SFT            6
+#define RG_AUDPREAMP3INPUTSEL_MASK           0x3
+#define RG_AUDPREAMP3INPUTSEL_MASK_SFT       (0x3 << 6)
+#define RG_AUDPREAMP3GAIN_SFT                8
+#define RG_AUDPREAMP3GAIN_MASK               0x7
+#define RG_AUDPREAMP3GAIN_MASK_SFT           (0x7 << 8)
+#define RG_BULK3_VCM_EN_SFT                  11
+#define RG_BULK3_VCM_EN_MASK                 0x1
+#define RG_BULK3_VCM_EN_MASK_SFT             (0x1 << 11)
+#define RG_AUDADC3PWRUP_SFT                  12
+#define RG_AUDADC3PWRUP_MASK                 0x1
+#define RG_AUDADC3PWRUP_MASK_SFT             (0x1 << 12)
+#define RG_AUDADC3INPUTSEL_SFT               13
+#define RG_AUDADC3INPUTSEL_MASK              0x3
+#define RG_AUDADC3INPUTSEL_MASK_SFT          (0x3 << 13)
+
+/* AUDENC_ANA_CON3 */
+#define RG_AUDULHALFBIAS_SFT                 0
+#define RG_AUDULHALFBIAS_MASK                0x1
+#define RG_AUDULHALFBIAS_MASK_SFT            (0x1 << 0)
+#define RG_AUDGLBVOWLPWEN_SFT                1
+#define RG_AUDGLBVOWLPWEN_MASK               0x1
+#define RG_AUDGLBVOWLPWEN_MASK_SFT           (0x1 << 1)
+#define RG_AUDPREAMPLPEN_SFT                 2
+#define RG_AUDPREAMPLPEN_MASK                0x1
+#define RG_AUDPREAMPLPEN_MASK_SFT            (0x1 << 2)
+#define RG_AUDADC1STSTAGELPEN_SFT            3
+#define RG_AUDADC1STSTAGELPEN_MASK           0x1
+#define RG_AUDADC1STSTAGELPEN_MASK_SFT       (0x1 << 3)
+#define RG_AUDADC2NDSTAGELPEN_SFT            4
+#define RG_AUDADC2NDSTAGELPEN_MASK           0x1
+#define RG_AUDADC2NDSTAGELPEN_MASK_SFT       (0x1 << 4)
+#define RG_AUDADCFLASHLPEN_SFT               5
+#define RG_AUDADCFLASHLPEN_MASK              0x1
+#define RG_AUDADCFLASHLPEN_MASK_SFT          (0x1 << 5)
+#define RG_AUDPREAMPIDDTEST_SFT              6
+#define RG_AUDPREAMPIDDTEST_MASK             0x3
+#define RG_AUDPREAMPIDDTEST_MASK_SFT         (0x3 << 6)
+#define RG_AUDADC1STSTAGEIDDTEST_SFT         8
+#define RG_AUDADC1STSTAGEIDDTEST_MASK        0x3
+#define RG_AUDADC1STSTAGEIDDTEST_MASK_SFT    (0x3 << 8)
+#define RG_AUDADC2NDSTAGEIDDTEST_SFT         10
+#define RG_AUDADC2NDSTAGEIDDTEST_MASK        0x3
+#define RG_AUDADC2NDSTAGEIDDTEST_MASK_SFT    (0x3 << 10)
+#define RG_AUDADCREFBUFIDDTEST_SFT           12
+#define RG_AUDADCREFBUFIDDTEST_MASK          0x3
+#define RG_AUDADCREFBUFIDDTEST_MASK_SFT      (0x3 << 12)
+#define RG_AUDADCFLASHIDDTEST_SFT            14
+#define RG_AUDADCFLASHIDDTEST_MASK           0x3
+#define RG_AUDADCFLASHIDDTEST_MASK_SFT       (0x3 << 14)
+
+/* AUDENC_ANA_CON4 */
+#define RG_AUDRULHALFBIAS_SFT                0
+#define RG_AUDRULHALFBIAS_MASK               0x1
+#define RG_AUDRULHALFBIAS_MASK_SFT           (0x1 << 0)
+#define RG_AUDGLBRVOWLPWEN_SFT               1
+#define RG_AUDGLBRVOWLPWEN_MASK              0x1
+#define RG_AUDGLBRVOWLPWEN_MASK_SFT          (0x1 << 1)
+#define RG_AUDRPREAMPLPEN_SFT                2
+#define RG_AUDRPREAMPLPEN_MASK               0x1
+#define RG_AUDRPREAMPLPEN_MASK_SFT           (0x1 << 2)
+#define RG_AUDRADC1STSTAGELPEN_SFT           3
+#define RG_AUDRADC1STSTAGELPEN_MASK          0x1
+#define RG_AUDRADC1STSTAGELPEN_MASK_SFT      (0x1 << 3)
+#define RG_AUDRADC2NDSTAGELPEN_SFT           4
+#define RG_AUDRADC2NDSTAGELPEN_MASK          0x1
+#define RG_AUDRADC2NDSTAGELPEN_MASK_SFT      (0x1 << 4)
+#define RG_AUDRADCFLASHLPEN_SFT              5
+#define RG_AUDRADCFLASHLPEN_MASK             0x1
+#define RG_AUDRADCFLASHLPEN_MASK_SFT         (0x1 << 5)
+#define RG_AUDRPREAMPIDDTEST_SFT             6
+#define RG_AUDRPREAMPIDDTEST_MASK            0x3
+#define RG_AUDRPREAMPIDDTEST_MASK_SFT        (0x3 << 6)
+#define RG_AUDRADC1STSTAGEIDDTEST_SFT        8
+#define RG_AUDRADC1STSTAGEIDDTEST_MASK       0x3
+#define RG_AUDRADC1STSTAGEIDDTEST_MASK_SFT   (0x3 << 8)
+#define RG_AUDRADC2NDSTAGEIDDTEST_SFT        10
+#define RG_AUDRADC2NDSTAGEIDDTEST_MASK       0x3
+#define RG_AUDRADC2NDSTAGEIDDTEST_MASK_SFT   (0x3 << 10)
+#define RG_AUDRADCREFBUFIDDTEST_SFT          12
+#define RG_AUDRADCREFBUFIDDTEST_MASK         0x3
+#define RG_AUDRADCREFBUFIDDTEST_MASK_SFT     (0x3 << 12)
+#define RG_AUDRADCFLASHIDDTEST_SFT           14
+#define RG_AUDRADCFLASHIDDTEST_MASK          0x3
+#define RG_AUDRADCFLASHIDDTEST_MASK_SFT      (0x3 << 14)
+
+/* AUDENC_ANA_CON5 */
+#define RG_AUDADCCLKRSTB_SFT                 0
+#define RG_AUDADCCLKRSTB_MASK                0x1
+#define RG_AUDADCCLKRSTB_MASK_SFT            (0x1 << 0)
+#define RG_AUDADCCLKSEL_SFT                  1
+#define RG_AUDADCCLKSEL_MASK                 0x3
+#define RG_AUDADCCLKSEL_MASK_SFT             (0x3 << 1)
+#define RG_AUDADCCLKSOURCE_SFT               3
+#define RG_AUDADCCLKSOURCE_MASK              0x3
+#define RG_AUDADCCLKSOURCE_MASK_SFT          (0x3 << 3)
+#define RG_AUDADCCLKGENMODE_SFT              5
+#define RG_AUDADCCLKGENMODE_MASK             0x3
+#define RG_AUDADCCLKGENMODE_MASK_SFT         (0x3 << 5)
+#define RG_AUDPREAMP_ACCFS_SFT               7
+#define RG_AUDPREAMP_ACCFS_MASK              0x1
+#define RG_AUDPREAMP_ACCFS_MASK_SFT          (0x1 << 7)
+#define RG_AUDPREAMPAAFEN_SFT                8
+#define RG_AUDPREAMPAAFEN_MASK               0x1
+#define RG_AUDPREAMPAAFEN_MASK_SFT           (0x1 << 8)
+#define RG_DCCVCMBUFLPMODSEL_SFT             9
+#define RG_DCCVCMBUFLPMODSEL_MASK            0x1
+#define RG_DCCVCMBUFLPMODSEL_MASK_SFT        (0x1 << 9)
+#define RG_DCCVCMBUFLPSWEN_SFT               10
+#define RG_DCCVCMBUFLPSWEN_MASK              0x1
+#define RG_DCCVCMBUFLPSWEN_MASK_SFT          (0x1 << 10)
+#define RG_AUDSPAREPGA_SFT                   11
+#define RG_AUDSPAREPGA_MASK                  0x1f
+#define RG_AUDSPAREPGA_MASK_SFT              (0x1f << 11)
+
+/* AUDENC_ANA_CON6 */
+#define RG_AUDADC1STSTAGESDENB_SFT           0
+#define RG_AUDADC1STSTAGESDENB_MASK          0x1
+#define RG_AUDADC1STSTAGESDENB_MASK_SFT      (0x1 << 0)
+#define RG_AUDADC2NDSTAGERESET_SFT           1
+#define RG_AUDADC2NDSTAGERESET_MASK          0x1
+#define RG_AUDADC2NDSTAGERESET_MASK_SFT      (0x1 << 1)
+#define RG_AUDADC3RDSTAGERESET_SFT           2
+#define RG_AUDADC3RDSTAGERESET_MASK          0x1
+#define RG_AUDADC3RDSTAGERESET_MASK_SFT      (0x1 << 2)
+#define RG_AUDADCFSRESET_SFT                 3
+#define RG_AUDADCFSRESET_MASK                0x1
+#define RG_AUDADCFSRESET_MASK_SFT            (0x1 << 3)
+#define RG_AUDADCWIDECM_SFT                  4
+#define RG_AUDADCWIDECM_MASK                 0x1
+#define RG_AUDADCWIDECM_MASK_SFT             (0x1 << 4)
+#define RG_AUDADCNOPATEST_SFT                5
+#define RG_AUDADCNOPATEST_MASK               0x1
+#define RG_AUDADCNOPATEST_MASK_SFT           (0x1 << 5)
+#define RG_AUDADCBYPASS_SFT                  6
+#define RG_AUDADCBYPASS_MASK                 0x1
+#define RG_AUDADCBYPASS_MASK_SFT             (0x1 << 6)
+#define RG_AUDADCFFBYPASS_SFT                7
+#define RG_AUDADCFFBYPASS_MASK               0x1
+#define RG_AUDADCFFBYPASS_MASK_SFT           (0x1 << 7)
+#define RG_AUDADCDACFBCURRENT_SFT            8
+#define RG_AUDADCDACFBCURRENT_MASK           0x1
+#define RG_AUDADCDACFBCURRENT_MASK_SFT       (0x1 << 8)
+#define RG_AUDADCDACIDDTEST_SFT              9
+#define RG_AUDADCDACIDDTEST_MASK             0x3
+#define RG_AUDADCDACIDDTEST_MASK_SFT         (0x3 << 9)
+#define RG_AUDADCDACNRZ_SFT                  11
+#define RG_AUDADCDACNRZ_MASK                 0x1
+#define RG_AUDADCDACNRZ_MASK_SFT             (0x1 << 11)
+#define RG_AUDADCNODEM_SFT                   12
+#define RG_AUDADCNODEM_MASK                  0x1
+#define RG_AUDADCNODEM_MASK_SFT              (0x1 << 12)
+#define RG_AUDADCDACTEST_SFT                 13
+#define RG_AUDADCDACTEST_MASK                0x1
+#define RG_AUDADCDACTEST_MASK_SFT            (0x1 << 13)
+#define RG_AUDADCDAC0P25FS_SFT               14
+#define RG_AUDADCDAC0P25FS_MASK              0x1
+#define RG_AUDADCDAC0P25FS_MASK_SFT          (0x1 << 14)
+#define RG_AUDADCRDAC0P25FS_SFT              15
+#define RG_AUDADCRDAC0P25FS_MASK             0x1
+#define RG_AUDADCRDAC0P25FS_MASK_SFT         (0x1 << 15)
+
+/* AUDENC_ANA_CON7 */
+#define RG_AUDADCTESTDATA_SFT                0
+#define RG_AUDADCTESTDATA_MASK               0xffff
+#define RG_AUDADCTESTDATA_MASK_SFT           (0xffff << 0)
+
+/* AUDENC_ANA_CON8 */
+#define RG_AUDRCTUNEL_SFT                    0
+#define RG_AUDRCTUNEL_MASK                   0x1f
+#define RG_AUDRCTUNEL_MASK_SFT               (0x1f << 0)
+#define RG_AUDRCTUNELSEL_SFT                 5
+#define RG_AUDRCTUNELSEL_MASK                0x1
+#define RG_AUDRCTUNELSEL_MASK_SFT            (0x1 << 5)
+#define RG_AUDRCTUNER_SFT                    8
+#define RG_AUDRCTUNER_MASK                   0x1f
+#define RG_AUDRCTUNER_MASK_SFT               (0x1f << 8)
+#define RG_AUDRCTUNERSEL_SFT                 13
+#define RG_AUDRCTUNERSEL_MASK                0x1
+#define RG_AUDRCTUNERSEL_MASK_SFT            (0x1 << 13)
+
+/* AUDENC_ANA_CON9 */
+#define RG_AUD3CTUNEL_SFT                    0
+#define RG_AUD3CTUNEL_MASK                   0x1f
+#define RG_AUD3CTUNEL_MASK_SFT               (0x1f << 0)
+#define RG_AUD3CTUNELSEL_SFT                 5
+#define RG_AUD3CTUNELSEL_MASK                0x1
+#define RG_AUD3CTUNELSEL_MASK_SFT            (0x1 << 5)
+#define RGS_AUDRCTUNE3READ_SFT               6
+#define RGS_AUDRCTUNE3READ_MASK              0x1f
+#define RGS_AUDRCTUNE3READ_MASK_SFT          (0x1f << 6)
+#define RG_AUD3SPARE_SFT                     11
+#define RG_AUD3SPARE_MASK                    0x1f
+#define RG_AUD3SPARE_MASK_SFT                (0x1f << 11)
+
+/* AUDENC_ANA_CON10 */
+#define RGS_AUDRCTUNELREAD_SFT               0
+#define RGS_AUDRCTUNELREAD_MASK              0x1f
+#define RGS_AUDRCTUNELREAD_MASK_SFT          (0x1f << 0)
+#define RGS_AUDRCTUNERREAD_SFT               8
+#define RGS_AUDRCTUNERREAD_MASK              0x1f
+#define RGS_AUDRCTUNERREAD_MASK_SFT          (0x1f << 8)
+
+/* AUDENC_ANA_CON11 */
+#define RG_AUDSPAREVA30_SFT                  0
+#define RG_AUDSPAREVA30_MASK                 0xff
+#define RG_AUDSPAREVA30_MASK_SFT             (0xff << 0)
+#define RG_AUDSPAREVA18_SFT                  8
+#define RG_AUDSPAREVA18_MASK                 0xff
+#define RG_AUDSPAREVA18_MASK_SFT             (0xff << 8)
+
+/* AUDENC_ANA_CON12 */
+#define RG_AUDPGA_DECAP_SFT                  0
+#define RG_AUDPGA_DECAP_MASK                 0x1
+#define RG_AUDPGA_DECAP_MASK_SFT             (0x1 << 0)
+#define RG_AUDPGA_CAPRA_SFT                  1
+#define RG_AUDPGA_CAPRA_MASK                 0x1
+#define RG_AUDPGA_CAPRA_MASK_SFT             (0x1 << 1)
+#define RG_AUDPGA_ACCCMP_SFT                 2
+#define RG_AUDPGA_ACCCMP_MASK                0x1
+#define RG_AUDPGA_ACCCMP_MASK_SFT            (0x1 << 2)
+#define RG_AUDENC_SPARE2_SFT                 3
+#define RG_AUDENC_SPARE2_MASK                0x1fff
+#define RG_AUDENC_SPARE2_MASK_SFT            (0x1fff << 3)
+
+/* AUDENC_ANA_CON13 */
+#define RG_AUDDIGMICEN_SFT                   0
+#define RG_AUDDIGMICEN_MASK                  0x1
+#define RG_AUDDIGMICEN_MASK_SFT              (0x1 << 0)
+#define RG_AUDDIGMICBIAS_SFT                 1
+#define RG_AUDDIGMICBIAS_MASK                0x3
+#define RG_AUDDIGMICBIAS_MASK_SFT            (0x3 << 1)
+#define RG_DMICHPCLKEN_SFT                   3
+#define RG_DMICHPCLKEN_MASK                  0x1
+#define RG_DMICHPCLKEN_MASK_SFT              (0x1 << 3)
+#define RG_AUDDIGMICPDUTY_SFT                4
+#define RG_AUDDIGMICPDUTY_MASK               0x3
+#define RG_AUDDIGMICPDUTY_MASK_SFT           (0x3 << 4)
+#define RG_AUDDIGMICNDUTY_SFT                6
+#define RG_AUDDIGMICNDUTY_MASK               0x3
+#define RG_AUDDIGMICNDUTY_MASK_SFT           (0x3 << 6)
+#define RG_DMICMONEN_SFT                     8
+#define RG_DMICMONEN_MASK                    0x1
+#define RG_DMICMONEN_MASK_SFT                (0x1 << 8)
+#define RG_DMICMONSEL_SFT                    9
+#define RG_DMICMONSEL_MASK                   0x7
+#define RG_DMICMONSEL_MASK_SFT               (0x7 << 9)
+
+/* AUDENC_ANA_CON14 */
+#define RG_AUDDIGMIC1EN_SFT                  0
+#define RG_AUDDIGMIC1EN_MASK                 0x1
+#define RG_AUDDIGMIC1EN_MASK_SFT             (0x1 << 0)
+#define RG_AUDDIGMICBIAS1_SFT                1
+#define RG_AUDDIGMICBIAS1_MASK               0x3
+#define RG_AUDDIGMICBIAS1_MASK_SFT           (0x3 << 1)
+#define RG_DMIC1HPCLKEN_SFT                  3
+#define RG_DMIC1HPCLKEN_MASK                 0x1
+#define RG_DMIC1HPCLKEN_MASK_SFT             (0x1 << 3)
+#define RG_AUDDIGMIC1PDUTY_SFT               4
+#define RG_AUDDIGMIC1PDUTY_MASK              0x3
+#define RG_AUDDIGMIC1PDUTY_MASK_SFT          (0x3 << 4)
+#define RG_AUDDIGMIC1NDUTY_SFT               6
+#define RG_AUDDIGMIC1NDUTY_MASK              0x3
+#define RG_AUDDIGMIC1NDUTY_MASK_SFT          (0x3 << 6)
+#define RG_DMIC1MONEN_SFT                    8
+#define RG_DMIC1MONEN_MASK                   0x1
+#define RG_DMIC1MONEN_MASK_SFT               (0x1 << 8)
+#define RG_DMIC1MONSEL_SFT                   9
+#define RG_DMIC1MONSEL_MASK                  0x7
+#define RG_DMIC1MONSEL_MASK_SFT              (0x7 << 9)
+#define RG_AUDSPAREVMIC_SFT                  12
+#define RG_AUDSPAREVMIC_MASK                 0xf
+#define RG_AUDSPAREVMIC_MASK_SFT             (0xf << 12)
+
+/* AUDENC_ANA_CON15 */
+#define RG_AUDPWDBMICBIAS0_SFT               0
+#define RG_AUDPWDBMICBIAS0_MASK              0x1
+#define RG_AUDPWDBMICBIAS0_MASK_SFT          (0x1 << 0)
+#define RG_AUDMICBIAS0BYPASSEN_SFT           1
+#define RG_AUDMICBIAS0BYPASSEN_MASK          0x1
+#define RG_AUDMICBIAS0BYPASSEN_MASK_SFT      (0x1 << 1)
+#define RG_AUDMICBIAS0LOWPEN_SFT             2
+#define RG_AUDMICBIAS0LOWPEN_MASK            0x1
+#define RG_AUDMICBIAS0LOWPEN_MASK_SFT        (0x1 << 2)
+#define RG_AUDPWDBMICBIAS3_SFT               3
+#define RG_AUDPWDBMICBIAS3_MASK              0x1
+#define RG_AUDPWDBMICBIAS3_MASK_SFT          (0x1 << 3)
+#define RG_AUDMICBIAS0VREF_SFT               4
+#define RG_AUDMICBIAS0VREF_MASK              0x7
+#define RG_AUDMICBIAS0VREF_MASK_SFT          (0x7 << 4)
+#define RG_AUDMICBIAS0DCSW0P1EN_SFT          8
+#define RG_AUDMICBIAS0DCSW0P1EN_MASK         0x1
+#define RG_AUDMICBIAS0DCSW0P1EN_MASK_SFT     (0x1 << 8)
+#define RG_AUDMICBIAS0DCSW0P2EN_SFT          9
+#define RG_AUDMICBIAS0DCSW0P2EN_MASK         0x1
+#define RG_AUDMICBIAS0DCSW0P2EN_MASK_SFT     (0x1 << 9)
+#define RG_AUDMICBIAS0DCSW0NEN_SFT           10
+#define RG_AUDMICBIAS0DCSW0NEN_MASK          0x1
+#define RG_AUDMICBIAS0DCSW0NEN_MASK_SFT      (0x1 << 10)
+#define RG_AUDMICBIAS0DCSW2P1EN_SFT          12
+#define RG_AUDMICBIAS0DCSW2P1EN_MASK         0x1
+#define RG_AUDMICBIAS0DCSW2P1EN_MASK_SFT     (0x1 << 12)
+#define RG_AUDMICBIAS0DCSW2P2EN_SFT          13
+#define RG_AUDMICBIAS0DCSW2P2EN_MASK         0x1
+#define RG_AUDMICBIAS0DCSW2P2EN_MASK_SFT     (0x1 << 13)
+#define RG_AUDMICBIAS0DCSW2NEN_SFT           14
+#define RG_AUDMICBIAS0DCSW2NEN_MASK          0x1
+#define RG_AUDMICBIAS0DCSW2NEN_MASK_SFT      (0x1 << 14)
+
+/* AUDENC_ANA_CON16 */
+#define RG_AUDPWDBMICBIAS1_SFT               0
+#define RG_AUDPWDBMICBIAS1_MASK              0x1
+#define RG_AUDPWDBMICBIAS1_MASK_SFT          (0x1 << 0)
+#define RG_AUDMICBIAS1BYPASSEN_SFT           1
+#define RG_AUDMICBIAS1BYPASSEN_MASK          0x1
+#define RG_AUDMICBIAS1BYPASSEN_MASK_SFT      (0x1 << 1)
+#define RG_AUDMICBIAS1LOWPEN_SFT             2
+#define RG_AUDMICBIAS1LOWPEN_MASK            0x1
+#define RG_AUDMICBIAS1LOWPEN_MASK_SFT        (0x1 << 2)
+#define RG_AUDMICBIAS1VREF_SFT               4
+#define RG_AUDMICBIAS1VREF_MASK              0x7
+#define RG_AUDMICBIAS1VREF_MASK_SFT          (0x7 << 4)
+#define RG_AUDMICBIAS1DCSW1PEN_SFT           8
+#define RG_AUDMICBIAS1DCSW1PEN_MASK          0x1
+#define RG_AUDMICBIAS1DCSW1PEN_MASK_SFT      (0x1 << 8)
+#define RG_AUDMICBIAS1DCSW1NEN_SFT           9
+#define RG_AUDMICBIAS1DCSW1NEN_MASK          0x1
+#define RG_AUDMICBIAS1DCSW1NEN_MASK_SFT      (0x1 << 9)
+#define RG_BANDGAPGEN_SFT                    10
+#define RG_BANDGAPGEN_MASK                   0x1
+#define RG_BANDGAPGEN_MASK_SFT               (0x1 << 10)
+#define RG_AUDMICBIAS1HVEN_SFT               12
+#define RG_AUDMICBIAS1HVEN_MASK              0x1
+#define RG_AUDMICBIAS1HVEN_MASK_SFT          (0x1 << 12)
+#define RG_AUDMICBIAS1HVVREF_SFT             13
+#define RG_AUDMICBIAS1HVVREF_MASK            0x1
+#define RG_AUDMICBIAS1HVVREF_MASK_SFT        (0x1 << 13)
+
+/* AUDENC_ANA_CON17 */
+#define RG_AUDPWDBMICBIAS2_SFT               0
+#define RG_AUDPWDBMICBIAS2_MASK              0x1
+#define RG_AUDPWDBMICBIAS2_MASK_SFT          (0x1 << 0)
+#define RG_AUDMICBIAS2BYPASSEN_SFT           1
+#define RG_AUDMICBIAS2BYPASSEN_MASK          0x1
+#define RG_AUDMICBIAS2BYPASSEN_MASK_SFT      (0x1 << 1)
+#define RG_AUDMICBIAS2LOWPEN_SFT             2
+#define RG_AUDMICBIAS2LOWPEN_MASK            0x1
+#define RG_AUDMICBIAS2LOWPEN_MASK_SFT        (0x1 << 2)
+#define RG_AUDMICBIAS2VREF_SFT               4
+#define RG_AUDMICBIAS2VREF_MASK              0x7
+#define RG_AUDMICBIAS2VREF_MASK_SFT          (0x7 << 4)
+#define RG_AUDMICBIAS2DCSW3P1EN_SFT          8
+#define RG_AUDMICBIAS2DCSW3P1EN_MASK         0x1
+#define RG_AUDMICBIAS2DCSW3P1EN_MASK_SFT     (0x1 << 8)
+#define RG_AUDMICBIAS2DCSW3P2EN_SFT          9
+#define RG_AUDMICBIAS2DCSW3P2EN_MASK         0x1
+#define RG_AUDMICBIAS2DCSW3P2EN_MASK_SFT     (0x1 << 9)
+#define RG_AUDMICBIAS2DCSW3NEN_SFT           10
+#define RG_AUDMICBIAS2DCSW3NEN_MASK          0x1
+#define RG_AUDMICBIAS2DCSW3NEN_MASK_SFT      (0x1 << 10)
+#define RG_AUDMICBIASSPARE_SFT               12
+#define RG_AUDMICBIASSPARE_MASK              0xf
+#define RG_AUDMICBIASSPARE_MASK_SFT          (0xf << 12)
+
+/* AUDENC_ANA_CON18 */
+#define RG_AUDACCDETMICBIAS0PULLLOW_SFT      0
+#define RG_AUDACCDETMICBIAS0PULLLOW_MASK     0x1
+#define RG_AUDACCDETMICBIAS0PULLLOW_MASK_SFT (0x1 << 0)
+#define RG_AUDACCDETMICBIAS1PULLLOW_SFT      1
+#define RG_AUDACCDETMICBIAS1PULLLOW_MASK     0x1
+#define RG_AUDACCDETMICBIAS1PULLLOW_MASK_SFT (0x1 << 1)
+#define RG_AUDACCDETMICBIAS2PULLLOW_SFT      2
+#define RG_AUDACCDETMICBIAS2PULLLOW_MASK     0x1
+#define RG_AUDACCDETMICBIAS2PULLLOW_MASK_SFT (0x1 << 2)
+#define RG_AUDACCDETVIN1PULLLOW_SFT          3
+#define RG_AUDACCDETVIN1PULLLOW_MASK         0x1
+#define RG_AUDACCDETVIN1PULLLOW_MASK_SFT     (0x1 << 3)
+#define RG_AUDACCDETVTHACAL_SFT              4
+#define RG_AUDACCDETVTHACAL_MASK             0x1
+#define RG_AUDACCDETVTHACAL_MASK_SFT         (0x1 << 4)
+#define RG_AUDACCDETVTHBCAL_SFT              5
+#define RG_AUDACCDETVTHBCAL_MASK             0x1
+#define RG_AUDACCDETVTHBCAL_MASK_SFT         (0x1 << 5)
+#define RG_AUDACCDETTVDET_SFT                6
+#define RG_AUDACCDETTVDET_MASK               0x1
+#define RG_AUDACCDETTVDET_MASK_SFT           (0x1 << 6)
+#define RG_ACCDETSEL_SFT                     7
+#define RG_ACCDETSEL_MASK                    0x1
+#define RG_ACCDETSEL_MASK_SFT                (0x1 << 7)
+#define RG_SWBUFMODSEL_SFT                   8
+#define RG_SWBUFMODSEL_MASK                  0x1
+#define RG_SWBUFMODSEL_MASK_SFT              (0x1 << 8)
+#define RG_SWBUFSWEN_SFT                     9
+#define RG_SWBUFSWEN_MASK                    0x1
+#define RG_SWBUFSWEN_MASK_SFT                (0x1 << 9)
+#define RG_EINT0NOHYS_SFT                    10
+#define RG_EINT0NOHYS_MASK                   0x1
+#define RG_EINT0NOHYS_MASK_SFT               (0x1 << 10)
+#define RG_EINT0CONFIGACCDET_SFT             11
+#define RG_EINT0CONFIGACCDET_MASK            0x1
+#define RG_EINT0CONFIGACCDET_MASK_SFT        (0x1 << 11)
+#define RG_EINT0HIRENB_SFT                   12
+#define RG_EINT0HIRENB_MASK                  0x1
+#define RG_EINT0HIRENB_MASK_SFT              (0x1 << 12)
+#define RG_ACCDET2AUXRESBYPASS_SFT           13
+#define RG_ACCDET2AUXRESBYPASS_MASK          0x1
+#define RG_ACCDET2AUXRESBYPASS_MASK_SFT      (0x1 << 13)
+#define RG_ACCDET2AUXSWEN_SFT                14
+#define RG_ACCDET2AUXSWEN_MASK               0x1
+#define RG_ACCDET2AUXSWEN_MASK_SFT           (0x1 << 14)
+#define RG_AUDACCDETMICBIAS3PULLLOW_SFT      15
+#define RG_AUDACCDETMICBIAS3PULLLOW_MASK     0x1
+#define RG_AUDACCDETMICBIAS3PULLLOW_MASK_SFT (0x1 << 15)
+
+/* AUDENC_ANA_CON19 */
+#define RG_EINT1CONFIGACCDET_SFT             0
+#define RG_EINT1CONFIGACCDET_MASK            0x1
+#define RG_EINT1CONFIGACCDET_MASK_SFT        (0x1 << 0)
+#define RG_EINT1HIRENB_SFT                   1
+#define RG_EINT1HIRENB_MASK                  0x1
+#define RG_EINT1HIRENB_MASK_SFT              (0x1 << 1)
+#define RG_EINT1NOHYS_SFT                    2
+#define RG_EINT1NOHYS_MASK                   0x1
+#define RG_EINT1NOHYS_MASK_SFT               (0x1 << 2)
+#define RG_EINTCOMPVTH_SFT                   4
+#define RG_EINTCOMPVTH_MASK                  0xf
+#define RG_EINTCOMPVTH_MASK_SFT              (0xf << 4)
+#define RG_MTEST_EN_SFT                      8
+#define RG_MTEST_EN_MASK                     0x1
+#define RG_MTEST_EN_MASK_SFT                 (0x1 << 8)
+#define RG_MTEST_SEL_SFT                     9
+#define RG_MTEST_SEL_MASK                    0x1
+#define RG_MTEST_SEL_MASK_SFT                (0x1 << 9)
+#define RG_MTEST_CURRENT_SFT                 10
+#define RG_MTEST_CURRENT_MASK                0x1
+#define RG_MTEST_CURRENT_MASK_SFT            (0x1 << 10)
+#define RG_ANALOGFDEN_SFT                    12
+#define RG_ANALOGFDEN_MASK                   0x1
+#define RG_ANALOGFDEN_MASK_SFT               (0x1 << 12)
+#define RG_FDVIN1PPULLLOW_SFT                13
+#define RG_FDVIN1PPULLLOW_MASK               0x1
+#define RG_FDVIN1PPULLLOW_MASK_SFT           (0x1 << 13)
+#define RG_FDEINT0TYPE_SFT                   14
+#define RG_FDEINT0TYPE_MASK                  0x1
+#define RG_FDEINT0TYPE_MASK_SFT              (0x1 << 14)
+#define RG_FDEINT1TYPE_SFT                   15
+#define RG_FDEINT1TYPE_MASK                  0x1
+#define RG_FDEINT1TYPE_MASK_SFT              (0x1 << 15)
+
+/* AUDENC_ANA_CON20 */
+#define RG_EINT0CMPEN_SFT                    0
+#define RG_EINT0CMPEN_MASK                   0x1
+#define RG_EINT0CMPEN_MASK_SFT               (0x1 << 0)
+#define RG_EINT0CMPMEN_SFT                   1
+#define RG_EINT0CMPMEN_MASK                  0x1
+#define RG_EINT0CMPMEN_MASK_SFT              (0x1 << 1)
+#define RG_EINT0EN_SFT                       2
+#define RG_EINT0EN_MASK                      0x1
+#define RG_EINT0EN_MASK_SFT                  (0x1 << 2)
+#define RG_EINT0CEN_SFT                      3
+#define RG_EINT0CEN_MASK                     0x1
+#define RG_EINT0CEN_MASK_SFT                 (0x1 << 3)
+#define RG_EINT0INVEN_SFT                    4
+#define RG_EINT0INVEN_MASK                   0x1
+#define RG_EINT0INVEN_MASK_SFT               (0x1 << 4)
+#define RG_EINT0CTURBO_SFT                   5
+#define RG_EINT0CTURBO_MASK                  0x7
+#define RG_EINT0CTURBO_MASK_SFT              (0x7 << 5)
+#define RG_EINT1CMPEN_SFT                    8
+#define RG_EINT1CMPEN_MASK                   0x1
+#define RG_EINT1CMPEN_MASK_SFT               (0x1 << 8)
+#define RG_EINT1CMPMEN_SFT                   9
+#define RG_EINT1CMPMEN_MASK                  0x1
+#define RG_EINT1CMPMEN_MASK_SFT              (0x1 << 9)
+#define RG_EINT1EN_SFT                       10
+#define RG_EINT1EN_MASK                      0x1
+#define RG_EINT1EN_MASK_SFT                  (0x1 << 10)
+#define RG_EINT1CEN_SFT                      11
+#define RG_EINT1CEN_MASK                     0x1
+#define RG_EINT1CEN_MASK_SFT                 (0x1 << 11)
+#define RG_EINT1INVEN_SFT                    12
+#define RG_EINT1INVEN_MASK                   0x1
+#define RG_EINT1INVEN_MASK_SFT               (0x1 << 12)
+#define RG_EINT1CTURBO_SFT                   13
+#define RG_EINT1CTURBO_MASK                  0x7
+#define RG_EINT1CTURBO_MASK_SFT              (0x7 << 13)
+
+/* AUDENC_ANA_CON21 */
+#define RG_ACCDETSPARE_SFT                   0
+#define RG_ACCDETSPARE_MASK                  0xffff
+#define RG_ACCDETSPARE_MASK_SFT              (0xffff << 0)
+
+/* AUDENC_ANA_CON22 */
+#define RG_AUDENCSPAREVA30_SFT               0
+#define RG_AUDENCSPAREVA30_MASK              0xff
+#define RG_AUDENCSPAREVA30_MASK_SFT          (0xff << 0)
+#define RG_AUDENCSPAREVA18_SFT               8
+#define RG_AUDENCSPAREVA18_MASK              0xff
+#define RG_AUDENCSPAREVA18_MASK_SFT          (0xff << 8)
+
+/* AUDENC_ANA_CON23 */
+#define RG_CLKSQ_EN_SFT                      0
+#define RG_CLKSQ_EN_MASK                     0x1
+#define RG_CLKSQ_EN_MASK_SFT                 (0x1 << 0)
+#define RG_CLKSQ_IN_SEL_TEST_SFT             1
+#define RG_CLKSQ_IN_SEL_TEST_MASK            0x1
+#define RG_CLKSQ_IN_SEL_TEST_MASK_SFT        (0x1 << 1)
+#define RG_CM_REFGENSEL_SFT                  2
+#define RG_CM_REFGENSEL_MASK                 0x1
+#define RG_CM_REFGENSEL_MASK_SFT             (0x1 << 2)
+#define RG_AUDIO_VOW_EN_SFT                  3
+#define RG_AUDIO_VOW_EN_MASK                 0x1
+#define RG_AUDIO_VOW_EN_MASK_SFT             (0x1 << 3)
+#define RG_CLKSQ_EN_VOW_SFT                  4
+#define RG_CLKSQ_EN_VOW_MASK                 0x1
+#define RG_CLKSQ_EN_VOW_MASK_SFT             (0x1 << 4)
+#define RG_CLKAND_EN_VOW_SFT                 5
+#define RG_CLKAND_EN_VOW_MASK                0x1
+#define RG_CLKAND_EN_VOW_MASK_SFT            (0x1 << 5)
+#define RG_VOWCLK_SEL_EN_VOW_SFT             6
+#define RG_VOWCLK_SEL_EN_VOW_MASK            0x1
+#define RG_VOWCLK_SEL_EN_VOW_MASK_SFT        (0x1 << 6)
+#define RG_SPARE_VOW_SFT                     7
+#define RG_SPARE_VOW_MASK                    0x7
+#define RG_SPARE_VOW_MASK_SFT                (0x7 << 7)
+
+/* AUDDEC_ANA_CON0 */
+#define RG_AUDDACLPWRUP_VAUDP32_SFT                  0
+#define RG_AUDDACLPWRUP_VAUDP32_MASK                 0x1
+#define RG_AUDDACLPWRUP_VAUDP32_MASK_SFT             (0x1 << 0)
+#define RG_AUDDACRPWRUP_VAUDP32_SFT                  1
+#define RG_AUDDACRPWRUP_VAUDP32_MASK                 0x1
+#define RG_AUDDACRPWRUP_VAUDP32_MASK_SFT             (0x1 << 1)
+#define RG_AUD_DAC_PWR_UP_VA32_SFT                   2
+#define RG_AUD_DAC_PWR_UP_VA32_MASK                  0x1
+#define RG_AUD_DAC_PWR_UP_VA32_MASK_SFT              (0x1 << 2)
+#define RG_AUD_DAC_PWL_UP_VA32_SFT                   3
+#define RG_AUD_DAC_PWL_UP_VA32_MASK                  0x1
+#define RG_AUD_DAC_PWL_UP_VA32_MASK_SFT              (0x1 << 3)
+#define RG_AUDHPLPWRUP_VAUDP32_SFT                   4
+#define RG_AUDHPLPWRUP_VAUDP32_MASK                  0x1
+#define RG_AUDHPLPWRUP_VAUDP32_MASK_SFT              (0x1 << 4)
+#define RG_AUDHPRPWRUP_VAUDP32_SFT                   5
+#define RG_AUDHPRPWRUP_VAUDP32_MASK                  0x1
+#define RG_AUDHPRPWRUP_VAUDP32_MASK_SFT              (0x1 << 5)
+#define RG_AUDHPLPWRUP_IBIAS_VAUDP32_SFT             6
+#define RG_AUDHPLPWRUP_IBIAS_VAUDP32_MASK            0x1
+#define RG_AUDHPLPWRUP_IBIAS_VAUDP32_MASK_SFT        (0x1 << 6)
+#define RG_AUDHPRPWRUP_IBIAS_VAUDP32_SFT             7
+#define RG_AUDHPRPWRUP_IBIAS_VAUDP32_MASK            0x1
+#define RG_AUDHPRPWRUP_IBIAS_VAUDP32_MASK_SFT        (0x1 << 7)
+#define RG_AUDHPLMUXINPUTSEL_VAUDP32_SFT             8
+#define RG_AUDHPLMUXINPUTSEL_VAUDP32_MASK            0x3
+#define RG_AUDHPLMUXINPUTSEL_VAUDP32_MASK_SFT        (0x3 << 8)
+#define RG_AUDHPRMUXINPUTSEL_VAUDP32_SFT             10
+#define RG_AUDHPRMUXINPUTSEL_VAUDP32_MASK            0x3
+#define RG_AUDHPRMUXINPUTSEL_VAUDP32_MASK_SFT        (0x3 << 10)
+#define RG_AUDHPLSCDISABLE_VAUDP32_SFT               12
+#define RG_AUDHPLSCDISABLE_VAUDP32_MASK              0x1
+#define RG_AUDHPLSCDISABLE_VAUDP32_MASK_SFT          (0x1 << 12)
+#define RG_AUDHPRSCDISABLE_VAUDP32_SFT               13
+#define RG_AUDHPRSCDISABLE_VAUDP32_MASK              0x1
+#define RG_AUDHPRSCDISABLE_VAUDP32_MASK_SFT          (0x1 << 13)
+#define RG_AUDHPLBSCCURRENT_VAUDP32_SFT              14
+#define RG_AUDHPLBSCCURRENT_VAUDP32_MASK             0x1
+#define RG_AUDHPLBSCCURRENT_VAUDP32_MASK_SFT         (0x1 << 14)
+#define RG_AUDHPRBSCCURRENT_VAUDP32_SFT              15
+#define RG_AUDHPRBSCCURRENT_VAUDP32_MASK             0x1
+#define RG_AUDHPRBSCCURRENT_VAUDP32_MASK_SFT         (0x1 << 15)
+
+/* AUDDEC_ANA_CON1 */
+#define RG_AUDHPLOUTPWRUP_VAUDP32_SFT                0
+#define RG_AUDHPLOUTPWRUP_VAUDP32_MASK               0x1
+#define RG_AUDHPLOUTPWRUP_VAUDP32_MASK_SFT           (0x1 << 0)
+#define RG_AUDHPROUTPWRUP_VAUDP32_SFT                1
+#define RG_AUDHPROUTPWRUP_VAUDP32_MASK               0x1
+#define RG_AUDHPROUTPWRUP_VAUDP32_MASK_SFT           (0x1 << 1)
+#define RG_AUDHPLOUTAUXPWRUP_VAUDP32_SFT             2
+#define RG_AUDHPLOUTAUXPWRUP_VAUDP32_MASK            0x1
+#define RG_AUDHPLOUTAUXPWRUP_VAUDP32_MASK_SFT        (0x1 << 2)
+#define RG_AUDHPROUTAUXPWRUP_VAUDP32_SFT             3
+#define RG_AUDHPROUTAUXPWRUP_VAUDP32_MASK            0x1
+#define RG_AUDHPROUTAUXPWRUP_VAUDP32_MASK_SFT        (0x1 << 3)
+#define RG_HPLAUXFBRSW_EN_VAUDP32_SFT                4
+#define RG_HPLAUXFBRSW_EN_VAUDP32_MASK               0x1
+#define RG_HPLAUXFBRSW_EN_VAUDP32_MASK_SFT           (0x1 << 4)
+#define RG_HPRAUXFBRSW_EN_VAUDP32_SFT                5
+#define RG_HPRAUXFBRSW_EN_VAUDP32_MASK               0x1
+#define RG_HPRAUXFBRSW_EN_VAUDP32_MASK_SFT           (0x1 << 5)
+#define RG_HPLSHORT2HPLAUX_EN_VAUDP32_SFT            6
+#define RG_HPLSHORT2HPLAUX_EN_VAUDP32_MASK           0x1
+#define RG_HPLSHORT2HPLAUX_EN_VAUDP32_MASK_SFT       (0x1 << 6)
+#define RG_HPRSHORT2HPRAUX_EN_VAUDP32_SFT            7
+#define RG_HPRSHORT2HPRAUX_EN_VAUDP32_MASK           0x1
+#define RG_HPRSHORT2HPRAUX_EN_VAUDP32_MASK_SFT       (0x1 << 7)
+#define RG_HPLOUTSTGCTRL_VAUDP32_SFT                 8
+#define RG_HPLOUTSTGCTRL_VAUDP32_MASK                0x7
+#define RG_HPLOUTSTGCTRL_VAUDP32_MASK_SFT            (0x7 << 8)
+#define RG_HPROUTSTGCTRL_VAUDP32_SFT                 12
+#define RG_HPROUTSTGCTRL_VAUDP32_MASK                0x7
+#define RG_HPROUTSTGCTRL_VAUDP32_MASK_SFT            (0x7 << 12)
+
+/* AUDDEC_ANA_CON2 */
+#define RG_HPLOUTPUTSTBENH_VAUDP32_SFT               0
+#define RG_HPLOUTPUTSTBENH_VAUDP32_MASK              0x7
+#define RG_HPLOUTPUTSTBENH_VAUDP32_MASK_SFT          (0x7 << 0)
+#define RG_HPROUTPUTSTBENH_VAUDP32_SFT               4
+#define RG_HPROUTPUTSTBENH_VAUDP32_MASK              0x7
+#define RG_HPROUTPUTSTBENH_VAUDP32_MASK_SFT          (0x7 << 4)
+#define RG_AUDHPSTARTUP_VAUDP32_SFT                  7
+#define RG_AUDHPSTARTUP_VAUDP32_MASK                 0x1
+#define RG_AUDHPSTARTUP_VAUDP32_MASK_SFT             (0x1 << 7)
+#define RG_AUDREFN_DERES_EN_VAUDP32_SFT              8
+#define RG_AUDREFN_DERES_EN_VAUDP32_MASK             0x1
+#define RG_AUDREFN_DERES_EN_VAUDP32_MASK_SFT         (0x1 << 8)
+#define RG_HPINPUTSTBENH_VAUDP32_SFT                 9
+#define RG_HPINPUTSTBENH_VAUDP32_MASK                0x1
+#define RG_HPINPUTSTBENH_VAUDP32_MASK_SFT            (0x1 << 9)
+#define RG_HPINPUTRESET0_VAUDP32_SFT                 10
+#define RG_HPINPUTRESET0_VAUDP32_MASK                0x1
+#define RG_HPINPUTRESET0_VAUDP32_MASK_SFT            (0x1 << 10)
+#define RG_HPOUTPUTRESET0_VAUDP32_SFT                11
+#define RG_HPOUTPUTRESET0_VAUDP32_MASK               0x1
+#define RG_HPOUTPUTRESET0_VAUDP32_MASK_SFT           (0x1 << 11)
+#define RG_HPPSHORT2VCM_VAUDP32_SFT                  12
+#define RG_HPPSHORT2VCM_VAUDP32_MASK                 0x7
+#define RG_HPPSHORT2VCM_VAUDP32_MASK_SFT             (0x7 << 12)
+#define RG_AUDHPTRIM_EN_VAUDP32_SFT                  15
+#define RG_AUDHPTRIM_EN_VAUDP32_MASK                 0x1
+#define RG_AUDHPTRIM_EN_VAUDP32_MASK_SFT             (0x1 << 15)
+
+/* AUDDEC_ANA_CON3 */
+#define RG_AUDHPLTRIM_VAUDP32_SFT                    0
+#define RG_AUDHPLTRIM_VAUDP32_MASK                   0x1f
+#define RG_AUDHPLTRIM_VAUDP32_MASK_SFT               (0x1f << 0)
+#define RG_AUDHPLFINETRIM_VAUDP32_SFT                5
+#define RG_AUDHPLFINETRIM_VAUDP32_MASK               0x7
+#define RG_AUDHPLFINETRIM_VAUDP32_MASK_SFT           (0x7 << 5)
+#define RG_AUDHPRTRIM_VAUDP32_SFT                    8
+#define RG_AUDHPRTRIM_VAUDP32_MASK                   0x1f
+#define RG_AUDHPRTRIM_VAUDP32_MASK_SFT               (0x1f << 8)
+#define RG_AUDHPRFINETRIM_VAUDP32_SFT                13
+#define RG_AUDHPRFINETRIM_VAUDP32_MASK               0x7
+#define RG_AUDHPRFINETRIM_VAUDP32_MASK_SFT           (0x7 << 13)
+
+/* AUDDEC_ANA_CON4 */
+#define RG_AUDHPDIFFINPBIASADJ_VAUDP32_SFT           0
+#define RG_AUDHPDIFFINPBIASADJ_VAUDP32_MASK          0x7
+#define RG_AUDHPDIFFINPBIASADJ_VAUDP32_MASK_SFT      (0x7 << 0)
+#define RG_AUDHPLFCOMPRESSEL_VAUDP32_SFT             4
+#define RG_AUDHPLFCOMPRESSEL_VAUDP32_MASK            0x7
+#define RG_AUDHPLFCOMPRESSEL_VAUDP32_MASK_SFT        (0x7 << 4)
+#define RG_AUDHPHFCOMPRESSEL_VAUDP32_SFT             8
+#define RG_AUDHPHFCOMPRESSEL_VAUDP32_MASK            0x7
+#define RG_AUDHPHFCOMPRESSEL_VAUDP32_MASK_SFT        (0x7 << 8)
+#define RG_AUDHPHFCOMPBUFGAINSEL_VAUDP32_SFT         12
+#define RG_AUDHPHFCOMPBUFGAINSEL_VAUDP32_MASK        0x3
+#define RG_AUDHPHFCOMPBUFGAINSEL_VAUDP32_MASK_SFT    (0x3 << 12)
+#define RG_AUDHPCOMP_EN_VAUDP32_SFT                  15
+#define RG_AUDHPCOMP_EN_VAUDP32_MASK                 0x1
+#define RG_AUDHPCOMP_EN_VAUDP32_MASK_SFT             (0x1 << 15)
+
+/* AUDDEC_ANA_CON5 */
+#define RG_AUDHPDECMGAINADJ_VAUDP32_SFT              0
+#define RG_AUDHPDECMGAINADJ_VAUDP32_MASK             0x7
+#define RG_AUDHPDECMGAINADJ_VAUDP32_MASK_SFT         (0x7 << 0)
+#define RG_AUDHPDEDMGAINADJ_VAUDP32_SFT              4
+#define RG_AUDHPDEDMGAINADJ_VAUDP32_MASK             0x7
+#define RG_AUDHPDEDMGAINADJ_VAUDP32_MASK_SFT         (0x7 << 4)
+
+/* AUDDEC_ANA_CON6 */
+#define RG_AUDHSPWRUP_VAUDP32_SFT                    0
+#define RG_AUDHSPWRUP_VAUDP32_MASK                   0x1
+#define RG_AUDHSPWRUP_VAUDP32_MASK_SFT               (0x1 << 0)
+#define RG_AUDHSPWRUP_IBIAS_VAUDP32_SFT              1
+#define RG_AUDHSPWRUP_IBIAS_VAUDP32_MASK             0x1
+#define RG_AUDHSPWRUP_IBIAS_VAUDP32_MASK_SFT         (0x1 << 1)
+#define RG_AUDHSMUXINPUTSEL_VAUDP32_SFT              2
+#define RG_AUDHSMUXINPUTSEL_VAUDP32_MASK             0x3
+#define RG_AUDHSMUXINPUTSEL_VAUDP32_MASK_SFT         (0x3 << 2)
+#define RG_AUDHSSCDISABLE_VAUDP32_SFT                4
+#define RG_AUDHSSCDISABLE_VAUDP32_MASK               0x1
+#define RG_AUDHSSCDISABLE_VAUDP32_MASK_SFT           (0x1 << 4)
+#define RG_AUDHSBSCCURRENT_VAUDP32_SFT               5
+#define RG_AUDHSBSCCURRENT_VAUDP32_MASK              0x1
+#define RG_AUDHSBSCCURRENT_VAUDP32_MASK_SFT          (0x1 << 5)
+#define RG_AUDHSSTARTUP_VAUDP32_SFT                  6
+#define RG_AUDHSSTARTUP_VAUDP32_MASK                 0x1
+#define RG_AUDHSSTARTUP_VAUDP32_MASK_SFT             (0x1 << 6)
+#define RG_HSOUTPUTSTBENH_VAUDP32_SFT                7
+#define RG_HSOUTPUTSTBENH_VAUDP32_MASK               0x1
+#define RG_HSOUTPUTSTBENH_VAUDP32_MASK_SFT           (0x1 << 7)
+#define RG_HSINPUTSTBENH_VAUDP32_SFT                 8
+#define RG_HSINPUTSTBENH_VAUDP32_MASK                0x1
+#define RG_HSINPUTSTBENH_VAUDP32_MASK_SFT            (0x1 << 8)
+#define RG_HSINPUTRESET0_VAUDP32_SFT                 9
+#define RG_HSINPUTRESET0_VAUDP32_MASK                0x1
+#define RG_HSINPUTRESET0_VAUDP32_MASK_SFT            (0x1 << 9)
+#define RG_HSOUTPUTRESET0_VAUDP32_SFT                10
+#define RG_HSOUTPUTRESET0_VAUDP32_MASK               0x1
+#define RG_HSOUTPUTRESET0_VAUDP32_MASK_SFT           (0x1 << 10)
+#define RG_HSOUT_SHORTVCM_VAUDP32_SFT                11
+#define RG_HSOUT_SHORTVCM_VAUDP32_MASK               0x1
+#define RG_HSOUT_SHORTVCM_VAUDP32_MASK_SFT           (0x1 << 11)
+
+/* AUDDEC_ANA_CON7 */
+#define RG_AUDLOLPWRUP_VAUDP32_SFT                   0
+#define RG_AUDLOLPWRUP_VAUDP32_MASK                  0x1
+#define RG_AUDLOLPWRUP_VAUDP32_MASK_SFT              (0x1 << 0)
+#define RG_AUDLOLPWRUP_IBIAS_VAUDP32_SFT             1
+#define RG_AUDLOLPWRUP_IBIAS_VAUDP32_MASK            0x1
+#define RG_AUDLOLPWRUP_IBIAS_VAUDP32_MASK_SFT        (0x1 << 1)
+#define RG_AUDLOLMUXINPUTSEL_VAUDP32_SFT             2
+#define RG_AUDLOLMUXINPUTSEL_VAUDP32_MASK            0x3
+#define RG_AUDLOLMUXINPUTSEL_VAUDP32_MASK_SFT        (0x3 << 2)
+#define RG_AUDLOLSCDISABLE_VAUDP32_SFT               4
+#define RG_AUDLOLSCDISABLE_VAUDP32_MASK              0x1
+#define RG_AUDLOLSCDISABLE_VAUDP32_MASK_SFT          (0x1 << 4)
+#define RG_AUDLOLBSCCURRENT_VAUDP32_SFT              5
+#define RG_AUDLOLBSCCURRENT_VAUDP32_MASK             0x1
+#define RG_AUDLOLBSCCURRENT_VAUDP32_MASK_SFT         (0x1 << 5)
+#define RG_AUDLOSTARTUP_VAUDP32_SFT                  6
+#define RG_AUDLOSTARTUP_VAUDP32_MASK                 0x1
+#define RG_AUDLOSTARTUP_VAUDP32_MASK_SFT             (0x1 << 6)
+#define RG_LOINPUTSTBENH_VAUDP32_SFT                 7
+#define RG_LOINPUTSTBENH_VAUDP32_MASK                0x1
+#define RG_LOINPUTSTBENH_VAUDP32_MASK_SFT            (0x1 << 7)
+#define RG_LOOUTPUTSTBENH_VAUDP32_SFT                8
+#define RG_LOOUTPUTSTBENH_VAUDP32_MASK               0x1
+#define RG_LOOUTPUTSTBENH_VAUDP32_MASK_SFT           (0x1 << 8)
+#define RG_LOINPUTRESET0_VAUDP32_SFT                 9
+#define RG_LOINPUTRESET0_VAUDP32_MASK                0x1
+#define RG_LOINPUTRESET0_VAUDP32_MASK_SFT            (0x1 << 9)
+#define RG_LOOUTPUTRESET0_VAUDP32_SFT                10
+#define RG_LOOUTPUTRESET0_VAUDP32_MASK               0x1
+#define RG_LOOUTPUTRESET0_VAUDP32_MASK_SFT           (0x1 << 10)
+#define RG_LOOUT_SHORTVCM_VAUDP32_SFT                11
+#define RG_LOOUT_SHORTVCM_VAUDP32_MASK               0x1
+#define RG_LOOUT_SHORTVCM_VAUDP32_MASK_SFT           (0x1 << 11)
+#define RG_AUDDACTPWRUP_VAUDP32_SFT                  12
+#define RG_AUDDACTPWRUP_VAUDP32_MASK                 0x1
+#define RG_AUDDACTPWRUP_VAUDP32_MASK_SFT             (0x1 << 12)
+#define RG_AUD_DAC_PWT_UP_VA32_SFT                   13
+#define RG_AUD_DAC_PWT_UP_VA32_MASK                  0x1
+#define RG_AUD_DAC_PWT_UP_VA32_MASK_SFT              (0x1 << 13)
+
+/* AUDDEC_ANA_CON8 */
+#define RG_AUDTRIMBUF_INPUTMUXSEL_VAUDP32_SFT        0
+#define RG_AUDTRIMBUF_INPUTMUXSEL_VAUDP32_MASK       0xf
+#define RG_AUDTRIMBUF_INPUTMUXSEL_VAUDP32_MASK_SFT   (0xf << 0)
+#define RG_AUDTRIMBUF_GAINSEL_VAUDP32_SFT            4
+#define RG_AUDTRIMBUF_GAINSEL_VAUDP32_MASK           0x3
+#define RG_AUDTRIMBUF_GAINSEL_VAUDP32_MASK_SFT       (0x3 << 4)
+#define RG_AUDTRIMBUF_EN_VAUDP32_SFT                 6
+#define RG_AUDTRIMBUF_EN_VAUDP32_MASK                0x1
+#define RG_AUDTRIMBUF_EN_VAUDP32_MASK_SFT            (0x1 << 6)
+#define RG_AUDHPSPKDET_INPUTMUXSEL_VAUDP32_SFT       8
+#define RG_AUDHPSPKDET_INPUTMUXSEL_VAUDP32_MASK      0x3
+#define RG_AUDHPSPKDET_INPUTMUXSEL_VAUDP32_MASK_SFT  (0x3 << 8)
+#define RG_AUDHPSPKDET_OUTPUTMUXSEL_VAUDP32_SFT      10
+#define RG_AUDHPSPKDET_OUTPUTMUXSEL_VAUDP32_MASK     0x3
+#define RG_AUDHPSPKDET_OUTPUTMUXSEL_VAUDP32_MASK_SFT (0x3 << 10)
+#define RG_AUDHPSPKDET_EN_VAUDP32_SFT                12
+#define RG_AUDHPSPKDET_EN_VAUDP32_MASK               0x1
+#define RG_AUDHPSPKDET_EN_VAUDP32_MASK_SFT           (0x1 << 12)
+
+/* AUDDEC_ANA_CON9 */
+#define RG_ABIDEC_RSVD0_VA32_SFT                     0
+#define RG_ABIDEC_RSVD0_VA32_MASK                    0xff
+#define RG_ABIDEC_RSVD0_VA32_MASK_SFT                (0xff << 0)
+#define RG_ABIDEC_RSVD0_VAUDP32_SFT                  8
+#define RG_ABIDEC_RSVD0_VAUDP32_MASK                 0xff
+#define RG_ABIDEC_RSVD0_VAUDP32_MASK_SFT             (0xff << 8)
+
+/* AUDDEC_ANA_CON10 */
+#define RG_ABIDEC_RSVD1_VAUDP32_SFT                  0
+#define RG_ABIDEC_RSVD1_VAUDP32_MASK                 0xff
+#define RG_ABIDEC_RSVD1_VAUDP32_MASK_SFT             (0xff << 0)
+#define RG_ABIDEC_RSVD2_VAUDP32_SFT                  8
+#define RG_ABIDEC_RSVD2_VAUDP32_MASK                 0xff
+#define RG_ABIDEC_RSVD2_VAUDP32_MASK_SFT             (0xff << 8)
+
+/* AUDDEC_ANA_CON11 */
+#define RG_AUDZCDMUXSEL_VAUDP32_SFT                  0
+#define RG_AUDZCDMUXSEL_VAUDP32_MASK                 0x7
+#define RG_AUDZCDMUXSEL_VAUDP32_MASK_SFT             (0x7 << 0)
+#define RG_AUDZCDCLKSEL_VAUDP32_SFT                  3
+#define RG_AUDZCDCLKSEL_VAUDP32_MASK                 0x1
+#define RG_AUDZCDCLKSEL_VAUDP32_MASK_SFT             (0x1 << 3)
+#define RG_AUDBIASADJ_0_VAUDP32_SFT                  7
+#define RG_AUDBIASADJ_0_VAUDP32_MASK                 0x1ff
+#define RG_AUDBIASADJ_0_VAUDP32_MASK_SFT             (0x1ff << 7)
+
+/* AUDDEC_ANA_CON12 */
+#define RG_AUDBIASADJ_1_VAUDP32_SFT                  0
+#define RG_AUDBIASADJ_1_VAUDP32_MASK                 0xff
+#define RG_AUDBIASADJ_1_VAUDP32_MASK_SFT             (0xff << 0)
+#define RG_AUDIBIASPWRDN_VAUDP32_SFT                 8
+#define RG_AUDIBIASPWRDN_VAUDP32_MASK                0x1
+#define RG_AUDIBIASPWRDN_VAUDP32_MASK_SFT            (0x1 << 8)
+
+/* AUDDEC_ANA_CON13 */
+#define RG_RSTB_DECODER_VA32_SFT                     0
+#define RG_RSTB_DECODER_VA32_MASK                    0x1
+#define RG_RSTB_DECODER_VA32_MASK_SFT                (0x1 << 0)
+#define RG_SEL_DECODER_96K_VA32_SFT                  1
+#define RG_SEL_DECODER_96K_VA32_MASK                 0x1
+#define RG_SEL_DECODER_96K_VA32_MASK_SFT             (0x1 << 1)
+#define RG_SEL_DELAY_VCORE_SFT                       2
+#define RG_SEL_DELAY_VCORE_MASK                      0x1
+#define RG_SEL_DELAY_VCORE_MASK_SFT                  (0x1 << 2)
+#define RG_AUDGLB_PWRDN_VA32_SFT                     4
+#define RG_AUDGLB_PWRDN_VA32_MASK                    0x1
+#define RG_AUDGLB_PWRDN_VA32_MASK_SFT                (0x1 << 4)
+#define RG_AUDGLB_LP_VOW_EN_VA32_SFT                 5
+#define RG_AUDGLB_LP_VOW_EN_VA32_MASK                0x1
+#define RG_AUDGLB_LP_VOW_EN_VA32_MASK_SFT            (0x1 << 5)
+#define RG_AUDGLB_LP2_VOW_EN_VA32_SFT                6
+#define RG_AUDGLB_LP2_VOW_EN_VA32_MASK               0x1
+#define RG_AUDGLB_LP2_VOW_EN_VA32_MASK_SFT           (0x1 << 6)
+
+/* AUDDEC_ANA_CON14 */
+#define RG_LCLDO_DEC_EN_VA32_SFT                     0
+#define RG_LCLDO_DEC_EN_VA32_MASK                    0x1
+#define RG_LCLDO_DEC_EN_VA32_MASK_SFT                (0x1 << 0)
+#define RG_LCLDO_DEC_PDDIS_EN_VA18_SFT               1
+#define RG_LCLDO_DEC_PDDIS_EN_VA18_MASK              0x1
+#define RG_LCLDO_DEC_PDDIS_EN_VA18_MASK_SFT          (0x1 << 1)
+#define RG_LCLDO_DEC_REMOTE_SENSE_VA18_SFT           2
+#define RG_LCLDO_DEC_REMOTE_SENSE_VA18_MASK          0x1
+#define RG_LCLDO_DEC_REMOTE_SENSE_VA18_MASK_SFT      (0x1 << 2)
+#define RG_NVREG_EN_VAUDP32_SFT                      4
+#define RG_NVREG_EN_VAUDP32_MASK                     0x1
+#define RG_NVREG_EN_VAUDP32_MASK_SFT                 (0x1 << 4)
+#define RG_NVREG_PULL0V_VAUDP32_SFT                  5
+#define RG_NVREG_PULL0V_VAUDP32_MASK                 0x1
+#define RG_NVREG_PULL0V_VAUDP32_MASK_SFT             (0x1 << 5)
+#define RG_AUDPMU_RSVD_VA18_SFT                      8
+#define RG_AUDPMU_RSVD_VA18_MASK                     0xff
+#define RG_AUDPMU_RSVD_VA18_MASK_SFT                 (0xff << 8)
+
+/* MT6359_ZCD_CON0 */
+#define RG_AUDZCDENABLE_SFT                               0
+#define RG_AUDZCDENABLE_MASK                              0x1
+#define RG_AUDZCDENABLE_MASK_SFT                          (0x1 << 0)
+#define RG_AUDZCDGAINSTEPTIME_SFT                         1
+#define RG_AUDZCDGAINSTEPTIME_MASK                        0x7
+#define RG_AUDZCDGAINSTEPTIME_MASK_SFT                    (0x7 << 1)
+#define RG_AUDZCDGAINSTEPSIZE_SFT                         4
+#define RG_AUDZCDGAINSTEPSIZE_MASK                        0x3
+#define RG_AUDZCDGAINSTEPSIZE_MASK_SFT                    (0x3 << 4)
+#define RG_AUDZCDTIMEOUTMODESEL_SFT                       6
+#define RG_AUDZCDTIMEOUTMODESEL_MASK                      0x1
+#define RG_AUDZCDTIMEOUTMODESEL_MASK_SFT                  (0x1 << 6)
+
+/* MT6359_ZCD_CON1 */
+#define RG_AUDLOLGAIN_SFT                                 0
+#define RG_AUDLOLGAIN_MASK                                0x1f
+#define RG_AUDLOLGAIN_MASK_SFT                            (0x1f << 0)
+#define RG_AUDLORGAIN_SFT                                 7
+#define RG_AUDLORGAIN_MASK                                0x1f
+#define RG_AUDLORGAIN_MASK_SFT                            (0x1f << 7)
+
+/* MT6359_ZCD_CON2 */
+#define RG_AUDHPLGAIN_SFT                                 0
+#define RG_AUDHPLGAIN_MASK                                0x1f
+#define RG_AUDHPLGAIN_MASK_SFT                            (0x1f << 0)
+#define RG_AUDHPRGAIN_SFT                                 7
+#define RG_AUDHPRGAIN_MASK                                0x1f
+#define RG_AUDHPRGAIN_MASK_SFT                            (0x1f << 7)
+
+/* MT6359_ZCD_CON3 */
+#define RG_AUDHSGAIN_SFT                                  0
+#define RG_AUDHSGAIN_MASK                                 0x1f
+#define RG_AUDHSGAIN_MASK_SFT                             (0x1f << 0)
+
+/* MT6359_ZCD_CON4 */
+#define RG_AUDIVLGAIN_SFT                                 0
+#define RG_AUDIVLGAIN_MASK                                0x7
+#define RG_AUDIVLGAIN_MASK_SFT                            (0x7 << 0)
+#define RG_AUDIVRGAIN_SFT                                 8
+#define RG_AUDIVRGAIN_MASK                                0x7
+#define RG_AUDIVRGAIN_MASK_SFT                            (0x7 << 8)
+
+/* MT6359_ZCD_CON5 */
+#define RG_AUDINTGAIN1_SFT                                0
+#define RG_AUDINTGAIN1_MASK                               0x3f
+#define RG_AUDINTGAIN1_MASK_SFT                           (0x3f << 0)
+#define RG_AUDINTGAIN2_SFT                                8
+#define RG_AUDINTGAIN2_MASK                               0x3f
+#define RG_AUDINTGAIN2_MASK_SFT                           (0x3f << 8)
+
+/* audio register */
+#define MT6359_GPIO_DIR0                     0x88
+#define MT6359_GPIO_DIR0_SET                 0x8a
+#define MT6359_GPIO_DIR0_CLR                 0x8c
+#define MT6359_GPIO_DIR1                     0x8e
+#define MT6359_GPIO_DIR1_SET                 0x90
+#define MT6359_GPIO_DIR1_CLR                 0x92
+
+#define MT6359_DCXO_CW11                     0x7a6
+#define MT6359_DCXO_CW12                     0x7a8
+#define MT6359_LDO_VAUD18_CON0               0x1c98
+
+#define MT6359_GPIO_MODE0                    0xcc
+#define MT6359_GPIO_MODE0_SET                0xce
+#define MT6359_GPIO_MODE0_CLR                0xd0
+#define MT6359_GPIO_MODE1                    0xd2
+#define MT6359_GPIO_MODE1_SET                0xd4
+#define MT6359_GPIO_MODE1_CLR                0xd6
+#define MT6359_GPIO_MODE2                    0xd8
+#define MT6359_GPIO_MODE2_SET                0xda
+#define MT6359_GPIO_MODE2_CLR                0xdc
+#define MT6359_GPIO_MODE3                    0xde
+#define MT6359_GPIO_MODE3_SET                0xe0
+#define MT6359_GPIO_MODE3_CLR                0xe2
+#define MT6359_GPIO_MODE4                    0xe4
+#define MT6359_GPIO_MODE4_SET                0xe6
+#define MT6359_GPIO_MODE4_CLR                0xe8
+
+#define MT6359_AUD_TOP_ID                    0x2300
+#define MT6359_AUD_TOP_REV0                  0x2302
+#define MT6359_AUD_TOP_DBI                   0x2304
+#define MT6359_AUD_TOP_DXI                   0x2306
+#define MT6359_AUD_TOP_CKPDN_TPM0            0x2308
+#define MT6359_AUD_TOP_CKPDN_TPM1            0x230a
+#define MT6359_AUD_TOP_CKPDN_CON0            0x230c
+#define MT6359_AUD_TOP_CKPDN_CON0_SET        0x230e
+#define MT6359_AUD_TOP_CKPDN_CON0_CLR        0x2310
+#define MT6359_AUD_TOP_CKSEL_CON0            0x2312
+#define MT6359_AUD_TOP_CKSEL_CON0_SET        0x2314
+#define MT6359_AUD_TOP_CKSEL_CON0_CLR        0x2316
+#define MT6359_AUD_TOP_CKTST_CON0            0x2318
+#define MT6359_AUD_TOP_CLK_HWEN_CON0         0x231a
+#define MT6359_AUD_TOP_CLK_HWEN_CON0_SET     0x231c
+#define MT6359_AUD_TOP_CLK_HWEN_CON0_CLR     0x231e
+#define MT6359_AUD_TOP_RST_CON0              0x2320
+#define MT6359_AUD_TOP_RST_CON0_SET          0x2322
+#define MT6359_AUD_TOP_RST_CON0_CLR          0x2324
+#define MT6359_AUD_TOP_RST_BANK_CON0         0x2326
+#define MT6359_AUD_TOP_INT_CON0              0x2328
+#define MT6359_AUD_TOP_INT_CON0_SET          0x232a
+#define MT6359_AUD_TOP_INT_CON0_CLR          0x232c
+#define MT6359_AUD_TOP_INT_MASK_CON0         0x232e
+#define MT6359_AUD_TOP_INT_MASK_CON0_SET     0x2330
+#define MT6359_AUD_TOP_INT_MASK_CON0_CLR     0x2332
+#define MT6359_AUD_TOP_INT_STATUS0           0x2334
+#define MT6359_AUD_TOP_INT_RAW_STATUS0       0x2336
+#define MT6359_AUD_TOP_INT_MISC_CON0         0x2338
+#define MT6359_AUD_TOP_MON_CON0              0x233a
+#define MT6359_AUDIO_DIG_DSN_ID              0x2380
+#define MT6359_AUDIO_DIG_DSN_REV0            0x2382
+#define MT6359_AUDIO_DIG_DSN_DBI             0x2384
+#define MT6359_AUDIO_DIG_DSN_DXI             0x2386
+#define MT6359_AFE_UL_DL_CON0                0x2388
+#define MT6359_AFE_DL_SRC2_CON0_L            0x238a
+#define MT6359_AFE_UL_SRC_CON0_H             0x238c
+#define MT6359_AFE_UL_SRC_CON0_L             0x238e
+#define MT6359_AFE_ADDA6_L_SRC_CON0_H        0x2390
+#define MT6359_AFE_ADDA6_UL_SRC_CON0_L       0x2392
+#define MT6359_AFE_TOP_CON0                  0x2394
+#define MT6359_AUDIO_TOP_CON0                0x2396
+#define MT6359_AFE_MON_DEBUG0                0x2398
+#define MT6359_AFUNC_AUD_CON0                0x239a
+#define MT6359_AFUNC_AUD_CON1                0x239c
+#define MT6359_AFUNC_AUD_CON2                0x239e
+#define MT6359_AFUNC_AUD_CON3                0x23a0
+#define MT6359_AFUNC_AUD_CON4                0x23a2
+#define MT6359_AFUNC_AUD_CON5                0x23a4
+#define MT6359_AFUNC_AUD_CON6                0x23a6
+#define MT6359_AFUNC_AUD_CON7                0x23a8
+#define MT6359_AFUNC_AUD_CON8                0x23aa
+#define MT6359_AFUNC_AUD_CON9                0x23ac
+#define MT6359_AFUNC_AUD_CON10               0x23ae
+#define MT6359_AFUNC_AUD_CON11               0x23b0
+#define MT6359_AFUNC_AUD_CON12               0x23b2
+#define MT6359_AFUNC_AUD_MON0                0x23b4
+#define MT6359_AFUNC_AUD_MON1                0x23b6
+#define MT6359_AUDRC_TUNE_MON0               0x23b8
+#define MT6359_AFE_ADDA_MTKAIF_FIFO_CFG0     0x23ba
+#define MT6359_AFE_ADDA_MTKAIF_FIFO_LOG_MON1 0x23bc
+#define MT6359_AFE_ADDA_MTKAIF_MON0          0x23be
+#define MT6359_AFE_ADDA_MTKAIF_MON1          0x23c0
+#define MT6359_AFE_ADDA_MTKAIF_MON2          0x23c2
+#define MT6359_AFE_ADDA6_MTKAIF_MON3         0x23c4
+#define MT6359_AFE_ADDA_MTKAIF_MON4          0x23c6
+#define MT6359_AFE_ADDA_MTKAIF_MON5          0x23c8
+#define MT6359_AFE_ADDA_MTKAIF_CFG0          0x23ca
+#define MT6359_AFE_ADDA_MTKAIF_RX_CFG0       0x23cc
+#define MT6359_AFE_ADDA_MTKAIF_RX_CFG1       0x23ce
+#define MT6359_AFE_ADDA_MTKAIF_RX_CFG2       0x23d0
+#define MT6359_AFE_ADDA_MTKAIF_RX_CFG3       0x23d2
+#define MT6359_AFE_ADDA_MTKAIF_SYNCWORD_CFG0 0x23d4
+#define MT6359_AFE_ADDA_MTKAIF_SYNCWORD_CFG1 0x23d6
+#define MT6359_AFE_SGEN_CFG0                 0x23d8
+#define MT6359_AFE_SGEN_CFG1                 0x23da
+#define MT6359_AFE_ADC_ASYNC_FIFO_CFG        0x23dc
+#define MT6359_AFE_ADC_ASYNC_FIFO_CFG1       0x23de
+#define MT6359_AFE_DCCLK_CFG0                0x23e0
+#define MT6359_AFE_DCCLK_CFG1                0x23e2
+#define MT6359_AUDIO_DIG_CFG                 0x23e4
+#define MT6359_AUDIO_DIG_CFG1                0x23e6
+#define MT6359_AFE_AUD_PAD_TOP               0x23e8
+#define MT6359_AFE_AUD_PAD_TOP_MON           0x23ea
+#define MT6359_AFE_AUD_PAD_TOP_MON1          0x23ec
+#define MT6359_AFE_AUD_PAD_TOP_MON2          0x23ee
+#define MT6359_AFE_DL_NLE_CFG                0x23f0
+#define MT6359_AFE_DL_NLE_MON                0x23f2
+#define MT6359_AFE_CG_EN_MON                 0x23f4
+#define MT6359_AFE_MIC_ARRAY_CFG             0x23f6
+#define MT6359_AFE_CHOP_CFG0                 0x23f8
+#define MT6359_AFE_MTKAIF_MUX_CFG            0x23fa
+#define MT6359_AUDIO_DIG_2ND_DSN_ID          0x2400
+#define MT6359_AUDIO_DIG_2ND_DSN_REV0        0x2402
+#define MT6359_AUDIO_DIG_2ND_DSN_DBI         0x2404
+#define MT6359_AUDIO_DIG_2ND_DSN_DXI         0x2406
+#define MT6359_AFE_PMIC_NEWIF_CFG3           0x2408
+#define MT6359_AFE_VOW_TOP_CON0              0x240a
+#define MT6359_AFE_VOW_TOP_CON1              0x240c
+#define MT6359_AFE_VOW_TOP_CON2              0x240e
+#define MT6359_AFE_VOW_TOP_CON3              0x2410
+#define MT6359_AFE_VOW_TOP_CON4              0x2412
+#define MT6359_AFE_VOW_TOP_MON0              0x2414
+#define MT6359_AFE_VOW_VAD_CFG0              0x2416
+#define MT6359_AFE_VOW_VAD_CFG1              0x2418
+#define MT6359_AFE_VOW_VAD_CFG2              0x241a
+#define MT6359_AFE_VOW_VAD_CFG3              0x241c
+#define MT6359_AFE_VOW_VAD_CFG4              0x241e
+#define MT6359_AFE_VOW_VAD_CFG5              0x2420
+#define MT6359_AFE_VOW_VAD_CFG6              0x2422
+#define MT6359_AFE_VOW_VAD_CFG7              0x2424
+#define MT6359_AFE_VOW_VAD_CFG8              0x2426
+#define MT6359_AFE_VOW_VAD_CFG9              0x2428
+#define MT6359_AFE_VOW_VAD_CFG10             0x242a
+#define MT6359_AFE_VOW_VAD_CFG11             0x242c
+#define MT6359_AFE_VOW_VAD_CFG12             0x242e
+#define MT6359_AFE_VOW_VAD_MON0              0x2430
+#define MT6359_AFE_VOW_VAD_MON1              0x2432
+#define MT6359_AFE_VOW_VAD_MON2              0x2434
+#define MT6359_AFE_VOW_VAD_MON3              0x2436
+#define MT6359_AFE_VOW_VAD_MON4              0x2438
+#define MT6359_AFE_VOW_VAD_MON5              0x243a
+#define MT6359_AFE_VOW_VAD_MON6              0x243c
+#define MT6359_AFE_VOW_VAD_MON7              0x243e
+#define MT6359_AFE_VOW_VAD_MON8              0x2440
+#define MT6359_AFE_VOW_VAD_MON9              0x2442
+#define MT6359_AFE_VOW_VAD_MON10             0x2444
+#define MT6359_AFE_VOW_VAD_MON11             0x2446
+#define MT6359_AFE_VOW_TGEN_CFG0             0x2448
+#define MT6359_AFE_VOW_TGEN_CFG1             0x244a
+#define MT6359_AFE_VOW_HPF_CFG0              0x244c
+#define MT6359_AFE_VOW_HPF_CFG1              0x244e
+#define MT6359_AUDIO_DIG_3RD_DSN_ID          0x2480
+#define MT6359_AUDIO_DIG_3RD_DSN_REV0        0x2482
+#define MT6359_AUDIO_DIG_3RD_DSN_DBI         0x2484
+#define MT6359_AUDIO_DIG_3RD_DSN_DXI         0x2486
+#define MT6359_AFE_VOW_PERIODIC_CFG0         0x2488
+#define MT6359_AFE_VOW_PERIODIC_CFG1         0x248a
+#define MT6359_AFE_VOW_PERIODIC_CFG2         0x248c
+#define MT6359_AFE_VOW_PERIODIC_CFG3         0x248e
+#define MT6359_AFE_VOW_PERIODIC_CFG4         0x2490
+#define MT6359_AFE_VOW_PERIODIC_CFG5         0x2492
+#define MT6359_AFE_VOW_PERIODIC_CFG6         0x2494
+#define MT6359_AFE_VOW_PERIODIC_CFG7         0x2496
+#define MT6359_AFE_VOW_PERIODIC_CFG8         0x2498
+#define MT6359_AFE_VOW_PERIODIC_CFG9         0x249a
+#define MT6359_AFE_VOW_PERIODIC_CFG10        0x249c
+#define MT6359_AFE_VOW_PERIODIC_CFG11        0x249e
+#define MT6359_AFE_VOW_PERIODIC_CFG12        0x24a0
+#define MT6359_AFE_VOW_PERIODIC_CFG13        0x24a2
+#define MT6359_AFE_VOW_PERIODIC_CFG14        0x24a4
+#define MT6359_AFE_VOW_PERIODIC_CFG15        0x24a6
+#define MT6359_AFE_VOW_PERIODIC_CFG16        0x24a8
+#define MT6359_AFE_VOW_PERIODIC_CFG17        0x24aa
+#define MT6359_AFE_VOW_PERIODIC_CFG18        0x24ac
+#define MT6359_AFE_VOW_PERIODIC_CFG19        0x24ae
+#define MT6359_AFE_VOW_PERIODIC_CFG20        0x24b0
+#define MT6359_AFE_VOW_PERIODIC_CFG21        0x24b2
+#define MT6359_AFE_VOW_PERIODIC_CFG22        0x24b4
+#define MT6359_AFE_VOW_PERIODIC_CFG23        0x24b6
+#define MT6359_AFE_VOW_PERIODIC_CFG24        0x24b8
+#define MT6359_AFE_VOW_PERIODIC_CFG25        0x24ba
+#define MT6359_AFE_VOW_PERIODIC_CFG26        0x24bc
+#define MT6359_AFE_VOW_PERIODIC_CFG27        0x24be
+#define MT6359_AFE_VOW_PERIODIC_CFG28        0x24c0
+#define MT6359_AFE_VOW_PERIODIC_CFG29        0x24c2
+#define MT6359_AFE_VOW_PERIODIC_CFG30        0x24c4
+#define MT6359_AFE_VOW_PERIODIC_CFG31        0x24c6
+#define MT6359_AFE_VOW_PERIODIC_CFG32        0x24c8
+#define MT6359_AFE_VOW_PERIODIC_CFG33        0x24ca
+#define MT6359_AFE_VOW_PERIODIC_CFG34        0x24cc
+#define MT6359_AFE_VOW_PERIODIC_CFG35        0x24ce
+#define MT6359_AFE_VOW_PERIODIC_CFG36        0x24d0
+#define MT6359_AFE_VOW_PERIODIC_CFG37        0x24d2
+#define MT6359_AFE_VOW_PERIODIC_CFG38        0x24d4
+#define MT6359_AFE_VOW_PERIODIC_CFG39        0x24d6
+#define MT6359_AFE_VOW_PERIODIC_MON0         0x24d8
+#define MT6359_AFE_VOW_PERIODIC_MON1         0x24da
+#define MT6359_AFE_VOW_PERIODIC_MON2         0x24dc
+#define MT6359_AFE_NCP_CFG0                  0x24de
+#define MT6359_AFE_NCP_CFG1                  0x24e0
+#define MT6359_AFE_NCP_CFG2                  0x24e2
+#define MT6359_AUDENC_DSN_ID                 0x2500
+#define MT6359_AUDENC_DSN_REV0               0x2502
+#define MT6359_AUDENC_DSN_DBI                0x2504
+#define MT6359_AUDENC_DSN_FPI                0x2506
+#define MT6359_AUDENC_ANA_CON0               0x2508
+#define MT6359_AUDENC_ANA_CON1               0x250a
+#define MT6359_AUDENC_ANA_CON2               0x250c
+#define MT6359_AUDENC_ANA_CON3               0x250e
+#define MT6359_AUDENC_ANA_CON4               0x2510
+#define MT6359_AUDENC_ANA_CON5               0x2512
+#define MT6359_AUDENC_ANA_CON6               0x2514
+#define MT6359_AUDENC_ANA_CON7               0x2516
+#define MT6359_AUDENC_ANA_CON8               0x2518
+#define MT6359_AUDENC_ANA_CON9               0x251a
+#define MT6359_AUDENC_ANA_CON10              0x251c
+#define MT6359_AUDENC_ANA_CON11              0x251e
+#define MT6359_AUDENC_ANA_CON12              0x2520
+#define MT6359_AUDENC_ANA_CON13              0x2522
+#define MT6359_AUDENC_ANA_CON14              0x2524
+#define MT6359_AUDENC_ANA_CON15              0x2526
+#define MT6359_AUDENC_ANA_CON16              0x2528
+#define MT6359_AUDENC_ANA_CON17              0x252a
+#define MT6359_AUDENC_ANA_CON18              0x252c
+#define MT6359_AUDENC_ANA_CON19              0x252e
+#define MT6359_AUDENC_ANA_CON20              0x2530
+#define MT6359_AUDENC_ANA_CON21              0x2532
+#define MT6359_AUDENC_ANA_CON22              0x2534
+#define MT6359_AUDENC_ANA_CON23              0x2536
+#define MT6359_AUDDEC_DSN_ID                 0x2580
+#define MT6359_AUDDEC_DSN_REV0               0x2582
+#define MT6359_AUDDEC_DSN_DBI                0x2584
+#define MT6359_AUDDEC_DSN_FPI                0x2586
+#define MT6359_AUDDEC_ANA_CON0               0x2588
+#define MT6359_AUDDEC_ANA_CON1               0x258a
+#define MT6359_AUDDEC_ANA_CON2               0x258c
+#define MT6359_AUDDEC_ANA_CON3               0x258e
+#define MT6359_AUDDEC_ANA_CON4               0x2590
+#define MT6359_AUDDEC_ANA_CON5               0x2592
+#define MT6359_AUDDEC_ANA_CON6               0x2594
+#define MT6359_AUDDEC_ANA_CON7               0x2596
+#define MT6359_AUDDEC_ANA_CON8               0x2598
+#define MT6359_AUDDEC_ANA_CON9               0x259a
+#define MT6359_AUDDEC_ANA_CON10              0x259c
+#define MT6359_AUDDEC_ANA_CON11              0x259e
+#define MT6359_AUDDEC_ANA_CON12              0x25a0
+#define MT6359_AUDDEC_ANA_CON13              0x25a2
+#define MT6359_AUDDEC_ANA_CON14              0x25a4
+#define MT6359_AUDZCD_DSN_ID                 0x2600
+#define MT6359_AUDZCD_DSN_REV0               0x2602
+#define MT6359_AUDZCD_DSN_DBI                0x2604
+#define MT6359_AUDZCD_DSN_FPI                0x2606
+#define MT6359_ZCD_CON0                      0x2608
+#define MT6359_ZCD_CON1                      0x260a
+#define MT6359_ZCD_CON2                      0x260c
+#define MT6359_ZCD_CON3                      0x260e
+#define MT6359_ZCD_CON4                      0x2610
+#define MT6359_ZCD_CON5                      0x2612
+#define MT6359_ACCDET_DSN_DIG_ID             0x2680
+#define MT6359_ACCDET_DSN_DIG_REV0           0x2682
+#define MT6359_ACCDET_DSN_DBI                0x2684
+#define MT6359_ACCDET_DSN_FPI                0x2686
+#define MT6359_ACCDET_CON0                   0x2688
+#define MT6359_ACCDET_CON1                   0x268a
+#define MT6359_ACCDET_CON2                   0x268c
+#define MT6359_ACCDET_CON3                   0x268e
+#define MT6359_ACCDET_CON4                   0x2690
+#define MT6359_ACCDET_CON5                   0x2692
+#define MT6359_ACCDET_CON6                   0x2694
+#define MT6359_ACCDET_CON7                   0x2696
+#define MT6359_ACCDET_CON8                   0x2698
+#define MT6359_ACCDET_CON9                   0x269a
+#define MT6359_ACCDET_CON10                  0x269c
+#define MT6359_ACCDET_CON11                  0x269e
+#define MT6359_ACCDET_CON12                  0x26a0
+#define MT6359_ACCDET_CON13                  0x26a2
+#define MT6359_ACCDET_CON14                  0x26a4
+#define MT6359_ACCDET_CON15                  0x26a6
+#define MT6359_ACCDET_CON16                  0x26a8
+#define MT6359_ACCDET_CON17                  0x26aa
+#define MT6359_ACCDET_CON18                  0x26ac
+#define MT6359_ACCDET_CON19                  0x26ae
+#define MT6359_ACCDET_CON20                  0x26b0
+#define MT6359_ACCDET_CON21                  0x26b2
+#define MT6359_ACCDET_CON22                  0x26b4
+#define MT6359_ACCDET_CON23                  0x26b6
+#define MT6359_ACCDET_CON24                  0x26b8
+#define MT6359_ACCDET_CON25                  0x26ba
+#define MT6359_ACCDET_CON26                  0x26bc
+#define MT6359_ACCDET_CON27                  0x26be
+#define MT6359_ACCDET_CON28                  0x26c0
+#define MT6359_ACCDET_CON29                  0x26c2
+#define MT6359_ACCDET_CON30                  0x26c4
+#define MT6359_ACCDET_CON31                  0x26c6
+#define MT6359_ACCDET_CON32                  0x26c8
+#define MT6359_ACCDET_CON33                  0x26ca
+#define MT6359_ACCDET_CON34                  0x26cc
+#define MT6359_ACCDET_CON35                  0x26ce
+#define MT6359_ACCDET_CON36                  0x26d0
+#define MT6359_ACCDET_CON37                  0x26d2
+#define MT6359_ACCDET_CON38                  0x26d4
+#define MT6359_ACCDET_CON39                  0x26d6
+#define MT6359_ACCDET_CON40                  0x26d8
+#define MT6359_MAX_REGISTER MT6359_ZCD_CON5
+
+enum {
+	MT6359_MTKAIF_PROTOCOL_1 = 0,
+	MT6359_MTKAIF_PROTOCOL_2,
+	MT6359_MTKAIF_PROTOCOL_2_CLK_P2,
+};
+
+#define CODEC_MT6359_NAME "mtk-codec-mt6359"
+
+int mt6359_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
+			       int mtkaif_protocol);
+
+int mt6359_mtkaif_calibration_enable(struct snd_soc_component *cmpnt);
+int mt6359_mtkaif_calibration_disable(struct snd_soc_component *cmpnt);
+int mt6359_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
+					int phase_1, int phase_2, int phase_3);
+
+#endif/* end _MT6359_H_ */
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
