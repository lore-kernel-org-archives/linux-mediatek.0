Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9B4C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cc1vOdWtwzxjB8Itoebo3PGpOUY7+SB1sP8jgG5BLo=; b=Y2SohT+D/SHveF4snFh3H+SJfc
	zKLTPLnDysYtrM4nJBkELPGHEH3BMXKWVW/6xe0F3mOcvm47i6UZdbD8T7OziaJ5fok2M/e4uL1Kl
	Wc7XJ3UQLJkPSuXZaB2wbUnsxzWUtDAfulfKzqgbEFn27Rl9w+xBZqzpNEoeiCSwKB1OTTMGdlVtj
	C0jn3OjnFKg9jbITuQIB4JZksHC/N0O90SFNrDlt++w2wn8TZoO8D63KT091sKFn9xAcaorI273+8
	h+zB9d7l2NH3aQGCFrHoxRiNoygdHrgJHMmW9DuBAlG2opf5OnAQbkVcIn6mTtm60YC/aPcOpPgLB
	kgXjUfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGVI-00Cws8-PG; Wed, 01 Feb 2023 17:02:36 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGVD-00CwlM-GJ
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 17:02:32 +0000
Received: by mail-qt1-x82a.google.com with SMTP id bb40so10162349qtb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cc1vOdWtwzxjB8Itoebo3PGpOUY7+SB1sP8jgG5BLo=;
        b=Vx4yU+Sj4JFqsfCfjWK/W6R96a4AK2AznqfWmnIWtfkW6PsajbnDfuTpGP7tMZ04S/
         M1/HXtoMh/wA9pivy2Rnw0Ac5NJBcq5mEJzJOjv2ZO0+CXMmGueor7lWFQtkDdvKJBy4
         /4jnd6hpZP4eDq9yBZd4NQI0m0eyo5+ADvUrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cc1vOdWtwzxjB8Itoebo3PGpOUY7+SB1sP8jgG5BLo=;
        b=C7k1em1n++bi9h2i3PXvfLdQK7IbeAH1sP3SHved4EZBzaPUbkELzLCvDUnGeA+yCh
         UePSrSIk2ixyT8QcBsyPue+3dPxNgTvklbnUT/Poy/S2h+Hn8lP+K2li3AwqpFAhReM8
         1DsRVnm8LMmH1QPhz20YQ0+mpJcPnUZvmMgsgDOYsERQWTzmokNp4b4wMz25SxxmQbMO
         ezt9esz3aavYgRXO7Z6ricSZXXhyXrS5WRAKffsN3dnuwp5Vh7xrQ6X1PDkuXquLUdrf
         ARY9SYjLKyvVVs+1UynIfjaBgEnDllf3PvRQZKETq8NEoBPDxEujqxFJVY9N0V9Pqwt+
         99VA==
X-Gm-Message-State: AO0yUKXcn6Gu16x6O+Y8DvdYOGaLcR3YH9Di5uHFcUMArdhCULfIaZ+w
	2Zt+5Hg8MdRf02S5sp4ZXtk7RqWheLHmJKeN
X-Google-Smtp-Source: AK7set9RwiJUfNVKI3TuTIMqUyXDZ5F4xiGpr/SUlKizJWISqA3RG4SDl2/gk8bLulVeqTwUsZDSHg==
X-Received: by 2002:a05:622a:134c:b0:3af:ba3b:db80 with SMTP id w12-20020a05622a134c00b003afba3bdb80mr5199215qtk.33.1675270945250;
        Wed, 01 Feb 2023 09:02:25 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:9334:99d8:1f91:70a])
        by smtp.gmail.com with ESMTPSA id z15-20020ac8430f000000b003b646a99aa6sm5549543qtm.77.2023.02.01.09.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:02:24 -0800 (PST)
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
Subject: [PATCH 2/3] drm/mediatek: Add support for AR30 and BA30 overlays
Date: Wed,  1 Feb 2023 12:02:09 -0500
Message-Id: <20230201170210.1253505-3-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230201170210.1253505-1-greenjustin@chromium.org>
References: <20230201170210.1253505-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_090231_577080_B5C7EBA7 
X-CRM114-Status: GOOD (  12.52  )
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


