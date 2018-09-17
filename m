From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] [media] VPU: mediatek: don't pass an unused parameter
Date: Mon, 17 Sep 2018 16:56:22 +0300
Message-ID: <20180917135622.GA23073@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

The load_requested_vpu() function returns a freed vpu_fw pointer.  It's
not used so it doesn't cause any problems, but Smatch complains about
it:

    drivers/media/platform/mtk-vpu/mtk_vpu.c:578 vpu_load_firmware()
    warn: passing freed memory 'vpu_fw'

We can clean up the code a bit and silence the static checker warning
by not passing the parameter at all.

Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index f8d35e3ac1dc..616f78b24a79 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -480,12 +480,12 @@ EXPORT_SYMBOL_GPL(vpu_get_plat_device);
 
 /* load vpu program/data memory */
 static int load_requested_vpu(struct mtk_vpu *vpu,
-			      const struct firmware *vpu_fw,
 			      u8 fw_type)
 {
 	size_t tcm_size = fw_type ? VPU_DTCM_SIZE : VPU_PTCM_SIZE;
 	size_t fw_size = fw_type ? VPU_D_FW_SIZE : VPU_P_FW_SIZE;
 	char *fw_name = fw_type ? VPU_D_FW : VPU_P_FW;
+	const struct firmware *vpu_fw;
 	size_t dl_size = 0;
 	size_t extra_fw_size = 0;
 	void *dest;
@@ -539,7 +539,6 @@ int vpu_load_firmware(struct platform_device *pdev)
 	struct mtk_vpu *vpu;
 	struct device *dev = &pdev->dev;
 	struct vpu_run *run;
-	const struct firmware *vpu_fw = NULL;
 	int ret;
 
 	if (!pdev) {
@@ -568,14 +567,14 @@ int vpu_load_firmware(struct platform_device *pdev)
 	run->signaled = false;
 	dev_dbg(vpu->dev, "firmware request\n");
 	/* Downloading program firmware to device*/
-	ret = load_requested_vpu(vpu, vpu_fw, P_FW);
+	ret = load_requested_vpu(vpu, P_FW);
 	if (ret < 0) {
 		dev_err(dev, "Failed to request %s, %d\n", VPU_P_FW, ret);
 		goto OUT_LOAD_FW;
 	}
 
 	/* Downloading data firmware to device */
-	ret = load_requested_vpu(vpu, vpu_fw, D_FW);
+	ret = load_requested_vpu(vpu, D_FW);
 	if (ret < 0) {
 		dev_err(dev, "Failed to request %s, %d\n", VPU_D_FW, ret);
 		goto OUT_LOAD_FW;
