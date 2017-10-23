From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [PATCH v1 0/2] Improve MTK ECC Engine driver
Date: Mon, 23 Oct 2017 16:21:35 +0800
Message-ID: <1508746897-62291-1-git-send-email-xiaolei.li@mediatek.com>
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
To: boris.brezillon@free-electrons.com, computersforpeace@gmail.com
Cc: srv_heupstream@mediatek.com, linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com, dwmw2@infradead.org, rogercc.lin@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch-set is mainly to improve MTK ECC Engine driver, include
- remove dummy ECC IRQ disable setting
- fix infinite ECC decode IRQ issue

Changes relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
        'commit 1f3df4dc088d927683b292118cd8b4eaaf1af573
        Author: Sascha Hauer <s.hauer@pengutronix.de>
        Date:   Mon Oct 16 11:51:55 2017 +0200'

Tests:
------

* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
  by 'dd' command.
* all drivers/mtd/tests/* pass.

Xiaolei Li (2):
  mtd: nand: mtk: do not disable ECC IRQ in the function mtk_ecc_disable
  mtd: nand: mtk: fix infinite ECC decode IRQ issue

 drivers/mtd/nand/mtk_ecc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--
1.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
