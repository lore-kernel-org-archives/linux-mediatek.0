Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8984FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JVyDOlM1C/Af0pe4YtQCU7G1hYMALL8aNUZywxxYaY=; b=K2E2kHU/Z1yppy
	movYarwDS+CLmhZsXwne0CU6lvBrY9QCfQck/2L8PB/Y2i/hnav7Y6GHh6Il1wUrQ/hAyXiZrdPR2
	wiP5SpLVHJG7NgmfSZLf+WCC4m+9BnVGK2mcUmJSmiF+46jTtTFnF+/CiVm6kbAsxwvp1+3IOpEny
	kNYneHHBPmf2LyO84W2w3/lmpREaRi/+E83Y2lzZkm/nW4tNESjzm61wsfTj7u4QOKVkcFFTd2rDm
	VR+FfwOEF1tKDHVIlxzfd+ISGdOixUrCicHXxt+Rjtr0Ki6Ub+/rMBgiYNvsyopRfJeDzMpoLbGDm
	TLDQMh9yiWFWI1hG1Puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhAD8-0098xU-B6; Wed, 20 Apr 2022 13:17:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhABK-0098HJ-LY; Wed, 20 Apr 2022 13:15:44 +0000
X-UUID: a7bbec7708a54fc393d4d0536237d826-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:aa855d95-3715-447b-a420-c8f84edb9d76, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:f8135df0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a7bbec7708a54fc393d4d0536237d826-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1180242849; Wed, 20 Apr 2022 06:15:38 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 06:05:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 21:05:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Apr 2022 21:05:29 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 03/12] clk: mediatek: reset: Refine functions of set_clr
Date: Wed, 20 Apr 2022 21:05:18 +0800
Message-ID: <20220420130527.23200-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_061542_743842_F815A64F 
X-CRM114-Status: GOOD (  11.28  )
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

To make driver more readable, revise functions of set_clr.
- Add to_rst_data().
- Extract common code within assert and deassert to
  mtk_reset_update_set_clr().

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/reset.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 9110d0b4229f..6574b19daf0f 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -20,26 +20,36 @@ struct mtk_reset {
 	struct reset_controller_dev rcdev;
 };
 
-static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+static inline struct mtk_reset *to_rst_data(struct reset_controller_dev *rcdev)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-	unsigned int reg = data->regofs + ((id / 32) << 4);
+	return container_of(rcdev, struct mtk_reset, rcdev);
+}
 
-	return regmap_write(data->regmap, reg, BIT(id % 32));
+static int mtk_reset_update_set_clr(struct reset_controller_dev *rcdev,
+				    unsigned long id, bool deassert)
+{
+	struct mtk_reset *data = to_rst_data(rcdev);
+	unsigned int deassert_ofs = deassert ? 0x4 : 0;
+
+	return regmap_write(data->regmap,
+			    data->regofs + ((id / 32) << 4) + deassert_ofs,
+			    BIT(id % 32));
 }
 
-static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
+				    unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-	unsigned int reg = data->regofs + ((id / 32) << 4) + 0x4;
+	return mtk_reset_update_set_clr(rcdev, id, false);
+}
 
-	return regmap_write(data->regmap, reg, BIT(id % 32));
+static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	return mtk_reset_update_set_clr(rcdev, id, true);
 }
 
 static int mtk_reset_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+			     unsigned long id)
 {
 	int ret;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
