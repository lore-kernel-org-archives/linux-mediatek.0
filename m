Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38634C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdDd3KGPmAasdosllxeIhN7mJX3Wx2OSRIBz5BGp3M4=; b=j6Cc8UfKsaoueD
	kk2j+DD37DlINNevojEr7QF65OyDT8ODmKJqeJSC6mmIPtGv3IbADFZ2NCihBVloY/pxEkbF7LfeE
	iRVGSxwxr8qUtWZFnhGFoc0neYQN9jnLnRsLhLAfljRHMTqoMmPLsq4SCoVzjPmidqrCk5mAR0vHL
	zSTTRGbn2j9L3uoiR7Yf3hC9Cgu1AcdMuOsXIApv1tUyy/z0O+YvlgAZaJw4CnNiHmjDpI71Qd27Z
	5JMkIcXbmC7ay8tdOQWjNDNEW4SPSSSN9eTildvlCc8+D1U43UtPStKR31NTCuf3cXtUDfdZ2ZIe0
	Md2o3rVhQkpaODXZvXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njY6g-00H8qR-5v; Wed, 27 Apr 2022 03:12:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njY6F-00H8cT-1X; Wed, 27 Apr 2022 03:12:20 +0000
X-UUID: 833c0b9f1ac64a26b0dbe01b674fbcaf-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:588d70a6-cece-452a-a731-134b392714ed, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:b601d42e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 833c0b9f1ac64a26b0dbe01b674fbcaf-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 339590521; Tue, 26 Apr 2022 20:12:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 20:12:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 11:12:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 11:12:14 +0800
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
Subject: [PATCH V4 03/15] clk: mediatek: reset: Refine and reorder functions
 in reset.c
Date: Wed, 27 Apr 2022 11:09:38 +0800
Message-ID: <20220427030950.23395-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_201219_146069_7A46BD6A 
X-CRM114-Status: GOOD (  13.05  )
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

To make drivers more readable, we modify the indentation of the drivers
and reorder the location of functions.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/reset.c | 68 +++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 5191becb45dd..5cbbcc22a4fc 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -12,56 +12,59 @@
 
 #include "reset.h"
 
-static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+static int mtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-	unsigned int reg = data->regofs + ((id / 32) << 4);
 
-	return regmap_write(data->regmap, reg, BIT(id % 32));
+	return regmap_update_bits(data->regmap,
+				  data->regofs + ((id / 32) << 2),
+				  BIT(id % 32), ~0);
 }
 
-static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+static int mtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-	unsigned int reg = data->regofs + ((id / 32) << 4) + 0x4;
 
-	return regmap_write(data->regmap, reg, BIT(id % 32));
+	return regmap_update_bits(data->regmap,
+				  data->regofs + ((id / 32) << 2),
+				  BIT(id % 32), 0);
 }
 
-static int mtk_reset_assert(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+static int mtk_reset(struct reset_controller_dev *rcdev, unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	int ret;
+
+	ret = mtk_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
 
-	return regmap_update_bits(data->regmap, data->regofs + ((id / 32) << 2),
-			BIT(id % 32), ~0);
+	return mtk_reset_deassert(rcdev, id);
 }
 
-static int mtk_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
+static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
+				    unsigned long id)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
 
-	return regmap_update_bits(data->regmap, data->regofs + ((id / 32) << 2),
-			BIT(id % 32), 0);
+	return regmap_write(data->regmap,
+			    data->regofs + ((id / 32) << 4),
+			    BIT(id % 32));
 }
 
-static int mtk_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
+				      unsigned long id)
 {
-	int ret;
-
-	ret = mtk_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
+	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
 
-	return mtk_reset_deassert(rcdev, id);
+	return regmap_write(data->regmap,
+			    data->regofs + ((id / 32) << 4) + 0x4,
+			    BIT(id % 32));
 }
 
 static int mtk_reset_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+			     unsigned long id)
 {
 	int ret;
 
@@ -84,8 +87,9 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
 };
 
 static void mtk_register_reset_controller_common(struct device_node *np,
-			unsigned int num_regs, int regofs,
-			const struct reset_control_ops *reset_ops)
+						 unsigned int num_regs,
+						 int regofs,
+						 const struct reset_control_ops *reset_ops)
 {
 	struct mtk_reset *data;
 	int ret;
@@ -117,17 +121,17 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 }
 
 void mtk_register_reset_controller(struct device_node *np,
-	unsigned int num_regs, int regofs)
+				   unsigned int num_regs, int regofs)
 {
 	mtk_register_reset_controller_common(np, num_regs, regofs,
-		&mtk_reset_ops);
+					     &mtk_reset_ops);
 }
 
 void mtk_register_reset_controller_set_clr(struct device_node *np,
-	unsigned int num_regs, int regofs)
+					   unsigned int num_regs, int regofs)
 {
 	mtk_register_reset_controller_common(np, num_regs, regofs,
-		&mtk_reset_ops_set_clr);
+					     &mtk_reset_ops_set_clr);
 }
 
 MODULE_LICENSE("GPL");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
