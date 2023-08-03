Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88C3C00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs4f2+DgmF92ciLqKorjZ0pdeq7Bs+mZBb05tKu1qE8=; b=0MuQNfqK5J72DS3sIILWhxOKk/
	w0R8Uph5mQkwutaVhLDyu7L+BO3W9TQd3lngVf1iqGj288UB3dL/bm4E47rZogWsEUhTAf9ZGhVtG
	4x8diJwT87mW4zhV6tPyFZaIxBC3y9+J2K6UNhDkzHGbWTB+Di3s+HP5WT2H7QgzR8N6BOQI/DEid
	FLzrg7jrg5+3n9K2HceynanYD6MQjI1VGx3cORkKM/OAFJ+1+Bkdau+WPIbOUgpdgmAcRTmX2+0En
	YiQHJyPiRzJEhqpjHJ71HlvAr1OKqzq+CkTuJY5LtK3Q5TXnwTzNUUGIRVg2oc9Hm7LVfXCqY/W9G
	wUpbb+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2X-00B0bo-0A;
	Thu, 03 Aug 2023 22:43:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2T-00B0Za-22;
	Thu, 03 Aug 2023 22:43:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EE5361EE6;
	Thu,  3 Aug 2023 22:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6A6C433C8;
	Thu,  3 Aug 2023 22:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102604;
	bh=LE/XDowk5+bfHcdcMZjUt4SjulJG+jSjBmEGWOHgvdM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=gR6XTCEi6ZqtGeLf13UlcSwHtVmKFOdhv9RNhk6vKtUc7NKo2S7v3znSiDsuIf1iu
	 vDApD3bRuVdhEzXCM/fnN7/AfJceYPsIH+XwMAPO9k9hfaNspqr1PfasJE0aHFl3jx
	 ahoMBHXD/P4VJLVAkKJwxYMzXocdujLO/5gI3MbzFtRlRKW9tcvlQfkMYGX/4hCzs2
	 ZDjC6NnmmLMrWmAeEiRWK8kof3SaubaLrL21a/UBv4X2BVM8zqB+S389fhBCbpfj1H
	 w4c7+cKuYBBVL8dXnLnz/h9bdwlDkeb+GE7iFWHLqks8yvSGcn/zMTt2AtIkSj/37l
	 RpBSa5mYH90NA==
Received: (nullmailer pid 3693776 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:53 -0600
Subject: [PATCH v2 13/23] ARM: versatile: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154325_754875_E030418D 
X-CRM114-Status: GOOD (  11.93  )
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
 arch/arm/mach-versatile/realview.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-versatile/realview.c b/arch/arm/mach-versatile/realview.c
index feab66080ba2..a3933e2373d5 100644
--- a/arch/arm/mach-versatile/realview.c
+++ b/arch/arm/mach-versatile/realview.c
@@ -4,9 +4,7 @@
  *
  * Author: Linus Walleij <linus.walleij@linaro.org>
  */
-#include <linux/of_platform.h>
 #include <asm/mach/arch.h>
-#include <asm/hardware/cache-l2x0.h>
 
 static const char *const realview_dt_platform_compat[] __initconst = {
 	"arm,realview-eb",

-- 
2.40.1


