Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BBEEE49A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8zZNWOoEe6oBadgu6sl3MfhSmvC77j4fxd2hDV9mts=; b=Q8t0NmGDxUs5QoL4MxZUlexo15
	B6QkSgbNo1FuLFdDtJQ3jlEh3LcTlVZKJrqUe99X3jfwTT1RIYzv9UDOWIqZ0BjKbB5IaO/6/TzAs
	KmKIAMAFVBEEQOcGZeAMX/e/j+CdEjsc2tXffKq7u6m119vry9VQAHc1Q4pyvGA/ZGVAiRSW33MJX
	FXTiCH09H+zRAnuG6ohSgV+SeaSxGtwzcDCeG23C1l3QMST6m0CQDxdIuDN/8lQgmQDRRzPidL79z
	EdpLPIg3GbqImOvkLTq1B12PbjMPbxpwmzqj5PpCJV37uThRXeUFFSNNGhhHQqsh2Eb5pPAkO+J0n
	kXzxjjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo9G-000lEv-1g;
	Wed, 23 Aug 2023 13:43:50 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5s-000hbN-37;
	Wed, 23 Aug 2023 13:40:23 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RW6kH6Qblz16Nym;
	Wed, 23 Aug 2023 21:38:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:16 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <andrew@aj.id.au>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<benjaminfair@google.com>, <broonie@kernel.org>,
	<chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <conor.dooley@microchip.com>,
	<daire.mcnamara@microchip.com>, <fancer.lancer@gmail.com>,
	<florian.fainelli@broadcom.com>, <heiko@sntech.de>, <jbrunet@baylibre.com>,
	<joel@jms.id.au>, <khilman@baylibre.com>, <linus.walleij@linaro.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<neil.armstrong@linaro.org>, <olteanv@gmail.com>, <openbmc@lists.ozlabs.org>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <tali.perry1@gmail.com>,
	<tmaimon77@gmail.com>, <venture@google.com>, <yuenn@google.com>
Subject: [PATCH -next v2 24/25] spi: spl022: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:37 +0800
Message-ID: <20230823133938.1359106-25-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823133938.1359106-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_064021_610334_BB124949 
X-CRM114-Status: UNSURE (   8.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.
Moreover, the label "err_no_clk_en" is no used, drop it for clean code.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Delete the modification of odd formatting.

 drivers/spi/spi-pl022.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index bb347b6bb6f3..d1b6110b38fc 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -2168,19 +2168,13 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
 	dev_info(&adev->dev, "mapped registers from %pa to %p\n",
 		&adev->res.start, pl022->virtbase);
 
-	pl022->clk = devm_clk_get(&adev->dev, NULL);
+	pl022->clk = devm_clk_get_enabled(&adev->dev, NULL);
 	if (IS_ERR(pl022->clk)) {
 		status = PTR_ERR(pl022->clk);
 		dev_err(&adev->dev, "could not retrieve SSP/SPI bus clock\n");
 		goto err_no_clk;
 	}
 
-	status = clk_prepare_enable(pl022->clk);
-	if (status) {
-		dev_err(&adev->dev, "could not enable SSP/SPI bus clock\n");
-		goto err_no_clk_en;
-	}
-
 	/* Initialize transfer pump */
 	tasklet_init(&pl022->pump_transfers, pump_transfers,
 		     (unsigned long)pl022);
@@ -2240,8 +2234,6 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
 	if (platform_info->enable_dma)
 		pl022_dma_remove(pl022);
  err_no_irq:
-	clk_disable_unprepare(pl022->clk);
- err_no_clk_en:
  err_no_clk:
  err_no_ioremap:
 	amba_release_regions(adev);
@@ -2268,7 +2260,6 @@ pl022_remove(struct amba_device *adev)
 	if (pl022->host_info->enable_dma)
 		pl022_dma_remove(pl022);
 
-	clk_disable_unprepare(pl022->clk);
 	amba_release_regions(adev);
 	tasklet_disable(&pl022->pump_transfers);
 }
-- 
2.34.1


