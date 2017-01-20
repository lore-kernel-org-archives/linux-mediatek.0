From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH net] macsec: fix validation failed in asynchronous operation.
Date: Fri, 20 Jan 2017 15:28:33 +0800
Message-ID: <1484897313-19157-1-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, Sabrina Dubroca <sd@queasysnail.net>, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Add missing "macsec_skb_cb(skb)->valid = true" in callback
function macsec_decrypt_done(), this fixes packet validation
failed while decrypting asynchronously.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/macsec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
index f83cf66..2a6ab5a 100644
--- a/drivers/net/macsec.c
+++ b/drivers/net/macsec.c
@@ -880,6 +880,7 @@ static void macsec_decrypt_done(struct crypto_async_request *base, int err)
 	aead_request_free(macsec_skb_cb(skb)->req);
 
 	rcu_read_lock_bh();
+	macsec_skb_cb(skb)->valid = true;
 	pn = ntohl(macsec_ethhdr(skb)->packet_number);
 	if (!macsec_post_decrypt(skb, &macsec->secy, pn)) {
 		rcu_read_unlock_bh();
-- 
1.9.1
