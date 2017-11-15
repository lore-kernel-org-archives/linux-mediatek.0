From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 05/16] drm/img-rogue: adapt to changed fence API
Date: Wed, 15 Nov 2017 16:24:12 +0100
Message-ID: <1510759463-30201-6-git-send-email-ulrich.hecht+renesas@gmail.com>
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

Everything "fence..." is now "dma_fence...".

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/img-rogue/1.6/pvr_buffer_sync.c | 36 ++++++-------
 drivers/gpu/drm/img-rogue/1.6/pvr_fence.c       | 70 ++++++++++++-------------
 drivers/gpu/drm/img-rogue/1.6/pvr_fence.h       | 20 +++----
 3 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/img-rogue/1.6/pvr_buffer_sync.c b/drivers/gpu/drm/img-rogue/1.6/pvr_buffer_sync.c
index 3afa0cc..3d6f1dc 100644
--- a/drivers/gpu/drm/img-rogue/1.6/pvr_buffer_sync.c
+++ b/drivers/gpu/drm/img-rogue/1.6/pvr_buffer_sync.c
@@ -53,7 +53,7 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #include "physmem_dmabuf.h"
 
 struct pvr_buffer_sync_check_data {
-	struct fence_cb base;
+	struct dma_fence_cb base;
 
 	u32 nr_fences;
 	struct pvr_fence **fences;
@@ -172,7 +172,7 @@ pvr_buffer_sync_pmrs_fence_count(u32 nr_pmrs, PMR **pmrs, u32 *pmr_flags)
 {
 	struct reservation_object *resv;
 	struct reservation_object_list *resv_list;
-	struct fence *fence;
+	struct dma_fence *fence;
 	u32 fence_count = 0;
 	bool exclusive;
 	int i;
@@ -204,7 +204,7 @@ pvr_buffer_sync_check_fences_create(u32 nr_pmrs, PMR **pmrs, u32 *pmr_flags)
 	struct pvr_buffer_sync_check_data *data;
 	struct reservation_object *resv;
 	struct reservation_object_list *resv_list;
-	struct fence *fence;
+	struct dma_fence *fence;
 	u32 fence_count;
 	bool exclusive;
 	int i, j;
@@ -247,7 +247,7 @@ pvr_buffer_sync_check_fences_create(u32 nr_pmrs, PMR **pmrs, u32 *pmr_flags)
 			if (!data->fences[data->nr_fences - 1]) {
 				data->nr_fences--;
 				PVR_FENCE_TRACE(fence, "waiting on exclusive fence\n");
-				WARN_ON(fence_wait(fence, true) <= 0);
+				WARN_ON(dma_fence_wait(fence, true) <= 0);
 			}
 		}
 
@@ -262,7 +262,7 @@ pvr_buffer_sync_check_fences_create(u32 nr_pmrs, PMR **pmrs, u32 *pmr_flags)
 				if (!data->fences[data->nr_fences - 1]) {
 					data->nr_fences--;
 					PVR_FENCE_TRACE(fence, "waiting on non-exclusive fence\n");
-					WARN_ON(fence_wait(fence, true) <= 0);
+					WARN_ON(dma_fence_wait(fence, true) <= 0);
 				}
 			}
 		}
@@ -294,7 +294,7 @@ pvr_buffer_sync_check_fences_destroy(struct pvr_buffer_sync_check_data *data)
 }
 
 static void
