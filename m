From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 12/16] drm/img-rogue: remove locking around devfreq opp functions
Date: Wed, 15 Nov 2017 16:24:19 +0100
Message-ID: <1510759463-30201-13-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mbrugger-IBi9RG/b67k@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Fixes "BUG: sleeping function called from invalid context".

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/img-rogue/1.6/pvr_dvfs_device.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/img-rogue/1.6/pvr_dvfs_device.c b/drivers/gpu/drm/img-rogue/1.6/pvr_dvfs_device.c
index be1919e..cadda55 100644
--- a/drivers/gpu/drm/img-rogue/1.6/pvr_dvfs_device.c
+++ b/drivers/gpu/drm/img-rogue/1.6/pvr_dvfs_device.c
@@ -94,7 +94,6 @@ static IMG_INT32 devfreq_target(struct device *dev, long unsigned *requested_fre
 	IMG_UINT32		ui32Freq, ui32CurFreq, ui32Volt;
 	struct OPP_STRUCT	*opp;
 
-	rcu_read_lock();
 	opp = devfreq_recommended_opp(dev, requested_freq, flags);
 	if (IS_ERR(opp)) {
 		rcu_read_unlock();
@@ -104,7 +103,6 @@ static IMG_INT32 devfreq_target(struct device *dev, long unsigned *requested_fre
 
 	ui32Freq = OPP_GET_FREQ(opp);
 	ui32Volt = OPP_GET_VOLTAGE(opp);
-	rcu_read_unlock();
 
 	ui32CurFreq = psRGXTimingInfo->ui32CoreClockSpeed;
 
@@ -230,11 +228,9 @@ static int GetOPPValues(struct device *dev,
 	struct dev_pm_opp *opp;
 
 	/* Start RCU read-side critical section to access device opp_list. */
-	rcu_read_lock();
 	count = OPP_GET_OPP_COUNT(dev);
 	if (count < 0) {
 		dev_err(dev, "Could not fetch OPP count, %d\n", count);
-		rcu_read_unlock();
 		return count;
 	}
 
@@ -245,7 +241,6 @@ static int GetOPPValues(struct device *dev,
 #endif
 
 	if (!freq_table) {
-		rcu_read_unlock();
 		return -ENOMEM;
 	}
 
@@ -287,8 +282,6 @@ static int GetOPPValues(struct device *dev,
 
 exit:
 
-	rcu_read_unlock();
-
 #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
 	if (!err)
 	{
-- 
2.7.4
