Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8083AC7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZeDI311N25D2A16M5re0Q7xgAELliPvBaFuTaxPmmPI=; b=BPWtjT+1SZh5is4gVTgyVKfrec
	yR3sMPkCyE2yugZIiGD4KYiZd0tkJvvaZHtMoCVvniiwNiEtyuUGVDQ0L7XS8AEVr0mV+4LIgsO8B
	eZfNBUE3WkHKHV2hIfx25mP+TzGyPLuZl/Oqsr9Rg7j1U99cpWMOKe4LSBoryCnw8cUfp7zCaA4G6
	s9xwXNs333/DzeeXLkyPiAFi8CduLvgEevFi5KvVTfBTv6j7P7zSMvqnTQkOq/EtfMUlhgUNa0kIm
	PtvPwDFReWNaDJLRlVxuPMeGyiH3O31y3sgrqemKXA9qDa3Wvzv6kkUlQW8ffp6iBgw/Jrxrt9pgb
	mPGq+Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px71a-008zal-1d;
	Thu, 11 May 2023 14:12:06 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px71T-008zUp-14;
	Thu, 11 May 2023 14:12:04 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1px71J-0000mD-0V;
	Thu, 11 May 2023 14:11:49 +0000
Date: Thu, 11 May 2023 16:09:54 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Simon Horman <simon.horman@corigine.com>
Subject: [PATCH net-next v4 0/2] net: phy: add driver for MediaTek SoC
 built-in GE PHYs
Message-ID: <cover.1683813687.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_071159_377137_889CB366 
X-CRM114-Status: GOOD (  11.45  )
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

Some of MediaTek's Filogic SoCs come with built-in gigabit Ethernet
PHYs which require calibration data from the SoC's efuse.
Despite the similar design the driver doesn't share any code with the
existing mediatek-ge.c, so add support for these PHYs by introducing a
new driver for only MediaTek's ARM64 SoCs.

As the PHYs integrated in the MT7988 SoC require reading the polarity
of the LEDs from the SoCs's boottrap also add dt-binding for that.

All LEDs are for now setup with default values, a follow up patch which
allows custom LED setups will be sent after the PHY LED framework is
more in shape.

Changes since v3:
 * fix spelling and reverse xmas tree
 * add dt-binding for mediatek,boottrap

Changes since v2:
 * remove everything related to PHY LEDs for now, LED support will
   be cleaned up and submitted once PHY LED framework is more ready

Changes since v1:
 * split-off SoC-specific driver from mediatek-ge.c as requested
 * address comments made by Heiner Kallweit
 * add pinctrl handling for PHY LED
 * remove calibration details not needed in production hardware

Daniel Golle (2):
  dt-bindings: arm: mediatek: add mediatek,boottrap binding
  net: phy: add driver for MediaTek SoC built-in GE PHYs

 .../arm/mediatek/mediatek,boottrap.yaml       |   37 +
 MAINTAINERS                                   |    9 +
 drivers/net/phy/Kconfig                       |   12 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/mediatek-ge-soc.c             | 1264 +++++++++++++++++
 drivers/net/phy/mediatek-ge.c                 |    3 +-
 6 files changed, 1325 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml
 create mode 100644 drivers/net/phy/mediatek-ge-soc.c


base-commit: 285b2a46953cecea207c53f7c6a7a76c9bbab303
-- 
2.40.0


