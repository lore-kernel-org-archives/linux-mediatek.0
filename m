Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C072C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iqUD70VzcyYlY5BxqwY1iE/pyhBwtZ4AsMYJqUHH9VI=; b=nnX6gpJ+CKjiCxbeIJZ29veF+S
	2VK9ERPS/0cEUaxsNWXEgoQiF+hcX9XnUiIGeTKaZ7JUcgBc4+xZxo1H0zIOB+Y1Vc6Hpeizy3UgK
	Q7B2PI6q7K9wBOfUDKmmg0mVbXvVTe2uV68bvL0GMvaQE5SdB21gmPwehnsrhjkANAN1tQlTQQDSv
	LPdWYHI8DJDsCHxtRPJ6Ig96ZgB3yI/6NG1znUfe7RzKR9TNDz74EDgv+I8jJH+H2F2GSZMn9VCl0
	1oHxvKn/asTNInruuJxSUYd6TQgMyqHJrwjwdx3t1bHlsUbMURcb8Lc297rEXJvlNYpkPW/MKHa2D
	ZwEYi0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6X9I-00BwzE-6m; Wed, 29 Jun 2022 12:50:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6X94-00Bwto-Pk; Wed, 29 Jun 2022 12:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iqUD70VzcyYlY5BxqwY1iE/pyhBwtZ4AsMYJqUHH9VI=; b=JzGt96ETVLhbBFMBkdiQEmUmbC
	ltPCR08T2aS4h3dDRs/kEavEqy945gNSsG19RBONrJfR5VT7Hc+pz4TEuvBpknQEAeQomCYvK8UOh
	AKH5CcDT7qQnieRKjs1iDQzepoRzzNRwfBy2ztnKWqbmGDvkC2bn0kc3Jiu5F6Mh/csWoMdo8dKfy
	zRiyR4kZsqzZ6ORLUjW8Iw2T7KQOHtiGFHIYFv+htjPNKKvbyXBHq67F/zdXuEY8iI26B8VoQDvJb
	vWFKodr3cieWa99tbtDKw9VqXukKkUw/Gohb/Z+0xfkWsENky2fBh2Vb2R6MQVDOCx+42mprPcZzS
	UoBkWPHA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33094)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o6X8r-00035m-Ae; Wed, 29 Jun 2022 13:50:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o6X8o-0005rZ-0h; Wed, 29 Jun 2022 13:49:58 +0100
Date: Wed, 29 Jun 2022 13:49:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH RFC net-next 0/6] net: dsa: always use phylink
Message-ID: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055014_879382_20383008 
X-CRM114-Status: GOOD (  39.22  )
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

Mostly the same as the previous RFC, except:

1) incldues the phylink_validate_mask_caps() function
2) has Marek's idea of searching the supported_interfaces bitmap for the
   fastest interface we can use
3) includes a final patch to add a print which will be useful to hear
   from people testing it.

Some of the questions from the original RFC remain though, so I've
included that text below. I'm guessing as they remain unanswered that
no one has any opinions on them?

 drivers/net/dsa/b53/b53_common.c       |   3 +-
 drivers/net/dsa/bcm_sf2.c              |   3 +-
 drivers/net/dsa/hirschmann/hellcreek.c |   3 +-
 drivers/net/dsa/lantiq_gswip.c         |   6 +-
 drivers/net/dsa/microchip/ksz_common.c |   3 +-
 drivers/net/dsa/mt7530.c               |   3 +-
 drivers/net/dsa/mv88e6xxx/chip.c       |  53 ++++--------
 drivers/net/dsa/ocelot/felix.c         |   3 +-
 drivers/net/dsa/qca/ar9331.c           |   3 +-
 drivers/net/dsa/qca8k.c                |   3 +-
 drivers/net/dsa/realtek/rtl8365mb.c    |   3 +-
 drivers/net/dsa/sja1105/sja1105_main.c |   3 +-
 drivers/net/dsa/xrs700x/xrs700x.c      |   3 +-
 drivers/net/phy/phylink.c              | 148 ++++++++++++++++++++++++++++++---
 include/linux/phylink.h                |   5 ++
 include/net/dsa.h                      |   3 +-
 net/dsa/port.c                         |  47 +++++++----
 17 files changed, 215 insertions(+), 80 deletions(-)

On Fri, Jun 24, 2022 at 12:41:26PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Currently, the core DSA code conditionally uses phylink for CPU and DSA
> ports depending on whether the firmware specifies a fixed-link or a PHY.
> If either of these are specified, then phylink is used for these ports,
> otherwise phylink is not, and we rely on the DSA drivers to "do the
> right thing". However, this detail is not mentioned in the DT binding,
> but Andrew has said that this behaviour has always something that DSA
> wants.
> 
> mv88e6xxx has had support for this for a long time with its "SPEED_MAX"
> thing, which I recently reworked to make use of the mac_capabilities in
> preparation to solving this more fully.
> 
> This series is an experiment to solve this properly, and it does this
> in two steps.
> 
> The first step consists of the first two patches. Phylink needs to
> know the PHY interface mode that is being used so it can (a) pass the
> right mode into the MAC/PCS etc and (b) know the properties of the
> link and therefore which speeds can be supported across it.
> 
> In order to achieve this, the DSA phylink_get_caps() method has an
> extra argument added to it so that DSA drivers can report the
> interface mode that they will be using for this port back to the core
> DSA code, thereby allowing phylink to be initialised with the correct
> interface mode.
> 
> Note that this can only be used for CPU and DSA ports as "user" ports
> need a different behaviour - they rely on getting the interface mode
> from phylib, which will only happen if phylink is initialised with
> PHY_INTERFACE_MODE_NA. Unfortunately, changing this behaviour is likely
> to cause widespread regressions.
> 
> Obvious questions:
> 1. Should phylink_get_caps() be augmented in this way, or should it be
>    a separate method?
> 
> 2. DSA has traditionally used "interface mode for the maximum supported
>    speed on this port" where the interface mode is programmable (via
>    its internal port_max_speed_mode() method) but this is only present
>    for a few of the sub-drivers. Is reporting the current interface
>    mode correct where this method is not implemented?
> 
> The second step is to introduce a function that allows phylink to be
> reconfigured after creation time to operate at max-speed fixed-link
> mode for the PHY interface mode, also using the MAC capabilities to
> determine the speed and duplex mode we should be using.
> 
> Obvious questions:
> 1. Should we be allowing half-duplex for this?
> 2. If we do allow half-duplex, should we prefer fastest speed over
>    duplex setting, or should we prefer fastest full-duplex speed
>    over any half-duplex?
> 3. How do we sanely switch DSA from its current behaviour to always
>    using phylink for these ports without breakage - this is the
>    difficult one, because it's not obvious which drivers have been
>    coded to either work around this quirk of the DSA implementation.
>    For example, if we start forcing the link down before calling
>    dsa_port_phylink_create(), and we then fail to set max-fixed-link,
>    then the CPU/DSA port is going to fail, and we're going to have
>    lots of regressions.
> 
> Please look at the patches and make suggestions on how we can proceed
> to clean up this quirk of DSA.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

