Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC91C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5/88H9mfRgjcVnmISK5fAXBcFgmECik3mBeqjzcEMg=; b=b0QV6RjOe5XCM/sQO0ifOinqKp
	0FEvbimmPXj1cJFh72OdD37YFRhVq9w0zMnBBwxkhjI5kXkTL3EB/EYjW2W42Z7pVgYNHds7AICAr
	CJYtbQAOULRnHfe7i0Y42BPdXTFnkpEAwku/s/fx6y8bNeR52pu76q0EJ3GdP6U92uKGRR7jrYXj8
	Oek9Sa01Ubedh62mXAfAvM+BshkMi0TNeMuXuSADIxg6CGCoqBWD30snIQVQuGcKrUWlS1fMfoZZs
	91OL2oqUnK+wLU1UPBhpSLZZ3Am/vdg6P8Rqi2J9WwKXfOB1vi3nHG6Q8x8aoHbfcHR/Mm8NK8wHb
	FMNnEE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh4C-00B1Yq-32;
	Thu, 03 Aug 2023 22:45:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh49-00B1WU-0C;
	Thu, 03 Aug 2023 22:45:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77AD161EE5;
	Thu,  3 Aug 2023 22:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143CFC433CA;
	Thu,  3 Aug 2023 22:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102707;
	bh=NT9YjnWH+Cx3vzUXB7dFBR+8AivvvTmdQI2irFqFSF8=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=mB451M39Ashetm0D2ehUMWIGPk5UaKYJ8jgtChtIsODki9cY+YECM7ad8WOMqlr1R
	 nbpnVLRijCoWa4PwWfe7hqS0/RLiHGoindq0QgcoRbF9hHTCqlbGf2a2RTiJUFYlIA
	 RFUNldoDPJ0irEQzfiK5jAh7O5Fi3YCjXCxR8CvaFdi6VYiZVcpUse1U4trP6q093Z
	 S92gPcV3phUcrVEnq0MyBW0Zdq4WZH/flx7sgcGRwdJssrCeRf3zu0bXGZh2ieTv/U
	 8TJ2PtAqEUTuL/ouQ9JHuGOAGqSzUvRYWO5SofJXW5NgnUNd6iaReDf2YD6uB9IIqv
	 gxgzBdElgT0zg==
Received: (nullmailer pid 3693786 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:58 -0600
Subject: [PATCH v2 18/23] soc: aspeed: Explicitly include correct DT
 includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-18-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154509_189490_668C6D44 
X-CRM114-Status: GOOD (  15.02  )
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
 drivers/soc/aspeed/aspeed-lpc-snoop.c    | 1 -
 drivers/soc/aspeed/aspeed-p2a-ctrl.c     | 2 +-
 drivers/soc/aspeed/aspeed-uart-routing.c | 3 +--
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index eceeaf8dfbeb..773dbcbc03a6 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -19,7 +19,6 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/regmap.h>
diff --git a/drivers/soc/aspeed/aspeed-p2a-ctrl.c b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
index 20b5fb2a207c..548f44da28a9 100644
--- a/drivers/soc/aspeed/aspeed-p2a-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
@@ -18,8 +18,8 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
index 59123e1f27ac..3a4c1f28cb34 100644
--- a/drivers/soc/aspeed/aspeed-uart-routing.c
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -5,8 +5,7 @@
  */
 #include <linux/device.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>

-- 
2.40.1


