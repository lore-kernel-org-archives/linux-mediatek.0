From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/2] MTK Smart Device Gen1 NAND Driver
Date: Fri, 29 Apr 2016 12:17:20 -0400
Message-ID: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
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
To: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

  Fixes/Changes on v4 relative to: 
  --------------------------------

  tree		: https://github.com/bbrezillon/linux-0day
  branch	: nand/ecclayout
  commit	:
 		'commit "mtd: kill the nand_ecclayout struct"'
		 Author: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
		 Date:	Thu Feb 4 10:16:18 2016 +0100
  Patch v4
  --------
  mtd: mediatek: device tree docs for MTK Smart Device Gen1 NAND
       - nand-on-flash-bbt, nand-ecc-mode, nand-ecc-step-size and
         nand-ecc-strength are now optional parameters
       - spare-per-sector removed from DT settings.
       - extend documentation.

  mtd: mediatek: driver for MTK Smart Device Gen1 NAND
       - rename functions (semantic issues).
       - add lock to ECC engine.
       - rework ECC interface (single enable/disable function).
       - rework bad block mark (now stored in OOB).
       - fix stat reporting.
       - rework FDM calculation.
       - handle optional DT settings (strength, mode, ecc step size).
       - spare per sector clamped to valid register values (hw spec).
		
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

Bad Block mark
==============
The bad block mark is stored in the OOB region (one byte)

Controller limitations:
=======================

 * dma chaning not supported:
	To guarantee that the pages corresponding to the buffers are contiguous
	in memory the driver enables NAND_USE_BOUNCE_BUFFER.
 * spare per sector: 16B to 128B
 * sector sizes: 512B or 1024B
 * programable page sizes: 512B, 2KB, 4KB, 8K, 16K 
 

Tests:
======

* UBIFS support has been validated on 512MiB device (iozone, dd)
* All drivers/mtd/tests/* pass clean.
* Speed tests:

	- eraseblock write speed		: 7487 KiB/s
	- eraseblock read speed 		: 10786 KiB/s
	- page write speed 			: 7406 KiB/s
	- page read speed 			: 10741 KiB/s
	- 2 page write speed 			: 7447 KiB/s
	- 2 page read speed			: 10763 KiB/s
	- erase speed				: 105774 KiB/s
	- 2x multi-block erase speed 		: 361120 KiB/s
	- 4x multi-block erase speed		: 362622 KiB/s
	- 8x multi-block erase speed		: 362622 KiB/s
	- 16x multi-block erase speed		: 363377 KiB/s
	- 32x multi-block erase speed		: 363377 KiB/s
	- 64x multi-block erase speed		: 363883 KiB/s


Jorge Ramirez-Ortiz (2):
  mtd: mediatek: device tree docs for MTK Smart Device Gen1 NAND
  mtd: mediatek: driver for MTK Smart Device Gen1 NAND

 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  161 +++
 drivers/mtd/nand/Kconfig                           |    7 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/mtk_ecc.c                         |  527 +++++++
 drivers/mtd/nand/mtk_ecc.h                         |   53 +
 drivers/mtd/nand/mtk_nand.c                        | 1432 ++++++++++++++++++++
 6 files changed, 2181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
 create mode 100644 drivers/mtd/nand/mtk_ecc.c
 create mode 100644 drivers/mtd/nand/mtk_ecc.h
 create mode 100644 drivers/mtd/nand/mtk_nand.c

-- 
2.7.4
