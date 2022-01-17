Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56524C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3Cjs1APdmI0laKP69u8l6bgjvyxfUSdZc82hyD7syU=; b=ZX6lmDXjJIJSbn
	lVKeLTaBrmrYtFxYK4fgXJ5VXf8vs22DLLqrYkRDn3OHyYCRUop/Le84QXySz5wwf1qQhxH+kIAXB
	xZwrNvKbm/OMdYpEeSDWcU1eKKeM7JbqxvtMeKV8MJmx/Cn+JUqKYuF/T2j42aSl1aOp3bTArmxOn
	iBUyCCd1YKqTSBsWP7ZgK1rvBcWgGZHCChsMurccAKWmrXvX/nfQlSul2jw0sMl8RVmcPaK3pdCwx
	fC3JZ+hurF9jm35UOACQW934yy3LtrjIZplsK1UByqqizC8ju8+LdlmPuJpSqzbRrB6gsckyYYTRz
	AbpQGXvRkPs250a3NNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L8C-00DZ94-Rl; Mon, 17 Jan 2022 06:04:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6p-00DYVR-78; Mon, 17 Jan 2022 06:03:17 +0000
X-UUID: 96e7ee153fa5409c824c57897b5bf7ac-20220116
X-UUID: 96e7ee153fa5409c824c57897b5bf7ac-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1270451818; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 13:53:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:09 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 12/14] media: platform: mtk-mdp3: Reconfigure shared memory
Date: Mon, 17 Jan 2022 13:52:52 +0800
Message-ID: <20220117055254.9777-13-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220315_277489_6C623A27 
X-CRM114-Status: GOOD (  18.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

MDP communicates with SCP through shared memory.
SCP is responsible for calculating information that MDP needed,
however SCP has poor performance.

In order to improve performance,
shared memory is reconfigured into three buffer
to make more logical sense.

The third buffer - path buffer
which allocated in scp before is used for scp calculation.
This buffer need to be clear when frame_change occurs,
but it costs lot of time for scp doing memset which decreases performance.

Thus we move this buffer to kernel,
do memset in ap side to accelerate frame processing.

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    | 106 +++++++++---------
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   8 ++
 2 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
index 035fa3e55335..73da786b5270 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
@@ -10,7 +10,7 @@
 #include "mtk-mdp3-core.h"
 
 #define MDP_VPU_MESSAGE_TIMEOUT 500U
-#define vpu_alloc_size         0x7F8000
+#define MDP_VPU_PATH_SIZE	0x78000
 
 static inline struct mdp_dev *vpu_to_mdp(struct mdp_vpu_dev *vpu)
 {
@@ -19,23 +19,46 @@ static inline struct mdp_dev *vpu_to_mdp(struct mdp_vpu_dev *vpu)
 
 static int mdp_vpu_shared_mem_alloc(struct mdp_vpu_dev *vpu)
 {
-	if (vpu->work && vpu->work_addr)
-		return 0;
+	vpu->work = dma_alloc_wc(scp_get_device(vpu->scp), vpu->work_size,
+				 &vpu->work_addr, GFP_KERNEL);
+	if (!vpu->work)
+		goto err_return;
 
-	vpu->work = dma_alloc_coherent(scp_get_device(vpu->scp), vpu_alloc_size,
-				       &vpu->work_addr, GFP_KERNEL);
+	vpu->config = dma_alloc_wc(scp_get_device(vpu->scp), vpu->config_size,
+				   &vpu->config_addr, GFP_KERNEL);
+	if (!vpu->config)
+		goto err_free_work;
 
-	if (!vpu->work)
-		return -ENOMEM;
-	else
-		return 0;
+	vpu->path = dma_alloc_wc(scp_get_device(vpu->scp), vpu->path_size,
+				 &vpu->path_addr, GFP_KERNEL);
+	if (!vpu->path)
+		goto err_free_config;
+
+	return 0;
+
+err_free_config:
+	dma_free_wc(scp_get_device(vpu->scp), vpu->config_size,
+		    vpu->config, vpu->config_addr);
+err_free_work:
+	dma_free_wc(scp_get_device(vpu->scp), vpu->work_size,
+		    vpu->work, vpu->work_addr);
+err_return:
+	return -ENOMEM;
 }
 
 void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
 {
 	if (vpu->work && vpu->work_addr)
-		dma_free_coherent(scp_get_device(vpu->scp), vpu_alloc_size,
-				  vpu->work, vpu->work_addr);
+		dma_free_wc(scp_get_device(vpu->scp), vpu->work_size,
+			    vpu->work, vpu->work_addr);
+
+	if (vpu->config && vpu->config_addr)
+		dma_free_wc(scp_get_device(vpu->scp), vpu->config_size,
+			    vpu->config, vpu->config_addr);
+
+	if (vpu->path && vpu->path_addr)
+		dma_free_wc(scp_get_device(vpu->scp), vpu->path_size,
+			    vpu->path, vpu->path_addr);
 }
 
 static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
@@ -156,9 +179,6 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 	struct mdp_ipi_init_msg msg = {
 		.drv_data = (unsigned long)vpu,
 	};
-	size_t mem_size;
-	phys_addr_t pool;
-	const size_t pool_size = sizeof(struct mdp_config_pool);
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	int err;
 
@@ -171,33 +191,20 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 		goto err_work_size;
 	/* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
 
-	mem_size = vpu_alloc_size;
-	if (mdp_vpu_shared_mem_alloc(vpu)) {
+	vpu->config_size = MDP_DUAL_PIPE * sizeof(struct img_config);
+	vpu->path_size = MDP_VPU_PATH_SIZE;
+	err = mdp_vpu_shared_mem_alloc(vpu);
+	if (err) {
 		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
 		goto err_mem_alloc;
 	}
 
-	pool = ALIGN((uintptr_t)vpu->work + vpu->work_size, 8);
-	if (pool + pool_size - (uintptr_t)vpu->work > mem_size) {
-		dev_err(&mdp->pdev->dev,
-			"VPU memory insufficient: %zx + %zx > %zx",
-			vpu->work_size, pool_size, mem_size);
-		err = -ENOMEM;
-		goto err_mem_size;
-	}
-
-	dev_dbg(&mdp->pdev->dev,
-		"VPU work:%pK pa:%pad sz:%zx pool:%pa sz:%zx (mem sz:%zx)",
-		vpu->work, &vpu->work_addr, vpu->work_size,
-		&pool, pool_size, mem_size);
-	vpu->pool = (struct mdp_config_pool *)(uintptr_t)pool;
 	msg.work_addr = vpu->work_addr;
 	msg.work_size = vpu->work_size;
 	err = mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg, sizeof(msg));
 	if (err)
 		goto err_work_size;
 
-	memset(vpu->pool, 0, sizeof(*vpu->pool));
 	return 0;
 
 err_work_size:
@@ -210,7 +217,6 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 		break;
 	}
 	return err;
-err_mem_size:
 err_mem_alloc:
 	return err;
 }
@@ -233,11 +239,8 @@ static struct img_config *mdp_config_get(struct mdp_vpu_dev *vpu,
 	if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
 		return ERR_PTR(-EINVAL);
 
-	mutex_lock(vpu->lock);
-	vpu->pool->cfg_count[id]++;
-	config = &vpu->pool->configs[id];
-	*addr = vpu->work_addr + ((uintptr_t)config - (uintptr_t)vpu->work);
-	mutex_unlock(vpu->lock);
+	config = vpu->config;
+	*addr = vpu->config_addr;
 
 	return config;
 }
@@ -250,14 +253,7 @@ static int mdp_config_put(struct mdp_vpu_dev *vpu,
 
 	if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
 		return -EINVAL;
-	if (vpu->lock)
-		mutex_lock(vpu->lock);
-	if (!vpu->pool->cfg_count[id] || config != &vpu->pool->configs[id])
-		err = -EINVAL;
-	else
-		vpu->pool->cfg_count[id]--;
-	if (vpu->lock)
-		mutex_unlock(vpu->lock);
+
 	return err;
 }
 
@@ -288,25 +284,23 @@ int mdp_vpu_ctx_deinit(struct mdp_vpu_ctx *ctx)
 
 int mdp_vpu_process(struct mdp_vpu_ctx *ctx, struct img_ipi_frameparam *param)
 {
-	struct mdp_vpu_dev *vpu = ctx->vpu_dev;
-	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	struct img_sw_addr addr;
 
-	if (!ctx->vpu_dev->work || !ctx->vpu_dev->work_addr) {
-		if (mdp_vpu_shared_mem_alloc(vpu)) {
-			dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
-			return -ENOMEM;
-		}
-	}
 	memset((void *)ctx->vpu_dev->work, 0, ctx->vpu_dev->work_size);
-	memset(ctx->config, 0, sizeof(*ctx->config));
-	param->config_data.va = (unsigned long)ctx->config;
+
+	if (param->frame_change)
+		memset((void *)ctx->vpu_dev->path, 0, ctx->vpu_dev->path_size);
+	param->self_data.pa = ctx->vpu_dev->path_addr;
+	param->self_data.va = (u64)ctx->vpu_dev->path;
+
+	memset(ctx->config, 0, ctx->vpu_dev->config_size);
+	param->config_data.va = (u64)ctx->config;
 	param->config_data.pa = ctx->inst_addr;
 	param->drv_data = (unsigned long)ctx;
 
 	memcpy((void *)ctx->vpu_dev->work, param, sizeof(*param));
 	addr.pa = ctx->vpu_dev->work_addr;
-	addr.va = (uintptr_t)ctx->vpu_dev->work;
+	addr.va = (u64)ctx->vpu_dev->work;
 	return mdp_vpu_sendmsg(ctx->vpu_dev, SCP_IPI_MDP_FRAME,
 		&addr, sizeof(addr));
 }
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
index 3140d2925a1a..597589c73266 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
@@ -58,6 +58,14 @@ struct mdp_vpu_dev {
 	size_t			work_size;
 	struct mdp_config_pool	*pool;
 	u32			status;
+
+	void			*config;
+	dma_addr_t		config_addr;
+	size_t			config_size;
+
+	void			*path;
+	dma_addr_t		path_addr;
+	size_t			path_size;
 };
 
 struct mdp_vpu_ctx {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
