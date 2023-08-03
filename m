Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEF5C00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPo/p1XmG1OCwGI4BCXSSb8Widrd/IENk0HimTieJLA=; b=tIJxEolsQk+o/Tfw4leV/D+MEB
	xbjBxPIunUAfgZBNUHNqani5w1BEi9EZbZKgVm/KQvmFNmpPJxsBEvrH6gYS1d6cO9X90zAH9WvyF
	mSuSP6lxGiMH+B15DY22B7zHqU+LUBNbRGe61r69tHOzP/hMwAxKM4I6+moLVEmU4SN03MDteVEN6
	KRCOOSr5d1wc8gzmmxAcw0CzJbqe0N6EmuHOMdbLZskSGUBHZNZaFSKuLRf/nVZLOrF0ddkbu3AdU
	v4RtZ7Ysm0CkraXM4ejs/zbQ/whANDn9uvtOt4M9AfelA8ey9D2ZGxmgv5r/6y9bQnIh+4QvVimtN
	5AM3iqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh39-00B0yr-28;
	Thu, 03 Aug 2023 22:44:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh35-00B0wc-0h;
	Thu, 03 Aug 2023 22:44:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD9DF61EE2;
	Thu,  3 Aug 2023 22:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE8CC433C8;
	Thu,  3 Aug 2023 22:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102642;
	bh=WIhhwPBWsSVEWvuibgSRJWQQ+7ePxMKcU52i8E7HOUE=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=hnbMtEGj8K8RlZ0uyw4bzB6NETX52HjRJzVPxDTPHYaeQWStJT6TdlYotVl+5T5T+
	 Kn3uWtxjPScXTt7s+6TrVzqYBt/BJNVVFBE499/uF8TLMqrS6Lc18fkGVHCpOybKI2
	 3kQyacpiJYgy92290PlCOUaugfclFl90o5whU3pRl2dd3njsh2yj0zR/E+NATv2vJ0
	 CHMENgY9ZFKQ95017r8qoFeeB6c+op/4kp2PhhikIwEoxQpjaDBa1iROqiyn0iVau5
	 QehjlkNPUZzymYi7lh8TIItjDSDJ1tDqu1U82beHB9jrrfO1TFWi7gD/03h/oBl8pa
	 Dt94mOtMhLvwA==
Received: (nullmailer pid 3693766 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:48 -0600
Subject: [PATCH v2 08/23] ARM: nomadik: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-8-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154403_336928_4A63C5B9 
X-CRM114-Status: GOOD (  12.25  )
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
 arch/arm/mach-nomadik/cpu-8815.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/mach-nomadik/cpu-8815.c b/arch/arm/mach-nomadik/cpu-8815.c
index 51f88a297c4e..0eed60917dcf 100644
--- a/arch/arm/mach-nomadik/cpu-8815.c
+++ b/arch/arm/mach-nomadik/cpu-8815.c
@@ -5,25 +5,12 @@
 
 #include <linux/types.h>
 #include <linux/init.h>
-#include <linux/device.h>
-#include <linux/amba/bus.h>
-#include <linux/platform_device.h>
 #include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/irq.h>
-#include <linux/dma-mapping.h>
-#include <linux/of_irq.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-#include <asm/mach/time.h>
 #include <asm/mach-types.h>
 
-#include <asm/cacheflush.h>
-#include <asm/hardware/cache-l2x0.h>
-
 /*
  * These are the only hard-coded address offsets we still have to use.
  */

-- 
2.40.1


