Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FF5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn7ZG1ALis0Zs1M8eBtgCHbhHXpQkM3/jN2C9n6Nczw=; b=o5lwmAIexMPnH/
	zpPVB9xYsesjzNUD8xsiOav76q/R5vKbZxy02GxqPLHhsw69LmtuyzCtiq4SKVHIOu4bLTYdWHO+R
	UaENxZW0n/C1AYw0C9GN36eg/pQY/mIm7BQ63jXYYaUT32WuFgEAbmv22mAgpPIPIxL667jXJqNTV
	A9TrVrd/l/d0WFPjnzGcJJjKuynlHxBg10aCvIi9muObEktl+STzX3I1RW57WAjzhKzV4jVDXBlyn
	j/WI4RC3E8Aa21Z15ZzioHxcsYE2PajP8oI8DNHaMB6/F3uODSNmdH3mxbp8O9CnU+IpgDG8UiyO7
	WIvdpihuNz92KWLl3NLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriKj-0084GT-Md; Thu, 19 May 2022 15:45:01 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJY-00839g-GS; Thu, 19 May 2022 15:43:52 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtab024228;
 Thu, 19 May 2022 10:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=emFWkhbKLVsY07EOxiGd6bRhil5YXk3bYL2bmY5jBhs=;
 b=gE7ASeZMhHcJqs5B7NPSes7hj5CyprtFA2EKL8SbShKqYtFabOCjJF7lHKhcfgMUPId6
 H5i5uuPx0JpJd6dw/vMuYJ+ycfQdTOSeTcUCpx+ZuPweP8ubw1xH/HQQC37a0o+4gLx0
 fmHIihOvrpnz60EkaRyDiWbmh8WzfP82quKCUXDQX+9ituAlqgSramhvSb+2sjA24+z/
 /+KxTsJxKeUDCdhzA1XWFYzN6sOx6Hde58g5TSNOnX/zY2nRBMIDoxDU5xbO3i8DyeWo
 bRwfWm722KdAMsBkUjmhOkZSurVQfRgJhxECR6BjHDc9bNdtsxML3x7OofG/TG9f2T/4 QQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B4557475;
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
Subject: [PATCH 05/56] ASoC: bcm: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:27 +0100
Message-ID: <20220519154318.2153729-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ajhifK472w28_I4WDVyEuSohJoIsbKCp
X-Proofpoint-ORIG-GUID: ajhifK472w28_I4WDVyEuSohJoIsbKCp
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_084348_777872_1BD6FEB1 
X-CRM114-Status: GOOD (  14.58  )
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
 sound/soc/bcm/bcm2835-i2s.c | 22 +++++++++++-----------
 sound/soc/bcm/cygnus-ssp.c  |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index e3fc4bee8cfdc..aa7d8e081f89a 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -133,8 +133,8 @@ static void bcm2835_i2s_start_clock(struct bcm2835_i2s_dev *dev)
 		return;
 
 	switch (provider) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		clk_prepare_enable(dev->clk);
 		dev->clk_prepared = true;
 		break;
@@ -385,12 +385,12 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* Check if CPU is bit clock provider */
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		bit_clock_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BC_FC:
 		bit_clock_provider = false;
 		break;
 	default:
@@ -399,12 +399,12 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* Check if CPU is frame sync provider */
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BC_FP:
 		frame_sync_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FC:
+	case SND_SOC_DAIFMT_BC_FC:
 		frame_sync_provider = false;
 		break;
 	default:
@@ -743,7 +743,7 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.prepare	= bcm2835_i2s_prepare,
 	.trigger	= bcm2835_i2s_trigger,
 	.hw_params	= bcm2835_i2s_hw_params,
-	.set_fmt	= bcm2835_i2s_set_dai_fmt,
+	.set_fmt_new	= bcm2835_i2s_set_dai_fmt,
 	.set_bclk_ratio	= bcm2835_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
 };
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 9698f4531c90f..257f3657bcd6e 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -849,11 +849,11 @@ static int cygnus_ssp_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	ssp_newcfg = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		ssp_newcfg |= BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 1;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		ssp_newcfg &= ~BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 0;
 		break;
@@ -1148,7 +1148,7 @@ static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.shutdown	= cygnus_ssp_shutdown,
 	.trigger	= cygnus_ssp_trigger,
 	.hw_params	= cygnus_ssp_hw_params,
-	.set_fmt	= cygnus_ssp_set_fmt,
+	.set_fmt_new	= cygnus_ssp_set_fmt,
 	.set_sysclk	= cygnus_ssp_set_sysclk,
 	.set_tdm_slot	= cygnus_set_dai_tdm_slot,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
