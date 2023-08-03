Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2020DC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H8aGCGdR8ep/R7bfhQhSsKs04iuzspZux5DrF0yuErw=; b=KIqRmuEippK+oL
	dhskp392Mr9GA2VPgqCKLYBfMjSbjkTIk+fGUQlKspwKuUrEl7u7tmWzsy2S+1IzEs+DQrmcQnNrP
	QoIn8ltN6yrXup98J/qRTTlh5H398EQmeX62UtaVmqJR6CaCgGsI5rFIGfDsn3AXptjuyXC/WQ2UP
	yvOuRutf/Tw+FjkUNHeQvqhxDy6FQm/mg4fc+/QbgHCA299XNKAIURRKCYC2kB04i+vSrkS0nv925
	i38ts2OZUKJcPe9QfRhxMh6W9eh88sszVaYKS+3f+09Dp0+e95RgouYBQ2w9VGjaCV8sESdghG9gj
	30COF7DLZVTHXIwj4s+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2A-00B0Qs-38;
	Thu, 03 Aug 2023 22:43:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh27-00B0QB-0u;
	Thu, 03 Aug 2023 22:43:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 132BD61ED0;
	Thu,  3 Aug 2023 22:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCD6C433C7;
	Thu,  3 Aug 2023 22:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102581;
	bh=ENRnyG3da4GOMsyMnnkqd5l4ksii3jE/UxcP8TpIUp0=;
	h=From:Subject:Date:List-Id:To:Cc:From;
	b=b1ZGL++s9M6a2QHtVlyaW5BkQWjjk7R4o8bbCtbBfjTixFJ8iJSFJHFMEb4Tg0fOg
	 KCYaw+oqdTE2YKp0a2HE/Q959aB5N0lVPUjq9HEx56OuaefXQaotpqTbM/17tNjHog
	 uGZpeAIJBsTwfPqe8OatJ88SBO7knIcWDilyvDoub3Sftq6jTXOSFUivD/gBQTXxZ+
	 7+CKDmQUaqkgaTx2n6WyIkETT1jpARNb6ZLZFM8qCbuJutqzeHF88ZUgbzAZjvABdQ
	 EvdKnHaz9mUH5TCCYg62M3f+16EDkMndxHd2Hr1zsvn2xlf8+KzWG0+GzTjz6bUdU6
	 AbRwrjD39EpnA==
Received: (nullmailer pid 3693749 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 00/23] ARM: DT include cleanups
Date: Thu, 03 Aug 2023 16:42:40 -0600
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAtzGQC/x2NQQrCMBAAv1L27GJIsahfEQ+bZGMCmpTdVAqlf
 zf1OAzMbKAsmRXuwwbC36y5lg72NIBPVF6MOXQGa+xormbE0DAxBRb0b6ayzIqxCmr16OPtEhx
 PZnIBesCRMjqh4tORKLy284e0sRx2Fo55/a8fz33/AVubj5GKAAAA
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154303_429909_6142F494 
X-CRM114-Status: GOOD (  14.01  )
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

Arnd, This is all the remaining ARM and SoC related patches of DT 
include cleanups which have not be applied by sub-arch maintainers.

