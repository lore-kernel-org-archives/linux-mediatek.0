Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQHBRQWSkWtJ2Z/Epnj8ewTIXPWQJIl72XInmdtLbKU=; b=GlCQV6781yZzZi
	AcTC0/LUqNzatQXNqa94KCH7xBqlpuPEpIYvf/9z1JbpWsBONyhxUg4wsF+UYp9sdaZBxyi5E4lTb
	qrF88Bkt2BP/dQyPwQE6md3n8qK+8hi+GVdp2csYMtq62Nymup2LzmnJp7BXKfrJQ/WokS3YHfY9y
	ovUyFG8kZZFOAX5NdHj7jfz2CpU27XOXY/+t2paeT1DrwpHMb+PazKhtUryYAGp83d8vS9BBAL57n
	tL44XygGQjbJSHwvJwcEmMvQLxgGqU47gZgU433wXRHFBae0mrax5T07wgntbOCdjO6KEpAEn5PCF
	mGNpSrwNwVu7zP55HtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriP9-0088de-C0; Thu, 19 May 2022 15:49:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJw-0083WE-CR; Thu, 19 May 2022 15:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=dJVakU7yksxbSOwZMWvkmj026ksj4r2FegCDWfwyCX0=; b=gO9fM9uIDSF5ApfaPbP3tbIzUp
 IRxOfVCOAF0vw2Z56njMgpTprkFEdXHwS5EEw7MQzJIF4Q2nqwW/1vjJgBcixnBEwn5vYZNjiyi0j
 8kVV9ToKP9KdDk9CY8gOocJiuMDIzrV6Qv8zJUgc2bGTFsfIrXc79pjn9P4j8kj1hc7m7DCYONrAV
 dM9zotx5ao81wUKf9ETiejlxVAYezpm8miyCjud4LOVHHqo/lNyksOwiVjeGNmAC80RCYMxK4enC4
 U6dQ2IuY2jyw2qMpQm+zGUEe5PTlX2lYEIXSoafiyfK9Yg8KRsqt/BdE7rtl83q+8LEQiuWV7Fbjp
 dArPsVJA==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQZ-SG; Thu, 19 May 2022 15:44:10 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12E002261;
 Thu, 19 May 2022 10:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=dJVakU7yksxbSOwZMWvkmj026ksj4r2FegCDWfwyCX0=;
 b=grNLpWwzXstZ98oB1CRuq48xZQVYsv7n8CICP4BnX6hRzAch1HedX73LrtGP3F0WZx3M
 wHnlq4BZ3FIa1uq6QeGWvreft3/0+yKcxRaHSVusB6cJkCHG0gDT6ZFzkp9AeG5vgJQB
 RHHB8tjZZmCs5gdlNXrUp/cHqoFxrW22KZlmbREMZZDud3CdYVojT0LdIG7Gp9Cdh+SE
 DUOfyBom+PVy9b9wfFKHwZoPeolHEOCftD1iBUd7UB/C/4BGtjs1Pf+BPNXIdF8BoJOp
 ukPxPrnOUkxUdoMTxjR5LjCDjvauE9RwzmG14oF4hE+7sMcfXvFSvjnbmsTcS4lg2bRu /g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-14
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 96FE611D3;
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
Subject: [PATCH 45/56] ASoC: rockchip: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:07 +0100
Message-ID: <20220519154318.2153729-46-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: KcWX3DDQEZgFWZIe28UVsopYEhv1nv0h
X-Proofpoint-ORIG-GUID: KcWX3DDQEZgFWZIe28UVsopYEhv1nv0h
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_922415_DB680D77 
X-CRM114-Status: GOOD (  14.24  )
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
 sound/soc/rockchip/rockchip_i2s.c     | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a66c7df323dc..47a3971a9ce14 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -486,7 +486,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
 	.hw_params = rockchip_i2s_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_set_sysclk,
-	.set_fmt_new = rockchip_i2s_set_fmt,
+	.set_fmt = rockchip_i2s_set_fmt,
 	.trigger = rockchip_i2s_trigger,
 };
 
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index c90afccdae362..48b3ecfa58b46 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1113,7 +1113,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 	.hw_params = rockchip_i2s_tdm_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
-	.set_fmt_new = rockchip_i2s_tdm_set_fmt,
+	.set_fmt = rockchip_i2s_tdm_set_fmt,
 	.set_tdm_slot = rockchip_dai_tdm_slot,
 	.trigger = rockchip_i2s_tdm_trigger,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
