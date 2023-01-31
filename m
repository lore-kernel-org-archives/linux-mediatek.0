Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59777C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 20:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyl33WAUjvF8alq7KuyZ+uiGuXUTkE3ON8jKXV0pXVs=; b=4WE6ss6cmyKi2gTkoZ0nf7halA
	udSFNr64oocZdqxj9GxaX4VHnBa+CqB95AN/4H6nI4rz9lsRYEgCznngvZ1n+RmSJh0GDTjxPWA6k
	hv0nQwiE2cFKm1ZTOpKrxWUaxcRg3g7UOOz8Fh9l8xd+KzBXRm7H1wzZB2XuOAxCMY8WLjrjC68Ts
	DD5aFC/suHVptS1btkDQumCKQfU8Vp/WvT2wlIqc5p1Ivy4olpkmBey8Jav/NqNHS+wL12VYX4v1U
	lE16jpNVbXf/1xr+aL/fsheSD0afeq71Y69wLmA8o5c6HgN5g5O3HaUall7cuOk+j9YXnj3VevRvq
	MEwlL9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwwC-009ECH-VV; Tue, 31 Jan 2023 20:09:04 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMww9-009EAg-Gn
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 20:09:03 +0000
Received: by mail-qt1-x836.google.com with SMTP id h24so6540932qtr.0
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 12:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyl33WAUjvF8alq7KuyZ+uiGuXUTkE3ON8jKXV0pXVs=;
        b=cPD7dmab1R36OliQIiJ0KMkSesyvi36UTEUoIdOLjd5LEuk92j90nMV2uUbtuO56/Q
         LI/q3qbvl3i+0OCMXCGGd3UvQiezs7dGJIfsVtutnXb7KPASxP07w18Qts6ctI6tGAas
         GlTBhB7q63BRCv6j0+m2csTy0EUrhIo3hUR1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyl33WAUjvF8alq7KuyZ+uiGuXUTkE3ON8jKXV0pXVs=;
        b=QQjE5ABwYzqtN/YP8W/qTCzN742ltXKy5f6oX6koW++GU4R6VfkJvyIOgtO4KRN43X
         iJKwIQdcTd0EAd8WqJ6ll971wAWlYZmBNernPwJp2ZbCNaK1USSPBQwCfG9toE7IeUse
         rIc3Jbt24jBkp59fa727trSoinqZg8tD811i5aOiQT3WxcxO/FkoWQTwC4u7u+TT3XEN
         S4HDLA1pFqIFj2v0jk1CTqdmkuzCKGZoaYRg8P2mPJIKTkgKiZycMV63HgV1fxpD42kk
         /rTSAyOWYz9tcnr6Tj6w+/c0w62qNHwuxtU7bjiae2RO374ELTSJEQ5zkPVD88BS62Gn
         gmCg==
X-Gm-Message-State: AO0yUKVH6/a7LWSN894n5OqMGEX23jievzaS7hs0mTggRxx1tKHpKoXD
	p6Yx7IH24BOgJuxwk2tdSyaHzusOvKDC3pGS
X-Google-Smtp-Source: AK7set+6cXk0xnrFR+MhMHFcgZTHW1W3yQPE6bY9vNoZhDrj897UGwGWYzAYKFXqq6HMLigMuZA2rA==
X-Received: by 2002:ac8:5c0c:0:b0:3b8:2ce4:3e9 with SMTP id i12-20020ac85c0c000000b003b82ce403e9mr29384821qti.32.1675195738998;
        Tue, 31 Jan 2023 12:08:58 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:502d:723:d741:14cd])
        by smtp.gmail.com with ESMTPSA id m186-20020a37bcc3000000b007068b49b8absm10658782qkf.62.2023.01.31.12.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 12:08:58 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	Justin Green <greenjustin@chromium.org>
Subject: [PATCH 2/2] drm/mediatek: Add support for AR30 and BA30 overlays
Date: Tue, 31 Jan 2023 15:08:42 -0500
Message-Id: <20230131200842.341272-3-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230131200842.341272-1-greenjustin@chromium.org>
References: <20230131200842.341272-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120901_601509_66EE16B2 
X-CRM114-Status: GOOD (  13.85  )
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

Add support for overlays with pixel formats AR30 and BA30 on MT8195.

Tested using "modetest -P" on an MT8195 device.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 49 ++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8743c8047dc9..cd2f9a156456 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -41,6 +41,7 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
+#define DISP_REG_OVL_CLRFMT_EXT			0x02D0
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -61,6 +62,10 @@
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					OVL_CON_CLRFMT_RGB : 0)
+#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)	(0xFF << 4 * (ovl))
+#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)	(depth << 4 * (ovl))
+#define OVL_CON_CLRFMT_8_BIT			0x00
+#define OVL_CON_CLRFMT_10_BIT			0x01
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
 #define	OVL_CON_VIRT_FLIP	BIT(9)
@@ -80,6 +85,22 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -218,6 +239,27 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ovl, struct cmdq_pkt *cmdq_pkt
 			   DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(idx));
 }
 
+static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg;
+	unsigned int bit_depth = OVL_CON_CLRFMT_8_BIT;
+
+	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
+	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
+
+	if (format == DRM_FORMAT_RGBA1010102 ||
+	    format == DRM_FORMAT_BGRA1010102 ||
+	    format == DRM_FORMAT_ARGB2101010)
+		bit_depth = OVL_CON_CLRFMT_10_BIT;
+
+	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
+
+	mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
+		      ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
+}
+
 void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -332,9 +374,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
 		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ARGB2101010:
 		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
@@ -418,6 +462,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
 	}
 
+	mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
@@ -583,8 +628,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
-- 
2.39.1.456.gfc5497dd1b-goog


