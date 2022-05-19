Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF95BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqEUkw3kEegKZ+P2ap78nFBnzxtDBRjf2Ms4/7OSl/0=; b=pXtAZ2m6XncM7x
	2T2gAetcGoGmDUnUx7txpUVE6VB6fxC8whhwwDiR8alRa6OwN1dt7zyWXHMfME3DLCzJ9/1dRQ2MN
	lSLxeIRxxfUqdjsg2TrTodpGMvy2sMhw3g3a9WZEJ7e3FcwAwcwjew2WSP8MyDuX7dQfQK5+O4ps8
	C3TB+PyWwZ1LviGCRDDUQiexC6+X6pLOqn6xB/SdfIae32hYMUNOj704l1pZahmr83o2B1VAvrpYE
	DHkxEtjeHNx2sRT0JV27BjMfSKVtNEg2bbwcIz90buklyAni66VXr+6ORgLobXgA6MqLWTS03fR7k
	dqtbB2dT47RmbpGlrFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriPp-0089MR-Dn; Thu, 19 May 2022 15:50:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJy-0083Yi-Jn; Thu, 19 May 2022 15:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=rAmdzdVBPsEtNYul1g2dUSOHayNdAUAKJpBqG3aOzJY=; b=mFnMs1ou5zqRqfX0ftosNxOb1x
 0xl/00ivY8LZ0SnigJBSIikTvE9Uw/luY2obgH00NWhIjyGYbmdrmRyzL2+B9Mf7/PEVNXFFdZj84
 rQVtOxAoI8Bvm/+lYbkHDJ5ToOZmdR1+R05Ye0avaHaWP4WPhg4LmeasJdOgjutMjYpt8AKmLy/3M
 PIvKLV3Ofrc6rtMrdpzOjNmN66qsGQ5Z1e+06N8Uc5V+PfpX9lNi9jMyIsgptDfkjLqYtQj3eBRHO
 ehssyNe2cD33sRIt5S1YzCK73fcCkHpSorsI+a2roiJ8qOK7FUCVe4DPHz7hDDNR/FsbtUI2zf50O
 qxyF4FvQ==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQf-SY; Thu, 19 May 2022 15:44:13 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12F002261;
 Thu, 19 May 2022 10:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rAmdzdVBPsEtNYul1g2dUSOHayNdAUAKJpBqG3aOzJY=;
 b=ie5ibsCRNwZZmuJ7F4ifhgUDhbNFdVJXurj2KqdorbsRNTljtVbeF65ukdcB6nMZxS1g
 d/+JCVd0dfnhu8SFO5FcqFh03IdcFk6O3lsqMmEw1lESZSVQHVZ768Y11iK86gX5wded
 HncPrtvS2Pl8abpQqBrsNWAkSKm2te7Ec6s073jO0yUjL3doZ1eCxMJMUFeuIRv573M7
 cF+XfwzCbtl4LQmuL75idWHAKV+YfIjGUNGlufoB7XcZz6PoZ0EJmFPIM6OMvgi5aiwF
 GPkauF4RCdfiZLjEaeIYEGePTVTkMuTQ+kstkKdPr8UnRxIFlDMj6R/YD9CBCRFNzP3q 3w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4CA0D11D3;
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
Subject: [PATCH 55/56] ASoC: soc-dai: Remove set_fmt_new callback
Date: Thu, 19 May 2022 16:43:17 +0100
Message-ID: <20220519154318.2153729-56-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: kWHk-gfbxXTo-HjPUeZ0SF66_rmIJn2u
X-Proofpoint-ORIG-GUID: kWHk-gfbxXTo-HjPUeZ0SF66_rmIJn2u
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164404_838269_FAB857E5 
X-CRM114-Status: GOOD (  13.58  )
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

Now the behaviour of the core and all drivers is updated to the new
direct clock specification the temporary set_fmt_new callback can be
completely removed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 1 -
 sound/soc/soc-dai.c     | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 9c1d92d5a3738..ea75096720864 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -288,7 +288,6 @@ struct snd_soc_dai_ops {
 	 * Called by soc_card drivers, normally in their hw_params.
 	 */
 	int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
-	int (*set_fmt_new)(struct snd_soc_dai *dai, unsigned int fmt);
 	int (*xlate_tdm_slot_mask)(unsigned int slots,
 		unsigned int *tx_mask, unsigned int *rx_mask);
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 996712f4d9bfd..d530e8c2b77b1 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -208,11 +208,7 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	int ret = -ENOTSUPP;
 
-	if (dai->driver->ops &&
-	    dai->driver->ops->set_fmt_new)
-		ret = dai->driver->ops->set_fmt_new(dai, fmt);
-	else if (dai->driver->ops &&
-		 dai->driver->ops->set_fmt)
+	if (dai->driver->ops && dai->driver->ops->set_fmt)
 		ret = dai->driver->ops->set_fmt(dai, fmt);
 
 	return soc_dai_ret(dai, ret);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
