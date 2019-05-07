From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [PATCH v3 0/4] MTK NAND driver improvements and fixes
Date: Tue, 7 May 2019 18:25:37 +0800
Message-ID: <20190507102541.34341-1-xiaolei.li@mediatek.com>
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

The following patch set mainly contains:
* Fix low level time calculation of read/write cycle to meet tRC_min
  and tWC_min requirements.
* Refine RE# pulse width calculation and data sampling to improve read
  performance.
* Add CS validity check.
* Fix oob buffer pointer wrongly setting.

Changes on v3 relative to:
--------------------

tree    : https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/
branch  : nand/next
commit  :
        'commit 1c14fe2167ef ("mtd: nandsim: switch to exec_op interface")

Patch v3:
---------
- Fix some comment style.
- Format patch base branch: nand/next
- Pend to sent patch "mtd: rawnand: mtk: Setup empty page threshold
  correctly", because it seems that we should confirm this change has no
  side effect and need more test.

Patch v2:
---------
- Fix type
- Reference correct faulty patch
- Refine code to do calculation and condition in separate steps
- Fix empty threshold calculation

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

Xiaolei Li (4):
  mtd: rawnand: mtk: Correct low level time calculation of r/w cycle
  mtd: rawnand: mtk: Improve data sampling timing for read cycle
  mtd: rawnand: mtk: Add validity check for CE# pin setting
  mtd: rawnand: mtk: Fix wrongly assigned OOB buffer pointer issue

 drivers/mtd/nand/raw/mtk_nand.c | 84 +++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 14 deletions(-)

-- 
2.18.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
