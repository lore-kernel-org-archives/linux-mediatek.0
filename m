Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAB7C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3UHdwuLPhXMunD6/Q87hv9DQ5vVyKhuoTXpWSJ50hAQ=; b=3mtcW2b1g6nHOjxQ9TaHrbx+GV
	ZsCS1C3EUxXG60Tmf5usag8pE+4yDI2dJzxanSPkgax8B9Wcw3VRgduwnCBthO9zU3CfBdpcI9xNx
	UD/BGPftQK/b6xHbldYFVltp5LywGk6ZVlI7hu3KsQbEjGvxfiL8SPL68+ktwQHlohqUWf8rIhA+x
	B9FL01/OAIG84FWT3/A9B9F/4O9y6z5foRpA1GpmoUDopBCb+XI6dR/w8gc2q5+Xl9fG7KnhJL/lr
	BmAzupL8o7bH6ipUt5Sb/ycY8R+dc1B2i9ZZv//l3TU3r4wxx6t/o7ioQ3Crn4+ZbOyMDI/Lf0sKC
	eJEwU8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUoR-0053s0-Oh; Thu, 19 Jan 2023 13:18:39 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUe8-004zhL-PL; Thu, 19 Jan 2023 13:08:07 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D398E1693;
	Thu, 19 Jan 2023 14:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674133678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3UHdwuLPhXMunD6/Q87hv9DQ5vVyKhuoTXpWSJ50hAQ=;
	b=Yoyi9wo7/ZF287RuEL0Zgg/52fWFCovu59p10HaO7ExZWnSijGhagfN7KX0DoxF7oYxDSq
	M+KCaMyotjb4vR1ipKfm0jZurv/qtSEeHn3k2MBmoup4fqN7hyPZF0NL3kH3ZXnukz1I8Z
	zuOvBNd71Cwf9CpB0RuMm29LzZ9N4+CehbSluy0+PEndsy5dUvRG5kEczhVyBu+fC9Gcz6
	2rq2ExxRuOwclB7aNgylEVQylsdVw/oTTHc93iE33XwEfPJNC6soVVFuSt32RV9PQnLZds
	r5bbOdfF/JkFya9dsUK2HmYbukHd31JOGdpt8jrhfUYuhG8Thkf7gNUpgviUJQ==
From: Michael Walle <michael@walle.cc>
To: Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wells Lu <wellslutw@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Tobias Waldekranz <tobias@waldekranz.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH RESEND net-next 0/4] net: mdio: Remove support for building C45 muxed addresses
Date: Thu, 19 Jan 2023 14:06:56 +0100
Message-Id: <20230119130700.440601-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_050801_193976_AEC48F97 
X-CRM114-Status: UNSURE (   8.43  )
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

[Russell told me that his mailserver rejected my mail because of
an ill-formated "To:" header. Resending now with plain git-send-email
instead of b4 send.]

I've picked this older series from Andrew up and rebased it onto
the latest net-next.

With all drivers which support c45 now being converted to a seperate c22
and c45 access op, we can now remove the old MII_ADDR_C45 flag.

Andrew Lunn (3):
  net: phy: Remove fallback to old C45 method
  net: Remove C45 check in C22 only MDIO bus drivers
  net: mdio: Remove support for building C45 muxed addresses

Michael Walle (1):
  net: ngbe: Drop mdiobus_c45_regad()

 drivers/net/dsa/microchip/ksz_common.c         |  6 ------
 drivers/net/dsa/rzn1_a5psw.c                   |  6 ------
 drivers/net/dsa/sja1105/sja1105_mdio.c         |  6 ------
 drivers/net/ethernet/actions/owl-emac.c        |  6 ------
 drivers/net/ethernet/engleder/tsnep_main.c     |  6 ------
 drivers/net/ethernet/marvell/mvmdio.c          |  6 ------
 drivers/net/ethernet/mediatek/mtk_star_emac.c  |  6 ------
 .../mellanox/mlxbf_gige/mlxbf_gige_mdio.c      |  6 ------
 drivers/net/ethernet/sunplus/spl2sw_mdio.c     |  6 ------
 drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c  |  4 ++--
 drivers/net/mdio/mdio-i2c.c                    |  6 ------
 drivers/net/mdio/mdio-ipq8064.c                |  8 --------
 drivers/net/mdio/mdio-mscc-miim.c              |  6 ------
 drivers/net/mdio/mdio-mvusb.c                  |  6 ------
 drivers/net/phy/mdio_bus.c                     | 10 ++--------
 include/linux/mdio.h                           | 18 ------------------
 16 files changed, 4 insertions(+), 108 deletions(-)

-- 
2.30.2


