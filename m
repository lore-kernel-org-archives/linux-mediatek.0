Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCFDCEE338
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHaUG5cyywTVSn0olx177yyudjZMx8d30jdAXK4qx8Y=; b=bc1lM5N2w6IAPE
	JU17gFaij6RF2iILgUEzXOEc2pKPzPtfIxMzgoRGDaYjN7hBuF6rRo1MDBS4bm/X4tI42z4RCHM4B
	zEOMSQAISXtY1QNbdzxxp6Df/Ouz6x1ob1KBo1UcS8zvLkrmGkquCHe7Oowir2GV5wX53Jhul/ZdV
	GCVjOfCyL96g+7QgASGkpE32I8O4djU7G4wnUa85lx4z7JycCNzv9QMsQblD5e7MD+r4VT8Snnau/
	hcHYrs6vGCt380JVfs6bEoDOsSsDoVxFeXQkqV+3uqQAKAFr2CQAkRDgKJWRsoNjUNnyjDu5At64U
	FIbFuRRZS+wC3l1z6abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syab1-0000000ACJy-1Dt8;
	Wed, 09 Oct 2024 17:35:35 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZvT-0000000A4UC-2Jzi;
	Wed, 09 Oct 2024 16:52:41 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id 2C8EA40832;
	Wed,  9 Oct 2024 16:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728492755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHaUG5cyywTVSn0olx177yyudjZMx8d30jdAXK4qx8Y=;
	b=tKzRsn+XYL+kNWeDP0kRjPwW5FAqN86ZvAGRVM3Q9hLb7aKhid9hkvKu6TgScEgsSCDmJo
	JEUmi2ZuDC9/lm7k81lGCGMLPOjxWyXb/rurZgHnPHZoVO96DZDwHq2iMTONYi1R8uaTAH
	UNjdZhDzfbClmtdtiePcHQPV9p9wsig=
Received: from frank-u24.. (fttx-pool-217.61.150.182.bambit.de [217.61.150.182])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 5911080345;
	Wed,  9 Oct 2024 16:52:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v4 1/4] pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
Date: Wed,  9 Oct 2024 18:52:11 +0200
Message-ID: <20241009165222.5670-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009165222.5670-1-linux@fw-web.de>
References: <20241009165222.5670-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 12846c23-6375-4ecd-9e8c-71fd268a7718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_095239_777027_23F00ADF 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Golle <daniel@makrotopia.org>

The MediaTek MT7988 SoC got some pins which only got configurable
pull-down but unlike previous designs there is no pull-up option.
Add new type MTK_PULL_PD_TYPE to support configuring such pins.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 59 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
 2 files changed, 60 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 54301fbba524..eff2aecd31dd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -601,6 +601,30 @@ static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 pullup, u32 arg)
+{
+	int err, pd;
+
+	if (arg == MTK_DISABLE)
+		pd = 0;
+	else if ((arg == MTK_ENABLE) && pullup)
+		pd = 0;
+	else if ((arg == MTK_ENABLE) && !pullup)
+		pd = 1;
+	else {
+		err = -EINVAL;
+		goto out;
+	}
+
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
+
+out:
+	return err;
+
+}
+
 static int mtk_pinconf_bias_set_pullsel_pullen(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 pullup, u32 arg)
@@ -758,6 +782,12 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 			return 0;
 	}
 
+	if (try_all_type & MTK_PULL_PD_TYPE) {
+		err = mtk_pinconf_bias_set_pd(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
 		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
 		if (!err)
@@ -878,6 +908,29 @@ static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
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
@@ -947,6 +1000,12 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
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


