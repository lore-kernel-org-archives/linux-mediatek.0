Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF5FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAdSncXkg3PClc+pU22kY75ftCqe99yWq4bEWtZDZRM=; b=JP9n5aCiZogfv2
	JgU/ioxBd8FzhIkfweSfALIOtKEbW3msnJVF0EnvQg/SMN60Xks24ALHSwc4ltbKXQ+oR5c+oI6jb
	lEUaj83AGbhA7ftyAFKq+b08k+3QKrELF0Wk9M9fwin/+rSz+iiZh4eRZ7YDlDLqPnxY5XSfVw2n6
	yD0FNy1usC+H03OlrwQ6Pny4DcmeWXNMnZU/JAOiY8TuVarfA5auhPDj6upiUnpBQRnwPjqvInNDl
	pcWDCaOz++KqZw4UBNlQN8APF/4X/pnGJ94ywsMLH7arTNLcRGmQLTqjy6M/dgDDULDQg7i5R5yMO
	hVnDcrrta3iP1WiVEBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIX9-00BryG-1G; Wed, 04 May 2022 17:11:27 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWi-00BrUc-Q4
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:03 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446OEr9006119;
 Wed, 4 May 2022 12:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=5raYxtDJacX2KOJfus+7V2NUWKFlwOC+Ly5LEzh1+JQ=;
 b=eeIuPxIj5JCKBQ5PWJ+KeFFjNPkvIy+OHEuwhpuq+a0QcUpeLILDFpHnwWpokTfnagyJ
 ZvlIcHEJCFj0Lr7cq003nmHSzVvoBIr9TNuQQvHDWwNoDm6vIjwwfh93+8Fk/LZDLKV/
 Vkm+qKPuhTARKpaPTN/tbZgDLi6HsUxSSPA4SqAoMumtRh0T6sRKDiBkoV7Cym9bxR0J
 DRMKarKz59YH1ZDP4M4iBQEqH/hPKMdraofwBQbPVzys1lo3xAFUBADCXVhV//16PYW7
 VYudJaB8ciIN78S1ikQRhWpHhX1REIAOmOPh2VGkG1AR8QfUo/fm0Cy/8TgEjL1IzivV 8w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxsh-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 617F711D4;
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
Subject: [PATCH 37/38] ASoC: wsa881x: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:04 +0100
Message-ID: <20220504170905.332415-38-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: m1aE7ehNgRCZUMkZFSl3HA2hdtMljJim
X-Proofpoint-GUID: m1aE7ehNgRCZUMkZFSl3HA2hdtMljJim
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101101_121849_A1CAFD7D 
X-CRM114-Status: GOOD (  13.83  )
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
 sound/soc/codecs/wsa881x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 616b26c70c3b2..f3a56f3ce4871 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1066,6 +1066,7 @@ static const struct snd_soc_component_driver wsa881x_component_drv = {
 	.num_dapm_widgets = ARRAY_SIZE(wsa881x_dapm_widgets),
 	.dapm_routes = wsa881x_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(wsa881x_audio_map),
+	.endianness = 1,
 };
 
 static int wsa881x_update_status(struct sdw_slave *slave,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
