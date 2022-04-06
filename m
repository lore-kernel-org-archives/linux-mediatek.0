Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CECC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuzK6V4mrJc7xIqOdK+Sux0qHNqCS3eI/GVtZbDGwQ0=; b=XxJaO66lwOOszH
	5jHr2RdytOG0dOJefaHhQRT/KtzbYLt2ddJk2EDeoYzhAtFbNa6e90H3ZCeQ4MXu4BYz0fvOugYWB
	ZUwIq9Dk8FMlFgA+blvO9FoQEYc7DtFmdHfTsJ4//wTncewRNyv0MyqCF1foUS4WZOZH6tlxK3Xmj
	6KIkyKgtCrf/ONmEJfukeSiOo/NE93XN5Y6c6JZqqDKyOBmvZcMnKLNGhfP80QBqIPTYgqjvmj0KU
	/rlG6/CgnEesWTFV9BWVaZFpxSe2EPb4NWrdmELLdIdV+qvJpfPwNuF11732m48eCLPbNaVD2V5nf
	pbg+kycMPT4V8sAaQJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2ty-005NMT-6e; Wed, 06 Apr 2022 10:28:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WT-005Dte-QN; Wed, 06 Apr 2022 10:04:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8C96C1F43915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239459;
 bh=R0eDnRvnMRlkoH4jk3J8OAKkFlYr2/OFWVtkmjDP4oI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PkBylaI3czVCG7HcbAwWWJx/RxXB+iz+Ocq6KAHfgsJboDp9vlmPLtgJxMYKt5aSv
 LuBJzLi5iwfRCtnarO2zYhEDWK7TQV7Xh9trEQ3T7IaICTIz/gD8rtbXGDw/iFQrQ5
 F4owFcEW2OxpV3THtuFPPo2zgOSxie1Yet4lgPXhTUMufrMhLKq+k2vq5dcAHYO4Jq
 IWM9zH3EezRw70yWgHTUG9s9JCMXQnrrszkRVVhs6jAYlRNW309hL2DtjYuO3h7HTj
 ARhU2UXPaR/3WDEF5F9TZRqXrJnMdCMhvR8RlWZjLq290k5WrHMSJfK7gFu8WkzIFv
 VxAlzNnxhNrlw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 7/7] spi: mt65xx: Fix definitions indentation
Date: Wed,  6 Apr 2022 12:04:09 +0200
Message-Id: <20220406100409.93113-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
References: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030422_234665_57B1B99C 
X-CRM114-Status: UNSURE (   8.19  )
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

Some definitions at the beginning of this file were wrongly
indented: fix the indentation for all of these and, while at
it, also move the MTK_SPI_IDLE and MTK_SPI_PAUSED down, as to
implicitly group the hardware related definitions to the
software (driver) related ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 132 +++++++++++++++++++--------------------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 8bd0b7335ea0..9733520effb8 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -19,79 +19,79 @@
 #include <linux/spi/spi.h>
 #include <linux/dma-mapping.h>
 
