Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9EFEE4996
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7QVCshRu5lL7UTqUOwjV37PDs1L0Wntvb212mBWA6o=; b=LYEOU04kYz6ULjcSmP44UjBi8i
	FnGRYhQaCFJ6kGCIo7c0U8fnjGU37EKw0nCqdflKoC8rUXSR6TN++L7gtlbsPX9UnhcSxMOXVO06D
	A9RrBf4jHU3gsvyAXObIdGfwwr3FcjUjm3nkb9daggHHrw8pZBtkgz/bHwbOnYTh3tN9xwo4zMGCN
	4dtUoCIaKJypocLqwpW/iTYte16kOoxAuaSXLEY1xKsMWab5hr0G0cQI3lG/ZFzQ4/3nT5+YPtkpL
	eyB9of+SZT9yWXya7xvlLMMnunrKMp3EHHaNEpma2Wa7ruNDCAwUBL64EDcBA6v1Vbz7JJS+LhsK2
	su0h1G0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU49-00GSok-1r;
	Tue, 22 Aug 2023 16:17:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU3d-00GSLP-01;
	Tue, 22 Aug 2023 16:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k7QVCshRu5lL7UTqUOwjV37PDs1L0Wntvb212mBWA6o=; b=bcoe3uHpmbAAlyhxPyVcxBosca
	771wcx/KCM7kMTJkyNz55FbQ17Nv7mR+B9TerQyS6Uvb+ckY6xmxsc2QDlaKiPE+gmBRhd2UkNmDj
	VbyL78fddJl8w0gHlsPbwQJFpat4wrfe+ml5Yx9BGlL1lX0h9CPo6zK7Qbrnknq4NS0rZLXzGi9Kz
	TYkA4QK1s+hgYoy3/DBgGfo4WGL60C/gKFifXW29ToBqk4pvCrmBcp9+QCcagEu+l6p/DKLyIkyfP
	8OZM6hghSlcZwu/CMELI/RfcuNW4gLmDcPwlUTmb662xQu2qZMCgZNVQdcKQq1LfKIRBEpZ6jse8T
	pGT2GmqQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU3W-002rmT-0j;
	Tue, 22 Aug 2023 16:16:39 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RVZ9f3gsrz6J6cZ;
	Wed, 23 Aug 2023 00:12:06 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 17:16:28 +0100
Date: Tue, 22 Aug 2023 17:16:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Li Zetao <lizetao1@huawei.com>
CC: <broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<olteanv@gmail.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>, <heiko@sntech.de>, <linux-spi@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH -next 00/25] spi: Use devm_clk_get_*() helper function
 to simplify the drivers.
Message-ID: <20230822171627.00007020@Huawei.com>
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_171634_421456_23063E91 
X-CRM114-Status: GOOD (  12.54  )
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

On Tue, 22 Aug 2023 21:12:12 +0800
Li Zetao <lizetao1@huawei.com> wrote:

> Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks") provides a new helper function for prepared and
> enabled clocks when a driver keeps a clock prepared (or enabled) during
> the whole lifetime of the driver. So where drivers get clocks and enable
> them immediately, it can be combined into a single function
> devm_clk_get_*(). Moreover, the unprepare and disable function
> has been registered to devm_clk_state, and before devm_clk_state is
> released, the clocks will be unprepareed and disable, so it is unnecessary
> to unprepare and disable clocks explicitly when remove drivers or in the
> error handling path.

For all except 2, 12 and 24
they look good to me and I don't think there are any other ordering issues
of the sort we tend to see in devm conversions where things get turned off
later than in pre devm version.

So for those..
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>



> 
> Li Zetao (25):
>   spi: ar934x: Use helper function devm_clk_get_enabled()
>   spi: armada-3700: Use helper function devm_clk_get_prepared()
>   spi: aspeed: Use helper function devm_clk_get_enabled()
>   spi: ath79: Use helper function devm_clk_get_enabled()
>   spi: spi-axi-spi-engine: Use helper function devm_clk_get_enabled()
>   spi: bcm2835: Use helper function devm_clk_get_enabled()
>   spi: bcm2835aux: Use helper function devm_clk_get_enabled()
>   spi: spi-cadence: Use helper function devm_clk_get_enabled()
>   spi: spi-cavium-thunderx: Use helper function devm_clk_get_enabled()
>   spi: davinci: Use helper function devm_clk_get_enabled()
>   spi: dw-bt1: Use helper function devm_clk_get_enabled()
>   spi: dw-mmio: Use helper function devm_clk_get_*()
>   spi: spi-fsl-dspi: Use helper function devm_clk_get_enabled()
>   spi: lantiq-ssc: Use helper function devm_clk_get_enabled()
>   spi: meson-spicc: Use helper function devm_clk_get_enabled()
>   spi: spi-meson-spifc: Use helper function devm_clk_get_enabled()
>   spi: microchip-core-qspi: Use helper function devm_clk_get_enabled()
>   spi: microchip-core: Use helper function devm_clk_get_enabled()
>   spi: mtk-snfi: Use helper function devm_clk_get_enabled()
>   spi: npcm-fiu: Use helper function devm_clk_get_enabled()
>   spi: orion: Use helper function devm_clk_get_enabled()
>   spi: pic32-sqi: Use helper function devm_clk_get_enabled()
>   spi: pic32: Use helper function devm_clk_get_enabled()
>   spi: spl022: Use helper function devm_clk_get_enabled()
>   spi: rockchip: Use helper function devm_clk_get_enabled()
> 
>  drivers/spi/spi-ar934x.c              | 22 ++--------
>  drivers/spi/spi-armada-3700.c         | 18 ++------
>  drivers/spi/spi-aspeed-smc.c          | 16 +------
>  drivers/spi/spi-ath79.c               | 11 +----
>  drivers/spi/spi-axi-spi-engine.c      | 25 +++--------
>  drivers/spi/spi-bcm2835.c             | 11 +----
>  drivers/spi/spi-bcm2835aux.c          | 23 ++--------
>  drivers/spi/spi-cadence.c             | 23 ++--------
>  drivers/spi/spi-cavium-thunderx.c     |  8 +---
>  drivers/spi/spi-davinci.c             | 11 +----
>  drivers/spi/spi-dw-bt1.c              | 23 +++-------
>  drivers/spi/spi-dw-mmio.c             | 20 +++------
>  drivers/spi/spi-fsl-dspi.c            | 12 ++----
>  drivers/spi/spi-lantiq-ssc.c          | 10 +----
>  drivers/spi/spi-meson-spicc.c         | 33 +++------------
>  drivers/spi/spi-meson-spifc.c         | 17 ++------
>  drivers/spi/spi-microchip-core-qspi.c | 29 +++----------
>  drivers/spi/spi-microchip-core.c      |  9 +---
>  drivers/spi/spi-mtk-snfi.c            | 61 ++++-----------------------
>  drivers/spi/spi-npcm-fiu.c            | 14 ++----
>  drivers/spi/spi-orion.c               | 11 +----
>  drivers/spi/spi-pic32-sqi.c           | 27 ++----------
>  drivers/spi/spi-pic32.c               |  8 +---
>  drivers/spi/spi-pl022.c               | 21 +++------
>  drivers/spi/spi-rockchip.c            | 30 +++----------
>  25 files changed, 88 insertions(+), 405 deletions(-)
> 


