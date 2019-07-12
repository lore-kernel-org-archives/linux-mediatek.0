From: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Subject: [PATCH 2/3] media: rc: remove unused #define RC_PROTO_BIT_ALL
Date: Fri, 12 Jul 2019 23:46:59 +0100
Message-ID: <20190712224700.11285-2-sean@mess.org>
References: <20190712224700.11285-1-sean@mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190712224700.11285-1-sean-hENCXIMQXOg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

This lists all the protocols that the kernel knows about, however there
are no users.

Signed-off-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
---
 include/media/rc-map.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index bebd3c4c6338..3a7f8728f6ec 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -38,22 +38,6 @@
 #define RC_PROTO_BIT_RCMM32		BIT_ULL(RC_PROTO_RCMM32)
 #define RC_PROTO_BIT_XBOX_DVD		BIT_ULL(RC_PROTO_XBOX_DVD)
 
-#define RC_PROTO_BIT_ALL \
-			(RC_PROTO_BIT_UNKNOWN | RC_PROTO_BIT_OTHER | \
-			 RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC5X_20 | \
-			 RC_PROTO_BIT_RC5_SZ | RC_PROTO_BIT_JVC | \
-			 RC_PROTO_BIT_SONY12 | RC_PROTO_BIT_SONY15 | \
-			 RC_PROTO_BIT_SONY20 | RC_PROTO_BIT_NEC | \
-			 RC_PROTO_BIT_NECX | RC_PROTO_BIT_NEC32 | \
-			 RC_PROTO_BIT_SANYO | \
-			 RC_PROTO_BIT_MCIR2_KBD | RC_PROTO_BIT_MCIR2_MSE | \
-			 RC_PROTO_BIT_RC6_0 | RC_PROTO_BIT_RC6_6A_20 | \
-			 RC_PROTO_BIT_RC6_6A_24 | RC_PROTO_BIT_RC6_6A_32 | \
-			 RC_PROTO_BIT_RC6_MCE | RC_PROTO_BIT_SHARP | \
-			 RC_PROTO_BIT_XMP | RC_PROTO_BIT_CEC | \
-			 RC_PROTO_BIT_IMON | RC_PROTO_BIT_RCMM12 | \
-			 RC_PROTO_BIT_RCMM24 | RC_PROTO_BIT_RCMM32 | \
-			 RC_PROTO_BIT_XBOX_DVD)
 /* All rc protocols for which we have decoders */
 #define RC_PROTO_BIT_ALL_IR_DECODER \
 			(RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC5X_20 | \
-- 
2.21.0
