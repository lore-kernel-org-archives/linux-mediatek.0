Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F207C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tksRoN1DoxMpQbf2lS6lX0z8TGKRjXI1ijdQtxYGiE0=; b=qGAxAlJI2WQYCO
	7sl1Fc4X3fxDxDqU9SITCT4uGZVrIS0ViGk1XGgWSqPA63ppNpr97rWrXV1ADc4bYMLouvr/6DxT7
	H2P3lHYLho1BcFULWTalWs2zEvWiHBvcfrlP6R66DOSuvpQK9n/C7TC0AhEYDEbhJEB7de1Rs4Sra
	jUBx8se4+5SxULYIHd88YKHOuzZJy3SQY258Cy6C4QeBJQ/g/YtpA+DXQmSEWUlQsUe/zCt4sWdj6
	ugVPeJdDxFScp79SLyNA+KcqLoZvJP30eKG54lAHy3V/LPTfbZJw6C12KxJXHsCmlGIhugnB8Wkfr
	1d+Wzvv4GAtIB5WG4CdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIXE-00Bs2l-0M; Wed, 04 May 2022 17:11:32 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWj-00BrVd-8c
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:03 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqO001835;
 Wed, 4 May 2022 12:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4VbmYjUMoZKa4PhAJfmG3feKfzd1hOblf/idtuGHkvc=;
 b=EWolbUiGk1weT494ErDQR1kBHtn2+AH5s+muHxpARNwqHzobmQNhWC6zb2Ftr+IDcyEh
 9ud4ptQwPApfC3MUJfCbxlLoJg5Q3LeATzBYKr8X+AaAT3sTLtF/G4ivzqVNftwawkd5
 rL4gjBdWlfzY/UrKJzgzBTDppdUcVAZlCYlg1Dq1PbisoHmvDM/lsEy2tex0sQBnEgeN
 gSTByZ+v9KUPo4ieqIAPFg1V9szbsjvX5H3ydCHgcy7FWMR4xrMm8mofEZRcg4G7E/Nu
 IiqBljkbNDF97AL7RDl6u17zHWILlnUXzwGmKZzqviuyTJmRjEzwJI+ublFgMbw7lfRS 7A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-20
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2F33011D4;
 Wed,  4 May 2022 17:09:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <codrin.ciubotariu@microchip.com>,
 <lars@metafoo.de>, <cychiang@chromium.org>, <tzungbi@google.com>,
 <bleung@chromium.org>, <matthias.bgg@gmail.com>,
 <kmarinushkin@birdec.com>, <oder_chiou@realtek.com>,
 <steven.eckhoff.opensource@gmail.com>,
 <srinivas.kandagatla@linaro.org>, <alexandre.belloni@bootlin.com>,
 <kuninori.morimoto.gx@renesas.com>, <jiaxin.yu@mediatek.com>,
 <alsa-devel@alsa-project.org>, <chrome-platform@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 34/38] ASoC: rt1308-sdw: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:01 +0100
Message-ID: <20220504170905.332415-35-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 3MJRWWDKVbOLR2bSfAfns-UWExb4VeVO
X-Proofpoint-GUID: 3MJRWWDKVbOLR2bSfAfns-UWExb4VeVO
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101101_361678_AF6A2297 
X-CRM114-Status: GOOD (  13.82  )
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

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over a SoundWire DAI and as such
should have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1308-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 1ef836a68a56f..1c11b42dd76e0 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -615,6 +615,7 @@ static const struct snd_soc_component_driver soc_component_sdw_rt1308 = {
 	.num_dapm_widgets = ARRAY_SIZE(rt1308_dapm_widgets),
 	.dapm_routes = rt1308_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(rt1308_dapm_routes),
+	.endianness = 1,
 };
 
 static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
