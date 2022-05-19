Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p96TfRLGLUjtz8r/0viZmH5oKED6e4psIwWTaCSpAPY=; b=eKkG8SUyZZw15p
	LgIaDlWBVFvRa7f+Jdk9I3w9XiVvC2EIRjJ/r6MWqTc4NGtX9/7dCfpIXGoNF7YUeg1fAgrs+RQIo
	qUjL067jml6gt1U44UGD0iX6UoFkSFvvrnxIg3whpcVsnrh1CGzIYv79wLDT9vGzPQ79EKJ7lkAjr
	2z1HM3VHAiSWxCpaPGRm/II/+ML0jB2tLPnFj3IJTuJ0oIW4JpAJDarACveSMRU/Uyc7mxPJZDW9O
	N/UuGo22JeoUI6hevvIwq/fdHOaSUktJDTj0q5cQN27qV+c3mf3a8Cq6sJ/nitPLwDjs1KIzN8Y5J
	ZzMMH16tJSgE5+IrVJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSN-008CEw-Qx; Thu, 19 May 2022 15:52:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKD-0083lm-1F; Thu, 19 May 2022 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=z+713LcgVSa89NuxEpCav+AZkbDKOY5pz+s0AhMHqec=; b=PheDKzNy8JUhEwpy/a1CgjbLaR
 qdFaOUftFRmziG/6D8sfJ7wpbs2BXISQzr0zq5vLoPkMnmnAy1ROr4Xht2dpPVLdqwHclmbSTtAkT
 y3/cze7lKC/x+vNd4746+9lfYiibAJKBb3uGQxnDGmxJIzbgtA1liCWuE+LqglP3EN2RkrpG1lYpP
 7eQtubu/+qDyfrhd7qB/WRMqat7KWqzU4dky3ffpoenSDoiDOHOi0+l8bGZtM9GMq2acClOdnl5St
 t71hj7Rqb9u+BsDqjpa8vXGxiPutZLInfesknqO/riD2j8UsxLPA1h+ZLwIQ5+zrIFSdjocOiiQBV
 bdfkemwQ==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024B6-6P; Thu, 19 May 2022 15:44:24 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11x002261;
 Thu, 19 May 2022 10:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=z+713LcgVSa89NuxEpCav+AZkbDKOY5pz+s0AhMHqec=;
 b=b0ehiL6vR1LrW/ejMV3eLOcCAxjAXTr8a7RwOTx60zFqILUIV2y2Iy6foPbxn05q3zxW
 VNdlQgEa0coUjZBpb6H5VVo7emmDVSXRlWasr+Cm61YrRHDsiwjm2o2ZuqTn2D3TFu/u
 ShnJPksQWFfr0q76F5paDGE6JJLd2E2nu3hkenZekXTrnkOYIOCLccs+K19NQcxqBaNE
 3A9gyvCuld4v5sAwfsJ0nL3Er/MH7ydPeSNyuHld8icS51tDZ6n1wiEeA4mkpyx2Mkvv
 oDw94Z0NzBoGjab1kYABvf4+Pqni1nhU4OFep7UuOEezmuylOLZ7ujMaUQXbezGEkf2x BA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 237F111D1;
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
Subject: [PATCH 38/56] ASoC: Intel: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:00 +0100
Message-ID: <20220519154318.2153729-39-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: qq8Z3MgLOnXKYhENBujYim2aeDSyiQci
X-Proofpoint-ORIG-GUID: qq8Z3MgLOnXKYhENBujYim2aeDSyiQci
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164410_081006_98DDBBF0 
X-CRM114-Status: GOOD (  14.66  )
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
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 sound/soc/intel/keembay/kmb_platform.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 339d9440c1501..a56dd48c045f3 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -473,7 +473,7 @@ static const struct snd_soc_dai_ops sst_compr_dai_ops = {
 static const struct snd_soc_dai_ops sst_be_dai_ops = {
 	.startup = sst_enable_ssp,
 	.hw_params = sst_be_hw_params,
-	.set_fmt_new = sst_set_format,
+	.set_fmt = sst_set_format,
 	.set_tdm_slot = sst_platform_set_ssp_slot,
 	.shutdown = sst_disable_ssp,
 };
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index a65f03884d9a5..d10881fedc8bb 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -736,7 +736,7 @@ static const struct snd_soc_dai_ops kmb_dai_ops = {
 	.hw_params	= kmb_dai_hw_params,
 	.hw_free	= kmb_dai_hw_free,
 	.prepare	= kmb_dai_prepare,
-	.set_fmt_new	= kmb_set_dai_fmt,
+	.set_fmt	= kmb_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver intel_kmb_hdmi_dai[] = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
