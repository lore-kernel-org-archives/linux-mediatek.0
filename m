Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2D8C56202
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 07:59:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB4522460
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 07:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="URYOoKAC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KIIeZmdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CB4522460
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3GWlsKwZRPkxyYhAcn3wxzy/RYuH78qn57/JJ4aBwww=; b=URYOoKAC5VCmLvGCfMO1KgBfW
	Su/Ptj2rcYAA8JbbrddMWiiMb4lUAbse907RBb0FZ8e3xEw5tt9yaI0yQTAtkMBUdBgbJz7U0pHFv
	xjCunj4nDkV985sgNs9kaUhtUClRbjlcRtPDrrFZ3PqkgS+MjhRn9/JHAhXuCjLnuXvS816t+bbt8
	DqidnS6XdJcaTSv61CV5w5UNgJUL7imlhZCQQ1Niv2UY3zskDxpeNaqNC6nav4YuNs8RnvhQ/eGyb
	hB39BpDvA65CJNRPZXQKULFKyWfISkVSnbvoTCf+diBxuYqJaMqLZWhGA4yNPRdhtXSAafGItk2gS
	1+3egOnnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWESS-0000C9-Br; Sat, 24 Oct 2020 07:59:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWESI-00009g-Va; Sat, 24 Oct 2020 07:59:16 +0000
X-UUID: 031f183836384e82b6c2222ff05d6037-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mmh69zsB78/vsXpVmVwPupU+Y766v5DSRCKKd4aud+0=; 
 b=KIIeZmdYyqyaQCEd5nM3dpup4vY94Sn3hD0S7HN27p5SR8Rc1r4swvsbBS5ki36tzrLnKZIVPbPW7MovK/vscteYBmr/sn9jZg3qv8jLaQnCs58CwsWY9/GgsiOVV3WVVFDZv40fTO3fO44GitV7E+mK3Btbqeoak3vf0cbuF6g=;
X-UUID: 031f183836384e82b6c2222ff05d6037-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1635116130; Fri, 23 Oct 2020 23:59:05 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 00:59:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 15:59:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 15:58:59 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 1/9] ASoC: mediatek: mt6359: add the calibration functions
Date: Sat, 24 Oct 2020 15:58:51 +0800
Message-ID: <1603526339-15005-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_035915_321092_CD469E5D 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the calibraion functions for initializing the codec when registering
the machine driver.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 110 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/mt6359.h |   7 +++
 2 files changed, 117 insertions(+)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index fa6d82be9c161..76a5ff74f8408 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -68,6 +68,38 @@ static void mt6359_reset_capture_gpio(struct mt6359_priv *priv)
 			   0x3 << 0, 0x0);
 }
 
+/* use only when doing mtkaif calibraiton at the boot time */
+static void mt6359_set_dcxo(struct mt6359_priv *priv, bool enable)
+{
+	regmap_update_bits(priv->regmap, MT6359_DCXO_CW12,
+			   0x1 << RG_XO_AUDIO_EN_M_SFT,
+			   (enable ? 1 : 0) << RG_XO_AUDIO_EN_M_SFT);
+}
+
+/* use only when doing mtkaif calibraiton at the boot time */
+static void mt6359_set_clksq(struct mt6359_priv *priv, bool enable)
+{
+	/* Enable/disable CLKSQ 26MHz */
+	regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON23,
+			   RG_CLKSQ_EN_MASK_SFT,
+			   (enable ? 1 : 0) << RG_CLKSQ_EN_SFT);
+}
+
+/* use only when doing mtkaif calibraiton at the boot time */
+static void mt6359_set_aud_global_bias(struct mt6359_priv *priv, bool enable)
+{
+	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON13,
+			   RG_AUDGLB_PWRDN_VA32_MASK_SFT,
+			   (enable ? 0 : 1) << RG_AUDGLB_PWRDN_VA32_SFT);
+}
+
+/* use only when doing mtkaif calibraiton at the boot time */
+static void mt6359_set_topck(struct mt6359_priv *priv, bool enable)
+{
+	regmap_update_bits(priv->regmap, MT6359_AUD_TOP_CKPDN_CON0,
+			   0x0066, enable ? 0x0 : 0x66);
+}
+
 static void mt6359_set_decoder_clk(struct mt6359_priv *priv, bool enable)
 {
 	regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON13,
@@ -122,6 +154,84 @@ static void mt6359_mtkaif_tx_disable(struct mt6359_priv *priv)
 			   0xff00, 0x3000);
 }
 
+void mt6359_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
+				int mtkaif_protocol)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	priv->mtkaif_protocol = mtkaif_protocol;
+}
+EXPORT_SYMBOL_GPL(mt6359_set_mtkaif_protocol);
+
+void mt6359_mtkaif_calibration_enable(struct snd_soc_component *cmpnt)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	mt6359_set_playback_gpio(priv);
+	mt6359_set_capture_gpio(priv);
+	mt6359_mtkaif_tx_enable(priv);
+
+	mt6359_set_dcxo(priv, true);
+	mt6359_set_aud_global_bias(priv, true);
+	mt6359_set_clksq(priv, true);
+	mt6359_set_topck(priv, true);
+
+	/* set dat_miso_loopback on */
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK_SFT,
+			   1 << RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK_SFT,
+			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG1,
+			   RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_MASK_SFT,
+			   1 << RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_SFT);
+}
+EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_enable);
+
+void mt6359_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	/* set dat_miso_loopback off */
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK_SFT,
+			   0 << RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK_SFT,
+			   0 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG1,
+			   RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_MASK_SFT,
+			   0 << RG_AUD_PAD_TOP_DAT_MISO3_LOOPBACK_SFT);
+
+	mt6359_set_topck(priv, false);
+	mt6359_set_clksq(priv, false);
+	mt6359_set_aud_global_bias(priv, false);
+	mt6359_set_dcxo(priv, false);
+
+	mt6359_mtkaif_tx_disable(priv);
+	mt6359_reset_playback_gpio(priv);
+	mt6359_reset_capture_gpio(priv);
+}
+EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_disable);
+
+void mt6359_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
+					 int phase_1, int phase_2, int phase_3)
+{
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_PHASE_MODE_MASK_SFT,
+			   phase_1 << RG_AUD_PAD_TOP_PHASE_MODE_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG,
+			   RG_AUD_PAD_TOP_PHASE_MODE2_MASK_SFT,
+			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
+	regmap_update_bits(priv->regmap, MT6359_AUDIO_DIG_CFG1,
+			   RG_AUD_PAD_TOP_PHASE_MODE3_MASK_SFT,
+			   phase_3 << RG_AUD_PAD_TOP_PHASE_MODE3_SFT);
+}
+EXPORT_SYMBOL_GPL(mt6359_set_mtkaif_calibration_phase);
+
 static void zcd_disable(struct mt6359_priv *priv)
 {
 	regmap_write(priv->regmap, MT6359_ZCD_CON0, 0x0000);
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index de66e49b17011..af5d8fa3be333 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -2638,4 +2638,11 @@ struct mt6359_priv {
 			   (type) == MIC_TYPE_MUX_DCC_ECM_DIFF || \
 			   (type) == MIC_TYPE_MUX_DCC_ECM_SINGLE)
 
+void mt6359_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
+				int mtkaif_protocol);
+void mt6359_mtkaif_calibration_enable(struct snd_soc_component *cmpnt);
+void mt6359_mtkaif_calibration_disable(struct snd_soc_component *cmpnt);
+void mt6359_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
+					 int phase_1, int phase_2, int phase_3);
+
 #endif/* end _MT6359_H_ */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
