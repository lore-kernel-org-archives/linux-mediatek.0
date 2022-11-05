Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B2FC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4sTT60tFhvVvkdJlkoRnV4vJdcHfpYoypJr9bb49Ng=; b=0sjvXvX2G3H7dV
	AhoeB+hCrw4WIdzu4aEPv8Zj9P8oCJGzNHkirtYXaWGNxY25jX9ldw+tw/xP8avPLIqbZ41cAfWuX
	JAM/1+z4aJZmDR/jRmZ7LiJ6ez1mksJV1neStXO+ExtWm2vZueNNow1UPMPBxcn3mynaZXJTVtfhJ
	iwwi3qxqJuoCslKhtGVHlbWeWeqae8mH3B+A/O0aaTIZdSxTSpiwpuJB5KnigLDYVMMU45i8RgS3X
	6ggS89uIzIm52xcZmUVt2JGQLK+eRXNqFkBtpsT2lzq85Q4lLZFb9uS60YTlls4ZcibjG053w/Fdt
	2+XYEBYc7bPwbQH/rAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orEs0-0068kj-Ge; Sat, 05 Nov 2022 08:49:40 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orErh-0068dv-Ke; Sat, 05 Nov 2022 08:49:23 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id A65CD404A4;
	Sat,  5 Nov 2022 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667638157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4sTT60tFhvVvkdJlkoRnV4vJdcHfpYoypJr9bb49Ng=;
	b=uB5uF+fp+BWBhaMoKGyQrauu4MLKANm5B4Gxe/tb+nSXMCYPOOgp++gsa8n/+bzFh4aAiS
	Uj4KqYuEURdeStfqi84Juki3ralRPdNd14TCizdSw0ZeuUakAnuK9Zrjch8jF0ayGG2Dsb
	c8z0zjCLvtb9OUNsowEGU0tZZ+oyvyg=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id DFCF31003E5;
	Sat,  5 Nov 2022 08:49:16 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/4] pinctrl: mediatek: extend pinctrl-moore to support new bias functions
Date: Sat,  5 Nov 2022 09:49:04 +0100
Message-Id: <20221105084905.9596-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221105084905.9596-1-linux@fw-web.de>
References: <20221105084905.9596-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b190883d-adf2-466d-9969-b5cbfa553c64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_014921_993576_3FAEB693 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

Commit fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
introduced SoC specify 'pull_type' attribute to mtk_pinconf_bias_set_combo
and mtk_pinconf_bias_get_combo, and make the functions able to support
almost all Mediatek SoCs that use pinctrl-mtk-common-v2.c.

This patch enables pinctrl_moore to support these functions.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 49 ++++++++++++++++++++----
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 526faaebaf77..cdc002d29932 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <dt-bindings/pinctrl/mt65xx.h>
 #include <linux/gpio/driver.h>
 #include "pinctrl-moore.h"
 
@@ -105,7 +106,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	u32 param = pinconf_to_config_param(*config);
-	int val, val2, err, reg, ret = 1;
+	int val, val2, err, pullup, reg, ret = 1;
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
@@ -114,7 +115,13 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		if (hw->soc->bias_disable_get) {
+		if (hw->soc->bias_get_combo) {
+			err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
+			if (err)
+				return err;
+			if (ret != MTK_PUPD_SET_R1R0_00 && ret != MTK_DISABLE)
+				return -EINVAL;
+		} else if (hw->soc->bias_disable_get) {
 			err = hw->soc->bias_disable_get(hw, desc, &ret);
 			if (err)
 				return err;
@@ -123,7 +130,15 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		}
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		if (hw->soc->bias_get) {
+		if (hw->soc->bias_get_combo) {
+			err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
+			if (err)
+				return err;
+			if (ret == MTK_PUPD_SET_R1R0_00 || ret == MTK_DISABLE)
+				return -EINVAL;
+			if (!pullup)
+				return -EINVAL;
+		} else if (hw->soc->bias_get) {
 			err = hw->soc->bias_get(hw, desc, 1, &ret);
 			if (err)
 				return err;
@@ -132,7 +147,15 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		}
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (hw->soc->bias_get) {
+		if (hw->soc->bias_get_combo) {
+			err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
+			if (err)
+				return err;
+			if (ret == MTK_PUPD_SET_R1R0_00 || ret == MTK_DISABLE)
+				return -EINVAL;
+			if (pullup)
+				return -EINVAL;
+		} else if (hw->soc->bias_get) {
 			err = hw->soc->bias_get(hw, desc, 0, &ret);
 			if (err)
 				return err;
@@ -235,7 +258,11 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
-			if (hw->soc->bias_disable_set) {
+			if (hw->soc->bias_set_combo) {
+				err = hw->soc->bias_set_combo(hw, desc, 0, MTK_DISABLE);
+				if (err)
+					return err;
+			} else if (hw->soc->bias_disable_set) {
 				err = hw->soc->bias_disable_set(hw, desc);
 				if (err)
 					return err;
@@ -244,7 +271,11 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			}
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			if (hw->soc->bias_set) {
+			if (hw->soc->bias_set_combo) {
+				err = hw->soc->bias_set_combo(hw, desc, 1, arg);
+				if (err)
+					return err;
+			} else if (hw->soc->bias_set) {
 				err = hw->soc->bias_set(hw, desc, 1);
 				if (err)
 					return err;
@@ -253,7 +284,11 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			}
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			if (hw->soc->bias_set) {
+			if (hw->soc->bias_set_combo) {
+				err = hw->soc->bias_set_combo(hw, desc, 0, arg);
+				if (err)
+					return err;
+			} else if (hw->soc->bias_set) {
 				err = hw->soc->bias_set(hw, desc, 0);
 				if (err)
 					return err;
-- 
2.34.1


