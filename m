Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE7C10F15
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xPDn9ftaTd7O1R4nxEKdgZMwuall1RokmgRU4aOGF4E=; b=luxAplOqyZRstuPLmXIY8TsiAv
	oU29FrjlDfGvncsiPckvZd67PZkr+KQLPbOoV8xwWzbs6JSikN6hVUADy7fREbobn+icbcmLp0F0E
	oACcx5mEl09t9R5iG4HOJWlHEczcyXg3lKjBnp/9ETb1qnabqjBsArub6oF8KypwmvlM9aE16pGEL
	2JOJR9FoLGhOFj22sYXvI0sG7zc+I73AX/SZCUlT/nNQkYePXct2porGIn4fW0oV4Y7DAnamukc+Q
	ApXhWyDl4J5fmnUnCLlFWiyZIthtNibdnY/Ql7anJCY1jdrogNedL3amALLzAps9NkDcLmxDyzb5t
	EeokHfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntu-0000000CNU8-0D7K;
	Mon, 22 Apr 2024 07:15:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntk-0000000CNLV-2ux2;
	Mon, 22 Apr 2024 07:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D28A060BBE;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F740C113CC;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770130;
	bh=OkQem37UFkm+naBU6dOLCvGqJr0v/6B1zyDYyO/59Io=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pLgRP28WrmA+DxPhinTN2Nw1fdqCD38wMNC3jKLCtUjibW9gmRb6hTvr5yGFLyRg/
	 mVY+sBRWaOvNR3XOqyyUTMCbn0PGbFTVj5tTiJNsJqu1cy3WSHILEAkQqHNKvKjT0t
	 hq1ZNW3vIaNGPpfnC+EZxea9PDDDd28qRhod5bsjubffucXq2zKEKgDTm1lQb365I0
	 MEzQETzux6Y1I8M3GFYQnA4GbWGTiG2rNMvcRXyUmMGX2S2v+VvurOi7a/Zgr2l6Pw
	 YrKJqsI/EFqqvPtrOTyeU6kLYFRVGUzzoogyPamdx8C3zNWK3wAMVDImPaV9Iy6vqV
	 FpV/AxGrteeRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56205C04FF6;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net-next v2 00/15] MT7530 DSA Subdriver Improvements Act IV
Date: Mon, 22 Apr 2024 10:15:07 +0300
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHwOJmYC/42NQQ7CIBBFr2Jm7RigYK0r72G6qDC1LIAGCKlpe
 neRE7h8efn/7ZAoWkpwP+0Qqdhkg68gzifQy+TfhNZUBsGEZJ1gOIeInrKnLaPLveoYWrfGUMi
 RzwklDkp2zHDFNFNQf9ZIs91a4wl1ir8tjNUsNuUQPy1eePOtI/nwR6dwZHg1NyX01A8vbh5Tt
 F4PFx0cjMdxfAFOhyVM3QAAAA==
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=3014;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=OkQem37UFkm+naBU6dOLCvGqJr0v/6B1zyDYyO/59Io=;
 b=9MmaS+fFq5bOkJ1WUPtdfyBhuq3bf+4Xwjsx33H3ewedjTSL+QdFU//91gtd2cT7lZPMlAJly
 XbC+Z2uDbVYB0KFu3N2a+U5tvrSrQ+zw4Mg4Ysqp4F+fKyfABIHQa5X
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001532_853219_533B203D 
X-CRM114-Status: UNSURE (   9.61  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

This is the forth patch series with the goal of simplifying the MT7530 DSA
subdriver and improving support for MT7530, MT7531, and the switch on the
MT7988 SoC.

I have done a simple ping test to confirm basic communication on all switch
ports on MCM and standalone MT7530, and MT7531 switch with this patch
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

This patch series finalises the patch series linked below.

https://lore.kernel.org/r/20230522121532.86610-1-arinc.unal@arinc9.com

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Changes in v2:
- Add two new patches to the end.
- Patch 13
  - Add the missing patch log.
- Link to v1: https://lore.kernel.org/r/20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com

---
Arınç ÜNAL (15):
      net: dsa: mt7530: disable EEE abilities on failure on MT7531 and MT7988
      net: dsa: mt7530: refactor MT7530_PMCR_P()
      net: dsa: mt7530: rename p5_intf_sel and use only for MT7530 switch
      net: dsa: mt7530: rename mt753x_bpdu_port_fw enum to mt753x_to_cpu_fw
      net: dsa: mt7530: refactor MT7530_MFC and MT7531_CFC, add MT7531_QRY_FFP
      net: dsa: mt7530: refactor MT7530_HWTRAP and MT7530_MHWTRAP
      net: dsa: mt7530: move MT753X_MTRAP operations for MT7530
      net: dsa: mt7530: return mt7530_setup_mdio & mt7531_setup_common on error
      net: dsa: mt7530: define MAC speed capabilities per switch model
      net: dsa: mt7530: get rid of function sanity check
      net: dsa: mt7530: refactor MT7530_PMEEECR_P()
      net: dsa: mt7530: get rid of mac_port_validate member of mt753x_info
      net: dsa: mt7530: use priv->ds->num_ports instead of MT7530_NUM_PORTS
      net: dsa: mt7530: do not pass port variable to mt7531_rgmii_setup()
      net: dsa: mt7530: explain exposing MDIO bus of MT7531AE better

 drivers/net/dsa/mt7530.c | 294 +++++++++++++++++++++++------------------------
 drivers/net/dsa/mt7530.h | 289 ++++++++++++++++++++++++----------------------
 2 files changed, 297 insertions(+), 286 deletions(-)
---
base-commit: e1bc03d8372ac081810c2956cd244ed9899f9a02
change-id: 20240320-for-netnext-mt7530-improvements-4-95430d150c05

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



