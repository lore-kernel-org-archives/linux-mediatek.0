Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9285C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sO8wJqAxAgXYhu891UR3ABrdnddU77XAZngDn0N3aa4=; b=yhFzydMmKakjSm
	fBn3TM0+GJpxOnfI0zdSIATvwFj+6znqypgT8J7yfQBCMByGd+iiGPwv0uOW4xRm2uU7dd4F01KnF
	8PLu9tfv/hysUYPUVwNTcf1eRB03YjeZ0neCg3RI0ppibHpzqxITL6NDcvBe0Y8AACeqIGQLS382y
	I2F7QH5JUW0fMKyw3sm0qZ5m5M0N8ww3i4ryB4Y8FhT8BM4Py7YzeCzsvVdoibrTjb+urzPyr7Rri
	HsL/b8Zg9BOef4wid2CobZlDWTNWEd70Qzeat+fgaih0jHCFBOkpvY5JnaQ5s7idQ6+sSD7IPrO4p
	8uzKVqrc5XxVLXcW2Xaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriMl-0086Dx-8R; Thu, 19 May 2022 15:47:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJq-0083Pw-7u; Thu, 19 May 2022 15:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/Z3NisKONRDDwqsbgNrvbzNcgTdEM5sI3xBhMGMGjc8=; b=exhf7C3nbvcw/9GXJcGqKkDGJA
 pWkEGtgEtGIDo19xgworXi/tGVahQRMOenZSpWU0u3oxNtLTO28iMZSAO61x1DQ4COMR1innEW69a
 GeoE0jfFmqaiTM5O2alBs+N02E3IeL1I3CqIy6RcGxwb18pDtaKBuAiniMo7RBo6k0Ebd9AeNK3iK
 zugOXmfHjj7da4VRXlQwf3yZxGrHv/ArP2/qaivBnmxybAIKDR4/tyoJwCCEhARd3VX2KYxe9R4pQ
 uSriJMDK/OYk7U6r3g2/k8aXFAZlW1h6w55ySvK1AGfFuEmGl6xWwKjza/dUbfwlOTAXM1zqtyXxj
 3PXW6/Lw==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQo-LG; Thu, 19 May 2022 15:44:04 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mWD012194;
 Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/Z3NisKONRDDwqsbgNrvbzNcgTdEM5sI3xBhMGMGjc8=;
 b=DCbl4a8NYS32iFOfURAGbmg1mgJ5vW3GgEgD7SJ20cso0BKNajDZt/iiQ49vySgD40lS
 BTcMduqUoaiD/uu4v1u122MnmLX+qgu3rjJtV4DVyNeySDkY14dWw2tQwpWjXW9EXEuD
 URB1mFLwfF+j+zmlYl+RL8XPyJW4jHCG22C9xwYrzb/n/0nmS2XkYxthKmZXTPcqty6f
 PP6XojfJ+z7yzAI/NOPDZn4XWu3exFsMS64YNyBSGrv3F4KoW8J3eDUi1Y0gsTAhqnPM
 J4175Z3xJCuUCkUruFwLi/9m1/IfZ2+gKZh1/m/55WDLRhaqwlYdf3YmBiXgQ2TWnX00 Ig== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 021C311D1;
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
Subject: [PATCH 51/56] ASoC: test-component: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:13 +0100
Message-ID: <20220519154318.2153729-52-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: mF-rk-cpVUBWDbr5fNugLebouucnJEVa
X-Proofpoint-ORIG-GUID: mF-rk-cpVUBWDbr5fNugLebouucnJEVa
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164402_995937_C2D5A576 
X-CRM114-Status: GOOD (  14.43  )
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
 sound/soc/generic/test-component.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 3a992a6eba9bb..d28712fabe3f6 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -210,7 +210,7 @@ static u64 test_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
 
 static const struct snd_soc_dai_ops test_ops = {
-	.set_fmt_new		= test_dai_set_fmt,
+	.set_fmt		= test_dai_set_fmt,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
 	.auto_selectable_formats	= &test_dai_formats,
@@ -221,7 +221,7 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.set_sysclk		= test_dai_set_sysclk,
 	.set_pll		= test_dai_set_pll,
 	.set_clkdiv		= test_dai_set_clkdiv,
-	.set_fmt_new		= test_dai_set_fmt,
+	.set_fmt		= test_dai_set_fmt,
 	.mute_stream		= test_dai_mute_stream,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
