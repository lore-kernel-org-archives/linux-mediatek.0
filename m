Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA962C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCBDd+FQqwEpknfDyeFMoA800OUjt687YD+9JZEhZjM=; b=RS59jKmGTWtAnDbz7maNd3LdcV
	rpZtzOIlkgSNebgiVDZPBJbm74mFpgiYy9Q+W9IrvPayTQ1EfbM8ru81HStZ0TNj1+BZa103Ka2hl
	/F179nzgFDAQEEFt9urW+PfjHWkA7IyxDwyX9Lu6itjKWi26TBH6eI7Ygl0gHNtXmum424pLMw9P1
	m1XXyjAqfMlu8RXy28Fb98ueFABcvHzUoo8TBQRsq6N12H521tm6uZf93UhcjWYdZ9DVNfQVLMima
	yopFbI5C3e7+qcM3kQWWog7SHndvmP4ehKpvJn2V1x/C1hqs55hR1/oVDmPNt/RtUFcaeilvsjDMD
	yybLiAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2d-00B0fN-0S;
	Thu, 03 Aug 2023 22:43:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2Y-00B0cb-2j;
	Thu, 03 Aug 2023 22:43:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5416E61EE4;
	Thu,  3 Aug 2023 22:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B551EC43391;
	Thu,  3 Aug 2023 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102609;
	bh=9nVqrbgqiTtsA43YofnsmMUe8t12OR089zVkKSi+w+s=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=hTvEF009At/jtc+dNn1MISJJGyeJyTlZ6SEWq9boBjYnXO8pdkBFXXf4OT4cNxTNI
	 3ingNKgV9zBooCA1eTd6roG3VH2yZ1PsatmkFj+ZlxM/yX3yFVhMuuemonSSUsUMR7
	 ae/kM8wobIfS+lBfJYY71QxRITjH5AEgC0Mkx/e54vTcZwfmJWL1HF0uhJ8OjN4h9P
	 WFS+ZJMYK/SFihCC+9BPIWWcn7c617HOKdR29kYwioqQhMeGaKl/v3Ja0Hu1PWQRQb
	 nBRAew3tMntriePMIrtBfeKiwwx6NQSH4bLi0wytG5awxfJ5p3uM5ev/8GenA8ix03
	 2vQkqR559Eyeg==
Received: (nullmailer pid 3693782 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:56 -0600
Subject: [PATCH v2 16/23] bus: Explicitly include correct DT includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-16-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154330_973879_B96615D9 
X-CRM114-Status: GOOD (  16.61  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 1 +
 drivers/bus/fsl-mc/fsl-mc-msi.c | 2 --
 drivers/bus/hisi_lpc.c          | 2 +-
 drivers/bus/omap_l3_smx.c       | 1 -
 drivers/bus/simple-pm-bus.c     | 2 ++
 drivers/bus/sunxi-rsb.c         | 2 +-
 drivers/bus/ti-pwmss.c          | 2 +-
 7 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 4352745a923c..7c57e7d2ff55 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -14,6 +14,7 @@
 #include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/ioport.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/limits.h>
 #include <linux/bitops.h>
diff --git a/drivers/bus/fsl-mc/fsl-mc-msi.c b/drivers/bus/fsl-mc/fsl-mc-msi.c
index f3f8af9426c9..82cd69f7884c 100644
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -7,8 +7,6 @@
  *
  */
 
-#include <linux/of_device.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 5b65a48f17e7..cdc4e38c113e 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -13,9 +13,9 @@
 #include <linux/logic_pio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/serial_8250.h>
 #include <linux/slab.h>
 
diff --git a/drivers/bus/omap_l3_smx.c b/drivers/bus/omap_l3_smx.c
index bb1606f5ce2d..9ba18c39c671 100644
--- a/drivers/bus/omap_l3_smx.c
+++ b/drivers/bus/omap_l3_smx.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include "omap_l3_smx.h"
 
diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 4da77ca7b75a..aafcc481de91 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -11,6 +11,8 @@
 
 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 2aefd5dde3c9..db0ed4e5d315 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -39,7 +39,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/bus/ti-pwmss.c b/drivers/bus/ti-pwmss.c
index e9c26c94251b..480a4de76cd4 100644
--- a/drivers/bus/ti-pwmss.c
+++ b/drivers/bus/ti-pwmss.c
@@ -10,7 +10,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/pm_runtime.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 
 static const struct of_device_id pwmss_of_match[] = {
 	{ .compatible	= "ti,am33xx-pwmss" },

-- 
2.40.1


