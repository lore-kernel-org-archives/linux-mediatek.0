Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42097C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:16:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F256196E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F256196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BYourh25pymYoDRMIosEXByiE/VNTOILJ/WEpsHBUJw=; b=DqcZeD51qEQZh7z5J73n4GGaP
	4LZNyyWIe5cJ0uxs+FtY2KzBOYVpQVsxLrtpiBNHGaRZy4eUxysqNcbvEniKNzB/S9x0L81AYtCfH
	3bwrWQCSzWLo4oVD9B4A/savmSsvowoS59jHVYTHZHMJOddBBxS2uL9/uBEqaCnWoI8wTFcEEtTBk
	W/a8BF4lIWOpgzV8Z3/H6dmmveCNOWHu0h40dRSXBNPtIi23qcP79qTYbBsEmtEz6jN+VHxqoBAqY
	B0pIi8GZTwdxtFVgCJq18QMe7EnUOZLuGpxCjwQZmZD9mtLlWTAGVKFhjVowGBynE3lOcyxdeDD+U
	znoM4HyUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxML-001CZM-Sx; Mon, 29 Mar 2021 19:15:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq76-000cPp-0p; Mon, 29 Mar 2021 11:31:22 +0000
X-UUID: 86d2f18b8d7e4e6a96c9a515925e3d20-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iE2IBBF1NTR8xVhsmDLOl8lVIqE7rxe5QagDJ0qVi2c=; 
 b=W/gW4B2/MCbEN5N4Ht0FYUb3xoBvT4rS98tp0IyyJgOa07SocFNIMC/isMrFdsFBL+v3hVr4cRG4ojficbujbGALgKX8/fW1gLHlR2HTKvRoVYwS1NB2YLlKMuLL3gTduzYWfGLUI7lWUIGGOgRk0eWLWv9/xXdWRQQ7RsBguro=;
X-UUID: 86d2f18b8d7e4e6a96c9a515925e3d20-20210329
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1320090733; Mon, 29 Mar 2021 03:31:16 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 04:31:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 19:31:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:31:12 +0800
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
Subject: [PATCH Resend v0 5/6] pinctrl: add drive for I2C related pins on
 MT8195
Date: Mon, 29 Mar 2021 19:31:02 +0800
Message-ID: <20210329113103.11003-6-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_123120_409337_E47C73E8 
X-CRM114-Status: GOOD (  11.54  )
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

This patch provides the advanced drive raw data setting version
for I2C used pins on MT8195.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  5 +++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index 063f164d7c9b..a7500e18bb1d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -760,6 +760,25 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_range[] = {
 	PIN_FIELD_BASE(143, 143, 1, 0x020, 0x10, 24, 3),
 };
 
+static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(8, 8, 4, 0x020, 0x10, 15, 3),
+	PIN_FIELD_BASE(9, 9, 4, 0x020, 0x10, 0, 3),
+	PIN_FIELD_BASE(10, 10, 4, 0x020, 0x10, 18, 3),
+	PIN_FIELD_BASE(11, 11, 4, 0x020, 0x10, 3, 3),
+	PIN_FIELD_BASE(12, 12, 4, 0x020, 0x10, 21, 3),
+	PIN_FIELD_BASE(13, 13, 4, 0x020, 0x10, 6, 3),
+	PIN_FIELD_BASE(14, 14, 4, 0x020, 0x10, 24, 3),
+	PIN_FIELD_BASE(15, 15, 4, 0x020, 0x10, 9, 3),
+	PIN_FIELD_BASE(16, 16, 4, 0x020, 0x10, 27, 3),
+	PIN_FIELD_BASE(17, 17, 4, 0x020, 0x10, 12, 3),
+	PIN_FIELD_BASE(29, 29, 2, 0x020, 0x10, 0, 3),
+	PIN_FIELD_BASE(30, 30, 2, 0x020, 0x10, 3, 3),
+	PIN_FIELD_BASE(34, 34, 1, 0x040, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 1, 0x040, 0x10, 3, 3),
+	PIN_FIELD_BASE(44, 44, 1, 0x040, 0x10, 6, 3),
+	PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
+};
+
 static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
@@ -773,6 +792,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8195_pin_pupd_range),
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
 };
 
 static const char * const mt8195_pinctrl_register_base_names[] = {
@@ -801,6 +821,8 @@ static const struct mtk_pin_soc mt8195_data = {
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
 	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
 };
 
 static const struct of_device_id mt8195_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 72f17f26acd8..2b51f4a9b860 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1027,6 +1027,20 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
 
+int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 arg)
+{
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, arg);
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set_raw);
+
+int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 *val)
+{
+	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, val);
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get_raw);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_DESCRIPTION("Pin configuration library module for mediatek SoCs");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index e2aae285b5fc..fd5ce9c5dcbd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -66,6 +66,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_EN,
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
+	PINCTRL_PIN_REG_DRV_ADV,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -314,6 +315,10 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 arg);
 int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 *val);
+int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 arg);
+int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 *val);
 
 bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n);
 #endif /* __PINCTRL_MTK_COMMON_V2_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
