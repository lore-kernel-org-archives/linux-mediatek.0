Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E981BC04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NBmjDI7v8syBiUEey53NKp4RbWT97OZjeFgsdioYEs=; b=AjKaKHCSwfLi9jKpazb/nWvRzS
	h0lLplBcG+quWiFYVKrn6YMpZO2zYUM7sRKsoWSz3VNA4Y8jJF1DBolAH9G5jetH+/KP+nqbakScU
	QGGkqGauyphmemsPx6ULNgFUqhV81vIu93WG9JJKgEJPbodoJJJKQOZIXH1DkRsuL+opIlSFDHBSD
	+3UM7Zj9R13iZgWIGAzh075pCbsmwJgZuQwK4p+8L2JRp+2qz2TC2bIHyrfR4goEZJr3ofRJjxiaM
	Bmpnwa5KrPrw6D1wJuA0h2WzyGfO0zpLAorCBNbPfYB6lw5gRH913S1IYYwTnGqSrUTEbKZbCGZfX
	LHT03GLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2R-00B0Yb-0x;
	Thu, 03 Aug 2023 22:43:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2O-00B0Wf-0G;
	Thu, 03 Aug 2023 22:43:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C72D61EE2;
	Thu,  3 Aug 2023 22:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919CBC433CB;
	Thu,  3 Aug 2023 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102599;
	bh=yNac8cdh7PtNxa3/l8ZFB4AJ4haYPXAfmlYHjQUhMyA=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=RaX0FHM9a/B74jUpXgTPfn5AB+RGSZk3sHsd2XRrQB0REaPYRHh6yB9ixboPBa2cL
	 o3ol4eHhyvpMPQeWaiODSZs5faofafcJqr1hQ+HNhQogTt4wWyav+kTnqPFAAaCPDo
	 dt6rPoK5kHsU1CQ5DFUUPSXndOhHUcmT5e/HgXOhxr95jJPftHGyVI3Vllj0VMEz/b
	 oQC59TP/ATH2ja7bC7Zm7AxMEIMnKoXGUetaXQLDQ6H+cNCz4Jn1qn2K4CuxwKC/tB
	 rZTqDxVGrTldMhew5gXS0bJ83mtoKfqvd0Gdnh+7jqqzE06u9qltIoyMt/r6uOEXPt
	 cpg5b0zGeIHCQ==
Received: (nullmailer pid 3693762 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:46 -0600
Subject: [PATCH v2 06/23] ARM: hpe: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-6-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154320_203361_3FE6CE6F 
X-CRM114-Status: GOOD (  12.42  )
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

of_platform.h is not needed, so drop it.

Acked-by: Nick Hawkins <nick.hawkins@hpe.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-hpe/gxp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-hpe/gxp.c b/arch/arm/mach-hpe/gxp.c
index ef3341373006..581c8da517b8 100644
--- a/arch/arm/mach-hpe/gxp.c
+++ b/arch/arm/mach-hpe/gxp.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P. */
 
-#include <linux/of_platform.h>
 #include <asm/mach/arch.h>
 
 static const char * const gxp_board_dt_compat[] = {

-- 
2.40.1


