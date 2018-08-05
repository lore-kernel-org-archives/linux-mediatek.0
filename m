From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] soc: mediatek: pwrap: use true and false for boolean values
Date: Sat, 4 Aug 2018 20:02:01 -0500
Message-ID: <20180805010201.GA7320@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-mediatek@lists.infradead.org

Return statements in functions returning bool should use true or false
instead of an integer value.

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 4e931fd..932470a 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1096,7 +1096,7 @@ static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
 	ret = pwrap_read(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_RDY],
 			 &rdata);
 	if (ret)
-		return 0;
+		return false;
 
 	return rdata == 1;
 }
-- 
2.7.4
