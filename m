From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH v2 6/9] crypto: omap-sham - Use IPAD/OPAD constant
Date: Fri, 19 May 2017 08:53:28 +0200
Message-ID: <20170519065331.27670-7-clabbe.montjoie@gmail.com>
References: <20170519065331.27670-1-clabbe.montjoie@gmail.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20170519065331.27670-1-clabbe.montjoie@gmail.com>
Sender: linux-crypto-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, davem@davemloft.net, thomas.lendacky@amd.com, gary.hook@amd.com, boris.brezillon@free-electrons.com, arno@natisbad.org, matthias.bgg@gmail.com, giovanni.cabiddu@intel.com, salvatore.benedetto@intel.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, qat-linux@intel.com, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

This patch simply replace all occurrence of HMAC IPAD/OPAD value by their
define.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/crypto/omap-sham.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index d0b16e5e4ee5..1864a57caaa4 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -41,6 +41,7 @@
 #include <crypto/algapi.h>
 #include <crypto/sha.h>
 #include <crypto/hash.h>
+#include <crypto/hmac.h>
 #include <crypto/internal/hash.h>
 
 #define MD5_DIGEST_SIZE			16
@@ -1326,8 +1327,8 @@ static int omap_sham_setkey(struct crypto_ahash *tfm, const u8 *key,
 		memcpy(bctx->opad, bctx->ipad, bs);
 
 		for (i = 0; i < bs; i++) {
-			bctx->ipad[i] ^= 0x36;
-			bctx->opad[i] ^= 0x5c;
+			bctx->ipad[i] ^= HMAC_IPAD_VALUE;
+			bctx->opad[i] ^= HMAC_OPAD_VALUE;
 		}
 	}
 
-- 
2.13.0
