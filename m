Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6DFC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RTTGkxQ5/QdLRHaAS7HhdjOkQSPR9nvXd+CeQViNQM=; b=SoITaNlurmdftBWCTFxyWkgORR
	g8muKUdI7Hv87Tvopc8UMNku5dJS8sfkrDYwSK8DvEa0MdFIA8UzUoN8EPf1UVA7m7zzH45Z5z6F3
	7nKjQaWNm3KkNbbkDpExKdkm6OBeCvLIAIDP2UEl9g4PqQEbM3TAGPo7MNeGl7WCqiMEajdqZD/40
	cDsbYtCMPpmoT4S/3F+gMgIti9KYWj/BwmpkFUvzdaAbEZbt4vpedKK4IN/pIByziGow+TVkuDh6t
	RmfL4VP+DW8f+TYLbs/oUjfBdp1Yr3o3tB/4ZZiti1xTTV07UAne84UziZiIExup/rcmMaXng0lh0
	+2+fRQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BJD-008a9Z-1U;
	Thu, 08 Jun 2023 08:47:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BJ1-008Zzm-1G;
	Thu, 08 Jun 2023 08:47:45 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AB23E6606F1E;
	Thu,  8 Jun 2023 09:47:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214061;
	bh=TsKcmK9QZGJOPJ/OK2hMt+7KH5PMIKg71tTT0DRiI50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhmXkxAiHv/iWg19l5VuDoRZKJ7fj7SlVFjyL4uJk69dZQsA8VtnKj2h7ynK4J9+B
	 nIdkhbMfRkW5s72ZrJa/DSwXw4FNKQcTc+9H6+joIS32fqIi+vlQlqJocpPVWJDUJl
	 VV8VLfEX/6iAXW3hXzNIozau+dUvkmHdlwM0dGziHnydlx/XTugc4yqZFILjze00v7
	 IF0W9lW/t15MZiACDXQBC3Ox05us8JuJIKaSFOhfC3w7SfiF4jn5JOvU2sdSMmv3m+
	 URgUclVMLLd/gj7TSs55IsWeQuHRnmNlUa0MO2Zo8b4irPPnO5/YT/RW2Jien8jBCM
	 Xf8STY0iCpDAQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros for registers
Date: Thu,  8 Jun 2023 10:47:27 +0200
Message-Id: <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_014743_700961_E7F4A76D 
X-CRM114-Status: GOOD (  13.96  )
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

Replace open coded instances of FIELD_GET() with it, move register
definitions at the top of the file and also replace magic numbers
with register definitions.

While at it, also change a regmap_update_bits() call to regmap_write()
because the top 29 bits of AUD_TOP_CFG (31:3) are reserved (unused).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 32 ++++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 5b2660139421..ac69c23e0da1 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -6,6 +6,7 @@
  * Author: Trevor Wu <trevor.wu@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -19,6 +20,15 @@
 #include "../common/mtk-afe-platform-driver.h"
 #include "../common/mtk-soundcard-driver.h"
 
+#define CKSYS_AUD_TOP_CFG	0x032c
+ #define RG_TEST_ON		BIT(0)
+ #define RG_TEST_TYPE		BIT(2)
+#define CKSYS_AUD_TOP_MON	0x0330
+ #define TEST_MISO_COUNT_1	GENMASK(3, 0)
+ #define TEST_MISO_COUNT_2	GENMASK(7, 4)
+ #define TEST_MISO_DONE_1	BIT(28)
+ #define TEST_MISO_DONE_2	BIT(29)
+
 #define NAU8825_HS_PRESENT	BIT(0)
 
 /*
@@ -251,9 +261,6 @@ static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 };
 
-#define CKSYS_AUD_TOP_CFG 0x032c
-#define CKSYS_AUD_TOP_MON 0x0330
-
 static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_afe =
@@ -265,13 +272,13 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct mtkaif_param *param;
 	int chosen_phase_1, chosen_phase_2;
 	int prev_cycle_1, prev_cycle_2;
-	int test_done_1, test_done_2;
+	u8 test_done_1, test_done_2;
 	int cycle_1, cycle_2;
 	int mtkaif_chosen_phase[MT8188_MTKAIF_MISO_NUM];
 	int mtkaif_phase_cycle[MT8188_MTKAIF_MISO_NUM];
 	int mtkaif_calibration_num_phase;
 	bool mtkaif_calibration_ok;
-	unsigned int monitor = 0;
+	u32 monitor = 0;
 	int counter;
 	int phase;
 	int i;
@@ -303,8 +310,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	mt6359_mtkaif_calibration_enable(cmpnt_codec);
 
 	/* set test type to synchronizer pulse */
-	regmap_update_bits(afe_priv->topckgen,
-			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
+	regmap_write(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_TYPE);
 	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
 	mtkaif_calibration_ok = true;
 
@@ -314,7 +320,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
 						    phase, phase, phase);
 
-		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
+		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
 
 		test_done_1 = 0;
 		test_done_2 = 0;
@@ -326,14 +332,14 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		while (!(test_done_1 & test_done_2)) {
 			regmap_read(afe_priv->topckgen,
 				    CKSYS_AUD_TOP_MON, &monitor);
-			test_done_1 = (monitor >> 28) & 0x1;
-			test_done_2 = (monitor >> 29) & 0x1;
+			test_done_1 = FIELD_GET(TEST_MISO_DONE_1, monitor);
+			test_done_2 = FIELD_GET(TEST_MISO_DONE_2, monitor);
 
 			if (test_done_1 == 1)
-				cycle_1 = monitor & 0xf;
+				cycle_1 = FIELD_GET(TEST_MISO_COUNT_1, monitor);
 
 			if (test_done_2 == 1)
-				cycle_2 = (monitor >> 4) & 0xf;
+				cycle_2 = FIELD_GET(TEST_MISO_COUNT_2, monitor);
 
 			/* handle if never test done */
 			if (++counter > 10000) {
@@ -361,7 +367,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 			mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1] = prev_cycle_2;
 		}
 
-		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
+		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
 
 		if (mtkaif_chosen_phase[MT8188_MTKAIF_MISO_0] >= 0 &&
 		    mtkaif_chosen_phase[MT8188_MTKAIF_MISO_1] >= 0)
-- 
2.40.1


