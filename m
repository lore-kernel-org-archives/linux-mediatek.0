From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH net 0/5] of_get_mac_address fixes
Date: Fri, 10 May 2019 11:35:13 +0200
Message-ID: <1557480918-9627-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

this patch series is hopefuly the last series of the fixes which are related
to the introduction of NVMEM support into of_get_mac_address.

First patch is removing `nvmem-mac-address` property which was wrong idea as
I've allocated the property with devm_kzalloc and then added it to DT, so then
2 entities would be refcounting the allocation.  So if the driver unbinds, the
buffer is freed, but DT code would be still referencing that memory.

Second patch fixes some unwanted references to the Linux API in the DT
bindings documentation.

Patches 3-5 should hopefully make compilers and thus kbuild test robot happy.

Cheers,

Petr

Petr Štetiar (5):
  of_net: remove nvmem-mac-address property
  dt-bindings: doc: net: remove Linux API references
  powerpc: tsi108: fix similar warning reported by kbuild test robot
  net: ethernet: fix similar warning reported by kbuild test robot
  net: wireless: mt76: fix similar warning reported by kbuild test robot

 .../devicetree/bindings/net/keystone-netcp.txt     |  6 ++---
 .../bindings/net/wireless/mediatek,mt76.txt        |  4 +--
 arch/powerpc/sysdev/tsi108_dev.c                   |  3 ++-
 drivers/net/ethernet/allwinner/sun4i-emac.c        |  2 +-
 drivers/net/ethernet/arc/emac_main.c               |  2 +-
 drivers/net/ethernet/cavium/octeon/octeon_mgmt.c   |  2 +-
 drivers/net/ethernet/davicom/dm9000.c              |  2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c       |  2 +-
 drivers/net/ethernet/freescale/fman/mac.c          |  2 +-
 .../net/ethernet/freescale/fs_enet/fs_enet-main.c  |  2 +-
 drivers/net/ethernet/freescale/gianfar.c           |  2 +-
 drivers/net/ethernet/freescale/ucc_geth.c          |  2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c         |  2 +-
 drivers/net/ethernet/marvell/mvneta.c              |  2 +-
 drivers/net/ethernet/marvell/sky2.c                |  2 +-
 drivers/net/ethernet/micrel/ks8851.c               |  2 +-
 drivers/net/ethernet/micrel/ks8851_mll.c           |  2 +-
 drivers/net/ethernet/nxp/lpc_eth.c                 |  2 +-
 drivers/net/ethernet/renesas/sh_eth.c              |  2 +-
 drivers/net/ethernet/ti/cpsw.c                     |  2 +-
 drivers/net/ethernet/xilinx/ll_temac_main.c        |  2 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c      |  2 +-
 drivers/net/wireless/mediatek/mt76/eeprom.c        |  2 +-
 drivers/of/of_net.c                                | 29 +++++-----------------
 24 files changed, 33 insertions(+), 49 deletions(-)

-- 
1.9.1
