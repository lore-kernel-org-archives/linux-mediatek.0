Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lGvRC5Kr1daVlVGhBwnOY1P60Za7a+/wprTjSBOd50=; b=i/GSSm9pXlefhX
	ERnt393Hm4ThtAnTzpeYdal18dNpJiybsSdkZG6R3ezzYdoTuFmWC649iMhDRXTp1exRwxex8mvsP
	YcSeIW+lvHN2ySGZEJXp0bJbQHTa9HC/XA69+bu7TlDp8nZxq+Q/VLO6GnaFDixPxy9AsGC4A6H76
	oULYpjZOUOwD9JjbcyKVbL8uA0RODiXTXHESLMAb5A3WVfC3kjtrvPkZW9iddY8MyP0Q2Mjqoil6c
	9DX4QvUaGFbKLwI38Tnl5Vfgqjdam3NxKav0lLRBaZZnG46zXWzIUP4BmOj3i7kzWhUoKIZk05v1B
	/ahouUmQLaghFAVPsXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmYX-00GQzO-PH; Fri, 22 Apr 2022 06:14:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmTq-00GOr5-U0; Fri, 22 Apr 2022 06:09:25 +0000
X-UUID: 4ad5b9769b894e9fbb81e71d701f1cc0-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:99c2a879-6355-417e-9b4f-6eb8c9c34679, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:f37cbdef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4ad5b9769b894e9fbb81e71d701f1cc0-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1241744965; Thu, 21 Apr 2022 23:09:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:02:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 14:01:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 14:01:56 +0800
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
Subject: [PATCH V3 04/17] clk: mediatek: reset: Extract common drivers to
 update function
Date: Fri, 22 Apr 2022 14:01:39 +0800
Message-ID: <20220422060152.13534-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_230922_994599_1E6C11DB 
X-CRM114-Status: UNSURE (   9.62  )
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

To make drivers more clear and readable, we extract common code
within assert and deassert to mtk_reset_update_set_clr() and
mtk_reset_update().

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/reset.c | 38 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 5cbbcc22a4fc..22fa9f09752c 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -12,24 +12,27 @@
 
 #include "reset.h"
 
-static int mtk_reset_assert(struct reset_controller_dev *rcdev,
-			    unsigned long id)
+static int mtk_reset_update(struct reset_controller_dev *rcdev,
+			    unsigned long id, bool deassert)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	unsigned int val = deassert ? 0 : ~0;
 
 	return regmap_update_bits(data->regmap,
 				  data->regofs + ((id / 32) << 2),
-				  BIT(id % 32), ~0);
+				  BIT(id % 32), val);
+}
+
+static int mtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	return mtk_reset_update(rcdev, id, false);
 }
 
 static int mtk_reset_deassert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-
-	return regmap_update_bits(data->regmap,
-				  data->regofs + ((id / 32) << 2),
-				  BIT(id % 32), 0);
+	return mtk_reset_update(rcdev, id, true);
 }
 
 static int mtk_reset(struct reset_controller_dev *rcdev, unsigned long id)
@@ -43,24 +46,27 @@ static int mtk_reset(struct reset_controller_dev *rcdev, unsigned long id)
 	return mtk_reset_deassert(rcdev, id);
 }
 
-static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
-				    unsigned long id)
+static int mtk_reset_update_set_clr(struct reset_controller_dev *rcdev,
+				    unsigned long id, bool deassert)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	unsigned int deassert_ofs = deassert ? 0x4 : 0;
 
 	return regmap_write(data->regmap,
-			    data->regofs + ((id / 32) << 4),
+			    data->regofs + ((id / 32) << 4) + deassert_ofs,
 			    BIT(id % 32));
 }
 
+static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	return mtk_reset_update_set_clr(rcdev, id, false);
+}
+
 static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
 				      unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-
-	return regmap_write(data->regmap,
-			    data->regofs + ((id / 32) << 4) + 0x4,
-			    BIT(id % 32));
+	return mtk_reset_update_set_clr(rcdev, id, true);
 }
 
 static int mtk_reset_set_clr(struct reset_controller_dev *rcdev,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