-#define SPI_CFG0_REG                      0x0000
-#define SPI_CFG1_REG                      0x0004
-#define SPI_TX_SRC_REG                    0x0008
-#define SPI_RX_DST_REG                    0x000c
-#define SPI_TX_DATA_REG                   0x0010
-#define SPI_RX_DATA_REG                   0x0014
-#define SPI_CMD_REG                       0x0018
-#define SPI_STATUS0_REG                   0x001c
-#define SPI_PAD_SEL_REG                   0x0024
-#define SPI_CFG2_REG                      0x0028
-#define SPI_TX_SRC_REG_64                 0x002c
-#define SPI_RX_DST_REG_64                 0x0030
-#define SPI_CFG3_IPM_REG                  0x0040
-
-#define SPI_CFG0_SCK_HIGH_OFFSET          0
-#define SPI_CFG0_SCK_LOW_OFFSET           8
-#define SPI_CFG0_CS_HOLD_OFFSET           16
-#define SPI_CFG0_CS_SETUP_OFFSET          24
-#define SPI_ADJUST_CFG0_CS_HOLD_OFFSET    0
-#define SPI_ADJUST_CFG0_CS_SETUP_OFFSET   16
-
-#define SPI_CFG1_CS_IDLE_OFFSET           0
-#define SPI_CFG1_PACKET_LOOP_OFFSET       8
-#define SPI_CFG1_PACKET_LENGTH_OFFSET     16
-#define SPI_CFG1_GET_TICK_DLY_OFFSET      29
-#define SPI_CFG1_GET_TICK_DLY_OFFSET_V1   30
-
-#define SPI_CFG1_GET_TICK_DLY_MASK        0xe0000000
-#define SPI_CFG1_GET_TICK_DLY_MASK_V1     0xc0000000
-
-#define SPI_CFG1_CS_IDLE_MASK             0xff
-#define SPI_CFG1_PACKET_LOOP_MASK         0xff00
-#define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
-#define SPI_CFG1_IPM_PACKET_LENGTH_MASK   GENMASK(31, 16)
-#define SPI_CFG2_SCK_HIGH_OFFSET          0
-#define SPI_CFG2_SCK_LOW_OFFSET           16
-
-#define SPI_CMD_ACT                  BIT(0)
-#define SPI_CMD_RESUME               BIT(1)
-#define SPI_CMD_RST                  BIT(2)
-#define SPI_CMD_PAUSE_EN             BIT(4)
-#define SPI_CMD_DEASSERT             BIT(5)
-#define SPI_CMD_SAMPLE_SEL           BIT(6)
-#define SPI_CMD_CS_POL               BIT(7)
-#define SPI_CMD_CPHA                 BIT(8)
-#define SPI_CMD_CPOL                 BIT(9)
-#define SPI_CMD_RX_DMA               BIT(10)
-#define SPI_CMD_TX_DMA               BIT(11)
-#define SPI_CMD_TXMSBF               BIT(12)
-#define SPI_CMD_RXMSBF               BIT(13)
-#define SPI_CMD_RX_ENDIAN            BIT(14)
-#define SPI_CMD_TX_ENDIAN            BIT(15)
-#define SPI_CMD_FINISH_IE            BIT(16)
-#define SPI_CMD_PAUSE_IE             BIT(17)
-#define SPI_CMD_IPM_NONIDLE_MODE     BIT(19)
-#define SPI_CMD_IPM_SPIM_LOOP        BIT(21)
-#define SPI_CMD_IPM_GET_TICKDLY_OFFSET    22
+#define SPI_CFG0_REG			0x0000
+#define SPI_CFG1_REG			0x0004
+#define SPI_TX_SRC_REG			0x0008
+#define SPI_RX_DST_REG			0x000c
+#define SPI_TX_DATA_REG			0x0010
+#define SPI_RX_DATA_REG			0x0014
+#define SPI_CMD_REG			0x0018
+#define SPI_STATUS0_REG			0x001c
+#define SPI_PAD_SEL_REG			0x0024
+#define SPI_CFG2_REG			0x0028
+#define SPI_TX_SRC_REG_64		0x002c
+#define SPI_RX_DST_REG_64		0x0030
+#define SPI_CFG3_IPM_REG		0x0040
+
+#define SPI_CFG0_SCK_HIGH_OFFSET	0
+#define SPI_CFG0_SCK_LOW_OFFSET		8
+#define SPI_CFG0_CS_HOLD_OFFSET		16
+#define SPI_CFG0_CS_SETUP_OFFSET	24
+#define SPI_ADJUST_CFG0_CS_HOLD_OFFSET	0
+#define SPI_ADJUST_CFG0_CS_SETUP_OFFSET	16
+
+#define SPI_CFG1_CS_IDLE_OFFSET		0
+#define SPI_CFG1_PACKET_LOOP_OFFSET	8
+#define SPI_CFG1_PACKET_LENGTH_OFFSET	16
+#define SPI_CFG1_GET_TICK_DLY_OFFSET	29
+#define SPI_CFG1_GET_TICK_DLY_OFFSET_V1	30
+
+#define SPI_CFG1_GET_TICK_DLY_MASK	0xe0000000
+#define SPI_CFG1_GET_TICK_DLY_MASK_V1	0xc0000000
+
+#define SPI_CFG1_CS_IDLE_MASK		0xff
+#define SPI_CFG1_PACKET_LOOP_MASK	0xff00
+#define SPI_CFG1_PACKET_LENGTH_MASK	0x3ff0000
+#define SPI_CFG1_IPM_PACKET_LENGTH_MASK	GENMASK(31, 16)
+#define SPI_CFG2_SCK_HIGH_OFFSET	0
+#define SPI_CFG2_SCK_LOW_OFFSET		16
+
+#define SPI_CMD_ACT			BIT(0)
+#define SPI_CMD_RESUME			BIT(1)
+#define SPI_CMD_RST			BIT(2)
+#define SPI_CMD_PAUSE_EN		BIT(4)
+#define SPI_CMD_DEASSERT		BIT(5)
+#define SPI_CMD_SAMPLE_SEL		BIT(6)
+#define SPI_CMD_CS_POL			BIT(7)
+#define SPI_CMD_CPHA			BIT(8)
+#define SPI_CMD_CPOL			BIT(9)
+#define SPI_CMD_RX_DMA			BIT(10)
+#define SPI_CMD_TX_DMA			BIT(11)
+#define SPI_CMD_TXMSBF			BIT(12)
+#define SPI_CMD_RXMSBF			BIT(13)
+#define SPI_CMD_RX_ENDIAN		BIT(14)
+#define SPI_CMD_TX_ENDIAN		BIT(15)
+#define SPI_CMD_FINISH_IE		BIT(16)
+#define SPI_CMD_PAUSE_IE		BIT(17)
+#define SPI_CMD_IPM_NONIDLE_MODE	BIT(19)
+#define SPI_CMD_IPM_SPIM_LOOP		BIT(21)
+#define SPI_CMD_IPM_GET_TICKDLY_OFFSET	22
 
 #define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
-#define SPI_CFG3_IPM_HALF_DUPLEX_DIR		BIT(2)
-#define SPI_CFG3_IPM_HALF_DUPLEX_EN		BIT(3)
-#define MT8173_SPI_MAX_PAD_SEL 3
+#define SPI_CFG3_IPM_HALF_DUPLEX_DIR	BIT(2)
+#define SPI_CFG3_IPM_HALF_DUPLEX_EN	BIT(3)
+#define MT8173_SPI_MAX_PAD_SEL		3
 
-#define MTK_SPI_PAUSE_INT_STATUS 0x2
+#define MTK_SPI_PAUSE_INT_STATUS	0x2
+
+#define MTK_SPI_MAX_FIFO_SIZE		32U
+#define MTK_SPI_PACKET_SIZE		1024
+#define MTK_SPI_IPM_PACKET_SIZE		SZ_64K
+#define MTK_SPI_32BITS_MASK		(0xffffffff)
 
 #define MTK_SPI_IDLE 0
 #define MTK_SPI_PAUSED 1
 
-#define MTK_SPI_MAX_FIFO_SIZE 32U
-#define MTK_SPI_PACKET_SIZE 1024
-#define MTK_SPI_IPM_PACKET_SIZE SZ_64K
-#define MTK_SPI_32BITS_MASK  (0xffffffff)
-
 #define DMA_ADDR_EXT_BITS (36)
 #define DMA_ADDR_DEF_BITS (32)
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
