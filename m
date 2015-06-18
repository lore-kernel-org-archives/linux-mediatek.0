From: Scott Shu <scott.shu@mediatek.com>
Subject: [RESEND PATCH 4/6] ARM: Mediatek: enable GPT6 on boot up to make arch timer working for MT6580
Date: Fri, 19 Jun 2015 02:01:19 +0800
Message-ID: <1434650481-39421-5-git-send-email-scott.shu@mediatek.com>
References: <Scott Shu <srv_scott.shu@mediatek.com>
 <1434650481-39421-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434650481-39421-1-git-send-email-scott.shu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yingjoe.chen@mediatek.com, robh+dt@kernel.org, matthias.bgg@gmail.com, linux@arm.linux.org.uk, rchintakuntla@cavium.com, lorenzo.pieralisi@arm.com, marc.ceeeee@gmail.com, heiko@sntech.de, catalin.marinas@arm.com, arnd@arndb.de, galak@codeaurora.org
Cc: srv_wsdupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Scott Shu <scott.shu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

We enable GTP6 which ungates the arch timer clock.
---
 arch/arm/mach-mediatek/mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index 6b38d67..469d332 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -28,7 +28,8 @@ static void __init mediatek_timer_init(void)
 {
 	void __iomem *gpt_base = 0;
 
-	if (of_machine_is_compatible("mediatek,mt6589") ||
+	if (of_machine_is_compatible("mediatek,mt6580") ||
+	    of_machine_is_compatible("mediatek,mt6589") ||
 	    of_machine_is_compatible("mediatek,mt8135") ||
 	    of_machine_is_compatible("mediatek,mt8127")) {
 		/* turn on GPT6 which ungates arch timer clocks */
@@ -46,6 +47,7 @@ static void __init mediatek_timer_init(void)
 };
 
 static const char * const mediatek_board_dt_compat[] = {
+	"mediatek,mt6580",
 	"mediatek,mt6589",
 	"mediatek,mt6592",
 	"mediatek,mt8127",
-- 
1.8.1.1.dirty
