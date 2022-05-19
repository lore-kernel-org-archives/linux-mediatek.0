Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ACDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAwVo7VkUQRzL1ZxEkRvV18TEY/ZDkjcWafQSQQ2nAY=; b=mTOER5JUDnMKY9
	LOj2HFZbhDRU+pKapCRt7oJgIslU5KOu5cGSIGzMjYrqdJoIl6AjxlIPKECNlYSUXfN1uxp7lEewl
	G9zFnvyYBfNwEeGMo3zjSB6pvOoCSnJBmvYk0DtHKAJh2m6F4Hdk/CC6rBOzdY0NhvTcXldUFrvHR
	3LV5FmRhdDhGbiXoqc8PQXbQEIXdGDF+bbPZkcnpwbqTpXrLhh/PbhlyK2Xu5h6UHHaH43X4MiO21
	BWkfKGKt7o+K0iNgIVBK2w9Bxy7FsP6nhW+v/UhrzMMhFzwZZLJZQppRVGv2sa6wA0fJFp0uit9Lb
	y0a284VSXFRqfqevoesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSs-008Ck4-H5; Thu, 19 May 2022 15:53:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKC-0083l0-KH; Thu, 19 May 2022 15:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=u8gBawUReRW33h0mniJ3wlAUhVgNuvljzoZnaATo57I=; b=psWl+k/+4YKpEmv6eTnbrIW3SQ
 deba7TMrj7A+qHq0vace2BGepzRfaN/I08z0OAvdIjcLy5fBLcr5v/BK7xefGSDhNDrM3unnKbg5k
 /lZyUvyoUfJXqfwQWErA0WCBQMv4Fg5Pb4UBOulFqJ2VXfOFpUsM43j8i6nNaUdt95t7wZqZJFDhk
 gzU/wbjxePH3mN/QoWFOnN1J0jwD6ibBuSgRcZloyVPXjc6yAJEC7dTCugX5vocf37ayHuoB+PLIT
 +KHRu0fYeQELYOVe97+L1x71yCjqAcDNGI8Re5szRPa6vPt2ICJLXbQuT3HoloWcbjAtvRj2Wgz3Q
 QhAuTNkA==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJt-0024BG-Gj; Thu, 19 May 2022 15:44:17 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtag024228;
 Thu, 19 May 2022 10:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=u8gBawUReRW33h0mniJ3wlAUhVgNuvljzoZnaATo57I=;
 b=M/4dhBalZkqhwecDygq2BOkY14axdf929ROve2KoSnX0Xz9UcvEbE3wGiwMwi1kiuaA1
 KV/6zwkXN4FOTmr50Y2vWCF1WRiXB3xEveCUw6jpw3854voBz1U9U3yQBJMr6MBHNcgk
 AU8XmexMHVVcIoGrbrJJhbDrUndDo4+YlQcJYl5NR32p8hu/deB2uTdEp0SrutRLS1Zm
 yGSIlhBLGn/NERlQ0FTWbIeyw9urYMbgzJib4oxtyODW1dhJ4H5yoN7PEH2CIoV0rybd
 eJwg4PUsSJiBf6D6nS0zKM4pPfhZQP9KUs/SHR/hpYgOkXg07utfiJxbNWs6FVgZwFkd iA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6ACBD475;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
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
Subject: [PATCH 15/56] ASoC: mxs-saif: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:37 +0100
Message-ID: <20220519154318.2153729-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: _nMYoHwWi3DHMM7mJQrsrBSLpPWKVhs4
X-Proofpoint-ORIG-GUID: _nMYoHwWi3DHMM7mJQrsrBSLpPWKVhs4
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164411_346644_745951F2 
X-CRM114-Status: GOOD (  15.64  )
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
 sound/soc/mxs/mxs-saif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 7afe1a1acc568..38de46ba1583a 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -358,8 +358,8 @@ static int mxs_saif_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	 * Saif internally could be slave when working on EXTMASTER mode.
 	 * We just hide this to machine driver.
 	 */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		if (saif->id == saif->master_id)
 			scr &= ~BM_SAIF_CTRL_SLAVE_MODE;
 		else
@@ -642,7 +642,7 @@ static const struct snd_soc_dai_ops mxs_saif_dai_ops = {
 	.prepare = mxs_saif_prepare,
 	.hw_params = mxs_saif_hw_params,
 	.set_sysclk = mxs_saif_set_dai_sysclk,
-	.set_fmt = mxs_saif_set_dai_fmt,
+	.set_fmt_new = mxs_saif_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver mxs_saif_dai = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
