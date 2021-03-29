Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309ABC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:18:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6F361936
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6F361936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HRo7dqlbNF03WY3pH43FrCXge7pz2at4q6/IYzvI5rk=; b=qIvzE1CY+eW4VuBi8aa5Q/5Ps
	FJEMFkpys6iSR9glWjyODv/UQz+b/oqLANf2qqHC5PqKLDY29gwtOWDgETyhsxApK6IRhlEjyghRb
	Ndk26y8dNeOP6S1P39gRFnoSA/atxyNJaqVv3oTuyYJkn2NQ4ZdT6ZWkdTFoJdqCAS0TuM85sIvhU
	SzlqmOFqCzXQzwe9AfiZSjAmB0ROOT3xSo/R0LfQi4D4E0LrvWwLZVIlTfBWyE1sxXwcGmnxHrghc
	G5nPK86o0Pbd0OXd/uDN4dXtOjFly6aWZEs8H39bczDgBFyz8SFa2n4N3Uo7q9oF7bCsVQlSDrWUu
	icq7m/SKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxNf-001CkB-9G; Mon, 29 Mar 2021 19:17:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq76-000cRH-6y; Mon, 29 Mar 2021 11:31:22 +0000
X-UUID: 53c2e92a191245af828bc2171745e4ce-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K6Fnp8+S+3Y7afNzymyQbmZMvrXpnTuzQ8uyw4kC+ko=; 
 b=Dc7e8fWSofVHU7B5BqAB0WpKIKLGARmXDSnpKzRxbGsc3CHMIxJesX1I/Okb8djMJxsoySxLe1+F+07W8Fpm2qhM933tgaza37XkcnfNxJ5dPavae3R437eoV1SVlAz4lqvc1KI3JNuQoABd/ODxZ1lOLUeUMIiz8OEfQxWjVIg=;
X-UUID: 53c2e92a191245af828bc2171745e4ce-20210329
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 239960813; Mon, 29 Mar 2021 03:31:18 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 04:31:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 19:31:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:31:13 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH Resend v0 6/6] pinctrl: add rsel setting on MT8195
Date: Mon, 29 Mar 2021 19:31:03 +0800
Message-ID: <20210329113103.11003-7-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_123120_585377_65D90C1D 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch provides rsel setting on MT8195.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  | 10 +++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 16 ++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index a7500e18bb1d..66608b8d346a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -779,6 +779,25 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
 	PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
 };
 
+static const struct mtk_pin_field_calc mt8195_pin_rsel_range[] = {
+	PIN_FIELD_BASE(8, 8, 4, 0x0c0, 0x10, 15, 3),
+	PIN_FIELD_BASE(9, 9, 4, 0x0c0, 0x10, 0, 3),
+	PIN_FIELD_BASE(10, 10, 4, 0x0c0, 0x10, 18, 3),
+	PIN_FIELD_BASE(11, 11, 4, 0x0c0, 0x10, 3, 3),
+	PIN_FIELD_BASE(12, 12, 4, 0x0c0, 0x10, 21, 3),
+	PIN_FIELD_BASE(13, 13, 4, 0x0c0, 0x10, 6, 3),
+	PIN_FIELD_BASE(14, 14, 4, 0x0c0, 0x10, 24, 3),
+	PIN_FIELD_BASE(15, 15, 4, 0x0c0, 0x10, 9, 3),
+	PIN_FIELD_BASE(16, 16, 4, 0x0c0, 0x10, 27, 3),
+	PIN_FIELD_BASE(17, 17, 4, 0x0c0, 0x10, 12, 3),
+	PIN_FIELD_BASE(29, 29, 2, 0x080, 0x10, 0, 3),
+	PIN_FIELD_BASE(30, 30, 2, 0x080, 0x10, 3, 3),
+	PIN_FIELD_BASE(34, 34, 1, 0x0e0, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 1, 0x0e0, 0x10, 3, 3),
+	PIN_FIELD_BASE(44, 44, 1, 0x0e0, 0x10, 6, 3),
+	PIN_FIELD_BASE(45, 45, 1, 0x0e0, 0x10, 9, 3),
+};
+
 static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
@@ -793,6 +812,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
 	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8195_pin_rsel_range),
 };
 
 static const char * const mt8195_pinctrl_register_base_names[] = {
@@ -823,6 +843,8 @@ static const struct mtk_pin_soc mt8195_data = {
 	.drive_get = mtk_pinconf_drive_get_rev1,
 	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
 	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+	.rsel_set = mtk_pinconf_rsel_set,
+	.rsel_get = mtk_pinconf_rsel_get,
 };
 
 static const struct of_device_id mt8195_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 2b51f4a9b860..d1526d0c6248 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1041,6 +1041,20 @@ int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get_raw);
 
