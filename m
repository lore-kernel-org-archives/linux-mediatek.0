Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF7DEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3ffpI/kCNzZkFUS1G6JGoEVjvNVm7VO2GOxi97kBbA=; b=xv3Hb6bF82ZK/4y4nv6ELBnjJC
	HSBppnNtQmGVaDMnU8VL9MJ5RVySgMeVMts2opYhzOtEj+CcNlJmD3IslmHW4u0PweIl04P6TV1/2
	rDlFt8XA81WqGW4kwmU7N6VpFUQzYHYKR2My8PSVF9HYKYZJllTYkiL4QNpIKA7b9iQRpVrOqd4Xt
	1aLDe4tEKr9u5s2AW8zc0fCQqO97jS8Izs8ltg58vzmG+qnwwpPh1T2R446kzwEmaljE4W03bcZmd
	+9ZL0aPFZ1X2Re9J6NoMb5CRwSfr22znoPyQ6Ae7XTZ+ejVv08NqjTbN3Uc5X8X1p5wsbVr9mh2sc
	Rxy73VGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYK8-00HR4e-0J;
	Wed, 12 Jul 2023 11:48:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYK4-00HR2A-0Z;
	Wed, 12 Jul 2023 11:47:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2B01617A4;
	Wed, 12 Jul 2023 11:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6827AC433C9;
	Wed, 12 Jul 2023 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162475;
	bh=BL+8Fo9QG0zNtj0y7Lgb/m7HMTTimtNx9krlJ8PROKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MBDgsatfZpWqdAMwV6qveeIfLQ6N7jrowK9LjuavtymGZJ2RZ2Oc1MpqiENhz3quE
	 3C52w4yN+XHh2R9JtS9d5C82wdCYmJLOyIegf8gaLO9fnbUYfmxOmBAQgyocJctiAI
	 6E59ipQJyxOm+qSbYi3HkSZBX2tCKWY1iP+GjHTkOSnvKhvbhkax3ZarfbH5wu0wKK
	 qx68/+nBANjiNw+aQoV6C1vLW4EDygmSD4fpo+BTkFwtXsm5w2b39Kd49evlvRZIW7
	 KcdjwPLLtdt+TqxuNclA8arYxR3eJ8wd/C5/2IO8CCIn4CiFbVXi916UJQXvZWbBYq
	 HcHdiJ1RRWg+A==
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Yang Yingliang <yangyingliang@huawei.com>, 
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, 
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>, 
 Radu Pirea <radu_nicolae.pirea@upb.ro>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Serge Semin <fancer.lancer@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v2 00/15] spi: Header and core clean up and
 refactoring
Message-Id: <168916246513.47003.10097115249886306259.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_044756_298161_9F1AB3B9 
X-CRM114-Status: GOOD (  16.42  )
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

On Mon, 10 Jul 2023 18:49:17 +0300, Andy Shevchenko wrote:
> Various cleanups and refactorings of the SPI header and core parts
> united in a single series. It also touches drivers under SPI subsystem
> folder on the pure renaming purposes of some constants.
> 
> No functional change intended.
> 
> Changelog v2:
> - added new patches 3,4,5,10,13,14
> - massaged comment and kernel doc in patch 9
> - split used to be patch 4 to patches 11,12
> - covered a few things in SPI core in patch 15
> - amended commit message for above (Mark)
> - reshuffled patches in the series for better logical grouping
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/15] spi: Remove unneeded OF node NULL checks
        commit: fbab5b2c09060e8034fee6ec2df69a62594fb7db
[02/15] spi: Drop duplicate IDR allocation code in spi_register_controller()
        commit: 440c47331bdb889e24128c75387c695ca81d9b9b
[03/15] spi: Replace if-else-if by bitops and multiplications
        commit: 2b308e7176e366a52a07a49868e3b1a295e56785
[06/15] spi: Use sysfs_emit() to instead of s*printf()
        commit: f2daa4667fda1aa951b91da0ae9675a5da9d7716
[07/15] spi: Sort headers alphabetically
        commit: edf6a864c996f9a9f5299a3b3e574a37e64000c5
[08/15] spi: Clean up headers
        (no commit info)
[11/15] spi: Get rid of old SPI_MASTER_NO_TX & SPI_MASTER_NO_RX
        commit: c397f09e5498994790503a64486213ef85e58db9
[12/15] spi: Get rid of old SPI_MASTER_MUST_TX & SPI_MASTER_MUST_RX
        commit: 90366cd60133a9f5b6a2f31360367c658585e125
[13/15] spi: Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS
        commit: 82238d2cbd99ebd09dda48fb7c1c8802097da6a2
[14/15] spi: Convert to SPI_CONTROLLER_HALF_DUPLEX
        commit: 7a2b552c8e0e5bb280558f6c120140f5f06323bc
[15/15] spi: Fix spelling typos and acronyms capitalization
        commit: 702ca0269ed56e2d8dae7874a4d8af268e2a382e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


