Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A117CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vd5YX8BRbQqSFBqhhlbMI3AUpes8NsL1+fKqVRef/H4=; b=NFAdv/ClZcvA4A
	wmeo3aSxNwwdo1DSsJG3UDjN7dkS5p7MD+NcnCJnoEh0pBNbMCdcfyk2WShXWM/Nofwrt7mAj1nWi
	BrWwX3+sn6mxjX2YGDzberUl6Olql/Fu/FA/GcmJRAo8s/KqG8b30UkRw332gsS1avehusP762AFs
	YKkYekTMJbMFfpX/nQjOnOaCaRSUtcSgC9UkdQ/nn0Y/qmdt89bGWMbc0c0oOb8UbGyaCI6rRdMwd
	3yrSvKlJFnL8WlkCXNu0ZO7boyBP1zpwHfRNv3GCBLcky7gW8kmHCb5/g91Atb8NnpHWB/ddlbuaA
	zjRZyDyEReqlFe48jUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSfwg-00GdlY-9F; Fri, 11 Mar 2022 14:08:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfw1-00GdSH-Eq; Fri, 11 Mar 2022 14:08:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD2E6B82C24;
 Fri, 11 Mar 2022 14:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B1DC340F5;
 Fri, 11 Mar 2022 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647007676;
 bh=oxhEMvElWODt6u9CQYS0TOzkW9ZRnJdY8HwZrc0XbnA=;
 h=From:To:Cc:Subject:Date:From;
 b=I1IWazuBan229oTPyXer46CT9bijBRhJJ438WpPXOCKnJHuH3LeSiHJtETgwak7Cp
 RriKkP6rtuas2UOOhvuwjNOEDgPJfjFZhnKcr8zG6zQViko9vb21SdMBmnSKh1PQSc
 Qy0JIkMVupausOA+J7sYzH1JLhewlQtAO6NFu5t6x5zXy7qvKJh0SGW3PPVYsP8HRT
 LGlj/1X9iqZK64iYH49dD+0mM5TFOxCzC9kS/v92w1KYH4o34oP4eI8wkIF2V70jO5
 6TShJ2I2kNzNWoacqVs4hAwAQiDPtgn4VVvEsv3RJ2XfrO2bKsDhF2zGb3FOd1oouB
 xG+udw2dDr8EA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nSfvt-000lAX-Ey; Fri, 11 Mar 2022 15:07:53 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Jeffery <andrew@aj.id.au>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Andy Gross <agross@kernel.org>, Andy Walls <awalls@md.metrocast.net>,
 Benoit Parrot <bparrot@ti.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Dafna Hirschfeld <dafna@fastmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Eddie James <eajames@linux.ibm.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Krufky <mkrufky@linuxtv.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Ming Qian <ming.qian@nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shijie Qin <shijie.qin@nxp.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Todor Tomov <todor.too@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Yong Deng <yong.deng@magewell.com>, Zhou Peng <eagle.zhou@nxp.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 00/38] Sort Makefiles and platform/Kconfig
Date: Fri, 11 Mar 2022 15:07:13 +0100
Message-Id: <cover.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_060801_889238_7CB832C2 
X-CRM114-Status: GOOD (  17.70  )
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

Entries at Makefiles and Kconfig files end being merged on random order. 

Sort Makefile entries in alphabetical order. 

Sorting Kconfig is harder. So, for now, do it only for platform/Kconfig.

On platform/Kconfig, there is a mix of:
	- two ancillary drivers;
	- per-SoC drivers whose Kconfig/Makefile is on separate files;
	- per-SoC drivers whose Makefile is on separate files, but the
	  driver is at platform/Makefile;
	- per-SoC drivers that are specified inside platform/Makefile and
	  platform/Kconfig.

Give some order by ensuring that all non-generic drivers will be on
subdirectories.

The end goal is to have one directory below platform per manufacturer,
This series prepare for that.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-

v2:
  - removed some renames at DVB frontend;
  - added patches for platform/Kconfig sort.

