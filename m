From: Carlos Henrique Lima Melara <charlesmelara@outlook.com>
Subject: [PATCH v3] staging: mt7621-eth/ethtool.c: Correction of SPDX license
 identifier
Date: Wed, 30 Jan 2019 20:39:00 +0000
Message-ID: <RO1P15201MB20122B62C6B87E3B1E3AFF0AA8900@RO1P15201MB2012.LAMP152.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Language: en-US
Content-ID: <7AEBFA925B201946BBA045C216239E77@LAMP152.PROD.OUTLOOK.COM>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "neil@brown.name" <neil@brown.name>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

This patch fixes the checkpatch.p1 warning:

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
+/*

It includes the SPDX expression for GPL-2.0 according to the text license
in the top of the C file.

Signed-off-by: Carlos Henrique Lima Melara <charlesmelara@outlook.com>
---
Changes since v2:
 - Corrects patch changelog
 - Removes changes in the copyrigth comment

Changes since v1:
 - Corrects the alingment of patch description
 - Cc to public mailing lists
---
 drivers/staging/mt7621-eth/ethtool.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/mt7621-eth/ethtool.c b/drivers/staging/mt7621-eth/ethtool.c
index 40a7d47be913..8c4228e2c987 100644
--- a/drivers/staging/mt7621-eth/ethtool.c
+++ b/drivers/staging/mt7621-eth/ethtool.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*   This program is free software; you can redistribute it and/or modify
  *   it under the terms of the GNU General Public License as published by
  *   the Free Software Foundation; version 2 of the License
-- 
2.20.1
