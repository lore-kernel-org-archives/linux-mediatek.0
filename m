Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C52DC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VaDGswtzyz4HuIQV9axxbjtye2ySmQ8UjnoUOeyOowc=; b=r8WCJTWFLIi/WlOun97iyD9KKB
	es2kM56nvA6e43ybXtrUfMA5D8jLtj48TwBIPSi/Pqxnn8wcVlL1L7zQ8HJYhr50Km2++c7n9BtoJ
	N0rYwHOnit52hgGL70MHFIUADGyw/XiuirfYAKDTwNFk8jkrt778S4dHbHQywsvCzO/an9SlVyrfh
	IzksMeNp/ZNY5DhxADtH++ErJyC17wEamaMUMDSoq7T0R7YGfR9uKDZDyf/h8Oo9hmAZUNuyedRKN
	oK/s8hglMKgosiYjKMPbCsO/OoR+4RdMd/7ALfxohkSDedISwJkIJCDshj4YMQfs0VktyGm/hlpQh
	6QxI+Xqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0OIC-001spa-30;
	Tue, 07 Nov 2023 15:47:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0OI8-001soj-1j;
	Tue, 07 Nov 2023 15:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C36EACE0EB2;
	Tue,  7 Nov 2023 15:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4E4C433C8;
	Tue,  7 Nov 2023 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699372018;
	bh=CUfW7KfbPMiWgaZuojZ6e6K86KBlzeDqmgsgw0rcE9w=;
	h=From:To:Cc:Subject:Date:From;
	b=t6MMXpGnAjZ2qABWYTkbXLpSkJ8moA5JQmayG3yPQXxpIZErM+EGTpEvXx6pfqrIS
	 5OT1FoQ8VGRL9pZRbiNiThV1276rjFejhGAYP2pDE1cET8QhyCnz09T4+jKVGeifV0
	 40rk0JF3o8CJlmzF2/PbZbN3KKc8j/zt88bhJrt4nMSCevRgcudqiNA2+xUivFHKBk
	 j0aMyeCy2Uvwf2G1tMVOtP5URewnKEhwzDsicZu5UaRldzmN1PdjbtAMbu7sr0y5L7
	 l3pg7IHBIx0/7YmATVu1k+GWgH0qxkC3ufr3M5KOr7ubruaG98AvzPR+MOxHdbtcYw
	 Z99u21cHSWf5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Trevor Wu <trevor.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	amergnat@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	dan.carpenter@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 01/36] ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
Date: Tue,  7 Nov 2023 10:45:43 -0500
Message-ID: <20231107154654.3765336-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_074700_949796_F305F265 
X-CRM114-Status: GOOD (  12.07  )
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

From: Trevor Wu <trevor.wu@mediatek.com>

[ Upstream commit d601bb78f06b9e3cbb52e6b87b88add9920a11b6 ]

To avoid power leakage, it is recommended to replace the default pinctrl
state with dynamic pinctrl since certain audio pinmux functions can
remain in a HIGH state even when audio is disabled. Linking pinctrl with
DAPM using SND_SOC_DAPM_PINCTRL will ensure that audio pins remain in
GPIO mode by default and only switch to an audio function when necessary.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20230825024935.10878-2-trevor.wu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 9017f48b6272b..f7e22abb75846 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -246,6 +246,11 @@ static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SINK("HDMI"),
 	SND_SOC_DAPM_SINK("DP"),
+
+	/* dynamic pinctrl */
+	SND_SOC_DAPM_PINCTRL("ETDM_SPK_PIN", "aud_etdm_spk_on", "aud_etdm_spk_off"),
+	SND_SOC_DAPM_PINCTRL("ETDM_HP_PIN", "aud_etdm_hp_on", "aud_etdm_hp_off"),
+	SND_SOC_DAPM_PINCTRL("MTKAIF_PIN", "aud_mtkaif_on", "aud_mtkaif_off"),
 };
 
 static const struct snd_kcontrol_new mt8188_mt6359_controls[] = {
@@ -267,6 +272,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dapm_widget *pin_w = NULL, *w;
 	struct mtk_base_afe *afe;
 	struct mt8188_afe_private *afe_priv;
 	struct mtkaif_param *param;
@@ -306,6 +312,18 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		return 0;
 	}
 
+	for_each_card_widgets(rtd->card, w) {
+		if (!strcmp(w->name, "MTKAIF_PIN")) {
+			pin_w = w;
+			break;
+		}
+	}
+
+	if (pin_w)
+		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_PRE_PMU);
+	else
+		dev_dbg(afe->dev, "%s(), no pinmux widget, please check if default on\n", __func__);
+
 	pm_runtime_get_sync(afe->dev);
 	mt6359_mtkaif_calibration_enable(cmpnt_codec);
 
@@ -403,6 +421,9 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	for (i = 0; i < MT8188_MTKAIF_MISO_NUM; i++)
 		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
 
+	if (pin_w)
+		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_POST_PMD);
+
 	dev_dbg(afe->dev, "%s(), end, calibration ok %d\n",
 		__func__, param->mtkaif_calibration_ok);
 
-- 
2.42.0


