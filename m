From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 08/16] drm/img-rogue: dma_buf_ops .kmap_* are now .map_*
Date: Wed, 15 Nov 2017 16:24:15 +0100
Message-ID: <1510759463-30201-9-git-send-email-ulrich.hecht+renesas@gmail.com>
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

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/img-rogue/1.6/physmem_dmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/img-rogue/1.6/physmem_dmabuf.c b/drivers/gpu/drm/img-rogue/1.6/physmem_dmabuf.c
index 406886f..4fb813f 100644
--- a/drivers/gpu/drm/img-rogue/1.6/physmem_dmabuf.c
+++ b/drivers/gpu/drm/img-rogue/1.6/physmem_dmabuf.c
@@ -130,8 +130,8 @@ static const struct dma_buf_ops sPVRDmaBufOps =
 	.map_dma_buf   = PVRDmaBufOpsMap,
 	.unmap_dma_buf = PVRDmaBufOpsUnmap,
 	.release       = PVRDmaBufOpsRelease,
-	.kmap_atomic   = PVRDmaBufOpsKMap,
-	.kmap          = PVRDmaBufOpsKMap,
+	.map_atomic    = PVRDmaBufOpsKMap,
+	.map           = PVRDmaBufOpsKMap,
 	.mmap          = PVRDmaBufOpsMMap,
 };
 
-- 
2.7.4
