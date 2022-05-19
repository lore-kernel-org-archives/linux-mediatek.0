Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A49FC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfqwYtULW7+v9P6cWMAUMWMiGCkzNKIcqrj5X4pbD28=; b=Osx6gYjxEVSmrC
	1PDmBrPjyvZeW2442pTY26Jl8IYQzXPuuxWYfVe4bi7b48pKZ/id63y5GlyE6oYD8ektguzFrgKyF
	qom5Ef1TGrBcfupH/5MkpHA+s+TMDHl3/fanZb7UcB1ZeZGEn4QKeuY/um8CVAYFvQXGx7OwQqfSj
	mnOHSTBH04Su0DW8YvYhEmrN5ITKGAoEQ2tDg3aUeSgfWagxQl0niWTboCTRLZamzhvloE6mA4rIg
	K3m24zhZn+QPbJ03qiCZQCcsnpUQXGIUxbjh0sSUAoT9utqRjguSXaF3jWrEH4jomuRMp5uEBs1qs
	kLqKaAujaiifh5YTLyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriPR-0088w5-PJ; Thu, 19 May 2022 15:49:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJx-0083X9-1U; Thu, 19 May 2022 15:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=hpWl9/bUWKRwQHJWsXvwf+TuqinqBEKEX6V0X98Nggc=; b=ZeycYhU8XXCX6gK5JLGfetuCui
 IHsiTcjGl/xHmRWTn9W8uTpaDwA+cjlSFxnxlnet6avXtZuefnX8Dr3RPY5Sef+ikGG4/atOxYi/4
 yxk5Y8binUV+WCeQOSuaMOFOKfaiZKiHh3h6/60ejVNKBqTlqGIa1oeZfmtxhQp+oxapvKxsd5sku
 aZdNNlBiYFoEXjdBv47U5x67GpKseiZ84lwrtD2zmQetRkVTuNDDHv9/+71Hgvu/qsO1TlKAmUiQK
 lH5v4D/Qn5pCj+sXFteAPCFKMqrBEq2VKcypVSW6+BHp+ayV0UX/U3JL24UrZ1/i5jtjODGaAIdno
 6Two9UJA==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQc-SU; Thu, 19 May 2022 15:44:11 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k129002261;
 Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hpWl9/bUWKRwQHJWsXvwf+TuqinqBEKEX6V0X98Nggc=;
 b=Fw/l0bUSgqC4OivzJSIcCexpxxvG2/bHSdr53Q4MovYkon1mdhUDBThA2TV21toEPOyh
 gYsliKEGnUclbAMW3OuorOHUB1zmeDPtmzszmXuD43m1HhJu6GcdRIDWIf0xm2B/GBsF
 V7M2e8odu8slrYcWLG7N0yn6K7b4dFIAScBlMJoR5qeruryRvxSZLbiEVtEYMQK+uwaZ
 +CDWu834y9A8ByuDGJjTIhwPE0seJWPyiRfmuW1BFneIQFxszeA6f2LqoyR6UYFrfodL
 0XCH9NujpiTNRZsj6I9nwStTHAIOFz5rikDqF/i1I8DT5snycJo1UnjoVeY6j2sfaFea 0g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40A3411DB;
 Thu, 19 May 2022 15:43:21 +0000 (UTC)
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
Subject: [PATCH 40/56] ASoC: mediatek: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:02 +0100
Message-ID: <20220519154318.2153729-41-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: NrmIbN4w5_yL228UDyFvtSPeRhWUvcZD
X-Proofpoint-ORIG-GUID: NrmIbN4w5_yL228UDyFvtSPeRhWUvcZD
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_875743_EB981135 
X-CRM114-Status: GOOD (  13.94  )
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

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 ++--
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5f7c9516dfa18..c2e268054773d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2346,7 +2346,7 @@ static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.hw_params = mtk_dai_etdm_hw_params,
 	.trigger = mtk_dai_etdm_trigger,
 	.set_sysclk = mtk_dai_etdm_set_sysclk,
-	.set_fmt_new = mtk_dai_etdm_set_fmt,
+	.set_fmt = mtk_dai_etdm_set_fmt,
 	.set_tdm_slot = mtk_dai_etdm_set_tdm_slot,
 };
 
@@ -2356,7 +2356,7 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
-	.set_fmt_new	= mtk_dai_etdm_set_fmt,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index 37a8968ac21dc..caceb0deb467f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -282,7 +282,7 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.prepare	= mtk_dai_pcm_prepare,
-	.set_fmt_new	= mtk_dai_pcm_set_fmt,
+	.set_fmt	= mtk_dai_pcm_set_fmt,
 };
 
 /* dai driver */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
