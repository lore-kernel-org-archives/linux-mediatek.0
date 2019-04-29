From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [PATCH 0/5] MTK NAND driver improvements and fixes
Date: Mon, 29 Apr 2019 14:38:29 +0800
Message-ID: <20190429063834.45967-1-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hello Maintainers,

The following patch set is used to do MTK NAND driver improvements and
bug fixes, include:
* Fix low level time calculation of read/write cycle to meet tRC_min
  and tWC_min requirements.
* Refine RE# pulse width calculation and data sampling to improve read
  performance.
* Add CS validity check.
* Fix oob buffer pointer wrongly setting and empty page threshold setting.

Changes relative to:
--------------------

tree    : git://git.infradead.org/linux-mtd.git
branch  : master
commit  :
        'commit 3e35730dd754 ("mtd: powernv_flash: Fix device
         registration error")

Tests:
------

* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA by
  'dd' command.
* all drivers/mtd/tests/* pass.
* speed test:
  eraseblock write speed is 11087 KiB/s
  eraseblock read speed is 19986 KiB/s
  page write speed is 10689 KiB/s
  page read speed is 18724 KiB/s
  2 page write speed is 10611 KiB/s
  2 page read speed is 18713 KiB/s
  erase speed is 103696 KiB/s
  2x multi-block erase speed is 354248 KiB/s
  4x multi-block erase speed is 350459 KiB/s
  8x multi-block erase speed is 356173 KiB/s
  16x multi-block erase speed is 356173 KiB/s
  32x multi-block erase speed is 358120 KiB/s
  64x multi-block erase speed is 356173 KiB/s

Xiaolei Li (5):
  mtd: rawnand: mtk: Correct low level time calculation of r/w cycle
  mtd: rawnand: mtk: Improve data sampling timing for read cycle
  mtd: rawnand: mtk: Add validity check for CE# pin setting
  mtd: rawnand: mtk: Fix wrongly assigned oob buffer pointer issue
  mtd: rawnand: mtk: Setup empty page threshold correctly

 drivers/mtd/nand/raw/mtk_nand.c | 73 ++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 14 deletions(-)

--
2.18.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
