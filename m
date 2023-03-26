Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B254C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=haZ/N5nW5Plmc5DWgnjdDixWfP9wBSD924tPnZWCLZY=; b=m/P7h0N9ldfa5M
	SQ/3o7JvoqzofMEcrDCMVEuRt0+pGX3sW4fmQzKRCKoTQ1TY0X2u9xnxPkYFMgezylxKVKI8DQWXX
	lLu3rYB9qmYboBxqeEx3k6N89cmW7NGbGkcfFyKx44NS5w5t46Nx5CtHQ22NpZy7CrfCQIknX8S34
	8id7nmcJaLZJHy3VDkPVKQsVyAtWMbuV6ID+jdhM/pxsJ8SUHvF8IT9nzhWIVjeNHFQFff+FGiUdk
	yWyNTO/IL6oXl6FCwQMlbv5QmMl3CdIAcMp0b2/nVjR2PNFrwMujgpwxvpTL8/Oa+OTQvahHU0RVs
	vInpR74xiaAunsuLhyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR2w-008VUC-1Y;
	Sun, 26 Mar 2023 14:08:34 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR2q-008VSg-1H;
	Sun, 26 Mar 2023 14:08:30 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id x8so5068314qvr.9;
        Sun, 26 Mar 2023 07:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679839706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=haZ/N5nW5Plmc5DWgnjdDixWfP9wBSD924tPnZWCLZY=;
        b=KucRiVZKGuHD9i5gaGDTj2xSbZILOQZV1N1mWfqtpS1NCJ+27lQ1bokAIsc0qSTeo8
         7rX6aOdI0sIVLoK12RmCm54E3zEIbzmssCpIPNNdqhvIXfc23rzMt7cdNQi0DH1lyBly
         iKI4Bxrc5ViufogV6StNXc/+yfdHrRxruihgsczl5vWVzxOoH+tt0KSed1/8C71hpGyt
         Bhl4OrnRSWmsdnMxzK7F4phiRPDPzF9bl270sT5c5A2i79xpY97ZPP3oA+HJMNbGWonW
         mFMRISxOQd7j0YDu5EO2CX8UncmMDEOOHnFbtzbXGGeEqOrNZAMU2Pe/ZBlSipo8RWG0
         uJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679839706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haZ/N5nW5Plmc5DWgnjdDixWfP9wBSD924tPnZWCLZY=;
        b=xYdDS/5skTgP0K03hBGMTZqUY6jYbcth67TOt9IAGwuAwDUdHth5lsEOpzwk9vX5Sd
         95OFxUeeRb+fEQNp2Zv/zFoNegteakAw5xozp4eTYMTOGn8aRYiGFBvhfBXrKUstGuqG
         4cf6xi1eCVC7vvJ5WuAuiZBoP6uJl9myNu1IzUa4uQoF0iPuXA8+WRHY/v8yDxmd/rt4
         EnTQwghZnf6IvNS9FK5onkKY/pXvMwg50PaIMDdp0QpkFM+4wYrf+5wMAO5c8v/3PofU
         /MH7SxyWoRkXu3ln3grwad5JeJcDWDbWmTBgJPK2yuF8XNh5ZZ5y3QtGSHYWZ9RkvQpJ
         3Gxw==
X-Gm-Message-State: AAQBX9cuoY4PCSIr/ABJH1UofhxZV1rW1rG06v7aUtwIFiRsrfeRGEaN
	BxaCRRPs4tDZBGKthlvzM40=
X-Google-Smtp-Source: AKy350bsAu31m1Dw9Tw+BR6RPVUqj+HtnaIW2d12BTKz4OhkuFdQoyywrUpuMw4f4xe3sDYtwp3MVw==
X-Received: by 2002:ad4:5b82:0:b0:5b7:9d44:8dd8 with SMTP id 2-20020ad45b82000000b005b79d448dd8mr14559105qvp.20.1679839706435;
        Sun, 26 Mar 2023 07:08:26 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a0ce6a5000000b005dd8b93458esm2212220qvn.38.2023.03.26.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:08:26 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH 0/7] net: dsa: mt7530: fix port 5 phylink, phy muxing, and port 6
