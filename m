Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31E8CCA47C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiBqIp0Uei0foUzBaUWHLORzLsEoXqLNweYtBe3Ap9c=; b=DYZJI8Dn7BE66SuIaQR7dKw2z2
	C3YsvRctDJy80YScFYEpY2LYBZTTUK/FontmcHfWNm+YhmRYZfSn7QdnQ8Py71ZsfKW6bvFAcd0Xx
	ijwZxJskdshKYxQbHGzCInH9pVTTJ9EltMqC6tPTt7I67D/oMO3Ao2BgfuvSbICsXEi8xG/08OU/v
	QGPfNZtDOc9kRIbu4WvtI19AswEMoxRfPb0Mn7wAOHGgtqKLVr0jHhloW5Oqop6odob2uVwyJ+uJf
	QNqGI/dhNxyahz+6/fjuhP99yG8/+x/P7MowBgrEjH0cRSqhHfIK5cDy7hZp2/h9/LgMSNX418qSS
	BRo8hGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XDs-00BzIo-PN; Wed, 29 Jun 2022 12:55:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XAi-00Bxh9-PQ; Wed, 29 Jun 2022 12:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BiBqIp0Uei0foUzBaUWHLORzLsEoXqLNweYtBe3Ap9c=; b=DeU7grXNcbB3LdAOVYyirqd8Aj
	wyM+KoKJVo+TjRyAVXixjOQqzwwdxFxRgSiKp7NyCGFfwfjXrwhStI6QGmQtOIy3Pw+cW8v80qteP
	msEOouU0YDaA0IQZChGbWlbkk3xUYHhlID3cpVMpKXVGjWL0/NRE+tj6tZdl+asSOy9It0azZ5QBx
	sYt+HBuQeNToNbCZEQj8wpj3np6+sqgfyf8l5TRLndiuy+GGs8tK3UTsj35t8r9yKRszXmhhm/0rP
	KBLA8rpIqSq8Q6RchklsSYvObdgQMWflcuUlgTY6BRKURW94Hn9xy3qHmRlidg2eObjL/bLqzuHVD
	xlT/HHWQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35720 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o6XAb-000386-AQ; Wed, 29 Jun 2022 13:51:49 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o6XAa-004pW8-IP; Wed, 29 Jun 2022 13:51:48 +0100
In-Reply-To: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Alvin __ipraga" <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: [PATCH RFC net-next 6/6] net: phylink: debug print
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o6XAa-004pW8-IP@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Jun 2022 13:51:48 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055156_871757_415B39E0 
X-CRM114-Status: UNSURE (   8.31  )
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

---
 drivers/net/phy/phylink.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 23be3f041705..bd493280c8af 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1378,6 +1378,13 @@ int phylink_set_max_fixed_link(struct phylink *pl)
 	if (pl->cfg_link_an_mode != MLO_AN_PHY || pl->phydev || pl->sfp_bus)
 		return -EBUSY;
 
+	phylink_info(pl, "sif=%*pbl if=%d(%s) cap=%lx\n",
+		     (int)PHY_INTERFACE_MODE_MAX,
+		     pl->config->supported_interfaces,
+		     pl->link_interface,
+		     phy_modes(pl->link_interface),
+		     pl->config->mac_capabilities);
+
 	interface = pl->link_interface;
 	if (interface != PHY_INTERFACE_MODE_NA) {
 		/* Get the speed/duplex capabilities and reduce according to the
-- 
2.30.2


