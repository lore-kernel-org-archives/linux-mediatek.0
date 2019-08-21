From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next v2 0/3] net: dsa: mt7530: Convert to PHYLINK and add support for port 5
Date: Wed, 21 Aug 2019 16:45:44 +0200
Message-ID: <20190821144547.15113-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

1. net: dsa: mt7530: Convert to PHYLINK API
   This patch converts mt7530 to PHYLINK API.
2. dt-bindings: net: dsa: mt7530: Add support for port 5
3. net: dsa: mt7530: Add support for port 5
   These 2 patches adding support for port 5 of the switch.

v1->v2:
 * Mostly phylink improvements after review.
rfc -> v1:
 * Mostly phylink improvements after review.
 * Drop phy isolation patches. Adds no value for now.
René van Dorst (3):
  net: dsa: mt7530: Convert to PHYLINK API
  dt-bindings: net: dsa: mt7530: Add support for port 5
  net: dsa: mt7530: Add support for port 5

 .../devicetree/bindings/net/dsa/mt7530.txt    | 218 ++++++++++
 drivers/net/dsa/mt7530.c                      | 371 +++++++++++++++---
 drivers/net/dsa/mt7530.h                      |  61 ++-
 3 files changed, 577 insertions(+), 73 deletions(-)

-- 
2.20.1
