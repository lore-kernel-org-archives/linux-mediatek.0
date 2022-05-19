Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20AAC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXI1vTExaZtWJg5ALldqieCktphScrz4ZVBx03pIsjg=; b=M0WB0N0chwEk+Y
	LrkDbQCGGtopHserTRd033UGM82k/ldPyLk2UGZeN4e94yNXorlOnWTo+RobC813kEeK0fS/pTyvk
	dckollFli25cMSS7Uy0dxQwkk5T/+nR6yVswbORqeTCDYOhjCOodLqM5JuW1Jzqd9GH+N8LPFvvt6
	jM5M5aJIik6uykLNy1G/hEr19UG10iLvElazP0d1+onLYscRAviEvAg03lAsurg7byTzYpZBVGjAd
	nYNkIQ7PZAvPlXprb4FUvJONQtcfDuS/HWMIOkcBtD/UzchmR2iWdOlyCabqFpeqNP16dqdFZ502z
	O2gV7hh0QJrLf6JyEKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriLj-0085DN-D3; Thu, 19 May 2022 15:46:03 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJZ-0083Av-3P; Thu, 19 May 2022 15:43:54 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtad024228;
 Thu, 19 May 2022 10:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JZwMeAXTmKyqZh6PnwjGmQ7Sg6P9A85VRbLP68aHx+U=;
 b=NuKu4vk+OZb2YcWlAAFVraEWupCLmAqo6g/teCFwiVObhAP2zaNgrGJkg7fqXXlvkf+W
 j8VllfGLHAb7SHTVf4t/KetLhJk2FG+dCpkE66CeRU3PKM5CR9jXYIxoEkHEuAuZOqKj
 Dcny0Oe3fGhBQOshT+Gf4mpVoV92gK2bXBpDdvfBF5pcDl2g2GXHbO/8w6ix4KkRKVoQ
 pUCAfZFnWfV+/4Lg0ReHkO1GpMbjzGru8BcJ/QGXithzrck4mcqarMpQheE9lGQLKk+R
 VRcxLEIwpFUQn2dB6BuEE5ghSeyVTwq6c4hubJzdTwnhDjhfvXcVowjNQBlv+uvz95gP yQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F195D11D3;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
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
Subject: [PATCH 09/56] ASoC: hisilicon: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:31 +0100
Message-ID: <20220519154318.2153729-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: xseAf3viMvfsJbVMvc_EICfoCoFhnqVY
X-Proofpoint-ORIG-GUID: xseAf3viMvfsJbVMvc_EICfoCoFhnqVY
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_084349_331756_77F1B8C5 
X-CRM114-Status: GOOD (  15.18  )
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
provider or consumer update this CPU side driver to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index a297d4af5099f..51f98ae651a6b 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -227,9 +227,9 @@ static int hi6210_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	 * We don't actually set the hardware until the hw_params
 	 * call, but we need to validate the user input here.
 	 */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -245,8 +245,8 @@ static int hi6210_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	}
 
 	i2s->format = fmt;
-	i2s->master = (i2s->format & SND_SOC_DAIFMT_MASTER_MASK) ==
-		      SND_SOC_DAIFMT_CBS_CFS;
+	i2s->master = (i2s->format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+		      SND_SOC_DAIFMT_BP_FP;
 
 	return 0;
 }
@@ -375,21 +375,21 @@ static int hi6210_i2s_hw_params(struct snd_pcm_substream *substream,
 	hi6210_write_reg(i2s, HII2S_MUX_TOP_MODULE_CFG, val);
 
 
-	switch (i2s->format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (i2s->format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->master = false;
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
 		val |= HII2S_I2S_CFG__S2_MST_SLV;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->master = true;
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
 		val &= ~HII2S_I2S_CFG__S2_MST_SLV;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 		break;
 	default:
-		WARN_ONCE(1, "Invalid i2s->fmt MASTER_MASK. This shouldn't happen\n");
+		WARN_ONCE(1, "Invalid i2s->fmt CLOCK_PROVIDER_MASK. This shouldn't happen\n");
 		return -EINVAL;
 	}
 
@@ -513,7 +513,7 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.trigger	= hi6210_i2s_trigger,
 	.hw_params	= hi6210_i2s_hw_params,
-	.set_fmt	= hi6210_i2s_set_fmt,
+	.set_fmt_new	= hi6210_i2s_set_fmt,
 	.startup	= hi6210_i2s_startup,
 	.shutdown	= hi6210_i2s_shutdown,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
