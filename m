From: Nelson Chang <nelson.chang@mediatek.com>
Subject: [PATCH net-next v2 0/3] net: ethernet: mediatek: add HW LRO functions
Date: Wed, 14 Sep 2016 13:58:56 +0800
Message-ID: <1473832739-4983-1-git-send-email-nelson.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net, f.fainelli@gmail.com
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com, Nelson Chang <nelson.chang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

The series add the large receive offload (LRO) functions by hardware and
the ethtool functions to configure RX flows of HW LRO.

changes since v2:
- Add ndo_fix_features to prevent NETIF_F_LRO off while RX flow is programmed
- Rephrase the dts property is a capability if the hardware supports LRO

changes since v1:
- Add HW LRO support
- Add ethtool hooks to set LRO RX flows

Nelson Chang (3):
  net: ethernet: mediatek: add HW LRO functions of PDMA RX rings
  net: ethernet: mediatek: add ethtool functions to configure RX flows
    of HW LRO
  net: ethernet: mediatek: add dts configuration to enable HW LRO

 .../devicetree/bindings/net/mediatek-net.txt       |   2 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c        | 433 +++++++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h        |  75 +++-
 3 files changed, 485 insertions(+), 25 deletions(-)

-- 
1.9.1
