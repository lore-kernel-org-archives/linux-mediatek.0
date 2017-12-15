From: <sean.wang@mediatek.com>
Subject: [PATCH v3 net-next 0/3] add VLAN support to DSA MT7530
Date: Fri, 15 Dec 2017 12:46:59 +0800
Message-ID: <cover.1513312600.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Changes sicne v2:
update to the latest code base from net-next and fix up all building
errors with -Werror.

Changes since v1:
- fix up the typo
- prefer ordering declarations longest to shortest
- update that vlan_prepare callback should not change any state
- use lower case letter for function naming

The patchset extends DSA MT7530 to VLAN support through filling required
callbacks in patch 1 and merging the special tag with VLAN tag in patch 2
for allowing that the hardware can handle these packets with VID from the
CPU port.

Sean Wang (3):
  net: dsa: mediatek: add VLAN support for MT7530
  net: dsa: mediatek: combine MediaTek tag with VLAN tag
  net: dsa: mediatek: update MAINTAINERS entry with MediaTek switch
    driver

 MAINTAINERS              |   7 ++
 drivers/net/dsa/mt7530.c | 288 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/net/dsa/mt7530.h |  83 +++++++++++++-
 net/dsa/tag_mtk.c        |  38 +++++--
 4 files changed, 400 insertions(+), 16 deletions(-)

-- 
2.7.4
