Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB108C54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z5SWkjHFUcPB57dyxsSgJTsbrRzl7x0XxIf/mFqL7yw=; b=HVY6fdR3Aan5kf0Hc3zZOcpB0P
	f40d0+0ax8laDt9FThLyv55H4Esp78TnGLMJNZSUV0c0mDOHfgZz1MuiNQBpTDQ+pTdGaVMjjBx0I
	3kHSkJQUonxkBoFQH8IiFe3ad646MexhfoIFf/U3XHNmHcrcfMMR95yYlH6wJOC6oHtNSoF6njdfD
	ZCSu+qrM24xxdxIUrVUmZo62aIuT9zrCqmUpl1Ff7YF2ib5oUFcVmUlrOV0RdDew0UFIkBkaxkPao
	8OhcB0hxIZD/xMu20tbbxWT+RKABboskcHuLQLrmuMO+Q/yfEPGETVmiNZSHYQPiVu/KFqp3vtam4
	RtwYrxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAlw-0062fZ-7e; Tue, 10 Jan 2023 09:18:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAlP-0062Ta-Fj; Tue, 10 Jan 2023 09:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Z5SWkjHFUcPB57dyxsSgJTsbrRzl7x0XxIf/mFqL7yw=; b=NaThtEj68fFewLOrkkTH7Wn44z
	AwrOsutjuQazbGUDKBuvuSZ32fEmJ9LgQpM9duXvkABeqbwkTa/5Zvs7VXeHcXBP3FXVw4StfiDfo
	QXXyYMsxe/9bDQUJ50y35dPJ+WzWn7Y7owTsGMLC5tC/VXnl4uzbMEesZJsfRE6VQYPFMpkRyoGUF
	nhhjtc03WZasbS1eXRXWPTBf+yKpNw7L6ks3T3VtKd2qdccroLj/d8RgcMhnzjVYN5pA+9VJ7fcH2
	7ROgueh+6CwjF5gs6ruhwtpMkUpfR4qA2J2qvSv+daSe7S00gym1fZdBmO5Yox+LGX+KGt2wbNh3M
	MMYdhK9A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFAlB-0034ER-2F;
	Tue, 10 Jan 2023 09:17:38 +0000
X-UUID: 995ea4d090c711eda08d4d6090ec5a5c-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Z5SWkjHFUcPB57dyxsSgJTsbrRzl7x0XxIf/mFqL7yw=;
	b=j7Pf0BJc2MoPMybzbx1S16kARn8UrWorsWxdfOR1Yl9QFMHp1yTfZio3BOWMdDjI9fP5jrzpyIccWfI79mRB3XRD+qO57mcGsRCXZUWELzTTJnaZRhiHAqTeyMflABZAcqw6MMawCKl4AqBdWdYbCfeHto8AgTcZh886JjY7eO8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f33fd1d1-a277-4a96-8cb6-37f228cefe77,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.17,REQID:f33fd1d1-a277-4a96-8cb6-37f228cefe77,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:543e81c,CLOUDID:2072d38b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230110171651TYF6DIFR,BulkQuantity:3,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 995ea4d090c711eda08d4d6090ec5a5c-20230110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1985545896; Tue, 10 Jan 2023 02:17:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 10 Jan 2023 17:16:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 17:16:49 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Miles Chen <miles.chen@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] drm/mediatek: include missing headers
Date: Tue, 10 Jan 2023 17:16:46 +0800
Message-ID: <20230110091647.13265-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_091735_106007_FA503DF3 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the follow sparse warnings by adding missing headers:

drivers/gpu/drm/mediatek/mtk_cec.c:251:24: sparse: warning: symbol 'mtk_cec_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:221:24: sparse: warning: symbol 'mtk_disp_ccorr_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_rdma.c:390:24: sparse: warning: symbol 'mtk_disp_rdma_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_gamma.c:209:24: sparse: warning: symbol 'mtk_disp_gamma_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_ovl.c:565:24: sparse: warning: symbol 'mtk_disp_ovl_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_color.c:164:24: sparse: warning: symbol 'mtk_disp_color_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_aal.c:161:24: sparse: warning: symbol 'mtk_disp_aal_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_dpi.c:1109:24: sparse: warning: symbol 'mtk_dpi_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c:340:24: sparse: warning: symbol 'mtk_hdmi_ddc_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_dsi.c:1223:24: sparse: warning: symbol 'mtk_dsi_driver' was not declared. Should it be static?

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c        | 2 ++
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c   | 3 +++
 10 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index cdfa648910b2..b640bc0559e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 
 #include "mtk_cec.h"
+#include "mtk_hdmi.h"
+#include "mtk_drm_drv.h"
 
 #define TR_CONFIG		0x00
 #define CLEAR_CEC_IRQ			BIT(15)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 0f9d7efb61d7..434e8a9ce8ab 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 3a53ebc4e172..1773379b2439 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_CCORR_EN				0x0000
 #define CCORR_EN					BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 473f5bb5cbad..cac9206079e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_COLOR_CFG_MAIN			0x0400
 #define DISP_COLOR_START_MT2701			0x0f00
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index bbd558a036ec..c844942603f7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 84daeaffab6a..9d8c986700ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -19,6 +19,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
 #define OVL_FME_CPL_INT					BIT(1)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0ec2e4049e07..a5a0c3bac35d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -17,6 +17,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_REG_RDMA_INT_ENABLE		0x0000
 #define DISP_REG_RDMA_INT_STATUS		0x0004
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4317595a15d1..3158dd3896a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -29,6 +29,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 enum mtk_dpi_out_bit_num {
 	MTK_DPI_OUT_BIT_NUM_8BITS,
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7d13028fb6..357301fa2e7d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -28,6 +28,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DSI_START		0x00
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 6207eac88550..2fc9214ffa82 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -19,6 +19,9 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
+#include "mtk_drm_drv.h"
+#include "mtk_hdmi.h"
+
 #define SIF1_CLOK		(288)
 #define DDC_DDCMCTL0		(0x0)
 #define DDCM_ODRAIN			BIT(31)
-- 
2.18.0


