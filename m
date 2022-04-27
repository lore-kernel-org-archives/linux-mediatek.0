Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9451C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4BqE8AQnIRlrCnM0GVH+31B/0bFPIhj1OqDHP2Pl0A=; b=us2BIXZBlMtM+N
	YuOPFzt8/bpbFk7AS2v7LKYcU64TN87ToVwi1SUHLeE5LGMMc9VBKoOXCCEqi6+OY8i+zwwVSTzhS
	ZahXnj0883GQr7SMg313+iQzZ2xm8H7dFxxXFEUj88pXBw3SRa+Gu/Y/66zGkQ88e4Qo2FD6fkoJd
	t/oVTfQ5FUxOtfzleG580UUvEjuf3b0zQYk3cRXaPv4nADXjQ35A1cRDCoyPmZ38MXDpya9HB+yCH
	hclWhFwwMBNGFRiTbzN04oRptQB9SaKoIjOHoyQ7g6xDU45y9R6Bhr8P02lnpchBpeei/bjyl1Hub
	rOsJG6OC6Hyif5sGa1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njYGR-00HC18-1v; Wed, 27 Apr 2022 03:22:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njYG4-00HBtb-Te; Wed, 27 Apr 2022 03:22:30 +0000
X-UUID: 1f3079dad4cc4096b2c44f736694f30e-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7969b643-c99f-4413-b063-c984c3e168e1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:6c719cc6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1f3079dad4cc4096b2c44f736694f30e-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 292825357; Tue, 26 Apr 2022 20:22:23 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 20:12:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 11:12:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 11:12:13 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V4 02/15] clk: mediatek: reset: Fix written reset bit offset
Date: Wed, 27 Apr 2022 11:09:37 +0800
Message-ID: <20220427030950.23395-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_202229_013406_673D9629 
X-CRM114-Status: GOOD (  12.52  )
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

Original assert/deassert bit is BIT(0), but it's more resonable to modify
them to BIT(id % 32) which is based on id.

This patch will not influence any previous driver because the reset is
only used for thermal. The id (MT8183_INFRACFG_AO_THERM_SW_RST) is 0.

Fixes: 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 9f3cb22aea1b..5191becb45dd 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -18,7 +18,7 @@ static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
 	unsigned int reg = data->regofs + ((id / 32) << 4);
 
-	return regmap_write(data->regmap, reg, 1);
+	return regmap_write(data->regmap, reg, BIT(id % 32));
 }
 
 static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
@@ -27,7 +27,7 @@ static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
 	unsigned int reg = data->regofs + ((id / 32) << 4) + 0x4;
 
-	return regmap_write(data->regmap, reg, 1);
+	return regmap_write(data->regmap, reg, BIT(id % 32));
 }
 
 static int mtk_reset_assert(struct reset_controller_dev *rcdev,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
