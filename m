Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D53C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlNKCVNapa4nuc+cGJ8eCi3mdCOIN3BNt2N9pp4yJfQ=; b=C7XOU9zfNqUa3v
	TvAf4iTIMDSGnxL0g308skTxjmdAe5onfpJujmuyKBtYe9G/ggnsrJyq1P3waCYV7AcV/J82M7oVZ
	Hf8Xhw4PMNX0UDfY264wgz00GW+C5o/NzlB8QS04dX9PYFY2uOUQsJhYkrQrnaXCioUkVeaZMVETE
	1KGo4q94EBQ4pFQcj+wAO/iAAqp38k/r99dzI3bQhndMEcZwAgxhrBmV/hcbPpLpki0XeTIMLlrvP
	96sO4EeG2eAwMR47FujgknlxFaZjM1ugZlnw++UlPpLl5Aqbtnh7sxfGwGdNUqEVgsSFtrTjlp8mY
	R0Xvno78WRV/gZ/mQf4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriTJ-008D9l-6O; Thu, 19 May 2022 15:53:53 +0000
Received: from desiato.infradead.org ([90.155.92.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKE-0083mb-Ec; Thu, 19 May 2022 15:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=lEOQzf6jwkcqt46v/7lQAovdPprogCzrzpBkFDA/ta8=; b=aZ4zN0BN5mLrmJ4SPtsbB3jSKC
 OTFFglrd/aQ49RkF1SJDNfscYIukjMj4B5HIGdu1nkt6flFqNU5IYKypbe1vIBS926RzPMNvjOQ5g
 ADg91IWc//H7KJcsrzh3BA+PLTfzWwjGMSYaMfV2tyGiZSJR5K1gBn4Vs51t7/z3ihwlaP28uAfyh
 jXY4bLjc77wLFOrvKBElWnZpM7NVGrmn4mH3jCaJHzy//IlsXKuS/dOnRqYKTdIVcRn2Gk2ydWuj0
 LL6Hrgey/L2S6Q9BULM0NBuZcTQY/7Uu3CGR2EDyMOBzrJ+yNR2cLNNL5coL+pt7XtdTf5oCtLcJl
 HIHF6rdg==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJv-0024B1-Kf; Thu, 19 May 2022 15:44:24 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW5012194;
 Thu, 19 May 2022 10:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lEOQzf6jwkcqt46v/7lQAovdPprogCzrzpBkFDA/ta8=;
 b=oBCgo64Ot9kwqpn8BjeWCwSMTHJ4/tUtlSQu6BXLO/4AI8N2KEoe3av7vP2tAZlH6kqz
 swNBkn+VTriZZN49ptokqEA5/0DVJSHKFybpJZLtVrOTeiYxC0jMBIfcDUKmyBeB2lsw
 yv9bs0xc1Nf8TKmq1/bfC6+FzXN+PnipDaNJSfJL9v+sPmfV8VIc5AqxbgnCVA6cEqpx
 t+U+n2f1oKd2IGqAsY18g+J0Y4rjFKAL3VDIoRtCdsnGrKjDKLpHx3sYrq+7VdcPLFzn
 yLVXwXpCH1xs0huB70buwByQyIf1AgiMsdaSvvw5DoSRhrhnGCRp/aq/TFe7BGV+m+Wg 3g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3DDB111D1;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
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
Subject: [PATCH 26/56] ASoC: ux500: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:48 +0100
Message-ID: <20220519154318.2153729-27-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ilAx8M0voF3WSsU_nn-pp0DNJuhb3sWj
X-Proofpoint-ORIG-GUID: ilAx8M0voF3WSsU_nn-pp0DNJuhb3sWj
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164412_653635_25F91B91 
X-CRM114-Status: GOOD (  15.74  )
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
 sound/soc/ux500/ux500_msp_dai.c | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 21052378a32eb..cd6c4bdf5041d 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -191,8 +191,8 @@ static int setup_clocking(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		dev_dbg(dai->dev, "%s: Codec is master.\n", __func__);
 
 		msp_config->iodelay = 0x20;
@@ -204,7 +204,7 @@ static int setup_clocking(struct snd_soc_dai *dai,
 
 		break;
 
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		dev_dbg(dai->dev, "%s: Codec is slave.\n", __func__);
 
 		msp_config->tx_clk_sel = TX_CLK_SEL_SRG;
@@ -328,15 +328,15 @@ static int setup_msp_config(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "%s: rate: %u, channels: %d.\n", __func__,
 		runtime->rate, runtime->channels);
 	switch (fmt &
-		(SND_SOC_DAIFMT_FORMAT_MASK | SND_SOC_DAIFMT_MASTER_MASK)) {
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS:
+		(SND_SOC_DAIFMT_FORMAT_MASK | SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK)) {
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BP_FP:
 		dev_dbg(dai->dev, "%s: SND_SOC_DAIFMT_I2S.\n", __func__);
 
 		msp_config->default_protdesc = 1;
 		msp_config->protocol = MSP_I2S_PROTOCOL;
 		break;
 
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC:
 		dev_dbg(dai->dev, "%s: SND_SOC_DAIFMT_I2S.\n", __func__);
 
 		msp_config->data_size = MSP_DATA_BITS_16;
@@ -348,10 +348,10 @@ static int setup_msp_config(struct snd_pcm_substream *substream,
 
 		break;
 
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BC_FC:
 		dev_dbg(dai->dev, "%s: PCM format.\n", __func__);
 
 		msp_config->data_size = MSP_DATA_BITS_16;
@@ -477,7 +477,7 @@ static int ux500_msp_dai_prepare(struct snd_pcm_substream *substream,
 	}
 
 	/* Set OPP-level */
-	if ((drvdata->fmt & SND_SOC_DAIFMT_MASTER_MASK) &&
+	if ((drvdata->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) &&
 		(drvdata->msp->f_bitclk > 19200000)) {
 		/* If the bit-clock is higher than 19.2MHz, Vape should be
 		 * run in 100% OPP. Only when bit-clock is used (MSP master)
@@ -544,13 +544,13 @@ static int ux500_msp_dai_set_dai_fmt(struct snd_soc_dai *dai,
 	dev_dbg(dai->dev, "%s: MSP %d: Enter.\n", __func__, dai->id);
 
 	switch (fmt & (SND_SOC_DAIFMT_FORMAT_MASK |
-		SND_SOC_DAIFMT_MASTER_MASK)) {
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBM_CFM:
+		SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK)) {
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BC_FC:
 		break;
 
 	default:
@@ -707,7 +707,7 @@ static int ux500_msp_dai_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
 	{
 		.set_sysclk = ux500_msp_dai_set_dai_sysclk,
-		.set_fmt = ux500_msp_dai_set_dai_fmt,
+		.set_fmt_new = ux500_msp_dai_set_dai_fmt,
 		.set_tdm_slot = ux500_msp_dai_set_tdm_slot,
 		.startup = ux500_msp_dai_startup,
 		.shutdown = ux500_msp_dai_shutdown,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
