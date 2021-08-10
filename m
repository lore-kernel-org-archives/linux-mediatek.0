Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F1CC43216
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997AD61075
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 997AD61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQfu+e2rM0SECiL1OzVntXQFDHpfPDVbJ16bNlhUk9E=; b=XdIesZFvb1EMIB
	PczSei/deVRfYKDFhHPJsVhvZ+rAFs1dMmKzOQ95AZvA4hWCSGDLJymewqe9/6zCmG/5gLVjYMqnI
	j6t7rXm5C37n+eVNjwCXw/XjL+CkFoiAyjs5z8LSMsgeQ1Xh7SWE624vGBEhlqQhbq/8aXWipjnAP
	eNhjoK1I91J5rrc4k5TwmzHTgGUdjXtiaJHMpK51oHW8Iorq6oiDlGF1D0sSa1fNVk9d0Y07GiFW7
	Laa5qdzQKW9xloN2Kco/zYQoiDBOtZaEq9kl+a9np8lgbm0lJqSlNu+TUlbicVYlRVLM9+zoz3l9t
	zYVVhqCNeyB1imU3OPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNDx-0032mA-Kv; Tue, 10 Aug 2021 08:35:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNCy-0032Bp-Hj; Tue, 10 Aug 2021 08:34:05 +0000
X-UUID: f5d01a79de02427da4e3eb097b5f3667-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YY/K6YDOZDHUH6chkqeqzikb0wbPYlKIuVHFzOgaR7Y=; 
 b=XKXuQRTu/QhwIbkOPeJNGHC/kdVegttKqqVR33Yk91SJX25mP8NDgTQMp4TNjDAz6gy/BzbtXr3FnhY5bG8G1JxIasd00ozz3xUtM+5Pe7NxA/L+BQt3k3a81z2bzY4QGN2kqc2PkZyQF46AFd0wZb6WqIYfDxBKACzG4ZlyNnc=;
X-UUID: f5d01a79de02427da4e3eb097b5f3667-20210810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 789262303; Tue, 10 Aug 2021 01:33:58 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:31:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:31:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:31:42 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, George Sun
 <george.sun@mediatek.com>
Subject: [PATCH v4, 14/15] media: mtk-vcodec: Add core dec and dec end ipi msg
Date: Tue, 10 Aug 2021 16:30:46 +0800
Message-ID: <20210810083047.16693-15-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810083047.16693-1-yunfei.dong@mediatek.com>
References: <20210810083047.16693-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_013400_684085_ECFEB065 
X-CRM114-Status: GOOD (  13.83  )
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
---
v4: no change
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
