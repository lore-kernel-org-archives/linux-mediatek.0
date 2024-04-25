Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B67C10F15
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 02:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xpk8TStm+BIaAYKCVa48yk98BAjt0afumgy4Jzvyv7s=; b=xPVy03hVbFDMqdwb0y7mS7YVyR
	l9a5jY+ariSh/dFdbULVX1SgWPsz5N0iHIZ6SB9lLo9IBm85IE3tbtB9l8EUVKbaUt+C/3FiVPRsB
	uOguhaboKS1mwL5dN9sNuBkN9u5ocYDK/+j/Z9CkD6GrNeMCiV2fuboVGxx3prqsC0i7uVuZMhCdP
	Nn/9CJ6kATOvOvS4WqW0LU+oOPpw1yK5QxgLreUQr5IcyvoWK65owycd7q/LhtPcuAj151w8AvBGq
	+T4/1JjwouLpgBxSPPgVBehjQcHaGDpCseypmY7UKWjUzH7Oxvh2HuUayiN1iNQRkaStrXf5ywqe5
	jqe+Ulww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzowB-00000006iLQ-30nX;
	Thu, 25 Apr 2024 02:34:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzow6-00000006iHg-0tN4;
	Thu, 25 Apr 2024 02:34:11 +0000
X-UUID: 4944feba02ac11ef96d5dfc950b7243d-20240424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xpk8TStm+BIaAYKCVa48yk98BAjt0afumgy4Jzvyv7s=;
	b=Ej8vMMWy2gtRAKkQvk2ipo2aJ9gS1Jl2t5a/h4tzI9xUlLMXq/mARdPH7HR9CZQacJ0wdxyvpivqx9z31T2DFou7KXihsHnhJ3hJaFn+4ulOJTLf5QU/ZvXc/4nxokjAt7v5/WT6j9uLNnkrwUNGxvQ8cv9imTuoGwRl8B97zi8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:dea0449a-2563-4396-9a53-cde61616823c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:c57dfc91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4944feba02ac11ef96d5dfc950b7243d-20240424
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1633015750; Wed, 24 Apr 2024 19:34:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 Apr 2024 10:33:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 Apr 2024 10:33:49 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH 1/3] net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
Date: Thu, 25 Apr 2024 10:33:23 +0800
Message-ID: <20240425023325.15586-2-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.544200-8.000000
X-TMASE-MatchedRID: ptJ0KTv/UXCfF/fARRyav23NvezwBrVmK2i9pofGVSvNQVzhfYY5snLM
	RSx26gTiX3E2fHKxS5INbmAgKiEzxBLmJd2F/yFu7spMO3HwKCDVy4hHC3/gyF7zF1i7scLKSAK
	UIhfaB7Aii9Z7QbHpoFHPi8Y3eGK1/Guz40Ud3KS3D7EeeyZCM30tCKdnhB589yM15V5aWpj6C0
	ePs7A07SAJgyd9wrc8GBv6238f5M0QmfyTzgfrmpQ6BnyNbPBfXJ5YkyXIpv/50fenSUXXlQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.544200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3138F1F7FA7E585F5281664CAFD4859A4F786D6963A62751864A369443BBD8A42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_193410_341242_7D62D3D0 