Date: Sun, 26 Mar 2023 17:08:11 +0300
Message-Id: <20230326140818.246575-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_070828_457708_1C1D9554 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: Landen Chao <landen.chao@mediatek.com>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, Russell King <rmk+kernel@armlinux.org.uk>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

This patch series is mainly focused on fixing the support for port 5 and
setting up port 6.

The only missing piece to properly support port 5 as a CPU port is the
fixes [0] [1] [2] from Richard.

Russell, looking forward to your review regarding phylink.

I have very thoroughly tested the patch series with every possible mode to
use. I'll let the name of the dtb files speak for themselves.

MT7621 Unielec:

only-gmac0-mt7621-unielec-u7621-06-16m.dtb
rgmii-only-gmac0-mt7621-unielec-u7621-06-16m.dtb
only-gmac1-mt7621-unielec-u7621-06-16m.dtb
gmac0-and-gmac1-mt7621-unielec-u7621-06-16m.dtb
phy0-muxing-mt7621-unielec-u7621-06-16m.dtb
phy4-muxing-mt7621-unielec-u7621-06-16m.dtb
port5-as-user-mt7621-unielec-u7621-06-16m.dtb

tftpboot 0x80008000 mips-uzImage.bin; tftpboot 0x83000000 mips-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000

MT7623 Bananapi:

only-gmac0-mt7623n-bananapi-bpi-r2.dtb
rgmii-only-gmac0-mt7623n-bananapi-bpi-r2.dtb
only-gmac1-mt7623n-bananapi-bpi-r2.dtb
gmac0-and-gmac1-mt7623n-bananapi-bpi-r2.dtb
phy0-muxing-mt7623n-bananapi-bpi-r2.dtb
phy4-muxing-mt7623n-bananapi-bpi-r2.dtb
port5-as-user-mt7623n-bananapi-bpi-r2.dtb

tftpboot 0x80008000 arm-uImage; tftpboot 0x83000000 arm-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000

Current CPU ports setup of MT7530:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt7530_pad_clk_setup() sets up port 6, rename to mt7530_setup_port6()

How it will be with the patch series:

mt7530_setup()
-> mt7530_setup_port5() runs if the port is not used as a CPU or user port

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

CPU ports setup of MT7531 for reference:

mt7531_setup()
-> mt753x_cpu_port_enable()
   -> mt7531_cpu_port_config()
      -> mt7531_mac_config()
         -> mt7531_rgmii_setup()
         -> mt7531_sgmii_setup_mode_an()
         -> etc.

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7531_mac_config()
      -> mt7531_rgmii_setup()
      -> mt7531_sgmii_setup_mode_an()
      -> etc.

[0] https://lore.kernel.org/netdev/20230212213949.672443-1-richard@routerhints.com/
[1] https://lore.kernel.org/netdev/20230212215152.673221-1-richard@routerhints.com/
[2] https://lore.kernel.org/netdev/20230212214027.672501-1-richard@routerhints.com/

Arınç

Arınç ÜNAL (7):
  net: dsa: mt7530: fix comments regarding port 5 and 6 for both switches
  net: dsa: mt7530: fix phylink for port 5 and fix port 5 modes
  net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
  net: dsa: mt7530: set both CPU port interfaces to PHY_INTERFACE_MODE_NA
  net: dsa: mt7530: set up port 5 before CPU ports are enabled
  net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
  net: dsa: mt7530: remove pad_setup function pointer

 drivers/net/dsa/mt7530.c | 154 +++++++++++++++++++-----------------------
 drivers/net/dsa/mt7530.h |   3 -
 2 files changed, 70 insertions(+), 87 deletions(-)



