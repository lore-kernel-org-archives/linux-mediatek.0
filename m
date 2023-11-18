Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54532C5AE5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N9SnKBhRbqMMe69FRrrc0XQvADn9TWKV4HfE5CZaJv8=; b=Y/tKT/TJZXHHZQ
	ByntwC7yfWdkziI+fFmmVTh+PqJzWfDzciItUY4VmizvtZ0ZLkL1f8VskpryfLWplQoqGvKj//lbm
	audzCQpC5YZvRFB9iZzHGOwfjQ74y/q4VJGYeRLiHyfD16ygfLSk8nwNuTX1fuFrRp8mBJ32an2zZ
	qrB4ZVBYiGppobMIz2d51ubnMMMd/eV4bqPsxBSS+EJGDnlGobu7O0SghVpVu069xDf49t1TGsQif
	3yIHCD6jvsf6aJ5p/JJVH2acyKNHhi8mBiBfTue6nvO5LhzawlFeelyLIyqTyLvq0m2KJg9LBYYLY
	ivEQ7VU3Jo4B9rf1I3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVV-008SYp-00;
	Sat, 18 Nov 2023 12:33:05 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVR-008SWr-0P;
	Sat, 18 Nov 2023 12:33:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D73B7E0002;
	Sat, 18 Nov 2023 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700310775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N9SnKBhRbqMMe69FRrrc0XQvADn9TWKV4HfE5CZaJv8=;
	b=ADIhRVuCtojr4MU4BCbgFoLcpOPsIIaqb20ar7ExCA4jhWVPamIORfy2L1zxem9FbywtlJ
	bEqEiqre949ZvSFkK6S5/YBeky5/MiMx3Uk/caW87xYJnfhAGshXnCm5r7klJsn9BcO+7+
	kDM3scZBplSsOfh1n8DpF93rWAvi2z3wEcNgFfi1iDBc6nrNjmOGS/FAMwlfuFJK0kF0+n
	C3ImHe82Tt33MDwRWSBkFQsgsVv8ICY4BYj+yA4nmyNDZsVNSahlDrARFf9Uu5sGTCa0BH
	NHeenjzyfVEdMdUByx4taLvR1MJ/2hDf7KIniDa0WqnV13DxYB8eSxuNS44QyA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 00/15] MT7530 DSA subdriver improvements
Date: Sat, 18 Nov 2023 15:31:50 +0300
Message-Id: <20231118123205.266819-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_043301_483088_E1EF0FDA 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

This patch series simplifies the MT7530 DSA subdriver and improves the
logic of the support for MT7530, MT7531, and the switch on the MT7988 SoC.

I have done a simple ping test to confirm basic communication on all switch
ports on the MCM and standalone MT7530 and MT7531 switch with this patch
series applied.

MT7621 Unielec, MCM MT7530:

rgmii-only-gmac0-mt7621-unielec-u7621-06-16m.dtb
gmac0-and-gmac1-mt7621-unielec-u7621-06-16m.dtb

tftpboot 0x80008000 mips-uzImage.bin; tftpboot 0x83000000 mips-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000

MT7622 Bananapi, MT7531:

gmac0-and-gmac1-mt7622-bananapi-bpi-r64.dtb

tftpboot 0x40000000 arm64-Image; tftpboot 0x45000000 arm64-rootfs.cpio.uboot; tftpboot 0x4a000000 $dtb; booti 0x40000000 0x45000000 0x4a000000

MT7623 Bananapi, standalone MT7530:

rgmii-only-gmac0-mt7623n-bananapi-bpi-r2.dtb
gmac0-and-gmac1-mt7623n-bananapi-bpi-r2.dtb

tftpboot 0x80008000 arm-zImage; tftpboot 0x83000000 arm-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootz 0x80008000 0x83000000 0x83f00000

This patch series is the continuation of the one linked below.

https://lore.kernel.org/netdev/20230522121532.86610-1-arinc.unal@arinc9.com/

Arınç

Arınç ÜNAL (15):
  net: dsa: mt7530: always trap frames to active CPU port on MT7530
  net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
  net: dsa: mt7530: store port 5 SGMII capability of MT7531
  net: dsa: mt7530: improve comments regarding port 5 and 6
  net: dsa: mt7530: improve code path for setting up port 5
  net: dsa: mt7530: do not set priv->p5_interface on mt7530_setup_port5()
  net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
  net: dsa: mt7530: empty default case on mt7530_setup_port5()
  net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
  net: dsa: mt7530: remove pad_setup function pointer
  net: dsa: mt7530: move XTAL check to mt7530_setup()
  net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
  net: dsa: mt7530: simplify mt7530_setup_port6() and change to void
  net: dsa: mt7530: correct port capabilities of MT7988
  net: dsa: mt7530: do not clear config->supported_interfaces

 drivers/net/dsa/mt7530-mdio.c |   7 +-
 drivers/net/dsa/mt7530.c      | 283 ++++++++++++++++---------------------
 drivers/net/dsa/mt7530.h      |  19 +--
 3 files changed, 137 insertions(+), 172 deletions(-)