X-CRM114-Status: GOOD (  17.04  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

Re-organize MediaTek ethernet phy driver files and get ready to integrate
some common functions and add new 2.5G phy driver.
mtk-ge.c: MT7530 Gphy on MT7621 & MT7531 Gphy
mtk-ge-soc.c: Built-in Gphy on MT7981 & Built-in switch Gphy on MT7988
mtk-2p5ge.c: Planned for built-in 2.5G phy on MT7988

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 MAINTAINERS                                     |  4 ++--
 drivers/net/phy/Kconfig                         | 17 +----------------
 drivers/net/phy/Makefile                        |  3 +--
 drivers/net/phy/mediatek/Kconfig                | 17 +++++++++++++++++
 drivers/net/phy/mediatek/Makefile               |  3 +++
 .../mtk-ge-soc.c}                               |  0
 .../phy/{mediatek-ge.c => mediatek/mtk-ge.c}    |  0
 7 files changed, 24 insertions(+), 20 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/Kconfig
 create mode 100644 drivers/net/phy/mediatek/Makefile
 rename drivers/net/phy/{mediatek-ge-soc.c => mediatek/mtk-ge-soc.c} (100%)
 rename drivers/net/phy/{mediatek-ge.c => mediatek/mtk-ge.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7ff3c758535..b59edadfb8fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13908,8 +13908,8 @@ M:	Qingfang Deng <dqfext@gmail.com>
 M:	SkyLake Huang <SkyLake.Huang@mediatek.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	drivers/net/phy/mediatek-ge-soc.c
-F:	drivers/net/phy/mediatek-ge.c
+F:	drivers/net/phy/mediatek/mtk-ge-soc.c
+F:	drivers/net/phy/mediatek/mtk-ge.c
 F:	drivers/phy/mediatek/phy-mtk-xfi-tphy.c
 
 MEDIATEK I2C CONTROLLER DRIVER
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 7fddc8306d82..c5ff747bb277 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -256,22 +256,7 @@ config MAXLINEAR_GPHY
 	  Support for the Maxlinear GPY115, GPY211, GPY212, GPY215,
 	  GPY241, GPY245 PHYs.
 
-config MEDIATEK_GE_PHY
-	tristate "MediaTek Gigabit Ethernet PHYs"
-	help
-	  Supports the MediaTek Gigabit Ethernet PHYs.
-
-config MEDIATEK_GE_SOC_PHY
-	tristate "MediaTek SoC Ethernet PHYs"
-	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
-	depends on NVMEM_MTK_EFUSE
-	help
-	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
-
-	  Include support for built-in Ethernet PHYs which are present in
-	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
-	  present in the SoCs efuse and will dynamically calibrate VCM
-	  (common-mode voltage) during startup.
+source "drivers/net/phy/mediatek/Kconfig"
 
 config MICREL_PHY
 	tristate "Micrel PHYs"
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 1d8be374915f..c0eb595ca773 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -72,8 +72,7 @@ obj-$(CONFIG_MARVELL_PHY)	+= marvell.o
 obj-$(CONFIG_MARVELL_88Q2XXX_PHY)	+= marvell-88q2xxx.o
 obj-$(CONFIG_MARVELL_88X2222_PHY)	+= marvell-88x2222.o
 obj-$(CONFIG_MAXLINEAR_GPHY)	+= mxl-gpy.o
-obj-$(CONFIG_MEDIATEK_GE_PHY)	+= mediatek-ge.o
-obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mediatek-ge-soc.o
+obj-y				+= mediatek/
 obj-$(CONFIG_MESON_GXL_PHY)	+= meson-gxl.o
 obj-$(CONFIG_MICREL_KS8995MA)	+= spi_ks8995.o
 obj-$(CONFIG_MICREL_PHY)	+= micrel.o
diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
new file mode 100644
index 000000000000..5f97e27af600
--- /dev/null
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config MEDIATEK_GE_PHY
+	tristate "MediaTek Gigabit Ethernet PHYs"
+	help
+	  Supports the MediaTek Gigabit Ethernet PHYs.
+
+config MEDIATEK_GE_SOC_PHY
+	bool "MediaTek SoC Ethernet PHYs"
+	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
+	select NVMEM_MTK_EFUSE
+	help
+	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
+
+	  Include support for built-in Ethernet PHYs which are present in
+	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
+	  present in the SoCs efuse and will dynamically calibrate VCM
+	  (common-mode voltage) during startup.
diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
new file mode 100644
index 000000000000..005bde26c1d7
--- /dev/null
+++ b/drivers/net/phy/mediatek/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
+obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
similarity index 100%
rename from drivers/net/phy/mediatek-ge-soc.c
rename to drivers/net/phy/mediatek/mtk-ge-soc.c
diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
similarity index 100%
rename from drivers/net/phy/mediatek-ge.c
rename to drivers/net/phy/mediatek/mtk-ge.c
-- 
2.18.0


