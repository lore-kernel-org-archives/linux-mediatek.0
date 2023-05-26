Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FCEC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sd5yPw3/wE38i3l3MK8vJlooJQohfmtH9XPZpB48tMw=; b=SLgv0XJoq6zGm7DXDP5RSjfn7c
	4BT5v6NFoygiYbLyLOr7cNx504HdcTTne4wvugscI0kvbJ6t/NAcBJ3SE6kCr/GqPi2YUpPdLBHAy
	KGVP2n2kaA1g/3SeFBxdwjZG4+lZ65KzUpDPxBDx2kYxp6actrcJHXz2wKLSs6j0v7C5j3Uph1/yV
	jMcHAUikK27b5e3g1JVHZVMFL+PA2YaZXKxdXBDtrFovxzeVmTT5hsthjUsekjwIHKXvIdVQr2+kr
	g+ltu4S1o9gm5UV1xP63KDItKaW9DdrQSRvnMBHMWMUerOf8S4LNLi14KYltjedt6BlhdjK6CwRQ7
	ERCrv4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ToC-001odC-2d;
	Fri, 26 May 2023 09:32:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2To5-001oY6-0L;
	Fri, 26 May 2023 09:32:22 +0000
X-UUID: 3461e000fba811ed83ed1395ce914268-20230526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sd5yPw3/wE38i3l3MK8vJlooJQohfmtH9XPZpB48tMw=;
	b=ABJUaI4qzJl0b87wmJTU6NF1iZZ7J/oQobwyI+E6J0FZqE/UY2kstPqN3r7wzyFq1Z2sFowgI3Qr7LRf9zx4lxQyUohDKMEjxmlOGMdfzzowNR22zOwZqaOJaPYy+506h++FATDBdlMj9/TCbBMJcZ9H0OP3nuKxud3NtCeUuOQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:7471c9c8-cbe8-4a50-ae62-300359ecad32,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:74d0a53c-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 3461e000fba811ed83ed1395ce914268-20230526
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 910392427; Fri, 26 May 2023 02:32:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH v3 3/7] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack pins
Date: Fri, 26 May 2023 17:31:46 +0800
Message-ID: <20230526093150.22923-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230526093150.22923-1-trevor.wu@mediatek.com>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023221_148907_8F0EFEF7 
X-CRM114-Status: GOOD (  12.17  )
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

Some userspace applications need jack control events, so register hdmi
and dp jack pins to activate jack control events.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 27 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 833bc362dad2..6c3f36e2fffd 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -151,6 +151,20 @@ struct mt8188_mt6359_priv {
 	struct snd_soc_jack hdmi_jack;
 };
 
+static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
+	{
+		.pin = "HDMI",
+		.mask = SND_JACK_LINEOUT,
+	},
+};
+
+static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
+	{
+		.pin = "DP",
+		.mask = SND_JACK_LINEOUT,
+	},
+};
+
 struct mt8188_card_data {
 	const char *name;
 	unsigned long quirk;
@@ -159,6 +173,8 @@ struct mt8188_card_data {
 static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_SINK("HDMI"),
+	SND_SOC_DAPM_SINK("DP"),
 };
 
 static const struct snd_kcontrol_new mt8188_mt6359_controls[] = {
@@ -396,8 +412,10 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
-				    &priv->hdmi_jack);
+	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack",
+					 SND_JACK_LINEOUT, &priv->hdmi_jack,
+					 mt8188_hdmi_jack_pins,
+					 ARRAY_SIZE(mt8188_hdmi_jack_pins));
 	if (ret) {
 		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
@@ -417,8 +435,9 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
-	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
-				    &priv->dp_jack);
+	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+					 &priv->dp_jack, mt8188_dp_jack_pins,
+					 ARRAY_SIZE(mt8188_dp_jack_pins));
 	if (ret) {
 		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
-- 
2.18.0


