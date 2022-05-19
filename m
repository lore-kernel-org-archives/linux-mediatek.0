Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D486C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1VH38KxJjDDIPD9faPEgoaQa9vV5C095Uq2F8GOBkE=; b=SmPuDqRus+f6dl
	B9ISPTyz/YHV44Nj29rRNuvASJPisRcwmL3L0KdpVyAQO8A2bk4um+yZelCjEiIOonRnYUoUo9nH9
	oGZgJommXq4ZLC9HqOOhQyNCn+DN/rLXF1Cmlv61OQndTvnVl4csj5Vz3gv/D3uKWLeP7qxBtGB+1
	Aubd7qVFgTUC7i/FkFQSkJPltqfi5ntgtSt5jGI2TunPjdxo8OPXMil3UUIEh0TBh5GarI3HdfC2m
	wzjpQXrCD03FQV6CNyvM8UJp0c9s9fSLr2Dv7RC1VWrVE7MpLl0dDLwbiAYechsW8I679SuFgm/pU
	xObS6rg4gPX/zYgdTutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriOk-0088GJ-Tz; Thu, 19 May 2022 15:49:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJu-0083V8-PA; Thu, 19 May 2022 15:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=12SYcb+LPlWeAIlnRTxwEljNJZIM/ewy54HOgWYskh4=; b=e9/dshjkbCYi8xrGQ+2WjmRpNh
 VU/0h4UiXlHM8OPJcVEa6jRjVKkktrh8+tdmNuRujIhwEHztU4i0ltMCzJkCq8y0gfL37JURb5Mrx
 +R8IeMtTcGAV9JomdOEaSrtZDENZn5/8KfyKIzzyU9PWuuQ5PQ7Je4NOBERNsR+11t8lVJLOF0b1Q
 GHQb3aCIkWAo1FUWPVLkIaeerCcKOtdXUWRrI54yKyqP0ztpdUzbcQtOpixSF+ke0j59M5n3HVcmg
 V2RAUFAHkxiX1fZAEnSaZduFyVExTw/Or/DgR8Aqy1xkdqclRBoJdJj9cFpE9QXoQxQkvihexhZym
 OquW+KkQ==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQX-L9; Thu, 19 May 2022 15:44:09 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11v002261;
 Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=12SYcb+LPlWeAIlnRTxwEljNJZIM/ewy54HOgWYskh4=;
 b=GnXSynfBzO8n537g+rp7kqP0/0lA9/JpYWRMNa9wbJbvkncces1SvZyk9UeX35jutn12
 uQ4Y2h9Rzef7efsUNa1BcbL80H1vVOrPSHiNkcqYdm+ruVDqLQjRPubT0HCwRyr121wT
 eGxaS3SuQVClqoRpl+x235/sUaYVinSYpdJMogMUZcXzJSGAqgwgCnvbzfg8dAPnh1N4
 JJ5WzMvpF9HZr691IJWzsiB2OsdTWIe1/yMndxjhdiHmZlKc+rlSYW2xHeGc/TsenSxt
 I+v5SiXdgtIzvO101BIz3eJGc05mx5b851MdtWzXKdmdgPjJz3kldB5tA/7s/a/KuxdW Yg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE8D611D3;
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
Subject: [PATCH 35/56] ASoC: fsl: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:57 +0100
Message-ID: <20220519154318.2153729-36-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: XH-DUBRhSyMMMA3SDjeA6SJsnafPjfxH
X-Proofpoint-ORIG-GUID: XH-DUBRhSyMMMA3SDjeA6SJsnafPjfxH
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_484901_BFB0A218 
X-CRM114-Status: GOOD (  14.50  )
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
 sound/soc/fsl/fsl_audmix.c | 2 +-
 sound/soc/fsl/fsl_esai.c   | 2 +-
 sound/soc/fsl/fsl_mqs.c    | 2 +-
 sound/soc/fsl/fsl_sai.c    | 2 +-
 sound/soc/fsl/fsl_ssi.c    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index c580dcb9a4cfe..43857b7a81c94 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -317,7 +317,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 }
 
 static const struct snd_soc_dai_ops fsl_audmix_dai_ops = {
-	.set_fmt_new  = fsl_audmix_dai_set_fmt,
+	.set_fmt  = fsl_audmix_dai_set_fmt,
 	.trigger      = fsl_audmix_dai_trigger,
 };
 
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 572bdaee73eb6..75f7807df29af 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -790,7 +790,7 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.trigger = fsl_esai_trigger,
 	.hw_params = fsl_esai_hw_params,
 	.set_sysclk = fsl_esai_set_dai_sysclk,
-	.set_fmt_new = fsl_esai_set_dai_fmt,
+	.set_fmt = fsl_esai_set_dai_fmt,
 	.set_tdm_slot = fsl_esai_set_dai_tdm_slot,
 };
 
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 371d441b1dbef..fc539a1392509 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -152,7 +152,7 @@ static const struct snd_soc_dai_ops fsl_mqs_dai_ops = {
 	.startup = fsl_mqs_startup,
 	.shutdown = fsl_mqs_shutdown,
 	.hw_params = fsl_mqs_hw_params,
-	.set_fmt_new = fsl_mqs_set_dai_fmt,
+	.set_fmt = fsl_mqs_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver fsl_mqs_dai = {
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 3edd302eb5c22..f67d8527876e7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -704,7 +704,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
 	.set_sysclk	= fsl_sai_set_dai_sysclk,
-	.set_fmt_new	= fsl_sai_set_dai_fmt,
+	.set_fmt	= fsl_sai_set_dai_fmt,
 	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
 	.hw_params	= fsl_sai_hw_params,
 	.hw_free	= fsl_sai_hw_free,
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 32e4cf37c2029..7dd0c48cd9ae4 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1156,7 +1156,7 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 	.shutdown = fsl_ssi_shutdown,
 	.hw_params = fsl_ssi_hw_params,
 	.hw_free = fsl_ssi_hw_free,
-	.set_fmt_new = fsl_ssi_set_dai_fmt,
+	.set_fmt = fsl_ssi_set_dai_fmt,
 	.set_tdm_slot = fsl_ssi_set_dai_tdm_slot,
 	.trigger = fsl_ssi_trigger,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
