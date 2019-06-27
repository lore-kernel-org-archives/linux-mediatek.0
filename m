From: Nathan Huckleberry <nhuck@google.com>
Subject: [PATCH] clk: mediatek: Fix -Wunused-const-variable
Date: Thu, 27 Jun 2019 15:15:07 -0700
Message-ID: <20190627221507.83942-1-nhuck@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, fparent@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Nathan Huckleberry <nhuck@google.com>, clang-built-linux@googlegroups.com
List-Id: linux-mediatek@lists.infradead.org

Clang produces the following warning

drivers/clk/mediatek/clk-mt8516.c:234:27: warning: unused variable
'ddrphycfg_parents' [-Wunused-const-variable] static const char * const
ddrphycfg_parents[] __initconst = {

This variable has never been used. Deleting it to cleanup the warning.

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/523
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/clk/mediatek/clk-mt8516.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 26fe43cc9ea2..9d4261ecc760 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -231,11 +231,6 @@ static const char * const nfi1x_pad_parents[] __initconst = {
 	"nfi1x_ck"
 };
 
-static const char * const ddrphycfg_parents[] __initconst = {
-	"clk26m_ck",
-	"mainpll_d16"
-};
-
 static const char * const usb_78m_parents[] __initconst = {
 	"clk_null",
 	"clk26m_ck",
-- 
2.22.0.410.gd8fdbe21b5-goog
