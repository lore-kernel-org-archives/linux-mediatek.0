Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DEEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcJd68hsIDJWMygiRVfBcmuKxIky2S5shl6ax1Clt0Q=; b=n9EUl1H4FUotvh
	gD9W/1N/pH7HHAQAoeY4SCMGzFbjvgjfw4gpKE9xW5dE48pAOEQTmiqpyh+T7s9uzgQst/5whGNmJ
	sEHseurDeJhRBDoAB4t7Y58opW8EDdek1ScjXZtxpe/Ns7A+ykC01yRZxuGTDUhbGtSP8m+h4nmsk
	cU/yJ/rk+Xnfjf52XmNmzf9zbpwPnDTAFC3RgMpN/2D54zF/9T5nYw2IUKwL+mQjYqVBZBET9qLls
	zwJ0thdryhWq5PM7yCAbdW2BldeYWlOqmoevxYIR7kE8faAH1mqd7IC8EoLbxQCdlg7Vvfnv8xa9L
	Wqdh4RekJak7+WoMT83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qDG-009xA0-3X; Mon, 10 Jan 2022 08:39:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6q9G-009uaz-1u; Mon, 10 Jan 2022 08:35:33 +0000
X-UUID: 4e08023ce51d4dff89accfc88c4127b2-20220110
X-UUID: 4e08023ce51d4dff89accfc88c4127b2-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 496706657; Mon, 10 Jan 2022 01:35:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 00:34:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 16:34:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:34:48 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Steve Cho <stevecho@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,
 03/15] media: mtk-vcodec: get capture queue buffer size from scp
Date: Mon, 10 Jan 2022 16:34:30 +0800
Message-ID: <20220110083442.32604-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083442.32604-1-yunfei.dong@mediatek.com>
References: <20220110083442.32604-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_003526_168605_D972890A 
X-CRM114-Status: GOOD (  17.71  )
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

Different capture buffer format has different buffer size, need to get
real buffer size according to buffer type from scp.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 37 ++++++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 50 +++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   | 15 ++++++
 3 files changed, 102 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 5daca8d52ebb..363d928be29f 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -20,6 +20,7 @@ enum vdec_ipi_msgid {
 	AP_IPIMSG_DEC_RESET = 0xA004,
 	AP_IPIMSG_DEC_CORE = 0xA005,
 	AP_IPIMSG_DEC_CORE_END = 0xA006,
+	AP_IPIMSG_DEC_GET_PARAM = 0xA007,
 
 	VPU_IPIMSG_DEC_INIT_ACK = 0xB000,
 	VPU_IPIMSG_DEC_START_ACK = 0xB001,
@@ -28,6 +29,7 @@ enum vdec_ipi_msgid {
 	VPU_IPIMSG_DEC_RESET_ACK = 0xB004,
 	VPU_IPIMSG_DEC_CORE_ACK = 0xB005,
 	VPU_IPIMSG_DEC_CORE_END_ACK = 0xB006,
+	VPU_IPIMSG_DEC_GET_PARAM_ACK = 0xB007,
 };
 
 /**
@@ -114,4 +116,39 @@ struct vdec_vpu_ipi_init_ack {
 	uint32_t inst_id;
 };
 
+/**
+ * struct vdec_ap_ipi_get_param - for AP_IPIMSG_DEC_GET_PARAM
+ * @msg_id	: AP_IPIMSG_DEC_GET_PARAM
+ * @inst_id     : instance ID. Used if the ABI version >= 2.
+ * @data	: picture information
+ * @param_type	: get param type
+ * @codec_type	: Codec fourcc
+ */
+struct vdec_ap_ipi_get_param {
+	uint32_t msg_id;
+	uint32_t inst_id;
+	uint32_t data[4];
+	uint32_t param_type;
+	uint32_t codec_type;
+};
+
+
+/**
+ * struct vdec_vpu_ipi_get_param_ack - for VPU_IPIMSG_DEC_GET_PARAM_ACK
+ * @msg_id	: VPU_IPIMSG_DEC_GET_PARAM_ACK
+ * @status	: VPU exeuction result
+ * @ap_inst_addr	: AP vcodec_vpu_inst instance address
+ * @data     : picture information from SCP.
+ * @param_type	: get param type
+ * @reserved : reserved param
+ */
+struct vdec_vpu_ipi_get_param_ack {
+	uint32_t msg_id;
+	int32_t status;
+	uint64_t ap_inst_addr;
+	uint32_t data[4];
+	uint32_t param_type;
+	uint32_t reserved;
+};
+
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 21f6d9c5a371..816fd6a5556a 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -6,6 +6,7 @@
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
+#include "vdec_drv_if.h"
 #include "vdec_ipi_msg.h"
 #include "vdec_vpu_if.h"
 #include "mtk_vcodec_fw.h"
@@ -54,6 +55,27 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	}
 }
 
