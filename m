Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E460CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 02:33:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3FCD6113E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 02:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3FCD6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRJiV2baarbnPXJmcxePiAZanJgW2/VIjytVghE1GMM=; b=Raa54OZgWn6Gj8
	R5GMAyg7RCyPdfZyATVRoDf/rQQYfUxXfM6VDcLqS27hzopZJ5DldbfnEMZESA/OkkAtEwX/u7nAm
	DzQT2SlSLlAxohZudf5zPtQ22Vh/m7tbotLSxiB8PUoOyOkkeOc5dPSIEuwdrrXfbho+npiRr6IDV
	iaRuslsjRg/dQYn3XlBKenTa4EvfCrTOSvcT7h3dBdhwHv/Y9jLOZpX+Tmp18v8IBYKhQ/WgfKnI5
	EIHBF0dgwNJZwWd+D7JTWA9C2WLAx0Ect6b9TwbVsCtnATaa0WVzIj+5bjvOEz3qrp49DC9tyNwmX
	iwLlymFj/bcqlV8RD8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR3gI-00CwUj-W5; Fri, 17 Sep 2021 02:32:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR3fy-00CwO4-5h; Fri, 17 Sep 2021 02:32:32 +0000
X-UUID: 48348c21de184df185f47b2730a57f60-20210916
X-UUID: 48348c21de184df185f47b2730a57f60-20210916
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 421716772; Thu, 16 Sep 2021 19:32:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 19:32:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 10:32:24 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 10:32:23 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Subject: [PATCH v12 5/5] pinctrl: mediatek: add rsel setting on MT8195
Date: Fri, 17 Sep 2021 10:32:16 +0800
Message-ID: <20210917023216.18384-6-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917023216.18384-1-zhiyong.tao@mediatek.com>
References: <20210917023216.18384-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_193230_282760_D171101F 
X-CRM114-Status: GOOD (  10.53  )
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

