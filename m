Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACB7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRVB3frdY+MJ5A6pd+mcnJAPMXjntbJSPR1r//JBDSA=; b=EzA0/6KvCS0JJ6
	E6Z8SFMIOj4ru1MRyX2F2OEcoISsj07TvwuR86gAPr3iF1rUBeEfjUid2pjifJ9SrZrdHHHytbFLU
	Chsy3/QV9e+hqHiFYX9/R3JcCVUYAslaqm0q37l0W3teHlFTbh/64dwNF4CMYs4o0TesjDh4W5W8L
	ARih4J+cus+plE7s1gxjMeZwH7p9bV0ZG6L+vVfH0ktfPUjoXjwVoumVT0qZ3sbgJ0jQR9I1f/gZg
	Y4uzRPwIW6MRe1LkwB3yG/KJeY6OK2mbfYepSIECuVAsluj02o3hXYwZzk6Q3HHw3102sw3BXZV1A
	jr/zAEq58ncy/CjGG7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriPE-0088iV-26; Thu, 19 May 2022 15:49:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJy-0083YT-Bw; Thu, 19 May 2022 15:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=M2IDrEb5l2+llrK3AWp4NytfJMdMlvgjjqfAQyTGOFY=; b=ECxTk2/XcvqCb5hepk7upZhn5C
 6r76Cr43FHZYWS38ZklFODDIJ2tNxLKQmo8jQvTJ3wUBvcKY4OdbDD7rS+q/D9CI9F0Zn1FW4aOUf
 tV4GByWwWhauGVKz4/nbc9Ws8JqZMkjhOSwn+pLtJBF9AIBVBak0SUcfoYsL/RfAmaMlbYS77DVvF
 h5hSvXWiVzre5rjVs7SMuEIUEmh4mglEX9FweUR7YishoEEqFzY/u4ppkoVODN6gHqUDYH/9ONs7X
 FIDPlZIhAenAI4CljqbhTNDSt9Ne/0mwg7nnyq0CXbaKqhuEMTKn8uTkzKmRlxTTmcxiDvrezqQfX
 uj91z/PQ==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQj-SD; Thu, 19 May 2022 15:44:13 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11w002261;
 Thu, 19 May 2022 10:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=M2IDrEb5l2+llrK3AWp4NytfJMdMlvgjjqfAQyTGOFY=;
 b=Hvf/VWWuJTxL/QeMVXtUWD9CdqbYQldrSJlKQnKSCLiMvKOM4CQOLMTKR5TkUxS18vej
 3gK7LDtO28l91Fa4owOa/Xh2fxF1/3OqFCrjS9vQVeej0K+ACQudoK6BWiPWSdDZTBUF
 V2X73VOv26SQiGDJKeuSxP4JXBJgvlD/0GXIgGQ3x/3h4Tj0Y1IkX4oJSxkzRLiZeSwQ
 rGl5AoHf1kBBSpyRO2PrSKmaCeG1SQvrO1bZnCt6Bxz2Pmd//glzWxbYUhgCcCB+ECKJ
 s3oqpa3VEQPF2AP0GfIYaaxfciBzN4CEoOcQdk7bHcq7Kb6Xe3oMKJpa8HmdZmmp0YUd Jg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6425711D1;
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
Subject: [PATCH 28/56] ASoC: core: Always send the CPU DAI a direct clock
 specifier
Date: Thu, 19 May 2022 16:42:50 +0100
Message-ID: <20220519154318.2153729-29-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
X-Proofpoint-ORIG-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164404_839739_6339ED43 
X-CRM114-Status: GOOD (  16.05  )
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

All CPU drivers are now updated to accept a direct indication of
whether they are clock provider or consumer, rather than being told
if the CODEC is clock provider. As such update the core to always
pass this direct indication rather than only if the new set_fmt_new
callback is defined. Note this makes no difference to the CODEC
side of the DAI link as it was already being directly told if it
was clock provider under the old system.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 90f4265bea501..227540851dedf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1214,7 +1214,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	unsigned int inv_dai_fmt;
 	unsigned int i;
 	int ret;
 
@@ -1227,19 +1226,11 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 	}
 
-	/*
-	 * Flip the polarity for the "CPU" end of a CODEC<->CODEC link
-	 */
-	inv_dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
+	/* Flip the polarity for the "CPU" end of link */
+	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		unsigned int fmt = dai_fmt;
-
-		if (cpu_dai->driver->ops->set_fmt_new ||
-		    snd_soc_component_is_codec(cpu_dai->component))
-			fmt = inv_dai_fmt;
-
-		ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
