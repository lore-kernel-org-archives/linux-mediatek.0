From: <sean.wang@mediatek.com>
Subject: [PATCH net-next v4 0/2] net: ethernet: mediatek: add enhancements to RX path
Date: Sat, 3 Sep 2016 00:56:45 +0800
Message-ID: <1472835407-17828-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, keyhaede@gmail.com, objelf@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Changes since v1:
- fix message typos and add coverletter
  
Changes since v2:
- split from the previous series for submitting add enhancements as 
a series targeting 'net-next' and add indents before comments.

Changes since v3:
- merge the patch using PDMA RX path
- fixed the input of mtk_poll_rx is with the remaining budget

Sean Wang (2):
  net: ethernet: mediatek: enhance RX path by reducing the frequency of
    the memory barrier used
  net: ethernet: mediatek: enhance RX path by aggregating more SKBs into
    NAPI

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

-- 
1.9.1