+int mtk_pinconf_rsel_set(struct mtk_pinctrl *hw,
+			 const struct mtk_pin_desc *desc, u32 arg)
+{
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, arg);
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_rsel_set);
+
+int mtk_pinconf_rsel_get(struct mtk_pinctrl *hw,
+			 const struct mtk_pin_desc *desc, u32 *val)
+{
+	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, val);
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_rsel_get);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_DESCRIPTION("Pin configuration library module for mediatek SoCs");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index fd5ce9c5dcbd..570e8da7bf38 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -67,6 +67,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
 	PINCTRL_PIN_REG_DRV_ADV,
+	PINCTRL_PIN_REG_RSEL,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -237,6 +238,10 @@ struct mtk_pin_soc {
 			     const struct mtk_pin_desc *desc, u32 arg);
 	int (*adv_drive_get)(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, u32 *val);
+	int (*rsel_set)(struct mtk_pinctrl *hw,
+			const struct mtk_pin_desc *desc, u32 arg);
+	int (*rsel_get)(struct mtk_pinctrl *hw,
+			const struct mtk_pin_desc *desc, u32 *val);
 
 	/* Specific driver data */
 	void				*driver_data;
@@ -320,5 +325,10 @@ int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
 int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
 				  const struct mtk_pin_desc *desc, u32 *val);
 
+int mtk_pinconf_rsel_set(struct mtk_pinctrl *hw,
+			 const struct mtk_pin_desc *desc, u32 arg);
+int mtk_pinconf_rsel_get(struct mtk_pinctrl *hw,
+			 const struct mtk_pin_desc *desc, u32 *val);
+
 bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n);
 #endif /* __PINCTRL_MTK_COMMON_V2_H */
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index da1f19288aa6..967288c28232 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -22,6 +22,8 @@
 #define MTK_PIN_CONFIG_PU_ADV	(PIN_CONFIG_END + 3)
 #define MTK_PIN_CONFIG_PD_ADV	(PIN_CONFIG_END + 4)
 #define MTK_PIN_CONFIG_DRV_ADV	(PIN_CONFIG_END + 5)
+#define MTK_PIN_CONFIG_RSEL	(PIN_CONFIG_END + 6)
+
 
 static const struct pinconf_generic_params mtk_custom_bindings[] = {
 	{"mediatek,tdsel",	MTK_PIN_CONFIG_TDSEL,		0},
@@ -29,6 +31,7 @@ static const struct pinconf_generic_params mtk_custom_bindings[] = {
 	{"mediatek,pull-up-adv", MTK_PIN_CONFIG_PU_ADV,		1},
 	{"mediatek,pull-down-adv", MTK_PIN_CONFIG_PD_ADV,	1},
 	{"mediatek,drive-strength-adv", MTK_PIN_CONFIG_DRV_ADV,	2},
+	{"mediatek,rsel",		MTK_PIN_CONFIG_RSEL,	2},
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -38,6 +41,7 @@ static const struct pin_config_item mtk_conf_items[] = {
 	PCONFDUMP(MTK_PIN_CONFIG_PU_ADV, "pu-adv", NULL, true),
 	PCONFDUMP(MTK_PIN_CONFIG_PD_ADV, "pd-adv", NULL, true),
 	PCONFDUMP(MTK_PIN_CONFIG_DRV_ADV, "drive-strength-adv", NULL, true),
+	PCONFDUMP(MTK_PIN_CONFIG_RSEL, "rsel", NULL, true),
 };
 #endif
 
@@ -176,6 +180,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		else
 			err = -ENOTSUPP;
 		break;
+	case MTK_PIN_CONFIG_RSEL:
+		if (hw->soc->rsel_get)
+			err = hw->soc->rsel_get(hw, desc, &ret);
+		else
+			err = -EOPNOTSUPP;
+		break;
 	default:
 		err = -ENOTSUPP;
 	}
@@ -295,6 +305,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		else
 			err = -ENOTSUPP;
 		break;
+	case MTK_PIN_CONFIG_RSEL:
+		if (hw->soc->rsel_set)
+			err = hw->soc->rsel_set(hw, desc, arg);
+		else
+			err = -EOPNOTSUPP;
+		break;
 	default:
 		err = -ENOTSUPP;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
