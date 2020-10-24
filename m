Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C70EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 06:42:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D1A2225F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 06:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B2SgiYJ8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DtJH2YXm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5D1A2225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9XeXKdLIJ1FggsV9yN8Or8jV0NWVzDL50DwGl+7/5zk=; b=B2SgiYJ8YUJbvqZTqCqSVAQMs
	o4cjQjJIKHTbTTtuy1fJBZLgUIlI7s9wCO0FrF14FK9OX7rBHDdzduGpdGTyodLMXZ6ZszWLv8Xsi
	vk0NUCPgpe0J0c5m1LoQVMrNBASBhuY0bD//VaXkaBwlTKcZi8erQOQYf9NOIsxOLr/KeqIvSZDVL
	pxMLlgzdusGiXAzbCv7izCujoZOmvvJAFebP0qtRTvQz76fNRUrEWK7nIEo06XduPw8p5TAWriJYW
	VHLPjq6j3jdBT2kw2OdkNlKOquLmz7s8TKBbiEV9ZitQ7jkD55hCu2X534pQkWxQas2MBotLUNFqP
	EXGrxMgSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWDFN-0004dw-5c; Sat, 24 Oct 2020 06:41:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWDFI-0004dC-7o; Sat, 24 Oct 2020 06:41:46 +0000
X-UUID: 69d02474ade143f5804d245336363e22-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eMseszq2LMKp8DF0+brP69RgUkalkJoCAr4vCF2JXvY=; 
 b=DtJH2YXmsPm2gzH5NGJKRUoBbObKreRrOpkOTQ0oy21f94j1LEbyKEGLOFIQ7F58Ec2qF1/i5E0QZikU1EwOVOGWfWV3T6A271I1cd0gZNAdlFsytysbyCVN8IZQY3wAtapwG/8mxZZXMp4gVS7PhzjO9Vi+u/5/E9PXIYsvG1k=;
X-UUID: 69d02474ade143f5804d245336363e22-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1997008353; Fri, 23 Oct 2020 22:41:33 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 23:41:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 14:41:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 14:41:29 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <tiwai@suse.com>, <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning of
 DMIC recording
Date: Sat, 24 Oct 2020 14:41:25 +0800
Message-ID: <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_024144_441460_4ED12076 
X-CRM114-Status: GOOD (  18.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We can choose to drop away any length of data from the beginning according
to project needs. Some projects don't want to throw away any data, because
they want to use recorded data to do echo cancellation, so they have to
make sure that they are aligned with the reference data as much as
possible. Or there are other algorithms in the upper layer to eliminate
this noise. Or some projects want to eliminate this noise form the kernel
layer. However, the minimum recommended value is 50ms to skip pop noise.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 38 ++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/mt6359.h |  1 +
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 81aafb553bdd9..9a68656a9f731 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1276,6 +1276,29 @@ static int mt_mtkaif_tx_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int mt_ul_src_event(struct snd_soc_dapm_widget *w,
+			   struct snd_kcontrol *kcontrol,
+			   int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int time = priv->ul_delay_ms;
+
+	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* skip first time data to avoid recording pop noise */
+		if (time)
+			usleep_range(1000 * time, 1000 * (time + 1));
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int mt_ul_src_dmic_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol,
 				int event)
@@ -2050,9 +2073,8 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
 			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_SUPPLY_S("UL_SRC", SUPPLY_SEQ_UL_SRC,
-			      MT6359_AFE_UL_SRC_CON0_L,
-			      UL_SRC_ON_TMP_CTL_SFT, 0,
-			      NULL, 0),
+			      MT6359_AFE_UL_SRC_CON0_L, UL_SRC_ON_TMP_CTL_SFT,
+			      0, mt_ul_src_event, SND_SOC_DAPM_POST_PMU),
 
 	SND_SOC_DAPM_SUPPLY_S("UL_SRC_DMIC", SUPPLY_SEQ_UL_SRC_DMIC,
 			      SND_SOC_NOPM, 0, 0,
@@ -2062,7 +2084,7 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY_S("UL_SRC_34", SUPPLY_SEQ_UL_SRC,
 			      MT6359_AFE_ADDA6_UL_SRC_CON0_L,
 			      ADDA6_UL_SRC_ON_TMP_CTL_SFT, 0,
-			      NULL, 0),
+			      mt_ul_src_event, SND_SOC_DAPM_POST_PMU),
 
 	SND_SOC_DAPM_SUPPLY_S("UL_SRC_34_DMIC", SUPPLY_SEQ_UL_SRC_DMIC,
 			      SND_SOC_NOPM, 0, 0,
@@ -2674,6 +2696,14 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 		priv->mux_select[MUX_MIC_TYPE_2] = MIC_TYPE_MUX_IDLE;
 	}
 
+	ret = of_property_read_u32(np, "mediatek,ul-delay-ms",
+				   &priv->ul_delay_ms);
+	if (ret) {
+		dev_warn(priv->dev, "%s() failed to read ul-delay-ms\n",
+			 __func__);
+		priv->ul_delay_ms = 0;
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index 3792e534a91b6..de66e49b17011 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -2625,6 +2625,7 @@ struct mt6359_priv {
 	int ana_gain[AUDIO_ANALOG_VOLUME_TYPE_MAX];
 	unsigned int mux_select[MUX_NUM];
 	unsigned int dmic_one_wire_mode;
+	unsigned int ul_delay_ms;
 	int dev_counter[DEVICE_NUM];
 	int hp_gain_ctl;
 	int hp_hifi_mode;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
