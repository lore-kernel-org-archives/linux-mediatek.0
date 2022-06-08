Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B12C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 05:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtxJNWimZ4FTkZeqVOStHYX+jBmPAGH4cGOANpznCzY=; b=L+056MUhk6rGYY
	3bYS4CK4mkCx5nEkaVkbvZGYJ921SblFiMmuKcBshUSCfmRJbwq1Br5Sq5JMAmfW+9M6v/cgBqaea
	6KiXGyLXt7oLCuYbIrXSbMvWkvQ+WFru6WOzdkpGzvmOxCx6Ispjey6E90sAJ3u/nHPQwXzL5Gugz
	yq9ZpMmlxQNWXC6cfakWYYtPZC2X7yjuMbXtwrkJKvBsjNb17ODINLsSr/Y8MOLG3re+tI7TGTn9q
	SGVSkXwNPU8//BtYUDnnLDxpa3txbOSzo7L8+ONn1x+e234+Cbe1ssdfuxvBSdPpk8Ub/QvDmvRVJ
	Ij0t0hFcWw73/X2qn8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyoSp-00BAcF-OW; Wed, 08 Jun 2022 05:42:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyoSQ-00BAS9-E8; Wed, 08 Jun 2022 05:42:20 +0000
X-UUID: 4e4b5598dac845a69aa221bf2c25ce7e-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:b1c45ff3-131f-4b1f-9923-503939dd36c3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:-20
X-CID-META: VersionHash:2a19b09,CLOUDID:45f1967e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 4e4b5598dac845a69aa221bf2c25ce7e-20220607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 908658777; Tue, 07 Jun 2022 22:42:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 22:39:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 13:39:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Jun 2022 13:39:50 +0800
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
Subject: [PATCH v1 4/4] pinctrl: mediatek: fix the pinconf definition of some GPIO pins
Date: Wed, 8 Jun 2022 13:39:09 +0800
Message-ID: <20220608053909.1252-5-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608053909.1252-1-guodong.liu@mediatek.com>
References: <20220608053909.1252-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_224218_568246_29512B78 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove pin definitions that do not support the R0 & R1 pinconfig property

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 60 -----------------------
 1 file changed, 60 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index 1486c141ee8c..13784a92a536 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1107,24 +1107,10 @@ static const struct mtk_pin_field_calc mt8192_pin_pupd_range[] = {
 	PIN_FIELD_BASE(54, 54, 1, 0x0060, 0x10, 2, 1),
 	PIN_FIELD_BASE(55, 55, 1, 0x0060, 0x10, 4, 1),
 	PIN_FIELD_BASE(56, 56, 1, 0x0060, 0x10, 3, 1),
-	PIN_FIELD_BASE(118, 118, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(119, 119, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(120, 120, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(121, 121, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(122, 122, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(123, 123, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(124, 124, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(125, 125, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(139, 139, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(140, 140, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(141, 141, 4, 0x00e0, 0x10, 31, 1),
-	PIN_FIELD_BASE(142, 142, 4, 0x00e0, 0x10, 31, 1),
 	PIN_FIELD_BASE(152, 152, 7, 0x0090, 0x10, 3, 1),
 	PIN_FIELD_BASE(153, 153, 7, 0x0090, 0x10, 2, 1),
 	PIN_FIELD_BASE(154, 154, 7, 0x0090, 0x10, 0, 1),
 	PIN_FIELD_BASE(155, 155, 7, 0x0090, 0x10, 1, 1),
-	PIN_FIELD_BASE(160, 160, 7, 0x00f0, 0x10, 31, 1),
-	PIN_FIELD_BASE(161, 161, 7, 0x00f0, 0x10, 31, 1),
 	PIN_FIELD_BASE(183, 183, 9, 0x0030, 0x10, 1, 1),
 	PIN_FIELD_BASE(184, 184, 9, 0x0030, 0x10, 2, 1),
 	PIN_FIELD_BASE(185, 185, 9, 0x0030, 0x10, 4, 1),
@@ -1137,12 +1123,6 @@ static const struct mtk_pin_field_calc mt8192_pin_pupd_range[] = {
 	PIN_FIELD_BASE(192, 192, 9, 0x0030, 0x10, 0, 1),
 	PIN_FIELD_BASE(193, 193, 9, 0x0030, 0x10, 5, 1),
 	PIN_FIELD_BASE(194, 194, 9, 0x0030, 0x10, 11, 1),
-	PIN_FIELD_BASE(200, 200, 8, 0x0070, 0x10, 31, 1),
-	PIN_FIELD_BASE(201, 201, 8, 0x0070, 0x10, 31, 1),
-	PIN_FIELD_BASE(202, 202, 5, 0x0070, 0x10, 31, 1),
-	PIN_FIELD_BASE(203, 203, 5, 0x0070, 0x10, 31, 1),
-	PIN_FIELD_BASE(204, 204, 8, 0x0070, 0x10, 31, 1),
-	PIN_FIELD_BASE(205, 205, 8, 0x0070, 0x10, 31, 1),
 };
 
 static const struct mtk_pin_field_calc mt8192_pin_r0_range[] = {
@@ -1164,24 +1144,10 @@ static const struct mtk_pin_field_calc mt8192_pin_r0_range[] = {
 	PIN_FIELD_BASE(54, 54, 1, 0x0080, 0x10, 2, 1),
 	PIN_FIELD_BASE(55, 55, 1, 0x0080, 0x10, 4, 1),
 	PIN_FIELD_BASE(56, 56, 1, 0x0080, 0x10, 3, 1),
-	PIN_FIELD_BASE(118, 118, 4, 0x00e0, 0x10, 0, 1),
-	PIN_FIELD_BASE(119, 119, 4, 0x00e0, 0x10, 12, 1),
-	PIN_FIELD_BASE(120, 120, 4, 0x00e0, 0x10, 10, 1),
-	PIN_FIELD_BASE(121, 121, 4, 0x00e0, 0x10, 22, 1),
-	PIN_FIELD_BASE(122, 122, 4, 0x00e0, 0x10, 8, 1),
-	PIN_FIELD_BASE(123, 123, 4, 0x00e0, 0x10, 20, 1),
-	PIN_FIELD_BASE(124, 124, 4, 0x00e0, 0x10, 6, 1),
-	PIN_FIELD_BASE(125, 125, 4, 0x00e0, 0x10, 18, 1),
-	PIN_FIELD_BASE(139, 139, 4, 0x00e0, 0x10, 4, 1),
-	PIN_FIELD_BASE(140, 140, 4, 0x00e0, 0x10, 16, 1),
-	PIN_FIELD_BASE(141, 141, 4, 0x00e0, 0x10, 2, 1),
-	PIN_FIELD_BASE(142, 142, 4, 0x00e0, 0x10, 14, 1),
 	PIN_FIELD_BASE(152, 152, 7, 0x00c0, 0x10, 3, 1),
 	PIN_FIELD_BASE(153, 153, 7, 0x00c0, 0x10, 2, 1),
 	PIN_FIELD_BASE(154, 154, 7, 0x00c0, 0x10, 0, 1),
 	PIN_FIELD_BASE(155, 155, 7, 0x00c0, 0x10, 1, 1),
-	PIN_FIELD_BASE(160, 160, 7, 0x00f0, 0x10, 0, 1),
-	PIN_FIELD_BASE(161, 161, 7, 0x00f0, 0x10, 2, 1),
 	PIN_FIELD_BASE(183, 183, 9, 0x0040, 0x10, 1, 1),
 	PIN_FIELD_BASE(184, 184, 9, 0x0040, 0x10, 2, 1),
 	PIN_FIELD_BASE(185, 185, 9, 0x0040, 0x10, 4, 1),
@@ -1194,12 +1160,6 @@ static const struct mtk_pin_field_calc mt8192_pin_r0_range[] = {
 	PIN_FIELD_BASE(192, 192, 9, 0x0040, 0x10, 0, 1),
 	PIN_FIELD_BASE(193, 193, 9, 0x0040, 0x10, 5, 1),
 	PIN_FIELD_BASE(194, 194, 9, 0x0040, 0x10, 11, 1),
-	PIN_FIELD_BASE(200, 200, 8, 0x0070, 0x10, 2, 1),
-	PIN_FIELD_BASE(201, 201, 8, 0x0070, 0x10, 6, 1),
-	PIN_FIELD_BASE(202, 202, 5, 0x0070, 0x10, 0, 1),
-	PIN_FIELD_BASE(203, 203, 5, 0x0070, 0x10, 2, 1),
-	PIN_FIELD_BASE(204, 204, 8, 0x0070, 0x10, 0, 1),
-	PIN_FIELD_BASE(205, 205, 8, 0x0070, 0x10, 4, 1),
 };
 
 static const struct mtk_pin_field_calc mt8192_pin_r1_range[] = {
@@ -1221,24 +1181,10 @@ static const struct mtk_pin_field_calc mt8192_pin_r1_range[] = {
 	PIN_FIELD_BASE(54, 54, 1, 0x0090, 0x10, 2, 1),
 	PIN_FIELD_BASE(55, 55, 1, 0x0090, 0x10, 4, 1),
 	PIN_FIELD_BASE(56, 56, 1, 0x0090, 0x10, 3, 1),
-	PIN_FIELD_BASE(118, 118, 4, 0x00e0, 0x10, 1, 1),
-	PIN_FIELD_BASE(119, 119, 4, 0x00e0, 0x10, 13, 1),
-	PIN_FIELD_BASE(120, 120, 4, 0x00e0, 0x10, 11, 1),
-	PIN_FIELD_BASE(121, 121, 4, 0x00e0, 0x10, 23, 1),
-	PIN_FIELD_BASE(122, 122, 4, 0x00e0, 0x10, 9, 1),
-	PIN_FIELD_BASE(123, 123, 4, 0x00e0, 0x10, 21, 1),
-	PIN_FIELD_BASE(124, 124, 4, 0x00e0, 0x10, 7, 1),
-	PIN_FIELD_BASE(125, 125, 4, 0x00e0, 0x10, 19, 1),
-	PIN_FIELD_BASE(139, 139, 4, 0x00e0, 0x10, 5, 1),
-	PIN_FIELD_BASE(140, 140, 4, 0x00e0, 0x10, 17, 1),
-	PIN_FIELD_BASE(141, 141, 4, 0x00e0, 0x10, 3, 1),
-	PIN_FIELD_BASE(142, 142, 4, 0x00e0, 0x10, 15, 1),
 	PIN_FIELD_BASE(152, 152, 7, 0x00d0, 0x10, 3, 1),
 	PIN_FIELD_BASE(153, 153, 7, 0x00d0, 0x10, 2, 1),
 	PIN_FIELD_BASE(154, 154, 7, 0x00d0, 0x10, 0, 1),
 	PIN_FIELD_BASE(155, 155, 7, 0x00d0, 0x10, 1, 1),
-	PIN_FIELD_BASE(160, 160, 7, 0x00f0, 0x10, 1, 1),
-	PIN_FIELD_BASE(161, 161, 7, 0x00f0, 0x10, 3, 1),
 	PIN_FIELD_BASE(183, 183, 9, 0x0050, 0x10, 1, 1),
 	PIN_FIELD_BASE(184, 184, 9, 0x0050, 0x10, 2, 1),
 	PIN_FIELD_BASE(185, 185, 9, 0x0050, 0x10, 4, 1),
@@ -1251,12 +1197,6 @@ static const struct mtk_pin_field_calc mt8192_pin_r1_range[] = {
 	PIN_FIELD_BASE(192, 192, 9, 0x0050, 0x10, 0, 1),
 	PIN_FIELD_BASE(193, 193, 9, 0x0050, 0x10, 5, 1),
 	PIN_FIELD_BASE(194, 194, 9, 0x0050, 0x10, 11, 1),
-	PIN_FIELD_BASE(200, 200, 8, 0x0070, 0x10, 3, 1),
-	PIN_FIELD_BASE(201, 201, 8, 0x0070, 0x10, 7, 1),
-	PIN_FIELD_BASE(202, 202, 5, 0x0070, 0x10, 1, 1),
-	PIN_FIELD_BASE(203, 203, 5, 0x0070, 0x10, 3, 1),
-	PIN_FIELD_BASE(204, 204, 8, 0x0070, 0x10, 1, 1),
-	PIN_FIELD_BASE(205, 205, 8, 0x0070, 0x10, 5, 1),
 };
 
 static const struct mtk_pin_field_calc mt8192_pin_drv_adv_range[] = {
-- 
2.25.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