-pvr_buffer_sync_check_data_cleanup(struct fence *fence, struct fence_cb *cb)
+pvr_buffer_sync_check_data_cleanup(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct pvr_buffer_sync_check_data *data =
 		container_of(cb, struct pvr_buffer_sync_check_data, base);
@@ -471,9 +471,9 @@ pvr_buffer_sync_append_start(u32 nr_pmrs,
 	 * Note: we take an additional reference on the update fence in case
 	 * it signals before we can add it to a reservation object.
 	 */
-	fence_get(&data->update_fence->base);
+	dma_fence_get(&data->update_fence->base);
 
-	err = fence_add_callback(&data->update_fence->base, &check_data->base,
+	err = dma_fence_add_callback(&data->update_fence->base, &check_data->base,
 				 pvr_buffer_sync_check_data_cleanup);
 	if (err) {
 		/*
@@ -540,7 +540,7 @@ pvr_buffer_sync_append_finish(struct pvr_buffer_sync_append_data *data)
 	 * objects we can safely drop the extra reference we took in
 	 * pvr_buffer_sync_append_start.
 	 */
-	fence_put(&data->update_fence->base);
+	dma_fence_put(&data->update_fence->base);
 
 	pvr_buffer_sync_pmrs_unlock(data->nr_pmrs, data->pmrs);
 
@@ -567,7 +567,7 @@ pvr_buffer_sync_append_abort(struct pvr_buffer_sync_append_data *data)
 	 * reference taken in pvr_buffer_sync_append_start.
 	 */
 	pvr_fence_sync_sw_signal(data->update_fence);
-	fence_put(&data->update_fence->base);
+	dma_fence_put(&data->update_fence->base);
 	pvr_buffer_sync_pmrs_unlock(data->nr_pmrs, data->pmrs);
 
 	kfree(data->check_ufo_addresses);
@@ -606,7 +606,7 @@ pvr_buffer_sync_wait(PMR *pmr, bool intr, unsigned long timeout)
 {
 	struct reservation_object *resv;
 	struct reservation_object_list *resv_list = NULL;
-	struct fence *fence, *wait_fence = NULL;
+	struct dma_fence *fence, *wait_fence = NULL;
 	unsigned seq;
 	int i;
 	long lerr;
@@ -630,8 +630,8 @@ pvr_buffer_sync_wait(PMR *pmr, bool intr, unsigned long timeout)
 		for (i = 0; i < resv_list->shared_count; i++) {
 			fence = rcu_dereference(resv_list->shared[i]);
 			if (is_our_fence(fence_ctx, fence) &&
-			    !test_bit(FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-				wait_fence = fence_get_rcu(fence);
+			    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+				wait_fence = dma_fence_get_rcu(fence);
 				if (!wait_fence)
 					goto unlock_retry;
 				break;
@@ -646,8 +646,8 @@ pvr_buffer_sync_wait(PMR *pmr, bool intr, unsigned long timeout)
 			goto unlock_retry;
 
 		if (fence &&
-		    !test_bit(FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-			wait_fence = fence_get_rcu(fence);
+		    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+			wait_fence = dma_fence_get_rcu(fence);
 			if (!wait_fence)
 				goto unlock_retry;
 		}
@@ -655,12 +655,12 @@ pvr_buffer_sync_wait(PMR *pmr, bool intr, unsigned long timeout)
 	rcu_read_unlock();
 
 	if (wait_fence) {
-		if (fence_is_signaled(wait_fence))
+		if (dma_fence_is_signaled(wait_fence))
 			lerr = timeout;
 		else
-			lerr = fence_wait_timeout(wait_fence, intr, timeout);
+			lerr = dma_fence_wait_timeout(wait_fence, intr, timeout);
 
-		fence_put(wait_fence);
+		dma_fence_put(wait_fence);
 		if (!lerr)
 			return -EBUSY;
 		else if (lerr < 0)
diff --git a/drivers/gpu/drm/img-rogue/1.6/pvr_fence.c b/drivers/gpu/drm/img-rogue/1.6/pvr_fence.c
index 10d7a1d..2dfce8c 100644
--- a/drivers/gpu/drm/img-rogue/1.6/pvr_fence.c
+++ b/drivers/gpu/drm/img-rogue/1.6/pvr_fence.c
@@ -93,12 +93,12 @@ pvr_fence_context_fences_dump(struct pvr_fence_context *fctx,
 	spin_lock_irqsave(&fctx->list_lock, flags);
 	list_for_each_entry(pvr_fence, &fctx->fence_list, fence_head) {
 		PVR_DUMPDEBUG_LOG(pfnDumpDebugPrintf, pvDumpDebugFile,
-				  "f %u#%u: (%s%s) Refs = %u, FWAddr = %#08x, Current = %#08x, Next = %#08x, %s %s",
+				  "f %llu#%u: (%s%s) Refs = %u, FWAddr = %#08x, Current = %#08x, Next = %#08x, %s %s",
 				  pvr_fence->fence->context,
 				  pvr_fence->fence->seqno,
-				  test_bit(FENCE_FLAG_ENABLE_SIGNAL_BIT, &pvr_fence->fence->flags) ? "+" : "-",
-				  test_bit(FENCE_FLAG_SIGNALED_BIT, &pvr_fence->fence->flags) ? "+" : "-",
-				  atomic_read(&pvr_fence->fence->refcount.refcount),
+				  test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &pvr_fence->fence->flags) ? "+" : "-",
+				  test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &pvr_fence->fence->flags) ? "+" : "-",
+				  atomic_read(&pvr_fence->fence->refcount.refcount.refs),
 				  SyncPrimGetFirmwareAddr(pvr_fence->sync),
 				  pvr_fence_sync_value_get(pvr_fence),
 				  PVR_FENCE_SYNC_VAL_SIGNALED,
@@ -140,7 +140,7 @@ static inline void pvr_fence_context_free_deferred(struct pvr_fence_context *fct
 				 fence_head) {
 		list_del(&pvr_fence->fence_head);
 		SyncPrimFree(pvr_fence->sync);
-		fence_free(&pvr_fence->base);
+		dma_fence_free(&pvr_fence->base);
 	}
 }
 
@@ -154,11 +154,11 @@ pvr_fence_context_signal_fences(struct work_struct *data)
 	LIST_HEAD(signal_list);
 
 	/*
-	 * We can't call fence_signal while holding the lock as we can end up
+	 * We can't call dma_fence_signal while holding the lock as we can end up
 	 * in a situation whereby pvr_fence_foreign_signal_sync, which also
 	 * takes the list lock, ends up being called as a result of the
-	 * fence_signal below, i.e. fence_signal(fence) -> fence->callback()
-	 *  -> fence_signal(foreign_fence) -> foreign_fence->callback() where
+	 * dma_fence_signal below, i.e. dma_fence_signal(fence) -> fence->callback()
+	 *  -> dma_fence_signal(foreign_fence) -> foreign_fence->callback() where
 	 * the foreign_fence callback is pvr_fence_foreign_signal_sync.
 	 *
 	 * So extract the items we intend to signal and add them to their own
@@ -179,8 +179,8 @@ pvr_fence_context_signal_fences(struct work_struct *data)
 		PVR_FENCE_TRACE(&pvr_fence->base, "signalled fence (%s)\n",
 				pvr_fence->name);
 		list_del(&pvr_fence->signal_head);
-		fence_signal(pvr_fence->fence);
-		fence_put(pvr_fence->fence);
+		dma_fence_signal(pvr_fence->fence);
+		dma_fence_put(pvr_fence->fence);
 	}
 
 	/*
@@ -233,7 +233,7 @@ pvr_fence_context_create(void *dev_cookie,
 	INIT_LIST_HEAD(&fctx->fence_list);
 	INIT_LIST_HEAD(&fctx->deferred_free_list);
 
-	fctx->fence_context = fence_context_alloc(1);
+	fctx->fence_context = dma_fence_context_alloc(1);
 	fctx->name = name;
 
 	fctx->fence_wq =
@@ -312,13 +312,13 @@ pvr_fence_context_destroy(struct pvr_fence_context *fctx)
 }
 
 static const char *
-pvr_fence_get_driver_name(struct fence *fence)
+pvr_fence_get_driver_name(struct dma_fence *fence)
 {
 	return PVR_LDM_DRIVER_REGISTRATION_NAME;
 }
 
 static const char *
-pvr_fence_get_timeline_name(struct fence *fence)
+pvr_fence_get_timeline_name(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 
@@ -326,7 +326,7 @@ pvr_fence_get_timeline_name(struct fence *fence)
 }
 
 static bool
-pvr_fence_enable_signaling(struct fence *fence)
+pvr_fence_enable_signaling(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -338,7 +338,7 @@ pvr_fence_enable_signaling(struct fence *fence)
 				     PVR_FENCE_SYNC_VAL_SIGNALED))
 		return false;
 
-	fence_get(&pvr_fence->base);
+	dma_fence_get(&pvr_fence->base);
 
 	spin_lock_irqsave(&fctx->list_lock, flags);
 	list_add_tail(&pvr_fence->signal_head, &fctx->signal_list);
@@ -351,7 +351,7 @@ pvr_fence_enable_signaling(struct fence *fence)
 }
 
 static bool
-pvr_fence_is_signaled(struct fence *fence)
+pvr_fence_is_signaled(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 
@@ -359,7 +359,7 @@ pvr_fence_is_signaled(struct fence *fence)
 }
 
 static void
-pvr_fence_release(struct fence *fence)
+pvr_fence_release(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -375,12 +375,12 @@ pvr_fence_release(struct fence *fence)
 	spin_unlock_irqrestore(&fctx->list_lock, flags);
 }
 
-const struct fence_ops pvr_fence_ops = {
+const struct dma_fence_ops pvr_fence_ops = {
 	.get_driver_name = pvr_fence_get_driver_name,
 	.get_timeline_name = pvr_fence_get_timeline_name,
 	.enable_signaling = pvr_fence_enable_signaling,
 	.signaled = pvr_fence_is_signaled,
-	.wait = fence_default_wait,
+	.wait = dma_fence_default_wait,
 	.release = pvr_fence_release,
 };
 
@@ -420,7 +420,7 @@ pvr_fence_create(struct pvr_fence_context *fctx, const char *name)
 	pvr_fence->fence = &pvr_fence->base;
 
 	seqno = pvr_fence_context_seqno_next(fctx);
-	fence_init(&pvr_fence->base, &pvr_fence_ops, &fctx->lock,
+	dma_fence_init(&pvr_fence->base, &pvr_fence_ops, &fctx->lock,
 		   fctx->fence_context, seqno);
 
 	spin_lock_irqsave(&fctx->list_lock, flags);
@@ -437,33 +437,33 @@ pvr_fence_create(struct pvr_fence_context *fctx, const char *name)
 }
 
 static const char *
-pvr_fence_foreign_get_driver_name(struct fence *fence)
+pvr_fence_foreign_get_driver_name(struct dma_fence *fence)
 {
 	return "unknown";
 }
 
 static const char *
-pvr_fence_foreign_get_timeline_name(struct fence *fence)
+pvr_fence_foreign_get_timeline_name(struct dma_fence *fence)
 {
 	return "unknown";
 }
 
 static bool
-pvr_fence_foreign_enable_signaling(struct fence *fence)
+pvr_fence_foreign_enable_signaling(struct dma_fence *fence)
 {
 	WARN_ON("cannot enable signalling on foreign fence");
 	return false;
 }
 
 static signed long
-pvr_fence_foreign_wait(struct fence *fence, bool intr, signed long timeout)
+pvr_fence_foreign_wait(struct dma_fence *fence, bool intr, signed long timeout)
 {
 	WARN_ON("cannot wait on foreign fence");
 	return 0;
 }
 
 static void
-pvr_fence_foreign_release(struct fence *fence)
+pvr_fence_foreign_release(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -481,7 +481,7 @@ pvr_fence_foreign_release(struct fence *fence)
 	spin_unlock_irqrestore(&fctx->list_lock, flags);
 }
 
-const struct fence_ops pvr_fence_foreign_ops = {
+const struct dma_fence_ops pvr_fence_foreign_ops = {
 	.get_driver_name = pvr_fence_foreign_get_driver_name,
 	.get_timeline_name = pvr_fence_foreign_get_timeline_name,
 	.enable_signaling = pvr_fence_foreign_enable_signaling,
@@ -490,7 +490,7 @@ const struct fence_ops pvr_fence_foreign_ops = {
 };
 
 static void
-pvr_fence_foreign_signal_sync(struct fence *fence, struct fence_cb *cb)
+pvr_fence_foreign_signal_sync(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct pvr_fence *pvr_fence = container_of(cb, struct pvr_fence, cb);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -507,7 +507,7 @@ pvr_fence_foreign_signal_sync(struct fence *fence, struct fence_cb *cb)
 			pvr_fence->name);
 
 	/* Drop the reference on the base fence */
-	fence_put(&pvr_fence->base);
+	dma_fence_put(&pvr_fence->base);
 }
 
 /**
@@ -527,7 +527,7 @@ pvr_fence_foreign_signal_sync(struct fence *fence, struct fence_cb *cb)
  */
 struct pvr_fence *
 pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
-			    struct fence *fence,
+			    struct dma_fence *fence,
 			    const char *name)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
@@ -539,7 +539,7 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 	if (pvr_fence) {
 		if (WARN_ON(fence->ops == &pvr_fence_foreign_ops))
 			return NULL;
-		fence_get(fence);
+		dma_fence_get(fence);
 
 		PVR_FENCE_TRACE(fence, "created fence from PVR fence (%s)\n",
 				name);
@@ -567,14 +567,14 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 	 * necessary clean up once the refcount drops to 0.
 	 */
 	seqno = pvr_fence_context_seqno_next(fctx);
-	fence_init(&pvr_fence->base, &pvr_fence_foreign_ops, &fctx->lock,
+	dma_fence_init(&pvr_fence->base, &pvr_fence_foreign_ops, &fctx->lock,
 		   fctx->fence_context, seqno);
 
 	/*
 	 * Take an extra reference on the base fence that gets dropped when the
 	 * foreign fence is signalled.
 	 */
-	fence_get(&pvr_fence->base);
+	dma_fence_get(&pvr_fence->base);
 
 	spin_lock_irqsave(&fctx->list_lock, flags);
 	list_add_tail(&pvr_fence->fence_head, &fctx->fence_list);
@@ -585,7 +585,7 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 			pvr_fence->fence->context, pvr_fence->fence->seqno,
 			name);
 
-	err = fence_add_callback(fence, &pvr_fence->cb,
+	err = dma_fence_add_callback(fence, &pvr_fence->cb,
 				 pvr_fence_foreign_signal_sync);
 	if (err) {
 		if (err != -ENOENT)
@@ -599,7 +599,7 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 		PVR_FENCE_TRACE(&pvr_fence->base, "foreign fence %d#%d already signaled (%s)\n",
 				pvr_fence->fence->context, pvr_fence->fence->seqno,
 				name);
-		fence_put(&pvr_fence->base);
+		dma_fence_put(&pvr_fence->base);
 	}
 
 
@@ -629,7 +629,7 @@ pvr_fence_destroy(struct pvr_fence *pvr_fence)
 	PVR_FENCE_TRACE(&pvr_fence->base, "destroyed fence (%s)\n",
 			pvr_fence->name);
 
-	fence_put(&pvr_fence->base);
+	dma_fence_put(&pvr_fence->base);
 }
 
 /**
diff --git a/drivers/gpu/drm/img-rogue/1.6/pvr_fence.h b/drivers/gpu/drm/img-rogue/1.6/pvr_fence.h
index 262ad62..a5b1a0d 100644
--- a/drivers/gpu/drm/img-rogue/1.6/pvr_fence.h
+++ b/drivers/gpu/drm/img-rogue/1.6/pvr_fence.h
@@ -45,7 +45,7 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #if !defined(__PVR_FENCE_H__)
 #define __PVR_FENCE_H__
 
-#include <linux/fence.h>
+#include <linux/dma-fence.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -107,16 +107,16 @@ struct pvr_fence_context {
  * @cb: foreign fence callback to set the sync to signalled
  */
 struct pvr_fence {
-	struct fence base;
+	struct dma_fence base;
 	struct pvr_fence_context *fctx;
 	const char *name;
 
-	struct fence *fence;
+	struct dma_fence *fence;
 	struct PVRSRV_CLIENT_SYNC_PRIM *sync;
 
 	struct list_head fence_head;
 	struct list_head signal_head;
-	struct fence_cb cb;
+	struct dma_fence_cb cb;
 };
 
 enum pvr_fence_sync_val {
@@ -125,22 +125,22 @@ enum pvr_fence_sync_val {
 	PVR_FENCE_SYNC_VAL_DONE = 0xDEADDEAD,
 };
 
-extern const struct fence_ops pvr_fence_ops;
-extern const struct fence_ops pvr_fence_foreign_ops;
+extern const struct dma_fence_ops pvr_fence_ops;
+extern const struct dma_fence_ops pvr_fence_foreign_ops;
 
 static inline bool is_our_fence(struct pvr_fence_context *fctx,
-				struct fence *fence)
+				struct dma_fence *fence)
 {
 	return (fence->context == fctx->fence_context);
 }
 
-static inline bool is_pvr_fence(struct fence *fence)
+static inline bool is_pvr_fence(struct dma_fence *fence)
 {
 	return ((fence->ops == &pvr_fence_ops) ||
 		(fence->ops == &pvr_fence_foreign_ops));
 }
 
-static inline struct pvr_fence *to_pvr_fence(struct fence *fence)
+static inline struct pvr_fence *to_pvr_fence(struct dma_fence *fence)
 {
 	if (is_pvr_fence(fence))
 		return container_of(fence, struct pvr_fence, base);
@@ -155,7 +155,7 @@ void pvr_fence_context_destroy(struct pvr_fence_context *fctx);
 struct pvr_fence *pvr_fence_create(struct pvr_fence_context *fctx,
 				   const char *name);
 struct pvr_fence *pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
-					      struct fence *fence,
+					      struct dma_fence *fence,
 					      const char *name);
 void pvr_fence_destroy(struct pvr_fence *pvr_fence);
 int pvr_fence_sync_sw_signal(struct pvr_fence *pvr_fence);
-- 
2.7.4
