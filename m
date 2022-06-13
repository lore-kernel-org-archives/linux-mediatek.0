Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A256CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QqrJRNTKrqVaMTUyeR9mVgy/ouNyfg4XPbcKmK1vr7s=; b=jpqF9mYe8XvGNM
	u1KiHIWeeD7d7FA9uSySGlsA8dBE4go13x9xQgZmoqlQeeGkjrtxjdlrqpl6J547xkGZNXapGP6Gn
	9m1Pp9cM90KAirUzWYs7hJHwbendq6ImqUB2lIw0hDm+gatMXtU2mcua4L8NfeghD3Wrf5n43f/4I
	rvH2Hn8CP23WlQEhSOrOMIB4eSWU1opkOvGkzcwxKGS7PFuEq9KdOVOKtxCpk7LIQkqlyDa0eRarW
	MhN0fm+w9Lmb1ZaUZxSHWAUgYrVuq12i1qrKIjZwT8GifLukuhG++AhEqFNke49bdt22aUJ2zJfQc
	7o6oEhXjvuH1BfIR8B/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0mjb-004g6L-BI; Mon, 13 Jun 2022 16:16:11 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0mjV-004g1o-JB
	for linux-mediatek@lists.infradead.org; Mon, 13 Jun 2022 16:16:09 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DBuxUi006945;
	Mon, 13 Jun 2022 11:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=4R4Ym4XA5bDdt/zDB7Y35xb6VBHh26DwvdrgZzMm1m4=;
 b=NFFik29o2NvZUx2AhujDPn+6BjLnktd3Bb8eKXXHUnu7rvyrxakwxjWipe1RFpIAn8UJ
 SrDUBCvzuuXVhrjqZNNhyRRAXV3pagYvMHitgSfIzZMkpX6cyt+UyfxmOhtJ70ZwrCns
 1n3nFFMXiy9W/vln0kIIwBEyVKjItaSvwe/fLuZzzM0aKZajzPNjkPOX7iC1RRB35sMz
 E/YOADb3ImA7phkeOaBqHYWO6/mR3ZJCOrXZvNmU43iD+0QKhhnwUkA+iX9fTvNvqQjj
 5/cG1DBMeVyFHbrSEZZ+CHPS6qFXLKpKs3xF5t2ESAvtRBMfofhVXNY0evryromRK/dm qg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq24mu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Jun 2022 11:15:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 17:15:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 13 Jun 2022 17:15:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C607546C;
	Mon, 13 Jun 2022 16:15:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <samuel@sholland.org>
CC: <matthias.bgg@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <linux-mediatek@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock specifiers
Date: Mon, 13 Jun 2022 17:15:51 +0100
Message-ID: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ufAMjQSTEEIdy2v7qIN3Z_ZuR-cxb2fr
X-Proofpoint-GUID: ufAMjQSTEEIdy2v7qIN3Z_ZuR-cxb2fr
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_091605_830559_C68E81B7 
X-CRM114-Status: GOOD (  15.82  )
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

Recent updates accidentally updated the clock producer/consumer
specifiers on this device as part of refactoring the CPU side of the DAI
links. However, this device sits on the CODEC side and shouldn't have
been updated. Partially revert the changes keeping the switch to the new
clock terminology but going back to the CODEC defines.

Fixes: 7cc3965fde74 ("ASoC: sunxi: Update to use set_fmt_new callback")
Reported-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sunxi/sun8i-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 90d74a2d53f38..f797c535f2983 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -287,10 +287,10 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_BP_FP: /* Codec slave, DAI master */
+	case SND_SOC_DAIFMT_CBC_CFC: /* Codec slave, DAI master */
 		value = 0x1;
 		break;
-	case SND_SOC_DAIFMT_BC_FC: /* Codec Master, DAI slave */
+	case SND_SOC_DAIFMT_CBP_CFP: /* Codec Master, DAI slave */
 		value = 0x0;
 		break;
 	default:
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
