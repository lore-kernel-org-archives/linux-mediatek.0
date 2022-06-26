Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63222C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 04:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z02ErGRAgJUe+o2q8k7u9nmB9m0B6KSedFdYgEg8jQg=; b=AefCmQthjRu1T4UqN9LswAahnT
	ZzH6bWYApXF50LXh1oVcaw3eoMe9ZtxJe2K8dXAHITcDqMe6QH7X6Sk+KlMoEFhCgJv2JZmLUjneH
	I8z+IGoyOF6eV2Jn2SFARxSpPuHQ7GHXpzVbWvryDeQgNyZM405FRcji/pAmsk7Qs0pl824lG9PJ/
	qleXECo6irA5HP8IaBCdRhU1Q6aufr2B3w74SvVXXcwDIRFC2s8SBYcOR8zgKbY9QFRhynCpiAcRV
	lSJ/Uv/A0QNVD3t/pO4up33sCTwNwhRGaTUo9MItCwLpxn42rMfkRTw5ZrvUMC86DIyYN7ymtie4U
	JG9njLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KGy-009dds-I4; Sun, 26 Jun 2022 04:53:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KDt-009bcf-Ji; Sun, 26 Jun 2022 04:50:17 +0000
X-UUID: 597d549c5311485bb9f89fd503af6784-20220625
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:3719e0d8-fe88-4283-95dc-c70de37f2336,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:-20
X-CID-META: VersionHash:b14ad71,CLOUDID:decb0b2e-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 597d549c5311485bb9f89fd503af6784-20220625
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1728998125; Sat, 25 Jun 2022 21:50:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 21:40:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sun, 26 Jun 2022 12:40:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Jun 2022 12:40:02 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>,
	=?UTF-8?q?N=EDcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH v3 2/5] pinctrl: mediatek: add drive for I2C related pins on mt8192
Date: Sun, 26 Jun 2022 12:39:52 +0800
Message-ID: <20220626043955.32756-3-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220626043955.32756-1-guodong.liu@mediatek.com>
References: <20220626043955.32756-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_215013_737113_C0156FAD 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch provides the advanced drive raw data setting version
for I2C used pins on mt8192

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 96 ++++++-----------------
 1 file changed, 26 insertions(+), 70 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index 2421a12fc573..efabeb422aea 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1259,74 +1259,32 @@ static const struct mtk_pin_field_calc mt8192_pin_r1_range[] = {
 	PIN_FIELD_BASE(205, 205, 8, 0x0070, 0x10, 5, 1),
 };
 
-static const struct mtk_pin_field_calc mt8192_pin_e1e0en_range[] = {
-	PIN_FIELD_BASE(118, 118, 4, 0x0040, 0x10, 0, 1),
-	PIN_FIELD_BASE(119, 119, 4, 0x0040, 0x10, 18, 1),
-	PIN_FIELD_BASE(120, 120, 4, 0x0040, 0x10, 15, 1),
-	PIN_FIELD_BASE(121, 121, 4, 0x0050, 0x10, 3, 1),
-	PIN_FIELD_BASE(122, 122, 4, 0x0040, 0x10, 12, 1),
-	PIN_FIELD_BASE(123, 123, 4, 0x0050, 0x10, 0, 1),
-	PIN_FIELD_BASE(124, 124, 4, 0x0040, 0x10, 9, 1),
-	PIN_FIELD_BASE(125, 125, 4, 0x0040, 0x10, 27, 1),
-	PIN_FIELD_BASE(139, 139, 4, 0x0040, 0x10, 6, 1),
-	PIN_FIELD_BASE(140, 140, 4, 0x0040, 0x10, 24, 1),
-	PIN_FIELD_BASE(141, 141, 4, 0x0040, 0x10, 3, 1),
-	PIN_FIELD_BASE(142, 142, 4, 0x0040, 0x10, 21, 1),
-	PIN_FIELD_BASE(160, 160, 7, 0x0030, 0x10, 0, 1),
-	PIN_FIELD_BASE(161, 161, 7, 0x0030, 0x10, 3, 1),
-	PIN_FIELD_BASE(200, 200, 8, 0x0010, 0x10, 3, 1),
-	PIN_FIELD_BASE(201, 201, 8, 0x0010, 0x10, 9, 1),
-	PIN_FIELD_BASE(202, 202, 5, 0x0020, 0x10, 0, 1),
-	PIN_FIELD_BASE(203, 203, 5, 0x0020, 0x10, 3, 1),
-	PIN_FIELD_BASE(204, 204, 8, 0x0010, 0x10, 0, 1),
-	PIN_FIELD_BASE(205, 205, 8, 0x0010, 0x10, 6, 1),
-};
+static const struct mtk_pin_field_calc mt8192_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(89, 89, 2, 0x0040, 0x10, 0, 5),
+	PIN_FIELD_BASE(90, 90, 2, 0x0040, 0x10, 5, 5),
 
