Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D5BC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:05:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD0322384
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ilt96h91";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OYTmYQhc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD0322384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7N9QwO3ZHyQ9szyyOOGegTJZugb4MC/PTAiznNQ42Xk=; b=Ilt96h910TNhoZf3y1Y6yxUrC
	xJYKortxKS8YsiJwc137ShGFaj4Fsh8pIiHGmLN9pUUlP63nLfnkF5jYFUZrdZ+WYY2EvgNibd8yi
	+S2EuSuabtpP8dUxaMF8ITWjUMojIGyCcFq3Hx6zUOU6P3IxjqvGIZc2Jq1GUhZREg8LiAqqMhND3
	/h8DfX2ju7LIfAMA4N1YVsEyyeMnsP95V/9tUIypX/Nwz64gfnmedielRbKMJHD+zEqJG8b98YhEL
	t9OFbbumtv04FQFpL9zs/lRrmAloQQBo8CMIdLFmZOU8bdqkRn0jI6wZ+HbebEVF1A0vAOmVP/XbW
	p5Ur/fJIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZrJS-00060C-Na; Tue, 03 Nov 2020 08:05:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZrIs-0005kz-2E; Tue, 03 Nov 2020 08:04:36 +0000
X-UUID: 893daab9bded4177bb87ca897d74587e-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hmkqyLRT67Aw8wizCklryiLh18xZPR71jlnqVGWfoZw=; 
 b=OYTmYQhccbXZwtiVISkKk7J4WOdHNJYDygMlDhx5kyNXOF50UDNrpJuiH/WCOE4B27N6qXJdTEsIUtJMFrTpQNosybueLngMxtVVe14kHO8fh37HhOia/flCO/fzp0XuVNnYuJ3x0TxV8MLeB+6+q8hZXbrmq1ftSDqWss5Qxcc=;
X-UUID: 893daab9bded4177bb87ca897d74587e-20201103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1424984987; Tue, 03 Nov 2020 00:04:24 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 23:59:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:59:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 15:59:44 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 3/9] ASoC: mediatek: mt8192: support i2s in platform driver
Date: Tue, 3 Nov 2020 15:59:32 +0800
Message-ID: <1604390378-23993-4-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 519CEBBBD19C9A33D2874DB3A2C3B6C95BFA6C51B485DCCB2E984D3D5935DE692000:8
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

This patch adds mt8192 i2s dai driver.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c | 2110 ++++++++++++++++++++
 1 file changed, 2110 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
