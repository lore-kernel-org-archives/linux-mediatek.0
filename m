Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA71C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGqUsLDZwz58pRaksYwnAafhTg5k0rW52SGDShQmTns=; b=gwGONe9D37tb6w
	TuIxcADxGc7bPXAVbO1OSZjXbngpbzHzFwOI/ZU24dYexTUc8DQdAllhN47DLAvQeduS+pRPWp4Cn
	F09xtQ+CAuN3XzoaHRPpcLwO8X8JA2UuIvDQ/Vd+VvF674jkssQ2NaU5cgDaoZDTkYNk17QCcrr0A
	lHwMNKNvRQTbYkJtoufSgiGy95030uIVvafUaZWLIASoXVecqmunef9G66gmwThUvcpXAQYuKma91
	qKlpT+NUge1/KTep6hLCZNckJCCMp0827dkAnbZuH9FV/B41UtVylJFsoa5j8YrlA4/rt+IB6DYoz
	kxYSHTYAMe1NgN3Qc0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriOc-00887v-07; Thu, 19 May 2022 15:49:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJt-0083U4-OJ; Thu, 19 May 2022 15:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=TIWyZghTEZ//MO2jvbjUZPrmAJ1ieo/aXBoLcASAC1w=; b=Vn18XbHpi20nJwVutsgOTOA6QS
 Q91YgMo5bLwQMQOh8n6Gr4EaIQfaeMFJaoUWklzqGYeXpQ70jQvrNHUpUgpKFrJsTUJ97je1t8msd
 hyWM1unEf1IYoAgJrVMGasDkvkiOX922Qan4sQHjHYdEdbwYsUSWHfZQZJCp4mWVIwneB1yMCnJpB
 vOvqZYsvZ2YFq1n7C3CXhAURyhJuJgeFxRd3dcoL2iEhh7+5v5HBWt1HeSSOrBeEjnmhCzBd/qb8R
 g8eBF3LOxonFGZjuUTm4eMgpV0enbkhZd2Q5yxEqShMPr4iTmcRElJGyxSZYEd+dYmvCai9e/N7w4
 pIXBd3zA==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQb-LK; Thu, 19 May 2022 15:44:08 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12B002261;
 Thu, 19 May 2022 10:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=TIWyZghTEZ//MO2jvbjUZPrmAJ1ieo/aXBoLcASAC1w=;
 b=WXh+X2sBUTuu1EFWjtVqsdMrMDBdTC0ym9haGIwCO+ZMLVfUx8/SKLsGToIUYs31WTyE
 DOU7DaMZSBWLy5uxyi8D6n5sXfUEwOFor4O6Q71aRqSJkCm8/ug0UOrgsk6LlOnY2eAX
 dahGd5rw7s39Q+k4HiuyUhuFv4znDF2258537Yh87jJafevKisgPqYTMLBx6tF7o95Z1
 JVqe/ENOFIS5ERGxgf5KlqPQoOMo9k9QNUTTDM12CQTGF72WhxtJCBx7myscccLfqIkP
 D90LiewLtzARtk3lRxI0RJS7NrHWhTX5i08HJOVo0VEnkFUlijoXOpoxH6Oohw6pNlsw RA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7A3D411DA;
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
Subject: [PATCH 43/56] ASoC: pxa: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:05 +0100
Message-ID: <20220519154318.2153729-44-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 36sXbaeY6GpSg0BsX0_utVT-CPuXi-n7
X-Proofpoint-ORIG-GUID: 36sXbaeY6GpSg0BsX0_utVT-CPuXi-n7
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_478037_FA644B4A 
X-CRM114-Status: GOOD (  13.48  )
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
 sound/soc/pxa/mmp-sspa.c   | 2 +-
 sound/soc/pxa/pxa-ssp.c    | 2 +-
 sound/soc/pxa/pxa2xx-i2s.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index b746e52aaf85f..382e9d8608a3f 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -346,7 +346,7 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.hw_params	= mmp_sspa_hw_params,
 	.set_sysclk	= mmp_sspa_set_dai_sysclk,
 	.set_pll	= mmp_sspa_set_dai_pll,
-	.set_fmt_new	= mmp_sspa_set_dai_fmt,
+	.set_fmt	= mmp_sspa_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 52124be1778eb..0f504a9f4983d 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -824,7 +824,7 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.trigger	= pxa_ssp_trigger,
 	.hw_params	= pxa_ssp_hw_params,
 	.set_sysclk	= pxa_ssp_set_dai_sysclk,
-	.set_fmt_new	= pxa_ssp_set_dai_fmt,
+	.set_fmt	= pxa_ssp_set_dai_fmt,
 	.set_tdm_slot	= pxa_ssp_set_dai_tdm_slot,
 	.set_tristate	= pxa_ssp_set_dai_tristate,
 };
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 09a0d033df6a2..7b586b7d46da3 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -335,7 +335,7 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.shutdown	= pxa2xx_i2s_shutdown,
 	.trigger	= pxa2xx_i2s_trigger,
 	.hw_params	= pxa2xx_i2s_hw_params,
-	.set_fmt_new	= pxa2xx_i2s_set_dai_fmt,
+	.set_fmt	= pxa2xx_i2s_set_dai_fmt,
 	.set_sysclk	= pxa2xx_i2s_set_dai_sysclk,
 };
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
