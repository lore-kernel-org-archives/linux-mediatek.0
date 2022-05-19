Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BDEC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkB3Jt80ND0zsmJC81pNGIKvypvS99Mm68wENRsPXtU=; b=FGFRXWFpeXM1nj
	MKdC3qo7ouvFoIBQ6qtwBlL2QMJMB2q1lVsGGzF1FhhqhcUe1Yixyp4Iv+aABeVJ/LSVeRVqaMeHs
	PnzA8P9tUpOHYwc3pd8l/wDF+NO+Xbtqn/N7qzxBl9NcTtYksSgdGJN2Qi85GTHO086FZrj+gAtyp
	l6GmhPfeKVbgZJKaPgucxbmmi9EEW+nmeu16Uxu8L/WM05sonZXR0r5HdS9iUGpHoeOOHuKsbCFYs
	/I1mkUcgcGJEARlzaaPkob6KNlxKEPxin/dZBoLug+c/ZQhWrUg57Z8ucFTsX1trpnvdgMaJsZtpl
	MMjtiIzO2jAfRWw4XA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriOp-0088Km-Fz; Thu, 19 May 2022 15:49:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJu-0083Uu-Hr; Thu, 19 May 2022 15:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=47fUoxbjqBre4OhI68iIK7gXTlIUAeEjBy1fpTbx+2I=; b=Phd4rVacIf7UT40BtIHowogRce
 SjhIWbDK4XBK7TUZ6a6mk/xdH4hStXoDFOt6qd4hYWMAOh575ZXrNA+jcZKJv5SWApFS5iNyeVeMr
 VBmX1Xu14GYdrp5zYxGgsnyF67DV9vcTaYqw4mmsYDAdiGylji48/vgZJTmTEC/ikmz1MR8usXCpQ
 9Q9ZJQ1f++z3yfXiGoH6d+2jCqx9S8Gvip0szc5Z5/ciKN4oQ3Cxw3YzcIEOfQI6tNV8YV+GQbppr
 j4FRZhzV6I2aPg0hRGQ8kdyUos7liIwihJHu6YuNOgqzWW125DmD68O7XgJDYt4N3ykP4WyDm9BoU
 t5BE3QmA==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQd-QO; Thu, 19 May 2022 15:44:09 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mVv012194;
 Thu, 19 May 2022 10:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=47fUoxbjqBre4OhI68iIK7gXTlIUAeEjBy1fpTbx+2I=;
 b=EZIRm7Zy4iywxKcAPPZ6RbFV5LL6HfHL32Ihijq9cKxdguCP78YFHEKTFc/fZefCx+AZ
 IvHHlXL59rK/XReAjPBFM5WsaeNQTLBjipE5r2y+3UoE7T1HXl6w7yHPsGdV+Oopywns
 DwOAl7wUH+PBmQ8xH2kWjWz+0RgSfVrQnTgiXgRIgByr07/Nv+b4/81XdMevloCy+qBu
 T1GWjuqXKokwNCQJQTPly2Vf7JUXUE2LAFLLbygECOBVbvVALEWlBimYzw3uGtwJCHuh
 cI7L5KlhUwO6gJA7AeIzuLlq54h1dVtTR8oe8AeAzEamPAwxzuGKztO2SAXzXIQvXAU4 Nw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BE93311D1;
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
Subject: [PATCH 06/56] ASoC: ep93xx: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:28 +0100
Message-ID: <20220519154318.2153729-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: aaN9lDp6C-xpba9GNQAi-nnxBESoUzrq
X-Proofpoint-ORIG-GUID: aaN9lDp6C-xpba9GNQAi-nnxBESoUzrq
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_492288_1A98BDD5 
X-CRM114-Status: GOOD (  13.72  )
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
 sound/soc/cirrus/ep93xx-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 2c8cd843d049c..2c8b1c76b834c 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -246,12 +246,12 @@ static int ep93xx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		/* CPU is provider */
 		clk_cfg |= EP93XX_I2S_CLKCFG_MASTER;
 		break;
 
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* Codec is provider */
 		clk_cfg &= ~EP93XX_I2S_CLKCFG_MASTER;
 		break;
@@ -398,7 +398,7 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.shutdown	= ep93xx_i2s_shutdown,
 	.hw_params	= ep93xx_i2s_hw_params,
 	.set_sysclk	= ep93xx_i2s_set_sysclk,
-	.set_fmt	= ep93xx_i2s_set_dai_fmt,
+	.set_fmt_new	= ep93xx_i2s_set_dai_fmt,
 };
 
 #define EP93XX_I2S_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
