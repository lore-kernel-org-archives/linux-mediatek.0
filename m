Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D98C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ftv+zxGMO96uvHy3jqmtrqARC5DnXXOr5/mLoPd06k4=; b=0sCqZawu6Waeh75GWSPuBb4iY6
	/909Jd3pz88S5OqQ7TcjBJ7Uq1TAcFsi17AA/AF5SivxBkVtK4V6SGFWp4dz2s9HaFjG9h8zua+fx
	XxCev8OlQYvY4YF6Hi09YUds6imrp4e9aEEKfaiLOZRyw5pxP6fAg6i/yWV7vnx2pYpP5q1LU96eJ
	ntDekkVspwY2bEzWhlG9/RxnWDZxf7ZBMulygzNp+ADH1obrj8X5OPVH2Z+RatsXExWiaqkR9Iwg4
	I18XjxnhtMq1Q/SkCAgvvku0oGYH2gY8ZEnyldgTsZVg6Xb0UZK6UU0DTayvrdePNTu2JEIaSJjlV
	u7IUIhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2o1c-00CxCm-TF; Wed, 07 Dec 2022 06:35:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2o1a-00Cx4z-OE; Wed, 07 Dec 2022 06:35:24 +0000
X-UUID: ada4f3999fc541b6b572b98d9bbc74d0-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ftv+zxGMO96uvHy3jqmtrqARC5DnXXOr5/mLoPd06k4=;
	b=PeSup/zty3kKR6OXmfasnxVKzAJc03Frnntb2Nzq+gwrij3o41Kvu7PD+DopirmZVoarRFKYMhfLTHnFfuzyhZqhG2UPXe5DLjuTekhQ2jO/Lhy5++d2ltQY8ifhHzY6ZT2dcQcBhxaC9bzSM2sMHbjm4DHYtbGnnLtbo4gC7fk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:92953ed3-4f48-449b-b495-ecb0b1e1d7f1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:d0c2c716-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ada4f3999fc541b6b572b98d9bbc74d0-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <bayi.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2035683913; Tue, 06 Dec 2022 23:35:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 13:54:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 7 Dec 2022 13:54:37 +0800
From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Chuanhong Guo <gch981213@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, bayi cheng
	<bayi.cheng@mediatek.com>
Subject: [PATCH v2] spi: spi-mtk-nor: Add recovery mechanism for dma read timeout
Date: Wed, 7 Dec 2022 13:54:35 +0800
Message-ID: <20221207055435.30557-1-bayi.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_223522_821653_5702EB5C 
X-CRM114-Status: GOOD (  15.42  )
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

From: bayi cheng <bayi.cheng@mediatek.com>

The state machine of MTK spi nor controller may be disturbed by some
glitch signals from the relevant BUS during dma read, Although the
possibility of causing the dma read to fail is next to nothing,
However, if error-handling is not implemented, which makes the feature
somewhat risky.

Add an error-handling mechanism here, reset the state machine and
re-read the data when an error occurs.

Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
---
Change in v2:
  -Add a new function mtk_nor_reset() to reset host state machine.

Change in v1:
  -Reset the state machine when dma read fails and read again.
---
---
 drivers/spi/spi-mtk-nor.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index d167699a1a96..d07f50337f43 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -80,6 +80,9 @@
 #define MTK_NOR_REG_DMA_FADR		0x71c
 #define MTK_NOR_REG_DMA_DADR		0x720
 #define MTK_NOR_REG_DMA_END_DADR	0x724
+#define MTK_NOR_REG_CG_DIS		0x728
+#define MTK_NOR_SFC_SW_RST		BIT(2)
+
 #define MTK_NOR_REG_DMA_DADR_HB		0x738
 #define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
 
@@ -147,6 +150,15 @@ static inline int mtk_nor_cmd_exec(struct mtk_nor *sp, u32 cmd, ulong clk)
 	return ret;
 }
 
+static void mtk_nor_reset(struct mtk_nor *sp)
+{
+	mtk_nor_rmw(sp, MTK_NOR_REG_CG_DIS, 0, MTK_NOR_SFC_SW_RST);
+	mb(); /* flush previous writes */
+	mtk_nor_rmw(sp, MTK_NOR_REG_CG_DIS, MTK_NOR_SFC_SW_RST, 0);
+	mb(); /* flush previous writes */
+	writel(MTK_NOR_ENABLE_SF_CMD, sp->base + MTK_NOR_REG_WP);
+}
+
 static void mtk_nor_set_addr(struct mtk_nor *sp, const struct spi_mem_op *op)
 {
 	u32 addr = op->addr.val;
@@ -616,7 +628,15 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 			mtk_nor_set_addr(sp, op);
 			return mtk_nor_read_pio(sp, op);
 		} else {
-			return mtk_nor_read_dma(sp, op);
+			ret = mtk_nor_read_dma(sp, op);
+			if (unlikely(ret)) {
+				/* Handle rare bus glitch */
+				mtk_nor_reset(sp);
+				mtk_nor_setup_bus(sp, op);
+				return mtk_nor_read_dma(sp, op);
+			}
+
+			return ret;
 		}
 	}
 
-- 
2.18.0


