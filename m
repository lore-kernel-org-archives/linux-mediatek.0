Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C143C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmkVR7ebIIdm0Ut/nBiNUr4d098a+Srl5Yq0noq7NQI=; b=CIBZCy2To4OO2M
	D2O6QX7ry/8TwDoHvYauDYM8vGpYHR4WHDOC2G0k76sEtAQXEaHuQ4sXUlNc3GfBT6JXig5JFDkAZ
	GYIiCZn0mfj4aYtiJlJ/1EYWA2EKMSQQrKsMJsEbGyBHALAFSpHf/0hgS46xhXz8lk6YSlqkddgv7
	h7ICMdN8PBL/pe726WQ42dApHjMS+YkVMG3AO8BLyaAovZzQa7Fn0X6tpJQQ0Ok+akLxTUsO3dys8
	EK6GwzfrXD9zxg6HgpSHU9Cxef69tl0/tHhJm/QifMDFbakT9jAFagWWuFPZG23byagBQy1a6cJ5b
	bsGWhP1wWf7j8jMZa/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriML-0085lN-Fe; Thu, 19 May 2022 15:46:41 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJa-0083DE-Ia; Thu, 19 May 2022 15:43:56 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW8012194;
 Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=u+QxAncAvxp96xgaOuFAOTOuK8/bBEXa7ukGj3INZH4=;
 b=A3EHzvTMs+vSA0eAT7Rdjitg5UDuc19U+jn6WsCGEOa1l7fr3kBjgWftNE0lX5QhIE5S
 mDaPT8qUnesIfCqQ2r5QW3HSJ3JkPjj0dtimfmzHAKOqKoMTIa5E4N4pwyBrNOhystua
 /z8xYJuaRUC6t7/6nON4eOaR/93UxvF55Zc0SkacOnyzPCamtJcX698JQDCvaqQLGpLg
 E9oPy4GaTtbAH+L7N7gRQ0QL4FVmdc38BcMPS9ZvNBYGfdlHjVbiyefmqHMNKd23N97o
 aBSFlBUa2gGWVKzlD5MAmltfEr5oDmRRBYdtPC2yfH54/Dh/POhTOfd31AqFKjFyJV/U uw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F1E8D11D1;
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
Subject: [PATCH 36/56] ASoC: hisilicon: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:58 +0100
Message-ID: <20220519154318.2153729-37-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 0-cV5LGd--yr_IKsTex_co0UDzjA36i1
X-Proofpoint-ORIG-GUID: 0-cV5LGd--yr_IKsTex_co0UDzjA36i1
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_084350_822244_DD87E1C1 
X-CRM114-Status: GOOD (  14.32  )
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
 sound/soc/hisilicon/hi6210-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 51f98ae651a6b..689ae13f34f5b 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -513,7 +513,7 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.trigger	= hi6210_i2s_trigger,
 	.hw_params	= hi6210_i2s_hw_params,
-	.set_fmt_new	= hi6210_i2s_set_fmt,
+	.set_fmt	= hi6210_i2s_set_fmt,
 	.startup	= hi6210_i2s_startup,
 	.shutdown	= hi6210_i2s_shutdown,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
