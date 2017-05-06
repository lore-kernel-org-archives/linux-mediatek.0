From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] crypto: mediatek - drop .owner field in mtk_crypto_driver
Date: Sat,  6 May 2017 23:35:29 +0800
Message-ID: <55f4a84740c5d01a35ff6ec68890fcca0b26f28d.1493797414.git.geliangtang@gmail.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Drop .owner field in mtk_crypto_driver, since platform_driver_register()
will set it automatically.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index b6ecc28..f7536b1 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -596,7 +596,6 @@ static struct platform_driver mtk_crypto_driver = {
 	.remove = mtk_crypto_remove,
 	.driver = {
 		   .name = "mtk-crypto",
-		   .owner = THIS_MODULE,
 		   .of_match_table = of_crypto_id,
 	},
 };
-- 
2.9.3
