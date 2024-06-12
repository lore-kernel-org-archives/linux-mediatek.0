Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F80C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lFva8B6gp3ExQoZEXAzokC/lEp9q82UBvksUzqGmJOc=; b=eQhAbatUFOLAOxJ9hRDiv66B9L
	xb9fVUjyBUc9b9DXztAysadDoVF5chtRtfsVvCT5dJBWVQL7W56HGlTSwWEQS0WWkI7JtKVIChrwt
	D161dIQzw2s1Itf00PSLFhHKVuh6psf7tJQsMOar+TkQtDuw10tIkO7ySn5sNWT7Qyg2XN5HiHlPQ
	/6a8wiRY1xhp7zaJ6tyElq3Xw6p98TUAKKohn+APYdwqJ5vJupT5YjIefNDQJTN47huzb5DYZ8Fzo
	j1BFO4ORY/hClgJLPMlnxRgtK13rvgtSvqJ3i+BGjIKADyJMPdOp3YnybxRDYYZotSsXFttaU1Y3j
	KgkM9UAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKUf-0000000C2o7-2e7y;
	Wed, 12 Jun 2024 09:42:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKUd-0000000C2nV-0wP6;
	Wed, 12 Jun 2024 09:42:12 +0000
X-UUID: 07e35bdc28a011efaf04eb0598667787-20240612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lFva8B6gp3ExQoZEXAzokC/lEp9q82UBvksUzqGmJOc=;
	b=Lm6MbmcCsEsp7KzwpZ4FRwQCmCDrqRkNvluMBnpb3lUKbmXm9BBBlKeDCJS8fpMiU8m368YXEgjJ0+vmaM6JennViJEep1KwVgOeVbLsBwrH6ckeSb73mgn4FS+IUvn+llD7CUHFnI5B38NT1M+XC0Rk1vkTT5WpmVdzMYjVduo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:da6b16b1-1e54-49f6-9de8-ba9d7fc8ab72,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:b0957c44-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 07e35bdc28a011efaf04eb0598667787-20240612
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1809961407; Wed, 12 Jun 2024 02:42:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jun 2024 17:42:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 17:42:03 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt6358: Add "Dmic Mode Switch" kcontrol for switch DMIC mode.
Date: Wed, 12 Jun 2024 17:41:55 +0800
Message-ID: <20240612094155.23354-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_024211_299271_7EB1A370 
X-CRM114-Status: GOOD (  12.09  )
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

There are two hardware connection methods for DMICs on the MT6358. In cases
where more than two DMICs are used, we need to time-multiplex these DMICs.
Therefore, we need to dynamically switch the modes of these DMICs based on
the actual usage scenarios.

            ---- DMIC1
AU_VIN0 ---
            ---- DMIC2

AU_VIN2 --- ----DMIC3

When we want to use DMIC1/2, configure it to one-wire mode. When we want to
use DMIC1/3, configure it to two-wire mode.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/mt6358.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 0284e29c11d3..3623e2a38423 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -577,6 +577,36 @@ static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int mt6358_dmic_mode_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+
+	ucontrol->value.integer.value[0] = priv->dmic_one_wire_mode;
+	dev_dbg(priv->dev, "%s() dmic_mode = %d", __func__, priv->dmic_one_wire_mode);
+
+	return 0;
+}
+
+static int mt6358_dmic_mode_set(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+	int enabled = ucontrol->value.integer.value[0];
+
+	if (priv->dmic_one_wire_mode != enabled) {
+		priv->dmic_one_wire_mode = enabled;
+		dev_dbg(priv->dev, "%s() dmic_mode = %d", __func__, priv->dmic_one_wire_mode);
+
+		return 1;
+	}
+	dev_dbg(priv->dev, "%s() dmic_mode = %d", __func__, priv->dmic_one_wire_mode);
+
+	return 0;
+}
+
 static const DECLARE_TLV_DB_SCALE(playback_tlv, -1000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 600, 0);
 
@@ -599,6 +629,9 @@ static const struct snd_kcontrol_new mt6358_snd_controls[] = {
 
 	SOC_SINGLE_BOOL_EXT("Wake-on-Voice Phase2 Switch", 0,
 			    mt6358_get_wov, mt6358_put_wov),
+
+	SOC_SINGLE_BOOL_EXT("Dmic Mode Switch", 0,
+			    mt6358_dmic_mode_get, mt6358_dmic_mode_set),
 };
 
 /* MUX */
-- 
2.25.1


