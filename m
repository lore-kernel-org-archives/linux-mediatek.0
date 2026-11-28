Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6977606A31F
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Flbt1BiZ;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=p6LVWWrX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZEXmGBXXJye9IGt3EKcRUDkbiwRap/GPuyXTExPamXo=; b=Flbt1BiZF53rM5eHl8VsP8/CNO
	ZqOHH2kWotWh8847lN7wnROLKcmIBK1ap6ir2285eYAILu+o3eBADx7Yna6g+/8tC+MfAmDI0qJeD
	zfRMDxMbLzzBJpjq/EomoNsamGn3fTbkn3hoeyU09vQZxMxtqQrGYAii5WCUDwmSzMbA9NMRrMNt6
	lS36HAp2rLSaYXph/x9wEpX/uYhFCxnJsO4TgLChdlHI0Y6usRypodE5le6RQ79kOQ/lCxAXnoVsL
	qvGkdzbe65srsYhHqwE5rwGeAh3HKaNwaff8miSYspRbu6Ov887g34vwm1MOLa27z04WqCT9Hr8OF
	HqbgFCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDBP-00000000UUb-0Kc9;
	Sat, 28 Nov 2026 07:49:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDAS-00000000U4D-24Ai;
	Sat, 28 Nov 2026 07:48:24 +0000
X-UUID: 131c0f88eb0011f1a170bf5142e12a73-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZEXmGBXXJye9IGt3EKcRUDkbiwRap/GPuyXTExPamXo=;
	b=p6LVWWrXOid8Nz2twq2jAiHE1uAb0hQ4fUHj1tRQnEII7Akssm7QV5Bvxn76UbBbm4cMPT/dUMMjJQWLgtwYF4G6y/hnj1NNlLp5NIwtIRm/hVlLHdhUE8Wk7uanXvmCR4/aP/YudZXLdgFKQijcZAc+mPrm7Ww7S1LtHORPcp0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a9bba274-47c3-4a76-8086-c162655cc5f9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3f52e666-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 131c0f88eb0011f1a170bf5142e12a73-20261128
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2005565355; Sat, 28 Nov 2026 00:48:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:15 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:13 +0800
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
Subject: [PATCH v10 07/14] media: mediatek: vcodec: send share memory address to vcp
Date: Sat, 28 Nov 2026 15:47:53 +0800
Message-ID: <20261128074800.3108429-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
References: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_234820_591958_E29BAA2B 
X-CRM114-Status: GOOD (  13.96  )
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

The share memory is allocated in kernel for vcp architecture, it's
different with vpu which share memors is reserved in vpu micro
processor. Need to send share memory address to vcp.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/vdec_ipi_msg.h      | 2 ++
 .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
index c2c2a3a63..8b771d470 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
@@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
  * @msg_id	: AP_IPIMSG_DEC_INIT
  * @codec_type	: codec fourcc
  * @ap_inst_addr	: AP video decoder instance address
+ * @shared_iova	: reserved share memory address
  */
 struct vdec_ap_ipi_init {
 	uint32_t msg_id;
 	u32 codec_type;
 	uint64_t ap_inst_addr;
+	u64 shared_iova;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index cdb673e6b..50f1e1613 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -4,6 +4,8 @@
  * Author: PC Chen <pc.chen@mediatek.com>
  */
 
+#include <linux/stddef.h>
+
 #include "mtk_vcodec_dec_drv.h"
 #include "vdec_drv_if.h"
 #include "vdec_ipi_msg.h"
@@ -210,6 +212,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 int vpu_dec_init(struct vdec_vpu_inst *vpu)
 {
 	struct vdec_ap_ipi_init msg = { };
+	size_t msg_size = offsetof(struct vdec_ap_ipi_init, shared_iova);
 	int err;
 
 	init_waitqueue_head(&vpu->wq);
@@ -236,10 +239,14 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP) {
+		msg.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
+		msg_size = sizeof(msg);
+	}
 
 	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
 
-	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
+	err = vcodec_vpu_send_msg(vpu, (void *)&msg, msg_size);
 
 	if (IS_ERR_OR_NULL(vpu->vsi)) {
 		mtk_vdec_err(vpu->ctx, "invalid vdec vsi, status=%d", err);
-- 
2.51.0.windows.2


