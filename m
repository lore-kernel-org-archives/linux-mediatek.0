Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D1FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CKxBOZsN5ogUTTgI7lNdlKTiWAfj614RknMVYtxXCY=; b=IZxccSyvW6Hw8t
	Fc9sAezHkOtLvP4Ropg0LuqcIMJprLoSoOFRgccC6dzVHMoJK8L5bADYZ3QH834AjlWLeXctbiZ/l
	WGatfR2GKrG1R8yL5i40YM5iKO3s0nVbQ06mpFeuzZPA0FUfYdCHFHq1T9HEraXGseeKP02vLZ6WH
	m2541y/GppkIXBchSX75QEUGurQSC10NHFiGuZAnLkjrWxl5ArneP5BOLh+DYw9Omgosdtnkh1SRp
	Uh3pwVnQfm12N83SROIrercwjjCQyYWG5rpZHAvmTF52o79Fh2GV+xcHKUeg9ET53wXSaaaraWumL
	N43/qr0rLULTmukBUZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriSU-008CKB-AM; Thu, 19 May 2022 15:53:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriKD-0083lf-4w; Thu, 19 May 2022 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=z9ebj2AYycBGu1x3sOA4KwiNWtIMh5BMNemN79pJAyU=; b=anHgpaE2CscVhjSscp4z33iFJf
 V7BmGkLv5ZjnTQPRSVqf7aHTuZKQu3nSAlfQl9o1jKKw5uN/ne8/WUuU/tROtbcGdD0oTyOSg4to+
 I0sp3/Ks2khfL4mPGesHBlxZTb1drR87dHyjmk2p0c7BFOp3Rvys02OkvGDYYmfWKRaUG9z7EZsgy
 O/oiVdGAcvIQYwO/nzpWQ50oKDibN7eyZae+kvxot98RS752DCXWHJbyaBvEH80/uqotUxdwTPZTE
 O/xd5Ma8lpeeXftoF2Nmix4Lan5UgV1pMGeWwQ8mLNDDBnFhMUabOzYAjzpmxOTkp5m7pOaPKctuY
 dqRHvLHw==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJv-0024BI-Kg; Thu, 19 May 2022 15:44:25 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mWE012194;
 Thu, 19 May 2022 10:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=z9ebj2AYycBGu1x3sOA4KwiNWtIMh5BMNemN79pJAyU=;
 b=F93/BYqfMmyVDe5iSs1jzFHogoePCJ8pkK6U0PsKvqa79Wh0yGz/e7G/FEZlHb3Sv6TZ
 l224B3AmuTnDodgvt3SoKp/0pefOCaBE9QzbmX//kW7kDkFBPJuEWTwHQrCdhCSyWByP
 cY5ApDFg5F8JmAW8yPd1UmQaHS/Iow6cwECBW5TN0P2/0PO8ay7AAL4oXYQWX7aY0eDx
 XzCH+fNrPMXVr8Fq0TnTDa5gU6nWbSZP4NxMM97HdY4ydLOtCB1+DyeokENpMhe1NA6O
 XD1PcMH2kCGd4teRHV2U2gkqnSk9+h5vsJFKh7sEAedfKxLDJAL5tmVfEHYtJJOBs9z0 +w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2786F11DA;
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
Subject: [PATCH 53/56] ASoC: ux500: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:15 +0100
Message-ID: <20220519154318.2153729-54-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: UqtlUZzgI4OUSKujEueGIc6w9lgbqc41
X-Proofpoint-ORIG-GUID: UqtlUZzgI4OUSKujEueGIc6w9lgbqc41
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164413_013121_7189C6E2 
X-CRM114-Status: GOOD (  14.23  )
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
 sound/soc/ux500/ux500_msp_dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index cd6c4bdf5041d..851c3b8473fd7 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -707,7 +707,7 @@ static int ux500_msp_dai_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
 	{
 		.set_sysclk = ux500_msp_dai_set_dai_sysclk,
-		.set_fmt_new = ux500_msp_dai_set_dai_fmt,
+		.set_fmt = ux500_msp_dai_set_dai_fmt,
 		.set_tdm_slot = ux500_msp_dai_set_tdm_slot,
 		.startup = ux500_msp_dai_startup,
 		.shutdown = ux500_msp_dai_shutdown,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
