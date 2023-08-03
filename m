Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E783AC00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEmOlCZ5jmQRJhFhSQz6cZywsNPj1rIZa1cohVGkMUg=; b=JVtyXCyg4zvPNvhRg/YD/cmoWV
	v5iRHnor/PMJoFVTpz37IXCV2+t+AvHwNB9+uUnYYdqPZmaGMHMn+hyCUm9CBQ5yvOCWuxofRwdGY
	NEXgb/ctbpCAMjUrPZM3akU+SG2OF93BKRRKN/ZlXFShCCfwNebDv0PxF8rJnr4FxxWLm7CqXlPk/
	Rvw672Q7CJrosDvlA5psCBPXppACeTgRcqrXv+E9QcqzTyjxjmzg+14FclyEQBSqXnfRmWTRIbOzO
	tBlNsIn95x8Oxeq188Zo4PVSk+RiF8IGDgX4YUVh1XqU8WBDhFRvvloXbBxeAFXicyrj8YYqu9nc+
	B4qUQ+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh3q-00B1L9-0d;
	Thu, 03 Aug 2023 22:44:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh3l-00B1In-2K;
	Thu, 03 Aug 2023 22:44:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30ED761EDD;
	Thu,  3 Aug 2023 22:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDB6C433C8;
	Thu,  3 Aug 2023 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102684;
	bh=brmdhvzyvAA0agZSGAy0sXXc2XvdgvNnDJ7I2JsnpoA=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=CiOJmAJ+wHXAE1D+uCR/CBPk7eSgbn1doh2vYQk83ymXIOgUMOfbIAbV36PI0TBHe
	 JPDNW9iVLRmpjrql7lg/RRybjAYXycBN9495J706CBGZa5NPeMjRxMsoxvazihy9J6
	 R/nEirHQkIE3QXZj7a//eRnClC/C0RDrS+0rKbN82x/bv3NDWoqQN59BushkbXT+NQ
	 Kx7idYtBcAb4kQ7aIZBgmLjZDsL/k9pI7zc6AOUiAIsB4M6DbkTWh2ePGfJi2iol7Z
	 IW6E6p1CMOiNqQbfiW+7nLqo5BzVRQ57vBOJbdcND0pJsrGGOlfieAOZhQxI3PlXzG
	 P3dE4OoTarXIQ==
Received: (nullmailer pid 3693764 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:47 -0600
Subject: [PATCH v2 07/23] ARM: mmp: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-7-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154445_843001_9DD2A9A7 
X-CRM114-Status: GOOD (  12.20  )
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

Several includes are not needed, so drop them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-mmp/mmp-dt.c  | 3 ---
 arch/arm/mach-mmp/mmp2-dt.c | 4 ----
 arch/arm/mach-mmp/mmp3.c    | 4 ----
 3 files changed, 11 deletions(-)

diff --git a/arch/arm/mach-mmp/mmp-dt.c b/arch/arm/mach-mmp/mmp-dt.c
index 3f43c0867dca..8479996a8f2e 100644
--- a/arch/arm/mach-mmp/mmp-dt.c
+++ b/arch/arm/mach-mmp/mmp-dt.c
@@ -6,12 +6,9 @@
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
  */
 
-#include <linux/irqchip.h>
-#include <linux/of_platform.h>
 #include <linux/of_clk.h>
 #include <linux/clocksource.h>
 #include <asm/mach/arch.h>
-#include <asm/mach/time.h>
 #include <asm/hardware/cache-tauros2.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-mmp/mmp2-dt.c b/arch/arm/mach-mmp/mmp2-dt.c
index 34a5fe4b3949..e5ddc327651b 100644
--- a/arch/arm/mach-mmp/mmp2-dt.c
+++ b/arch/arm/mach-mmp/mmp2-dt.c
@@ -6,13 +6,9 @@
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
  */
 
-#include <linux/io.h>
-#include <linux/irqchip.h>
-#include <linux/of_platform.h>
 #include <linux/of_clk.h>
 #include <linux/clocksource.h>
 #include <asm/mach/arch.h>
-#include <asm/mach/time.h>
 #include <asm/hardware/cache-tauros2.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-mmp/mmp3.c b/arch/arm/mach-mmp/mmp3.c
index b0e86964f302..073a4ee219cb 100644
--- a/arch/arm/mach-mmp/mmp3.c
+++ b/arch/arm/mach-mmp/mmp3.c
@@ -5,10 +5,6 @@
  *  Copyright (C) 2019 Lubomir Rintel <lkundrak@v3.sk>
  */
 
-#include <linux/io.h>
-#include <linux/irqchip.h>
-#include <linux/of_platform.h>
-#include <linux/clk-provider.h>
 #include <asm/mach/arch.h>
 #include <asm/hardware/cache-l2x0.h>
 

-- 
2.40.1


