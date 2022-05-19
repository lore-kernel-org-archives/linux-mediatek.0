Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0147C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaKYUPuGZrG0KsUc1yvd98D9aLTOFEP659TrW2lQOOs=; b=QEEq/ezyeCnr1w
	F0mk2703Kmol9wpB3Axl3KE2s5AIHctFztwA3UykUHQRF3tCudrs82SRFmuwKhLg4z+Y/jMSs6cc+
	1CoVB/v3VR5fvSZ7vOFF0GktJWmrwtUhPmBGekNZHz8KXjBpDFY6bjFRpWjxHvff2qb7I48rxNYJR
	Fap74lrmTPvumnY620F/yCqj1tZd7Nyw150xpYP6gxW5r7UTkQrCIG6cc2Pofo4B3ITAGecWZAFIT
	d90dX73q1VW3FhP57Jaw7t8udTzjjG81quwuKv9w0xBijfKt1dBXifY2HloX/knLmPsbTEMfOkzVL
	QCmRl1LbQ0K2imA7KQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriP4-0088Z4-JW; Thu, 19 May 2022 15:49:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJv-0083VZ-FZ; Thu, 19 May 2022 15:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=EFnNgt7/7giPP2jV0IxJGdO+cwpC/UCvGH22Ixq6LJ0=; b=L4QsDtMSZqOZXhYUgX/EAGN+WW
 wvpMhb1EKAYtyaBI/eXKc0QYq+E9PJNmhiXEGCQdkwKz1QpEia9gIXZLuAgBLpr82JZA1x8KFWK4K
 jUaWIE1RKd7w9WlsdmWSpwAh3IaeJpSJp2ACHD0NMJ4pcu65bATY4PoOIL6ITIiLRtpKS7y7FkPjh
 PbK1zWaHeSRCJrrTh+hvy2HzSXwrmUp5yaUmCZNzo37AHshfYzJL/xMA+6qHY0MuGcmpDOtmo3pTS
 q9cirNHsxWTC4RAY/LB7C2BbYdLW0xl+DGARwyAmUmpsHorxhrQLqqd1f3HAdf0YH91s0drt8h+4O
 sAYCKEKA==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQh-LD; Thu, 19 May 2022 15:44:10 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11n002261;
 Thu, 19 May 2022 10:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EFnNgt7/7giPP2jV0IxJGdO+cwpC/UCvGH22Ixq6LJ0=;
 b=SIDAM7mSdTYMR3Lv9VJnIH0BPG7nxSAI7XG4kOMNORk1ADlDk/QUr7tTYHADTrnh0V0n
 u+zsbt+fA3KpuReMIIwibdPDwWzciuFqbVt1CnqMDjLLHtBHHtGlYfCeVQxK0pQRgnll
 GtbMRIv0GdoN/dQsYypkYhz/uO8mxdz9RuF+WPuDbcks9GOYuDCmL4f3R6D2Uy++zZbW
 31WJQGLqA4L2X4ObdL5+Nhe0YqUPPOWOIUNGGyEsAMhyVTdGM4XaY3wpBuD2zHhAxkDs
 /qTz8SHZs2V8MWBmBbYVzzWC4RI0OZyYRxWODUFEZaTX4CTsIUt4ATBCWiMKZnOWSPBg NQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 77174475;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
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
Subject: [PATCH 02/56] ASoC: amd: vangogh: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:24 +0100
Message-ID: <20220519154318.2153729-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: hCl7MaxdtCsNpycjzTZUKonUahffHwoq
X-Proofpoint-ORIG-GUID: hCl7MaxdtCsNpycjzTZUKonUahffHwoq
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_796171_43984C97 
X-CRM114-Status: GOOD (  13.60  )
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
provider or consumer update this CPU side driver to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 59a98f89a669a..40fbd0bc77fde 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -37,10 +37,10 @@ static int acp5x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	}
 	mode = fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 	switch (mode) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		adata->master_mode = I2S_MASTER_MODE_ENABLE;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		adata->master_mode = I2S_MASTER_MODE_DISABLE;
 		break;
 	}
@@ -339,7 +339,7 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 	.hw_params = acp5x_i2s_hwparams,
 	.trigger = acp5x_i2s_trigger,
-	.set_fmt = acp5x_i2s_set_fmt,
+	.set_fmt_new = acp5x_i2s_set_fmt,
 	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
 };
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