new file mode 100644
index 0000000000000..53c560ea4aae6
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -0,0 +1,2110 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// MediaTek ALSA SoC Audio DAI I2S Control
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Shane Chien <shane.chien@mediatek.com>
+//
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+
+#include "mt8192-afe-clk.h"
+#include "mt8192-afe-common.h"
+#include "mt8192-afe-gpio.h"
+#include "mt8192-interconnection.h"
+
+enum {
+	I2S_FMT_EIAJ = 0,
+	I2S_FMT_I2S = 1,
+};
+
+enum {
+	I2S_WLEN_16_BIT = 0,
+	I2S_WLEN_32_BIT = 1,
+};
+
+enum {
+	I2S_HD_NORMAL = 0,
+	I2S_HD_LOW_JITTER = 1,
+};
+
+enum {
+	I2S1_SEL_O28_O29 = 0,
+	I2S1_SEL_O03_O04 = 1,
+};
+
+enum {
+	I2S_IN_PAD_CONNSYS = 0,
+	I2S_IN_PAD_IO_MUX = 1,
+};
+
+struct mtk_afe_i2s_priv {
+	int id;
+	int rate; /* for determine which apll to use */
+	int low_jitter_en;
+
+	const char *share_property_name;
+	int share_i2s_id;
+
+	int mclk_id;
+	int mclk_rate;
+	int mclk_apll;
+};
+
+static unsigned int get_i2s_wlen(snd_pcm_format_t format)
+{
+	return snd_pcm_format_physical_width(format) <= 16 ?
+	       I2S_WLEN_16_BIT : I2S_WLEN_32_BIT;
+}
+
+#define MTK_AFE_I2S0_KCONTROL_NAME "I2S0_HD_Mux"
+#define MTK_AFE_I2S1_KCONTROL_NAME "I2S1_HD_Mux"
+#define MTK_AFE_I2S2_KCONTROL_NAME "I2S2_HD_Mux"
+#define MTK_AFE_I2S3_KCONTROL_NAME "I2S3_HD_Mux"
+#define MTK_AFE_I2S5_KCONTROL_NAME "I2S5_HD_Mux"
+#define MTK_AFE_I2S6_KCONTROL_NAME "I2S6_HD_Mux"
+#define MTK_AFE_I2S7_KCONTROL_NAME "I2S7_HD_Mux"
+#define MTK_AFE_I2S8_KCONTROL_NAME "I2S8_HD_Mux"
+#define MTK_AFE_I2S9_KCONTROL_NAME "I2S9_HD_Mux"
+
+#define I2S0_HD_EN_W_NAME "I2S0_HD_EN"
+#define I2S1_HD_EN_W_NAME "I2S1_HD_EN"
+#define I2S2_HD_EN_W_NAME "I2S2_HD_EN"
+#define I2S3_HD_EN_W_NAME "I2S3_HD_EN"
+#define I2S5_HD_EN_W_NAME "I2S5_HD_EN"
+#define I2S6_HD_EN_W_NAME "I2S6_HD_EN"
+#define I2S7_HD_EN_W_NAME "I2S7_HD_EN"
+#define I2S8_HD_EN_W_NAME "I2S8_HD_EN"
+#define I2S9_HD_EN_W_NAME "I2S9_HD_EN"
+
+#define I2S0_MCLK_EN_W_NAME "I2S0_MCLK_EN"
+#define I2S1_MCLK_EN_W_NAME "I2S1_MCLK_EN"
+#define I2S2_MCLK_EN_W_NAME "I2S2_MCLK_EN"
+#define I2S3_MCLK_EN_W_NAME "I2S3_MCLK_EN"
+#define I2S5_MCLK_EN_W_NAME "I2S5_MCLK_EN"
+#define I2S6_MCLK_EN_W_NAME "I2S6_MCLK_EN"
+#define I2S7_MCLK_EN_W_NAME "I2S7_MCLK_EN"
+#define I2S8_MCLK_EN_W_NAME "I2S8_MCLK_EN"
+#define I2S9_MCLK_EN_W_NAME "I2S9_MCLK_EN"
+
+static int get_i2s_id_by_name(struct mtk_base_afe *afe,
+			      const char *name)
+{
+	if (strncmp(name, "I2S0", 4) == 0)
+		return MT8192_DAI_I2S_0;
+	else if (strncmp(name, "I2S1", 4) == 0)
+		return MT8192_DAI_I2S_1;
+	else if (strncmp(name, "I2S2", 4) == 0)
+		return MT8192_DAI_I2S_2;
+	else if (strncmp(name, "I2S3", 4) == 0)
+		return MT8192_DAI_I2S_3;
+	else if (strncmp(name, "I2S5", 4) == 0)
+		return MT8192_DAI_I2S_5;
+	else if (strncmp(name, "I2S6", 4) == 0)
+		return MT8192_DAI_I2S_6;
+	else if (strncmp(name, "I2S7", 4) == 0)
+		return MT8192_DAI_I2S_7;
+	else if (strncmp(name, "I2S8", 4) == 0)
+		return MT8192_DAI_I2S_8;
+	else if (strncmp(name, "I2S9", 4) == 0)
+		return MT8192_DAI_I2S_9;
+	else
+		return -EINVAL;
+}
+
+static struct mtk_afe_i2s_priv *get_i2s_priv_by_name(struct mtk_base_afe *afe,
+						     const char *name)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int dai_id = get_i2s_id_by_name(afe, name);
+
+	if (dai_id < 0)
+		return NULL;
+
+	return afe_priv->dai_priv[dai_id];
+}
+
+/* low jitter control */
+static const char * const mt8192_i2s_hd_str[] = {
+	"Normal", "Low_Jitter"
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(mt8192_i2s_enum, mt8192_i2s_hd_str);
+
+static int mt8192_i2s_hd_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	i2s_priv = get_i2s_priv_by_name(afe, kcontrol->id.name);
+
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return -EINVAL;
+	}
+
+	ucontrol->value.integer.value[0] = i2s_priv->low_jitter_en;
+
+	return 0;
+}
+
+static int mt8192_i2s_hd_set(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int hd_en;
+
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
+	hd_en = ucontrol->value.integer.value[0];
+
+	dev_dbg(afe->dev, "%s(), kcontrol name %s, hd_en %d\n",
+		__func__, kcontrol->id.name, hd_en);
+
+	i2s_priv = get_i2s_priv_by_name(afe, kcontrol->id.name);
+
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return -EINVAL;
+	}
+
+	i2s_priv->low_jitter_en = hd_en;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new mtk_dai_i2s_controls[] = {
+	SOC_ENUM_EXT(MTK_AFE_I2S0_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S1_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S2_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S3_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S5_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S6_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S7_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S8_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2S9_KCONTROL_NAME, mt8192_i2s_enum,
+		     mt8192_i2s_hd_get, mt8192_i2s_hd_set),
+};
+
+/* dai component */
+/* i2s virtual mux to output widget */
+static const char * const i2s_mux_map[] = {
+	"Normal", "Dummy_Widget",
+};
+
+static int i2s_mux_map_value[] = {
+	0, 1,
+};
+
+static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(i2s_mux_map_enum,
+					      SND_SOC_NOPM,
+					      0,
+					      1,
+					      i2s_mux_map,
+					      i2s_mux_map_value);
+
+static const struct snd_kcontrol_new i2s0_in_mux_control =
+	SOC_DAPM_ENUM("I2S0 In Select", i2s_mux_map_enum);
+
+static const struct snd_kcontrol_new i2s8_in_mux_control =
+	SOC_DAPM_ENUM("I2S8 In Select", i2s_mux_map_enum);
+
+static const struct snd_kcontrol_new i2s1_out_mux_control =
+	SOC_DAPM_ENUM("I2S1 Out Select", i2s_mux_map_enum);
+
+static const struct snd_kcontrol_new i2s3_out_mux_control =
+	SOC_DAPM_ENUM("I2S3 Out Select", i2s_mux_map_enum);
+
+static const struct snd_kcontrol_new i2s5_out_mux_control =
+	SOC_DAPM_ENUM("I2S5 Out Select", i2s_mux_map_enum);
+
+static const struct snd_kcontrol_new i2s7_out_mux_control =
+	SOC_DAPM_ENUM("I2S7 Out Select", i2s_mux_map_enum);
+
+static const struct snd_kcontrol_new i2s9_out_mux_control =
+	SOC_DAPM_ENUM("I2S9 Out Select", i2s_mux_map_enum);
+
+/* Tinyconn Mux */
+enum {
+	TINYCONN_CH1_MUX_DL1 = 0x0,
+	TINYCONN_CH2_MUX_DL1 = 0x1,
+	TINYCONN_CH1_MUX_DL12 = 0x2,
+	TINYCONN_CH2_MUX_DL12 = 0x3,
+	TINYCONN_CH1_MUX_DL2 = 0x4,
+	TINYCONN_CH2_MUX_DL2 = 0x5,
+	TINYCONN_CH1_MUX_DL3 = 0x6,
+	TINYCONN_CH2_MUX_DL3 = 0x7,
+	TINYCONN_MUX_NONE = 0x1f,
+};
+
+static const char * const tinyconn_mux_map[] = {
+	"NONE",
+	"DL1_CH1",
+	"DL1_CH2",
+	"DL12_CH1",
+	"DL12_CH2",
+	"DL2_CH1",
+	"DL2_CH2",
+	"DL3_CH1",
+	"DL3_CH2",
+};
+
+static int tinyconn_mux_map_value[] = {
+	TINYCONN_MUX_NONE,
+	TINYCONN_CH1_MUX_DL1,
+	TINYCONN_CH2_MUX_DL1,
+	TINYCONN_CH1_MUX_DL12,
+	TINYCONN_CH2_MUX_DL12,
+	TINYCONN_CH1_MUX_DL2,
+	TINYCONN_CH2_MUX_DL2,
+	TINYCONN_CH1_MUX_DL3,
+	TINYCONN_CH2_MUX_DL3,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(i2s1_tinyconn_ch1_mux_map_enum,
+				  AFE_TINY_CONN5,
+				  O_20_CFG_SFT,
+				  O_20_CFG_MASK,
+				  tinyconn_mux_map,
+				  tinyconn_mux_map_value);
+static const struct snd_kcontrol_new i2s1_tinyconn_ch1_mux_control =
+	SOC_DAPM_ENUM("i2s1 ch1 tinyconn Select",
+		      i2s1_tinyconn_ch1_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(i2s1_tinyconn_ch2_mux_map_enum,
+				  AFE_TINY_CONN5,
+				  O_21_CFG_SFT,
+				  O_21_CFG_MASK,
+				  tinyconn_mux_map,
+				  tinyconn_mux_map_value);
+static const struct snd_kcontrol_new i2s1_tinyconn_ch2_mux_control =
+	SOC_DAPM_ENUM("i2s1 ch2 tinyconn Select",
+		      i2s1_tinyconn_ch2_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(i2s3_tinyconn_ch1_mux_map_enum,
+				  AFE_TINY_CONN5,
+				  O_22_CFG_SFT,
+				  O_22_CFG_MASK,
+				  tinyconn_mux_map,
+				  tinyconn_mux_map_value);
+static const struct snd_kcontrol_new i2s3_tinyconn_ch1_mux_control =
+	SOC_DAPM_ENUM("i2s3 ch1 tinyconn Select",
+		      i2s3_tinyconn_ch1_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(i2s3_tinyconn_ch2_mux_map_enum,
+				  AFE_TINY_CONN5,
+				  O_23_CFG_SFT,
+				  O_23_CFG_MASK,
+				  tinyconn_mux_map,
+				  tinyconn_mux_map_value);
+static const struct snd_kcontrol_new i2s3_tinyconn_ch2_mux_control =
+	SOC_DAPM_ENUM("i2s3 ch2 tinyconn Select",
+		      i2s3_tinyconn_ch2_mux_map_enum);
+
+/* i2s in lpbk */
+static const char * const i2s_lpbk_mux_map[] = {
+	"Normal", "Lpbk",
+};
+
+static int i2s_lpbk_mux_map_value[] = {
+	0, 1,
+};
+
+static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(i2s0_lpbk_mux_map_enum,
+					      AFE_I2S_CON,
+					      I2S_LOOPBACK_SFT,
+					      1,
+					      i2s_lpbk_mux_map,
+					      i2s_lpbk_mux_map_value);
+
+static const struct snd_kcontrol_new i2s0_lpbk_mux_control =
+	SOC_DAPM_ENUM("I2S Lpbk Select", i2s0_lpbk_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(i2s2_lpbk_mux_map_enum,
+					      AFE_I2S_CON2,
+					      I2S3_LOOPBACK_SFT,
+					      1,
+					      i2s_lpbk_mux_map,
+					      i2s_lpbk_mux_map_value);
+
+static const struct snd_kcontrol_new i2s2_lpbk_mux_control =
+	SOC_DAPM_ENUM("I2S Lpbk Select", i2s2_lpbk_mux_map_enum);
+
+/* interconnection */
+static const struct snd_kcontrol_new mtk_i2s3_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN0, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN0, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN0, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1", AFE_CONN0, I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN0_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN0_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN0_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN0_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH1", AFE_CONN0_1, I_DL9_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1", AFE_CONN0,
+				    I_GAIN1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN0,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN0,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s3_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN1, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN1, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN1, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2", AFE_CONN1, I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN1_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN1_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN1_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN1_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH2", AFE_CONN1_1, I_DL9_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2", AFE_CONN1,
+				    I_GAIN1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN1,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN1,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN1,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN1,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN1,
+				    I_PCM_2_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN1,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH2", AFE_CONN1,
+				    I_PCM_2_CAP_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s1_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN28, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN28, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN28, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1", AFE_CONN28, I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN28_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN28_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN28_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN28_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH1", AFE_CONN28_1, I_DL9_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1", AFE_CONN28,
+				    I_GAIN1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN28,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN28,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN28,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s1_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN29, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN29, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN29, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2", AFE_CONN29, I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN29_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN29_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN29_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN29_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH2", AFE_CONN29_1, I_DL9_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2", AFE_CONN29,
+				    I_GAIN1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN29,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN29,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN29,
+				    I_PCM_2_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN29,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH2", AFE_CONN29,
+				    I_PCM_2_CAP_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s5_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN30, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN30, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN30, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1", AFE_CONN30, I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN30_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN30_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN30_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN30_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH1", AFE_CONN30_1, I_DL9_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1", AFE_CONN30,
+				    I_GAIN1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN30,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN30,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN30,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s5_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN31, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN31, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN31, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2", AFE_CONN31, I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN31_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN31_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN31_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN31_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH2", AFE_CONN31_1, I_DL9_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2", AFE_CONN31,
+				    I_GAIN1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN31,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN31,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN31,
+				    I_PCM_2_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN31,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH2", AFE_CONN31,
+				    I_PCM_2_CAP_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s7_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN54, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN54, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN54, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1", AFE_CONN54, I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN54_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN54_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN54_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH1", AFE_CONN54_1, I_DL9_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1", AFE_CONN54,
+				    I_GAIN1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN54,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN54,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN54,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s7_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN55, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN55, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN55, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2", AFE_CONN55, I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN55_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN55_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN55_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH2", AFE_CONN55_1, I_DL9_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2", AFE_CONN55,
+				    I_GAIN1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN55,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN55,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN55,
+				    I_PCM_2_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN55,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH2", AFE_CONN55,
+				    I_PCM_2_CAP_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s9_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN56, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN56, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN56, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1", AFE_CONN56, I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN56_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN56_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN56_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN56_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH1", AFE_CONN56_1, I_DL9_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1", AFE_CONN56,
+				    I_GAIN1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN56,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN56,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN56,
+				    I_PCM_2_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2s9_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN57, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN57, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN57, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2", AFE_CONN57, I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN57_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN57_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN57_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN57_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL9_CH2", AFE_CONN57_1, I_DL9_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2", AFE_CONN57,
+				    I_GAIN1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN57,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN57,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH1", AFE_CONN57,
+				    I_PCM_2_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN57,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_2_CAP_CH2", AFE_CONN57,
+				    I_PCM_2_CAP_CH2, 1, 0),
+};
+
+enum {
+	SUPPLY_SEQ_APLL,
+	SUPPLY_SEQ_I2S_MCLK_EN,
+	SUPPLY_SEQ_I2S_HD_EN,
+	SUPPLY_SEQ_I2S_EN,
+};
+
+static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	i2s_priv = get_i2s_priv_by_name(afe, w->name);
+
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return -EINVAL;
+	}
+
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_apll_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (strcmp(w->name, APLL1_W_NAME) == 0)
+			mt8192_apll1_enable(afe);
+		else
+			mt8192_apll2_enable(afe);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (strcmp(w->name, APLL1_W_NAME) == 0)
+			mt8192_apll1_disable(afe);
+		else
+			mt8192_apll2_disable(afe);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int i2s_out_tinyconn_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol,
+				  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int reg;
+	unsigned int reg_shift;
+	unsigned int reg_mask_shift;
+
+	dev_dbg(afe->dev, "%s(), event 0x%x\n", __func__, event);
+
+	if (strstr(w->name, "I2S1")) {
+		reg = AFE_I2S_CON1;
+		reg_shift = I2S2_32BIT_EN_SFT;
+		reg_mask_shift = I2S2_32BIT_EN_MASK_SFT;
+	} else if (strstr(w->name, "I2S3")) {
+		reg = AFE_I2S_CON3;
+		reg_shift = I2S4_32BIT_EN_SFT;
+		reg_mask_shift = I2S4_32BIT_EN_MASK_SFT;
+	} else if (strstr(w->name, "I2S5")) {
+		reg = AFE_I2S_CON4;
+		reg_shift = I2S5_32BIT_EN_SFT;
+		reg_mask_shift = I2S5_32BIT_EN_MASK_SFT;
+	} else if (strstr(w->name, "I2S7")) {
+		reg = AFE_I2S_CON7;
+		reg_shift = I2S7_32BIT_EN_SFT;
+		reg_mask_shift = I2S7_32BIT_EN_MASK_SFT;
+	} else if (strstr(w->name, "I2S9")) {
+		reg = AFE_I2S_CON9;
+		reg_shift = I2S9_32BIT_EN_SFT;
+		reg_mask_shift = I2S9_32BIT_EN_MASK_SFT;
+	} else {
+		reg = AFE_I2S_CON1;
+		reg_shift = I2S2_32BIT_EN_SFT;
+		reg_mask_shift = I2S2_32BIT_EN_MASK_SFT;
+		dev_warn(afe->dev, "%s(), error widget name %s, use i2s1\n",
+			 __func__, w->name);
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		regmap_update_bits(afe->regmap, reg, reg_mask_shift,
+				   0x1 << reg_shift);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_update_bits(afe->regmap, reg, reg_mask_shift,
+				   0x0 << reg_shift);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	i2s_priv = get_i2s_priv_by_name(afe, w->name);
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return -EINVAL;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		i2s_priv->mclk_rate = 0;
+		mt8192_mck_disable(afe, i2s_priv->mclk_id);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
+	SND_SOC_DAPM_INPUT("CONNSYS"),
+
+	SND_SOC_DAPM_MIXER("I2S1_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s1_ch1_mix,
+			   ARRAY_SIZE(mtk_i2s1_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2S1_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s1_ch2_mix,
+			   ARRAY_SIZE(mtk_i2s1_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2S3_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s3_ch1_mix,
+			   ARRAY_SIZE(mtk_i2s3_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2S3_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s3_ch2_mix,
+			   ARRAY_SIZE(mtk_i2s3_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2S5_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s5_ch1_mix,
+			   ARRAY_SIZE(mtk_i2s5_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2S5_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s5_ch2_mix,
+			   ARRAY_SIZE(mtk_i2s5_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2S7_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s7_ch1_mix,
+			   ARRAY_SIZE(mtk_i2s7_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2S7_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s7_ch2_mix,
+			   ARRAY_SIZE(mtk_i2s7_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2S9_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s9_ch1_mix,
+			   ARRAY_SIZE(mtk_i2s9_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2S9_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2s9_ch2_mix,
+			   ARRAY_SIZE(mtk_i2s9_ch2_mix)),
+
+	SND_SOC_DAPM_MUX_E("I2S1_TINYCONN_CH1_MUX", SND_SOC_NOPM, 0, 0,
+			   &i2s1_tinyconn_ch1_mux_control,
+			   i2s_out_tinyconn_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX_E("I2S1_TINYCONN_CH2_MUX", SND_SOC_NOPM, 0, 0,
+			   &i2s1_tinyconn_ch2_mux_control,
+			   i2s_out_tinyconn_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX_E("I2S3_TINYCONN_CH1_MUX", SND_SOC_NOPM, 0, 0,
+			   &i2s3_tinyconn_ch1_mux_control,
+			   i2s_out_tinyconn_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX_E("I2S3_TINYCONN_CH2_MUX", SND_SOC_NOPM, 0, 0,
+			   &i2s3_tinyconn_ch2_mux_control,
+			   i2s_out_tinyconn_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	/* i2s en*/
+	SND_SOC_DAPM_SUPPLY_S("I2S0_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON, I2S_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S1_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON1, I2S_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S2_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON2, I2S_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S3_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON3, I2S_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S5_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON4, I2S5_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S6_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON6, I2S6_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S7_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON7, I2S7_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S8_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON8, I2S8_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("I2S9_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_I2S_CON9, I2S9_EN_SFT, 0,
+			      mtk_i2s_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	/* i2s hd en */
+	SND_SOC_DAPM_SUPPLY_S(I2S0_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON, I2S1_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S1_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON1, I2S2_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S2_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON2, I2S3_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S3_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON3, I2S4_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S5_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON4, I2S5_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S6_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON6, I2S6_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S7_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON7, I2S7_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S8_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON8, I2S8_HD_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S(I2S9_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_I2S_CON9, I2S9_HD_EN_SFT, 0, NULL, 0),
+
+	/* i2s mclk en */
+	SND_SOC_DAPM_SUPPLY_S(I2S0_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S1_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S2_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S3_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S5_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S6_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S7_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S8_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2S9_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* apll */
+	SND_SOC_DAPM_SUPPLY_S(APLL1_W_NAME, SUPPLY_SEQ_APLL,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_apll_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(APLL2_W_NAME, SUPPLY_SEQ_APLL,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_apll_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* allow i2s on without codec on */
+	SND_SOC_DAPM_OUTPUT("I2S_DUMMY_OUT"),
+	SND_SOC_DAPM_MUX("I2S1_Out_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s1_out_mux_control),
+	SND_SOC_DAPM_MUX("I2S3_Out_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s3_out_mux_control),
+	SND_SOC_DAPM_MUX("I2S5_Out_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s5_out_mux_control),
+	SND_SOC_DAPM_MUX("I2S7_Out_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s7_out_mux_control),
+	SND_SOC_DAPM_MUX("I2S9_Out_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s9_out_mux_control),
+
+	SND_SOC_DAPM_INPUT("I2S_DUMMY_IN"),
+	SND_SOC_DAPM_MUX("I2S0_In_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s0_in_mux_control),
+	SND_SOC_DAPM_MUX("I2S8_In_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s8_in_mux_control),
+
+	/* i2s in lpbk */
+	SND_SOC_DAPM_MUX("I2S0_Lpbk_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s0_lpbk_mux_control),
+	SND_SOC_DAPM_MUX("I2S2_Lpbk_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s2_lpbk_mux_control),
+};
+
+static int mtk_afe_i2s_share_connect(struct snd_soc_dapm_widget *source,
+				     struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	i2s_priv = get_i2s_priv_by_name(afe, sink->name);
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return 0;
+	}
+
+	if (i2s_priv->share_i2s_id < 0)
+		return 0;
+
+	return i2s_priv->share_i2s_id == get_i2s_id_by_name(afe, source->name);
+}
+
+static int mtk_afe_i2s_hd_connect(struct snd_soc_dapm_widget *source,
+				  struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	i2s_priv = get_i2s_priv_by_name(afe, sink->name);
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return 0;
+	}
+
+	if (get_i2s_id_by_name(afe, sink->name) ==
+	    get_i2s_id_by_name(afe, source->name))
+		return i2s_priv->low_jitter_en;
+
+	/* check if share i2s need hd en */
+	if (i2s_priv->share_i2s_id < 0)
+		return 0;
+
+	if (i2s_priv->share_i2s_id == get_i2s_id_by_name(afe, source->name))
+		return i2s_priv->low_jitter_en;
+
+	return 0;
+}
+
+static int mtk_afe_i2s_apll_connect(struct snd_soc_dapm_widget *source,
+				    struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int cur_apll;
+	int i2s_need_apll;
+
+	i2s_priv = get_i2s_priv_by_name(afe, w->name);
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return 0;
+	}
+
+	/* which apll */
+	cur_apll = mt8192_get_apll_by_name(afe, source->name);
+
+	/* choose APLL from i2s rate */
+	i2s_need_apll = mt8192_get_apll_by_rate(afe, i2s_priv->rate);
+
+	if (i2s_need_apll == cur_apll)
+		return 1;
+
+	return 0;
+}
+
+static int mtk_afe_i2s_mclk_connect(struct snd_soc_dapm_widget *source,
+				    struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	i2s_priv = get_i2s_priv_by_name(afe, sink->name);
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return 0;
+	}
+
+	if (get_i2s_id_by_name(afe, sink->name) ==
+	    get_i2s_id_by_name(afe, source->name))
+		return (i2s_priv->mclk_rate > 0) ? 1 : 0;
+
+	/* check if share i2s need mclk */
+	if (i2s_priv->share_i2s_id < 0)
+		return 0;
+
+	if (i2s_priv->share_i2s_id == get_i2s_id_by_name(afe, source->name))
+		return (i2s_priv->mclk_rate > 0) ? 1 : 0;
+
+	return 0;
+}
+
+static int mtk_afe_mclk_apll_connect(struct snd_soc_dapm_widget *source,
+				     struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int cur_apll;
+
+	i2s_priv = get_i2s_priv_by_name(afe, w->name);
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return 0;
+	}
+
+	/* which apll */
+	cur_apll = mt8192_get_apll_by_name(afe, source->name);
+
+	if (i2s_priv->mclk_apll == cur_apll)
+		return 1;
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
+	{"Connsys I2S", NULL, "CONNSYS"},
+
+	/* i2s0 */
+	{"I2S0", NULL, "I2S0_EN"},
+	{"I2S0", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S0", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S0", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S0", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S0", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S0", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S0", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S0", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S0", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S0", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S0_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S0_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S0", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S0", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S0_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S0_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s1 */
+	{"I2S1_CH1", "DL1_CH1", "DL1"},
+	{"I2S1_CH2", "DL1_CH2", "DL1"},
+	{"I2S1_TINYCONN_CH1_MUX", "DL1_CH1", "DL1"},
+	{"I2S1_TINYCONN_CH2_MUX", "DL1_CH2", "DL1"},
+
+	{"I2S1_CH1", "DL2_CH1", "DL2"},
+	{"I2S1_CH2", "DL2_CH2", "DL2"},
+	{"I2S1_TINYCONN_CH1_MUX", "DL2_CH1", "DL2"},
+	{"I2S1_TINYCONN_CH2_MUX", "DL2_CH2", "DL2"},
+
+	{"I2S1_CH1", "DL3_CH1", "DL3"},
+	{"I2S1_CH2", "DL3_CH2", "DL3"},
+	{"I2S1_TINYCONN_CH1_MUX", "DL3_CH1", "DL3"},
+	{"I2S1_TINYCONN_CH2_MUX", "DL3_CH2", "DL3"},
+
+	{"I2S1_CH1", "DL12_CH1", "DL12"},
+	{"I2S1_CH2", "DL12_CH2", "DL12"},
+	{"I2S1_TINYCONN_CH1_MUX", "DL12_CH1", "DL12"},
+	{"I2S1_TINYCONN_CH2_MUX", "DL12_CH2", "DL12"},
+
+	{"I2S1_CH1", "DL4_CH1", "DL4"},
+	{"I2S1_CH2", "DL4_CH2", "DL4"},
+
+	{"I2S1_CH1", "DL5_CH1", "DL5"},
+	{"I2S1_CH2", "DL5_CH2", "DL5"},
+
+	{"I2S1_CH1", "DL6_CH1", "DL6"},
+	{"I2S1_CH2", "DL6_CH2", "DL6"},
+
+	{"I2S1_CH1", "DL8_CH1", "DL8"},
+	{"I2S1_CH2", "DL8_CH2", "DL8"},
+
+	{"I2S1", NULL, "I2S1_CH1"},
+	{"I2S1", NULL, "I2S1_CH2"},
+	{"I2S1", NULL, "I2S3_TINYCONN_CH1_MUX"},
+	{"I2S1", NULL, "I2S3_TINYCONN_CH2_MUX"},
+
+	{"I2S1", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S1", NULL, "I2S1_EN"},
+	{"I2S1", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S1", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S1", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S1", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S1", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S1", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S1", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S1", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S1", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S1_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S1_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S1", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S1", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S1_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S1_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s2 */
+	{"I2S2", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S2", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S2", NULL, "I2S2_EN"},
+	{"I2S2", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S2", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S2", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S2", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S2", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S2", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S2", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S2", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S2_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S2_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S2", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S2", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S2_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S2_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s3 */
+	{"I2S3_CH1", "DL1_CH1", "DL1"},
+	{"I2S3_CH2", "DL1_CH2", "DL1"},
+	{"I2S3_TINYCONN_CH1_MUX", "DL1_CH1", "DL1"},
+	{"I2S3_TINYCONN_CH2_MUX", "DL1_CH2", "DL1"},
+
+	{"I2S3_CH1", "DL2_CH1", "DL2"},
+	{"I2S3_CH2", "DL2_CH2", "DL2"},
+	{"I2S3_TINYCONN_CH1_MUX", "DL2_CH1", "DL2"},
+	{"I2S3_TINYCONN_CH2_MUX", "DL2_CH2", "DL2"},
+
+	{"I2S3_CH1", "DL3_CH1", "DL3"},
+	{"I2S3_CH2", "DL3_CH2", "DL3"},
+	{"I2S3_TINYCONN_CH1_MUX", "DL3_CH1", "DL3"},
+	{"I2S3_TINYCONN_CH2_MUX", "DL3_CH2", "DL3"},
+
+	{"I2S3_CH1", "DL12_CH1", "DL12"},
+	{"I2S3_CH2", "DL12_CH2", "DL12"},
+	{"I2S3_TINYCONN_CH1_MUX", "DL12_CH1", "DL12"},
+	{"I2S3_TINYCONN_CH2_MUX", "DL12_CH2", "DL12"},
+
+	{"I2S3_CH1", "DL4_CH1", "DL4"},
+	{"I2S3_CH2", "DL4_CH2", "DL4"},
+
+	{"I2S3_CH1", "DL5_CH1", "DL5"},
+	{"I2S3_CH2", "DL5_CH2", "DL5"},
+
+	{"I2S3_CH1", "DL6_CH1", "DL6"},
+	{"I2S3_CH2", "DL6_CH2", "DL6"},
+
+	{"I2S3_CH1", "DL8_CH1", "DL8"},
+	{"I2S3_CH2", "DL8_CH2", "DL8"},
+
+	{"I2S3", NULL, "I2S3_CH1"},
+	{"I2S3", NULL, "I2S3_CH2"},
+	{"I2S3", NULL, "I2S3_TINYCONN_CH1_MUX"},
+	{"I2S3", NULL, "I2S3_TINYCONN_CH2_MUX"},
+
+	{"I2S3", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S3", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S3", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S3", NULL, "I2S3_EN"},
+	{"I2S3", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S3", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S3", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S3", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S3", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S3", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S3", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S3_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S3_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S3", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S3", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S3_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S3_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s5 */
+	{"I2S5_CH1", "DL1_CH1", "DL1"},
+	{"I2S5_CH2", "DL1_CH2", "DL1"},
+
+	{"I2S5_CH1", "DL2_CH1", "DL2"},
+	{"I2S5_CH2", "DL2_CH2", "DL2"},
+
+	{"I2S5_CH1", "DL3_CH1", "DL3"},
+	{"I2S5_CH2", "DL3_CH2", "DL3"},
+
+	{"I2S5_CH1", "DL12_CH1", "DL12"},
+	{"I2S5_CH2", "DL12_CH2", "DL12"},
+
+	{"I2S5_CH1", "DL4_CH1", "DL4"},
+	{"I2S5_CH2", "DL4_CH2", "DL4"},
+
+	{"I2S5_CH1", "DL5_CH1", "DL5"},
+	{"I2S5_CH2", "DL5_CH2", "DL5"},
+
+	{"I2S5_CH1", "DL6_CH1", "DL6"},
+	{"I2S5_CH2", "DL6_CH2", "DL6"},
+
+	{"I2S5_CH1", "DL8_CH1", "DL8"},
+	{"I2S5_CH2", "DL8_CH2", "DL8"},
+
+	{"I2S5", NULL, "I2S5_CH1"},
+	{"I2S5", NULL, "I2S5_CH2"},
+
+	{"I2S5", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S5", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S5", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S5", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S5", NULL, "I2S5_EN"},
+	{"I2S5", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S5", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S5", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S5", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S5", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S5", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S5_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S5_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S5", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S5", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S5_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S5_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s6 */
+	{"I2S6", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S6", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S6", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S6", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S6", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S6", NULL, "I2S6_EN"},
+	{"I2S6", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S6", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S6", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S6", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S6", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S6_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S6_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S6", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S6", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S6_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S6_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s7 */
+	{"I2S7", NULL, "I2S7_CH1"},
+	{"I2S7", NULL, "I2S7_CH2"},
+
+	{"I2S7", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S7", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S7", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S7", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S7", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S7", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S7", NULL, "I2S7_EN"},
+	{"I2S7", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S7", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S7", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S7", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S7_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S7_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S7", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S7", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S7_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S7_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s8 */
+	{"I2S8", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S8", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S8", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S8", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S8", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S8", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S8", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S8", NULL, "I2S8_EN"},
+	{"I2S8", NULL, "I2S9_EN", mtk_afe_i2s_share_connect},
+
+	{"I2S8", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S8", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S8_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S8_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S8", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S8", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S8_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S8_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* i2s9 */
+	{"I2S9_CH1", "DL1_CH1", "DL1"},
+	{"I2S9_CH2", "DL1_CH2", "DL1"},
+
+	{"I2S9_CH1", "DL2_CH1", "DL2"},
+	{"I2S9_CH2", "DL2_CH2", "DL2"},
+
+	{"I2S9_CH1", "DL3_CH1", "DL3"},
+	{"I2S9_CH2", "DL3_CH2", "DL3"},
+
+	{"I2S9_CH1", "DL12_CH1", "DL12"},
+	{"I2S9_CH2", "DL12_CH2", "DL12"},
+
+	{"I2S9_CH1", "DL4_CH1", "DL4"},
+	{"I2S9_CH2", "DL4_CH2", "DL4"},
+
+	{"I2S9_CH1", "DL5_CH1", "DL5"},
+	{"I2S9_CH2", "DL5_CH2", "DL5"},
+
+	{"I2S9_CH1", "DL6_CH1", "DL6"},
+	{"I2S9_CH2", "DL6_CH2", "DL6"},
+
+	{"I2S9_CH1", "DL8_CH1", "DL8"},
+	{"I2S9_CH2", "DL8_CH2", "DL8"},
+
+	{"I2S9_CH1", "DL9_CH1", "DL9"},
+	{"I2S9_CH2", "DL9_CH2", "DL9"},
+
+	{"I2S9", NULL, "I2S9_CH1"},
+	{"I2S9", NULL, "I2S9_CH2"},
+
+	{"I2S9", NULL, "I2S0_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S1_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S2_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S3_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S5_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S6_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S7_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S8_EN", mtk_afe_i2s_share_connect},
+	{"I2S9", NULL, "I2S9_EN"},
+
+	{"I2S9", NULL, I2S0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S5_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S7_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S8_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2S9", NULL, I2S9_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2S9_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2S9_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2S9", NULL, I2S0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S5_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S7_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S8_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2S9", NULL, I2S9_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2S9_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2S9_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+
+	/* allow i2s on without codec on */
+	{"I2S0", NULL, "I2S0_In_Mux"},
+	{"I2S0_In_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2S8", NULL, "I2S8_In_Mux"},
+	{"I2S8_In_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2S1_Out_Mux", "Dummy_Widget", "I2S1"},
+	{"I2S_DUMMY_OUT", NULL, "I2S1_Out_Mux"},
+
+	{"I2S3_Out_Mux", "Dummy_Widget", "I2S3"},
+	{"I2S_DUMMY_OUT", NULL, "I2S3_Out_Mux"},
+
+	{"I2S5_Out_Mux", "Dummy_Widget", "I2S5"},
+	{"I2S_DUMMY_OUT", NULL, "I2S5_Out_Mux"},
+
+	{"I2S7_Out_Mux", "Dummy_Widget", "I2S7"},
+	{"I2S_DUMMY_OUT", NULL, "I2S7_Out_Mux"},
+
+	{"I2S9_Out_Mux", "Dummy_Widget", "I2S9"},
+	{"I2S_DUMMY_OUT", NULL, "I2S9_Out_Mux"},
+
+	/* i2s in lpbk */
+	{"I2S0_Lpbk_Mux", "Lpbk", "I2S3"},
+	{"I2S2_Lpbk_Mux", "Lpbk", "I2S1"},
+	{"I2S0", NULL, "I2S0_Lpbk_Mux"},
+	{"I2S2", NULL, "I2S2_Lpbk_Mux"},
+};
+
+/* dai ops */
+static int mtk_dai_connsys_i2s_hw_params(struct snd_pcm_substream *substream,
+					 struct snd_pcm_hw_params *params,
+					 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int rate = params_rate(params);
+	unsigned int rate_reg = mt8192_rate_transform(afe->dev,
+						      rate, dai->id);
+	unsigned int i2s_con = 0;
+
+	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d\n",
+		__func__, dai->id, substream->stream, rate);
+
+	/* non-inverse, i2s mode, proxy mode, 16bits, from connsys */
+	i2s_con |= 0 << INV_PAD_CTRL_SFT;
+	i2s_con |= I2S_FMT_I2S << I2S_FMT_SFT;
+	i2s_con |= 1 << I2S_SRC_SFT;
+	i2s_con |= get_i2s_wlen(SNDRV_PCM_FORMAT_S16_LE) << I2S_WLEN_SFT;
+	i2s_con |= 0 << I2SIN_PAD_SEL_SFT;
+	regmap_write(afe->regmap, AFE_CONNSYS_I2S_CON, i2s_con);
+
+	/* use asrc */
+	regmap_update_bits(afe->regmap,
+			   AFE_CONNSYS_I2S_CON,
+			   I2S_BYPSRC_MASK_SFT,
+			   0x0 << I2S_BYPSRC_SFT);
+
+	/* proxy mode, set i2s for asrc */
+	regmap_update_bits(afe->regmap,
+			   AFE_CONNSYS_I2S_CON,
+			   I2S_MODE_MASK_SFT,
+			   rate_reg << I2S_MODE_SFT);
+
+	switch (rate) {
+	case 32000:
+		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x140000);
+		break;
+	case 44100:
+		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001B9000);
+		break;
+	default:
+		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001E0000);
+		break;
+	}
+
+	/* Calibration setting */
+	regmap_write(afe->regmap, AFE_ASRC_2CH_CON4, 0x00140000);
+	regmap_write(afe->regmap, AFE_ASRC_2CH_CON9, 0x00036000);
+	regmap_write(afe->regmap, AFE_ASRC_2CH_CON10, 0x0002FC00);
+	regmap_write(afe->regmap, AFE_ASRC_2CH_CON6, 0x00007EF4);
+	regmap_write(afe->regmap, AFE_ASRC_2CH_CON5, 0x00FF5986);
+
+	/* 0:Stereo 1:Mono */
+	regmap_update_bits(afe->regmap,
+			   AFE_ASRC_2CH_CON2,
+			   CHSET_IS_MONO_MASK_SFT,
+			   0x0 << CHSET_IS_MONO_SFT);
+
+	return 0;
+}
+
+static int mtk_dai_connsys_i2s_trigger(struct snd_pcm_substream *substream,
+				       int cmd, struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+
+	dev_dbg(afe->dev, "%s(), cmd %d, stream %d\n",
+		__func__, cmd, substream->stream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* i2s enable */
+		regmap_update_bits(afe->regmap,
+				   AFE_CONNSYS_I2S_CON,
+				   I2S_EN_MASK_SFT,
+				   0x1 << I2S_EN_SFT);
+
+		/* calibrator enable */
+		regmap_update_bits(afe->regmap,
+				   AFE_ASRC_2CH_CON5,
+				   CALI_EN_MASK_SFT,
+				   0x1 << CALI_EN_SFT);
+
+		/* asrc enable */
+		regmap_update_bits(afe->regmap,
+				   AFE_ASRC_2CH_CON0,
+				   CON0_CHSET_STR_CLR_MASK_SFT,
+				   0x1 << CON0_CHSET_STR_CLR_SFT);
+		regmap_update_bits(afe->regmap,
+				   AFE_ASRC_2CH_CON0,
+				   CON0_ASM_ON_MASK_SFT,
+				   0x1 << CON0_ASM_ON_SFT);
+
+		afe_priv->dai_on[dai->id] = true;
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		regmap_update_bits(afe->regmap,
+				   AFE_ASRC_2CH_CON0,
+				   CON0_ASM_ON_MASK_SFT,
+				   0 << CON0_ASM_ON_SFT);
+		regmap_update_bits(afe->regmap,
+				   AFE_ASRC_2CH_CON5,
+				   CALI_EN_MASK_SFT,
+				   0 << CALI_EN_SFT);
+
+		/* i2s disable */
+		regmap_update_bits(afe->regmap,
+				   AFE_CONNSYS_I2S_CON,
+				   I2S_EN_MASK_SFT,
+				   0x0 << I2S_EN_SFT);
+
+		/* bypass asrc */
+		regmap_update_bits(afe->regmap,
+				   AFE_CONNSYS_I2S_CON,
+				   I2S_BYPSRC_MASK_SFT,
+				   0x1 << I2S_BYPSRC_SFT);
+
+		afe_priv->dai_on[dai->id] = false;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_connsys_i2s_ops = {
+	.hw_params = mtk_dai_connsys_i2s_hw_params,
+	.trigger = mtk_dai_connsys_i2s_trigger,
+};
+
+/* i2s */
+static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
+			      struct snd_pcm_hw_params *params,
+			      int i2s_id)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_priv = afe_priv->dai_priv[i2s_id];
+
+	unsigned int rate = params_rate(params);
+	unsigned int rate_reg = mt8192_rate_transform(afe->dev,
+						      rate, i2s_id);
+	snd_pcm_format_t format = params_format(params);
+	unsigned int i2s_con = 0;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "%s(), id %d, rate %d, format %d\n",
+		__func__, i2s_id, rate, format);
+
+	if (i2s_priv)
+		i2s_priv->rate = rate;
+	else
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+
+	switch (i2s_id) {
+	case MT8192_DAI_I2S_0:
+		i2s_con = I2S_IN_PAD_IO_MUX << I2SIN_PAD_SEL_SFT;
+		i2s_con |= rate_reg << I2S_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_1:
+		i2s_con = I2S1_SEL_O28_O29 << I2S2_SEL_O03_O04_SFT;
+		i2s_con |= rate_reg << I2S2_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S2_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S2_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON1,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_2:
+		i2s_con = 8 << I2S3_UPDATE_WORD_SFT;
+		i2s_con |= rate_reg << I2S3_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S3_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S3_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON2,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_3:
+		i2s_con = rate_reg << I2S4_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S4_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S4_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON3,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_5:
+		i2s_con = rate_reg << I2S5_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S5_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S5_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON4,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_6:
+		i2s_con = rate_reg << I2S6_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S6_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S6_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON6,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_7:
+		i2s_con = rate_reg << I2S7_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S7_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S7_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON7,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_8:
+		i2s_con = rate_reg << I2S8_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S8_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S8_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON8,
+				   0xffffeffe, i2s_con);
+		break;
+	case MT8192_DAI_I2S_9:
+		i2s_con = rate_reg << I2S9_OUT_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S9_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S9_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_I2S_CON9,
+				   0xffffeffe, i2s_con);
+		break;
+	default:
+		dev_warn(afe->dev, "%s(), id %d not support\n",
+			 __func__, i2s_id);
+		return -EINVAL;
+	}
+
+	/* set share i2s */
+	if (i2s_priv && i2s_priv->share_i2s_id >= 0)
+		ret = mtk_dai_i2s_config(afe, params, i2s_priv->share_i2s_id);
+
+	return ret;
+}
+
+static int mtk_dai_i2s_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	return mtk_dai_i2s_config(afe, params, dai->id);
+}
+
+static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
+				  int clk_id, unsigned int freq, int dir)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_priv = afe_priv->dai_priv[dai->id];
+	int apll;
+	int apll_rate;
+
+	if (!i2s_priv) {
+		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+		return -EINVAL;
+	}
+
+	if (dir != SND_SOC_CLOCK_OUT) {
+		dev_warn(afe->dev, "%s(), dir != SND_SOC_CLOCK_OUT", __func__);
+		return -EINVAL;
+	}
+
+	dev_dbg(afe->dev, "%s(), freq %d\n", __func__, freq);
+
+	apll = mt8192_get_apll_by_rate(afe, freq);
+	apll_rate = mt8192_get_apll_rate(afe, apll);
+
+	if (freq > apll_rate) {
+		dev_warn(afe->dev, "%s(), freq > apll rate", __func__);
+		return -EINVAL;
+	}
+
+	if (apll_rate % freq != 0) {
+		dev_warn(afe->dev, "%s(), APLL can't gen freq Hz", __func__);
+		return -EINVAL;
+	}
+
+	i2s_priv->mclk_rate = freq;
+	i2s_priv->mclk_apll = apll;
+
+	if (i2s_priv->share_i2s_id > 0) {
+		struct mtk_afe_i2s_priv *share_i2s_priv;
+
+		share_i2s_priv = afe_priv->dai_priv[i2s_priv->share_i2s_id];
+		if (!share_i2s_priv) {
+			dev_warn(afe->dev, "%s(), share_i2s_priv = NULL",
+				 __func__);
+			return -EINVAL;
+		}
+
+		share_i2s_priv->mclk_rate = i2s_priv->mclk_rate;
+		share_i2s_priv->mclk_apll = i2s_priv->mclk_apll;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_i2s_ops = {
+	.hw_params = mtk_dai_i2s_hw_params,
+	.set_sysclk = mtk_dai_i2s_set_sysclk,
+};
+
+/* dai driver */
+#define MTK_CONNSYS_I2S_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
+
+#define MTK_I2S_RATES (SNDRV_PCM_RATE_8000_48000 |\
+		       SNDRV_PCM_RATE_88200 |\
+		       SNDRV_PCM_RATE_96000 |\
+		       SNDRV_PCM_RATE_176400 |\
+		       SNDRV_PCM_RATE_192000)
+
+#define MTK_I2S_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
+	{
+		.name = "CONNSYS_I2S",
+		.id = MT8192_DAI_CONNSYS_I2S,
+		.capture = {
+			.stream_name = "Connsys I2S",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_CONNSYS_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_connsys_i2s_ops,
+	},
+	{
+		.name = "I2S0",
+		.id = MT8192_DAI_I2S_0,
+		.capture = {
+			.stream_name = "I2S0",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S1",
+		.id = MT8192_DAI_I2S_1,
+		.playback = {
+			.stream_name = "I2S1",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S2",
+		.id = MT8192_DAI_I2S_2,
+		.capture = {
+			.stream_name = "I2S2",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S3",
+		.id = MT8192_DAI_I2S_3,
+		.playback = {
+			.stream_name = "I2S3",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S5",
+		.id = MT8192_DAI_I2S_5,
+		.playback = {
+			.stream_name = "I2S5",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S6",
+		.id = MT8192_DAI_I2S_6,
+		.capture = {
+			.stream_name = "I2S6",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S7",
+		.id = MT8192_DAI_I2S_7,
+		.playback = {
+			.stream_name = "I2S7",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S8",
+		.id = MT8192_DAI_I2S_8,
+		.capture = {
+			.stream_name = "I2S8",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	},
+	{
+		.name = "I2S9",
+		.id = MT8192_DAI_I2S_9,
+		.playback = {
+			.stream_name = "I2S9",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_I2S_RATES,
+			.formats = MTK_I2S_FORMATS,
+		},
+		.ops = &mtk_dai_i2s_ops,
+	}
+};
+
+/* this enum is merely for mtk_afe_i2s_priv declare */
+enum {
+	DAI_I2S0 = 0,
+	DAI_I2S1,
+	DAI_I2S2,
+	DAI_I2S3,
+	DAI_I2S5,
+	DAI_I2S6,
+	DAI_I2S7,
+	DAI_I2S8,
+	DAI_I2S9,
+	DAI_I2S_NUM,
+};
+
+static const struct mtk_afe_i2s_priv mt8192_i2s_priv[DAI_I2S_NUM] = {
+	[DAI_I2S0] = {
+		.id = MT8192_DAI_I2S_0,
+		.mclk_id = MT8192_I2S0_MCK,
+		.share_property_name = "i2s0-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S1] = {
+		.id = MT8192_DAI_I2S_1,
+		.mclk_id = MT8192_I2S1_MCK,
+		.share_property_name = "i2s1-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S2] = {
+		.id = MT8192_DAI_I2S_2,
+		.mclk_id = MT8192_I2S2_MCK,
+		.share_property_name = "i2s2-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S3] = {
+		.id = MT8192_DAI_I2S_3,
+		.mclk_id = MT8192_I2S3_MCK,
+		.share_property_name = "i2s3-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S5] = {
+		.id = MT8192_DAI_I2S_5,
+		.mclk_id = MT8192_I2S5_MCK,
+		.share_property_name = "i2s5-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S6] = {
+		.id = MT8192_DAI_I2S_6,
+		.mclk_id = MT8192_I2S6_MCK,
+		.share_property_name = "i2s6-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S7] = {
+		.id = MT8192_DAI_I2S_7,
+		.mclk_id = MT8192_I2S7_MCK,
+		.share_property_name = "i2s7-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S8] = {
+		.id = MT8192_DAI_I2S_8,
+		.mclk_id = MT8192_I2S8_MCK,
+		.share_property_name = "i2s8-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2S9] = {
+		.id = MT8192_DAI_I2S_9,
+		.mclk_id = MT8192_I2S9_MCK,
+		.share_property_name = "i2s9-share",
+		.share_i2s_id = -1,
+	},
+};
+
+int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
+{
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	const struct device_node *of_node = afe->dev->of_node;
+	const char *of_str;
+	const char *property_name;
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int i;
+
+	for (i = 0; i < DAI_I2S_NUM; i++) {
+		i2s_priv = afe_priv->dai_priv[mt8192_i2s_priv[i].id];
+		property_name = mt8192_i2s_priv[i].share_property_name;
+		if (of_property_read_string(of_node, property_name, &of_str))
+			continue;
+		i2s_priv->share_i2s_id = get_i2s_id_by_name(afe, of_str);
+	}
+
+	return 0;
+}
+
+int mt8192_dai_i2s_set_priv(struct mtk_base_afe *afe)
+{
+	int i;
+	int ret;
+
+	for (i = 0; i < DAI_I2S_NUM; i++) {
+		ret = mt8192_dai_set_priv(afe, mt8192_i2s_priv[i].id,
+					  sizeof(struct mtk_afe_i2s_priv),
+					  &mt8192_i2s_priv[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int mt8192_dai_i2s_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+	int ret;
+
+	dev_dbg(afe->dev, "%s()\n", __func__);
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_i2s_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_i2s_driver);
+
+	dai->controls = mtk_dai_i2s_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_dai_i2s_controls);
+	dai->dapm_widgets = mtk_dai_i2s_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_i2s_widgets);
+	dai->dapm_routes = mtk_dai_i2s_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_i2s_routes);
+
+	/* set all dai i2s private data */
+	ret = mt8192_dai_i2s_set_priv(afe);
+	if (ret)
+		return ret;
+
+	/* parse share i2s */
+	ret = mt8192_dai_i2s_get_share(afe);
+	if (ret)
+		return ret;
+
+	return 0;
+}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
