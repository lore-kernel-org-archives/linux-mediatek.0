Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799B8C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8hYfj92BnOVvmjMW0qdgDJDtH3s5up4uQPIiLysDy8=; b=ywdRgwLSCkozOw
	rKtoknMyVnVkn2KTZ8rKwyBR1Ae4MUmTT7W67jZsVLVPQSxWEZcy+HLRqgQzJD3HeKDvWYfQGdZ1t
	mHP6qAnW1G5WD9WNMaqzRc1j/p/NQjDNnbRoPoD7O5DmIm/cV5AE1IPkCa44SGGl4NXVzVYHoQLPV
	f0X0V3DoMnRXTK/gXHERIi+93RmDTII9/92k1RoQcmcH+/5vCj+oQdvnHl9g0FRQKhLimby34CeV/
	v8faWPtQzpxiEtFUf2/1QmK8H//YfygsKvrzYEvDU0rJcg3FBM3IXFAwQZsrmGZT8UONcv99PNf6F
	tDjycTwduAu5WBso5eMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTg6c-004V1J-Nd; Mon, 14 Mar 2022 08:31:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfuO-004PdE-M5; Mon, 14 Mar 2022 08:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=36BhdCzk6bHWAs3J+Dl5i7Fbw1jAHHQxyduqJ4M4bF4=; b=SmqpfRVaJB8c6sZzpm1InSgWmy
 VVSiiToxZ/Kmy821laSjpBzK3kSx/A5UMig9gFbg4H7luxslYvtaatoumWDzxz3j5z1XilKgJ67xw
 +60nC2sYJ4NkNBDGqizldEYDE3ucUeGf8uE1N3Cmx7/srMuzS/3m0dhkWEg7drcvkPGX0VXpWYo5H
 cFofLc6rjPjDj+RKPj/UO/Uy7qzcNTiR8a3RL1qYnmOIhMrVlc4sr9a/jLWIg3T52Io8rQ+6D6r6w
 6QH2oaooKcp4X4CWYT2TPn+0BtP9+YRuY4n5PZ1KtfpolY6PduEwtY1DUHPNkC2rCl18Lw2UvNh32
 duvnwuzQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfYy-003qLo-IZ; Mon, 14 Mar 2022 07:56:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D2A86123D;
 Mon, 14 Mar 2022 07:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C83C341DF;
 Mon, 14 Mar 2022 07:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647244563;
 bh=CG9uAjVdPXiUWjH3qQXR/bMbwuprj1OVOqMx1CbvvGk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jTl4znB3nadho8hykHnZnOAG2QHFWqDB2oNfSaw8qzAxqVu98VuJp02nOeS+Lmd2y
 KeskzAqbZTKS60sGMXAbW/mNA1kC8NQD/pIkePyJzKPu9B6rP27Vqeqjx+Wmtk4UmX
 VdjLEAVGScnQoL8p0CKFhCMpXS5qGx7U166mb6cEWVnjA3EezB6pAHonzZa2gYmX+D
 yJkiz1fSniI02cqAzJ1RvfXL79m7OQgy0etwdtqY/q/BrY5lEoElL/lPEcXuxP5f3v
 qewuwaKhN2+aQu4DfucyL48e7A4ubNq2AkDMzJBm1XdcRZ15OkSHONSgrvrKKQUG0t
 twuw2AJG7W6eg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTfYe-001kYB-Vh; Mon, 14 Mar 2022 08:56:00 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Heiko Stuebner <heiko@sntech.de>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Robert Foss <robert.foss@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Shijie Qin <shijie.qin@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 62/64] media: platform: Create vendor/{Makefile, Kconfig} files
Date: Mon, 14 Mar 2022 08:55:54 +0100
Message-Id: <08f24bffc56840cd2d07905338efcab68872795d.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_075620_849928_46B015FC 
X-CRM114-Status: GOOD (  15.85  )
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