+static void handle_get_param_msg_ack(
+	const struct vdec_vpu_ipi_get_param_ack *msg)
+{
+	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
+					(unsigned long)msg->ap_inst_addr;
+
+	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
+
+	/* param_type is enum vdec_get_param_type */
+	switch(msg->param_type) {
+	case GET_PARAM_PIC_INFO:
+		vpu->fb_sz[0] = msg->data[0];
+		vpu->fb_sz[1] = msg->data[1];
+		break;
+	default:
+		mtk_vcodec_err(vpu, "invalid get param type=%d", msg->param_type);
+		vpu->failure = 1;
+		break;
+	}
+}
+
 /*
  * vpu_dec_ipi_handler - Handler for VPU ipi message.
  *
@@ -89,6 +111,9 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 		case VPU_IPIMSG_DEC_CORE_END_ACK:
 			break;
 
+		case VPU_IPIMSG_DEC_GET_PARAM_ACK:
+			handle_get_param_msg_ack(data);
+			break;
 		default:
 			mtk_vcodec_err(vpu, "invalid msg=%X", msg->msg_id);
 			break;
@@ -217,6 +242,31 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 	return err;
 }
 
+int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
+	unsigned int len, unsigned int param_type)
+{
+	struct vdec_ap_ipi_get_param msg;
+	int err;
+
+	mtk_vcodec_debug_enter(vpu);
+
+	if (len > ARRAY_SIZE(msg.data)) {
+		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
+		return -EINVAL;
+	}
+
+	memset(&msg, 0, sizeof(msg));
+	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
+	msg.inst_id = vpu->inst_id;
+	memcpy(msg.data, data, sizeof(unsigned int) * len);
+	msg.param_type = param_type;
+	msg.codec_type = vpu->codec_type;
+
+	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
+	mtk_vcodec_debug(vpu, "- ret=%d", err);
+	return err;
+}
+
 int vpu_dec_core(struct vdec_vpu_inst *vpu)
 {
 	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_CORE);
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index 4cb3c7f5a3ad..963f8d4877b7 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
  * @wq          : wait queue to wait VPU message ack
  * @handler     : ipi handler for each decoder
  * @codec_type     : use codec type to separate different codecs
+ * @capture_type    : used capture type to separate different capture format
+ * @fb_sz  : frame buffer size of each plane
  */
 struct vdec_vpu_inst {
 	int id;
@@ -42,6 +44,8 @@ struct vdec_vpu_inst {
 	wait_queue_head_t wq;
 	mtk_vcodec_ipi_handler handler;
 	unsigned int codec_type;
+	unsigned int capture_type;
+	unsigned int fb_sz[2];
 };
 
 /**
@@ -104,4 +108,15 @@ int vpu_dec_core(struct vdec_vpu_inst *vpu);
  */
 int vpu_dec_core_end(struct vdec_vpu_inst *vpu);
 
+/**
+ * vpu_dec_get_param - get param from scp
+ *
+ * @vpu : instance for vdec_vpu_inst
+ * @data: meta data to pass bitstream info to VPU decoder
+ * @len : meta data length
+ * @param_type : get param type
+ */
+int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
+	unsigned int len, unsigned int param_type);
+
 #endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
