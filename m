Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E928CCFA18
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R4v0T/jYSK8ngu6ACLcnRSLuWsTH7J+YbIQLDPezMxs=; b=IUL5nJNJBZ3jcm9h/9AOj8+Jgz
	6KkoDhDbAjzHNGV4QcGa1E8TSIe/tu/gMTqKMQM1ucFumEN+f3chmWA6+bZe3ZfS8FFNhGGKNIXrh
	FNXVobdtdD6svBZ95ZCOEqvURaxkmy+MqT2JkoaLIvPzsSH4Vyy9L86HT0D8oNiziLrfSFIlRhaNE
	RNaw7K+rLBJVi5+VzhKkK+s2o4jlryAeCWWfMkmDWQo5pMcc5dthNSI2ppRPgrxHQeNVfqMg+7+3c
	DE1aVm5gB2M1oIL1fP0y001DbOUuM7lay4WGvnXY0c4ufyLveKvMw2XtdyNZ27G0ml3cvJ/7q0w9q
	ClF1DWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjTU-00000006kWS-2tEY;
	Tue, 11 Nov 2025 08:11:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjTR-00000006kV8-31cN;
	Tue, 11 Nov 2025 08:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R4v0T/jYSK8ngu6ACLcnRSLuWsTH7J+YbIQLDPezMxs=; b=qffcZfWRYLgsyXDoZnCmSC8DaU
	gLwEBczqur0L6JTHiMf48sWjyW0H7eFBsRltMRz++iQ//Xdp0wUkR5VIp8x8vPvonpfTVG+eLCPMX
	YV0C9bY3IK6t96L2RxpbtfnBOsuewGiT6Tdd0r+2waJVlr41Vi5WNh1Ui+pimwqySOoQmQK17yBsB
	eVqyNX4p4hqKECB1FcGHpDyL58e7ROLnJV3WqwJRCS9PKX9D93ghM4lb7nAw2kftfgF3BrDYCzIOy
	8prMLIDMiG78wImay5usyazruInKjFh1npzjmZZPzwysllPwmoUjaUdikR6Wwd9dT7hhWwVDtPtYm
	HqhbGfUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41674)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vIjTL-00000000295-1GyZ;
	Tue, 11 Nov 2025 08:11:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vIjTJ-000000002nI-1GLe;
	Tue, 11 Nov 2025 08:11:25 +0000
Date: Tue, 11 Nov 2025 08:11:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 00/13] net: stmmac: convert glue drivers to use
 stmmac_get_phy_intf_sel()
Message-ID: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001133_774878_02A1B45C 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

This series converts the remaining glue drivers that support
multi-interface to use stmmac_get_phy_intf_sel(). The reason these
drivers are not converted to the set_phy_intf_sel() method is
because it is unclear whether there are ordering dependencies that
would prevent it.

For example, reading the stm32mp2 documentation, it is required to
set the ETH1_SEL field while the dwmac core is in reset and before
clocks are enabled. This requirement can not be satsified at the
moment (but could with further changes.)

v2:
- sending meson8b seperately
- updated a number of commit descriptions: PHY_INTF_SEL_xxx ->
  PHY_INTF_SEL_x, added note where GMII no longer errors out.

 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  | 18 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 77 ++++++++--------------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 24 ++-----
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 44 +++++++------
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   | 26 ++------
 5 files changed, 70 insertions(+), 119 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

