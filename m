Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4736EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SuE6rDAG3NzwktR5KIezyQ29b0Uq3ktE9OWEkYHuQeQ=; b=h91qEt43xku1i/XhGZpd0+pjP4
	L7yzAzAdrcOoi2P6tpHdGBo85/4zW8djSSbadeiJ1QZlwPUxHKhb6XCC1q6asb+k/wQxILlAeUSIs
	6QAUKTJn4T9f3jXe7e1CUr5fXBraYbrQjoLbuvBRkJ2lUIvN/RJl2xbQVOrigtXk3SPUcZ8fE+vyN
	hKWlzCLZrnU1RrOkM7fSmLNcgmBO4aeoaR+uT4hFSPsm3o0m375+pqZ9y9VE75CvO4sjEyP0/rQFe
	Dbf1A9Ga4I37z8cGcH6OOH8O2efQAMXTa+vTet9xmjZMzX4JWiOYId8gQC39H9cIu5hXUhMIgPc4n
	dPvhvePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7g-00BDuo-1Q;
	Mon, 10 Jul 2023 10:28:04 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7a-00BDpZ-1Y;
	Mon, 10 Jul 2023 10:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984878; x=1720520878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v/jR6yG2S/os1yevMEAtUPc5WvkJ6D/EUS+UHJf/Log=;
  b=ZKcAistVogpbIOLa1dZMzYzwFBBGNxPfHJyhC9XZs0x1OyHz9DEB2J1W
   0N3rrhbL+LMMgZ1fBzxcA0IzMxVh32PRY3JIUQkg0HcymuKgnUeP70Ld4
   NC4cbju2Lubb+8Fx+v58OvfkBRPM+TZomj6lo3nWkCGPg5bwvdVmqKcp4
   zTY1jMVYIJRvc8SfjBCaEHAzOe3L0fGUJll6KrKP65nHpXkrdtIEPlaS1
   cW5IDVsIYmJOos5LpCNTcMJu3AZ56EfglXMrcvu9OxvsgWiJluzq6Urqt
   UY/l3ehHyYoBX0kc6LVxsHg1c6OZG1dgecfINDZ201ZRIXiy5CAd0qkQH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345420"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364345420"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 03:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297521"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="865297521"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DD3A91FC; Mon, 10 Jul 2023 13:27:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Cc: Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v1 0/8] spi: Header and core clean up and refactoring
Date: Mon, 10 Jul 2023 13:27:43 +0300
Message-Id: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_032758_534107_46B93E7F 
X-CRM114-Status: UNSURE (   9.84  )
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

Various cleanups and refactorings of the SPI header and core parts
united in a single series.

Patches 1 & 2, 5 & 6 & 8 are dependent inside each group.

No functional change intended.

Andy Shevchenko (8):
  spi: Remove unneeded OF node NULL checks
  spi: Drop duplicate IDR allocation code in spi_register_controller()
  spi: Use sysfs_emit() to instead of s*printf()
  spi: Get rid of old SPI_MASTER_NO_.X and SPI_MASTER_MUST_.X
  spi: Sort headers alphabetically
  spi: Clean up headers
  spi: Fix spelling typos and acronyms capitalization
  spi: Use struct_size() helper

 drivers/spi/spi-at91-usart.c    |   2 +-
 drivers/spi/spi-atmel.c         |   2 +-
 drivers/spi/spi-bitbang-txrx.h  |  16 +--
 drivers/spi/spi-bitbang.c       |   2 +-
 drivers/spi/spi-davinci.c       |   2 +-
 drivers/spi/spi-fsl-lpspi.c     |   2 +-
 drivers/spi/spi-gpio.c          |   8 +-
 drivers/spi/spi-lp8841-rtc.c    |   8 +-
 drivers/spi/spi-meson-spicc.c   |   2 +-
 drivers/spi/spi-mt65xx.c        |   2 +-
 drivers/spi/spi-pci1xxxx.c      |   2 +-
 drivers/spi/spi-pic32.c         |   2 +-
 drivers/spi/spi-rb4xx.c         |   2 +-
 drivers/spi/spi-slave-mt27xx.c  |   2 +-
 drivers/spi/spi-stm32.c         |   2 +-
 drivers/spi/spi-xtensa-xtfpga.c |   2 +-
 drivers/spi/spi.c               | 102 ++++++++---------
 include/linux/spi/spi.h         | 188 ++++++++++++++++++--------------
 18 files changed, 183 insertions(+), 165 deletions(-)

-- 
2.40.0.1.gaa8946217a0b


