Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B498BEE49A4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nFu922dx2U4p350opolLyKvOc9kLw9QiQ+L2xDDzcvU=; b=DbBl7UywukZs6TAzCM2RkHHhjK
	bbnw+IC48uZhgaMIuGwg5QwMCBvfybv39al/cXs5CXZ48Z8j9OnFsOqJAtwEk7wVcGVytrdYA5Tyj
	X7kXUM13nBytr94ZldMCiUa2ioYwpk3KCPiKtfN8HR5MsWinxeKbO+4E390u8CnWRqGpKagkhr/9K
	XOUMEeVnsbdRixzXnoTWokvdTfKkj7ap57eVzEmdKX9umadTrMLGdAYZzBHoMQCn2DXu4C9SZq31r
	yXXZanJvu+hA+Yzi7apINhjm2b+Z3MZ+ACTPoYRPipYbKO7/wqk9aBJlENHBaKzWWGGMBI2+craHP
	JMi6CzKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRCv-00Fyft-26;
	Tue, 22 Aug 2023 13:14:05 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRBu-00FxVT-0H;
	Tue, 22 Aug 2023 13:13:06 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RVV7F1HmdzLpDb;
	Tue, 22 Aug 2023 21:09:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:12:48 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<olteanv@gmail.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>, <heiko@sntech.de>
CC: <lizetao1@huawei.com>, <linux-spi@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Subject: [PATCH -next 00/25] spi: Use devm_clk_get_*() helper function to simplify the drivers.
Date: Tue, 22 Aug 2023 21:12:12 +0800
Message-ID: <20230822131237.1022815-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_061302_606757_13420F32 
X-CRM114-Status: UNSURE (   7.38  )
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

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks") provides a new helper function for prepared and
enabled clocks when a driver keeps a clock prepared (or enabled) during
the whole lifetime of the driver. So where drivers get clocks and enable
them immediately, it can be combined into a single function
devm_clk_get_*(). Moreover, the unprepare and disable function
has been registered to devm_clk_state, and before devm_clk_state is
released, the clocks will be unprepareed and disable, so it is unnecessary
to unprepare and disable clocks explicitly when remove drivers or in the
error handling path.

Li Zetao (25):
  spi: ar934x: Use helper function devm_clk_get_enabled()
  spi: armada-3700: Use helper function devm_clk_get_prepared()
  spi: aspeed: Use helper function devm_clk_get_enabled()
  spi: ath79: Use helper function devm_clk_get_enabled()
  spi: spi-axi-spi-engine: Use helper function devm_clk_get_enabled()
  spi: bcm2835: Use helper function devm_clk_get_enabled()
  spi: bcm2835aux: Use helper function devm_clk_get_enabled()
  spi: spi-cadence: Use helper function devm_clk_get_enabled()
  spi: spi-cavium-thunderx: Use helper function devm_clk_get_enabled()
  spi: davinci: Use helper function devm_clk_get_enabled()
  spi: dw-bt1: Use helper function devm_clk_get_enabled()
  spi: dw-mmio: Use helper function devm_clk_get_*()
  spi: spi-fsl-dspi: Use helper function devm_clk_get_enabled()
  spi: lantiq-ssc: Use helper function devm_clk_get_enabled()
  spi: meson-spicc: Use helper function devm_clk_get_enabled()
  spi: spi-meson-spifc: Use helper function devm_clk_get_enabled()
  spi: microchip-core-qspi: Use helper function devm_clk_get_enabled()
  spi: microchip-core: Use helper function devm_clk_get_enabled()
  spi: mtk-snfi: Use helper function devm_clk_get_enabled()
  spi: npcm-fiu: Use helper function devm_clk_get_enabled()
  spi: orion: Use helper function devm_clk_get_enabled()
  spi: pic32-sqi: Use helper function devm_clk_get_enabled()
  spi: pic32: Use helper function devm_clk_get_enabled()
  spi: spl022: Use helper function devm_clk_get_enabled()
  spi: rockchip: Use helper function devm_clk_get_enabled()

 drivers/spi/spi-ar934x.c              | 22 ++--------
 drivers/spi/spi-armada-3700.c         | 18 ++------
 drivers/spi/spi-aspeed-smc.c          | 16 +------
 drivers/spi/spi-ath79.c               | 11 +----
 drivers/spi/spi-axi-spi-engine.c      | 25 +++--------
 drivers/spi/spi-bcm2835.c             | 11 +----
 drivers/spi/spi-bcm2835aux.c          | 23 ++--------
 drivers/spi/spi-cadence.c             | 23 ++--------
 drivers/spi/spi-cavium-thunderx.c     |  8 +---
 drivers/spi/spi-davinci.c             | 11 +----
 drivers/spi/spi-dw-bt1.c              | 23 +++-------
 drivers/spi/spi-dw-mmio.c             | 20 +++------
 drivers/spi/spi-fsl-dspi.c            | 12 ++----
 drivers/spi/spi-lantiq-ssc.c          | 10 +----
 drivers/spi/spi-meson-spicc.c         | 33 +++------------
 drivers/spi/spi-meson-spifc.c         | 17 ++------
 drivers/spi/spi-microchip-core-qspi.c | 29 +++----------
 drivers/spi/spi-microchip-core.c      |  9 +---
 drivers/spi/spi-mtk-snfi.c            | 61 ++++-----------------------
 drivers/spi/spi-npcm-fiu.c            | 14 ++----
 drivers/spi/spi-orion.c               | 11 +----
 drivers/spi/spi-pic32-sqi.c           | 27 ++----------
 drivers/spi/spi-pic32.c               |  8 +---
 drivers/spi/spi-pl022.c               | 21 +++------
 drivers/spi/spi-rockchip.c            | 30 +++----------
 25 files changed, 88 insertions(+), 405 deletions(-)

-- 
2.34.1


