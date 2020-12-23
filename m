Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C69C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:18:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB712222D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB712222D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=32X3zni/+klh+otrYT5onZ7TRZfZ55JBacp8K1nvHvc=; b=k1L+Z0+LBxBFptFqkD2mPsJmk
	PL5v0daV5tbpNTkySsIMn77pnQ6JHN8lxbN81qYd7SQDA1Vdk1kUqOEiRN5PngXvZYQMWZJ/PDyGP
	/cnKGF4v0b/K3E84btm4v6Y0Ye3qyPRC0KrPpA66OBUld06MANPrO5G8G1OglRyrap5p4G7K4JOTp
	UenId+Bkw3m2KZ36OFdCAodyiIFDcP10oRa6/pff4eFpeb6fu3OAnMcUgqkxyyX+4XOuSGRZ71VIP
	d6fkNTt7CsFdrjGFp9JvNzj1eg1NFl2H3Ql+WZFBIkXPek0kP2I7DRO/O1u22BzRuXi/XRUNNayn8
	z0cBZGT1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtjB-0007bz-O9; Wed, 23 Dec 2020 02:18:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtit-0007So-3S; Wed, 23 Dec 2020 02:17:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D4FC22525;
 Wed, 23 Dec 2020 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689874;
 bh=XC57S2E/6U4A5BTFsO9yT2N0wDA1oFFu6630l6ZodHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WcoZfFV3p75rXr6N6LsuwkSTFhTjpEOwsP1ul/jF2LL3Tai3h4S3+cFPnzBjHxikO
 BA3IAQHz5qzPGbeyjl1vnc7LLNARuJ6VOVCGvMYKe/yjesBXMdm0nUIIRjs3SUbQ9H
 lm+1l3jQ6E9JlOOq3wHI5hg378SEkidxE4GRjbys3GvWNIG7t766I7pBymVFe7iLrm
 dnSxUAfN3TItNH8Oj49KgiVR5rIu/9HRGG3wBECDmZwbPaiEcnYaxlUYyF49wQ6cGR
 vStGsdSGV2rYAZw4h591yRtlo6xNmJaO01LtwDH0in2d1AlGK94XVPRdKBCtTpJPld
 h2xskRponlfIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 066/217] ASoC: Fix vaud18 power leakage of mt6359
Date: Tue, 22 Dec 2020 21:13:55 -0500
Message-Id: <20201223021626.2790791-66-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_211755_363932_C39CC104 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 "Shane.Chien" <shane.chien@mediatek.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

[ Upstream commit 64a70744b77898a15d7a5b2b4dc0fa9523a75cde ]

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
Link: https://lore.kernel.org/r/1604975492-6142-2-git-send-email-shane.chien@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/mt6359.c | 25 +------------------------
 sound/soc/codecs/mt6359.h |  8 --------
 2 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 81aafb553bdd9..64b26ab969ed8 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1833,9 +1833,7 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
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
@@ -2697,20 +2695,6 @@ static int mt6359_platform_driver_probe(struct platform_device *pdev)
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
@@ -2731,13 +2715,6 @@ static int mt6359_platform_driver_remove(struct platform_device *pdev)
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
index 3792e534a91b6..e0aebf639e461 100644
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
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
