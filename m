Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F67C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mz1A+g0J3T9y4P2S486FqzpSm9M4FIE8RKQq1q7Aj2U=; b=a7zYVdXeEceA8T
	5+BaFGvcYWVZ+Bi7vMnZZA+vX/3EAQzKVtZvSILZUcKNXiQC0seSoP6L1bVHHnH7J+lYHq1p9iToV
	Q5W0KqQl3j/IgsTgHOxeNbsukfBdplN+Jgbdv9XvnC3weuqu2/gg3snd+IEyMkB8/ma/QYH7cfsXu
	ILKW/u4cft5hriA1JTl1r/h+H7ADiXkSxeMfezJan6KLl2byIEKzDDSPIvesDURbbWgrbbr4k6w31
	BTwmxOFyrJkcm4wOklCK9xK9VpejJNBn5SZptJUKYE1J1KjqKKcFt5OhM5gdYCOOEnWd35XjLDxnm
	j/R8oRBlNto4Lr10Gijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQbj-00BcpF-2q; Thu, 07 Apr 2022 11:47:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQZD-00BbGL-HN; Thu, 07 Apr 2022 11:44:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AF59B1F46140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649331886;
 bh=KzX41HFWfAh1talT4BfusFnQWFMhkwcxlsLw5YSyMG0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CRc5dbnNiguSDY5h1vjxJzdNAE5U4Eo6u/h2gpMnYoXDmKdru6nU5RVhAxN/UNzQ+
 IdlWPQSH50PRasWIa4QJGw7rn2LX+Y9xEKkVU4+FW+L4bebyZ4sSkG+Ddcl+WZGTG7
 hpdv/1+zThsBFQ07foyBQiUzMcwNqXWRPYI3W7OHHk4rvXHJn/62TPBUt6xQy5n0m0
 ksTAodyGDEFbhrXgRM7wOeXQEb4Wikn2K9C+wA2ZWD0NkisoYabMryLqm0fRcAZ2kF
 MKlRts8I7U9xzZElxYJxKYZsQsZJzuLw7oaSzqJBD399GKRkgQg9gUiVZ7Gc4hBRNt
 7NSxrFiyyJeCw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 7/8] spi: mt65xx: Add kerneldoc for driver structures
Date: Thu,  7 Apr 2022 13:44:27 +0200
Message-Id: <20220407114428.167091-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
References: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_044447_795698_47142764 
X-CRM114-Status: GOOD (  10.39  )
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
 drivers/spi/spi-mt65xx.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 111ce351359a..b1472556c5b0 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -110,20 +110,49 @@
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
 };
 
+/**
+ * struct mtk_spi - SPI driver instance
+ * @base:		Start address of the SPI controller registers
+ * @state:		SPI controller state
+ * @pad_num:		Number of pad_sel entries
+ * @pad_sel:		Groups of pins to select
+ * @parent_clk:		Parent of sel_clk
+ * @sel_clk:		SPI master mux clock
+ * @spi_clk:		Peripheral clock
+ * @spi_hclk:		AHB bus clock
+ * @cur_transfer:	Currently processed SPI transfer
+ * @xfer_len:		Number of bytes to transfer
+ * @num_xfered:		Number of transferred bytes
+ * @tx_sgl:		TX transfer scatterlist
+ * @rx_sgl:		RX transfer scatterlist
+ * @tx_sgl_len:		Size of TX DMA transfer
+ * @rx_sgl_len:		Size of RX DMA transfer
+ * @dev_comp:		Device data structure
+ * @spi_clk_hz:		Current SPI clock in Hz
+ * @spimem_done:	SPI-MEM operation completion
+ * @use_spimem:		Enables SPI-MEM
+ * @dev:		Device pointer
+ * @tx_dma:		DMA start for SPI-MEM TX
+ * @rx_dma:		DMA start for SPI-MEM RX
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
