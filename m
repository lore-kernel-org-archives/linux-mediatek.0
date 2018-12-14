From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 0/8] adding multiple CPU-Ports
Date: Fri, 14 Dec 2018 17:48:39 +0100
Message-ID: <20181214164847.4851-1-frank-w@public-files.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

some switch-chips have multiple CPU-Ports

this patch-series adds basic functionality and handle the 2
cpu-Ports of mt7530 on board BananaPi R2

changes to mtk-ethernet-driver are not included yet,
because here are still some issues with watchdog-timeouts

most patches are based on OpenWRT-Patches created by
John Crispin and only ported to DSA-Core 4.15+ with 2 main differences:
  - no change to platform-driver
  - option in dts is named "default_cpu" instead of only "cpu" to
    allow modification from userspace (additional patches needed)

complete source (including eth-patches) is uploaded here:
https://github.com/frank-w/BPI-R2-4.14/commits/4.20-gmac-test

new in v2:
  - added DTS-changes
  - added cover-letter
  - added change of dts-option (default_cpu)

currently posted not to full maintainers-list for first review,
will do it when patches are ready :)

Frank Wunderlich (8):
  net: dsa: adding fields for holding information about upstream-port
  net: dsa: add helper functions
  net: dsa: adding handling of second CPU-Port
  net: dsa: add support for GMAC2 wired to ext
  net: dsa: dsa multi cpu (mt7530.c)
  net: dsa: tell GDMA when we are turning on the special tag
  net: dsa: mt7530 add linking to mdio
  net: dsa: changes to dts

 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 29 +++++++++-
 drivers/net/dsa/mt7530.c                      | 55 +++++++++++++------
 drivers/net/dsa/mt7530.h                      |  4 ++
 include/net/dsa.h                             | 22 ++++++++
 net/dsa/dsa2.c                                | 36 ++++++++++++
 net/dsa/dsa_priv.h                            |  5 ++
 net/dsa/slave.c                               |  3 +-
 7 files changed, 135 insertions(+), 19 deletions(-)

-- 
2.17.1
