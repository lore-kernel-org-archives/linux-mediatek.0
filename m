Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01214C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0QZU3SvDJVvrBzwXtf3VWNnYGyG6D+I+nz1MTvAvh4=; b=KxghNYd+LbB8YK
	WHE8S1mE0H3I+rT+fYxf+egLNlllNN1gQXMaelYLa4LnayBJw9cr5AXRuPjyjkMv74mevLLhhVEgB
	GRvzRTtOTn1iA9YImbNl+3G520S0790QEV9P3Mgy3IQN8VLSt4W62SYu1BWBpqnSuTx5ASwWhyMpa
	v49tWFcnq9ywS6z0Z2WbUaH77DUeDwTa6xAZoPAVsqwDkr1trv23cg9KuvgNrpxyDFy+GkM67IGzd
	M4QKaMTAVqXB6iDavBcDAzbJmRCCPXBEFhnw6OyL8Uz3VS+EsV4tYANRikKC+8th0tJ4Dr4xbIOG+
	Cn101Q9l6NE2aVVUhYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriUh-008EZQ-Fy; Thu, 19 May 2022 15:55:19 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKT-00842w-W5; Thu, 19 May 2022 15:44:47 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11m002261;
 Thu, 19 May 2022 10:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Yd0cAQSedFMycXCxPoAg0L5aPNoKfkfIW3+XQJ+og9U=;
 b=L0kTv7DqrTasPfqs1qdQbcKeowa4PoXC1JlkAhKCWy1JRwGj7FcBPXdoa+yodMN+rhsC
 lo3xqb04gM+d4DBFIEQZ05vRktl/8EEVOf+2CWD7vZKTTR/Px3CtFnSf6e9qU0aNMG0p
 hd49bPGaOs8KpebqE+5WA2uf8YWT14wifPCmgP7uCfne8Cr/uQl6Nujfm9s7OsuTEpCs
 K02QmwWs7dcHv1qxN+bdZmXmjUrrKnQIK4EVyKENOL6QDKH2Av6G+uRqj40TFu9QUz2I
 xFIapgG0pXvc2wvufmeTWq71S3XbyXh6Ln9kyHnECWusNXVTVygZEnxzmz5iwBQYULxu VQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D112F11D4;
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
Subject: [PATCH 07/56] ASoC: dwc: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:29 +0100
Message-ID: <20220519154318.2153729-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: concj0zx7CiOXvoUGleae8R55AUn_QvF
X-Proofpoint-ORIG-GUID: concj0zx7CiOXvoUGleae8R55AUn_QvF
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_084446_107103_C793B0ED 
X-CRM114-Status: GOOD (  15.43  )
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
 sound/soc/dwc/dwc-i2s.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1edac3e10f345..d3778d2d739d8 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -357,20 +357,20 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		if (dev->capability & DW_I2S_SLAVE)
 			ret = 0;
 		else
 			ret = -EINVAL;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		if (dev->capability & DW_I2S_MASTER)
 			ret = 0;
 		else
 			ret = -EINVAL;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		ret = -EINVAL;
 		break;
 	default:
@@ -387,7 +387,7 @@ static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.hw_params	= dw_i2s_hw_params,
 	.prepare	= dw_i2s_prepare,
 	.trigger	= dw_i2s_trigger,
-	.set_fmt	= dw_i2s_set_fmt,
+	.set_fmt_new	= dw_i2s_set_fmt,
 };
 
 #ifdef CONFIG_PM
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
