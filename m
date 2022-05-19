Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81765C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJo/w9oLaPrKPfHdwtGdbPXZs8ARIdm5IqhlZ4ppmgg=; b=ErELbtVncC9QUI
	MHdit0Iuwa7ynjiNylLVY/0wo6879uURzzN9TFJNyOxKdD/cO2MVf5sUBdyTwmglOHF8kc+nS/iVf
	T6NLogxfpf9KFS2l8iYtZVXrN0UNB/hspe1Z9zrjq8ntqmDEfrgsdJ/rxLKLy96ZY/zbR27p2W9RB
	xFCp4uUYFZCdWeFLk9MCkoKfhHdEt6evFVY5Hnq9E/Bsj+6no+qvbnv+TwlrWqc0/Az4exc2iHrq1
	rrVedeY/QthZyZSRoFU8hzszKhA3k2iUsfXI8UdDIX+M5TiFm68CqqPfD0USho+3K85fiokcU3CLX
	o0tbx29npKPWO6eeuHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSl-008Caj-5f; Thu, 19 May 2022 15:53:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKD-0083lh-5T; Thu, 19 May 2022 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hhhdDytXwyq/2wQL6ouDd0l2imZhUv86FKrd+RhIEOM=; b=oVziYl4Ndksv8sgcWHkpiWxYqL
 RqkQAXCVov+zzdbcYmQ4PgxprLG8WFAHlqjzovwxQiBFGrOM3qCOcDe0cQuiCDh+e1uIeBGAGAtGs
 1Tewe2NTwigvmjkQHNPcnKlAOM5nk2H/tfryl5Axc9WvbQzBTCw1yS0ZH8MXne6ycRYDfAMWh6rwL
 F131r2gnRr6GFUIkDMGBBkkAwFUlqFZzVSBad8abBNJtIVNfkWwJdcHQRp3aLsH7tcFG95KYwdtk5
 fQVcn7Yh/D+dCEytIY41h9oU9WKwfSjceq6bb3gyaZ4fMogb03oF6nyggO/pPaVznRBvL/n8udik+
 Kfe8+K0Q==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJs-0024BJ-6N; Thu, 19 May 2022 15:44:24 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k122002261;
 Thu, 19 May 2022 10:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hhhdDytXwyq/2wQL6ouDd0l2imZhUv86FKrd+RhIEOM=;
 b=IY+dZad0v5waNf6cw45HaFxE+WWzgqyhg7GjkKbqQXIOwb8H8JqVqImStzrmNprqLRVv
 3WdBe+eyh6gaUpyIbGSqmlZqvWjc26+xQ4nRh8iv3wpajkG4Dupk2yooJWbzA8u0ugVU
 7Yw5zmghE9Q8Hek36hkrvI5x+e8uhbUm2Ogs703SWPiE5ifQj9YDtrOkkW5aNXJl2JO5
 R044Iw7FPaFWz9UMjVDxotxCXz0q3zxqFeh5jAqonDuSCozfIcF+pgI1KoqPHI3yyxt/
 D9KvWWI0o+5+XJd+2Q5nXMUMGo3f795ly4fgp1ZgyQpgz/aKCduVoByRW3PViZGgt33S jg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B923E11DA;
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
Subject: [PATCH 33/56] ASoC: ep93xx: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:55 +0100
Message-ID: <20220519154318.2153729-34-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: eigh1Lk0El9WcmDf-3oKXztbc3yf72e8
X-Proofpoint-ORIG-GUID: eigh1Lk0El9WcmDf-3oKXztbc3yf72e8
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164412_753641_56CDF0F8 
X-CRM114-Status: GOOD (  14.14  )
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
 sound/soc/cirrus/ep93xx-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 2c8b1c76b834c..47959794353a7 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -398,7 +398,7 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.shutdown	= ep93xx_i2s_shutdown,
 	.hw_params	= ep93xx_i2s_hw_params,
 	.set_sysclk	= ep93xx_i2s_set_sysclk,
-	.set_fmt_new	= ep93xx_i2s_set_dai_fmt,
+	.set_fmt	= ep93xx_i2s_set_dai_fmt,
 };
 
 #define EP93XX_I2S_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
