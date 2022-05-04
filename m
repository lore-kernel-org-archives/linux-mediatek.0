Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D28C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtMMydZKx4EwPiDI2nYkoGto52ffxRYyDj6M3RdeSus=; b=qib8+NN86ap5Gg
	kF/WuoFDJImlfs65w7VU1PjHiGBrZFGiFn/z/23TiMMR5q6zKbsgIi/PncPzPY1sq2kwNtugPHBTd
	pfxTyzQMdN5YWQY6Crbrt+Zn/BVL/JLyS4a94lQA3EdNml1dnYodLGPyqPj//pPqTguhXc34x6bzo
	HXJXTHbjmjPQvKIRtArT0f3U3JqZx0hXX3HwCWQFzZv1UZMgbCt5otKANIO/b1VUJuTHWCZQPAdta
	6AKQfDpTggpMsXO1fyXu+/LoOSIo3U561FenIaYRr5J6HYL6S0mK6UQoOdQ/RSpqfZBtvZHISA2AK
	7U5RqknOfWbXRsZiA8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIVv-00BqbP-Cm; Wed, 04 May 2022 17:10:11 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIVr-00BqZB-SN
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:09 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsA7021058;
 Wed, 4 May 2022 12:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=By/S9E1F2xzDnQr0GMOU8svqtPkdMZwDtBOpCYX22YI=;
 b=P5axK1PJRRmMLXiLDuM5I6/QF6U6cU96q/UggEL7PNf+JXq/3R/JdLewpNvarZhPRXbY
 3sJkC0+bDBzlZMFd67dM7I4GcpmZ7BB5zrTlrAspn5Sg3HdppL1GJ8X4wpCwDC7qgxdS
 fc5FCAtUlfsvjsDRX+88Nvj7qaaozd1HB76/soHKqCNaH4EQRIHmFJ+pDWZT9eY+StZR
 xmbJgpzua6qj2rAkYH20G9x2s7Z0LCvlW1vgaEsccbX7epKHenM4c0qrXIv7ie/JHNjB
 Re4ERFHsvkTFLsNhuvn0PzidrqJtNXEKklUEbeoIXR0ycF116pBGwp24bMtYdYuWYcgn TA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:10 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6DA35B10;
 Wed,  4 May 2022 17:09:05 +0000 (UTC)
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
Subject: [PATCH 04/38] ASoC: cs4270: Remove redundant big endian formats
Date: Wed, 4 May 2022 18:08:31 +0100
Message-ID: <20220504170905.332415-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: w8jsU8o_xUE6YpioPdqlGirmYJgEPoSv
X-Proofpoint-GUID: w8jsU8o_xUE6YpioPdqlGirmYJgEPoSv
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101008_079541_B908C22F 
X-CRM114-Status: GOOD (  14.70  )
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

The CODEC already provides the endianness flag on its
snd_soc_component_driver structure, specifying it is ambivalent
to endian. The core will expand the formats to cover both
endian types, as such remove the redundant specification of both
endians.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs4270.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 07cac01f87bdc..531f63b015547 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -32,18 +32,9 @@
 #include <linux/gpio/consumer.h>
 #include <linux/of_device.h>
 
-/*
- * The codec isn't really big-endian or little-endian, since the I2S
- * interface requires data to be sent serially with the MSbit first.
- * However, to support BE and LE I2S devices, we specify both here.  That
- * way, ALSA will always match the bit patterns.
- */
-#define CS4270_FORMATS (SNDRV_PCM_FMTBIT_S8      | \
-			SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_S16_BE  | \
-			SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE | \
-			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE | \
-			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE | \
-			SNDRV_PCM_FMTBIT_S24_LE  | SNDRV_PCM_FMTBIT_S24_BE)
+#define CS4270_FORMATS (SNDRV_PCM_FMTBIT_S8      | SNDRV_PCM_FMTBIT_S16_LE  | \
+			SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 /* CS4270 registers addresses */
 #define CS4270_CHIPID	0x01	/* Chip ID */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
