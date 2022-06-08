Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17880C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpnjiKqjG1BWhq8t/ZoLcJjcg4BCyXfM/6mMme3f+eE=; b=q3bx64YOYSCzFz
	k7yh+075uCacCXQmkkfSne1G3b1wUErCFc3IDtco2UU9Q4XZ8hNUyOPB42fVV2hbQFw7qebStf9SI
	Qs+wwD2gDTDcsL+1nxMxkAXyWmMOM2Pszyc4m15wHU+ShLkg9+uhfpeqRFjgea9b7WVoTKn7m1TZ7
	zE7o4wWtIdzx4qRdw7thksntmJhpTEI7Z08wlpr0YsKDS8qVWrddhqzDpLKuz8jcCCgtuK2nU6DFr
	kTu4zAIv2mp8uEQo7L9RFRHfWaha+/gx6XupXW9WpdQ8sGocbM3b2bE3bGXkxOjgfdLRZwiJweGqi
	zrkg1NFPuk/uphv5bJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyoSf-00BAXu-RD; Wed, 08 Jun 2022 05:42:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyoSQ-00BASB-E9; Wed, 08 Jun 2022 05:42:19 +0000
X-UUID: 1e7947e1b03a4663816f9fa38d0da773-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:0ba63aaa-3b8b-4de1-b5fb-ca9e9c83a268,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:df940ce5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 1e7947e1b03a4663816f9fa38d0da773-20220607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2017810561; Tue, 07 Jun 2022 22:42:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 22:39:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Jun 2022 13:39:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Jun 2022 13:39:38 +0800
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
Subject: [PATCH v1 2/4] pinctrl: add drive for I2C related pins on mt8192
Date: Wed, 8 Jun 2022 13:39:07 +0800
Message-ID: <20220608053909.1252-3-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608053909.1252-1-guodong.liu@mediatek.com>
References: <20220608053909.1252-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_224218_566395_24225601 
X-CRM114-Status: GOOD (  10.97  )
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
for I2C used pins on mt8192

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 31 +++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index 9faf7001369d..d11ff5519e1e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1259,6 +1259,32 @@ static const struct mtk_pin_field_calc mt8192_pin_r1_range[] = {
 	PIN_FIELD_BASE(205, 205, 8, 0x0070, 0x10, 5, 1),
 };
 
+static const struct mtk_pin_field_calc mt8192_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(89, 89, 2, 0x0040, 0x10, 0, 5),
+	PIN_FIELD_BASE(90, 90, 2, 0x0040, 0x10, 5, 5),
+
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
+};
+
 static const struct mtk_pin_field_calc mt8192_pin_e1e0en_range[] = {
 	PIN_FIELD_BASE(118, 118, 4, 0x0040, 0x10, 0, 1),
 	PIN_FIELD_BASE(119, 119, 4, 0x0040, 0x10, 18, 1),
@@ -1357,6 +1383,7 @@ static const struct mtk_pin_reg_calc mt8192_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8192_pin_r1_range),
 	[PINCTRL_PIN_REG_DRV_EN] = MTK_RANGE(mt8192_pin_e1e0en_range),
 	[PINCTRL_PIN_REG_DRV_E0] = MTK_RANGE(mt8192_pin_e0_range),
+	[PINCTRL_PIN_REG_DRV_ADV]	= MTK_RANGE(mt8192_pin_drv_adv_range),
 	[PINCTRL_PIN_REG_DRV_E1] = MTK_RANGE(mt8192_pin_e1_range),
 };
 
@@ -1376,8 +1403,8 @@ static const struct mtk_pin_soc mt8192_data = {
 	.drive_get	= mtk_pinconf_drive_get_rev1,
 	.adv_pull_get = mtk_pinconf_adv_pull_get,
 	.adv_pull_set = mtk_pinconf_adv_pull_set,
-	.adv_drive_get = mtk_pinconf_adv_drive_get,
-	.adv_drive_set = mtk_pinconf_adv_drive_set,
+	.adv_drive_get	= mtk_pinconf_adv_drive_get_raw,
+	.adv_drive_set	= mtk_pinconf_adv_drive_set_raw,
 };
 
 static const struct of_device_id mt8192_pinctrl_of_match[] = {
-- 
2.25.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
