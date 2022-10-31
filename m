Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01DDFA3740
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7EazCfZ0hTC/R9RoZPVnUzrerqCstOSV7+G8DaxM3Y4=; b=F7RZFOtkgTj0PEgoxsnZEfBmDI
	RwOfDeVcZKQ/mSBZ+a77Va0/lf90Jo7aAiuKKkjHvfrU31I2pbyRft0DvdQ+ruEHsxdWbMdIxjdBY
	xOc3SZUEoQjTyekc4EK2pjFqzaOChly2bn0lBIy1ghbLm/11DXQH6qtj8xPgxBBq0gw1oR4wXPJGc
	MbTxwBbtXzIqf0W3VeE3zRoo8KQX90gOP9/TaMXHuWl+Q54138IdMJ2a/AUzYPtp14qoTPScavnoC
	hstHeu8TX8uRDimNP2hY7+lGOCOmRFiNeVK3Hpni1wlB8GjM1trRrr/qI0Pqt8a7ovUPcRstreUdN
	J4GP/XXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQww-009yLd-Sj; Mon, 31 Oct 2022 09:19:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQwi-009yBu-Bv; Mon, 31 Oct 2022 09:19:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60CC1FB;
	Mon, 31 Oct 2022 02:19:05 -0700 (PDT)
Received: from pierre123.arm.com (unknown [10.57.7.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5BF23F703;
	Mon, 31 Oct 2022 02:18:57 -0700 (PDT)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: pierre.gondois@arm.com,
	Rob.Herring@arm.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 00/20] Update cache properties for arm64 DTS
Date: Mon, 31 Oct 2022 10:18:48 +0100
Message-Id: <20221031091848.530938-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_021904_543268_4D9EC5A9 
X-CRM114-Status: GOOD (  10.02  )
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

Align arm64 DTS to the DeviceTree specification v0.3 regarding
cache properties. The patch-set mainly adds 'cache-level' or
'cache' compatibility properties.
For one qcom DTS, level 1 cache nodes are removed as they should
be in the cpu nodes.

On another node, it seems that the 'cache-unified' is under-used.
cache-unified:
  If present, specifies the cache has a unified or-
  ganization. If not present, specifies that the
  cache has a Harvard architecture with separate
  caches for instructions and data.
Only a few l2 cache nodes have this property, and in the absence
of [|d|i]-cache-size properties (or other), the cache is assumed to be
split.

The l2 cache of the Rockchip RK3308 platform is thus assumed to be
split:
l2: l2-cache {
	compatible = "cache";
	cache-level = <2>;
};
when the platform datasheet advertises a unified cache.

No modification/check was made to correct that due to the lack of
cache information for most platforms.

Pierre Gondois (20):
  arm64: dts: Update cache properties for amd
  arm64: dts: Update cache properties for amlogic
  arm64: dts: Update cache properties for apm
  arm64: dts: Update cache properties for arm
  arm64: dts: Update cache properties for broadcom
  arm64: dts: Update cache properties for exynos
  arm64: dts: Update cache properties for freescale
  arm64: dts: Update cache properties for hisilicon
  arm64: dts: Update cache properties for lg
  arm64: dts: Update cache properties for marvell
  arm64: dts: Update cache properties for mediatek
  arm64: dts: Update cache properties for microchip
  arm64: dts: Update cache properties for nuvoton
  arm64: dts: Update cache properties for nvidia
  arm64: dts: Update cache properties for qcom
  arm64: dts: Update cache properties for realtek
  arm64: dts: Update cache properties for renesas
  arm64: dts: Update cache properties for rockchip
  arm64: dts: Update cache properties for synaptics
  arm64: dts: Update cache properties for tesla

 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi |  9 +++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  1 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi    |  4 ++
 arch/arm64/boot/dts/apm/apm-storm.dtsi        |  4 ++
 arch/arm64/boot/dts/arm/foundation-v8.dtsi    |  1 +
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts    |  1 +
 .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts |  1 +
 .../boot/dts/broadcom/bcm4908/bcm4908.dtsi    |  1 +
 .../boot/dts/broadcom/bcmbca/bcm4912.dtsi     |  1 +
 .../boot/dts/broadcom/bcmbca/bcm63146.dtsi    |  1 +
 .../boot/dts/broadcom/bcmbca/bcm63158.dtsi    |  1 +
 .../boot/dts/broadcom/bcmbca/bcm6813.dtsi     |  1 +
 .../boot/dts/broadcom/bcmbca/bcm6856.dtsi     |  1 +
 .../boot/dts/broadcom/bcmbca/bcm6858.dtsi     |  1 +
 .../boot/dts/broadcom/northstar2/ns2.dtsi     |  1 +
 .../boot/dts/broadcom/stingray/stingray.dtsi  |  4 ++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  2 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |  1 +
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  1 +
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi |  1 +
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  1 +
 .../arm64/boot/dts/freescale/fsl-ls2080a.dtsi |  4 ++
 .../arm64/boot/dts/freescale/fsl-ls2088a.dtsi |  4 ++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  1 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  2 +
 arch/arm64/boot/dts/freescale/s32v234.dtsi    |  2 +
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |  2 +
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |  2 +
 arch/arm64/boot/dts/hisilicon/hip05.dtsi      |  4 ++
 arch/arm64/boot/dts/hisilicon/hip06.dtsi      |  4 ++
 arch/arm64/boot/dts/hisilicon/hip07.dtsi      | 16 ++++++
 arch/arm64/boot/dts/lg/lg1312.dtsi            |  1 +
 arch/arm64/boot/dts/lg/lg1313.dtsi            |  1 +
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi |  1 +
 .../boot/dts/marvell/armada-ap806-dual.dtsi   |  1 +
 .../boot/dts/marvell/armada-ap806-quad.dtsi   |  2 +
 .../boot/dts/marvell/armada-ap807-quad.dtsi   |  2 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  3 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  1 +
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 10 ++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 30 ++++++++++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 56 -------------------
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  9 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  9 +++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  9 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  9 +++
 arch/arm64/boot/dts/qcom/sm6125.dtsi          |  2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  9 +++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  9 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  9 +++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  9 +++
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  9 +++
 arch/arm64/boot/dts/realtek/rtd1293.dtsi      |  1 +
 arch/arm64/boot/dts/realtek/rtd1295.dtsi      |  1 +
 arch/arm64/boot/dts/realtek/rtd1296.dtsi      |  1 +
 arch/arm64/boot/dts/realtek/rtd1395.dtsi      |  1 +
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi      |  2 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |  1 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  1 +
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi  |  1 +
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  1 +
 72 files changed, 238 insertions(+), 56 deletions(-)

-- 
2.25.1


