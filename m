Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B5DC27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 02:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdYlW6V7N1ZnqYspQYd1Bp4Lc0EvqUX5TVai0ZgIkI8=; b=oB/1+9z+Kxz1zWRPsgYWQwahcK
	iruVBn8E3/SQo9zs9OHA1zPKT/M7WxDGVb7MWome8Uo1c1IdzYpUmJ52eswwsAo7iSaXFJeYz8r7x
	eVhRV89w0N1BxOqqzYDW/uSZ8teGiaFP+fNHhKvvjxbCKMkYurh5fnQI6+iGGq6bvzq/t/D5k6pZb
	NXahxSYTiUJnIwsw0qFMbA/8hR9LoaaeDS+F1bJnOXr8yM/w2qqtS549NthUYERo6SEmdzouACQ14
	iRpnsxvtl624uZm8Ri7dFrltl+BQzxCVk57LlrTa2ya0We4vg1z9IVWJNALYlLvkzFOezZkelMwPU
	vUjkbQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwzC-00000001BTN-1s4l;
	Fri, 14 Jun 2024 02:48:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwy2-00000001ARF-48ue;
	Fri, 14 Jun 2024 02:47:15 +0000
X-UUID: 6067ed9629f811efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wdYlW6V7N1ZnqYspQYd1Bp4Lc0EvqUX5TVai0ZgIkI8=;
	b=NrmyakvYDCNEfSaQDt/eQIQ6KPPH9t+2LG82R2iPqxVEe6VDgU9yZrPKokOKXqEOGll5IYkt5WQgsCCSUqwowweyOTMIKVW6x8dZza0UjmkM0lpyK8rQnXVbB2A0EE82GoknhJsO4QbT7/de+BAPmta44NQYkHBitkhcn/3GiAc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:0e00719a-96fb-4216-adde-8a4348a7ca4e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:c53f8f44-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6067ed9629f811efaf04eb0598667787-20240613
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 839217440; Thu, 13 Jun 2024 19:47:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 10:46:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 10:46:24 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v9 16/21] drm/mediatek: Support "Pre-multiplied" blending in OVL
Date: Fri, 14 Jun 2024 10:46:15 +0800
Message-ID: <20240614024620.19011-17-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240614024620.19011-1-shawn.sung@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.881100-8.000000
X-TMASE-MatchedRID: tzdmYTDShTnX3tqA7xZNm8ULzBBTAHAlG9Itfzsy8/XYgrGDwuFJdmb6
	PphVtfZg2PMzbXOaAnoaTIVsbS1pG/QPRH4blNMc3fn7n/ZHGqaH7D1bP/FcOkJqedX9vt/ZUfo
	Sav+4bRBhQDhAoaA0nWnhMuTEcViwrxpSystEXJIdxBAG5/hkW30tCKdnhB589yM15V5aWpj6C0
	ePs7A07Xi4XEoPXecx9nksz8t8qUkZaNbuPmnonYrTzSDyjr5uR93lYgjwMSw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.881100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 97FD793FADBDEEF81A9FAB80CC259AADD20A2DBC9367500A0997AC349DD263AE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_194707_291710_4CC8792A 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby
 Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "Pre-multiplied" alpha blending mode on in OVL.
Before this patch, only the "coverage" mode is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 42 ++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 6567806cf4e2..47d0b039a616 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -52,8 +52,12 @@
 #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
 #define GMC_THRESHOLD_LOW	((1 << GMC_THRESHOLD_BITS) / 8)
 
+#define OVL_CON_CLRFMT_MAN	BIT(23)
 #define OVL_CON_BYTE_SWAP	BIT(24)
-#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
+
+/* OVL_CON_RGB_SWAP works only if OVL_CON_CLRFMT_MAN is enabled */
+#define OVL_CON_RGB_SWAP	BIT(25)
+
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
@@ -61,6 +65,11 @@
 #define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
+#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
+#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)
+#define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
+#define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -74,6 +83,8 @@
 #define	OVL_CON_VIRT_FLIP	BIT(9)
 #define	OVL_CON_HORZ_FLIP	BIT(10)
 
+#define OVL_COLOR_ALPHA		GENMASK(31, 24)
+
 static inline bool is_10bit_rgb(u32 fmt)
 {
 	switch (fmt) {
@@ -298,7 +309,13 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
 	if (w != 0 && h != 0)
 		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
 				      DISP_REG_OVL_ROI_SIZE);
-	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
+
+	/*
+	 * The background color must be opaque black (ARGB),
+	 * otherwise the alpha blending will have no effect
+	 */
+	mtk_ddp_write_relaxed(cmdq_pkt, OVL_COLOR_ALPHA, &ovl->cmdq_reg,
+			      ovl->regs, DISP_REG_OVL_ROI_BGCLR);
 
 	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
@@ -374,7 +391,8 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
+static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
+				    unsigned int blend_mode)
 {
 	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
 	 * is defined in mediatek HW data sheet.
@@ -395,22 +413,30 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 	case DRM_FORMAT_RGBA8888:
 	case DRM_FORMAT_RGBX1010102:
 	case DRM_FORMAT_RGBA1010102:
-		return OVL_CON_CLRFMT_RGBA8888;
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_RGBA8888 :
+		       OVL_CON_CLRFMT_PRGBA8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
-		return OVL_CON_CLRFMT_BGRA8888;
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_BGRA8888 :
+		       OVL_CON_CLRFMT_PBGRA8888;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
-		return OVL_CON_CLRFMT_ARGB8888;
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_ARGB8888 :
+		       OVL_CON_CLRFMT_PARGB8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR2101010:
 	case DRM_FORMAT_ABGR2101010:
-		return OVL_CON_CLRFMT_ABGR8888;
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_ABGR8888 :
+		       OVL_CON_CLRFMT_PABGR8888;
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
 	case DRM_FORMAT_YUYV:
@@ -450,7 +476,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = ovl_fmt_convert(ovl, fmt);
+	con = ovl_fmt_convert(ovl, fmt, blend_mode);
 	if (state->base.fb) {
 		con |= OVL_CON_AEN;
 		con |= state->base.alpha & OVL_CON_ALPHA;
-- 
2.18.0


