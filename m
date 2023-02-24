Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA33C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBwKGATFY0PKOpbII0ZtaBGe8FBkxBZpc1LFjJOf+sU=; b=sqxw0V/Cv2HmKe9AjS7DNCX9oN
	0U9xfpNJbSmtydbFn+HtCfCw/5lZigKuiGQVBdlzowU/ht6GEnlC991xNABJxhTpmRFyTN9yIyHtq
	qDDJqSllwT6p+FEsIxQY/z/bHd+oUT8WyEqSmqUFhxsYqRPu+NZ3FFa7Tgqv3E7rXaCkz5uY0Dpga
	qDyfrUYrwJPh0Xy5+hjWn/3UDkZRRA0gARNYNA/yZUuU9vuZNEftxnhHTMj7T0XdONTZFgySrQkWI
	JOPhxE312g/Av8m1heHZAwPv1bJElGyKVMGDqUwdA5gW9hITgXq5TFfvgbG3lp8vwOoYIai7sorZd
	yL2MENCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYk0-002hVz-U1; Fri, 24 Feb 2023 14:08:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYjf-002hNi-2E; Fri, 24 Feb 2023 14:07:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 349B7B81C96;
	Fri, 24 Feb 2023 14:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08BFC433EF;
	Fri, 24 Feb 2023 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247659;
	bh=rybO/20a98fdHKZtAB7oYS7Qk4A/VAIx86q+e/5lOVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OmTs//tHgMOqlO4pBkuI4QNT+r3RvoMDvdw6thVQrGkpocB8Sbjw0sf0o8vq/PDCc
	 1NrGOdY32Yy1zieCRxbHRtcTTwguX5Z3xNyM54a0t6kiBUCnOSEpGmaQNBlQJCKAVn
	 jeNUxHqKEfDgZIVNxTdkxsT+MhaMA20dUZP4p3qfCX/OPzDLkm4V2SaBuEKPRyuqq0
	 tc/9hNdSjA6NQH38QetCmZggKlxxXR0S+M1f/UinzPSFPIiWXdhakdRdgwWyJH1fg2
	 MKUWaOJK2u9ZygQbyifTdd5m86m1a8n3tvtOXQ0O3f2cZI3UQ8ShV55MURfxZ8OEyp
	 6zrH74kutPU5Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Feb 2023 14:03:56 +0000
Subject: [PATCH 2/4] ASoC: mt8192: Fix event generation for controls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rybO/20a98fdHKZtAB7oYS7Qk4A/VAIx86q+e/5lOVk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSi4fcXZN3SX4ycFjonmo5T8TgNsx4vC5u7yU/9
 bTHy3wOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEogAKCRAk1otyXVSH0D3vB/
 9ia/xAkAhL29HBF3oLJN4EAHzoTo9/U803oY9OmuCnbFYIyZfbExiJ6KEEtVehzMd2/QmsbP52SuSh
 lmofPFSTpP/RTnKEIIYTwtci+Zbs00fBAswcmXXZka9HvxLx+9Clo17BXibbr/LfXDvEFmew3hT8wj
 FETIwQi7SE4Z16st+sJz/+9U2vexecqNTjz8FpBvo9mU4iOOsJCoacyPafifC9MmIYca+0RzvJkL8h
 6IYxu5L6Smkv6Pl0sqhhmI5SIQKzHu5Rvg7bFKut8PPA88GBms825FDxn4rAjObpCVhaPXdVDEXK5Y
 dl0sdV86a6hAyiIxp4EWsqi2ZErFF7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_060743_443948_D89CCAC6 
X-CRM114-Status: GOOD (  13.50  )
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

ALSA controls put() operations should return 1 if the value changed and 0
if it remains the same, fix the mt8192 driver to do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index bc8753f1001c..a33d1ce33349 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -591,16 +591,19 @@ static int stf_positive_gain_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int gain_db = ucontrol->value.integer.value[0];
+	bool change = false;
 
 	afe_priv->stf_positive_gain_db = gain_db;
 
 	if (gain_db >= 0 && gain_db <= 24) {
-		regmap_update_bits(afe->regmap,
-				   AFE_SIDETONE_GAIN,
-				   POSITIVE_GAIN_MASK_SFT,
-				   (gain_db / 6) << POSITIVE_GAIN_SFT);
+		regmap_update_bits_check(afe->regmap,
+					 AFE_SIDETONE_GAIN,
+					 POSITIVE_GAIN_MASK_SFT,
+					 (gain_db / 6) << POSITIVE_GAIN_SFT,
+					 &change);
 	}
-	return 0;
+
+	return change;
 }
 
 static int mt8192_adda_dmic_get(struct snd_kcontrol *kcontrol,
@@ -621,12 +624,17 @@ static int mt8192_adda_dmic_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dmic_on;
+	bool change;
 
 	dmic_on = ucontrol->value.integer.value[0];
 
+	change = (afe_priv->mtkaif_dmic != dmic_on) ||
+		(afe_priv->mtkaif_dmic_ch34 != dmic_on);
+
 	afe_priv->mtkaif_dmic = dmic_on;
 	afe_priv->mtkaif_dmic_ch34 = dmic_on;
-	return 0;
+
+	return change;
 }
 
 static int mt8192_adda6_only_get(struct snd_kcontrol *kcontrol,
@@ -647,11 +655,14 @@ static int mt8192_adda6_only_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_adda6_only;
+	bool change;
 
 	mtkaif_adda6_only = ucontrol->value.integer.value[0];
 
+	change = afe_priv->mtkaif_adda6_only != mtkaif_adda6_only;
 	afe_priv->mtkaif_adda6_only = mtkaif_adda6_only;
-	return 0;
+
+	return change;
 }
 
 static const struct snd_kcontrol_new mtk_adda_controls[] = {

-- 
2.30.2


