From: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 7/7] drm/mediatek: Fix mtk_atomic_complete for runtime_pm
Date: Thu, 4 Aug 2016 10:59:57 +0800
Message-ID: <1470279597-60453-8-git-send-email-bibby.hsieh@mediatek.com>
References: <1470279597-60453-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1470279597-60453-1-git-send-email-bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

To properly implement atomic w/ runtime pm, we move
drm_atomic_helper_commit_modeset_enables() above
drm_atomic_helper_commit_planes() to ensure CRTCs are enabled before
modifying plane registers, and set active_only to true to filter out
plane update notifications when the CRTC is disabled.

According to the document from linux kernel:
Set the active_only parameters to true in order not to receive plane
update notifications related to a disabled CRTC. This avoids the need
to manually ignore plane updates in driver code when the driver and/or
hardware can't or just don't need to deal with updates on disabled
CRTCs, for example when supporting runtime PM.

Signed-off-by: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b1223d5..507392a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -61,10 +61,25 @@ static void mtk_atomic_complete(struct mtk_drm_private *private,
 
 	mtk_atomic_wait_for_fences(state);
 
+	/*
+	 * Mediatek drm supports runtime PM, so plane registers cannot be
+	 * written when their crtc is disabled.
+	 *
+	 * The comment for drm_atomic_helper_commit states:
+	 *     For drivers supporting runtime PM the recommended sequence is
+	 *
+	 *     drm_atomic_helper_commit_modeset_disables(dev, state);
+	 *     drm_atomic_helper_commit_modeset_enables(dev, state);
+	 *     drm_atomic_helper_commit_planes(dev, state, true);
+	 *
+	 * See the kerneldoc entries for these three functions for more details.
+	 */
 	drm_atomic_helper_commit_modeset_disables(drm, state);
-	drm_atomic_helper_commit_planes(drm, state, false);
 	drm_atomic_helper_commit_modeset_enables(drm, state);
+	drm_atomic_helper_commit_planes(drm, state, true);
+
 	drm_atomic_helper_wait_for_vblanks(drm, state);
+
 	drm_atomic_helper_cleanup_planes(drm, state);
 	drm_atomic_state_free(state);
 }
-- 
1.7.9.5
