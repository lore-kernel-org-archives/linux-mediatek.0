Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C97C64ED6
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdVCzgpfiTz8ds9U+zT5PLiotOFTRK1xCQI/9OiUOA0=; b=U9OjcEMIQCjLuWub6ZidQVEHS1
	5bwtT4Zqc+HVhdX49Xkww0VzYl/S/DP+NhopYjHkYFu13otATDDHNInVV6fG0xazaPKlscO85Rc/d
	cGjsrXG9tHQZW15ff9PbGCVCcGiybycSgHUb5dy6gq5c/rdgD8XsQHXX/M4QkFgffDvxpjwBckvET
	ISwwBQIu1NlXJGwqL+L5CtlBVrJhmSvyRlJupBWCezEFkR7yWJ3EKv1RuTTg4VnZ6Yz3vIEp/xgQK
	YV6MceNgTltxMqFX2a9adxrw1HETBJy29jAnWRNSHfSCJuzJIrmGS70PcKQYCVe0JwXplJjR1HJwx
	BNJ/s0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGUK-007Dbm-Kx; Sun, 26 Feb 2023 12:50:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGTn-007DOe-99; Sun, 26 Feb 2023 12:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCEC160C1B;
	Sun, 26 Feb 2023 12:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938BAC4339C;
	Sun, 26 Feb 2023 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415814;
	bh=CRp8GhZU+qN7HRXYjIwtnt541hE7kwal9bWY145FMw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lWYIoGWVDxH+6USa5/bfTvaC1qRD4dafIFrFw6eOoO8rAmaQ5Gs6PI2THoXiMKqTl
	 6p2uPsvNjfvTWZsDS7bNNHiX2C2EXyHWyVdzhScsfaUvOSHQruEtH1PpMwW5xjrKew
	 PsAzqwr39cjVD5u0AGYE4R988atKERwyFccz/VhLGp0cTBP4ucoVxirfwReI5BFTrO
	 mek0kBnMJpgL7Saf/pY2RgJA3lIvQyOYGIU1ZeYcUxA8SK8+/GiC6xD8rnjTkoIHul
	 7XkkZ/qnX0LXYVph+X0coglMVASXBxgq3o1aujPLbuzwhBsor7de6ucq3Jnv/IA4SI
	 R9ZgKw3Nv4uqQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:49:56 +0000
Subject: [PATCH 1/2] ASoC: mt8183: Remove spammy logging from I2S DAI
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt8183-quick-fixes-v1-1-041f29419ed5@kernel.org>
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CRp8GhZU+qN7HRXYjIwtnt541hE7kwal9bWY145FMw8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1V/5RImjDJMcZfKi1j7muuEZi+2C+oXbbNVerB3
 0ZhEk+qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVfwAKCRAk1otyXVSH0OCPB/
 4g20IqYn32wt3p14KSSEUa5B9865bw3M89JBtDJEGfRlX4d2TFqAWR5+OcKyejvPYuSOOPqByf/mbA
 jkNob2/JuWayTDNZgy/kPtUagVyH3Q1LCDxqpeapZ8Wsb1mN0qDYKziKN/9KW5J6De1FXXs3ccqpf6
 MJ24rpgiT/FSNtKoFJx6DSdS/dHSH6diNbq6k4M7GPp2a1cLk0pySm6LS0Q5K+GsKTELcMnii0A7ym
 aUqcjqaAKkfmM8HMpk2gIXR5Qd79+Bvbcf+KU1pqcJorGtQpLqjrtvD7Snfr4sJ7YIKzFN80eRQDaO
 8SSYx15jEK09yTybkOzw4h/fkcHem6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_045015_438385_24B4A5FE 
X-CRM114-Status: GOOD (  11.18  )
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

There is a lot of dev_info() logging in normal operation in the I2S DAI
driver, remove it to avoid spamming the console.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 6a9ace4180d3..38f7fa38ee95 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -148,9 +148,6 @@ static int mt8183_i2s_hd_set(struct snd_kcontrol *kcontrol,
 
 	hd_en = ucontrol->value.integer.value[0];
 
-	dev_info(afe->dev, "%s(), kcontrol name %s, hd_en %d\n",
-		 __func__, kcontrol->id.name, hd_en);
-
 	i2s_priv = get_i2s_priv_by_name(afe, kcontrol->id.name);
 
 	if (!i2s_priv) {
@@ -276,9 +273,6 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
@@ -307,9 +301,6 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
-
 	i2s_priv = get_i2s_priv_by_name(afe, w->name);
 
 	if (!i2s_priv) {
@@ -715,11 +706,6 @@ static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
 	unsigned int i2s_con = 0, fmt_con = I2S_FMT_I2S << I2S_FMT_SFT;
 	int ret = 0;
 
-	dev_info(afe->dev, "%s(), id %d, rate %d, format %d\n",
-		 __func__,
-		 i2s_id,
-		 rate, format);
-
 	if (i2s_priv) {
 		i2s_priv->rate = rate;
 
@@ -810,8 +796,6 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	dev_info(afe->dev, "%s(), freq %d\n", __func__, freq);
-
 	apll = mt8183_get_apll_by_rate(afe, freq);
 	apll_rate = mt8183_get_apll_rate(afe, apll);
 

-- 
2.30.2


