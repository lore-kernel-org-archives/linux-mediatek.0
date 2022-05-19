Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D08C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5vmgQpcfL5+a7YIVYNd4jj9Y+WxgSwUnLkP93r9f6o=; b=URbuJo/o4dJdSV
	IC0Deszd1PiOJM0Wl283dG4gCll9Ti5dsmNnSGufP1SLoUZgqhnlALjr8ofO01xvKS21sz/q24DpZ
	16ia14Ev35CrkYzkf78MdtSfbp6lgk/g/5Sv3QSMDP+tOGiyQK/Rh7AplnDTYpm8XMMF6KBo+MKk/
	R93nO+Koj078zqGJBmj8Ezb/9sfBeNfEzBrwyntjJPA255XcrT5dsDSXNHkG7zdgTtK4v/5Fg4m2n
	hl5o4qcMPmIVVaouDv2McLmiRQsUB4J5qCyZoXEPonTPWzrXnMlrQb5AnE7TskH/AL+lglzTNkrXW
	ZqTPcMvm7t5iwi0wQ+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriQa-008AG8-Jv; Thu, 19 May 2022 15:51:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriK2-0083cP-Kg; Thu, 19 May 2022 15:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ZaKUpotIvoQjdFwP7QMhM/HkrShRS0CkfsVa54u1syg=; b=d8LTLtjPAntMsyozqse54eFc11
 8i6sASxHsePoTbYmkQFfyJ8BWDVSbEjpIpMYHMX0ZkitL5bdqzdcuMDvUe3NiBggB93i18aGgyeMu
 tVkVy4f2aoBNfTdxeI5UNBiCiS/YMIt6Zp2dbO0HdNDBJijB+QJ8/yvVvBWaDE+U6IzgW0b2CaWX9
 A0fw8zaSY1zfx3UGCeQLcN0EF4EbyVVWb4cPodxnkzGnr0fabXVeki7TKLn8jWKnBaPVFjZ9HQ6a/
 7obNNI4K55xvK3Nys18cskDO9IhEQaOJxoLe4+bqyRXZxTlYh3drlPjUIKCDJt91esOt1y7gi0Woe
 stxRGlQw==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024B3-6O; Thu, 19 May 2022 15:44:14 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW4012194;
 Thu, 19 May 2022 10:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZaKUpotIvoQjdFwP7QMhM/HkrShRS0CkfsVa54u1syg=;
 b=YN6ej9i/DaUwKi4WVG4klAJ0DdYoE0b40D8lRgZJMZc2zTEq2FwNM0+SSGGSeY78MXrs
 xZYuob90IvQK5lULl8v8UGVckZ7Wbqw0h/+8XoTFp5Nw2LMZ6orPZXXDMovQvzU0qeVQ
 EPOaxx/Os2qccEm1P/DFcRrQpWQTI7mVIjOR5/hrFSXQFhbFwHjv3JGf4gelj5QMkDC6
 6jFze3jVZv4dalMqOsyYTg7D1tlE5N84WGkPCXftFgdArtLslD6hJYckZdcOsz9e6nx4
 Z5uIXpLgZj7w4haQRz3pJxb+gZ7m7ekVdW8LArtMcau4vowehKMH1Z3xBgyLq/aXxcsJ /w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1636F11D1;
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
Subject: [PATCH 24/56] ASoC: test-component: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:46 +0100
Message-ID: <20220519154318.2153729-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: q0UNWcUb84d3WFxs6NgPjsPFwNx8_Vjq
X-Proofpoint-ORIG-GUID: q0UNWcUb84d3WFxs6NgPjsPFwNx8_Vjq
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164409_048343_0EF3C2B1 
X-CRM114-Status: GOOD (  16.07  )
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
 sound/soc/generic/test-component.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 5da4725d9e16c..3a992a6eba9bb 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -66,7 +66,7 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int format = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 	unsigned int clock  = fmt & SND_SOC_DAIFMT_CLOCK_MASK;
 	unsigned int inv    = fmt & SND_SOC_DAIFMT_INV_MASK;
-	unsigned int master = fmt & SND_SOC_DAIFMT_MASTER_MASK;
+	unsigned int master = fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 	char *str;
 
 	dev_info(dai->dev, "name   : %s", dai->name);
@@ -105,16 +105,16 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	str = "unknown";
 	switch (master) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
 		str = "clk provider, frame provider";
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
 		str = "clk consumer, frame provider";
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BP_FC:
 		str = "clk provider, frame consumer";
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BC_FC:
 		str = "clk consumer, frame consumer";
 		break;
 	}
@@ -192,10 +192,10 @@ static int test_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 static u64 test_dai_formats =
 	/*
 	 * Select below from Sound Card, not auto
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFP
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFP
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFC
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFC
+	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FP
+	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FP
+	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FC
+	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FC
 	 */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
@@ -210,7 +210,7 @@ static u64 test_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
 
 static const struct snd_soc_dai_ops test_ops = {
-	.set_fmt		= test_dai_set_fmt,
+	.set_fmt_new		= test_dai_set_fmt,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
 	.auto_selectable_formats	= &test_dai_formats,
@@ -221,7 +221,7 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.set_sysclk		= test_dai_set_sysclk,
 	.set_pll		= test_dai_set_pll,
 	.set_clkdiv		= test_dai_set_clkdiv,
-	.set_fmt		= test_dai_set_fmt,
+	.set_fmt_new		= test_dai_set_fmt,
 	.mute_stream		= test_dai_mute_stream,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