-static const struct mtk_pin_field_calc mt8192_pin_e0_range[] = {
-	PIN_FIELD_BASE(118, 118, 4, 0x0040, 0x10, 1, 1),
-	PIN_FIELD_BASE(119, 119, 4, 0x0040, 0x10, 19, 1),
-	PIN_FIELD_BASE(120, 120, 4, 0x0040, 0x10, 16, 1),
-	PIN_FIELD_BASE(121, 121, 4, 0x0050, 0x10, 4, 1),
-	PIN_FIELD_BASE(122, 122, 4, 0x0040, 0x10, 13, 1),
-	PIN_FIELD_BASE(123, 123, 4, 0x0050, 0x10, 1, 1),
-	PIN_FIELD_BASE(124, 124, 4, 0x0040, 0x10, 10, 1),
-	PIN_FIELD_BASE(125, 125, 4, 0x0040, 0x10, 28, 1),
-	PIN_FIELD_BASE(139, 139, 4, 0x0040, 0x10, 7, 1),
-	PIN_FIELD_BASE(140, 140, 4, 0x0040, 0x10, 25, 1),
-	PIN_FIELD_BASE(141, 141, 4, 0x0040, 0x10, 4, 1),
-	PIN_FIELD_BASE(142, 142, 4, 0x0040, 0x10, 22, 1),
-	PIN_FIELD_BASE(160, 160, 7, 0x0030, 0x10, 1, 1),
-	PIN_FIELD_BASE(161, 161, 7, 0x0030, 0x10, 4, 1),
-	PIN_FIELD_BASE(200, 200, 8, 0x0010, 0x10, 4, 1),
-	PIN_FIELD_BASE(201, 201, 8, 0x0010, 0x10, 10, 1),
-	PIN_FIELD_BASE(202, 202, 5, 0x0020, 0x10, 1, 1),
-	PIN_FIELD_BASE(203, 203, 5, 0x0020, 0x10, 4, 1),
-	PIN_FIELD_BASE(204, 204, 8, 0x0010, 0x10, 1, 1),
-	PIN_FIELD_BASE(205, 205, 8, 0x0010, 0x10, 7, 1),
+	PIN_FIELD_BASE(118, 118, 4, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(119, 119, 4, 0x0040, 0x10, 18, 3),
+	PIN_FIELD_BASE(120, 120, 4, 0x0040, 0x10, 15, 3),
+	PIN_FIELD_BASE(121, 121, 4, 0x0050, 0x10, 3, 3),
+	PIN_FIELD_BASE(122, 122, 4, 0x0040, 0x10, 12, 3),
+	PIN_FIELD_BASE(123, 123, 4, 0x0050, 0x10, 0, 3),
+	PIN_FIELD_BASE(124, 124, 4, 0x0040, 0x10, 9, 3),
+	PIN_FIELD_BASE(125, 125, 4, 0x0040, 0x10, 27, 3),
+	PIN_FIELD_BASE(139, 139, 4, 0x0040, 0x10, 6, 3),
+	PIN_FIELD_BASE(140, 140, 4, 0x0040, 0x10, 24, 3),
+	PIN_FIELD_BASE(141, 141, 4, 0x0040, 0x10, 3, 3),
+	PIN_FIELD_BASE(142, 142, 4, 0x0040, 0x10, 21, 3),
+	PIN_FIELD_BASE(160, 160, 7, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(161, 161, 7, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(200, 200, 8, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(201, 201, 8, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(202, 202, 5, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(203, 203, 5, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(204, 204, 8, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(205, 205, 8, 0x0010, 0x10, 6, 3),
 };
 
-static const struct mtk_pin_field_calc mt8192_pin_e1_range[] = {
-	PIN_FIELD_BASE(118, 118, 4, 0x0040, 0x10, 2, 1),
-	PIN_FIELD_BASE(119, 119, 4, 0x0040, 0x10, 20, 1),
-	PIN_FIELD_BASE(120, 120, 4, 0x0040, 0x10, 17, 1),
-	PIN_FIELD_BASE(121, 121, 4, 0x0050, 0x10, 5, 1),
-	PIN_FIELD_BASE(122, 122, 4, 0x0040, 0x10, 14, 1),
-	PIN_FIELD_BASE(123, 123, 4, 0x0050, 0x10, 2, 1),
-	PIN_FIELD_BASE(124, 124, 4, 0x0040, 0x10, 11, 1),
-	PIN_FIELD_BASE(125, 125, 4, 0x0040, 0x10, 29, 1),
-	PIN_FIELD_BASE(139, 139, 4, 0x0040, 0x10, 8, 1),
-	PIN_FIELD_BASE(140, 140, 4, 0x0040, 0x10, 26, 1),
-	PIN_FIELD_BASE(141, 141, 4, 0x0040, 0x10, 5, 1),
-	PIN_FIELD_BASE(142, 142, 4, 0x0040, 0x10, 23, 1),
-	PIN_FIELD_BASE(160, 160, 7, 0x0030, 0x10, 2, 1),
-	PIN_FIELD_BASE(161, 161, 7, 0x0030, 0x10, 5, 1),
-	PIN_FIELD_BASE(200, 200, 8, 0x0010, 0x10, 5, 1),
-	PIN_FIELD_BASE(201, 201, 8, 0x0010, 0x10, 11, 1),
-	PIN_FIELD_BASE(202, 202, 5, 0x0020, 0x10, 2, 1),
-	PIN_FIELD_BASE(203, 203, 5, 0x0020, 0x10, 5, 1),
-	PIN_FIELD_BASE(204, 204, 8, 0x0010, 0x10, 2, 1),
-	PIN_FIELD_BASE(205, 205, 8, 0x0010, 0x10, 8, 1),
-};
 
 
 static const char * const mt8192_pinctrl_register_base_names[] = {
@@ -1355,9 +1313,7 @@ static const struct mtk_pin_reg_calc mt8192_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8192_pin_pupd_range),
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8192_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8192_pin_r1_range),
-	[PINCTRL_PIN_REG_DRV_EN] = MTK_RANGE(mt8192_pin_e1e0en_range),
-	[PINCTRL_PIN_REG_DRV_E0] = MTK_RANGE(mt8192_pin_e0_range),
-	[PINCTRL_PIN_REG_DRV_E1] = MTK_RANGE(mt8192_pin_e1_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8192_pin_drv_adv_range),
 };
 
 static const struct mtk_pin_soc mt8192_data = {
@@ -1376,8 +1332,8 @@ static const struct mtk_pin_soc mt8192_data = {
 	.drive_get = mtk_pinconf_drive_get_rev1,
 	.adv_pull_get = mtk_pinconf_adv_pull_get,
 	.adv_pull_set = mtk_pinconf_adv_pull_set,
-	.adv_drive_get = mtk_pinconf_adv_drive_get,
-	.adv_drive_set = mtk_pinconf_adv_drive_set,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
 };
 
 static const struct of_device_id mt8192_pinctrl_of_match[] = {
-- 
2.25.5


