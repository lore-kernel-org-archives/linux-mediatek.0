From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v4 09/12] dt-bindings: soc: fix typo of MT8173 power
 dt-bindings
Date: Fri, 1 Feb 2019 16:30:13 +0800
Message-ID: <20190201083016.25856-11-weiyi.lu@mediatek.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201083016.25856-1-weiyi.lu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
