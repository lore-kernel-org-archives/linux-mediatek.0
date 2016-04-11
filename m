From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/2] MTK Smart Device Gen1 NAND Driver
Date: Mon, 11 Apr 2016 12:56:10 -0400
Message-ID: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Fixes/Changes on v3 relative to: 
--------------------------------

  tree		: https://github.com/bbrezillon/linux-0day
  branch	: nand/ecclayout
  commit	:
 		'commit "mtd: kill the nand_ecclayout struct"'
		 Author: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
		 Date:	Thu Feb 4 10:16:18 2016 +0100
		
  Patch v3:
  --------
  mtd: mediatek: device tree docs for MTK Smart Device Gen1 NAND
	- rename nandc (nand controller)

  mtd: mediatek: driver for MTK Smart Device Gen1 NAND
 	- rename source and header files
	- register definitions move to source files
	- ecc interface dropped
	- blank lines between functions (checkpatch.pl doesn't catch them)
	- ecc_check function renamed ecc_get_stats
	- ecc->dev assigned during probe()
	- generic ecc control function replaced by individual functions
	- required ecc parameters passed in ecc specific structures
	- fix memory corruption (size 0 array)
	- clarify nand offset/ptr function helpers (naming corrected)
	- move ecc config call to select_chip()
	- comment on hw issue workaround during read_byte
	- implement write_buf
	- remove switch_oob
	- fix suspend/resume operation
	- make nand-ecc-mode mandatory in device tree 

  RFC v2:
  -------
 
  mtd: mediatek: device tree docs for MTK Smart Device Gen1 NAND
	- split nand flash interface and ecc engine

  mtd: mediatek: driver for MTK Smart Device Gen1 NAND
	- split host and ecc in two separate drivers.
	- expose ecc layout through mtd_ooblayout_ops.
	- fix wait loops.
	- use device tree to describe ecc strength and ecc size.
	- use device tree to describe CS.
	- replace cmdfunc with cmd_ctrl.
	- fix read byte interface.

  dont enable controller in mt2701.dtsi
	- requires additional device tree changes. This will be done in
	  the near future.

Overview:
=========

The following patch-set adds support for Mediatek's Smart Device
Gen1 NAND controller.

The MTK controller generates ECC parity data for both the sector data
and the 8B FDM data associated to that sector.


* Controller expected layout:
-----------------------------

The controller expects the OOB information relevant to each sector
within the page to follow immediately the data field.

For example for a 4KiB page with 1KiB sectors and 224B of OOB information,
the controller would expect the following layout.

-----------------------------------------------------
| 1KiB | 56B | 1KiB | 56B | 1KiB | 56B | 1KiB | 56B |
-----------------------------------------------------

This implies that the following actions are required:

- raw writes:
  to match the controller expected layout, the driver uses the CPU and
  a private bounce buffer to reassemble the page before the actual
  writes.
  
- non raw writes:
  ecc is hardware generated and data DMA'd in a single transfer.
  
  the driver uses the CPU to copy the OOB information for each sector
  to its associated FDM register (4B FDM_L, 4B FDM_H) before
  initiating the DMA.


* Bad block mark position:
--------------------------

The bad block mark position is generated at some offset within the
sector data area.

Similarly, when marking a block as bad, the driver will fill the whole
page with 0x00 (it would be meaningless for this controller to write
the watermark to the OOB area).


Controller limitations:
=======================

 * dma chaning not supported:

	To guarantee that the pages corresponding to the buffers are contiguous
	in memory we enabled NAND_USE_BOUNCE_BUFFER.

Tests:
======

* UBIFS support has been validated on 512MiB device (iozone, dd)
* All drivers/mtd/tests/* pass clean.
* Speed tests:

	- eraseblock write speed		: 7451 KiB/s
	- eraseblock read speed 		: 10817 KiB/s
	- page write speed 			: 7250 KiB/s
	- page read speed 			: 10792 KiB/s
	- 2 page write speed 			: 7350 KiB/s
	- 2 page read speed			: 10802 KiB/s
	- erase speed				: 105215 KiB/s
	- 2x multi-block erase speed 		: 354728 KiB/s
	- 4x multi-block erase speed		: 356658 KiB/s
	- 8x multi-block erase speed		: 357631 KiB/s
	- 16x multi-block erase speed		: 358365 KiB/s
	- 32x multi-block erase speed		: 358365 KiB/s
	- 64x multi-block erase speed		: 358610 KiB/s


Jorge Ramirez-Ortiz (2):
  mtd: mediatek: device tree docs for MTK Smart Device Gen1 NAND
  mtd: mediatek: driver for MTK Smart Device Gen1 NAND

 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  145 +++
 drivers/mtd/nand/Kconfig                           |    7 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/mtk_ecc.c                         |  449 +++++++
 drivers/mtd/nand/mtk_ecc.h                         |   56 +
 drivers/mtd/nand/mtk_nand.c                        | 1266 ++++++++++++++++++++
 6 files changed, 1924 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
 create mode 100644 drivers/mtd/nand/mtk_ecc.c
 create mode 100644 drivers/mtd/nand/mtk_ecc.h
 create mode 100644 drivers/mtd/nand/mtk_nand.c

-- 
2.5.0
