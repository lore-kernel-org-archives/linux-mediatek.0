From: gerg@kernel.org
Subject: [PATCHv4 0/3]: net: dsa: mt7530: support MT7530 in the MT7621 SoC
Date: Wed, 30 Jan 2019 11:24:03 +1000
Message-ID: <20190130012406.28271-1-gerg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, bjorn@mork.no, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org
Cc: rene@vdorst.com, john@phrozen.org, neil@brown.name
List-Id: linux-mediatek@lists.infradead.org


This is the fourth version of a patch series supporting the MT7530 switch
as used in the MediaTek MT7621 SoC. Unlike the MediaTek MT7623 the MT7621
is built around a dual core MIPS CPU architecture. But inside it uses
basically the same 7530 switch.

This series resolves all issues I had with previous versions, and I can
now reliably use the driver on a 7621 SoC platform. These patches were
generated against linux-5.0-rc4.

The first patch enables support for the existing kernel mediatek ethernet
driver on the MT7621 SoC. This support is from Bjørn Mork, with an update
and fix by me. Using this driver fixed a number of problems I had
(TX checksums, large RX packet drop) over the staging driver
(drivers/staging/mt7621-eth).

Patch 2 modifies the mt7530 DSA driver to support the 7530 switch as
implemented in the Mediatek MT7621 SoC. The last patch updates the
devicetree bindings to reflect the new support in the mt7530 driver.

There is no real dependencies between the patches, so they can be taken
independantly.

Creating a new binding for the MT7621 seems like the only viable approach
to distinguish between a stand alone 7530 switch, the silicon module
in the MT7623 SoC and the silicon in the MT7621. Certainly the 7530 ID
register in the MT7623 and MT7621 returns the same value, "0x7530001".

Looking at the mt7530.c DSA driver it might make some sense to convert
the existing "mediatek,mcm" binding to something like "mediatek,mt7623"
to be consistent with this new MT7621 support. As far as I can tell
this is the intention of this binding.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt |    6 -
 drivers/net/dsa/mt7530.c                             |   96 +++++++++++--------
 drivers/net/dsa/mt7530.h                             |    9 +
 drivers/net/ethernet/mediatek/Kconfig                |    2 
 drivers/net/ethernet/mediatek/mtk_eth_soc.c          |   48 ++++++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h          |    4 
 6 files changed, 117 insertions(+), 48 deletions(-)

v1: initial patch series
v2: rebase to linux-5.0-rc2
    include mediatek ethernet driver changes
    use devicetree binding to identify platform
v3: dropped mediatek ethernet driver auto negotiate patch
    change devicetree binding text as per feedback
    rebase onto 5.0-rc3
v4: simplify by using of_device_get_match_data()
    fix casting for 7530/7621 ID to be 32 and 64 bit clean
    add review-by tag
    rebase onto 5.0-rc4
