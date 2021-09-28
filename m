Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD8BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 06:35:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F13C061159
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 06:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F13C061159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/3mL9OG06Su6jRGnvKNoK99juZKcC36CjzvPuJJcaCg=; b=AMerOfppqhAUNe
	iCakltQ27vFe/ACsxei1Jknr8AbSg/miFpRTi8668SOxr12528J+hoiU+ZRBD9/5EPf30unaynxEy
	L8sFGrlMg/hOdEnncU3hT7L0j1ziDyzNnpb4ShwBBDI4JCt0xJ8RMneu6eO79nuaHAOySkZ4dqrx+
	Sk2OXC0CsOKiI1nUcaEtfIvHQTUpEoFIK1XujYU4y2g8h5jf7iFp+CL204tBBplqZY0XE6PebuCtE
	G39qUZ7ltN1B+iTZzVz4h/35POIgPd8EtE4rZi4u+XZBr4cxjvHDj7EmLP3v/n/wAZcHXH4eYgTNR
	oJgkH71GmtwaDA/Lehuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV6iC-005ro3-OL; Tue, 28 Sep 2021 06:35:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV6i9-005rmW-M0; Tue, 28 Sep 2021 06:35:31 +0000
X-UUID: 9704214aee4a4e4287f80c7bddb13546-20210927
X-UUID: 9704214aee4a4e4287f80c7bddb13546-20210927
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1756236722; Mon, 27 Sep 2021 23:35:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 23:35:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 28 Sep 2021 14:35:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Sep 2021 14:35:21 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <cuibixuan@huawei.com>,
 <bicycle.tsai@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8195: add missing of_node_put in probe
Date: Tue, 28 Sep 2021 14:35:20 +0800
Message-ID: <20210928063520.23927-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_233529_752096_886C56E6 
X-CRM114-Status: GOOD (  13.49  )
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

dp node and hdmi node are retrieved from of_parse_phandle(), so using
of_node_put() on them before return.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index a3fa8efc8f81..cb15467e5fc5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -995,6 +995,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
 	struct device_node *platform_node;
+	struct device_node *dp_node;
+	struct device_node *hdmi_node;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv = NULL;
 	int ret, i;
@@ -1013,12 +1015,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 			dai_link->platforms->of_node = platform_node;
 
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
-			dai_link->codecs->of_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,dptx-codec", 0);
-			if (!dai_link->codecs->of_node) {
+			dp_node = of_parse_phandle(pdev->dev.of_node,
+						   "mediatek,dptx-codec", 0);
+			if (!dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
+				dai_link->codecs->of_node = dp_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
@@ -1026,12 +1028,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		}
 
 		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
-			dai_link->codecs->of_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,hdmi-codec", 0);
-			if (!dai_link->codecs->of_node) {
+			hdmi_node = of_parse_phandle(pdev->dev.of_node,
+						     "mediatek,hdmi-codec", 0);
+			if (!hdmi_node) {
 				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
 			} else {
+				dai_link->codecs->of_node = hdmi_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
@@ -1041,8 +1043,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
-		of_node_put(platform_node);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out;
 	}
 
 	snd_soc_card_set_drvdata(card, priv);
@@ -1052,6 +1054,9 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 
+out:
+	of_node_put(hdmi_node);
+	of_node_put(dp_node);
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
