Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7620C00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqngxPCxGpTVG6rTdnRm4L+LjamcmUYIxGqCdavid8w=; b=KTvO0ge3BP8PVpfSzO+LQN4tWa
	7/eb/wDXFLaQMaa5wTAOGq5w9f+RaRB/pxz1Wke1JxTWoShl77aQxcbdjRKaCYGHqHxslbxYBCMwF
	iPJs7lQGjvGI/hR/tWpEI7YnEI6G3XRMNk8y+8L2dEKuOW2BaXGbs9DgL4wGQGuyWK6o6pnIFb0Re
	+UbNrAsbrsulBp6nFATKv7c18GBJaqJ/lA5i/8PH7sabnfw/3VBTBAHF0J32f1OtzJt6tyv72F/Mc
	ChCIuN6ynblprBGsMAk773nNnbfXh8FVF6w1K2CRYO4WnckAck/meOrolLNJ86rDfpgHW7dLFR0YN
	MVrdo+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2G-00B0T7-29;
	Thu, 03 Aug 2023 22:43:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRh2D-00B0S3-0f;
	Thu, 03 Aug 2023 22:43:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8E5061EE8;
	Thu,  3 Aug 2023 22:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94961C433CB;
	Thu,  3 Aug 2023 22:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102587;
	bh=mkgjslj3UqmAoWtd2vZdQ4Vowszqgwhuroo4KSgo6cU=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=Ue2/2BrPWwdvX5MfXhdFS9TPQVdPVFovIcMhMAIpkiy9PxrUxe5Gthxa11lRkZ+Z/
	 suw/MuQ9R5AV/kKuCel2LV9T4MdZuDNplh3sUAVPg2VTydAw6905v3bv1OKlijDZYr
	 HzHwVUw9tG0gZXIjE5BiqPG9+D2Yd9MEVjuD4w6fqdMbvvZsklGNVsifqvRbivo+Fu
	 PXAAjC8+zKWONkBLNK8nSc5b/dXWsCKvXGAt5r7sk+WMRQA7H7s6/vuA7T31vekuuT
	 8bOzzUehhX7rM8bKEC9yFKOsBufla4IGaS8fMFt/wViKG/s32IdckqOrOrp2bu7x6B
	 MHedWr/MTf4MQ==
Received: (nullmailer pid 3693752 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 03 Aug 2023 16:42:41 -0600
Subject: [PATCH v2 01/23] ARM: l2x0: Add explicit includes for init and
 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-1-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_154309_330405_CDAADACC 
X-CRM114-Status: GOOD (  13.15  )
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

The cache-l2x0.h header uses u32 type and the __init and __iomem
attributes, so it should have explicit includes for those.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/include/asm/hardware/cache-l2x0.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/hardware/cache-l2x0.h b/arch/arm/include/asm/hardware/cache-l2x0.h
index a6d4ee86ba54..5a7ee70f561c 100644
--- a/arch/arm/include/asm/hardware/cache-l2x0.h
+++ b/arch/arm/include/asm/hardware/cache-l2x0.h
@@ -9,6 +9,8 @@
 #define __ASM_ARM_HARDWARE_L2X0_H
 
 #include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/types.h>
 
 #define L2X0_CACHE_ID			0x000
 #define L2X0_CACHE_TYPE			0x004

-- 
2.40.1


