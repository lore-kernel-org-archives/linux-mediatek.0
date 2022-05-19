Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BBEC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fl9NeRJldGma6qTfP3d+D3pmOyiPX/ESZkWDtaiUS+c=; b=hYUjchZY9wVWCb
	2wCtRa3De93Weslk9qTT2uZMi5TjQ1b32LhnvQuzowb3O1YznaFZXvEsrT6U3h+j9kYbPSya3NGCJ
	HdNZdUrgM/doMvlg0D8kctq22fnpDry62b3ltYJQBmbUc/C2hy528Wg7sQbkeeyPuhzbSgcwg4m82
	gIDsjr4kf0dMZ1PgdpYzdZaZTwc8U4U3h2wlRYLXi0Mm4K3booxVIDmO0GbGSdoN36BcBnB4CZ/yS
	VQwRHTFicFz2lIiL5vX2gfdCl2fTpCp52okIV5GjxOciGvTNUomPsDqTpk3cm7y9olrmbgbA6qmr5
	wRACX6gZBx+PFJcJyBNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriPJ-0088n4-5Y; Thu, 19 May 2022 15:49:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJw-0083Wk-Jv; Thu, 19 May 2022 15:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=6Qxy5Zjr7JD/fwXKZPbisgT4Uwm8eiruRzK/cF/xRnA=; b=nOECv3VfVEMzMxHRJsXeNzYK6/
 IZXCioNLaR0EAaFs2qH9zYlob/zretdOanIT2h8ChTefPJv/q21pHrNXu/L6EQDzACis+RsHeISrH
 JrC7B+OAV5b2vAPpdESadRY94wFbZ0gqsTBDJa6CpnIkPxVzCL5im7/UxB7mjjFn5aFZ7gjJc09zi
 13EBa1rkiCYoqXQrEe+A5UTL8zCFUJ2BhPsXQ1vNVwomphZ2iejShw+il3JRxW1HfYcvJzvL3T6Eh
 trNatlmMRRx7XKq84IyiLMdyoqebdUk2XIXCRRD1q8jKr+F2hIRDejZnB7vxIVE7YO2v5BWyqyoIb
 iZBeMBww==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQa-SY; Thu, 19 May 2022 15:44:11 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k121002261;
 Thu, 19 May 2022 10:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=6Qxy5Zjr7JD/fwXKZPbisgT4Uwm8eiruRzK/cF/xRnA=;
 b=oiALcNhviVH4BY4fbonsBmu+5405yxETqs3+AwQd1977xu+deu8S4KmMTHrxocMX93Va
 J4D1eVdxhbyyMIO0d93HjND8Dwm4eRqD+pcOuM21eBQREwZ70jLcluBQlaAKEbFpJbRc
 HnkNDf58167/0feBYu3r1L4aUFR68tuE6yeXSSepn3gNz8wkuBi/uJiw5B+tLQZzCVfF
 76wCxiq1HKovPqaojB1i5MOpOeQ4jxB/oliGdkaQmz+1UQPSYYmTRTicm4LF7dGo1uNT
 fUbEs6ThexYjoThjOg8zUa3n01+YUZLMzgTGdR2FrTnIORIlx07DFKYzNOHtecB9V/pK XQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5445611D1;
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
Subject: [PATCH 41/56] ASoC: meson: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:03 +0100
Message-ID: <20220519154318.2153729-42-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: DrcgCHtgitJt2GnhqdU6mcjzSfW0SfDM
X-Proofpoint-ORIG-GUID: DrcgCHtgitJt2GnhqdU6mcjzSfW0SfDM
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_953461_CA6BBE32 
X-CRM114-Status: GOOD (  14.51  )
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
 sound/soc/meson/aiu-encoder-i2s.c   | 2 +-
 sound/soc/meson/axg-tdm-interface.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 0ab991230deec..a0dd914c8ed13 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -323,7 +323,7 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
 	.hw_params	= aiu_encoder_i2s_hw_params,
 	.hw_free	= aiu_encoder_i2s_hw_free,
-	.set_fmt_new	= aiu_encoder_i2s_set_fmt,
+	.set_fmt	= aiu_encoder_i2s_set_fmt,
 	.set_sysclk	= aiu_encoder_i2s_set_sysclk,
 	.startup	= aiu_encoder_i2s_startup,
 	.shutdown	= aiu_encoder_i2s_shutdown,
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index ffdb12d0e01e3..c040c83637e02 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -394,7 +394,7 @@ static int axg_tdm_iface_probe_dai(struct snd_soc_dai *dai)
 
 static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_sysclk	= axg_tdm_iface_set_sysclk,
-	.set_fmt_new	= axg_tdm_iface_set_fmt,
+	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
 	.prepare	= axg_tdm_iface_prepare,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
