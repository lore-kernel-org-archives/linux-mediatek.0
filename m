Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C77C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUCXX3qywTmH1/iTn+Vhans2ufli5Vw7rjPGGMD4pM0=; b=wnjPqnK3RzKh2tZXzOv+md+mVh
	7P13gGvS2zQ/8SnLEusJWuzT0KVVfix/FpuOUQC87JhkFbkRw/5RgGqzGA5WZy2r8y5ZP62ZA2mZ6
	wRMLkbaikiAn4v1N27vr/UAgGN6lkEFXS8fxggi1soHZ8Ey1KCJVh1rVNyFomhhvUFteJKhFfWTYk
	xZpMIwS4hfz82N3nSCY7/fRGwVW9tGcIgBigJyrN0yD9PlF36nva60TTNDbu9ACpNq30folAAeA5V
	GQ7dZYniPCG74Jk34Kze3DPYGy6uM27rgrvXT49JnUs9HPYputv/g79FWzbter8uhQkPh7kOCirmA
	nUDY1hRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFrU-009jFm-0y;
	Wed, 17 May 2023 12:02:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFrR-009jEt-0V;
	Wed, 17 May 2023 12:02:30 +0000
X-UUID: af3af8acf4aa11ed912e1518a6540028-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EUCXX3qywTmH1/iTn+Vhans2ufli5Vw7rjPGGMD4pM0=;
	b=iiIwG5y1fQM/wo/UR4SD81cMILUd+ZDD6rhc9+pA52HrPUXIErd6zhrs7+mJTRqA1FcRMeQnTMwy8GIZJtK3AFsDdH2PC4eOsgSnT7YCz+zgqm1zlGotjuYV0443fyAaoHC9pQRwaxmZ/l4H2abj5lHf4u1JQEo3zDmMF5cvkAo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:3dc67d1e-87fa-46cb-8368-93e6c2bbaa56,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d5b0ae3,CLOUDID:fdfa1e6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: af3af8acf4aa11ed912e1518a6540028-20230517
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 740905599; Wed, 17 May 2023 05:02:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:52:20 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND 3/4] ASoC: mediatek: mt6359: add mtkaif gpio setting
Date: Wed, 17 May 2023 19:52:18 +0800
Message-ID: <20230517115219.532-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517115219.532-1-trevor.wu@mediatek.com>
References: <20230517115219.532-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_050229_202855_8C34657D 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mtkaif gpio driving to increase signal strength and smt setting to
prevent from overshooting.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 65e6d4d08b6a..a37ad61a8253 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -18,6 +18,20 @@
 
 #include "mt6359.h"
 
+static void mt6359_set_gpio_smt(struct mt6359_priv *priv)
+{
+	/* set gpio SMT mode */
+	regmap_update_bits(priv->regmap, MT6359_SMT_CON1, 0x3ff0, 0x3ff0);
+}
+
+static void mt6359_set_gpio_driving(struct mt6359_priv *priv)
+{
+	/* 8:4mA(default), a:8mA, c:12mA, e:16mA */
+	regmap_update_bits(priv->regmap, MT6359_DRV_CON2, 0xffff, 0x8888);
+	regmap_update_bits(priv->regmap, MT6359_DRV_CON3, 0xffff, 0x8888);
+	regmap_update_bits(priv->regmap, MT6359_DRV_CON4, 0x00ff, 0x88);
+}
+
 static void mt6359_set_playback_gpio(struct mt6359_priv *priv)
 {
 	/* set gpio mosi mode, clk / data mosi */
@@ -2745,6 +2759,8 @@ static int mt6359_codec_init_reg(struct snd_soc_component *cmpnt)
 			   0x1 << RG_AUDLOLSCDISABLE_VAUDP32_SFT);
 
 	/* set gpio */
+	mt6359_set_gpio_smt(priv);
+	mt6359_set_gpio_driving(priv);
 	mt6359_reset_playback_gpio(priv);
 	mt6359_reset_capture_gpio(priv);
 
-- 
2.18.0


