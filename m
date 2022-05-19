Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D08DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GesXvpoal7QYZeU+1MbHnwRSc4IaGK7uoUaVTuxAfuo=; b=V56jkoPkt1bgaa
	TtyB6G6qT0WkywFU4GFDE4A21ee2FAJpv/LCQ+DorPfvSy1Kdz9BkCTzRse7b9rXrENZfqMUCUpdm
	GbKTRlHgHkIrrCeEzKCBMeWlb5EyaLXJ54EWtFVf0DuSqH8B0B+TGTtv7Nh/0ETX/Y8lCfV/Vo8Xx
	fsJxqj4D7QokZQ6cAdzseh6n8/14KI9Z8NGi38KLE1HwaFJQ6dZdMHAb5kAy+DQ8Eh4e5Ry437XK3
	3GaRj+NVjThpRT/KTbi4AtuFYrGZuDMFPJROtJP87gdg0sVRJes1CL3avhuewSs+j0Bad8S1kJDyL
	qEa/hW2+N3jyyBGqDwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriTG-008D7c-Pg; Thu, 19 May 2022 15:53:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKC-0083lc-T1; Thu, 19 May 2022 15:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=6mTjIZUWoZpEGVJmhxV/vdP+YUiKF5Itks5Sv+ThYC8=; b=V5HzIGiGuU79KS/X9Lw5SNyna4
 G5ReA3q4DAhDcsWQSl9lNNN84W5J0UIoQ9Hy8ooHICA0AvIEk8uzn5mP1Ek0iamL6PW//WROGEWIf
 CPetuSRrlGtpLTdwErwZW4pSzPEIM2mMUK9c4HAInRZB9j6QzgX3Y6QrnmGTGqeOzRNhaedB2dwuP
 WGUxbNkWqZNhvoMyuxyk+4KarWarjuN+zFAt4+y+N4OyrgZu556U5D2x7lRY4YzudllA6LA5Geohc
 8bBxHkR53Tn2TdRXng5HlHpVVKlaAs4yTTBBMkr3fjdJcqTT8r20vmuolxHoAIcNokZq+HgZJI6Cv
 5qvX0ViA==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024BO-6U; Thu, 19 May 2022 15:44:26 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12D002261;
 Thu, 19 May 2022 10:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=6mTjIZUWoZpEGVJmhxV/vdP+YUiKF5Itks5Sv+ThYC8=;
 b=ba3Ptcr5qGrujJvnAPfZEW8yVCxSexAxWM6s8hEBk4yu3Tmrk6ZQ4O6BhhCQPsWIfmk3
 sTUPe9dxSB52g3vN/tYDc0xmBYaf9mqg2UqYsDLD141PdOG0MFIVAAGTizwkI1SfOd9O
 IInIndLbRmzLhbrFEy3W0on6O0OLRB/H6eZu7Fr4tN2oMi+invX1dxegpFDRnSGUPGIl
 FzzagUXfKN8eyhC2jSj+KtkgwOJMVdmtTYojqGLr2xiaed0mDaGXMyMSUI4ZKQ86JYuP
 A6Ow1vPRpOcJ/r5iddaf4e5Dn+NeQCQGQv2Q7Ar+LjdmOw8HHT/pDQAinV9ZX1oBw2fa Ew== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8D77A11D1;
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
Subject: [PATCH 44/56] ASoC: qcom: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:06 +0100
Message-ID: <20220519154318.2153729-45-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: zRllUCbOAc3RO7F-jelcP60LQStRuNv3
X-Proofpoint-ORIG-GUID: zRllUCbOAc3RO7F-jelcP60LQStRuNv3
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164413_163177_349363FC 
X-CRM114-Status: GOOD (  14.62  )
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
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 2 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 8f8794cffc1c5..8bb7452b8f18c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -648,7 +648,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6afe_dai_prepare,
 	.hw_params	= q6i2s_hw_params,
-	.set_fmt_new	= q6i2s_set_fmt,
+	.set_fmt	= q6i2s_set_fmt,
 	.shutdown	= q6afe_dai_shutdown,
 	.set_sysclk	= q6afe_mi2s_set_sysclk,
 };
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 82ee52051f831..ce9e5646d8f3a 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -207,7 +207,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
-	.set_fmt_new	= q6i2s_set_fmt,
+	.set_fmt	= q6i2s_set_fmt,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
