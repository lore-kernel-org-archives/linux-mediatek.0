Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B26C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoBLqp1L4mzDFeO0fMAQAeOCxEK2linAB6Wy9E5DZsM=; b=sCOnO+TWzNF7Ym
	bV1ljg6nTCTkJfGPCP9sBxZl+oLOrzyUq2Mr8n6/LM2+AD95jj47Y6aoZAnqzBHCJ3tGgeDXCFGNf
	c6J96SC0E2AiDOCFjpt2sxDrhbY722fT51dtgT+EKeoERVCya2JFYChQPm/eL5X60E2U7wU9U3+PA
	phDeT872Q4gB1S+NZZT0rpZkMS8e60I7lrD6XExa5TCPtV+tyYPyltTmsb2RU4mMKaalhXCfpAjTL
	Uzn7faXMskKVcz40MiJ6BzLy75iU5vvt9AAVVKjAsJoErAJLXACUKWzxnpn2PA9AB/QgUISnu4XVS
	Dpo7fjiH5GYT/gjhhKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriOF-0087m3-QK; Thu, 19 May 2022 15:48:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0083Sx-Vq; Thu, 19 May 2022 15:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=eGYFlG3Htf11GYri2u8Av0yY7RtKBp+5GHIN2hbYX6g=; b=O3le25+U8fjydnXPnZFBtQyIyl
 bZ8l3bwYuahmJ/8RUUcvqtWrHeZoeSK2tueyjV2LdvrfTndyrNqUsVuC1C2tIUHQUm3vt/XzF6DCR
 F4xIBnR6/113SXLM4bKU7F2WC6gMCXcDbBbrseZE47VLh09qSvqBy5FaxzTj3e82eAAuthDi4XOsy
 b0+ot8Kkq/K3V/kWVUwcyd+6OpdcK48b1TP0Gnc0dLMHFAu1kXOzRy14ygwFLorlV0RERBx83EiES
 29lCBvDp2k0620vt6KNisNuTGOQmzAX3EUyfgo0HGwXqy+PmmXBGpv4hLHHHlWY6SvODOyxdFf9T+
 /qnTxQpw==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQm-LG; Thu, 19 May 2022 15:44:07 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12A002261;
 Thu, 19 May 2022 10:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=eGYFlG3Htf11GYri2u8Av0yY7RtKBp+5GHIN2hbYX6g=;
 b=O+w8tG67JSaQk07m3qWqUWMeSMitpMGwE2mqPEef9kEUYE83vSjG6ylpMUSPTpeQ5Y4s
 YjU3erNeoJHT+w9R5LsYXXwH+u/oo1M3j1o6o+iH1+ETquH28K+XrORFKS/f/sB95TRB
 Ldc6rtbGEg2SB8vnp/4TTgOhRHO4zYWi7NZUyyYTCXbEMiSXUXXlphks0xZZZo4ssekn
 K7oxRN6VdpsOhB6GyZwVnavWG96WNuWjLC4Zxq1oRMwNne8je7f1RNspA16LtPj1b0ut
 afC1ItdmxzfcgjUiYLsIiG1JHRIF6xcobUziLvk4mi8sq+AH6qDgQdCPEvJItjuhy9ju 0Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1485F11D3;
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
Subject: [PATCH 52/56] ASoC: ti: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:14 +0100
Message-ID: <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: mdgP--FrYQJ8LQr97yUif1MMz6GgTqJw
X-Proofpoint-ORIG-GUID: mdgP--FrYQJ8LQr97yUif1MMz6GgTqJw
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_037445_9CD3D5D3 
X-CRM114-Status: GOOD (  12.98  )
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
 sound/soc/ti/davinci-i2s.c   | 2 +-
 sound/soc/ti/davinci-mcasp.c | 2 +-
 sound/soc/ti/omap-mcbsp.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index c7368d5296688..fe572b720b094 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.prepare	= davinci_i2s_prepare,
 	.trigger	= davinci_i2s_trigger,
 	.hw_params	= davinci_i2s_hw_params,
-	.set_fmt_new	= davinci_i2s_set_dai_fmt,
+	.set_fmt	= davinci_i2s_set_dai_fmt,
 	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
 
 };
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 961bac6963652..e2aab4729f3ab 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.trigger	= davinci_mcasp_trigger,
 	.delay		= davinci_mcasp_delay,
 	.hw_params	= davinci_mcasp_hw_params,
-	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
+	.set_fmt	= davinci_mcasp_set_dai_fmt,
 	.set_clkdiv	= davinci_mcasp_set_clkdiv,
 	.set_sysclk	= davinci_mcasp_set_sysclk,
 	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 5bfb56d4ff844..58d8e200a7b97 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.trigger	= omap_mcbsp_dai_trigger,
 	.delay		= omap_mcbsp_dai_delay,
 	.hw_params	= omap_mcbsp_dai_hw_params,
-	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
+	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
 	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
 	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
