Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24569C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUCXX3qywTmH1/iTn+Vhans2ufli5Vw7rjPGGMD4pM0=; b=mk3NfMVcjWFclnYPioH3bVZ4fO
	eAFWEn5Y+0gGApWfXg/g8ROPZvbvuHa3W2WpFfvtnRmpeqEV1AF0thEHseKiwzEN6hSftSr8yGZs1
	/2OuSH5/qoE+WX7y2kBywnLZQYeEHmKYlNlQIGP548tySzIiF9nQH6rf3B8XBaC1oT5cHTSUxMkpC
	Kt9WBHCCqPg+Eqp9pz+BdPy/CTzFpkBLHJH2kOqFx7iwss2K40KfvTJeomIP/p/3S+WAbcvM69nNR
	6MTcSQfvrTNZ5pKBmdzlMFmi0Tbh7T0EqE1+SUVG2c4lxgkM6qfgrmzuShVJpzUoLh6N14swIeq40
	8n+MsSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvv65-00HT9l-0j;
	Mon, 08 May 2023 07:15:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvv5z-00HT68-33;
	Mon, 08 May 2023 07:15:45 +0000
X-UUID: 213e9bbced7011ed912e1518a6540028-20230508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EUCXX3qywTmH1/iTn+Vhans2ufli5Vw7rjPGGMD4pM0=;
	b=Vm8BMLmCyLlWtMy8f/EydN0jina2txEgJxgF8CKZElq0xTaFCQEnZzwZzBD/rNCR93e7EwD45g9kuGEcGZ4bsj26qGVULDnxXNE7IDwB06E8hhsAS/4kCqdIGcrREsCIdcJXXCA7pInGdpwrEiZMZyH7c8bYZcC5FthprtNgN30=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:817b81a4-b0d6-490b-ac91-c104399b2972,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.23,REQID:817b81a4-b0d6-490b-ac91-c104399b2972,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:697ab71,CLOUDID:4b55176b-2f20-4998-991c-3b78627e4938,B
	ulkID:230508151537I2X1F1CE,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 213e9bbced7011ed912e1518a6540028-20230508
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 677872203; Mon, 08 May 2023 00:15:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 May 2023 15:15:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 May 2023 15:15:34 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] ASoC: mediatek: mt6359: add mtkaif gpio setting
Date: Mon, 8 May 2023 15:15:31 +0800
Message-ID: <20230508071532.21665-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230508071532.21665-1-trevor.wu@mediatek.com>
References: <20230508071532.21665-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_001544_050584_99ECE67B 
X-CRM114-Status: UNSURE (   9.20  )
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


