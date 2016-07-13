From: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RESEND PATCH] soc: mediatek: PMIC wrap: Extend the waiting time to
 10ms.
Date: Wed, 13 Jul 2016 11:34:28 +0800
Message-ID: <1468380868-16683-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Read data fails sometimes because of a timeout that PMIC cannot transfer data
to PMIC wrap on time, extend the waiting time to 10ms to reduce the failed
rate.

Signed-off-by: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
Resend to fixed the typo on commit message
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a003ba2..a5f1093 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -583,7 +583,7 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
 {
 	unsigned long timeout;
 
-	timeout = jiffies + usecs_to_jiffies(255);
+	timeout = jiffies + usecs_to_jiffies(10000);
 
 	do {
 		if (time_after(jiffies, timeout))
-- 
1.8.1.1.dirty
