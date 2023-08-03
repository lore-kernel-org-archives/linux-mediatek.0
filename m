Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73087C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aopncrH7Q78ywyYkPSwHJ58QYKVAlKIzzdmkBf4uZ8=; b=Uj7E58KiulOcWybE8K235zmVR6
	wEYJ7JOC6CLjaJk+S8oVgbe0u0mA4xl5xEgd8c7CtkthhkhWzOqxgECr5JeAZpp6TnLWm9WTBTb2/
	k/XWhYcrEPxrqvLQQg1MnnnLpquqc6tZ4PtxQk5Jeb+GZ5M7ulhHZHgAFDu/PP67N9RHHLBRX5XCR
	ot/yT1ivsCddVa0Qhmz9MknQUKakstrpAr3cfS8fWGr6T+VY806Ir4OTuG4uh/xEetKPhw6WEQKhD
	/zaaHneZniGdTh86QLBnypjKyDH2HNDiJw0p/uGNxpbGYpzC/psSeSKIsRBaC8iUseJzN55XESgNZ
	u1yp6CZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2i-00B0iN-26;
	Thu, 03 Aug 2023 22:43:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2e-00B0g6-1W;
	Thu, 03 Aug 2023 22:43:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2A0261EEF;
	Thu,  3 Aug 2023 22:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E4CC433C8;
	Thu,  3 Aug 2023 22:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102615;
	bh=kctz/l+HgXckSr6lVdAzsQHOS1XESSmOihgpTHJWf9g=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=T6mNtFCyRS5oK0vEok38vwwn5WIkSnHOxfrlW2LiTFvlyzPOGs6vpCggN3ekIMaMM
	 X1dJXxrYrRLIaxKyROcB1BxGvZfu4np/or/T8E1ydIuxLNG6jftYrr8voPz4BBP6lf
	 D+uQSa+QH8pYFHLiZGeKKxYKG8nZWJ1kT6vBbCDDCP4pn1A99AjoGVKQ22TyO+Ko6l
	 C3RLceVqm3X96S75wWVZpXyNiFSt36SlCcvr8s4MHB6/je5fCWzMDplUy4V7obTOFY
	 5SACrSQMk7BltBiWPXo8+AMt2mOXgT9v+S7XJkz1pWjBDSNxhEr0DzbkBqHpWPlKSy
	 qgIM2TSKlG1pw==
Received: (nullmailer pid 3693770 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:50 -0600
Subject: [PATCH v2 10/23] ARM: nspire: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-10-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154336_601928_19D76FE9 
X-CRM114-Status: GOOD (  11.83  )
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

Several includes are not needed, so drop them. io.h was implicitly included
and is needed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-nspire/nspire.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/mach-nspire/nspire.c b/arch/arm/mach-nspire/nspire.c
index 2d4abb0288b9..d20974a9fbc1 100644
--- a/arch/arm/mach-nspire/nspire.c
+++ b/arch/arm/mach-nspire/nspire.c
@@ -5,17 +5,10 @@
  *	Copyright (C) 2013 Daniel Tang <tangrs@tangrs.id.au>
  */
 #include <linux/init.h>
-#include <linux/of_irq.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
-#include <linux/irqchip.h>
-#include <linux/irqchip/arm-vic.h>
-#include <linux/clkdev.h>
-#include <linux/amba/bus.h>
+#include <linux/io.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
-#include <asm/mach/map.h>
 
 #include "mmio.h"
 

-- 
2.40.1


