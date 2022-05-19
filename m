Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64hzB4QcNmd7Z39jyDoRbTFsdi0b74cXck/JrYXyu3o=; b=QalMS7fDsj7L3O
	mAVIL9Zb3Hph6XurlTjcP7heYk6aDm4Osks4eynEjP0bp/xnVE4zdGFNldr1KfMNBBLrh2ICMgnvV
	6qT/IBZ2Yx5rWEmX0GQSmkwy5d/y1FSxEt9/owxLugxi2ylPE496XBfvEqXWqWkvlMKdj0cY7Iq1N
	62iDcWexYnNQRttCuC5FoXVvDKzBjlntaUgEUXe0wNDXngPRJZcx7L3u/88/zEZtxUG4JuCSh4wjW
	RiRnx3OCt4ovFqqPU04kvyMVHsOhdTAOcQuGZ3vScZElsOgFxuTT6UswjiY+1rEYuCyJCLB9dVloy
	2Cym9qrqGjHNQI5RhNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriQy-008Af6-2e; Thu, 19 May 2022 15:51:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriK2-0083cT-Km; Thu, 19 May 2022 15:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=rKhvo9vVRPXr5v+65fMVjwI+21+zpA2rbws3nkqy2h0=; b=cK0waE2+MR5qt7Qy09douxFFSe
 Evt4XspWJuUyTh2y+I8McxupfXvWcK24REslvfQwCi8pt1bCXgaLcVrfl0UzFxtA+1FGBewnCavDY
 QYGKLEA2lSIogx+eHQn4OXIX2EZximCpyekDoyAubzcm9X3b/LfFaOVVmFEORa4gBjCm9yHqx6vmr
 rB5DJ+rco/vpDQV+eGtATHpZDxGCtsNTgE1QSiE1LgAdlzIi+K9L7V2sdXYfMVUTE9l2R6TTBOlKs
 QkD5wKE5n5YJX4A5Zsip7yrEwgzPqlLCC9NQkIa50S0JIxv/rXJBfcLuuiobhIP+eHufNlsJo84Ct
 BEtv8Afg==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024BA-6L; Thu, 19 May 2022 15:44:14 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k123002261;
 Thu, 19 May 2022 10:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rKhvo9vVRPXr5v+65fMVjwI+21+zpA2rbws3nkqy2h0=;
 b=FIPmVU1UtkYwnK9TYlQJGNQFDoL+AZfUKxtGversk32aEoPfyE8NMqt6BqdPIc+eOY7t
 it8QU3i7rBrMVxDVrRmSrpgjvCcZION/Utz9vxrjPdffpRg1WYY/yKLuRejVYE2oJzRT
 cAYLyb1taACrUwYfOaLo0MLehJarjU3nRMDgNqwPtsKw007S6YVWPDRjeAjBW6MMYYvH
 Nl2imN/VXW21uu80awh60ki37cROx8DO9JQLW4js9UkVZwC7D8dKopOSu4doGD1253Ul
 UhXe4mgHVYxAv1mlD46Ge4kqQyNKoty+HxHjK8U36lLFgHR8OnUAefRGJoBYe7XR2mi0 mA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B34CA11DA;
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
Subject: [PATCH 47/56] ASoC: sh: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:09 +0100
Message-ID: <20220519154318.2153729-48-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: JlK0U7KZGaPbGrThUxDZRZ398gBXTG39
X-Proofpoint-ORIG-GUID: JlK0U7KZGaPbGrThUxDZRZ398gBXTG39
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164409_839969_70C4D851 
X-CRM114-Status: GOOD (  14.12  )
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
 sound/soc/sh/fsi.c       | 2 +-
 sound/soc/sh/rcar/core.c | 2 +-
 sound/soc/sh/rz-ssi.c    | 2 +-
 sound/soc/sh/ssi.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 4058d60b7e931..f3edc2e3d9d7c 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1724,7 +1724,7 @@ static const struct snd_soc_dai_ops fsi_dai_ops = {
 	.startup	= fsi_dai_startup,
 	.shutdown	= fsi_dai_shutdown,
 	.trigger	= fsi_dai_trigger,
-	.set_fmt_new	= fsi_dai_set_fmt,
+	.set_fmt	= fsi_dai_set_fmt,
 	.hw_params	= fsi_dai_hw_params,
 	.auto_selectable_formats	= &fsi_dai_formats,
 	.num_auto_selectable_formats	= 1,
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 0ac15b74c58a8..a4180dc5a59ba 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1068,7 +1068,7 @@ static const struct snd_soc_dai_ops rsnd_soc_dai_ops = {
 	.startup	= rsnd_soc_dai_startup,
 	.shutdown	= rsnd_soc_dai_shutdown,
 	.trigger	= rsnd_soc_dai_trigger,
-	.set_fmt_new	= rsnd_soc_dai_set_fmt,
+	.set_fmt	= rsnd_soc_dai_set_fmt,
 	.set_tdm_slot	= rsnd_soc_set_dai_tdm_slot,
 	.prepare	= rsnd_soc_dai_prepare,
 	.auto_selectable_formats	= rsnd_soc_dai_formats,
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 0557d22a089f3..beaf1a8d6da10 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -840,7 +840,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 	.trigger	= rz_ssi_dai_trigger,
-	.set_fmt_new	= rz_ssi_dai_set_fmt,
+	.set_fmt	= rz_ssi_dai_set_fmt,
 	.hw_params	= rz_ssi_dai_hw_params,
 };
 
diff --git a/sound/soc/sh/ssi.c b/sound/soc/sh/ssi.c
index 95571cbeae296..bf7a3c69920a6 100644
--- a/sound/soc/sh/ssi.c
+++ b/sound/soc/sh/ssi.c
@@ -336,7 +336,7 @@ static const struct snd_soc_dai_ops ssi_dai_ops = {
 	.hw_params	= ssi_hw_params,
 	.set_sysclk	= ssi_set_sysclk,
 	.set_clkdiv	= ssi_set_clkdiv,
-	.set_fmt_new	= ssi_set_fmt,
+	.set_fmt	= ssi_set_fmt,
 };
 
 static struct snd_soc_dai_driver sh4_ssi_dai[] = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
