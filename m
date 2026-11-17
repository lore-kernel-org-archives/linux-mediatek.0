Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B060A3839
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 03:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YECs6EFb;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=KgAtMmNk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f3IfMxJH9EfLRyluv8Rl5hEFiFddEUWp3vTjQtcJNxE=; b=YECs6EFbS18Dcc10lsLKiJYNkU
	A/awqxJf1/Sgb8KMj9gn9jNq1CL4ADx8+XcwNgRjfggiMLSF28rfeA9E8nlFcCIQzmAQbDw0B16F2
	6HrK5SUDUGhrtATQIbMhI2rC0uLY53sFb6kNL3uzPiWu7npdB7ndRjnLHgKJGFFSqPeJ9zbrCYE7e
	KOVNCJ1cMfRH9XihGH256LScAIoD7tSGxL5reP5gpDqMtVMdRyn3AdTU4PkMCF6xdMT2YTl53deim
	CA+yURP2Sf3+79lEy6PBx8NQ5lsY5KCuBG15L7U7Utcn2XZYRZz+/GK8lyWP6yyPqI7n2e0TR+Oyf
	1ERKQqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9ti-00000004TrE-1zCV;
	Tue, 17 Nov 2026 03:30:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9tZ-00000004ThK-0WF9;
	Tue, 17 Nov 2026 03:30:10 +0000
X-UUID: 2bbc0ce0e23711f1afed4741b24580c9-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f3IfMxJH9EfLRyluv8Rl5hEFiFddEUWp3vTjQtcJNxE=;
	b=KgAtMmNkC8RNq+eVB2CQ/mFNN2LXfmfJb+CJ2Fx4b7acr/Au48WNt6p85gfApZ+tIzAcdyAhquw3uS7r18sPW45L0Lekxnf8ZMPa6ljDkrRQl2cOlyOtfwwuSJQBZleJiM9Blz7GqgNn2QQf3zk2pgQoB3808FaWZ7tc2GseV2o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f0b0afc8-b710-4a5b-8454-b9b13ebaa849,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:8e955e33-b2d3-41c8-8b07-c8724f80a34e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2bbc0ce0e23711f1afed4741b24580c9-20261116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 200881738; Mon, 16 Nov 2026 20:30:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 11:29:58 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 11:29:56 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 03/14] media: mediatek: vcodec: add driver to support vcp encoder
Date: Tue, 17 Nov 2026 11:29:39 +0800
Message-ID: <20261117032950.1425556-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_193009_405029_D16CD7C8 
X-CRM114-Status: GOOD (  18.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Encoder also need to call vcp interface to communicate with vcp,
add driver to support encoder.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 52 ++++++++++++++++---
 .../vcodec/common/mtk_vcodec_fw_vcp.h         |  1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |  2 +
 4 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 3b85ae0e6..5ec7a67b5 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -13,6 +13,8 @@
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../decoder/vdec_ipi_msg.h"
+#include "../encoder/mtk_vcodec_enc.h"
+#include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
 
 #define IPI_SEND_TIMEOUT_MS  100U
@@ -223,8 +225,13 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id, void *b
 	}
 
 	mutex_lock(&vcp->ipi_mutex);
-	feature_id = VDEC_FEATURE_ID;
-	mailbox_id = IPI_OUT_VDEC_1;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VENC_0;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VDEC_1;
+	}
 
 	timeout_jiffies = jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
 	while (!vcp_device->ops->vcp_is_ready(vcp_device, feature_id)) {
@@ -348,7 +355,7 @@ static void mtk_vcodec_vcp_put_device(struct mtk_vcodec_fw *fw)
 static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 {
 	struct mtk_vcp_device *vcp_device;
-	int ret, feature_id, mem_id, mailbox_id, ipi_id;
+	int ret, feature_id, mem_id, mailbox_id;
 	int i;
 
 	if (fw->vcp->is_init_done) {
@@ -363,10 +370,15 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 
 	vcp_device = fw->vcp->vcp_device;
 
-	feature_id = VDEC_FEATURE_ID;
-	mem_id = VDEC_MEM_ID;
-	mailbox_id = IPI_IN_VDEC_1;
-	ipi_id = VCP_IPI_LAT_DECODER;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mem_id = VENC_MEM_ID;
+		mailbox_id = IPI_IN_VENC_0;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mem_id = VDEC_MEM_ID;
+		mailbox_id = IPI_IN_VDEC_1;
+	}
 
 	ret = mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_id,
 					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
@@ -402,6 +414,26 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 		mutex_init(&fw->vcp->ipi_desc[i].lock);
 	mutex_init(&fw->vcp->ipi_mutex);
 
+	if (fw->fw_use == ENCODER) {
+		init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_ENCODER]);
+		fw->vcp->msg_thread =
+			kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread");
+		if (IS_ERR(fw->vcp->msg_thread)) {
+			ret = PTR_ERR(fw->vcp->msg_thread);
+			fw->vcp->msg_thread = NULL;
+			goto err_deregister_feature;
+		}
+
+		fw->vcp->vsi_addr = vcp_device->ops->get_mem_virt(vcp_device, mem_id);
+		fw->vcp->vsi_size = vcp_device->ops->get_mem_size(vcp_device, mem_id);
+		fw->vcp->iova_addr = vcp_device->ops->get_mem_iova(vcp_device, mem_id);
+
+		dev_dbg(&fw->pdev->dev, "enc vcp init done => va: %p size:0x%x iova:%pad.\n",
+			fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
+
+		return 0;
+	}
+
 	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_LAT_DECODER]);
 	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_CORE_DECODER]);
 	fw->vcp->msg_thread =
@@ -530,7 +562,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use
 	struct mtk_vcodec_fw *fw;
 	int i;
 
-	if (fw_use == DECODER) {
+	if (fw_use == ENCODER) {
+		struct mtk_vcodec_enc_dev *enc_dev = priv;
+
+		plat_dev = enc_dev->plat_dev;
+	} else if (fw_use == DECODER) {
 		struct mtk_vcodec_dec_dev *dec_dev = priv;
 
 		plat_dev = dec_dev->plat_dev;
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
index 83742096e..97ba642dc 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -16,6 +16,7 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
 
 /* enum mtk_vcp_ipi_index - index used to separate different hardware */
 enum mtk_vcp_ipi_index {
+	VCP_IPI_ENCODER,
 	VCP_IPI_LAT_DECODER,
 	VCP_IPI_CORE_DECODER,
 	VCP_IPI_MAX,
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 0d4e94463..48cb5dded 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -26,7 +26,6 @@
 
 #define MTK_DEFAULT_FRAMERATE_NUM 1001
 #define MTK_DEFAULT_FRAMERATE_DENOM 30000
-#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
 
 static void mtk_venc_worker(struct work_struct *work);
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
index 908d8179b..84156c102 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
@@ -23,6 +23,8 @@
 #define MTK_VENC_IRQ_STATUS_OFFSET	0x05C
 #define MTK_VENC_IRQ_ACK_OFFSET	0x060
 
+#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
+
 /**
  * struct mtk_video_enc_buf - Private data related to each VB2 buffer.
  * @m2m_buf:	M2M buffer
-- 
2.51.0.windows.2


