Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76791C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWMSbe9fDEGRZmjnQX54v3VfZ8+IosKdaxGAgTacZ88=; b=uFJGRuLvDWCRqS
	gGEdu5DIqPw7RRTkoF7+XfM/CpyKbQcPajMxMYWcdZ4JoJjK6gebVqaHU7vHqByHB9lGUXa/GTk8b
	X+9O8n/GKY0Vi2E8tfcgm+h1LvXdCoCs2XPTwGRRFbROYDfkcU+SYPwmy4BHntE0sxZpWuYK7f87D
	x3eBOnWQ8r/wvZp7pa6/iEyEbfkhdZXz5AqcwPxGIj7b0Szhl7m/vmZImGJ+FWp+XDtMpYiUOTl4A
	U0a2R9ZSVOe7/ArvSRVhxm8T+8e3LP6EIM8Hr7S7YMezkpEYjKoSWjraAJYZ33Q9xLZ7b1QhPMf/V
	LurCjBIq6G02CYAgwPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQcE-00Bd6e-CY; Thu, 07 Apr 2022 11:47:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQZE-00BbH6-C7; Thu, 07 Apr 2022 11:44:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 61A261F46126
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649331886;
 bh=bhO9IGpVaO3jMtUhPXj5wnxmIwXlEuDR+8ujoLGdQfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=khxYns0NExK63qi1rStkJrn+mRyZTmf+KQJF20lLna1p/nFyNHzqtEdqLAi9//ykT
 JW1o6PUdlBVS3NWg5y+gPF7QrUm6hm9qJC5yjd5B77HWnqQ1O95IBm+STtMR23Luae
 EgLa8dJOw4x+cf0vpHZQMXSF35xiCAWpFJzYrLfcJ2lOfPrP3G1Lro3AgqBEL1Aamx
 IqV7cvC9Exu/Nx+SePzHQuEBkkTTrnE9+PJ2OeKVK1DxlxnDgG+Sjp7lnzzOGF2AOX
 E2mFychF1tkgL0R9HAjL5RPZkP3HzWrV9A7rSXCL1/3c3sAtGtSXUDsIuSEEvbjko/
 7mv57YOCGGmWw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 8/8] spi: mt65xx: Fix definitions indentation
Date: Thu,  7 Apr 2022 13:44:28 +0200
Message-Id: <20220407114428.167091-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
References: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_044448_788085_87ADBA6D 
X-CRM114-Status: UNSURE (   8.25  )
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
 drivers/spi/spi-mt65xx.c | 154 +++++++++++++++++++--------------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index b1472556c5b0..0a3b9f7eed30 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -20,95 +20,95 @@
 #include <linux/spi/spi-mem.h>
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
 
 #define PIN_MODE_CFG(x)	((x) / 2)
 
-#define SPI_CFG3_IPM_HALF_DUPLEX_DIR		BIT(2)
-#define SPI_CFG3_IPM_HALF_DUPLEX_EN		BIT(3)
-#define SPI_CFG3_IPM_XMODE_EN			BIT(4)
-#define SPI_CFG3_IPM_NODATA_FLAG		BIT(5)
-#define SPI_CFG3_IPM_CMD_BYTELEN_OFFSET		8
-#define SPI_CFG3_IPM_ADDR_BYTELEN_OFFSET	12
+#define SPI_CFG3_IPM_HALF_DUPLEX_DIR	BIT(2)
+#define SPI_CFG3_IPM_HALF_DUPLEX_EN	BIT(3)
+#define SPI_CFG3_IPM_XMODE_EN		BIT(4)
+#define SPI_CFG3_IPM_NODATA_FLAG	BIT(5)
+#define SPI_CFG3_IPM_CMD_BYTELEN_OFFSET	8
+#define SPI_CFG3_IPM_ADDR_BYTELEN_OFFSET 12
 
-#define SPI_CFG3_IPM_CMD_PIN_MODE_MASK		GENMASK(1, 0)
-#define SPI_CFG3_IPM_CMD_BYTELEN_MASK		GENMASK(11, 8)
-#define SPI_CFG3_IPM_ADDR_BYTELEN_MASK		GENMASK(15, 12)
+#define SPI_CFG3_IPM_CMD_PIN_MODE_MASK	GENMASK(1, 0)
+#define SPI_CFG3_IPM_CMD_BYTELEN_MASK	GENMASK(11, 8)
+#define SPI_CFG3_IPM_ADDR_BYTELEN_MASK	GENMASK(15, 12)
 
-#define MT8173_SPI_MAX_PAD_SEL 3
+#define MT8173_SPI_MAX_PAD_SEL		3
 
-#define MTK_SPI_PAUSE_INT_STATUS 0x2
+#define MTK_SPI_PAUSE_INT_STATUS	0x2
 
-#define MTK_SPI_IDLE 0
-#define MTK_SPI_PAUSED 1
+#define MTK_SPI_MAX_FIFO_SIZE		32U
+#define MTK_SPI_PACKET_SIZE		1024
+#define MTK_SPI_IPM_PACKET_SIZE		SZ_64K
+#define MTK_SPI_IPM_PACKET_LOOP		SZ_256
 
-#define MTK_SPI_MAX_FIFO_SIZE 32U
-#define MTK_SPI_PACKET_SIZE 1024
-#define MTK_SPI_IPM_PACKET_SIZE SZ_64K
-#define MTK_SPI_IPM_PACKET_LOOP SZ_256
+#define MTK_SPI_IDLE			0
+#define MTK_SPI_PAUSED			1
 
-#define MTK_SPI_32BITS_MASK  (0xffffffff)
+#define MTK_SPI_32BITS_MASK		(0xffffffff)
 
-#define DMA_ADDR_EXT_BITS (36)
-#define DMA_ADDR_DEF_BITS (32)
+#define DMA_ADDR_EXT_BITS		(36)
+#define DMA_ADDR_DEF_BITS		(32)
 
 /**
  * struct mtk_spi_compatible - device data structure
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
