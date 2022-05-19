Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MCYmYk2YNsxd98SKCSuN9LSxyDoJRPSUSyhFjEOMeY=; b=Mynw8LUukc7rtS
	ZRcg9JHUrqgjsHwrCL7bC0FfX1WhjQFi4t1I2YsQJ26+jRnVtV73eNx3j2ScOk7o83HJRllpL8PrS
	42IcwL65ccFI91078C316psPf+G2oxe0v7JZZhsQq+fHXvmLKcVQYYjKen5+p1u0EuHCj45Mbsw15
	zA6/iz1QYb07OdTmlxV/tKqWyJ/rP32j8oEjJxt4og2soZio88XAgJJX1qnF3t09MtS1kvywNaa99
	oKh9VOhJ9r7N+qowlzz4SVzDRiVsHx/tl/2l6LcW8QV25bholnmMx1s3/TfVJB0410djWbBj5NznZ
	tekmPO1+4EoWkyllYmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSh-008CX0-5M; Thu, 19 May 2022 15:53:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKC-0083lL-KN; Thu, 19 May 2022 15:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=zovcG00Qw1epnEygXfoI+fXk8bpqiR5gNT0dl14iD4Y=; b=Ro95Tn6PLlNdne913ofB800bPr
 c4/PWITlRwkT0V+szHW6bOKc3zjOzSbEKv1y/0URYJVUvrCA3JInkLGjyNkGQFATT51qTYpkxbZlZ
 MqdNSfoF8gnDJaIiugsgnn0aJ7A9w1ZqJHjeifWIYKr81p53MbfegyzaTfeLqRdZEvzYoDsLAe1ek
 XeusnhLdlYMDM8RwPGhpIxVbrtbm88nJ4z6Gb8hEqTGm2IfobNOMs2g+5TX/tttKG2BeaV5d/FOEd
 djWYIxqu1OsTWB6BGKHnauDFdVv/sCtJZZA/xviMgCgRRMz/nHBpM1A89hcWLRr8UehWdHFw/TJw4
 aYkMKo0g==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024B4-6v; Thu, 19 May 2022 15:44:24 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW1012194;
 Thu, 19 May 2022 10:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zovcG00Qw1epnEygXfoI+fXk8bpqiR5gNT0dl14iD4Y=;
 b=lWc/v8rbG6DU3/oen1cs99BZePFwWmNoSiUWQBhylY48FwvXVumaQtWAySXEUo/z6McS
 /n19a4Tn3t4SUfM5OhrzHXKcibSXa7p9DDnH2u9Se/Isfe/g2s+mK76dJc6G5Vf5e6iS
 zF629G9KrsUm46guTqiSNvL6wa5uR5omvc4xNLdwyC3NFY5daFs52w0/yP9oA7HZiBtc
 D49Q6eP0VNpzEg/inh1XB5k9w6wq+/x7e+f64q7vaLP8T1b9P1li8VRLv4mWKMcNZ2Jo
 /zDNcy1p0llemEEQ76/yGfJx3sHNbeZ4Mww6EIMds3wJTVA5TR18Q4gAx0fvAp86DpWN CQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A5A56475;
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
Subject: [PATCH 18/56] ASoC: rockchip: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:40 +0100
Message-ID: <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 0Qtm8D2_cnb-mytSm_FVWYGxhUPRu7so
X-Proofpoint-ORIG-GUID: 0Qtm8D2_cnb-mytSm_FVWYGxhUPRu7so
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164409_938527_DC8A41E6 
X-CRM114-Status: GOOD (  14.93  )
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
 sound/soc/rockchip/rockchip_i2s.c     | 8 ++++----
 sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 4ce5d25793875..0a66c7df323dc 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -199,13 +199,13 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 
 	pm_runtime_get_sync(cpu_dai->dev);
 	mask = I2S_CKR_MSS_MASK;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* Set source clock in Master mode */
 		val = I2S_CKR_MSS_MASTER;
 		i2s->is_master_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		val = I2S_CKR_MSS_SLAVE;
 		i2s->is_master_mode = false;
 		break;
@@ -486,7 +486,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
 	.hw_params = rockchip_i2s_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_set_sysclk,
-	.set_fmt = rockchip_i2s_set_fmt,
+	.set_fmt_new = rockchip_i2s_set_fmt,
 	.trigger = rockchip_i2s_trigger,
 };
 
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 98700e75b82a1..c90afccdae362 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -411,12 +411,12 @@ static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
 	}
 
 	mask = I2S_CKR_MSS_MASK;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val = I2S_CKR_MSS_MASTER;
 		i2s_tdm->is_master_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		val = I2S_CKR_MSS_SLAVE;
 		i2s_tdm->is_master_mode = false;
 		break;
@@ -1113,7 +1113,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 	.hw_params = rockchip_i2s_tdm_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
-	.set_fmt = rockchip_i2s_tdm_set_fmt,
+	.set_fmt_new = rockchip_i2s_tdm_set_fmt,
 	.set_tdm_slot = rockchip_dai_tdm_slot,
 	.trigger = rockchip_i2s_tdm_trigger,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
