Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A08C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dM7Ecnb0oUaaVXR3iS7r5hFl0H1BmkNgQwpqzhkVQe0=; b=t7rR4StnCVxtzy
	NouKt5lw44DPbmXueG4Iyez1vbpZF+QKYuQ6P2bkgNqJzyVIf3QnYOrcZQPh8Zi8oghXTkwJonol8
	UHI6g0psvpvLgvgTs3HS+vLiSame0iMV3tstttdbOmuM2jogNcYElOr3iFGH3muT/BxkDHYcVN8ox
	R/7434SVquR3qqiFA2KUqGvo9+Xnq0RuoMH8vBTStmQW+wBQG1YxUeA2XK7vdmNMVCsooaAsSIidL
	6UZK0+mLCHTwD3JPjLNsG7rdow0EIBoyN3e8jZZQQjAGo9wJs3pp3ZRL0clU0oA6D0s+HagCZvGW3
	5bANWK/OgDgWi9ytLe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriT1-008Csh-58; Thu, 19 May 2022 15:53:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKD-0083ma-KR; Thu, 19 May 2022 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hmj+dNo3rOiKGjUzlsevHW/nHS/7sRRohQXepmEJ2pw=; b=k0pwBxxmTk5f4fdcNzS8jQIOkc
 Javt8dfZUZAM2UO4yWJgEab+seVqmAmzQL4Vablsgs6EAyiNG4tR5ImmFF6dN7xqpELCU5jRvFmAk
 Z130ryME078Yl0+8XOl4J09imbK3GJSfkOv3aw6/TVvpO8bWCs3F4uWRx+xzU7f4lMomeV9veiOhG
 vjQWXMe1uZb8aelZ+fK3qL3z2lT5hS6/h7lzlJETR0tHIdFylf4qKN6cVKkKOG8WhvEAlQEuRiBRv
 wQn2ijYEoV8Na7GEl6qs3AAO1ua2cRZ4bnO8gIWiOxCxWHcfGotmeotnBxDgarrQX/T8d5FcG9FfM
 PA6Sh2mQ==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJv-0024BH-Ut; Thu, 19 May 2022 15:44:27 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW0012194;
 Thu, 19 May 2022 10:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hmj+dNo3rOiKGjUzlsevHW/nHS/7sRRohQXepmEJ2pw=;
 b=aR4oLplxQeflxJ33VqVpaCxZqWM1xcR3lF5eG4OH3aF8Nsvl+X+mDqK9coo/CPyx3n8u
 wP92T8+trRjhRvCjFZi5jLjuT7WGE/wUml+blcA6pfeAb4hu7IstpOVhlpxW3bTYZd4E
 dKf+vtFlRVPV3fXzFq3mzwz/KM+vQMe8NYIVVcMaryV2JdL7puB3WPBql6DB2RN12a+0
 nVujdBVoO5qjJvD6ZvV17mdw84IukUOUo9C9rzphBYPLcvOmv9uk/u8t8JLExVpEwx4W
 JoxOj5Ez2cWQJh3t6ftes55OzBs+MMOa+glUAfo31X8cwAz6QPN3l8WDhlG0uNeeZdIf rA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 43112476;
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
Subject: [PATCH 13/56] ASoC: mediatek: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:35 +0100
Message-ID: <20220519154318.2153729-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: aPgLAPo5I4mVVPR3iN8V7AYT3qCMgllF
X-Proofpoint-ORIG-GUID: aPgLAPo5I4mVVPR3iN8V7AYT3qCMgllF
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164413_020859_2E2200EE 
X-CRM114-Status: GOOD (  15.03  )
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
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 10 +++++-----
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index c02c10da36004..5f7c9516dfa18 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2172,11 +2172,11 @@ static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		etdm_data->slave_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		etdm_data->slave_mode = false;
 		break;
 	default:
@@ -2346,7 +2346,7 @@ static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.hw_params = mtk_dai_etdm_hw_params,
 	.trigger = mtk_dai_etdm_trigger,
 	.set_sysclk = mtk_dai_etdm_set_sysclk,
-	.set_fmt = mtk_dai_etdm_set_fmt,
+	.set_fmt_new = mtk_dai_etdm_set_fmt,
 	.set_tdm_slot = mtk_dai_etdm_set_tdm_slot,
 };
 
@@ -2356,7 +2356,7 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
-	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.set_fmt_new	= mtk_dai_etdm_set_fmt,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index 12644ded83d59..37a8968ac21dc 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -266,11 +266,11 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		pcmif_priv->slave_mode = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		pcmif_priv->slave_mode = 0;
 		break;
 	default:
@@ -282,7 +282,7 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.prepare	= mtk_dai_pcm_prepare,
-	.set_fmt	= mtk_dai_pcm_set_fmt,
+	.set_fmt_new	= mtk_dai_pcm_set_fmt,
 };
 
 /* dai driver */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
