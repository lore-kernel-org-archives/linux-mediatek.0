Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E8FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CC1heQJ2agAwz4rIPE+SNjcROSN6ODN9feKQXo2URA=; b=HGhKlewFuHzpKgELElh/DuydnM
	CzuE/650R9rNn35MfAYomT/DmT6AYWnel1VstIcnzVlmOqeNuf9rP22JbUsTSRELZCOis+Z5dhEM5
	Zhc59FD+Tp/fRPccfHlVqEXBBuQ5LC4rJB/F0PsCT7drZMjIR2PP6FF+Ls5AYEA2FWgMrUhCXW2eA
	x43c3WbW18KH5EUWWHmBkt6FPB23VHca0WVsI/a7cZG+oHIQ6ESy+swH+87b0h+ml+wCZRiIHa4Kd
	FrqLHq3E8UaVwakI+RmczdQocJeSvTHfeaD30WVweacnYyiU6or4U3IIOhYCJ1bbIguyAvm+HE7qz
	0PhO2T/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMW7-009Gc1-Pb; Wed, 14 Sep 2022 07:09:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMW5-009GYM-D1; Wed, 14 Sep 2022 07:09:02 +0000
X-UUID: 5bbfbd0e0b894b439ffe1e0330d15ec5-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6CC1heQJ2agAwz4rIPE+SNjcROSN6ODN9feKQXo2URA=;
	b=Kao/kMQNr1mot/Z6kWW1iJj/SXz8cHNp80hLragLvU+yC91+A3bxZAYbpkmTasvlAr91+NskYUiBr7CR0obNtABZb6/I4L/k25/OfUrHcmkar5hpeSCA9L9qFNQZ5YFYFHbuI96WnoSqQ1X3KEtYBepgzI/R9d7zVE+Fe5ZbzSo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5ce9a92f-81db-425b-85b9-7bc448ecce48,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:250561ec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5bbfbd0e0b894b439ffe1e0330d15ec5-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1915621699; Wed, 14 Sep 2022 00:08:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 14:07:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 14:07:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 4/7] phy: phy-mtk-tphy: disable hardware efuse when set INTR
Date: Wed, 14 Sep 2022 14:07:43 +0800
Message-ID: <20220914060746.10004-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_000901_544788_FDA6D787 
X-CRM114-Status: GOOD (  11.92  )
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

INTR's value is able autoload from hardware efuse by default, when
software tries to update its value, should disable hardware efuse
firstly.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: add reviewed-by: AngeloGioacchino
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 986fde0f63a0..7f40b8b052bd 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -874,9 +874,14 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_TERM_SEL,
 				    PA1_RG_TERM_SEL_VAL(instance->eye_term));
 
-	if (instance->intr)
+	if (instance->intr) {
+		if (u2_banks->misc)
+			mtk_phy_set_bits(u2_banks->misc + U3P_MISC_REG1,
+					 MR1_EFUSE_AUTO_LOAD_DIS);
+
 		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_INTR_CAL,
 				    PA1_RG_INTR_CAL_VAL(instance->intr));
+	}
 
 	if (instance->discth)
 		mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH,
-- 
2.18.0


