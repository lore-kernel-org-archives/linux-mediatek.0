Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463D0C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5g/c+Gw5heRTkowNq0thWEE3k4ymlDAHwkpaiIIYbZM=; b=N/XnftVdCbnrqG
	oxWGztdPDyAV3gxPqUKA9ZWBT0C7tBeLEcJvzPX+y93ZNM6SlYOP8EmuqxMyWOF762IteJaTUnmys
	9zRIdFQDqdsP4A/pmAHrjn29/Bu0fFoEgKBThpAUDnERcKlAizN5xmWZAFY1mFFsRhO5Uc/B1beMI
	hgDqw1hI7AwY3lchbIh9z0uwRT7HoNxR8hQ7Zfs5JsBTcbVqepar3dD4lfU+/Brak3+drx0vZjret
	ZfMW6SuZ7kyuzErP3ozS51GNaqKCBUNQeKEZPckrnNIne8FkmTEElIFmxZcZyW8bBOCWrLZm/Xrni
	fCJ2IEXVu+tmdJAPk78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriMS-0085t4-9t; Thu, 19 May 2022 15:46:48 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJb-0083EP-27; Thu, 19 May 2022 15:43:57 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11u002261;
 Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AjjqMicnhPoZqT6UYhPvoYkn3XWnwuGY9ExR1ybyO/8=;
 b=NK96uTLoDF75ZrvxXTw7p6hi4vOr0sdLWBCFb7xG2WQmM7XY+OSWKOGylt80CwFHEW0E
 vFhM7kYvrRxtFCW7nLM2xduTcKUBmqHh4lQr8sV/uUkgXbFgGEfe+1xcxQfVQOFwvqf5
 A3pODWEL7GZnc8tJxO1yIoPrWM2qx0A+NkP7QDSgAyQ44vklOyxds0962e9L+amBschB
 JVN5JmUiThHA6OHIZ85kQQCP4n9hf8oh1h9ejwTkDE6OFAmENLWwJLW+EJStVYBoKQjB
 DA7lPaF2/RSeC7+BYerdro+mM77ha8x4GHdwnkNK4ugcjsHnlIdFQhBfyMpWDB8diSJ/ wA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA87A476;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
 <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
 <shawnguo@kernel.org>, <linux-imx@nxp.com>,
 <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
 <srinivas.kandagatla@linaro.org>, <linux-rockchip@lists.infradead.org>,
 <krzk@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
 <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
 <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
 <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 19/56] ASoC: samsung: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:41 +0100
Message-ID: <20220519154318.2153729-20-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 579zJA1j8qpgk8t0NR1Uq8E4v_eh2bkG
X-Proofpoint-ORIG-GUID: 579zJA1j8qpgk8t0NR1Uq8E4v_eh2bkG
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_084351_168130_2D5C1988 
X-CRM114-Status: GOOD (  17.05  )
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

As part of updating the core to directly tell drivers if they are clock
provider or consumer update these CPU side drivers to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/samsung/i2s.c         | 8 ++++----
 sound/soc/samsung/pcm.c         | 6 +++---
 sound/soc/samsung/s3c-i2s-v2.c  | 8 ++++----
 sound/soc/samsung/s3c24xx-i2s.c | 8 ++++----
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 70c827162be4d..9ed275ebd744e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -671,11 +671,11 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		tmp |= mod_slave;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		/*
 		 * Set default source clock in Master mode, only when the
 		 * CLK_I2S_RCLK_SRC clock is not exposed so we ensure any
@@ -1107,7 +1107,7 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
 	.trigger = i2s_trigger,
 	.hw_params = i2s_hw_params,
-	.set_fmt = i2s_set_fmt,
+	.set_fmt_new = i2s_set_fmt,
 	.set_clkdiv = i2s_set_clkdiv,
 	.set_sysclk = i2s_set_sysclk,
 	.startup = i2s_startup,
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 4c4dfde0568fe..818172d8832d2 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -340,8 +340,8 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		goto exit;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* Nothing to do, Master by default */
 		break;
 	default:
@@ -437,7 +437,7 @@ static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.set_clkdiv	= s3c_pcm_set_clkdiv,
 	.trigger	= s3c_pcm_trigger,
 	.hw_params	= s3c_pcm_hw_params,
-	.set_fmt	= s3c_pcm_set_fmt,
+	.set_fmt_new	= s3c_pcm_set_fmt,
 };
 
 static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index de66cc422e6ea..9c8a0697849d7 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -252,12 +252,12 @@ static int s3c2412_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	iismod = readl(i2s->regs + S3C2412_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->master = 0;
 		iismod |= S3C2412_IISMOD_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->master = 1;
 		iismod &= ~S3C2412_IISMOD_SLAVE;
 		break;
@@ -666,7 +666,7 @@ int s3c_i2sv2_register_component(struct device *dev, int id,
 	ops->trigger = s3c2412_i2s_trigger;
 	if (!ops->hw_params)
 		ops->hw_params = s3c_i2sv2_hw_params;
-	ops->set_fmt = s3c2412_i2s_set_fmt;
+	ops->set_fmt_new = s3c2412_i2s_set_fmt;
 	ops->set_clkdiv = s3c2412_i2s_set_clkdiv;
 	ops->set_sysclk = s3c_i2sv2_set_sysclk;
 
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 0f46304eaa4f3..6226b3b585e54 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -169,11 +169,11 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_CFC:
 		iismod |= S3C2410_IISMOD_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		iismod &= ~S3C2410_IISMOD_SLAVE;
 		break;
 	default:
@@ -394,7 +394,7 @@ static int s3c24xx_i2s_resume(struct snd_soc_component *component)
 static const struct snd_soc_dai_ops s3c24xx_i2s_dai_ops = {
 	.trigger	= s3c24xx_i2s_trigger,
 	.hw_params	= s3c24xx_i2s_hw_params,
-	.set_fmt	= s3c24xx_i2s_set_fmt,
+	.set_fmt_new	= s3c24xx_i2s_set_fmt,
 	.set_clkdiv	= s3c24xx_i2s_set_clkdiv,
 	.set_sysclk	= s3c24xx_i2s_set_sysclk,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
