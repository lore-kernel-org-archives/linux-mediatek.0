Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55A4C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L+uHBH+GT44LFZu9z47mQWC0nQz60GKwD8yOpDVV1M=; b=Ju4eTk8oM9gQrjum2AtmvOt4Mv
	DT9/TjnwYtrG5Yn96NrNj6fdqmp3UejaZeWvgsXiP/vb0FSpTAbC/cWq71MfvVRx7/+8pNhHRbrWf
	I+I9YCpw6wef0zAP61tLL3PsijX7G6mgu8Wn4VHwv4wY8VLi2/6Uhj5u7kq0qKFfX1hp5B3luimgn
	/jwINEehlfyHf+qlM6vZ9Qw0vYXq48AnSe3UFeikI+EkAzJoHedfmNd0afIQU5SN/cgTAhqcn3tPI
	LVcj2CYY8T5Uctplo4Dz4UrVhExlZxOh55bjRh2vqVQOZLbmduRCIDL2U5m/Bwpwn7PPTOznrEU1u
	/Ylf5QJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ToO-001omR-1S;
	Fri, 26 May 2023 09:32:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ToI-001ogo-0O;
	Fri, 26 May 2023 09:32:35 +0000
X-UUID: 3b88eb12fba811ed83ed1395ce914268-20230526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6L+uHBH+GT44LFZu9z47mQWC0nQz60GKwD8yOpDVV1M=;
	b=U3H0e6V//cNH3j0GBvsvbdOT4Rh0CsCGOCQDSVDYFwXskADzhLoavtn3RPvYKppi5RQVnLD8Ydvs23Y0DrCiVIP88Fu3HN71resKWkfSkHoHZl2VgWuPX/cX7PBoJ/LYYgC6QPKV2biB3XKCyNSjN+qdKfgm6PK33qOVV/jOLMo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:30f6f076-bdab-4447-8b23-122be6705301,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:58131a6d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 3b88eb12fba811ed83ed1395ce914268-20230526
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1463061287; Fri, 26 May 2023 02:32:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 May 2023 17:31:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 May 2023 17:31:52 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <amergnat@baylibre.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 4/7] ASoC: mediatek: common: soundcard driver add dai_fmt support
Date: Fri, 26 May 2023 17:31:47 +0800
Message-ID: <20230526093150.22923-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230526093150.22923-1-trevor.wu@mediatek.com>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023234_166004_FB927824 
X-CRM114-Status: GOOD (  19.21  )
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
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 738093451ccb..a58e1e3674de 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -21,8 +21,10 @@ static int set_card_codec_info(struct snd_soc_card *card,
 	int ret;
 
 	codec_node = of_get_child_by_name(sub_node, "codec");
-	if (!codec_node)
-		return -EINVAL;
+	if (!codec_node) {
+		dev_dbg(dev, "%s no specified codec\n", dai_link->name);
+		return 0;
+	}
 
 	/* set card codec info */
 	ret = snd_soc_of_get_dai_link_codecs(dev, codec_node, dai_link);
@@ -36,6 +38,47 @@ static int set_card_codec_info(struct snd_soc_card *card,
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
@@ -67,6 +110,12 @@ int parse_dai_link_info(struct snd_soc_card *card)
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


