Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E68C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiI3YyVCMFXftJf0W5Ev9nEaPYQlV/GKDtAL3CGxoZc=; b=JSdl8ImvSTZWOHMLGBN2rC28iB
	gU26b2IkhM1bMnW7kIF7RBpLHZz07qIU6JOBBssYSBdn+5+deZpZFf5y5/uJjA5DFGf7dnevspwX/
	U95c3tJHaH+/4ew/4ye0YpwFj/SAnRKli+c8cq0ZxncK0PJytiQQSc6a53MBsPVslETNWz75MUfGG
	lwZIQGlWvDnw7wgprUoQ4IsTnAH+tgPmAov4WnnldS8BZfgI1CpWCA+QMqTMqVY5g79wdqkJbF4f7
	Awf0LncsFA2j4GvOpqF/clIDZPNhlSgeq++G2Wd++mP1qqpVu8UdXqqtl8+04q3KX18KUFzfRlxe+
	teHVIpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px4l2-008g0F-01;
	Thu, 11 May 2023 11:46:52 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4ky-008fzM-0G;
	Thu, 11 May 2023 11:46:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1px4ks-0008OX-25;
	Thu, 11 May 2023 11:46:42 +0000
Date: Thu, 11 May 2023 13:44:48 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 0/8] Improvements for RealTek 2.5G Ethernet PHYs
Message-ID: <ZFzVMHCTMeiTB4T1@pidgin.makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <018df89a-c3d2-1bda-9966-7f06b24f87f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <018df89a-c3d2-1bda-9966-7f06b24f87f2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_044648_114755_08089E4E 
X-CRM114-Status: GOOD (  14.65  )
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

On Thu, May 11, 2023 at 07:29:21AM +0200, Heiner Kallweit wrote:
> On 11.05.2023 00:53, Daniel Golle wrote:
> > Improve support for RealTek 2.5G Ethernet PHYs (RTL822x series).
> > The PHYs can operate with Clause-22 and Clause-45 MDIO.
> > [...]
> 
> Has this series been tested with RTL8125A/B to ensure that the internal
> PHY use case still works?

The series has been present in OpenWrt for a while now and initially
contained a bug which broke the RTL8221 PCIe RealTek NICs. It has since been
resolved and re-tested, and it seems all fine:

https://github.com/openwrt/openwrt/commit/998b9731577dedc7747dcfa412e4543dabaaa131#r110201620

I assume that quite some OpenWrt users may use RTL8125B PCIe NICs, but I
have asked in the OpenWrt forum for testing results including this series:

https://forum.openwrt.org/t/nanopi-r6s-kernel-6-1-intergration/154677/3?u=daniel

As the r8169 driver is not using phylink and uses C22 to connect to the
PHY the main difference which will affect these devices is that
genphy_soft_reset will be called as a result of
r8169_hw_phy_config->phy_init_hw->(phydrv).soft_reset

Also note the r8169 driver always sets the interface mode to either
PHY_INTERFACE_MODE_GMII or PHY_INTERFACE_MODE_MII in
r8169_phy_connect() before calling phy_connect_direct(). While this is
certainly not technically correct for the 2.5G NICs in the strict sense,
it does have the desired effect that the newly introduced function
rtl8221b_config_init() just returns without making any changes.


