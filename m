Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7035CC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cc1vOdWtwzxjB8Itoebo3PGpOUY7+SB1sP8jgG5BLo=; b=trOyIqeAC6euyd92fhFQjGBQ4b
	3w1lz255FN8kAM3Ql3nZ3olfutMqlnkJ1EzgmeemxVoubHDVe6LxUX+xpdlAh23wHsx0mnS/oGMgw
	OZB0qKskta2Mxx0UkLVQsc3R2TUyfjk527gRyer7ZNO6gM2Yb1T0tTg6XGcL6tUt8oesbq6DNFDAm
	TmO/N29omyW9V6IdBlRFnFY75e+H4Q3wKNjcpNof2U3MqwIpSdODKtSsH3mDXCqs+B43dgUCzUMMw
	ChdYWthwUDpCbDf2JCaTDq/A3yJcm93TvwvIOoLHk+QGQ7vzIisEz19KTF+2FFo2zVdCpJGz0zLSQ
	BC5punDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvo8-005j5g-WB; Wed, 08 Mar 2023 15:34:25 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvo6-005j3e-AS
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 15:34:23 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id g9so9611726qvt.8
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 07:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678289658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cc1vOdWtwzxjB8Itoebo3PGpOUY7+SB1sP8jgG5BLo=;
        b=YoD4ttwbs43VKxfqZVBA8RXsYlw5CZm74f+e5Lh/kCbYdkWfNFqSGYc08xOUDBYk9P
         lZnvrLEzsfrbvfUiEhnaXnwkYHfR+CsmLGUeokIRahw+9k+tmcJ5xb3TyChoPVDo9/P1
         l1VDO62R0d+LwA7NDoCm69wOXebeShbps3Yxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678289658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cc1vOdWtwzxjB8Itoebo3PGpOUY7+SB1sP8jgG5BLo=;
        b=f4x85N3z1mxb1iDC1ws1fzqlSlZaxRx+L/Z1i58v0vmy3c2JztfU2U/ndmZD8uF2jl
         mIb9a5KV5lrX0Lj9NWD/4lmDa77fuSXZ2tsXCdDj2DBRZnrLj7NIo083PVPEkE46jjJd
         VaLY1iPsjxuYvryuL/g0cQFP12NjCmIM6ahjaY8Ykrd7NTzSCvh3IehCalmrmE9MUuim
         pI2jRs7iuJySqUSqCPnxu9v0Uh5WKagZtJvWBZpYZsVP/s+vmnKuyOWsATxRG/1NfJ83
         TLrCRHdgYPOt34gGxW0l5f3tOsYJv/QezSgcaRAlF3YPtvBrSmh/PczXeQ8zoyJpZ55L
         grjw==
X-Gm-Message-State: AO0yUKUMBstS0GVX21IVesxCADXWyH+GwgxOGPO4XKRLdwDAzi2QX+Xq
	vU+Rs9PMXWE542MgVKs/2KsJiqsVgPJ1eBAsnUvq8w==
X-Google-Smtp-Source: AK7set98642jUMtdHeymZDEKFYq0KpYGGdPN1pcP5RvZyBL1nfu9bZZzmMjm71u4d8JnE0Kaca57mg==
X-Received: by 2002:ad4:5f4f:0:b0:56e:b59d:2ee7 with SMTP id p15-20020ad45f4f000000b0056eb59d2ee7mr35502459qvg.47.1678289658613;
        Wed, 08 Mar 2023 07:34:18 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:8752:d0ab:8bcc:f9a8])
        by smtp.gmail.com with ESMTPSA id c134-20020ae9ed8c000000b0073d873df3fesm10506884qkg.30.2023.03.08.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 07:34:18 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	greenjustin@chromium.org
Subject: [PATCH v7 RESEND 2/3] drm/mediatek: Add support for AR30 and BA30 overlays
Date: Wed,  8 Mar 2023 10:33:57 -0500
Message-Id: <20230308153358.333297-3-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230308153358.333297-1-greenjustin@chromium.org>
References: <20230308153358.333297-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_073422_396483_DAB85FD2 
X-CRM114-Status: GOOD (  12.02  )
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

Tested using "modetest -P" on an MT8195 device.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8743c8047dc9..a6255e847104 100644
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
@@ -89,6 +94,7 @@ struct mtk_disp_ovl_data {
 	bool supports_afbc;
 	const u32 *formats;
 	size_t num_formats;
+	bool supports_clrfmt_ext;
 };
 
 /*
@@ -218,6 +224,30 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ovl, struct cmdq_pkt *cmdq_pkt
 			   DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(idx));
 }
 
+static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg;
+	unsigned int bit_depth = OVL_CON_CLRFMT_8_BIT;
+
+	if (!ovl->data->supports_clrfmt_ext)
+		return;
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
@@ -332,9 +362,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
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
@@ -418,6 +450,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
 	}
 
+	mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
-- 
2.39.1.456.gfc5497dd1b-goog


