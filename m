Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA882C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pyg72ma9ld3lgcs+CM2rl+yTm/3RpknYzrM2C5NpMu8=; b=oLhrDhqAsZZ4IY
	R5+Xf73D7eQK+QImqPD0BmhWAUfSqE/m6sIpSDFPpJoOyUv39XNkl+YUYfUg+3zaeNIIbFVIeiV4h
	3qjASLm9hpb9z7fkJp+/NRXQ1fhotPwFMizqavOXkCArYdNtnAqB1leHT9Ba4ckaZdc0xaDk4/A3u
	DZN3+e/ekKAqIM8ckxFzp1DMXxrPEgxvb58ej4lPGGCYqXe5r8b2ZU3aYbU2IHixYmio3c8xFgakl
	MqvjjUX5i5BP5lJdUQZ6KWdEoTMgaAYggfm8RPCEkGMvJKnux4j6pJGSGDLHjeffer1MYW3bUm/FQ
	uFFHjNxMi9ukp57f9D4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWB-00Bqqi-1M; Wed, 04 May 2022 17:10:27 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIW1-00Bqgg-4n
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:19 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqB001835;
 Wed, 4 May 2022 12:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=5JiuIEhDikkLVhbBXJeyWEMF0IBNyZgZBo3sIH5tJZo=;
 b=XSPxP1eVJnbg1yCNfjFJ3x0XlX2h+RbUZLVRSXP2J+6sZd4v+bPWxU5qJJ/lB12TbPg7
 qUDFjKJ+g4ty93z1T75G+VYjiuKhw+tAJW0veuBWdqQgSz2VPCajaOg12JOQGYWmInzL
 s5/egzXpUOI7D+27qXb+pJPAO7MvMSik3qwDO9PbevS+K/isoWurQEN5UpevK8h501e1
 DLAnRldm8aS+7zzRcnEOJZ5eHE4/KZqqq2z7U3r7ILs+hwH8jpwZKZsb4fnWSvJQ+9jv
 gVt4EWZ6jULZvn+bnlLXhp0M0/oPmuKzT5LRpMglK28/SVXH1qcouTEPx0vf3MGh/Wvs HA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 073F611D3;
 Wed,  4 May 2022 17:09:06 +0000 (UTC)
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
Subject: [PATCH 14/38] ASoC: cs35l41: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:41 +0100
Message-ID: <20220504170905.332415-15-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 51Xi19Uu5Rj-DDfMBYfFGvQtEL-fE54J
X-Proofpoint-GUID: 51Xi19Uu5Rj-DDfMBYfFGvQtEL-fE54J
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101017_212124_ACEEB46F 
X-CRM114-Status: GOOD (  14.57  )
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
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 6b784a62df0ce..de6f96bd8daf4 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1113,6 +1113,8 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
 	.controls = cs35l41_aud_controls,
 	.num_controls = ARRAY_SIZE(cs35l41_aud_controls),
 	.set_sysclk = cs35l41_component_set_sysclk,
+
+	.endianness = 1,
 };
 
 static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_platform_data *pdata)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
