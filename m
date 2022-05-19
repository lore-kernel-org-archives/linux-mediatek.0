Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oh408cl03u6YPTFJc/U0o1ne0a2NBCeHELkC8DlrLEE=; b=NYILgzoaVB++51
	2MdYxKCfClTvzxZAmmZ+LiBcU3jeug7CFec/MRfD6u9xTx48Ilf9v87oZGcjsJW9uX5sVX3Dz4KQt
	pVzoW82AKA4U8BttdFxpSuw5ll/gUqdZQeAcX0DAvFljNOUDGnBHEtRNM2j6OpqDSgLNNBbHOy9ZF
	4jb/hUvdhfkgGifVPffUz87oVM5IA3t4P/gqhBB/fxsJDe59B0JAlMDJf4aTes+E13qKXSn5OMiDj
	UhOa+aFHCb+WKJTJhZSPw+D7MpMj4AhS2OlByeVGm5KOWsy50Bs612IWKE402Y/L+osQ8sJWefJUa
	NAMocAJ60BOCP+8yObrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriT6-008CxX-Li; Thu, 19 May 2022 15:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKC-0083l3-Jb; Thu, 19 May 2022 15:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=acSxSHHdEGhP/Pg2fdRdjf1RhdGB8CAjjCO1XuRlCRo=; b=IOPbZlNr9785vmwy8/VSUbAsg0
 Tuw8I1ASHqIVltwzeR2Aufrw3HyOkKWvaJOyibx1/9fJ93HNSNTzHmqEjOY2+hWKlsoEaLZbcz4No
 YW3PKN0a50egaeco5t3nXXabjwwVWNSt1EwICNpaz0NZhC9XqYYTtWKwTBozUY/Vc60kbQpabX82A
 JKRYAAU5RKTLAh1Y7OvgZjVZP82Du3PbM0AC7teUHahpQDR0TMR3V7xIWWpBSTFyrZCvqvCbo4NQl
 FKG5NHj/2maKKStmO9C5llK0LkL7Y+U2qJOrSnrnvJzOB8w5MxRdvBk2jn5szYdhxH03zbzHnTmVR
 3HX/X7Nw==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJt-0024BF-GG; Thu, 19 May 2022 15:44:17 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11s002261;
 Thu, 19 May 2022 10:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=acSxSHHdEGhP/Pg2fdRdjf1RhdGB8CAjjCO1XuRlCRo=;
 b=bXcHVLNq1bHnvyVywh+fMEeYkV6xXfOg1Er4VRZwQVddlvaExppL1miEWgEOO5tL665K
 802ILUbsA9i4z4o1Wl4e6MJLxpaK2OV53Rp1N7WABAoBLycAId+jp8+5BvBCFJ0+Y9pF
 Zle0mEs19zAgeT5NiP2cESaXLF64o4g4H+8dVZMv8NZog7JyMAFN4asFBoAilGWtD53F
 q7uiBWrfb2OlPF+pjM3c1DfDu6VVPTLHn/uJIW2vJ9BO4GMoqtKFNl2oXj/ryfJo3nCc
 26Rg3JCBNXl/ZV3FlXvmuo1sUjKrgvgaJiWGcxO0MhYr2pL/oGp/dWyHOYhEnEJCF6wO GQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7D737476;
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
Subject: [PATCH 16/56] ASoC: pxa: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:38 +0100
Message-ID: <20220519154318.2153729-17-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: tKunTf8kTDNvKWQiO1tF1HTK68q_UWdw
X-Proofpoint-ORIG-GUID: tKunTf8kTDNvKWQiO1tF1HTK68q_UWdw
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164411_354300_F8EB8099 
X-CRM114-Status: GOOD (  16.99  )
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
 sound/soc/pxa/magician.c   |  8 ++++----
 sound/soc/pxa/mmp-sspa.c   |  8 ++++----
 sound/soc/pxa/pxa-ssp.c    | 24 ++++++++++++------------
 sound/soc/pxa/pxa2xx-i2s.c |  8 ++++----
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/pxa/magician.c b/sound/soc/pxa/magician.c
index a5f326c97af23..b0df3237d0746 100644
--- a/sound/soc/pxa/magician.c
+++ b/sound/soc/pxa/magician.c
@@ -90,13 +90,13 @@ static int magician_playback_hw_params(struct snd_pcm_substream *substream,
 
 	/* set codec DAI configuration */
 	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_MSB |
-			SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_BC_FC);
 	if (ret < 0)
 		return ret;
 
 	/* set cpu DAI configuration */
 	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_NB_IF | SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_NB_IF | SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0)
 		return ret;
 
