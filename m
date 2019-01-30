From: Carlos Henrique Lima Melara <charlesmelara@outlook.com>
Subject: [PATCH v2] staging: mt7621-eth/ethtool.c: Correction of SPDX license
 identifier
Date: Wed, 30 Jan 2019 14:48:27 +0000
Message-ID: <SC1P15201MB2014C3E0CAB4DA9ADF330797A8900@SC1P15201MB2014.LAMP152.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
Content-ID: <59C8DD6DA53B784592C380241639F548@LAMP152.PROD.OUTLOOK.COM>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "neil@brown.name" <neil@brown.name>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

	This patch fix the checkpatch.p1 warning:

	WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	+/*

	It includes the SPDX expression for GPL-2.0 and corrects the comment format to suit the kernel's coding style.

Signed-off-by: Carlos (Charles) Henrique Lima Melara <charlesmelara@outlook.com>
---
 drivers/staging/mt7621-eth/ethtool.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/mt7621-eth/ethtool.c b/drivers/staging/mt7621-eth/ethtool.c
index 40a7d47be913..49d417de64c8 100644
--- a/drivers/staging/mt7621-eth/ethtool.c
+++ b/drivers/staging/mt7621-eth/ethtool.c
@@ -1,15 +1,17 @@
-/*   This program is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; version 2 of the License
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License
  *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU General Public License for more details.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
  *
- *   Copyright (C) 2009-2016 John Crispin <blogic@openwrt.org>
- *   Copyright (C) 2009-2016 Felix Fietkau <nbd@openwrt.org>
- *   Copyright (C) 2013-2016 Michael Lee <igvtee@gmail.com>
+ * Copyright (C) 2009-2016 John Crispin <blogic@openwrt.org>
+ * Copyright (C) 2009-2016 Felix Fietkau <nbd@openwrt.org>
+ * Copyright (C) 2013-2016 Michael Lee <igvtee@gmail.com>
  */
 
 #include "mtk_eth_soc.h"
-- 
2.20.1
