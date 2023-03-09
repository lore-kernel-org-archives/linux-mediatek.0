Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB78CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=; b=wTRKXfcToCY/CFojKWHSLuY2Ue
	JdRBNWuLdRvUA77W/89KJYTyFXIicfw2wENbZHoMhtP7AJKozKw1bBtVi8f51CQJvL2rSAEQe4MYT
	gpm/ZH7XU5MRuJjSssYGJ5LXmTfFeus7fOYjy/+5kdYm2GqzzHAOSYoNs3skbK01T0UXTIpGNnBUp
	OG4eLr68U2OR575rgqc6yBE998FuE94KeLtcWQHXFkrFveJZ2BQgMg6TAyCmA7EQEHq6jEHIZDfWi
	WQUZpIla+OnP6o22tBY2FtuiG2cICLWt88waHVIvPmnUrdEsQI9N2Vq+Eab56+s7IAJ7xVn0SA+eC
	I4FZ3ypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paO5H-00C3yV-2b; Thu, 09 Mar 2023 21:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paO5F-00C3xz-Es
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 21:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=; b=C/sQWQ9p3H/MuJZ3/mH4zGEp6T
	ABVFsqv4/zUdcwJNkxmCyd6BRH2pIQ+FVpkuKgPQEIhZ9o/+rSi40btJ+Qa3Xe947kIWVOkDQ31tF
	ijj5xyh7OBsYk2I07G40Z8HHRRHWloSWSSDecYGrn7mZo6xT1meu/G2jrczUP4AK9wg4IG21sZVP7
	keWihqzPXn9gBKZfhPMkGNCMq+kudu0uIs7110CYmfkTqElSJu27VawgCtnjeG1s3Uz0zYVMEHRXe
	9bZxDqQjvlSqWkQSAQ6g3vtWg3nY9xda0sEXdBx1zXZ1PFXiaKnl8fZq953g9rv20yBc/9by9ORHo
	utLNEWeQ==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paNSE-000F6n-0q
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 21:05:42 +0000
Received: by mail-qt1-x82e.google.com with SMTP id c18so3596179qte.5
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678395933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=;
        b=YPg0x50+7K+mExpb8ey1c0DmG8Z63jmrSKmXN9mbjNIdiSbYihqGEYA4DPpVC8+dgI
         x3txgSO6P6SXwZNS+NXfw/k60Re/13d2gYfhzdx7lBdcXx4QRAx5XqMmdtDZ7Y30sLw2
         hlUo4KqC3DM5g1/7SG333WAip1KWx52SAco78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678395933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=;
        b=cYlDMgKSZewReb6Lj1rwaY/Kh0k90Swa8QBTCyFJ+GWclddZDGgydbwNVMa66LPeud
         nO1xxAamWej0aka/9xs44pdK3qyNthi+rTFiCRMIpuRei+7Ue9ksjNhtF/2GddEaiV9C
         NWiaBqDQ+Mmur5nsoLpcgXJA40HDcMC1VPaokZEv/j4XfpQu2ya9iGZhVIolF5HNJBJq
         ABP54dtXKSIm1aguWpu2ZOTVXPxjeOPhgY7Q6iyqopM6r08iddWifo5R0SNPjebQG7MX
         pI7YGSFI41zEN0viNTPGsFTE1cYIGBA9TKyDVVf5fU8ZxKhhhf/xfwXwtTo2OBeU4oO5
         7i1A==
X-Gm-Message-State: AO0yUKUJiSqKwryi+bv48DbLpvVd9RCBMaVTAHE5Gh7XLOh0geIOc/fF
	0VJepmXq1tPv3wJ72AmfdHhBMDOQGK+tdFseQLPQXA==
X-Google-Smtp-Source: AK7set/I4VnP5MmfF498RvMceJNf3jcWZbagRwc2tpTQtxdNF9CIfoTZfkmBdf6tHuD7VglGWsN7Jw==
X-Received: by 2002:a05:622a:58e:b0:3b9:bf7f:66ff with SMTP id c14-20020a05622a058e00b003b9bf7f66ffmr37868701qtb.67.1678395932935;
        Thu, 09 Mar 2023 13:05:32 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:a575:2520:a8e1:989d])
        by smtp.gmail.com with ESMTPSA id 69-20020a370548000000b007426f115a4esm14302375qkf.129.2023.03.09.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:05:32 -0800 (PST)
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
Date: Thu,  9 Mar 2023 16:04:15 -0500
Message-Id: <20230309210416.1167020-3-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230309210416.1167020-1-greenjustin@chromium.org>
References: <20230309210416.1167020-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_210539_550147_B59BF52A 
X-CRM114-Status: GOOD (  16.12  )
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

Add the ability for the Mediatek DRM driver to control the bit depth register.
If the DTS indicates the device supports 10-bit overlays and the current format
has a fourcc of AR30, BA30, or RA30, we set the bit depth register to 10 bit.

The next patch in the series actually enables 10-bit overlays for MT8195
devices, but this current patch should be a no-op. This patch was tested by
simply running Chrome on an MT8195 and looking for regressions.

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


