Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85191C388F2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:26:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC6220658
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FU+rcD8V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QNzkgo5t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC6220658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D28vJrzcu8cVGfrH1gWzgelXTY/z0myzBmZFxIL5HcE=; b=FU+rcD8VFrxvifhh1ikFcalSGT
	qOKfjpqMG/dLDl4Yio9gAG0AtM+6ivsvHjwyq1zyty3Iv+tIyRM0sk46eraboOOYufQ/dFw3lvRDD
	DSRMPUQHjM/jAwFtveRKJAew4kw+w2pqWRb6bwUPZmJpsVSJ4rte9zfuFbYuIafOKDNnE9UKXfBi1
	DGJIbItZPps3vt/twjBf8JSVw+ThbuoH5pgEXEf3aBNvq6LVJXreRDntD79hZ7D1biRjyOruU2QVh
	rotMtTHVQ0CqAYQoCWYmVhIedc/vdWdP6ewZNRR1qjmcFM7scr6ZCf8cBUBjh00IMU24Y9lw6/abU
	G/Xfsy2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kavCT-0006UY-Qe; Fri, 06 Nov 2020 06:26:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavCR-0006Sl-Pl
 for linux-mediatek@lists.infradead.org; Fri, 06 Nov 2020 06:26:16 +0000
X-UUID: 481fc3a1235a4794854d65e106b34d2a-20201105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sJ8hUAsjVFZ0Ao15Y+fKFXWXgCQ7QwWuQ2Jr1guI4XQ=; 
 b=QNzkgo5tcHiXGyRTmKg5JQU7SeFhJxnpzRgCLopqYNKQDGor3DA4IYjyIhrNVz4u07wgkmKFkVpiq/l8SRFPSPPT8LTK4j0BqD9WIrnVjSjjMQH5wdiqKqEMFLT5T169T/fJdcUrn+E8DQHu6Iya3oJxT74gtnxpiKWoDEWMYqs=;
X-UUID: 481fc3a1235a4794854d65e106b34d2a-20201105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1205749912; Thu, 05 Nov 2020 22:19:52 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Nov 2020 22:19:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 14:19:33 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 6 Nov 2020 14:19:33 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Fix vaud18 power leakage of mt6359
Date: Fri, 6 Nov 2020 14:18:37 +0800
Message-ID: <1604643517-3527-1-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: DB50972989C26800FA4953F469746C73711B7D89010A16A1E136A054A6640E852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_012616_026510_AE411181 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

vaud18 is power of mt6359 audio path. It
should only enable when audio is used,
instead of in boot up stage.
Once mt6359 audio path is enabled or disabled,
vaud18 is controlled by using regulator in
supply widget "LDO_VAUD18". Due to vaud18 is
controlled by regulator instead of regmap,
the macro MT6359_LDO_VAUD18_CON0 is no used and
remove from mt6359.h.

Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 38 +++++++++++++++++++++++++++++---------
 sound/soc/codecs/mt6359.h |  6 ------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index d20c59a..52dabdc 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -724,6 +724,32 @@ static SOC_VALUE_ENUM_SINGLE_DECL(pga_3_mux_map_enum,
 static const struct snd_kcontrol_new pga_3_mux_control =
 	SOC_DAPM_ENUM("PGA 3 Select", pga_3_mux_map_enum);
 
+static int mt_vaud18_event(struct snd_soc_dapm_widget *w,
+			   struct snd_kcontrol *kcontrol,
+			   int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = regulator_enable(priv->avdd_reg);
+		if (ret)
+			dev_err(priv->dev, "regulator_enable err: %d\n", ret);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		ret = regulator_disable(priv->avdd_reg);
+		if (ret)
+			dev_err(priv->dev, "regulator_disable err: %d\n", ret);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int mt_sgen_event(struct snd_soc_dapm_widget *w,
 			 struct snd_kcontrol *kcontrol,
 			 int event)
@@ -1944,8 +1970,9 @@ static int mt_ncp_event(struct snd_soc_dapm_widget *w,
 			      MT6359_DCXO_CW12,
 			      RG_XO_AUDIO_EN_M_SFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY_S("LDO_VAUD18", SUPPLY_SEQ_LDO_VAUD18,
-			      MT6359_LDO_VAUD18_CON0,
-			      RG_LDO_VAUD18_EN_SFT, 0, NULL, 0),
+			      SND_SOC_NOPM, 0, 0,
+			      mt_vaud18_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_SUPPLY_S("AUDGLB", SUPPLY_SEQ_AUD_GLB,
 			      MT6359_AUDDEC_ANA_CON13,
 			      RG_AUDGLB_PWRDN_VA32_SFT, 1, NULL, 0),
@@ -2814,13 +2841,6 @@ static int mt6359_platform_driver_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->avdd_reg);
 	}
 
-	ret = regulator_enable(priv->avdd_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "%s(), failed to enable regulator!\n",
-			__func__);
-		return ret;
-	}
-
 	ret = mt6359_parse_dt(priv);
 	if (ret) {
 		dev_warn(&pdev->dev, "%s() failed to parse dts\n", __func__);
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index af6f07f..1dfb29a 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -135,11 +135,6 @@
 /* MT6359_DCXO_CW12 */
 #define RG_XO_AUDIO_EN_M_SFT				13
 
-/* LDO_VAUD18_CON0 */
-#define RG_LDO_VAUD18_EN_SFT				0
-#define RG_LDO_VAUD18_EN_MASK				0x1
-#define RG_LDO_VAUD18_EN_MASK_SFT			(0x1 << 0)
-
 /* AUD_TOP_CKPDN_CON0 */
 #define RG_VOW13M_CK_PDN_SFT				13
 #define RG_VOW13M_CK_PDN_MASK				0x1
@@ -2132,7 +2127,6 @@
 
 #define MT6359_DCXO_CW11				0x7a6
 #define MT6359_DCXO_CW12				0x7a8
-#define MT6359_LDO_VAUD18_CON0				0x1c98
 
 #define MT6359_GPIO_MODE0				0xcc
 #define MT6359_GPIO_MODE0_SET				0xce
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
