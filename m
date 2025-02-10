Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1117C02198
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 00:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fLvJ11pq2luhZ2EoJ0wFr3uwdrdhzrBxKgUUrpzIuiM=; b=hEu1tRMAUt3Q2Rh4sz2hbcfHqr
	p8q68yBF9WwC0hiET2laHOL3DOkjwLhpm0YJISTGAsnQ7oQgJBbWPH7DJJ136gAkvtLbIhYXEb0Zr
	Z7PKhNfELtI2MSU6cEAcmMMNrSNUoxCK2rWhgpyaq1kGeOxSqVO7EsH8MRUuRCndtF9Hj93Z+tdzd
	oIzoj/A009OWtvOpJdK4I2l7Sa5F/6RHV9ntCuX5TeguD9bP03csoxSjNImQESWqAp7pNZ1XTcmW4
	bYwzSgM/7sOu67LLR9FkwEC98qTlp74iOEYefPNgcNaQMphBnmSg02HyuNgqLBrNpPvXaQD8gq9fy
	FEc7gXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1the62-00000001yJ8-2G5M;
	Tue, 11 Feb 2025 00:25:50 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcw8-00000001nms-15kF
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Feb 2025 23:11:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1thcvn-000000000gQ-0fDk;
	Mon, 10 Feb 2025 23:11:11 +0000
Date: Mon, 10 Feb 2025 23:11:07 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Chad Monroe <chad.monroe@adtran.com>,
	John Crispin <john@phrozen.org>, maxime.chevallier@bootlin.com,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org
Subject: upstream Linux support for Ethernet combo ports via external mux
Message-ID: <Z6qHi1bQZEnYUDp7@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_151132_296237_80FAF51F 
X-CRM114-Status: GOOD (  10.79  )
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

Hi,

Looking for ways to support a passive SerDes mux in vanilla Linux I
found Maxime's slides "Multi-port and Multi-PHY Ethernet interfaces"[1].

The case I want to support is probably quite common nowadays but isn't
covered there nor implemented in Linux.

 +----------------------------+
 |            SoC             |
 |    +-----------------+     |
 |    |       MAC       |     |
 |    +----+-------+----+     |
 |         |  PCS  |   +------+
 |         +---=---+   | GPIO |
 +-------------=-------+---=--+
              |            |
           +---=---+       |
           |  Mux  <-------+
           +-=---=-+
             |   |
            /     \
     +-----=-+   +-=-----+
     |  PHY  |   |  SFP  |
     +-------+   +-------+

So other than it was when SoCs didn't have built-in PCSs, now the SFP is
not connected to the PHY, but there is an additional mux IC controlled
by the SoC to connect the serialized MII either to the PHY (in case no
SFP is inserted) or to the SFP (in case a module is inserted).

MediaTek came up with a vendor-specific solution[2] for that which works
well -- but obviously it would be much nicer to have generic, vendor-
agnostic support for such setups in phylink, ideally based on the
existing gpio-mux driver.

So I imagine something like a generic phylink-mux, controlled by hooking
to the module_insert and module_remove remove SFP ops (assuming the
moddef0 signal is connected...).

Before I get my hands dirty, please join my line of thought for one
moment, so we can agree on a sketch:

Does everyone agree that phylink would be the right place to do this?

DT bindings could look like this (option A):
 ...
    mux: mux-controller {
        compatible = "gpio-mux";
        #mux-control-cells = <0>;

        mux-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
    };

    mux0: mii-mux {
        compatible = "mii-mux";
        mux-controls = <&mux>;
        #address-cells = <1>;
        #size-cells = <0>;

        channel@0 {
            reg = <0>;
            sfp = <&sfp0>;
            managed = "in-band-status";
            module-presence-controls-mux;
        };

        channel@1 {
            reg = <1>;
            phy-handle = <&phy0>;
            phy-connection-type = "sgmii";
        };
    };
  };

  soc {
      ethernet@12340000 {
          mii-mux = <&mux0>;
      };
  };
    

or like this (option B):
 ...
    mux: mux-controller {
        compatible = "gpio-mux";
        #mux-control-cells = <0>;

        mux-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
    };
  };

  soc {
      ethernet@12340000 {
          sfp = <&sfp0>;
          phy = <&phy0>;
          phy-connection-type = "sgmii";
          mux-controls = <&mux>;
      };
  };


Obviously option A is more expressive, but also more complex, and I'm
not 100% sure if all that complexity is really needed in practise.
However, for "better safe than sorry" reasons I'd opt for option A,
unless anyone comes up with a better idea.

Let me know what you think.


Cheers


Daniel


[1]: https://netdevconf.org/0x17/docs/netdev-0x17-paper2-talk-slides/multi-port-multi-phy-interfaces.pdf
[2]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/autobuild/unified/global/24.10/files/target/linux/mediatek/patches-6.6/999-2708-net-ethernet-mtk_eth_soc-support-ethernet-passive-mu.patch

