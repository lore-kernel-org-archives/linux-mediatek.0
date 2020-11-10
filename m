Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64E1C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 02:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2063C205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 02:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mHHvY+Fc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hOSthtkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2063C205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UcoYFrP4oaKkqFlIgQyyjLq1S0n7YrLPBxkcZ3rimNU=; b=mHHvY+FcogTkD4g2ncHH1exsZ
	eqF7wwVbRsKsHJnmoTQEGtLMwpdfPwCeqKA1WXXE4RxfS29nvo4cev0pMLBzaAxtCbgX31NcoYppw
	77X+ndzvJhjMqB5EF3KbdeAawtGsIFHQ41zsAt7mLgC8u/WewvqTuvxsipMgGF14dCfIQS05bTicz
	X32gOOrq8KYDGSGzC+NydRfnPr0gCMvE3LaLOqBYqau2Okuxs7A1jwmnzv6jcwW1UHbqXjOJ08LD/
	BNR3J7rKUrO5VrOwQ33W2ipS7HI57np4ko0/wsxamZFoYMplJ0kEKv59tVu3Rw7+4GYCfpY+ky45V
	8BzVSJvuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcJRo-0000PQ-P0; Tue, 10 Nov 2020 02:31:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcJRi-0000MX-5D
 for linux-mediatek@lists.infradead.org; Tue, 10 Nov 2020 02:31:48 +0000
X-UUID: 6585c7216fd7499e8ac0614f492b7f08-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GnfMW8jsJKJKjkxKfIW5PrpfQm7eCsYrh92o5wGt4tQ=; 
 b=hOSthtkL1UwF/lwrEYRsOYk9tPxHoIciUyxu00PV4gs/WDTRnmtKtC47fUfzr/90Nt3uovlhhxUJPXnGaLngHFep/K30Ugw7IwKeAOTssj4p++l1F8ZWQhaBt/GRIUNaPRyBctwU3pmWEe1HJbBe27D6ivQkd1l+uV1VUCicFtk=;
X-UUID: 6585c7216fd7499e8ac0614f492b7f08-20201109
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 583679734; Mon, 09 Nov 2020 18:31:42 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 18:31:40 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 10:31:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 10 Nov 2020 10:31:40 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH v3 1/2] ASoC: Fix vaud18 power leakage of mt6359
Date: Tue, 10 Nov 2020 10:31:31 +0800
Message-ID: <1604975492-6142-2-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604975492-6142-1-git-send-email-shane.chien@mediatek.com>
References: <1604975492-6142-1-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_213146_427765_8429D0C7 
X-CRM114-Status: GOOD (  14.86  )
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
vaud18 is controlled by regulator supply widget
"LDO_VAUD18". Due to vaud18 is controlled by
regulator dapm macro instead of regmap, the macro
MT6359_LDO_VAUD18_CON0 and variable avdd_reg
is no used and removed from mt6359.h.

Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
---
 sound/soc/codecs/mt6359.c |   25 +------------------------
 sound/soc/codecs/mt6359.h |    8 --------
 2 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index d20c59a..ecdfd57 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1943,9 +1943,7 @@ static int mt_ncp_event(struct snd_soc_dapm_widget *w,
 	SND_SOC_DAPM_SUPPLY_S("CLK_BUF", SUPPLY_SEQ_CLK_BUF,
 			      MT6359_DCXO_CW12,
 			      RG_XO_AUDIO_EN_M_SFT, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY_S("LDO_VAUD18", SUPPLY_SEQ_LDO_VAUD18,
-			      MT6359_LDO_VAUD18_CON0,
-			      RG_LDO_VAUD18_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("LDO_VAUD18", 0, 0),
 	SND_SOC_DAPM_SUPPLY_S("AUDGLB", SUPPLY_SEQ_AUD_GLB,
 			      MT6359_AUDDEC_ANA_CON13,
 			      RG_AUDGLB_PWRDN_VA32_SFT, 1, NULL, 0),
@@ -2807,20 +2805,6 @@ static int mt6359_platform_driver_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, priv);
 	priv->dev = &pdev->dev;
 
-	priv->avdd_reg = devm_regulator_get(&pdev->dev, "vaud18");
-	if (IS_ERR(priv->avdd_reg)) {
-		dev_err(&pdev->dev, "%s(), have no vaud18 supply: %ld",
-			__func__, PTR_ERR(priv->avdd_reg));
-		return PTR_ERR(priv->avdd_reg);
-	}
-
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
@@ -2841,13 +2825,6 @@ static int mt6359_platform_driver_remove(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "%s(), dev name %s\n",
 		__func__, dev_name(&pdev->dev));
 
-	ret = regulator_disable(priv->avdd_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "%s(), failed to disable regulator!\n",
-			__func__);
-		return ret;
-	}
-
 	return 0;
 }
 
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index af6f07f..35f806b 100644
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
@@ -2469,7 +2463,6 @@ enum {
 enum {
 	/* common */
 	SUPPLY_SEQ_CLK_BUF,
-	SUPPLY_SEQ_LDO_VAUD18,
 	SUPPLY_SEQ_AUD_GLB,
 	SUPPLY_SEQ_HP_PULL_DOWN,
 	SUPPLY_SEQ_CLKSQ,
@@ -2629,7 +2622,6 @@ struct mt6359_priv {
 	int hp_gain_ctl;
 	int hp_hifi_mode;
 	int mtkaif_protocol;
-	struct regulator *avdd_reg;
 };
 
 #define CODEC_MT6359_NAME "mtk-codec-mt6359"
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
