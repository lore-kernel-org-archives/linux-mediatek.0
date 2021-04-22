Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8801C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:46:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D7961452
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D7961452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U/tTYLJEiXy2mWMzYeqNH9xSEj073aPgVCDEXKGuiWo=; b=X+PCPHNB8XKFyVVhwNQ2nnBr4
	1yMJcDw80+F3gOwpdRbtjrXYtuOgOT91Po6mQ12srGy2zbfHz7JELul7OJvLAEYjdW7GtpCsMOG6R
	ZfCNF6R8GR4SZdXvzaOlJ+Vg/tEk4vJxEQtk9Jv2240ngfKRTd50QX8jCAEHaYPF+/Bp4CRV1YkN7
	iZm48er72tHVH+Llz1aE+T+b4sU4MNE6HDfC5ZzhAQpuwsLQqnmwb4E3wJ7yEl3tNJ1ZxuxKIaWO6
	O42Okj6Vh9JT2Oj1js3ipVs3Rlk94xfPLH4db3oSm8/od61E1zqlN1epULRASu495+UjDFubxJRPb
	ZqSeq4VNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQIG-00Fio3-ES; Thu, 22 Apr 2021 03:46:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQID-00Find-BO; Thu, 22 Apr 2021 03:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=0l0LeZrPIfb298Q15kAk2b8IG0eKCtJb39bGXClN4Do=; b=00q9B05K6X4ULXv9LXfIfMcEXF
 1t+dfCfFfwEWlW/QgfB6/6qrVWUfRztlk0QVQ2G+VUfGJp6WqZcDBXWhC0yI+5riakuHbtyRvv5oW
 eoYCrgOISvydsJLStx8i4fTw4FW7AN81CAmOSobmzwBN5cDa/XfFmaJm+yGYLgJl+lHmBrq7S8c9+
 ynRretrfbsvm9azgsPt0wAvB528n9iN5BPoxBNrhkyZN1gqfNCHJRKcN4+i3/wguvwNylmcQgVX9g
 bZH6N2HYpPPU9kR7CQyZgWavSDsgNWulCViqEos20+nGfeeMVOaNisL6fEG90spj68BeSPOWnR7UF
 ASVgnPLg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQI9-00DL8r-Hi; Thu, 22 Apr 2021 03:46:15 +0000
X-UUID: e15153968b6f47c68b90a4856c4079ad-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0l0LeZrPIfb298Q15kAk2b8IG0eKCtJb39bGXClN4Do=; 
 b=RnUUuZrc4Vr0mnr1KrQzMklV46JVcXTvGJaa23/ShKZVdWsi2k+q32ZuIrr62s/H2M7lhZs9je0mBJ2gv/44IV8Ol58U9pSYEwVryf25kAqTeM+pv+Fuu/VQ7KnDEi0U4x4aYG3bzQJp1TL7C9r+kcME9fHbcYaECpC0MvBIi2I=;
X-UUID: e15153968b6f47c68b90a4856c4079ad-20210421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 28067808; Wed, 21 Apr 2021 20:46:11 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 20:36:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 11:36:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 11:36:06 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>, <sj.huang@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Subject: [PATCH v5] pinctrl: add rsel setting on MT8195
Date: Thu, 22 Apr 2021 11:35:59 +0800
Message-ID: <20210422033559.29700-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210422033559.29700-1-zhiyong.tao@mediatek.com>
References: <20210422033559.29700-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4751D653B100337B4670D9DA71444D5CC62E43A955A1B1D0D0D2B03C28ED45912000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_204613_639393_294C1B05 
X-CRM114-Status: GOOD (  13.03  )
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
index da1f19288aa6..392fdfcb5b87 100644
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
+			err = -ENOTSUPP;
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
+			err = -ENOTSUPP;
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
