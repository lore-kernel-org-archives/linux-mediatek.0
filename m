From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v6 03/14] soc: mediatek: Switch to SPDX license identifier
Date: Thu, 20 Jun 2019 10:37:55 +0800
Message-ID: <1560998286-9189-4-git-send-email-weiyi.lu@mediatek.com>
References: <1560998286-9189-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560998286-9189-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 5b24bb4..9f52f50 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -1,15 +1,7 @@
-/*
- * Copyright (c) 2015 Pengutronix, Sascha Hauer <kernel@pengutronix.de>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2015 Pengutronix, Sascha Hauer <kernel@pengutronix.de>
+
 #include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/io.h>
-- 
1.8.1.1.dirty
