Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC2C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asV9QQ+rTnyqtLulsP2m159B/igS1cWapoaPtZW6Oz0=; b=H8ZlOapsHBJDqopTJxkPhWqkHv
	M3FmBXjtsBoowC3zPOempB8SA+YE9W7l3RBjxanXGkWduXgZlRyusS+A90Lo1nHK08aO2teliIpL4
	26F7qlDZg2dhBQzGx9VWhyn7kb+RStsfxGvTG2+EJiHo2p1aCrDof+EZ3hjiGS7QY1ULsHYduRc6E
	Y1iPxHWi+280O21MplNa4s5pqmrFwTYzM6NCp9JjBRoTpGmN4b6mkbqn0OkvSXExp3ux9D6Om3hmr
	u5zotsRqqdpUzCFV8JkAH80TtsV5jH9Ndf12xtcGD4V7gNq4DS4yAl+w/BZ3dKJToCtS0e51g8SGq
	Z6Do2jDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKA2-005cFI-QH; Thu, 08 Sep 2022 16:13:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8Q-005b5o-M0; Thu, 08 Sep 2022 16:12:12 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 410766601FAC;
	Thu,  8 Sep 2022 17:12:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662653528;
	bh=8YlofjXhrN57o2uDk2nHW9qNEA9RaDpEWPGfo6KOGqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nl/he3U60A7/mmgUgn1oAI3NYZ0K4NjWYcPAeotjqMG63AIKvdYbW22sn8i4sGwfL
	 oBXqKBhTyC2/NAmixhnv90LYSA0vsqOiPSEr+iLwG8Qjkw1lnLlrpyKSSW5nPHupOD
	 FF4cSGmxgnKf1nXBjbO/4XEGxJm5nSyJTqi9g6AeKyAclUV9myPkDGFd5q1iHVIJQd
	 Lz8kvaCZ/fdDdwdC07q0eicmTSJbPjx6ZhMBnUkzBFbGnuUkhZLZQXCgQvMDNT8FvV
	 vWZ9cVL+fkGohQjZRzkURs8TeQvprWWYhve2oFVE8Nfz82XC1/2DSOw9P9fvv4BIgc
	 EhyL3GJLLrtBQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 05/10] ASoC: mediatek: mt8183: Configure shared clocks
Date: Thu,  8 Sep 2022 12:11:49 -0400
Message-Id: <20220908161154.648557-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_091211_043313_6606FDFB 
X-CRM114-Status: GOOD (  13.22  )
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

i2s0 and i2s5 are paired input/output connected to the same codec and
should share the same clock. Likewise for i2s2 and i2s3. Set the clock
sharing for each pair during the DAI initialization.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 33 +++++++++++++++++++
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 33 +++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index b33cc9a73ed1..9f22d3939818 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -17,6 +17,7 @@
 #include "../../codecs/da7219-aad.h"
 #include "../../codecs/da7219.h"
 #include "../../codecs/rt1015.h"
+#include "../common/mtk-afe-platform-driver.h"
 #include "mt8183-afe-common.h"
 
 #define DA7219_CODEC_DAI "da7219-hifi"
@@ -372,6 +373,36 @@ static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 					  &priv->hdmi_jack, NULL);
 }
 
+static int mt8183_bt_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S5", "I2S0");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int mt8183_da7219_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S2", "I2S3");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
 static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	/* FE */
 	{
@@ -500,6 +531,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_da7219_i2s_ops,
+		.init = &mt8183_da7219_init,
 		SND_SOC_DAILINK_REG(i2s2),
 	},
 	{
@@ -515,6 +547,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
+		.init = &mt8183_bt_init,
 		SND_SOC_DAILINK_REG(i2s5),
 	},
 	{
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index ab157db78335..a86085223677 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -15,6 +15,7 @@
 
 #include "../../codecs/rt1015.h"
 #include "../../codecs/ts3a227e.h"
+#include "../common/mtk-afe-platform-driver.h"
 #include "mt8183-afe-common.h"
 
 #define RT1015_CODEC_DAI "rt1015-aif"
@@ -391,6 +392,36 @@ mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 					  &priv->hdmi_jack, NULL);
 }
 
+static int mt8183_bt_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S5", "I2S0");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S2", "I2S3");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
 static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	/* FE */
 	{
@@ -527,6 +558,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
+		.init = &mt8183_i2s2_init,
 		SND_SOC_DAILINK_REG(i2s2),
 	},
 	{
@@ -541,6 +573,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.ops = &mt8183_mt6358_i2s_ops,
+		.init = &mt8183_bt_init,
 		SND_SOC_DAILINK_REG(i2s5),
 	},
 	{
-- 
2.37.3


