Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4645EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=; b=gqv8EyqGKtn8IWv6R7HUHHhGkY
	YIGeWPmpkSTlg4WxoQApEOq4N85IHKiXsjEJFjV0hP1p+vvWdW5JQs4AwvFPxfzPRZikVzO/qj30V
	+lz+6n4esngyGOJ9UvXY1lcGNB8YpuyqMWo1RF1SlyQXfdXvPZXBthEyiNJioCgimA7kO7jZSJ8Lr
	mwEWQfnqKRXmC+BJcYJ9TwYl8mLy6cU1anYwHuiN14bNwOAAtEseBn6XrCANlfnY9JV6MaP1//zye
	KozSP00LGN0oB8ADDgVkld2SLRL+WELaha1WP5f1Rvk5Gmwe5BKBzpfdSSSZqedj9qAzunMlZDFXA
	kpGgijjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paO4n-00C3qn-LI; Thu, 09 Mar 2023 21:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paO4m-00C3q8-M4
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 21:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=; b=J7kKecwgJGOgUd9zkjZqjZjmGw
	7Cn9mJ3q3lzZTVgugH2JwIl1JMQwqOvJSrH5pogIgZmm9Fu+f76J0/myJZD7f0Q5oVqlbwMA8CGdK
	uY/CWj5JC5+YbJ0CmUE49jJwQXn41qQDd+wGvJnvKXGA0BEptgdsWIlS5Xa7dvDLYB50Qh48hMkuL
	loT99jlPciRexgC3poA/PmCiJzocKUSx4SIe7EGH/C36aDPrd0sVdp+j9VZQ/nhWnzmkG7cQk4//7
	6q8v22iksOBRRfESC56arsCLRFCygt9BpROLx4Mzuf1GKMdJGSwjq2E4biLDtNYardBXH/2zELU/A
	CAvFUmpw==;
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paNT5-000F9F-1n
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 21:06:33 +0000
Received: by mail-qt1-x829.google.com with SMTP id l18so3621095qtp.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678395989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=;
        b=ekWyusYFBpL12RMJ+xvCmW/23PN0mVoUwpkWDXSBy7uTYlczExZGwqhsw10ZVnQ8un
         PYn6kas62DojHAnFoBGAOkxcdlbOPOB5n0THClLiUdWo7X73bttjjc2jfk3s2H636rX+
         8iwrsmG/RynX1J0PDPXWwDBGQAERmZ5+0UwjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678395989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=;
        b=tdiOdhEy0CD7PWCe0y2Diuo2USnyR6eoOeKHe6KCh7jNHyCZvIhjl0Pdo0mmlfI4xS
         ejp15lAWnNI0Ijejf3xHho1FV39hzSMxXPTAIphdy+YBZnCT2CZkebE624UwMY95EH+e
         cL+8Hb/VaVfYckAfyRtv8I4nWC2Bnhp5Auk+MDlbcR0/Rxz4Hr+oJ0eFQvORv0tK273C
         cXQRghvp3N4UtCCCRg2yiBK9CNhjeGAGY3s2OgvLvCZ8n7HdColYJrsbgr2Yp1pocroQ
         Qz13iepD2mj5Qqwuvtts73Q8r3jJFL74pWaeOcje3pRdpNWKJPKyhu8KVuMZrHSIIbYD
         wMVA==
X-Gm-Message-State: AO0yUKV7ZeCVTd+Xk/Bw7ushnozU6SFL+5qUAQFFQFERPFc/RSlc7rkm
	oK+PH8F+oslGSqVXTMlvGpqbqtfHC8SHz22DpyyEOw==
X-Google-Smtp-Source: AK7set9+cW2dY4lRlZ2wjs/dFqUlUz4X6cE4Ahn/kwSWdAA3QSe5aG9VDxtlu7wjRKI3PG1mzqCYSg==
X-Received: by 2002:a05:622a:1991:b0:3b9:bc8c:c20f with SMTP id u17-20020a05622a199100b003b9bc8cc20fmr49172335qtc.26.1678395988941;
        Thu, 09 Mar 2023 13:06:28 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:a575:2520:a8e1:989d])
        by smtp.gmail.com with ESMTPSA id r7-20020ac85c87000000b003b9bc00c2f1sm14289316qta.94.2023.03.09.13.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:06:28 -0800 (PST)
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
Subject: [PATCH v8 2/3] drm/mediatek: Add support for AR30 and BA30 overlays
Date: Thu,  9 Mar 2023 16:06:23 -0500
Message-Id: <20230309210623.1167567-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_210631_860119_6459918D 
X-CRM114-Status: GOOD (  15.95  )
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