A few of these are v2, but most are just resends of v1.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (23):
      ARM: l2x0: Add explicit includes for init and types
      ARM: sti: Drop unused includes
      ARM: alpine: Drop unused includes
      ARM: berlin: Drop unused includes
      ARM: dove: Drop unused includes
      ARM: hpe: Drop unused includes
      ARM: mmp: Drop unused includes
      ARM: nomadik: Drop unused includes
      ARM: npcm: Drop unused includes
      ARM: nspire: Drop unused includes
      ARM: pxa: Drop unused includes
      ARM: rockchip: Drop unused includes
      ARM: versatile: Drop unused includes
      ARM: mvebu: Explicitly include correct DT includes
      ARM: spear: Explicitly include correct DT includes
      bus: Explicitly include correct DT includes
      firmware: Explicitly include correct DT includes
      soc: aspeed: Explicitly include correct DT includes
      soc: mediatek: Explicitly include correct DT includes
      soc: rockchip: Explicitly include correct DT includes
      soc: sunxi: Explicitly include correct DT includes
      soc: xilinx: Explicitly include correct DT includes
      soc: fsl: Explicitly include correct DT includes

 arch/arm/include/asm/hardware/cache-l2x0.h |  2 ++
 arch/arm/mach-alpine/alpine_machine.c      |  2 --
 arch/arm/mach-berlin/berlin.c              |  5 -----
 arch/arm/mach-dove/common.c                |  2 --
 arch/arm/mach-hpe/gxp.c                    |  1 -
 arch/arm/mach-mmp/mmp-dt.c                 |  3 ---
 arch/arm/mach-mmp/mmp2-dt.c                |  4 ----
 arch/arm/mach-mmp/mmp3.c                   |  4 ----
 arch/arm/mach-mvebu/kirkwood.c             |  1 +
 arch/arm/mach-mvebu/pmsu.c                 |  2 +-
 arch/arm/mach-nomadik/cpu-8815.c           | 13 -------------
 arch/arm/mach-npcm/platsmp.c               |  3 ---
 arch/arm/mach-nspire/nspire.c              |  9 +--------
 arch/arm/mach-pxa/pxa-dt.c                 |  6 ------
 arch/arm/mach-rockchip/rockchip.c          |  6 +-----
 arch/arm/mach-spear/spear1340.c            |  2 +-
 arch/arm/mach-sti/board-dt.c               |  2 --
 arch/arm/mach-versatile/realview.c         |  2 --
 drivers/bus/fsl-mc/fsl-mc-bus.c            |  1 +
 drivers/bus/fsl-mc/fsl-mc-msi.c            |  2 --
 drivers/bus/hisi_lpc.c                     |  2 +-
 drivers/bus/omap_l3_smx.c                  |  1 -
 drivers/bus/simple-pm-bus.c                |  2 ++
 drivers/bus/sunxi-rsb.c                    |  2 +-
 drivers/bus/ti-pwmss.c                     |  2 +-
 drivers/firmware/arm_scmi/driver.c         |  4 ++--
 drivers/firmware/imx/imx-dsp.c             |  1 -
 drivers/firmware/imx/imx-scu-irq.c         |  1 +
 drivers/firmware/imx/imx-scu.c             |  1 +
 drivers/firmware/mtk-adsp-ipc.c            |  1 -
 drivers/firmware/raspberrypi.c             |  1 +
 drivers/firmware/scpi_pm_domain.c          |  3 ++-
 drivers/firmware/stratix10-rsu.c           |  1 -
 drivers/firmware/tegra/bpmp.c              |  3 +--
 drivers/firmware/xilinx/zynqmp.c           |  1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c      |  1 -
 drivers/soc/aspeed/aspeed-p2a-ctrl.c       |  2 +-
 drivers/soc/aspeed/aspeed-uart-routing.c   |  3 +--
 drivers/soc/fsl/dpaa2-console.c            |  3 ++-
 drivers/soc/fsl/qe/qe.c                    |  3 ++-
 drivers/soc/fsl/qe/qe_common.c             |  1 -
 drivers/soc/fsl/qe/qe_tdm.c                |  4 +---
 drivers/soc/mediatek/mtk-cmdq-helper.c     |  1 +
 drivers/soc/mediatek/mtk-devapc.c          |  2 +-
 drivers/soc/mediatek/mtk-mmsys.c           |  2 +-
 drivers/soc/mediatek/mtk-mutex.c           |  3 +--
 drivers/soc/mediatek/mtk-pmic-wrap.c       |  3 ++-
 drivers/soc/rockchip/grf.c                 |  2 +-
 drivers/soc/sunxi/sunxi_sram.c             |  2 +-
 drivers/soc/xilinx/zynqmp_power.c          |  1 +
 50 files changed, 38 insertions(+), 93 deletions(-)
---
base-commit: fb4327106e5250ee360d0d8b056c1eef7eeb9a98
change-id: 20230803-dt-header-cleanups-for-soc-cf95dbe606bd

Best regards,
-- 
Rob Herring <robh@kernel.org>