Instead of placing multiple per-vendor entries at the
platform/{Makefile,Kconfig}, create them at the per-vendor
directories.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig             | 27 ++++-------------
 drivers/media/platform/Makefile            | 35 +++++-----------------
 drivers/media/platform/amlogic/Kconfig     |  2 ++
 drivers/media/platform/amlogic/Makefile    |  2 ++
 drivers/media/platform/mediatek/Kconfig    |  5 ++++
 drivers/media/platform/mediatek/Makefile   |  5 ++++
 drivers/media/platform/nvidia/Kconfig      |  2 ++
 drivers/media/platform/nxp/Kconfig         |  1 +
 drivers/media/platform/nxp/Makefile        |  1 +
 drivers/media/platform/nxp/amphion/Kconfig |  1 +
 drivers/media/platform/qcom/Makefile       |  3 ++
 drivers/media/platform/rockchip/Makefile   |  3 ++
 drivers/media/platform/samsung/Kconfig     |  7 +++++
 drivers/media/platform/samsung/Makefile    |  7 +++++
 drivers/media/platform/sti/Kconfig         |  1 +
 drivers/media/platform/sti/Makefile        |  6 ++++
 drivers/media/platform/ti/Kconfig          |  6 ++++
 drivers/media/platform/ti/Makefile         |  6 ++++
 18 files changed, 71 insertions(+), 49 deletions(-)
 create mode 100644 drivers/media/platform/amlogic/Kconfig
 create mode 100644 drivers/media/platform/amlogic/Makefile
 create mode 100644 drivers/media/platform/mediatek/Kconfig
 create mode 100644 drivers/media/platform/mediatek/Makefile
 create mode 100644 drivers/media/platform/nvidia/Kconfig
 create mode 100644 drivers/media/platform/qcom/Makefile
 create mode 100644 drivers/media/platform/rockchip/Makefile
 create mode 100644 drivers/media/platform/samsung/Kconfig
 create mode 100644 drivers/media/platform/samsung/Makefile
 create mode 100644 drivers/media/platform/sti/Makefile
 create mode 100644 drivers/media/platform/ti/Kconfig
 create mode 100644 drivers/media/platform/ti/Makefile

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 05b720ac0961..8bd92e4f4d9b 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -62,41 +62,24 @@ config VIDEO_MUX
 	  This driver provides support for N:1 video bus multiplexers.
 
 # Platform drivers - Please keep it alphabetically sorted
-
-# TODO: create per-manufacturer directories
-
 source "drivers/media/platform/allegro-dvt/Kconfig"
 source "drivers/media/platform/allwinner/Kconfig"
-source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
+source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/cadence/Kconfig"
 source "drivers/media/platform/chips-media/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell/Kconfig"
-source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
-source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
-source "drivers/media/platform/mediatek/mtk-vcodec/Kconfig"
-source "drivers/media/platform/mediatek/mtk-vpu/Kconfig"
-source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
+source "drivers/media/platform/mediatek/Kconfig"
+source "drivers/media/platform/nvidia/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
-source "drivers/media/platform/nxp/amphion/Kconfig"
 source "drivers/media/platform/qcom/Kconfig"
 source "drivers/media/platform/renesas/Kconfig"
 source "drivers/media/platform/rockchip/Kconfig"
-source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
-source "drivers/media/platform/samsung/exynos4-is/Kconfig"
-source "drivers/media/platform/samsung/s3c-camif/Kconfig"
-source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
-source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
-source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
+source "drivers/media/platform/samsung/Kconfig"
 source "drivers/media/platform/sti/Kconfig"
-source "drivers/media/platform/sti/stm32/Kconfig"
-source "drivers/media/platform/ti/am437x/Kconfig"
-source "drivers/media/platform/ti/davinci/Kconfig"
-source "drivers/media/platform/ti/omap/Kconfig"
-source "drivers/media/platform/ti/omap3isp/Kconfig"
-source "drivers/media/platform/ti/vpe/Kconfig"
+source "drivers/media/platform/ti/Kconfig"
 source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
 
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 1e62a4009b6c..5b14b231140b 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -7,41 +7,22 @@
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
 obj-y += allwinner/
-obj-y += amlogic/meson-ge2d/
+obj-y += amlogic/
 obj-y += aspeed/
 obj-y += atmel/
 obj-y += cadence/
 obj-y += chips-media/
 obj-y += intel/
 obj-y += marvell/
-obj-y += mediatek/mtk-jpeg/
-obj-y += mediatek/mtk-mdp/
-obj-y += mediatek/mtk-vcodec/
-obj-y += mediatek/mtk-vpu/
-obj-y += nvidia/tegra-vde/
+obj-y += mediatek/
+obj-y += nvidia/
 obj-y += nxp/
-obj-y += nxp/amphion/
-obj-y += qcom/camss/
-obj-y += qcom/venus/
+obj-y += qcom/
 obj-y += renesas/
-obj-y += rockchip/rga/
-obj-y += rockchip/rkisp1/
-obj-y += samsung/exynos-gsc/
-obj-y += samsung/exynos4-is/
-obj-y += samsung/s3c-camif/
-obj-y += samsung/s5p-g2d/
-obj-y += samsung/s5p-jpeg/
-obj-y += samsung/s5p-mfc/
-obj-y += sti/bdisp/
-obj-y += sti/c8sectpfe/
-obj-y += sti/delta/
-obj-y += sti/hva/
-obj-y += sti/stm32/
-obj-y += ti/am437x/
-obj-y += ti/davinci/
-obj-y += ti/omap/
-obj-y += ti/omap3isp/
-obj-y += ti/vpe/
+obj-y += rockchip/
+obj-y += samsung/
+obj-y += sti/
+obj-y += ti/
 obj-y += via/
 obj-y += xilinx/
 
diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
new file mode 100644
index 000000000000..c67e00df6202
--- /dev/null
+++ b/drivers/media/platform/amlogic/Kconfig
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
new file mode 100644
index 000000000000..d3cdb8fa4ddb
--- /dev/null
+++ b/drivers/media/platform/amlogic/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += meson-ge2d/
diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
new file mode 100644
index 000000000000..6d74839df3d6
--- /dev/null
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
+source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
+source "drivers/media/platform/mediatek/mtk-vcodec/Kconfig"
+source "drivers/media/platform/mediatek/mtk-vpu/Kconfig"
diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
new file mode 100644
index 000000000000..403d5ecd2b10
--- /dev/null
+++ b/drivers/media/platform/mediatek/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += mtk-jpeg/
+obj-y += mtk-mdp/
+obj-y += mtk-vcodec/
+obj-y += mtk-vpu/
diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
new file mode 100644
index 000000000000..1162e272b5f9
--- /dev/null
+++ b/drivers/media/platform/nvidia/Kconfig
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index df52d32ebe50..e82bfcd97ac7 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -63,4 +63,5 @@ config VIDEO_MX2_EMMAPRP
 	    memory to memory. Operations include resizing and format
 	    conversion.
 
+source "drivers/media/platform/nxp/amphion/Kconfig"
 source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index efc38c6578ce..c90de5b873ab 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-y += amphion/
 obj-y += imx-jpeg/
 
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
diff --git a/drivers/media/platform/nxp/amphion/Kconfig b/drivers/media/platform/nxp/amphion/Kconfig
index 13899649f766..679a5f8eb1a1 100644
--- a/drivers/media/platform/nxp/amphion/Kconfig
+++ b/drivers/media/platform/nxp/amphion/Kconfig
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
 config VIDEO_AMPHION_VPU
 	tristate "Amphion VPU (Video Processing Unit) Codec IP"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
new file mode 100644
index 000000000000..4f055c396e04
--- /dev/null
+++ b/drivers/media/platform/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += camss/
+obj-y += venus/
diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
new file mode 100644
index 000000000000..4f782b876ac9
--- /dev/null
+++ b/drivers/media/platform/rockchip/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += rga/
+obj-y += rkisp1/
diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
new file mode 100644
index 000000000000..94f30c1bca9b
--- /dev/null
+++ b/drivers/media/platform/samsung/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
+source "drivers/media/platform/samsung/exynos4-is/Kconfig"
+source "drivers/media/platform/samsung/s3c-camif/Kconfig"
+source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
+source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
+source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
diff --git a/drivers/media/platform/samsung/Makefile b/drivers/media/platform/samsung/Makefile
new file mode 100644
index 000000000000..21fea3330e4b
--- /dev/null
+++ b/drivers/media/platform/samsung/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += exynos-gsc/
+obj-y += exynos4-is/
+obj-y += s3c-camif/
+obj-y += s5p-g2d/
+obj-y += s5p-jpeg/
+obj-y += s5p-mfc/
diff --git a/drivers/media/platform/sti/Kconfig b/drivers/media/platform/sti/Kconfig
index 9fb5e78a92cf..d5423743d905 100644
--- a/drivers/media/platform/sti/Kconfig
+++ b/drivers/media/platform/sti/Kconfig
@@ -3,3 +3,4 @@ source "drivers/media/platform/sti/bdisp/Kconfig"
 source "drivers/media/platform/sti/c8sectpfe/Kconfig"
 source "drivers/media/platform/sti/delta/Kconfig"
 source "drivers/media/platform/sti/hva/Kconfig"
+source "drivers/media/platform/sti/stm32/Kconfig"
diff --git a/drivers/media/platform/sti/Makefile b/drivers/media/platform/sti/Makefile
new file mode 100644
index 000000000000..f9ce8169b040
--- /dev/null
+++ b/drivers/media/platform/sti/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += bdisp/
+obj-y += c8sectpfe/
+obj-y += delta/
+obj-y += hva/
+obj-y += stm32/
diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
new file mode 100644
index 000000000000..f422c68f4a99
--- /dev/null
+++ b/drivers/media/platform/ti/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+source "drivers/media/platform/ti/am437x/Kconfig"
+source "drivers/media/platform/ti/davinci/Kconfig"
+source "drivers/media/platform/ti/omap/Kconfig"
+source "drivers/media/platform/ti/omap3isp/Kconfig"
+source "drivers/media/platform/ti/vpe/Kconfig"
diff --git a/drivers/media/platform/ti/Makefile b/drivers/media/platform/ti/Makefile
new file mode 100644
index 000000000000..f04e371869a1
--- /dev/null
+++ b/drivers/media/platform/ti/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += am437x/
+obj-y += davinci/
+obj-y += omap/
+obj-y += omap3isp/
+obj-y += vpe/
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
