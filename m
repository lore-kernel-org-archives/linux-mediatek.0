Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2615CE7B04
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 01:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYVZQDIgdwSxvf7rK8diRq6Xuz10Yi7lZHMISne2avU=; b=f7Snf6GNlT2E0rLTMScn4Q3wkJ
	ITF06jnvihRznoCJ0URfMTrcTGjFh+E0kdU3JamNaxYnlFmNzHoOJGvVxo4CG1WJybGB4AWVPWfeN
	I2jCQZjwcfvpBvO5++wvfMXGmwjx9/HOkIsF6o6ppbLwAaP7XVmGB6J9t1tYoicRDbcSvFGNQhoyB
	tCwHAnPQXnIa8okA2/tAFIF9Z+JaKk9qWj8cGLmK2Ry7+x1ni8tyTYLHaTWdZJS+XSyFJHZjiQB6i
	oYspxBY0NiiYqnQvBQOdstscq0jFR49NJq0A0RvRqsDA2QKlS+yG1ykygSte2se812w6dKE124YjK
	ioYfjBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjqd-0000000DzRc-0hFC;
	Sat, 07 Sep 2024 01:02:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjk1-0000000DyLs-0Jpq;
	Sat, 07 Sep 2024 00:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 168695C5ACB;
	Sat,  7 Sep 2024 00:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A67FC4CEC6;
	Sat,  7 Sep 2024 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725670552;
	bh=4xdE0tNYCJIEybe1Mo1jGwO98BsqMRPOQv2h7DEiJUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sDKgyPbC7LX8yRCxRsI5mRD8vahl51omQUm8zKAJvAZWUYNmzsDeTfp9DkgpBUGli
	 2WVjgCZqAMpTGPPY15EcKVCzCm8WPbJtlqj+Ro29gfm0u6jDJHpz35D5zaWHyE22UK
	 mcBl22Xi2PGmC8PHwpM5kTgh3zgglfxwGmZqw6VENMop95H2FfZRKuPID8/fsM+i18
	 iQNJZi5Pxxpo4HXa1yUsXDzbIuks3hynTAlFfGrZZtq76hwSwnFRzc1u2ORmpTJhPh
	 ipB1nNsjlsOZNnxJGCP69jDZz2R5/ArGDfc2cDyqryLE1jeWmdUFwWZolvO2x42uJQ
	 Tv9NDkslHUI8A==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 07 Sep 2024 01:53:31 +0100
Subject: [PATCH 6/7] ASoC: mt8365: Remove unused DMIC IIR coefficient
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-asoc-fix-mt8365-build-v1-6-7ad0bac20161@kernel.org>
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4xdE0tNYCJIEybe1Mo1jGwO98BsqMRPOQv2h7DEiJUs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm26SB9w0r3cXods2Io4Bj+kQAm5IN9AfzhuhON
 GW5vPba3h+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtukgQAKCRAk1otyXVSH
 0CDDB/4tmZwad18Si8ZMlu0wXc5OhYlza1BQK8bqC3/6Fz3l793mBZ1inOovTbKWLbSWyAyY33g
 I8GG65AjwsZjcNnwC8DRggjPg1XaURSQCx6qD3Hl9vmsdLMX+D4OiCk0qSYPmiI2ZfSrLVymZyd
 ba01/b8Nuobubt4nRdH3IdrUt9Yl51ry3sGCCWs+lbBYS0uD8n2hF0SIH2z4RHKHKDrZp8oO/XH
 pmCzDVsZBT43oB23aoGsZkdE1XmuDyu0wW2+4t3wpsJUF4ey0xjAKRaGKHvnWukcn7T7lGb9SNe
 81FUCKbZeZKslLzSSwsgGRW05VuGJc6m+8IfqCsB8Qkve5g2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_175553_229903_B8BE35D0 
X-CRM114-Status: GOOD (  11.10  )
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

Nothing ever calls mt8365_dai_load_dmic_iirc_coeff_table() so the compiler
warns about an unused static function. While it seems likely that something
should be calling the function I don't know what and this is breaking
-Werror builds like allmodconfig so let's just remove it. It can be added
again along with the user.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 30 -----------------------------
 1 file changed, 30 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
index a3bf54751420..f9945c2a2cd1 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
@@ -108,36 +108,6 @@ static void mt8365_dai_disable_dmic(struct mtk_base_afe *afe,
 	regmap_update_bits(afe->regmap, reg, mask, 0);
 }
 
-static const struct reg_sequence mt8365_dmic_iir_coeff[] = {
-	{ AFE_DMIC0_IIR_COEF_02_01, 0x00000000 },
-	{ AFE_DMIC0_IIR_COEF_04_03, 0x00003FB8 },
-	{ AFE_DMIC0_IIR_COEF_06_05, 0x3FB80000 },
-	{ AFE_DMIC0_IIR_COEF_08_07, 0x3FB80000 },
-	{ AFE_DMIC0_IIR_COEF_10_09, 0x0000C048 },
-	{ AFE_DMIC1_IIR_COEF_02_01, 0x00000000 },
-	{ AFE_DMIC1_IIR_COEF_04_03, 0x00003FB8 },
-	{ AFE_DMIC1_IIR_COEF_06_05, 0x3FB80000 },
-	{ AFE_DMIC1_IIR_COEF_08_07, 0x3FB80000 },
-	{ AFE_DMIC1_IIR_COEF_10_09, 0x0000C048 },
-	{ AFE_DMIC2_IIR_COEF_02_01, 0x00000000 },
-	{ AFE_DMIC2_IIR_COEF_04_03, 0x00003FB8 },
-	{ AFE_DMIC2_IIR_COEF_06_05, 0x3FB80000 },
-	{ AFE_DMIC2_IIR_COEF_08_07, 0x3FB80000 },
-	{ AFE_DMIC2_IIR_COEF_10_09, 0x0000C048 },
-	{ AFE_DMIC3_IIR_COEF_02_01, 0x00000000 },
-	{ AFE_DMIC3_IIR_COEF_04_03, 0x00003FB8 },
-	{ AFE_DMIC3_IIR_COEF_06_05, 0x3FB80000 },
-	{ AFE_DMIC3_IIR_COEF_08_07, 0x3FB80000 },
-	{ AFE_DMIC3_IIR_COEF_10_09, 0x0000C048 },
-};
-
-static int mt8365_dai_load_dmic_iir_coeff_table(struct mtk_base_afe *afe)
-{
-	return regmap_multi_reg_write(afe->regmap,
-				      mt8365_dmic_iir_coeff,
-				      ARRAY_SIZE(mt8365_dmic_iir_coeff));
-}
-
 static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
 				     struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)

-- 
2.39.2


