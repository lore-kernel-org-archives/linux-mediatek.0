Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD55C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTNNrrDwzcdQOpsogYXmKLK0A1mF24FK9nJptSbm+HE=; b=y8H/tlckrzFTYY
	ant6psfswV2MuawiSHhYLA82w8SnlHvXFnX9Ip9RViCyFJtGjXXk/VVzxg4JG+vljjkxpAELGpI6p
	WEWFpb0MYQ688Q8caaCfHQ1RTY9Km+AOA7RZNMNKN5DMQJkfEj24xlDVN7gjdHR4D7TfMCo/8nzSS
	V4ucwRgTu6dht6Q5VBZnalOVzCkwHdWc+NBqVHy/XjsbVlms+3kel9pTpQZUroSWlTOb2FTYHbgYD
	rSdCuUkuuY67hlwM05kj4x3bQvNtqLvG9YruuAXUQAp4CoJnDEh73yiTkgAyE2tljxcy5R4pgDZN1
	a6nSgbs5oCkiOGx+A3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2tu-005NJN-NM; Wed, 06 Apr 2022 10:28:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WT-005DtP-6H; Wed, 06 Apr 2022 10:04:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D4C671F43913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239458;
 bh=HsnypJDObY+gS8EShVy4Rcq2TEJ4ccVeiDXFBBCM2qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=itzf/Py+3LlJBLGZWuLt3X1VLEua3FbCQFwhOdQZZ7MQv5ktJekedJdd4stOr5Pg/
 Wh6j8NGD9m/1Cikso0U4tVd1seUA/wOX8C/RsM5LaTRpDE6PgWTDA9dnRa73GkQ9Uh
 JH6RPbGkDd886G3eGX4HwBMoe6Pp3jZ0fPChoesJS7pRZRO08+rX7La0hHH5sP1a8B
 4F5/ilG+GmcwZSvNBf8hdUwS9wb4eY4ZkCPkASp7GPXHyzHW85VsMTPIuBp+kg3gZk
 giMdMCOaT8fDYJ1F0xsqU+8quI7hNdRr55hVcOt5HOBAfxm5mBc51Q8yBDbzI0oM7a
 OJDCs/0uQD0Xw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/7] spi: mt65xx: Add kerneldoc for driver structures
Date: Wed,  6 Apr 2022 12:04:08 +0200
Message-Id: <20220406100409.93113-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
References: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030421_436228_57174929 
X-CRM114-Status: GOOD (  10.46  )
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

One of the two structures was already partially documented, but not
in kerneldoc format: enhance readability by adding the missing
documentation bits and use kerneldoc.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index c5b8aecfada6..8bd0b7335ea0 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -95,21 +95,43 @@
 #define DMA_ADDR_EXT_BITS (36)
 #define DMA_ADDR_DEF_BITS (32)
 
+/**
+ * struct mtk_spi_compatible - device data structure
+ * @need_pad_sel:	Enable pad (pins) selection in SPI controller
+ * @must_tx:		Must explicitly send dummy TX bytes to do RX only transfer
+ * @enhance_timing:	Enable adjusting cfg register to enhance time accuracy
+ * @dma_ext:		DMA address extension supported
+ * @no_need_unprepare:	Don't unprepare the SPI clk during runtime
+ * @ipm_design:		Adjust/extend registers to support IPM design IP features
+ */
 struct mtk_spi_compatible {
 	bool need_pad_sel;
-	/* Must explicitly send dummy Tx bytes to do Rx only transfer */
 	bool must_tx;
-	/* some IC design adjust cfg register to enhance time accuracy */
 	bool enhance_timing;
-	/* some IC support DMA addr extension */
 	bool dma_ext;
-	/* some IC no need unprepare SPI clk */
 	bool no_need_unprepare;
-	/* IPM design adjust and extend register to support more features */
 	bool ipm_design;
-
 };
 
+/**
+ * struct mtk_spi - SPI driver instance
+ * @base:		Start address of the SPI controller registers
+ * @state:		SPI controller state
+ * @pad_num:		Number of pad_sel entries
+ * @pad_sel:		Groups of pins to select
+ * @parent_clk:		Parent of sel_clk
+ * @sel_clk:		SPI master SCK clock
+ * @spi_clk:		Peripheral clock
+ * @cur_transfer:	Currently processed SPI transfer
+ * @xfer_len:		Number of bytes to transfer
+ * @num_xfered:		Number of transferred bytes
+ * @tx_sgl:		TX transfer scatterlist
+ * @rx_sgl:		RX transfer scatterlist
+ * @tx_sgl_len:		Size of TX DMA transfer
+ * @rx_sgl_len:		Size of RX DMA transfer
+ * @dev_comp:		Device data structure
+ * @spi_clk_hz:		Current SPI clock in Hz
+ */
 struct mtk_spi {
 	void __iomem *base;
 	u32 state;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
