Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A96CC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 06:00:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C9C7613B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 06:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C9C7613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HRo7dqlbNF03WY3pH43FrCXge7pz2at4q6/IYzvI5rk=; b=kA1Tfwr5zzPWKCtxe/NKpcQxY
	vFoEuqnd9MU8R9jVuecNhdh3gBA6MaqzLHLrFA2Cu+hJ0et7Ajt+8con03uYdfXq7Y/oFCQNA45Ja
	FVpMs1nmymvwOlaotfRYdQuLkFdRJEjycDms6mT7AOz8akiX4BIhTTJQahCRxU8fZuTRKqet6ieoT
	UB3vWkSa6nwNLctSn1NjKDn4emyLSoneLsXTykmePO/8smhU5mxm0MTxqdQGekI35XBAN0cMVrsni
	uVisVLwKWzMeL0vdISo/C/Jd7WdadamPcFV86tUglQ0+9doBLj/4KSSi6GvZHrnMrKgHQGELKx87/
	S6HjDVsxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWC5g-008L0g-Uq; Tue, 13 Apr 2021 06:00:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWC5e-008L02-6H; Tue, 13 Apr 2021 05:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=K6Fnp8+S+3Y7afNzymyQbmZMvrXpnTuzQ8uyw4kC+ko=; b=NE0upw7vviMe5rOvERm9JZXA05
 JJq/DHNfJE8gagChrzWtPDbK0R0oc01YO0X/VxpkRxAAnV+ajEgJTDBLHH4jEvDTBVPDfDEd6072Q
 1yGEjeGjXg2LJ8PTaKifs50DxyTU88TWXX6G5j7SwjrsWqmV/5xRY+MLOk41yPGg3qLeIhc64mHEc
 cSB7iMAEOTw7B52bcRnfzQ9op+paPUgHFc3VghNb5ajVKMvYvwvjKwSKdCR/YmuFa150UXNhwGNG3
 /ITIW5IONw0TOk8vYcpcSiAeyouE3zGlZvGOJfmtJUhT2+QdGMi6fZQPKUbkUJpnAAuFcG4t4aCld
 nxK6lX3A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWC5b-006kxv-1H; Tue, 13 Apr 2021 05:59:56 +0000
X-UUID: 17582ef896c24a2a84db09ae3539488e-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K6Fnp8+S+3Y7afNzymyQbmZMvrXpnTuzQ8uyw4kC+ko=; 
 b=XlK044St4brmaQ+kTvBnJ7tQeMS+KhHFpbUJ1edIoFrPW4junCAivPVtED4QjrTajkV2r+jNMvWsEvIAO590ok+hslU+NuCOq8zoMYRlW5Q+74zMFmuJ/YHeGueFyJp2X26Mhtfth4eTGfsmuPE4MaJTG3udqASViIlKb0mG6uU=;
X-UUID: 17582ef896c24a2a84db09ae3539488e-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 707615592; Mon, 12 Apr 2021 22:59:52 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:57:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 13:57:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Apr 2021 13:57:34 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Subject: [PATCH v4 4/4] pinctrl: add rsel setting on MT8195
Date: Tue, 13 Apr 2021 13:57:02 +0800
Message-ID: <20210413055702.27535-5-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_225955_124921_FE9AF486 
X-CRM114-Status: GOOD (  14.04  )
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
