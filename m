Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE47D78306
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrZfKQeVzPeaNb9MAoWKYkGY3YjePUtQn3/HLjKeboI=; b=hRCKkZAEDt5yIp
	y+ttt46XHEMvNdo52vXdIQhgVI0IiLzpGm+SxtmNfR+416Y6kZOqMU1iOT5HhaEkuH5Yi4N//Cvt6
	PZQQmXb9zHn0mHRMAo9zyBPs/iDCCFBNtZoEX0zBeXR75225QzwS0EQosNZCEMxtEgkAGnX2pR5U9
	JWINMIpLfyETMHJrM2KdDEeAjJoSgaWQ8hOflZ8OqD+i+cvXfLo0R4HHyGzIZWHgBI1hwTuUGMzjW
	9hahF3+jNKwWbAxf1vcYqdHAU81/OJYO1aYm/ndfl8/zDCdKj7iQvfVAMGc5vfnB8IG6fI+Qv8GRB
	PMh4H+pu68cUqRVcesQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Ei-00000005nx4-2EAz;
	Mon, 02 Dec 2024 11:05:04 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Ap-00000005nII-15PL;
	Mon, 02 Dec 2024 11:01:09 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 495505FCA8;
	Mon,  2 Dec 2024 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733137258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CrZfKQeVzPeaNb9MAoWKYkGY3YjePUtQn3/HLjKeboI=;
	b=dH1QId37nZPxSlNP3XQoaXZnT3i/for4Ta+v6QWC6PQ2Uk0CmKIGLstuYTHK2M39mQZ0aK
	pG2RFgQO9rusAU9PC1dj+8FQxse07nroa6ELRJok7yGNW+48rIGBDjAUAKS5FKrMrm5TaH
	paMvKSmZMZblIrV7FSozQ5bMGtGl6/k=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 6BE07100475;
	Mon,  2 Dec 2024 11:00:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v5 1/5] pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
Date: Mon,  2 Dec 2024 12:00:35 +0100
Message-ID: <20241202110045.22084-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202110045.22084-1-linux@fw-web.de>
References: <20241202110045.22084-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fcedbf82-7749-4dbe-b55e-fa060d388412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_030103_581693_C9BA7A2B 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Golle <daniel@makrotopia.org>

The MediaTek MT7988 SoC got some pins which only got configurable
pull-down but unlike previous designs there is no pull-up option.
Add new type MTK_PULL_PD_TYPE to support configuring such pins.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v5:
- add changes suggested by angelo (pd_only), long version, tested with emmc
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 73 ++++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
 2 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 54301fbba524..7b704cc55c9f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_rev1);
  */
 static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
-				u32 pullup, u32 arg)
+				u32 pullup, u32 arg, bool pd_only)
 {
 	int err, pu, pd;
 
@@ -587,18 +587,34 @@ static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
 		pu = 0;
 		pd = 1;
 	} else {
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PU, pu);
-	if (err)
-		goto out;
+	if (!pd_only) {
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PU, pu);
+		if (err)
+			return err;
+	}
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
+}
+
+static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 pullup, u32 arg)
+{
+	int err, pd;
+
+	if (arg != MTK_DISABLE && arg != MTK_ENABLE)
+		return -EINVAL;
+
+	if (arg == MTK_DISABLE || pullup)
+		pd = 0;
+	else if (!pullup)
+		pd = 1;
+
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
 
-out:
-	return err;
 }
 
 static int mtk_pinconf_bias_set_pullsel_pullen(struct mtk_pinctrl *hw,
@@ -737,7 +753,7 @@ static int mtk_pinconf_bias_set_pu_pd_rsel(struct mtk_pinctrl *hw,
 			return err;
 	}
 
-	return mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, enable);
+	return mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, enable, false);
 }
 
 int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
@@ -758,8 +774,14 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 			return 0;
 	}
 
+	if (try_all_type & MTK_PULL_PD_TYPE) {
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg, true);
+		if (!err)
+			return err;
+	}
+
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
-		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg, false);
 		if (!err)
 			return 0;
 	}
@@ -878,6 +900,29 @@ static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_pinconf_bias_get_pd(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 *pullup, u32 *enable)
+{
+	int err, pd;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
+	if (err)
+		goto out;
+
+	if (pd == 0) {
+		*pullup = 0;
+		*enable = MTK_DISABLE;
+	} else if (pd == 1) {
+		*pullup = 0;
+		*enable = MTK_ENABLE;
+	} else
+		err = -EINVAL;
+
+out:
+	return err;
+}
+
 static int mtk_pinconf_bias_get_pullsel_pullen(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 *pullup, u32 *enable)
@@ -947,6 +992,12 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			return 0;
 	}
 
+	if (try_all_type & MTK_PULL_PD_TYPE) {
+		err = mtk_pinconf_bias_get_pd(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
+
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
 		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
 		if (!err)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 23688ca6d04e..9c271dc2b521 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -24,6 +24,7 @@
  * turned on/off itself. But it can't be selected pull up/down
  */
 #define MTK_PULL_RSEL_TYPE		BIT(3)
+#define MTK_PULL_PD_TYPE        BIT(4)
 /* MTK_PULL_PU_PD_RSEL_TYPE is a type which is controlled by
  * MTK_PULL_PU_PD_TYPE and MTK_PULL_RSEL_TYPE.
  */
-- 
2.43.0


