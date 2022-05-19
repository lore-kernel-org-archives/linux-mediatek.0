Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAEBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9JYVofMGIVhVzwBuwHLjCxNVaNcgFa60o9Qi1KOo5E=; b=vg7Rs07nv+4/GY
	W5DvrQQ12GVpqe1lR6UeRBGwIT+oXO0p1A04AhZbKb8We4PC3LffBIHVa9PomryP+1cl1VC2i0ZtY
	L5PB3rDhEpHL7LpSpfmMcDFr6Kc5rvHTsLH/L5pMZt+JgdUZvUw6RZPhMBk4sskH4lqik0yP/jOo4
	62INfwlNMDWuUId8j4SryqiLsFmTIxqwYFCEsfSRyu7yAXBzzzDoXfNGizpQl9L2XEbHdDbKJQzKj
	9bFuBGNYQTeI29a9ilEtiu5qcza3eQyunSYiNqcH2HaSH1jBCRgp/qKWmsLQ/Z6R6Fh8mFRC7iQbM
	aey85MQUEoJQvZvW865Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriOS-0087y1-61; Thu, 19 May 2022 15:48:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0083Sl-JT; Thu, 19 May 2022 15:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=oil1ZKHs2gIMho1AoeBK9FgMU7gcVZ4wK4kjgOzdSgU=; b=CWw+yFk2DI6dGc6fyzwqmZ/1BX
 WJWWo4bcDIQgzaDE1XRZllbqLflX6mFE7usbuVHN6f1iVt2d7bCKngY91irPCyfP8pmcFl9Zta7lR
 9k9cWGaq2mWsjEuY25HTzQuAbX4oBrhFqZTQOdargl/DKt2ZspmlRiic7Z2tidAwAKxHdzkNILc2k
 g4GfCS/0j6XQAgsC9OcoD6pJ1JExwiK5nHQydzXAIEi0Faic+mFL+tKssyay7s6LxDELbpWzo2QI0
 2XdPBO8eKdhvAwfqM9tsUmUmtWdWuZFqQn5bXOy4ceOtjRL00v+ZJUaDsoXeKJGUKiIyKOPKvotOT
 Hvyscnig==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQi-LJ; Thu, 19 May 2022 15:44:07 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mWF012194;
 Thu, 19 May 2022 10:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oil1ZKHs2gIMho1AoeBK9FgMU7gcVZ4wK4kjgOzdSgU=;
 b=VQjZoP93a0c8d+W/ugsjRxH9Fh1c1s3oEgc2mW54Kkr56QBRJ88v6LW8A8/rSjGStAsO
 Nf1wuE4VqmHUd+/RjkSpFuiZ0cMmWa3CdoAK0RCYsILdmBymnKNchfv1FYGaApL7R4fj
 kPxLk4H6KmvxU/TsS1AKvB1RzEZDzrpsOhNLC+OtRHWFmJnim4Yl0ypQBX2NYM2tFmwh
 SlabDEdIZwWaFx6REBIak6ICHrHTatIr57nUQyEjgxgcyiy0INoclm90w5blGBoZOg/a
 io4sDZ82+vQyPAxpgqierRNnmO+F8kkxvNZAAIKN0iQyMoEssAq1im2hGfWe9JzGdOXB PQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6025911DA;
 Thu, 19 May 2022 15:43:22 +0000 (UTC)
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
Subject: [PATCH 56/56] ASoC: simple-card-utils: Move
 snd_soc_component_is_codec to be local
Date: Thu, 19 May 2022 16:43:18 +0100
Message-ID: <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: g2VJ5uiOojlv2ZUJ1ZRM-SzjnwXJaEpV
X-Proofpoint-ORIG-GUID: g2VJ5uiOojlv2ZUJ1ZRM-SzjnwXJaEpV
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164402_998372_BFC2FA33 
X-CRM114-Status: GOOD (  21.52  )
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

The helper function snd_soc_component_is_codec is based off the
presence of the non_legacy_dai_naming flag. This isn't super robust
as CPU side components may also specify this flag, and indeed the
kernel already contains a couple that do. After componentisation there
isn't really a totally robust solution to identifying what is a CODEC
driver, without introducing a flag specifically for that purpose, and
really the desirable direction to move in is that the distinction
doesn't matter.

This patch does two things to try to mitigate these problems. Firstly,
now that all the other users of the helper function have been removed,
it makes the helper function local to the driver rather, than being
part of the core. This should help to discourage any new code from
being created that depends on the CODEC driver distinction. Secondly,
it updates the helper function itself to use the endianness flag
rather than the non_legacy_dai_naming flag. The endianness flag is
definitely invalid on a CPU side component, so it a more reliable
indicator that the device is definitely a CODEC. The vast majority of
buses require the CODEC to set the endianness flag, so the number of
corner cases should be fairly minimal. It is worth noting that CODECs
sending audio over SPI, or built into the CPU CODECs are potential
corner cases, however the hope is that in most cases those types of
devices do not consitute a simple audio card.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h         | 5 -----
 sound/soc/generic/simple-card-utils.c | 7 ++++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5a764c3099d3e..5c4cfa70b018c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -348,11 +348,6 @@ static inline int snd_soc_component_cache_sync(
 	return regcache_sync(component->regmap);
 }
 
-static inline int snd_soc_component_is_codec(struct snd_soc_component *component)
-{
-	return component->driver->non_legacy_dai_naming;
-}
-
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 539d7f081bd79..50a9827089335 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -513,6 +513,11 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
+{
+	return component->driver->endianness;
+}
+
 static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
 					    struct simple_dai_props *dai_props)
 {
@@ -524,7 +529,7 @@ static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
 
 	/* Only Codecs */
 	for_each_rtd_components(rtd, i, component) {
-		if (!snd_soc_component_is_codec(component))
+		if (!asoc_simple_component_is_codec(component))
 			return 0;
 	}
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
