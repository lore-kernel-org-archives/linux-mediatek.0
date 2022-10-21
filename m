Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BCC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDfh+x5FytpWi0W8sYJ9u2fBze82/hHd4fVkyhEFTUQ=; b=0GVEwo6QTUSNr/dbr8vJSCj3Tf
	6JT7hhYD37nWnxXT54JRu8viiEvV3jFqMposXT8V5XTW51PuIxT++A7MPGNqReaf6n+Ztf2NA0gpT
	cD3GsRrjj6LefvN5sfHZVCYFW+nRX0z9Ju7oK4rmlEUk6nZLyITQsSLq9eDE7phaT0eNpv/tOdcA3
	nnZEpkDJ7AvP3WEf7kX6fgsBSVLvOlTAa9e1Wnntv4expOLnqbAHt+fZHvH4FC3wbX+Z5mJW/5DF4
	GmzSZDEYcK4k5TF2ZXB0d+ITTNKeuTIjyHp7W7MMyXprLsx2ovf7AqvbU7zFAX6zhvzpRcVxpcFI4
	Gjjvfc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloSU-006p8N-DU; Fri, 21 Oct 2022 09:36:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloSS-006p6g-0C; Fri, 21 Oct 2022 09:36:53 +0000
X-UUID: 27fa7de8599a43c6b5d83850bd68bff7-20221021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TDfh+x5FytpWi0W8sYJ9u2fBze82/hHd4fVkyhEFTUQ=;
	b=NTG13TMMFoUnQYSCCW/LMGVc27cDGpcJLh9ICuV9waD/NVwDn2krFD3tM7M+TJl1J/OEpIcD8iJCZSuZM8Xr9ljuVBMbCJV2JoQkwAXJoMu5ICxAaE7COk8LAHOsKH9x/XTd7MMYUpeXKnWISJBYTHhq5r82i1+UILLY4ijFFUM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:a4f9e514-1d14-407a-864a-0ca593d3ffad,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:8c9441e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 27fa7de8599a43c6b5d83850bd68bff7-20221021
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhichao.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 391840715; Fri, 21 Oct 2022 02:36:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 17:26:05 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 21 Oct 2022 17:26:05 +0800
From: Zhichao Liu <zhichao.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
	<zhichao.liu@mediatek.com>
Subject: [PATCH] spi: mediatek: Fix package division error
Date: Fri, 21 Oct 2022 17:16:53 +0800
Message-ID: <20221021091653.18297-1-zhichao.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_023652_079117_C003DBEE 
X-CRM114-Status: GOOD (  14.44  )
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

From: "zhichao.liu" <zhichao.liu@mediatek.com>

Commit 7e963fb2a33ce ("spi: mediatek: add ipm design support
for MT7986") makes a mistake on package dividing operation
(one change is missing), need to fix it.

Background:
Ipm design is expanding the HW capability of dma (adjust package
length from 1KB to 64KB), and using "dev_comp->ipm_support" flag
to indicate it.

Issue description:
Ipm support patch (said above) is missing to handle remainder at
package dividing operation.
One case, a transmission length is 65KB, is will divide to 1K
(package length) * 65(package loop) in non-ipm desgin case, and
will divide to 64K(package length) * 1(package loop) + 1K(remainder)
in ipm design case. And the 1K remainder will be lost with the
current SW flow, and the transmission will be failure.
So, it should be fixed.

Solution:
Add "ipm_design" flag in function "mtk_spi_get_mult_delta()" to
indicate HW capability, and modify the parameters corespondingly.

fixes: 7e963fb2a33ce ("spi: mediatek: add ipm design support for MT7986")
Signed-off-by: zhichao.liu <zhichao.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 11aeae7fe7fc..a33c9a3de395 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -551,14 +551,17 @@ static void mtk_spi_enable_transfer(struct spi_master *master)
 	writel(cmd, mdata->base + SPI_CMD_REG);
 }
 
-static int mtk_spi_get_mult_delta(u32 xfer_len)
+static int mtk_spi_get_mult_delta(struct mtk_spi *mdata, u32 xfer_len)
 {
-	u32 mult_delta;
+	u32 mult_delta = 0;
 
-	if (xfer_len > MTK_SPI_PACKET_SIZE)
-		mult_delta = xfer_len % MTK_SPI_PACKET_SIZE;
-	else
-		mult_delta = 0;
+	if (mdata->dev_comp->ipm_design) {
+		if (xfer_len > MTK_SPI_IPM_PACKET_SIZE)
+			mult_delta = xfer_len % MTK_SPI_IPM_PACKET_SIZE;
+	} else {
+		if (xfer_len > MTK_SPI_PACKET_SIZE)
+			mult_delta = xfer_len % MTK_SPI_PACKET_SIZE;
+	}
 
 	return mult_delta;
 }
@@ -570,22 +573,22 @@ static void mtk_spi_update_mdata_len(struct spi_master *master)
 
 	if (mdata->tx_sgl_len && mdata->rx_sgl_len) {
 		if (mdata->tx_sgl_len > mdata->rx_sgl_len) {
-			mult_delta = mtk_spi_get_mult_delta(mdata->rx_sgl_len);
+			mult_delta = mtk_spi_get_mult_delta(mdata, mdata->rx_sgl_len);
 			mdata->xfer_len = mdata->rx_sgl_len - mult_delta;
 			mdata->rx_sgl_len = mult_delta;
 			mdata->tx_sgl_len -= mdata->xfer_len;
 		} else {
-			mult_delta = mtk_spi_get_mult_delta(mdata->tx_sgl_len);
+			mult_delta = mtk_spi_get_mult_delta(mdata, mdata->tx_sgl_len);
 			mdata->xfer_len = mdata->tx_sgl_len - mult_delta;
 			mdata->tx_sgl_len = mult_delta;
 			mdata->rx_sgl_len -= mdata->xfer_len;
 		}
 	} else if (mdata->tx_sgl_len) {
-		mult_delta = mtk_spi_get_mult_delta(mdata->tx_sgl_len);
+		mult_delta = mtk_spi_get_mult_delta(mdata, mdata->tx_sgl_len);
 		mdata->xfer_len = mdata->tx_sgl_len - mult_delta;
 		mdata->tx_sgl_len = mult_delta;
 	} else if (mdata->rx_sgl_len) {
-		mult_delta = mtk_spi_get_mult_delta(mdata->rx_sgl_len);
+		mult_delta = mtk_spi_get_mult_delta(mdata, mdata->rx_sgl_len);
 		mdata->xfer_len = mdata->rx_sgl_len - mult_delta;
 		mdata->rx_sgl_len = mult_delta;
 	}
-- 
2.18.0