Mauro Carvalho Chehab (38):
  media: xc2028: rename the driver from tuner-xc2028
  media: Makefiles: remove extra spaces
  media: Makefiles: sort entries where it fits
  media: platform: Makefile: reorganize its contents
  media: platform: move platform menu dependencies to drivers
  media: platform: place Aspeed driver on a separate dir
  media: platform: place NXP drivers on a separate dir
  media: platform: place Intel drivers on a separate dir
  media: platform: place Via drivers on a separate dir
  media: platform: place Renesas drivers on a separate dir
  media: platform: allegro-dvt: move config to its own file
  media: platform: amphion: move config to its own file
  media: platform: coda: move config to its own file
  media: platform: exynos-gsc: move config to its own file
  media: platform: ge2d: move config to its own file
  media: platform: mtk-jpeg: move config to its own file
  media: platform: mtk-mdp: move config to its own file
  media: platform: mtk-vcodec: move config to its own file
  media: platform: mtk-vpu: move config to its own file
  media: platform: omap3isp: move config to its own file
  media: platform: camss: move config to its own file
  media: platform: venus: move config to its own file
  media: platform: rga: move config to its own file
  media: platform: s3c-camif: move config to its own file
  media: platform: s5p-g2d: move config to its own file
  media: platform: hva: move config to its own file
  media: platform: stm32: move config to its own file
  media: platform: sun8i-di: move config to its own file
  media: platform: sun8i-rotate: move config to its own file
  media: platform: vde: move config to its own file
  media: platform: ti-vpe: move config to its own file
  media: platform: rkisp1: move config to its own file
  media: platform: delta: move config to its own file
  media: platform: bdisp: move config to its own file
  media: platform: s5p-mfc: move config to its own file
  media: platform: s5p-jpeg: move config to its own file
  media: platform: Kconfig: sort entries
  drivers: media: platform: move some manufacturer entries

 .../admin-guide/media/i2c-cardlist.rst        |   2 +-
 MAINTAINERS                                   |  22 +-
 drivers/media/Makefile                        |   4 +-
 drivers/media/cec/platform/Makefile           |  16 +-
 drivers/media/common/Makefile                 |   4 +-
 drivers/media/common/videobuf2/Makefile       |   6 +-
 drivers/media/dvb-frontends/Makefile          | 192 ++---
 drivers/media/firewire/Makefile               |   2 +-
 drivers/media/i2c/Makefile                    |  92 +--
 drivers/media/pci/Makefile                    |  18 +-
 drivers/media/pci/cx18/cx18-driver.c          |   2 +-
 drivers/media/pci/cx18/cx18-dvb.c             |   2 +-
 drivers/media/pci/cx18/cx18-gpio.c            |   2 +-
 drivers/media/pci/cx23885/cx23885-cards.c     |   2 +-
 drivers/media/pci/cx23885/cx23885-dvb.c       |   2 +-
 drivers/media/pci/cx23885/cx23885-video.c     |   2 +-
 drivers/media/pci/cx88/cx88.h                 |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c          |   2 +-
 drivers/media/pci/ivtv/ivtv-gpio.c            |   2 +-
 drivers/media/pci/saa7134/saa7134-cards.c     |   2 +-
 drivers/media/pci/saa7134/saa7134-dvb.c       |   2 +-
 drivers/media/platform/Kconfig                | 755 ++----------------
 drivers/media/platform/Makefile               | 132 +--
 drivers/media/platform/allegro-dvt/Kconfig    |  16 +
 drivers/media/platform/am437x/Kconfig         |   1 +
 drivers/media/platform/amphion/Kconfig        |  20 +
 drivers/media/platform/aspeed/Kconfig         |  10 +
 drivers/media/platform/aspeed/Makefile        |   1 +
 .../platform/{ => aspeed}/aspeed-video.c      |   0
 drivers/media/platform/atmel/Kconfig          |   4 +
 drivers/media/platform/cadence/Kconfig        |   1 +
 drivers/media/platform/coda/Kconfig           |  17 +
 drivers/media/platform/davinci/Kconfig        |   6 +
 drivers/media/platform/exynos-gsc/Kconfig     |  10 +
 drivers/media/platform/exynos4-is/Kconfig     |   1 +
 drivers/media/platform/imx-jpeg/Kconfig       |   1 +
 drivers/media/platform/imx/Kconfig            |   1 +
 drivers/media/platform/intel/Kconfig          |  11 +
 drivers/media/platform/intel/Makefile         |   1 +
 .../media/platform/{ => intel}/pxa_camera.c   |   0
 drivers/media/platform/marvell-ccic/Kconfig   |   2 +
 drivers/media/platform/meson/ge2d/Kconfig     |  14 +
 drivers/media/platform/mtk-jpeg/Kconfig       |  16 +
 drivers/media/platform/mtk-mdp/Kconfig        |  17 +
 drivers/media/platform/mtk-vcodec/Kconfig     |  36 +
 drivers/media/platform/mtk-vpu/Kconfig        |  15 +
 drivers/media/platform/nxp/Kconfig            |  40 +
 drivers/media/platform/nxp/Makefile           |   5 +
 drivers/media/platform/{ => nxp}/fsl-viu.c    |   0
 drivers/media/platform/{ => nxp}/imx-pxp.c    |   0
 drivers/media/platform/{ => nxp}/imx-pxp.h    |   0
 .../media/platform/{ => nxp}/mx2_emmaprp.c    |   0
 drivers/media/platform/omap/Kconfig           |   1 +
 drivers/media/platform/omap3isp/Kconfig       |  21 +
 drivers/media/platform/qcom/Kconfig           |   3 +
 drivers/media/platform/qcom/camss/Kconfig     |   9 +
 drivers/media/platform/qcom/venus/Kconfig     |  14 +
 drivers/media/platform/renesas/Kconfig        | 119 +++
 drivers/media/platform/renesas/Makefile       |  14 +
 .../media/platform/{ => renesas}/rcar-fcp.c   |   0
 .../media/platform/{ => renesas}/rcar-isp.c   |   0
 .../platform/{ => renesas}/rcar-vin/Kconfig   |   2 +
 .../platform/{ => renesas}/rcar-vin/Makefile  |   0
 .../{ => renesas}/rcar-vin/rcar-core.c        |   0
 .../{ => renesas}/rcar-vin/rcar-csi2.c        |   0
 .../{ => renesas}/rcar-vin/rcar-dma.c         |   0
 .../{ => renesas}/rcar-vin/rcar-v4l2.c        |   0
 .../{ => renesas}/rcar-vin/rcar-vin.h         |   0
 .../media/platform/{ => renesas}/rcar_drif.c  |   0
 .../media/platform/{ => renesas}/rcar_fdp1.c  |   0
 .../media/platform/{ => renesas}/rcar_jpu.c   |   0
 .../platform/{ => renesas}/renesas-ceu.c      |   0
 drivers/media/platform/{ => renesas}/sh_vou.c |   0
 drivers/media/platform/rockchip/Kconfig       |   3 +
 drivers/media/platform/rockchip/rga/Kconfig   |  14 +
 .../media/platform/rockchip/rkisp1/Kconfig    |  19 +
 drivers/media/platform/s3c-camif/Kconfig      |  15 +
 drivers/media/platform/s5p-g2d/Kconfig        |  11 +
 drivers/media/platform/s5p-jpeg/Kconfig       |  12 +
 drivers/media/platform/s5p-mfc/Kconfig        |   9 +
 drivers/media/platform/sti/Kconfig            |   5 +
 drivers/media/platform/sti/bdisp/Kconfig      |  10 +
 drivers/media/platform/sti/c8sectpfe/Kconfig  |   1 +
 drivers/media/platform/sti/delta/Kconfig      |  36 +
 drivers/media/platform/sti/hva/Kconfig        |  26 +
 drivers/media/platform/stm32/Kconfig          |  31 +
 drivers/media/platform/sunxi/Kconfig          |   2 +
 .../media/platform/sunxi/sun4i-csi/Kconfig    |   1 +
 .../media/platform/sunxi/sun6i-csi/Kconfig    |   1 +
 drivers/media/platform/sunxi/sun8i-di/Kconfig |  14 +
 .../media/platform/sunxi/sun8i-rotate/Kconfig |  14 +
 drivers/media/platform/tegra/vde/Kconfig      |  17 +
 drivers/media/platform/ti-vpe/Kconfig         |  62 ++
 drivers/media/platform/via/Kconfig            |  11 +
 drivers/media/platform/via/Makefile           |   1 +
 drivers/media/platform/{ => via}/via-camera.c |   0
 drivers/media/platform/{ => via}/via-camera.h |   0
 drivers/media/platform/xilinx/Kconfig         |   1 +
 drivers/media/radio/Makefile                  |  42 +-
 drivers/media/rc/Makefile                     |  45 +-
 drivers/media/rc/keymaps/Makefile             |  33 +-
 drivers/media/spi/Makefile                    |   5 +-
 drivers/media/test-drivers/Makefile           |  13 +-
 drivers/media/tuners/Makefile                 |  66 +-
 drivers/media/tuners/tuner-types.c            |   2 +-
 .../{tuner-xc2028-types.h => xc2028-types.h}  |   6 +-
 .../media/tuners/{tuner-xc2028.c => xc2028.c} |   6 +-
 .../media/tuners/{tuner-xc2028.h => xc2028.h} |   2 +-
 drivers/media/tuners/xc4000.c                 |   2 +-
 drivers/media/usb/Makefile                    |  25 +-
 drivers/media/usb/dvb-usb/cxusb.c             |   2 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c   |   2 +-
 drivers/media/usb/em28xx/em28xx-i2c.c         |   2 +-
 drivers/media/usb/em28xx/em28xx.h             |   2 +-
 drivers/media/usb/gspca/Makefile              |  88 +-
 drivers/media/usb/tm6000/tm6000-cards.c       |   2 +-
 drivers/media/usb/tm6000/tm6000-dvb.c         |   2 +-
 drivers/media/usb/tm6000/tm6000-i2c.c         |   2 +-
 drivers/media/v4l2-core/Makefile              |  29 +-
 drivers/media/v4l2-core/tuner-core.c          |   2 +-
 120 files changed, 1248 insertions(+), 1144 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/Kconfig
 create mode 100644 drivers/media/platform/amphion/Kconfig
 create mode 100644 drivers/media/platform/aspeed/Kconfig
 create mode 100644 drivers/media/platform/aspeed/Makefile
 rename drivers/media/platform/{ => aspeed}/aspeed-video.c (100%)
 create mode 100644 drivers/media/platform/coda/Kconfig
 create mode 100644 drivers/media/platform/exynos-gsc/Kconfig
 create mode 100644 drivers/media/platform/intel/Kconfig
 create mode 100644 drivers/media/platform/intel/Makefile
 rename drivers/media/platform/{ => intel}/pxa_camera.c (100%)
 create mode 100644 drivers/media/platform/meson/ge2d/Kconfig
 create mode 100644 drivers/media/platform/mtk-jpeg/Kconfig
 create mode 100644 drivers/media/platform/mtk-mdp/Kconfig
 create mode 100644 drivers/media/platform/mtk-vcodec/Kconfig
 create mode 100644 drivers/media/platform/mtk-vpu/Kconfig
 create mode 100644 drivers/media/platform/nxp/Kconfig
 create mode 100644 drivers/media/platform/nxp/Makefile
 rename drivers/media/platform/{ => nxp}/fsl-viu.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-pxp.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-pxp.h (100%)
 rename drivers/media/platform/{ => nxp}/mx2_emmaprp.c (100%)
 create mode 100644 drivers/media/platform/omap3isp/Kconfig
 create mode 100644 drivers/media/platform/qcom/Kconfig
 create mode 100644 drivers/media/platform/qcom/camss/Kconfig
 create mode 100644 drivers/media/platform/qcom/venus/Kconfig
 create mode 100644 drivers/media/platform/renesas/Kconfig
 create mode 100644 drivers/media/platform/renesas/Makefile
 rename drivers/media/platform/{ => renesas}/rcar-fcp.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-isp.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/Kconfig (93%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/Makefile (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-core.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-csi2.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-dma.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-v4l2.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-vin.h (100%)
 rename drivers/media/platform/{ => renesas}/rcar_drif.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar_fdp1.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar_jpu.c (100%)
 rename drivers/media/platform/{ => renesas}/renesas-ceu.c (100%)
 rename drivers/media/platform/{ => renesas}/sh_vou.c (100%)
 create mode 100644 drivers/media/platform/rockchip/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rga/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkisp1/Kconfig
 create mode 100644 drivers/media/platform/s3c-camif/Kconfig
 create mode 100644 drivers/media/platform/s5p-g2d/Kconfig
 create mode 100644 drivers/media/platform/s5p-jpeg/Kconfig
 create mode 100644 drivers/media/platform/s5p-mfc/Kconfig
 create mode 100644 drivers/media/platform/sti/Kconfig
 create mode 100644 drivers/media/platform/sti/bdisp/Kconfig
 create mode 100644 drivers/media/platform/sti/delta/Kconfig
 create mode 100644 drivers/media/platform/sti/hva/Kconfig
 create mode 100644 drivers/media/platform/stm32/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Kconfig
 create mode 100644 drivers/media/platform/tegra/vde/Kconfig
 create mode 100644 drivers/media/platform/ti-vpe/Kconfig
 create mode 100644 drivers/media/platform/via/Kconfig
 create mode 100644 drivers/media/platform/via/Makefile
 rename drivers/media/platform/{ => via}/via-camera.c (100%)
 rename drivers/media/platform/{ => via}/via-camera.h (100%)
 rename drivers/media/tuners/{tuner-xc2028-types.h => xc2028-types.h} (96%)
 rename drivers/media/tuners/{tuner-xc2028.c => xc2028.c} (99%)
 rename drivers/media/tuners/{tuner-xc2028.h => xc2028.h} (99%)

-- 
2.35.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
