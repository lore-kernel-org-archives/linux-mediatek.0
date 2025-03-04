Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C87C282C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 02:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VuDDSS2TpvJo7nDZRzY/l5K5AxDqiIJ6WylpydtfNxc=; b=uuP36Q6300JpfED0khg1SCf/4j
	IX42gOYevkftJ1mEmZksmloPgK3kNdO78Ic/lYGQtzmIzV0wHaXN82aMiA+SpZvbygePTJtWbjHhu
	loHHvJhmmgS0e6JYg9g/trsdzmaHFbw/RK9hsiovi5mmBwFfQAFsS81T4RLkMahDzvcqRl2Y+uB9h
	W91qlBEbVLe8F2CTYswECKVaCupULnpWF28pX4plJKaoEk3QC+O7xNMclpnvJyuwIoR9LyHDl4sV3
	Yh+Wb4oSxXAk0DEXx3DTYaoPh+K+xGy3Gl7jqweV8OURwL6Hu24XkF2qA22Al5M1Yisdy4MNVvUX5
	5pUTD34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpIDW-00000002vFa-1SCI;
	Tue, 04 Mar 2025 02:41:10 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpIDP-00000002vEu-3AKK;
	Tue, 04 Mar 2025 02:41:09 +0000
X-UUID: 19add20cf8a211efa1e849db4cc18d44-20250303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VuDDSS2TpvJo7nDZRzY/l5K5AxDqiIJ6WylpydtfNxc=;
	b=MA+Ag9qNkGkrry0Ityxme4csEIdmgE9KedGZcR/aP18Vm/53ZjmnD7EGSIKlUh3AF8GL+N/vLzJp8UfSZ1gzGBNFIQg00sINSxJpe4l8rytZ9cG7Fn9etWnd72wyOYalDWvIA3uwvoaYak2vb2BkIJreB82wyFpI88R8s+OuLnw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b36f6914-2648-411f-9e55-1145935271f8,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:39e71b03-a373-400e-87fc-32443f153737,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 19add20cf8a211efa1e849db4cc18d44-20250303
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <leilk.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 807032393; Mon, 03 Mar 2025 19:40:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 4 Mar 2025 10:40:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 4 Mar 2025 10:40:53 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<fparent@baylibre.com>, Leilk Liu <leilk.liu@mediatek.com>
Subject: [PATCH v2] spi: mt65xx: add PM QoS support
Date: Tue, 4 Mar 2025 10:37:15 +0800
Message-ID: <20250304024045.7788-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_184103_797582_B7688932 
X-CRM114-Status: GOOD (  17.32  )
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

Enable Quality of Service(QoS) support to speed up interrupt service
routine handle. Sometimes, a gic interrupt will be generated after
SPI transmission, but at this time the CPU is in an idle state and the
processing handler will be very slow. It takes time to exit the idle state
and then become active. This will cause the SPI handler to execute slowly
and cause SPI transfer timeouts.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
v2: 
 1. add qos_request description in mtk_spi
---
 drivers/spi/spi-mt65xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 197bf2dbe5de..4b0a1c0db041 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -20,6 +20,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/dma-mapping.h>
+#include <linux/pm_qos.h>
 
 #define SPI_CFG0_REG			0x0000
 #define SPI_CFG1_REG			0x0004
@@ -147,6 +148,7 @@ struct mtk_spi_compatible {
  * @tx_sgl_len:		Size of TX DMA transfer
  * @rx_sgl_len:		Size of RX DMA transfer
  * @dev_comp:		Device data structure
+ * @qos_request:	QoS request
  * @spi_clk_hz:		Current SPI clock in Hz
  * @spimem_done:	SPI-MEM operation completion
  * @use_spimem:		Enables SPI-MEM
@@ -166,6 +168,7 @@ struct mtk_spi {
 	struct scatterlist *tx_sgl, *rx_sgl;
 	u32 tx_sgl_len, rx_sgl_len;
 	const struct mtk_spi_compatible *dev_comp;
+	struct pm_qos_request qos_request;
 	u32 spi_clk_hz;
 	struct completion spimem_done;
 	bool use_spimem;
@@ -356,6 +359,7 @@ static int mtk_spi_hw_init(struct spi_controller *host,
 	struct mtk_chip_config *chip_config = spi->controller_data;
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 
+	cpu_latency_qos_update_request(&mdata->qos_request, 500);
 	cpha = spi->mode & SPI_CPHA ? 1 : 0;
 	cpol = spi->mode & SPI_CPOL ? 1 : 0;
 
@@ -459,6 +463,15 @@ static int mtk_spi_prepare_message(struct spi_controller *host,
 	return mtk_spi_hw_init(host, msg->spi);
 }
 
+static int mtk_spi_unprepare_message(struct spi_controller *host,
+				     struct spi_message *message)
+{
+	struct mtk_spi *mdata = spi_controller_get_devdata(host);
+
+	cpu_latency_qos_update_request(&mdata->qos_request, PM_QOS_DEFAULT_VALUE);
+	return 0;
+}
+
 static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 {
 	u32 reg_val;
@@ -1143,6 +1156,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	host->set_cs = mtk_spi_set_cs;
 	host->prepare_message = mtk_spi_prepare_message;
+	host->unprepare_message = mtk_spi_unprepare_message;
 	host->transfer_one = mtk_spi_transfer_one;
 	host->can_dma = mtk_spi_can_dma;
 	host->setup = mtk_spi_setup;
@@ -1249,6 +1263,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		clk_disable_unprepare(mdata->spi_hclk);
 	}
 
+	cpu_latency_qos_add_request(&mdata->qos_request, PM_QOS_DEFAULT_VALUE);
+
 	if (mdata->dev_comp->need_pad_sel) {
 		if (mdata->pad_num != host->num_chipselect)
 			return dev_err_probe(dev, -EINVAL,
@@ -1292,6 +1308,7 @@ static void mtk_spi_remove(struct platform_device *pdev)
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 	int ret;
 
+	cpu_latency_qos_remove_request(&mdata->qos_request);
 	if (mdata->use_spimem && !completion_done(&mdata->spimem_done))
 		complete(&mdata->spimem_done);
 
-- 
2.46.0


