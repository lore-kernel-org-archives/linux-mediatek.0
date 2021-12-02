Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 03:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0XnDRABJFRu5wq5Sl44CDAJh1XZPFBJ7HmjM+Mepsc=; b=r6P2dpPqQb+Yqd
	G+3TKs38kh2gb36ZHuHTUmkksp6bZgTkGVizY78RSqbeIrDGOAJJCZ1MbcKLZejF9UvtINDAY4Kcl
	DzEriZupyeB9accAgfAR8hFqHfytNhHYWQadVNLmNulX0bm1hLZyCgXcU7eU3Euq1Fdn8Xs83gRkd
	NK2Fpb0SY1Mr9VmzdacCExQ+eeAHEmkFukshgzS+r6kNIBPNj72nnuoJDtcLPdfY2QOMTo3sEw2jg
	mR/p8A3JeKmPTAT4mrVdM/SdyktXHRDXdWPXYFoo76wZDTIMsTe7OKP02PQnem8CqBkzvT8BKrrQX
	9XUqt2n6oJQ1Npwb78hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msdF0-00An8Z-Km; Thu, 02 Dec 2021 03:58:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msdCR-00AlzC-Lu; Thu, 02 Dec 2021 03:56:01 +0000
X-UUID: 1bd47e6b4bab47d8982e5353c60e6c76-20211201
X-UUID: 1bd47e6b4bab47d8982e5353c60e6c76-20211201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 52371886; Wed, 01 Dec 2021 20:55:55 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Dec 2021 19:46:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Dec 2021 11:46:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 2 Dec 2021 11:46:09 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12, 16/19] media: mtk-vcodec: Add core dec and dec end ipi msg
Date: Thu, 2 Dec 2021 11:45:41 +0800
Message-ID: <20211202034544.2750-17-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202034544.2750-1-yunfei.dong@mediatek.com>
References: <20211202034544.2750-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_195559_740757_5A0CE6EC 
X-CRM114-Status: GOOD (  12.75  )
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

Add core dec and dec end ipi msg: AP_IPIMSG_DEC_CORE/AP_IPIMSG_DEC_CORE_END.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h   |  4 ++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c    | 12 ++++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.h    | 18 ++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 5f45a537beb4..9d8079c4f976 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -18,12 +18,16 @@ enum vdec_ipi_msgid {
 	AP_IPIMSG_DEC_END = 0xA002,
 	AP_IPIMSG_DEC_DEINIT = 0xA003,
 	AP_IPIMSG_DEC_RESET = 0xA004,
+	AP_IPIMSG_DEC_CORE = 0xA005,
+	AP_IPIMSG_DEC_CORE_END = 0xA006,
 
 	VPU_IPIMSG_DEC_INIT_ACK = 0xB000,
 	VPU_IPIMSG_DEC_START_ACK = 0xB001,
 	VPU_IPIMSG_DEC_END_ACK = 0xB002,
 	VPU_IPIMSG_DEC_DEINIT_ACK = 0xB003,
 	VPU_IPIMSG_DEC_RESET_ACK = 0xB004,
+	VPU_IPIMSG_DEC_CORE_ACK = 0xB005,
+	VPU_IPIMSG_DEC_CORE_END_ACK = 0xB006,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 5dffc459a33d..bfd8e87dceff 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -85,6 +85,8 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 		case VPU_IPIMSG_DEC_END_ACK:
 		case VPU_IPIMSG_DEC_DEINIT_ACK:
 		case VPU_IPIMSG_DEC_RESET_ACK:
+		case VPU_IPIMSG_DEC_CORE_ACK:
+		case VPU_IPIMSG_DEC_CORE_END_ACK:
 			break;
 
 		default:
@@ -191,11 +193,21 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 	return err;
 }
 
+int vpu_dec_core(struct vdec_vpu_inst *vpu)
+{
+	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_CORE);
+}
+
 int vpu_dec_end(struct vdec_vpu_inst *vpu)
 {
 	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_END);
 }
 
+int vpu_dec_core_end(struct vdec_vpu_inst *vpu)
+{
+	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_CORE_END);
+}
+
 int vpu_dec_deinit(struct vdec_vpu_inst *vpu)
 {
 	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_DEINIT);
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index c2ed5b6cab8b..ae24b75d1649 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -82,4 +82,22 @@ int vpu_dec_deinit(struct vdec_vpu_inst *vpu);
  */
 int vpu_dec_reset(struct vdec_vpu_inst *vpu);
 
+/**
+ * vpu_dec_core - core start decoding, basically the function will be invoked once
+ *                 every frame.
+ *
+ * @vpu : instance for vdec_vpu_inst
+ */
+int vpu_dec_core(struct vdec_vpu_inst *vpu);
+
+/**
+ * vpu_dec_core_end - core end decoding, basically the function will be invoked once
+ *               when core HW decoding done and receive interrupt successfully. The
+ *               decoder in VPU will updata hardware information and deinit hardware
+ *               and check if there is a new decoded frame available to display.
+ *
+ * @vpu : instance for vdec_vpu_inst
+ */
+int vpu_dec_core_end(struct vdec_vpu_inst *vpu);
+
 #endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
