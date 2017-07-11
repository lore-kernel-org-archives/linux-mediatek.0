From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 06/12] drm/mediatek: Handle drm_atomic_helper_swap_state
 failure
Date: Tue, 11 Jul 2017 16:33:08 +0200
Message-ID: <20170711143314.2148-7-maarten.lankhorst@linux.intel.com>
References: <20170711143314.2148-1-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170711143314.2148-1-maarten.lankhorst@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

drm_atomic_helper_swap_state() will be changed to interruptible waiting
in the next few commits, so all drivers have to be changed to handling
failure.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 56f802d0a51c..9a130c84c861 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -109,7 +109,12 @@ static int mtk_atomic_commit(struct drm_device *drm,
 	mutex_lock(&private->commit.lock);
 	flush_work(&private->commit.work);
 
-	drm_atomic_helper_swap_state(state, true);
+	ret = drm_atomic_helper_swap_state(state, true);
+	if (ret) {
+		mutex_unlock(&private->commit.lock);
+		drm_atomic_helper_cleanup_planes(drm, state);
+		return ret;
+	}
 
 	drm_atomic_state_get(state);
 	if (async)
-- 
2.11.0
