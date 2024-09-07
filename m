Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E4E6FE49
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 01:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pORB/qmyWDO1otKgSMC3zYdW5FT4nBxjmN5ItnnDHsQ=; b=qJFFeYdFgAP/kUA6k5kWiv8QVF
	q5RIiWlUNJ8xrWKRw7wWTp/9EnR6cx91JmZjsl7S60QRR70jUTrPlPmKfVqJEuAWxbKJJSGlxPyV/
	fitv3srt3+8Gxm4QtAib6FjlEkG+vAAXOYndbVjts+IMK9+TknCp0HMM7I46wKJYQTkB+cfKXqfaA
	+AVu6g3ea6tyvxeEartihriU73eHT0UnlGDPzW7A2H+B0Vu8zfWT2UiABx7W35ZKUCExcRUhgF8mJ
	rFAcDaZFIVmS9Kzp3I3gZOCL51ReFo+afRg6lbVdJTOT5ucoYUq/OS+MNlV0JD8irS13cwwGQo6N7
	Yz8YJPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjpf-0000000DzJS-3I4v;
	Sat, 07 Sep 2024 01:01:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjjy-0000000DyKg-04fd;
	Sat, 07 Sep 2024 00:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E70555C5ACB;
	Sat,  7 Sep 2024 00:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DFCC4CEC4;
	Sat,  7 Sep 2024 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725670549;
	bh=d29PX8Kf8MYAinMn4C2D5w94LU1+8WoEKeXakOrts3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ddpbxwGOhlKDdTfrH0Jus/qOrB0R0C797M07biC8FYniSbThI2Y5ASgFyNrsF62wo
	 Nu1F4fVJlOS6r3CYaaXaRfFTyEfhcqdwea8i9XIoqhnw6Vlkjc6bOqKH8A0ia+Oujz
	 16ypB34ISJUCTu4HWTCRxyu/uUQsI+Pe/1TLbRUvPc5sHFx/9fVZo2Yjg2/yT6Z2oV
	 03XcFMFmUrKqMTG9mWU30qm11QwR+ydtmVyNLtLH6urWjC1jXk8rWsKP0HFKm1xeMh
	 qqsbGnz2kOtuvaw/0E9WatpHsu/rZCFsLcaIvFx0HQJ8Xqn3wG+/38RCmbCg/HTRnw
	 7Bc1bnTB92xZA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 07 Sep 2024 01:53:30 +0100
Subject: [PATCH 5/7] ASoC: mt8365: Remove unused variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-asoc-fix-mt8365-build-v1-5-7ad0bac20161@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d29PX8Kf8MYAinMn4C2D5w94LU1+8WoEKeXakOrts3Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm26SANRt5NQ04hFOb/RfJc6j4vAH/dTnmrrFv/
 C9Wsx043JyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtukgAAKCRAk1otyXVSH
 0Ei4B/95b3HQREtmOua5M38o740mYRlt2CFq/K/fN/fQmep4JdPSKRqIOKYYQoRcBBmT7gVTJHK
 ni/dl8zFiHNcH2r8ufA7CBh60Fx+NgqLUt5OPhdt1PVeq56O+jZ2yS1O669CGe54sbQSEX/LD+4
 r91ro5TKC3Vk19vyqi5FT6qfaDQvLdfC0js13eqE1lNvnGMITM7/xMdPBDJfK1QRnkYMHnpnyu5
 UAx5zyL2rxLH+Hj3L/u73wJ0yuJNmVq1ZGfKKeuGgZNnmGiR36LjiZHthXHP85Bv1a6C8JInEln
 c0iXwdR+JqtY8OSlzOi5D7IoMnkVaxvg10i/gC+SEpWoX2RS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_175550_198635_7EDB0418 
X-CRM114-Status: GOOD (  10.87  )
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

Silence compiler warnings by removing unused variables.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 1 -
 sound/soc/mediatek/mt8365/mt8365-mt6357.c  | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 54d2112d2e92..21b1319a6c28 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -651,7 +651,6 @@ static int mt8365_afe_fe_hw_free(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
-	struct mtk_base_afe_memif *memif = &afe->memif[dai_id];
 	struct mt8365_fe_dai_data *fe_data = &afe_priv->fe_data[dai_id];
 	int ret = 0;
 
diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index fef76118f801..1b8d1656101b 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -290,9 +290,8 @@ static int mt8365_mt6357_dev_probe(struct mtk_soc_card_data *soc_card_data, bool
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
 	struct snd_soc_card *card = card_data->card;
 	struct device *dev = card->dev;
-	struct device_node *platform_node;
 	struct mt8365_mt6357_priv *mach_priv;
-	int i, ret;
+	int ret;
 
 	card->dev = dev;
 	ret = parse_dai_link_info(card);

-- 
2.39.2