@@ -128,14 +128,14 @@ static int magician_capture_hw_params(struct snd_pcm_substream *substream,
 	/* set codec DAI configuration */
 	ret = snd_soc_dai_set_fmt(codec_dai,
 			SND_SOC_DAIFMT_MSB | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_BC_FC);
 	if (ret < 0)
 		return ret;
 
 	/* set cpu DAI configuration */
 	ret = snd_soc_dai_set_fmt(cpu_dai,
 			SND_SOC_DAIFMT_MSB | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 7e39210a0b384..b746e52aaf85f 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -171,11 +171,11 @@ static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	sspa->sp   = SSPA_SP_WEN | SSPA_SP_S_RST | SSPA_SP_FFLUSH;
 	sspa->ctrl = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		sspa->sp |= SSPA_SP_MSL;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
 	default:
 		return -EINVAL;
@@ -346,7 +346,7 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.hw_params	= mmp_sspa_hw_params,
 	.set_sysclk	= mmp_sspa_set_dai_sysclk,
 	.set_pll	= mmp_sspa_set_dai_pll,
-	.set_fmt	= mmp_sspa_set_dai_fmt,
+	.set_fmt_new	= mmp_sspa_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 7f13a35e9cc14..52124be1778eb 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -372,10 +372,10 @@ static int pxa_ssp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct ssp_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -432,14 +432,14 @@ static int pxa_ssp_configure_dai_fmt(struct ssp_priv *priv)
 
 	sscr1 |= SSCR1_RxTresh(8) | SSCR1_TxTresh(7);
 
-	switch (priv->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (priv->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		sscr1 |= SSCR1_SCLKDIR | SSCR1_SFRMDIR | SSCR1_SCFR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		sscr1 |= SSCR1_SCLKDIR | SSCR1_SCFR;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -484,9 +484,9 @@ static int pxa_ssp_configure_dai_fmt(struct ssp_priv *priv)
 	pxa_ssp_write_reg(ssp, SSCR1, sscr1);
 	pxa_ssp_write_reg(ssp, SSPSP, sspsp);
 
-	switch (priv->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	switch (priv->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BC_FP:
 		scfr = pxa_ssp_read_reg(ssp, SSCR1) | SSCR1_SCFR;
 		pxa_ssp_write_reg(ssp, SSCR1, scfr);
 
@@ -824,7 +824,7 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.trigger	= pxa_ssp_trigger,
 	.hw_params	= pxa_ssp_hw_params,
 	.set_sysclk	= pxa_ssp_set_dai_sysclk,
-	.set_fmt	= pxa_ssp_set_dai_fmt,
+	.set_fmt_new	= pxa_ssp_set_dai_fmt,
 	.set_tdm_slot	= pxa_ssp_set_dai_tdm_slot,
 	.set_tristate	= pxa_ssp_set_dai_tristate,
 };
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 5bfc1a9665320..09a0d033df6a2 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -131,11 +131,11 @@ static int pxa2xx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		pxa_i2s.master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		pxa_i2s.master = 0;
 		break;
 	default:
@@ -335,7 +335,7 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.shutdown	= pxa2xx_i2s_shutdown,
 	.trigger	= pxa2xx_i2s_trigger,
 	.hw_params	= pxa2xx_i2s_hw_params,
-	.set_fmt	= pxa2xx_i2s_set_dai_fmt,
+	.set_fmt_new	= pxa2xx_i2s_set_dai_fmt,
 	.set_sysclk	= pxa2xx_i2s_set_dai_sysclk,
 };
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
