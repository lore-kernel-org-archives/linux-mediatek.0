Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A06C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4pvppOl0dQLiQ2GOWEAPZpC1OH9A/pzxiwnqnvFl/k=; b=2bkWWoulhA7LWP
	cchUhYElyno1gGFr2cyH/YSzen7QKt5HyhMME9t46wnySrzliZrrCdgyhoYN/lOLgSyZgeDnGY4pq
	NwpLEkTCY38feGmsmDqjLC46ex4xkrpDT5I89oyupMWAXJ1EIkvLzCs/5wO+u5jL8gUuNG97EqQfU
	Zz0WqmrL0IzV9ZszqdcoT1NxCaNPstQTeRAfHI4GT62F7GfxG55X35NMiKt8OzCn1hLycoAe+q6Bd
	KAJJZFSoQhkqBBGnuv8pRO7ezbxjW6pabm8VFYGuOgnybpB2XfSV4+YLlgppiSdd9amzKEpET6Y5S
	PveEkPCEb8agwhz73wlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSn-008Cd5-C8; Thu, 19 May 2022 15:53:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKD-0083lk-5B; Thu, 19 May 2022 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=VOQ+W/oBZOlr8tN9YP1v240fTtVnO2FxmwdVacMFRIc=; b=JsbPjRUJvm2ijlWBKwSMAqZi1d
 ca02lpY61ucTYaI2W5UIAoxBw7DhJXPnxuCXQbsCM2RJ8X+luLrgPXYEKJ6Ziy/kYKAt3pMWrEiel
 5hctP2kzAD4kBAJTwQEtojQEfgYHZTOtc6uufNfJY+hpKMlLbW5BZDPFEzjyIvnnOzJ3I1/gtR3c7
 A9ke4YHEm3geNpEfRUoC8j+vI3TWZSq0emB2hP2GGinlPpg7X3IewFnswl8q4Xe4p8ey5u5Sapobn
 PLhvuPCr41pg3ZTMzsQWW7efPq6ar/L1m+BBXODaRW183U07/ItNkhhwR77JC6pBI1hVkFSci4Rn7
 mspsY0gQ==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024BK-6K; Thu, 19 May 2022 15:44:24 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11q002261;
 Thu, 19 May 2022 10:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VOQ+W/oBZOlr8tN9YP1v240fTtVnO2FxmwdVacMFRIc=;
 b=Y6JZdFPxyitwRJjr9a6m7L6/DpQEebQmUx9/+TDWC/cDQtgPDs7SW/GjNAwxfYxZqXFS
 NB+oTTLeRcop82GJsL+oh5BiU+uHSDZbeMIzpNJ7qRUgatKKrQ/smur9xw0bXNq6Idbm
 mW6scEKBGXAF9Z5MOTg9iIims+lR/Yn+7Cqc6kqM0GuYIUPSp4xHIqYLJqyU5DazzGFq
 tFAgc7/NglXG9ZepQkNbNVotV4srpV3YnUFXurHeSMLHteb/6oMCmN7TyQz162x2yVLh
 dU14U4pxkZBdE8t7djgleUbsefuLbl/xZhOw4PT/fN2enZnXD9DTZZ2ypAU2LjIIBzzG qQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 565F611D4;
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
Subject: [PATCH 14/56] ASoC: meson: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:36 +0100
Message-ID: <20220519154318.2153729-15-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 9vKTyJR_k71vp336DaV_ccMq6PFsIzii
X-Proofpoint-ORIG-GUID: 9vKTyJR_k71vp336DaV_ccMq6PFsIzii
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164412_956189_FA87D6F3 
X-CRM114-Status: GOOD (  16.37  )
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
 sound/soc/meson/aiu-encoder-i2s.c   |  4 ++--
 sound/soc/meson/axg-tdm-interface.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 67729de41a73e..0ab991230deec 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -229,7 +229,7 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int skew;
 
 	/* Only CPU Master / Codec Slave supported ATM */
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_BP_FP)
 		return -EINVAL;
 
 	if (inv == SND_SOC_DAIFMT_NB_IF ||
@@ -323,7 +323,7 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
 	.hw_params	= aiu_encoder_i2s_hw_params,
 	.hw_free	= aiu_encoder_i2s_hw_free,
-	.set_fmt	= aiu_encoder_i2s_set_fmt,
+	.set_fmt_new	= aiu_encoder_i2s_set_fmt,
 	.set_sysclk	= aiu_encoder_i2s_set_sysclk,
 	.startup	= aiu_encoder_i2s_startup,
 	.shutdown	= aiu_encoder_i2s_shutdown,
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index e076ced300257..ffdb12d0e01e3 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -119,19 +119,19 @@ static int axg_tdm_iface_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		if (!iface->mclk) {
 			dev_err(dai->dev, "cpu clock master: mclk missing\n");
 			return -ENODEV;
 		}
 		break;
 
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
 
-	case SND_SOC_DAIFMT_CBS_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BP_FC:
+	case SND_SOC_DAIFMT_BC_FP:
 		dev_err(dai->dev, "only CBS_CFS and CBM_CFM are supported\n");
 		fallthrough;
 	default:
@@ -326,8 +326,8 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	if ((iface->fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
-	    SND_SOC_DAIFMT_CBS_CFS) {
+	if ((iface->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+	    SND_SOC_DAIFMT_BP_FP) {
 		ret = axg_tdm_iface_set_sclk(dai, params);
 		if (ret)
 			return ret;
@@ -394,7 +394,7 @@ static int axg_tdm_iface_probe_dai(struct snd_soc_dai *dai)
 
 static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_sysclk	= axg_tdm_iface_set_sysclk,
-	.set_fmt	= axg_tdm_iface_set_fmt,
+	.set_fmt_new	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
 	.prepare	= axg_tdm_iface_prepare,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
