Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dsir84sfQivZVbxBJUb3yWoCZa4Cdlch+aXPVKOp1c=; b=N99XWREWkn7Vng
	dTvSvS3ss2jrFiq5uJm0UKwLDecnGSMzVWv8jWgKID1XfFEEqIxvrs9gPV4mONQ5R8XPRacVHcma3
	AaRSTp3yYHDljO6Kf8u8WReLZbjgq7euA8oY1JpvusJ0+yC4k7gAeIKqOS57JEDA++bmuoVpXdB8Y
	ylWCWdxm4NvkeQC839hQIXVadfzN2veXxDSHz396/bV0M3lnRrvDH2dC5JDY+F74VTKYh2Ygz4aDJ
	Anncv5mk/fo+eAMDxqtQEFBYd5AmHynawcNG9BrNh35EQVp0gH2HXbtriuIUdPLD2tFP07cIsNndu
	L5rZomk8PnPV1qLJmUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSE-008C6T-Mt; Thu, 19 May 2022 15:52:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKB-0083kV-VP; Thu, 19 May 2022 15:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=mf5FHHerF3DUqgYTHLMJsQ0EHrziLRYgyWq7mnqhQOs=; b=DBMWc0eLgn8U4NGLkS869EC5Mt
 LVvaZK8AdR7zJb01RwYo6sBTlR+tL0yMuEcIAJe5Md9PZsQ+AvZZD81I79dFGYhwjsl85bCzpwJt6
 XB6NudVf3ZqhZ6oHSpkGmgdNgOqmEL4pGSX7LVEoFtIcQ7eBlO4Bxhy3NGgV45+IbG2whB01vcDsO
 JfIjEPGpPWIlB2IkpRyMMfzNAxrpbOffWQma3A8gVhBIKazKDEsMENkHn1cl+HTLahAftogU4gHWC
 HnPkiAMTOL5wh+jIvwAFTAS1exk/rbsVY1Vs+lJV1lslgMZSyEgd0eD3FS42w174pUnxA6htgubQt
 V9yJci0g==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024BB-6N; Thu, 19 May 2022 15:44:15 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k128002261;
 Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=mf5FHHerF3DUqgYTHLMJsQ0EHrziLRYgyWq7mnqhQOs=;
 b=MYCjfF4dQqDf5OY1sallBqlDEwLNTb3rh0mc/syzRUhykJ004t/VLv7K6Us09N2J3w3J
 vJrlaPI91KXMWGcoe4xviZcGk8Bmf00TERaweWHrwLFDN5n1upDH8b3SbsDbxTuDSE/1
 NeJwJeEx6GZU0VQXdcJcPMpDxfNZDOq5DkYxaoo44biWU7C3eslBPhP04txtB97+WlS+
 zSQ8ntAjRTRmn5V4y3C7p4LECxgsUG4TcboSfMsexE3rN+jJtkSDQp23/PwMRgZCyM5g
 IsiHVOmwFNMPq4kVZLtSszW0/35Mm2y8GJAYpYJHiqOR9UJIYag0jhpYsfdsvkY8I9YP dg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E2F2D11DA;
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
Subject: [PATCH 50/56] ASoC: tegra: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:12 +0100
Message-ID: <20220519154318.2153729-51-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: EN4tAeWR4PdDquQrBYDDCrJEmnHOC3Vw
X-Proofpoint-ORIG-GUID: EN4tAeWR4PdDquQrBYDDCrJEmnHOC3Vw
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164409_853291_6356B73F 
X-CRM114-Status: GOOD (  13.99  )
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
 sound/soc/tegra/tegra20_i2s.c  | 2 +-
 sound/soc/tegra/tegra210_i2s.c | 2 +-
 sound/soc/tegra/tegra30_i2s.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 9abb0e3536d82..2e1a726602f02 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -311,7 +311,7 @@ static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
-	.set_fmt_new	= tegra20_i2s_set_fmt,
+	.set_fmt	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
 	.startup	= tegra20_i2s_startup,
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index a304948ee3935..a28945895466b 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -678,7 +678,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra210_i2s_dai_ops = {
-	.set_fmt_new	= tegra210_i2s_set_fmt,
+	.set_fmt	= tegra210_i2s_set_fmt,
 	.hw_params	= tegra210_i2s_hw_params,
 	.set_bclk_ratio	= tegra210_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= tegra210_i2s_set_tdm_slot,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index a4ea5221de6b4..3aa157c82ae23 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -304,7 +304,7 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
-	.set_fmt_new	= tegra30_i2s_set_fmt,
+	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
 	.set_tdm_slot	= tegra30_i2s_set_tdm,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
