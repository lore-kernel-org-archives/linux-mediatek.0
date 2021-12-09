Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34999C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3xmKHoaajPkFUsKilEn6jtvwCoF2rW/Ia5XkPpV3uDk=; b=Z8SUs8ss9hMQWg
	5nOgpN2caCmbpfHxjRnN0ueHJT/l2YbCyLzCSq/VpXr/BJvQSHjYZF82WEoNjjc9NytwRHm+Dzf+m
	BI0wb9S/sFNMehJh62lChyrQSXlsVhqGPsaiRrWlzx24/NKgkyCKHGyoenodCcfGDHcYBE236IlQD
	Q/nPHdtfBx1kiv3gNvP7GgkLroGJmHJ0wdsHQNLSSMa++qIuO52o0Ec9XW6hUkALoqmMDs0t5wV8X
	kAGaHobtMajvXoucHm8dg5l8zI+WzfP80UMf+1gP/CqM4Sj/rjRMOafCaIFrq+BHOIMLLyp/BguiZ
	bWP2zEWkENx5v9LK8FQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvDv9-00F9oa-JW; Thu, 09 Dec 2021 07:32:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvDux-00F9m5-EA; Thu, 09 Dec 2021 07:32:41 +0000
X-UUID: 931d4c4d734747afa5320176ae8902ff-20211209
X-UUID: 931d4c4d734747afa5320176ae8902ff-20211209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 116725005; Thu, 09 Dec 2021 00:32:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 23:32:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 15:32:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 9 Dec 2021 15:32:27 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <tzungbi@google.com>, <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: mediatek: assign correct type to argument
Date: Thu, 9 Dec 2021 15:32:24 +0800
Message-ID: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_233239_512147_5C6B267A 
X-CRM114-Status: GOOD (  11.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the following sparse warning: (new ones prefixed by >>)
>> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
     sparse: sparse: incorrect type in argument 3 (different base types)
   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
     expected unsigned int to
   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
     got restricted snd_pcm_format_t [usertype]

Correct discription of format, use S32_LE and S24_LE to distinguish the
different 32bit.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c   |  8 ++++----
 .../mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 12 ++++++------
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    |  4 ++--
 .../mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c    |  4 ++--
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c    |  4 ++--
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a4d26a6fc849..f8a72a5102ad 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -155,9 +155,9 @@ static const struct snd_soc_ops mt8183_da7219_rt1015_i2s_ops = {
 static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S32_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 
@@ -167,9 +167,9 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					     struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index aeb1af86047e..d5fc86132b49 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -94,11 +94,11 @@ static const struct snd_soc_ops mt8183_mt6358_rt1015_i2s_ops = {
 static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
-	dev_dbg(rtd->dev, "%s(), fix format to 32bit\n", __func__);
+	dev_dbg(rtd->dev, "%s(), fix format to S32_LE\n", __func__);
 
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S32_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 	return 0;
@@ -107,11 +107,11 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					     struct snd_pcm_hw_params *params)
 {
-	dev_dbg(rtd->dev, "%s(), fix format to 32bit\n", __func__);
+	dev_dbg(rtd->dev, "%s(), fix format to S24_LE\n", __func__);
 
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 	return 0;
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index a606133951b7..1d16939f80e3 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -350,9 +350,9 @@ static int mt8192_mt6359_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index cca1c739e690..5cdbfaafd479 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -359,7 +359,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
@@ -464,7 +464,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 11a185da0d96..fa50a31e9718 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -355,7 +355,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
@@ -463,7 +463,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
