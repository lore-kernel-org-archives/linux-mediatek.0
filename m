Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2723C00528
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jul 2023 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AGOYJf6IgitJjoa7VTj5ABs/QIt0Vp5FPUCdFNSDG0=; b=sTGAOVPzS3Nv+tOWVX7jmNm2i/
	LkPsQdVIxQLlBOSwhPoU5UFeshQ7ERzciSsyW5w+v7Io7pp7Zv7Y8zQJpvRULY2qMKspFPIjixqxd
	PAVDloylnUvCBS3T2fXmyyRBSv7UzuXC8qVHlwaN+yXHbaWo8A1MRnmZ0zS7jqepigLF8BBKudvpq
	5g0Km6SvukcdJsGgsv+WJYwa3ZlpxqELvfqSZnFj00t2vUPajXIMB8MCRUjzPIjehZIzGrUOHRZzM
	AgkJZgmFoKysHjIRJxC+/PH53eCUE4whIUiLFGa2Y5aRMdU+iXUyY1I3sesCvSFq3fwGgjAUoCxSj
	Zllsl66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQAqR-00CMYG-2w;
	Sun, 30 Jul 2023 18:08:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQAq4-00CMNx-2E;
	Sun, 30 Jul 2023 18:08:22 +0000
X-UUID: 0a9199522f0411ee83ed1395ce914268-20230730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7AGOYJf6IgitJjoa7VTj5ABs/QIt0Vp5FPUCdFNSDG0=;
	b=c/AbBvDmT1rZ4r8WplLNxxdFrimMcbieanc99EULugTYc1uOGz23ALQ4fMaKzhKMyPS7lPw1Dc2ZcXHV2RUlhx2mYvHq6o5JpenxrUu97ghUDK2cl0q7RAsF5T4ATHbremhBnabv/TVvDWfT/wcZZnI2ixLkve7DyM+e9pDoqdM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:6e6bdf39-1c44-4a72-a976-e8dcdeb2f254,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.30,REQID:6e6bdf39-1c44-4a72-a976-e8dcdeb2f254,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:1fcc6f8,CLOUDID:4de79c42-d291-4e62-b539-43d7d78362ba,B
	ulkID:230731020810SF827MI0,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 0a9199522f0411ee83ed1395ce914268-20230730
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1672161951; Sun, 30 Jul 2023 11:08:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 31 Jul 2023 02:08:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 31 Jul 2023 02:08:06 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
	<Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
	<angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
CC: <chunxu.li@mediatek.com>, <ajye_huang@compal.corp-partner.google.com>,
	<allen-kh.cheng@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [v3 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Date: Mon, 31 Jul 2023 02:08:01 +0800
Message-ID: <20230730180803.22570-2-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_110820_729990_F9803F77 
X-CRM114-Status: GOOD (  19.59  )
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

If the speaker and hdmi are connect to the same port of I2S,
when try to switch to speaker playback, we will find that hdmi
is always turned on automatically. The connection as follows:

			==> hdmi-codec ==> it6505(HDMI output)
DL1(FE) ==> I2S3(BE)
			==> rt1015p(SPEAKER output)

So in order to separately control their power on/off, we have
added a dapm widget to notify each output. Also the machine driver
need add a _PIN_SWITCH() on the output of the device that will
cause DAPM to keep the device powered down when not in use.

The purpose of adding .trigger callback here is to enable hdmi-codec
to notify the dp output driver to power on or off device.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 include/sound/hdmi-codec.h    |  6 ++++++
 sound/soc/codecs/hdmi-codec.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 9b162ac1e08e..ea834a838754 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -81,6 +81,12 @@ struct hdmi_codec_ops {
 		       struct hdmi_codec_daifmt *fmt,
 		       struct hdmi_codec_params *hparms);
 
+	/*
+	 * PCM trigger callback.
+	 * Optional
+	 */
+	int (*trigger)(struct device *dev, int cmd);
+
 	/*
 	 * Shuts down the audio stream.
 	 * Mandatory
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d21f69f05342..6766b55c9b56 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -276,7 +276,31 @@ struct hdmi_codec_priv {
 	u8 iec_status[AES_IEC958_STATUS_SIZE];
 };
 
+static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (hcp->hcd.ops->trigger)
+			hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_START);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (hcp->hcd.ops->trigger)
+			hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_STOP);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
+	SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0, hdmi_tx_event,
+			       SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_OUTPUT("TX"),
 	SND_SOC_DAPM_OUTPUT("RX"),
 };
@@ -831,9 +855,13 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	struct hdmi_codec_daifmt *daifmt;
 	struct snd_soc_dapm_route route[] = {
 		{
-			.sink = "TX",
+			.sink = "SDB",
 			.source = dai->driver->playback.stream_name,
 		},
+		{
+			.sink = "TX",
+			.source = "SDB",
+		},
 		{
 			.sink = dai->driver->capture.stream_name,
 			.source = "RX",
@@ -848,7 +876,7 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 		if (!route[i].source || !route[i].sink)
 			continue;
 
-		ret = snd_soc_dapm_add_routes(dapm, &route[i], 1);
+		ret = snd_soc_dapm_add_routes(dapm, route, ARRAY_SIZE(route));
 		if (ret)
 			return ret;
 	}
-- 
2.25.1


