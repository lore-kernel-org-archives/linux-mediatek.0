Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9D0C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 07:46:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C68A7206CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 07:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFx3ih3U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RydD9tYz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C68A7206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kq8xgtJIvH2B8VZ2nrsgt/CaHC6n8g2s+2G49GcLQQ=; b=pFx3ih3UeBK+OVLoS05LMm7g8
	ftNWG/DYFD/7OIZzE6wszn8/xT51rtC8fr6+W/KFllVLzWKgFJOTS/PMDMu5gDSzVmE/h9GsZ51qw
	YlMFlFmsUChrksztkuXiP7yzsGmAduiXuDgAov/9ilVVUUTZi4Oy+s8PKZH4LiNa6l6TXroXTnIiz
	MfHap5ki1uO0s9Kh58clJ7TsyR1QePVfktgVLKQuj+7arFTCCERLp7j7/0mIBo7wpgI2U2pMpsaAp
	fHSLb2i1qxi/94mEu5ut0EhKcRNd3onsEvIJ1bBbAgQOKTUwE1uc2HNk/zCxcGtYKAqB30SmYrXvG
	DVPq5T9bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOFlM-0001t4-B3; Fri, 02 Oct 2020 07:45:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOFlJ-0001sU-Sr; Fri, 02 Oct 2020 07:45:55 +0000
X-UUID: 27a2f2cf20cd4d55a87f988a3e4b8cad-20201001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kTHQciQweH5DttF+TUezJQjbZNqo/8aAV68ZqQL8PGU=; 
 b=RydD9tYz78IQdGfEpo8wGNpPvELw4JhYR58CtKuK23wSWqyj9uSUU9Q8RBtf4e8PkMx3TIyd0TgAseNUImYmLh0doIubANzzqdizE6lA7SSWw85Obo6hPVn4muuhewYfjgn61Jc5ShN6lnYGcnsjdKXsXv/ap/YHB+48s1lAn8o=;
X-UUID: 27a2f2cf20cd4d55a87f988a3e4b8cad-20201001
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 96458875; Thu, 01 Oct 2020 23:45:48 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Oct 2020 00:35:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Oct 2020 15:35:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Oct 2020 15:35:43 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/5] ASoC: mediatek: mt6359: add the calibration functions
Date: Fri, 2 Oct 2020 15:35:38 +0800
Message-ID: <1601624142-18991-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_034554_571226_0B14EC60 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 maowenan@huawei.com, kuninori.morimoto.gx@renesas.com
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
index 81aafb553bdd9..d20c59a875246 100644
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
index 3792e534a91b6..af6f07fbc4fd1 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -2637,4 +2637,11 @@ struct mt6359_priv {
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
