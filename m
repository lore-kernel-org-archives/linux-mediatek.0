Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B367C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNp94bA8vKOV1sea/5p3Frlrxg/+l6o7qFInqunY4fE=; b=QmKeyaDlyeDyUE
	AQt0YhIy1TWZunRCni6PwLZiTrboSIrbf+lBbrV+6AnyKPfkRjof9aL8jj4wnQ1OZ17ljsweswz7h
	VWP8khtGaeDd7qbsHqn10KHK8zSlJ3xXL9Br2wfS43LPQ7whX2i83QUbm+eMpoZFu+amOANAR9PSo
	ni/en3hwueg47ydNZleli5mTwSGTXzeH9ANFG2/x7HXAv3MW+0MzBjdyVljk+aP4K5zVLanLQd9Qy
	gvjaQgiFvKoHdx2dukh/9s4H0/qjWE5MCo+hzOn4rKjILeN3KD27bM77NwoGf6tU8CDjUqidR9Rs7
	QkRTPr/BDQYMQafVLWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR7IE-00GAk4-Sx; Mon, 07 Mar 2022 06:56:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR7Hr-00GAeZ-DQ; Mon, 07 Mar 2022 06:56:10 +0000
X-UUID: c7bb68c803284c84bdb6d08aca3fc778-20220306
X-UUID: c7bb68c803284c84bdb6d08aca3fc778-20220306
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1992717150; Sun, 06 Mar 2022 23:56:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 22:52:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 14:52:34 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Mar 2022 14:52:33 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>
Subject: [PATCH V3 1/7] spi: mediatek: support tick_delay without
 enhance_timing
Date: Mon, 7 Mar 2022 14:52:24 +0800
Message-ID: <20220307065230.12655-2-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307065230.12655-1-leilk.liu@mediatek.com>
References: <20220307065230.12655-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_225607_486855_E14154B6 
X-CRM114-Status: GOOD (  10.88  )
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

this patch support tick_delay bit[31:30] without enhance_timing feature.

Fixes: f84d866ab43f("spi: mediatek: add tick_delay support")
Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index bbfeb8046c17..3fd89548ec3c 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -43,8 +43,11 @@
 #define SPI_CFG1_PACKET_LOOP_OFFSET       8
 #define SPI_CFG1_PACKET_LENGTH_OFFSET     16
 #define SPI_CFG1_GET_TICK_DLY_OFFSET      29
+#define SPI_CFG1_GET_TICK_DLY_OFFSET_V1   30
 
 #define SPI_CFG1_GET_TICK_DLY_MASK        0xe0000000
+#define SPI_CFG1_GET_TICK_DLY_MASK_V1     0xc0000000
+
 #define SPI_CFG1_CS_IDLE_MASK             0xff
 #define SPI_CFG1_PACKET_LOOP_MASK         0xff00
 #define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
@@ -346,9 +349,15 @@ static int mtk_spi_prepare_message(struct spi_master *master,
 
 	/* tick delay */
 	reg_val = readl(mdata->base + SPI_CFG1_REG);
-	reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
-	reg_val |= ((chip_config->tick_delay & 0x7)
-		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
+	if (mdata->dev_comp->enhance_timing) {
+		reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
+		reg_val |= ((chip_config->tick_delay & 0x7)
+			    << SPI_CFG1_GET_TICK_DLY_OFFSET);
+	} else {
+		reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK_V1;
+		reg_val |= ((chip_config->tick_delay & 0x3)
+			    << SPI_CFG1_GET_TICK_DLY_OFFSET_V1);
+	}
 	writel(reg_val, mdata->base + SPI_CFG1_REG);
 
 	/* set hw cs timing */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
