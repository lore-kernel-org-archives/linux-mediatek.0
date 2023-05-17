Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F855C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwKjF0dgzn4sw9jpbPBz5pPHmhzAFBmOncmAdxxMpSI=; b=O7iG2QsCsgflEF9eiPUgpJnuhF
	KvwPKsWUJ8rFAkg4ifqESw//z7p4r/e93OIKSGF6mYZO/UMZfNDu7uMuKFZbu1mau8C328DeoY5Ym
	GigYZAbT13eWZmIW0QGlZ4erRuxqgGDONGL8ANv32t4ItN0iyp2ti9Wb4ujm0K3VTzb8FZr7tm+DO
	vmnKh92++vtAPuNlfCb3esg7Om+NS3FxTp6+sC6dpjiScyWBLSkZbldQIbNO44inyOET3syPAAgnQ
	ny/GfqhCQKyDIhPyRjS7Ugej9QrR16Mbb6QI45uD/Ez7/ZvS5PkqAGCrvh9QMaNMsEeV+dujWhphh
	R4/DHQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8N-009ZPW-1a;
	Wed, 17 May 2023 11:15:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8H-009ZM7-0o;
	Wed, 17 May 2023 11:15:50 +0000
X-UUID: 272f18e0f4a411ed912e1518a6540028-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wwKjF0dgzn4sw9jpbPBz5pPHmhzAFBmOncmAdxxMpSI=;
	b=In0Hu4YuoBIhqfB9NYjBci5iTL+8KBpVSuk7LCvYwtvcGEuTMyQl/xsFdZSxD71D6/4Sp7+94Doznoeig3AGeui01eqXa5csERSktEPm6oIzcd7tl+nLXXDCHgFol0NsYVYzrRDQQJ6ZnMfSPy3JJLVtjPnXL51/QNBsr8LmHtM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:3fe85fab-8fdb-41c7-b6c9-929a606448de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:967825c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 272f18e0f4a411ed912e1518a6540028-20230517
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 299597845; Wed, 17 May 2023 04:15:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:15:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:15:36 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 3/5] ASoC: mediatek: common: soundcard driver add dai_fmt support
Date: Wed, 17 May 2023 19:15:32 +0800
Message-ID: <20230517111534.32630-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517111534.32630-1-trevor.wu@mediatek.com>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_041549_321369_4D647C21 
X-CRM114-Status: GOOD (  19.37  )
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

There are two changes included in the patch.

First, add set_dailink_daifmt() function, so dai_fmt can be updated by
the configuration in dai-link sub node.

Second, remove codec phandle from required property in dai-link sub node.
For example, user possibly needs to update dai-format for all etdm
co-clock dai-links, but codec doesn't need to be specified in capture
dai-link for a speaker amp.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 738093451ccb..5e291092046b 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -22,7 +22,7 @@ static int set_card_codec_info(struct snd_soc_card *card,
 
 	codec_node = of_get_child_by_name(sub_node, "codec");
 	if (!codec_node)
-		return -EINVAL;
+		return 0;
 
 	/* set card codec info */
 	ret = snd_soc_of_get_dai_link_codecs(dev, codec_node, dai_link);
@@ -36,6 +36,47 @@ static int set_card_codec_info(struct snd_soc_card *card,
 	return 0;
 }
 
+static int set_dailink_daifmt(struct snd_soc_card *card,
+			      struct device_node *sub_node,
+			      struct snd_soc_dai_link *dai_link)
+{
+	unsigned int daifmt;
+	const char *str;
+	int ret;
+	struct {
+		char *name;
+		unsigned int val;
+	} of_clk_table[] = {
+		{ "cpu",	SND_SOC_DAIFMT_CBC_CFC },
+		{ "codec",	SND_SOC_DAIFMT_CBP_CFP },
+	};
+
+	daifmt = snd_soc_daifmt_parse_format(sub_node, NULL);
+	if (daifmt) {
+		dai_link->dai_fmt &= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+		dai_link->dai_fmt |= daifmt;
+	}
+
+	/*
+	 * check "mediatek,clk-provider = xxx"
+	 * SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK area
+	 */
+	ret = of_property_read_string(sub_node, "mediatek,clk-provider", &str);
+	if (ret == 0) {
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(of_clk_table); i++) {
+			if (strcmp(str, of_clk_table[i].name) == 0) {
+				dai_link->dai_fmt &= ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+				dai_link->dai_fmt |= of_clk_table[i].val;
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
 int parse_dai_link_info(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -67,6 +108,12 @@ int parse_dai_link_info(struct snd_soc_card *card)
 			of_node_put(sub_node);
 			return ret;
 		}
+
+		ret = set_dailink_daifmt(card, sub_node, dai_link);
+		if (ret < 0) {
+			of_node_put(sub_node);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.18.0


