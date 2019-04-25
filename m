From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [RFC PATCH v2 0/1] Re-license MTK NAND driver
Date: Thu, 25 Apr 2019 09:55:51 +0800
Message-ID: <20190425015552.42638-1-xiaolei.li@mediatek.com>
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
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com, srv_heupstream@mediatek.com, yellowriver2010@hotmail.com, jorge.ramirez-ortiz@linaro.org, boris.brezillon@bootlin.com, linux-mtd@lists.infradead.org, yingjoe.chen@mediatek.com, rafal@milecki.pl, linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hello,

Currently, MTK NAND driver is licensed as GPL. And we would like to
modify and publish it in bootloader with MIT license. So, here we send
this RFC patch to solicit ACKs from MTK NAND driver authors and
contributors whether we can re-license MTK NAND driver as dual MIT/GPL.

Thanks and looking forward to your reply,
Xiaolei

Patch v2:
---------
- Add Ryder, Rafal, Wen in CC list.
- Introduce why we want to re-license MTK NAND driver.

Xiaolei Li (1):
  mtd: rawnand: mtk: Re-license MTK NAND driver as Dual MIT/GPL

 drivers/mtd/nand/raw/mtk_ecc.c  | 12 ++----------
 drivers/mtd/nand/raw/mtk_ecc.h  |  4 +---
 drivers/mtd/nand/raw/mtk_nand.c | 12 ++----------
 3 files changed, 5 insertions(+), 23 deletions(-)

--
2.18.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