I2C pins's resistance value can be controlled by rsel register.
This patch provides rsel (resistance selection) setting on MT8195

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c | 133 ++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index a7500e18bb1d..9ba86c80c07a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -779,6 +779,135 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
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
+static const struct mtk_pin_rsel mt8195_pin_rsel_val_range[] = {
+	PIN_RSEL(8, 17, 0x0, 75000, 75000),
+	PIN_RSEL(8, 17, 0x1, 10000, 5000),
+	PIN_RSEL(8, 17, 0x2, 5000, 75000),
+	PIN_RSEL(8, 17, 0x3, 4000, 5000),
+	PIN_RSEL(8, 17, 0x4, 3000, 75000),
+	PIN_RSEL(8, 17, 0x5, 2000, 5000),
+	PIN_RSEL(8, 17, 0x6, 1500, 75000),
+	PIN_RSEL(8, 17, 0x7, 1000, 5000),
+	PIN_RSEL(29, 30, 0x0, 75000, 75000),
+	PIN_RSEL(29, 30, 0x1, 10000, 5000),
+	PIN_RSEL(29, 30, 0x2, 5000, 75000),
+	PIN_RSEL(29, 30, 0x3, 4000, 5000),
+	PIN_RSEL(29, 30, 0x4, 3000, 75000),
+	PIN_RSEL(29, 30, 0x5, 2000, 5000),
+	PIN_RSEL(29, 30, 0x6, 1500, 75000),
+	PIN_RSEL(29, 30, 0x7, 1000, 5000),
+	PIN_RSEL(34, 35, 0x0, 75000, 75000),
+	PIN_RSEL(34, 35, 0x1, 10000, 5000),
+	PIN_RSEL(34, 35, 0x2, 5000, 75000),
+	PIN_RSEL(34, 35, 0x3, 4000, 5000),
+	PIN_RSEL(34, 35, 0x4, 3000, 75000),
+	PIN_RSEL(34, 35, 0x5, 2000, 5000),
+	PIN_RSEL(34, 35, 0x6, 1500, 75000),
+	PIN_RSEL(34, 35, 0x7, 1000, 5000),
+	PIN_RSEL(44, 45, 0x0, 75000, 75000),
+	PIN_RSEL(44, 45, 0x1, 10000, 5000),
+	PIN_RSEL(44, 45, 0x2, 5000, 75000),
+	PIN_RSEL(44, 45, 0x3, 4000, 5000),
+	PIN_RSEL(44, 45, 0x4, 3000, 75000),
+	PIN_RSEL(44, 45, 0x5, 2000, 5000),
+	PIN_RSEL(44, 45, 0x6, 1500, 75000),
+	PIN_RSEL(44, 45, 0x7, 1000, 5000),
+};
+
+static const unsigned int mt8195_pull_type[] = {
+	MTK_PULL_PUPD_R1R0_TYPE /* 0 */, MTK_PULL_PUPD_R1R0_TYPE /* 1 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 2 */, MTK_PULL_PUPD_R1R0_TYPE /* 3 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 4 */, MTK_PULL_PUPD_R1R0_TYPE /* 5 */,
+	MTK_PULL_PU_PD_TYPE /* 6 */, MTK_PULL_PU_PD_TYPE /* 7 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 8 */, MTK_PULL_PU_PD_RSEL_TYPE /* 9 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 10 */, MTK_PULL_PU_PD_RSEL_TYPE /* 11 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 12 */, MTK_PULL_PU_PD_RSEL_TYPE /* 13 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 14 */, MTK_PULL_PU_PD_RSEL_TYPE /* 15 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 16 */, MTK_PULL_PU_PD_RSEL_TYPE /* 17 */,
+	MTK_PULL_PU_PD_TYPE /* 18 */, MTK_PULL_PU_PD_TYPE /* 19 */,
+	MTK_PULL_PU_PD_TYPE /* 20 */, MTK_PULL_PU_PD_TYPE /* 21 */,
+	MTK_PULL_PU_PD_TYPE /* 22 */, MTK_PULL_PU_PD_TYPE /* 23 */,
+	MTK_PULL_PU_PD_TYPE /* 24 */, MTK_PULL_PU_PD_TYPE /* 25 */,
+	MTK_PULL_PU_PD_TYPE /* 26 */, MTK_PULL_PU_PD_TYPE /* 27 */,
+	MTK_PULL_PU_PD_TYPE /* 28 */, MTK_PULL_PU_PD_RSEL_TYPE /* 29 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 30 */, MTK_PULL_PU_PD_TYPE /* 31 */,
+	MTK_PULL_PU_PD_TYPE /* 32 */, MTK_PULL_PU_PD_TYPE /* 33 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 34 */, MTK_PULL_PU_PD_RSEL_TYPE /* 35 */,
+	MTK_PULL_PU_PD_TYPE /* 36 */, MTK_PULL_PU_PD_TYPE /* 37 */,
+	MTK_PULL_PU_PD_TYPE /* 38 */, MTK_PULL_PU_PD_TYPE /* 39 */,
+	MTK_PULL_PU_PD_TYPE /* 40 */, MTK_PULL_PU_PD_TYPE /* 41 */,
+	MTK_PULL_PU_PD_TYPE /* 42 */, MTK_PULL_PU_PD_TYPE /* 43 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 44 */, MTK_PULL_PU_PD_RSEL_TYPE /* 45 */,
+	MTK_PULL_PU_PD_TYPE /* 46 */, MTK_PULL_PU_PD_TYPE /* 47 */,
+	MTK_PULL_PU_PD_TYPE /* 48 */, MTK_PULL_PU_PD_TYPE /* 49 */,
+	MTK_PULL_PU_PD_TYPE /* 50 */, MTK_PULL_PU_PD_TYPE /* 51 */,
+	MTK_PULL_PU_PD_TYPE /* 52 */, MTK_PULL_PU_PD_TYPE /* 53 */,
+	MTK_PULL_PU_PD_TYPE /* 54 */, MTK_PULL_PU_PD_TYPE /* 55 */,
+	MTK_PULL_PU_PD_TYPE /* 56 */, MTK_PULL_PU_PD_TYPE /* 57 */,
+	MTK_PULL_PU_PD_TYPE /* 58 */, MTK_PULL_PU_PD_TYPE /* 59 */,
+	MTK_PULL_PU_PD_TYPE /* 60 */, MTK_PULL_PU_PD_TYPE /* 61 */,
+	MTK_PULL_PU_PD_TYPE /* 62 */, MTK_PULL_PU_PD_TYPE /* 63 */,
+	MTK_PULL_PU_PD_TYPE /* 64 */, MTK_PULL_PU_PD_TYPE /* 65 */,
+	MTK_PULL_PU_PD_TYPE /* 66 */, MTK_PULL_PU_PD_TYPE /* 67 */,
+	MTK_PULL_PU_PD_TYPE /* 68 */, MTK_PULL_PU_PD_TYPE /* 69 */,
+	MTK_PULL_PU_PD_TYPE /* 70 */, MTK_PULL_PU_PD_TYPE /* 71 */,
+	MTK_PULL_PU_PD_TYPE /* 72 */, MTK_PULL_PU_PD_TYPE /* 73 */,
+	MTK_PULL_PU_PD_TYPE /* 74 */, MTK_PULL_PU_PD_TYPE /* 75 */,
+	MTK_PULL_PU_PD_TYPE /* 76 */, MTK_PULL_PUPD_R1R0_TYPE /* 77 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 78 */, MTK_PULL_PUPD_R1R0_TYPE /* 79 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 80 */, MTK_PULL_PUPD_R1R0_TYPE /* 81 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 82 */, MTK_PULL_PUPD_R1R0_TYPE /* 83 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 84 */, MTK_PULL_PUPD_R1R0_TYPE /* 85 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 86 */, MTK_PULL_PUPD_R1R0_TYPE /* 87 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 88 */, MTK_PULL_PUPD_R1R0_TYPE /* 89 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 90 */, MTK_PULL_PUPD_R1R0_TYPE /* 91 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 92 */, MTK_PULL_PUPD_R1R0_TYPE /* 93 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 94 */, MTK_PULL_PUPD_R1R0_TYPE /* 95 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 96 */, MTK_PULL_PU_PD_TYPE /* 97 */,
+	MTK_PULL_PU_PD_TYPE /* 98 */, MTK_PULL_PU_PD_TYPE /* 99 */,
+	MTK_PULL_PU_PD_TYPE /* 100 */, MTK_PULL_PU_PD_TYPE /* 101 */,
+	MTK_PULL_PU_PD_TYPE /* 102 */, MTK_PULL_PU_PD_TYPE /* 103 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 104 */, MTK_PULL_PUPD_R1R0_TYPE /* 105 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 106 */, MTK_PULL_PUPD_R1R0_TYPE /* 107 */,
+	MTK_PULL_PU_PD_TYPE /* 108 */, MTK_PULL_PU_PD_TYPE /* 109 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 110 */, MTK_PULL_PUPD_R1R0_TYPE /* 111 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 112 */, MTK_PULL_PUPD_R1R0_TYPE /* 113 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 114 */, MTK_PULL_PUPD_R1R0_TYPE /* 115 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 116 */, MTK_PULL_PUPD_R1R0_TYPE /* 117 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 118 */, MTK_PULL_PUPD_R1R0_TYPE /* 119 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 120 */, MTK_PULL_PUPD_R1R0_TYPE /* 121 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 122 */, MTK_PULL_PUPD_R1R0_TYPE /* 123 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 124 */, MTK_PULL_PUPD_R1R0_TYPE /* 125 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 126 */, MTK_PULL_PUPD_R1R0_TYPE /* 127 */,
+	MTK_PULL_PU_PD_TYPE /* 128 */, MTK_PULL_PU_PD_TYPE /* 129 */,
+	MTK_PULL_PU_PD_TYPE /* 130 */, MTK_PULL_PU_PD_TYPE /* 131 */,
+	MTK_PULL_PU_PD_TYPE /* 132 */, MTK_PULL_PU_PD_TYPE /* 133 */,
+	MTK_PULL_PU_PD_TYPE /* 134 */, MTK_PULL_PU_PD_TYPE /* 135 */,
+	MTK_PULL_PU_PD_TYPE /* 136 */, MTK_PULL_PU_PD_TYPE /* 137 */,
+	MTK_PULL_PU_PD_TYPE /* 138 */, MTK_PULL_PU_PD_TYPE /* 139 */,
+	MTK_PULL_PU_PD_TYPE /* 140 */, MTK_PULL_PU_PD_TYPE /* 141 */,
+	MTK_PULL_PU_PD_TYPE /* 142 */, MTK_PULL_PU_PD_TYPE /* 143 */,
+};
+
 static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
@@ -793,6 +922,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
 	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8195_pin_rsel_range),
 };
 
 static const char * const mt8195_pinctrl_register_base_names[] = {
@@ -817,6 +947,9 @@ static const struct mtk_pin_soc mt8195_data = {
 	.gpio_m = 0,
 	.base_names = mt8195_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt8195_pinctrl_register_base_names),
+	.pull_type = mt8195_pull_type,
+	.pin_rsel = mt8195_pin_rsel_val_range,
+	.npin_rsel = ARRAY_SIZE(mt8195_pin_rsel_val_range),
 	.bias_set_combo = mtk_pinconf_bias_set_combo,
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
