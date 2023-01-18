Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B80C38159
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 06:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=73BY3Vgbw3t6Q3sPe77rJeiSjxD1qMfAnvy9gFdOjsY=; b=kqg4PEe566xTlt4Bbu+Jt0ZGLI
	SCtRxiHUtOV0rfyuzkoXMdlHWQ8xRby/Pm46U7TALYqPQSWeExgl/CknSKy76VVPkg4Pu3NEmHjcH
	ijTizyQcthpmAjLoxU2+Bi15cGxMnynzTfEHEYoi2bNwwHkps3ysGVt4sR8Kjdr5vCN55zfeLg8FZ
	rqnlF8cqNTLMYjfA8ywbhjbvBs8Amn4KoDTRihOZ0yQ0Ah7hc/dCIRguBp19DkSDuHa/1waSpapRv
	q9jAZhJstBag/at8V3Z6XVFDtoU0+wBJsMjuTGkULIhb/YCNc7tYxalX88/hc9kgDaUOrpnB7aB7N
	fc77fi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1q5-00H4gA-Vy; Wed, 18 Jan 2023 06:22:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1pp-00H4Y9-Oa; Wed, 18 Jan 2023 06:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=73BY3Vgbw3t6Q3sPe77rJeiSjxD1qMfAnvy9gFdOjsY=; b=Hjc6shoE9vEcVZ5XdOiuKP+Z8G
	TLLXMhUOKFDSptXim/Ri2EvjnpbAuFJJ7iXBlOPQ/T0jPvcalqtl1Q7uZO7G6+SB4e4SDnU5/78oR
	YLcCxS7pe6CDIsqk+wM67tTASJWZnsUr5xESYOLmInHVbhbqKbtbRpJTnrkgkiQxgJdYVN6YsbyL4
	5vNbCTQTdQxJw69r+51lKmZEziltHfRSkfNfY1YnfwFNXrzIjpsTKzRNEFjNsixEZ3ylVCYMDv6v+
	BvOd0hnNBkEWYWwFQRSYqokIk1sCRvQeVqcgJ1uMFmVnpmtGu2rxchX83u2eN251EBlfptuq5xYCt
	r3f0GutQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI1pZ-006BAo-3C;
	Wed, 18 Jan 2023 06:21:58 +0000
X-UUID: 6829667096f811eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=73BY3Vgbw3t6Q3sPe77rJeiSjxD1qMfAnvy9gFdOjsY=;
	b=ClTuv/67iyuxVqUGKl6AMYFiUx2wc+vnmSnpIZRv2TLiaf84rzk6WEu8xGPmQSRsw18UJ+sf8lgAUUIfVsWTrXLHyZY2AaqqflsWZyNpipL3MggFZBI7DWGz7Y1AheQxnzjpSiemn4iVjuwIYlv1lLT57KROh7i1y3sjfWgMHU4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:75208bb7-676b-47d9-b4fc-eced6acc4763,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:f5edfa54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 6829667096f811eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1906178724; Tue, 17 Jan 2023 23:21:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 14:21:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 14:21:19 +0800
From: Guodong Liu <Guodong.Liu@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Light
 Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu
	<Guodong.Liu@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: Fix the drive register definition of some Pins
Date: Wed, 18 Jan 2023 14:21:16 +0800
Message-ID: <20230118062116.26315-1-Guodong.Liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_062154_761930_3D51422A 
X-CRM114-Status: GOOD (  12.04  )
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

The drive adjustment register definition of gpio13 and gpio81 is wrong:
"the start address for the range" of gpio18 is corrected to 0x000,
"the start bit for the first register within the range" of gpio81 is
corrected to 24.

Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
Signed-off-by: Guodong Liu <Guodong.Liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index 563693d3d4c2..c21ca33b2d59 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -659,7 +659,7 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_range[] = {
 	PIN_FIELD_BASE(10, 10, 4, 0x010, 0x10, 9, 3),
 	PIN_FIELD_BASE(11, 11, 4, 0x000, 0x10, 24, 3),
 	PIN_FIELD_BASE(12, 12, 4, 0x010, 0x10, 12, 3),
-	PIN_FIELD_BASE(13, 13, 4, 0x010, 0x10, 27, 3),
+	PIN_FIELD_BASE(13, 13, 4, 0x000, 0x10, 27, 3),
 	PIN_FIELD_BASE(14, 14, 4, 0x010, 0x10, 15, 3),
 	PIN_FIELD_BASE(15, 15, 4, 0x010, 0x10, 0, 3),
 	PIN_FIELD_BASE(16, 16, 4, 0x010, 0x10, 18, 3),
@@ -708,7 +708,7 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_range[] = {
 	PIN_FIELD_BASE(78, 78, 3, 0x000, 0x10, 15, 3),
 	PIN_FIELD_BASE(79, 79, 3, 0x000, 0x10, 18, 3),
 	PIN_FIELD_BASE(80, 80, 3, 0x000, 0x10, 21, 3),
-	PIN_FIELD_BASE(81, 81, 3, 0x000, 0x10, 28, 3),
+	PIN_FIELD_BASE(81, 81, 3, 0x000, 0x10, 24, 3),
 	PIN_FIELD_BASE(82, 82, 3, 0x000, 0x10, 27, 3),
 	PIN_FIELD_BASE(83, 83, 3, 0x010, 0x10, 0, 3),
 	PIN_FIELD_BASE(84, 84, 3, 0x010, 0x10, 3, 3),
-- 
2.25.1


