Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B47EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAWZC8jwQEb7WaSl3ZKvg/wiUqaaYkhb6GhVf81EwJc=; b=Rk1+3odDmL23nd
	roV9dm0tUQGt2BufpbC7hV1UxykPeiS2yzllzuaOg5W9yzQltLVAthE+nmOkdZdbP2/JYyrkQnZQd
	6VB2vByngMQ5kZ3uu1Stu44rldW08rWZIM8WvjwXlElwa0IH0BJlNIY4zBKaeZlmX9CFkFMdCuW8r
	cVz63BaRxfB3nujrse0yQr049QNDwG9s6ZA175cazxk9x5fKIbPlZeTzjyZKPjY41WF9/i8rzKPSN
	rV4RVA74v0tQp2WQhFGueOAq+Js4WbqlIK1HlyDUaNVxZhcSp7EZdK8HCJhogbWSwWdeBanesWazu
	l1Os1U8sRLAyASX5XGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSy-008Cpy-1H; Thu, 19 May 2022 15:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKD-0083ll-5O; Thu, 19 May 2022 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Hbt5hcL/CH9zDfKOG46hFLImfYROum7HenxT3cTBb6Q=; b=RRTTiU4zxyw6TxKhLWuXrvt2Mp
 B7GV6+Bas2DqPSfdZOdsa2ULk+hKh6K0d+NYAWrlCxh2Bp/oFvBhOnH+f0l0tFWWb2ACPcLbghL9x
 mvczQ8PXOPck/kpLdUQsOafg/8gMGKWmkzHK0/4JucuU6hj81V7CusHsofEZneOO7WI5oLsTEWkk8
 wAhPCTRJsP6K+0psvovLFspUMnu3ka3stc3w7Lxn4eLHsJAL+OvQAPxvLd2Ka3bjZ97pO7+ViAsqJ
 fZ2l2OIGR9Q8R553CmAmCsaPkhOWHF0L0qj1W8lCQrueOW0+ngmaXHvHph9KBegZS5Em9T+8k1/D5
 ebMgl/OA==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJv-0024B7-Us; Thu, 19 May 2022 15:44:24 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mWC012194;
 Thu, 19 May 2022 10:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Hbt5hcL/CH9zDfKOG46hFLImfYROum7HenxT3cTBb6Q=;
 b=Vihn8DV1R+wbdB9q3t2Nz0YUyYRxm1JmRhbMerBzCbLTkyeeLGdorv0bzHJXzmwNRJ2w
 iw5PH0Alh3Mu0+xfGeOS9dhGXGZgWQ7NtgzAgHAVxgjBFIuMB+bSj11zPS0JU4367OR+
 +di3g/CD+cXEE6zT5tAjAZrFnG7oNRgdE6qbOMExJUNqa3vNshFtzuK6xaePfXCtx/Xl
 +kB4M1PM2uDFIGzun1RJWVwvFkUACwO+T7UYO9cuwftrf2oOQaz7kB5fP2b3b23gXZkn
 xs5r4s51M2MbVu0gvFNGzBsD2c2zO6LYURDr896n+XF/dPEPF9c0jyC9pm9rrMELs9EZ 0A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D02F811D3;
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
Subject: [PATCH 49/56] ASoC: sunxi: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:11 +0100
Message-ID: <20220519154318.2153729-50-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: X4Drpa-lc_DkTuCu5ArOiCCfpMNoJfVZ
X-Proofpoint-ORIG-GUID: X4Drpa-lc_DkTuCu5ArOiCCfpMNoJfVZ
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164413_010811_CD795FC5 
X-CRM114-Status: GOOD (  14.58  )
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
 sound/soc/sunxi/sun4i-i2s.c   | 2 +-
 sound/soc/sunxi/sun8i-codec.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 872838d3e0a94..f58aa6406a874 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1081,7 +1081,7 @@ static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
 
 static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
 	.hw_params	= sun4i_i2s_hw_params,
-	.set_fmt_new	= sun4i_i2s_set_fmt,
+	.set_fmt	= sun4i_i2s_set_fmt,
 	.set_sysclk	= sun4i_i2s_set_sysclk,
 	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
 	.trigger	= sun4i_i2s_trigger,
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 6e9ef948d6621..90d74a2d53f38 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -630,7 +630,7 @@ static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
-	.set_fmt_new	= sun8i_codec_set_fmt,
+	.set_fmt	= sun8i_codec_set_fmt,
 	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
 	.startup	= sun8i_codec_startup,
 	.hw_params	= sun8i_codec_hw_params,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
