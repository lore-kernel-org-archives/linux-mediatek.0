Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B69DC7EE24
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 22:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXvHmYkYhWOmDfgz0ITycoUiB5vRzGmeujegcN0emew=; b=3IcafF12G/zV8nWpPtnLIxjMgd
	Ng5/4oE2fGKxsTzuiH9bv/vtRd4qVCsNiUwptI9dEmHD05iBFVLUSObQvwjTzDiSuYV9AtYx9j3Hr
	kUCamF1kR3tsFGqcnZFxFO5DLLR8CHcPU6UwXoEz3IV/CZWI9CnrEIlUdo2/FxrmDhyfZiw7fHfGq
	B+IpFn3zh0+qX2imogKaFXBIdp3Lx0kt75O+cxDP+ShdFIpOJPxNj5kEmvojXmUvMkjpZVXS3+aBx
	e9z1kIc7m6HtxBXjN0ZKV2/4ac6Gu2QJ38hx3vI0z0UXRAwlgEmLV497JYr5PK9XkmAL2nTdCAdRo
	Cjqw5Lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsiP-007BPM-0z;
	Wed, 10 May 2023 22:55:21 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsiM-007BOk-01;
	Wed, 10 May 2023 22:55:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwsiJ-0004P1-27;
	Wed, 10 May 2023 22:55:15 +0000
Date: Thu, 11 May 2023 00:53:22 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next 0/8] Improvements for RealTek 2.5G Ethernet PHYs
Message-ID: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_155518_043682_A1B032C7 
X-CRM114-Status: GOOD (  10.69  )
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

Improve support for RealTek 2.5G Ethernet PHYs (RTL822x series).
The PHYs can operate with Clause-22 and Clause-45 MDIO.

When using Clause-45 it is desireable to avoid rate-adapter mode and
rather have the MAC interface mode follow the PHY speed. The PHYs
support 2500Base-X for 2500M, and Cisco SGMII for 1000M/100M/10M.

Also prepare support for proprietary RealTek HiSGMII mode which will
be needed for situations when used with RealTek switch or router SoCs
such as RTL839x or RTL93xx.

Add support for Link Down Power Saving Mode (ALDPS) which is already
supported for older RTL821x series 1GbE PHYs.

Make sure that link-partner advertised modes are only used if the
advertisement can be considered valid. Otherwise we are seeing
false-positives warning about downscaling eventhough higher speeds
are not actually advertised by the link partner.

While at it, use helper function for paged operation and make sure
to use use locking for that as well.

Changes since RFC:
 * Turns out paged read used to identify the PHY needs to be hardcoded
   for the simple reason that the function pointers for paged operations
   have not yet been populated at this point. Hence keep open-coding it,
   but use helper function and make sure it happening while the MDIO bus
   mutex is locked.

Alexander Couzens (1):
  net: phy: realtek: rtl8221: allow to configure SERDES mode

Chukun Pan (1):
  net: phy: realtek: switch interface mode for RTL822x series

Daniel Golle (6):
  net: phy: realtek: use genphy_soft_reset for 2.5G PHYs
  net: phy: realtek: disable SGMII in-band AN for 2.5G PHYs
  net: phy: realtek: make sure paged read is protected by mutex
  net: phy: realtek: use inline functions for 10GbE advertisement
  net: phy: realtek: check validity of 10GbE link-partner advertisement
  net: phy: realtek: setup ALDPS on RTL8221B

 drivers/net/phy/realtek.c | 161 ++++++++++++++++++++++++++++++++------
 1 file changed, 138 insertions(+), 23 deletions(-)

-- 
2.40.0


