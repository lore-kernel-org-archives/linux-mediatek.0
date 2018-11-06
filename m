From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 09/11] dt-bindings: soc: fix typo of MT8173 power dt-bindings
Date: Tue, 6 Nov 2018 14:42:04 +0800
Message-ID: <20181106064206.17535-11-weiyi.lu@mediatek.com>
References: <20181106064206.17535-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106064206.17535-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

fix incorrect IC name that will affect the MT8183 power dt-bindings

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 include/dt-bindings/power/mt8173-power.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/power/mt8173-power.h b/include/dt-bindings/power/mt8173-power.h
index 15d531aa6e78..ef4a7f944848 100644
--- a/include/dt-bindings/power/mt8173-power.h
+++ b/include/dt-bindings/power/mt8173-power.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _DT_BINDINGS_POWER_MT8183_POWER_H
-#define _DT_BINDINGS_POWER_MT8183_POWER_H
+#ifndef _DT_BINDINGS_POWER_MT8173_POWER_H
+#define _DT_BINDINGS_POWER_MT8173_POWER_H
 
 #define MT8173_POWER_DOMAIN_VDEC	0
 #define MT8173_POWER_DOMAIN_VENC	1
@@ -13,4 +13,4 @@
 #define MT8173_POWER_DOMAIN_MFG_2D	8
 #define MT8173_POWER_DOMAIN_MFG		9
 
-#endif /* _DT_BINDINGS_POWER_MT8183_POWER_H */
+#endif /* _DT_BINDINGS_POWER_MT8173_POWER_H */
-- 
2.18.0
