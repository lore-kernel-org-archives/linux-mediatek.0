Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F275AC5DF60
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E83921929
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QrM39gPX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="XLW1y6CQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E83921929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgIXYaswa0UOaomCxX7qLLIeTQHiD9R2wtDFLhyH4bI=; b=QrM39gPXaEtcDJ
	0tdy2OKKUw9U2m9afGa6Un7oUAbkzr5aZFvIhDISPAPUxpY83P4Guf/neuLOphigDgudoT9wtQKy7
	Q/vPMcBWZbhCAlW3yoiPBPaNmExDTbEsOUBggXbKP7GZzuZPapd6cHevLOz4ptgQ/useT2GArSen4
	x8cEzOl6Z3KG+JW/MbdXmyTi1tstbYuC2mYjPg0NHXbuagJrsE3+Xfxhr5ZChgMYEEGHFYApe04Ai
	M1Vcuk4ZBSK3kf+qGZqrQpyj6oMMftgESE1P+e8l3R/BlbSvzkkFRB1/9ueaXYC5868hvi8i1E/j0
	zFo8uGHIOhSVzzIBwkEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS6BG-0001MS-Bk; Tue, 05 Nov 2019 21:16:02 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS66N-00031p-H5
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 21:11:06 +0000
Received: by mail-yb1-xb42.google.com with SMTP id 4so10001046ybq.9
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2019 13:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsWMYnPd4Aw1CcoU1mvThLbX9TGaEGFP0Ia7fKCg/po=;
 b=XLW1y6CQbRxMSOYcoi5wZSuKszC0GIywu0TVxMMjfwFK1PnNXWKRUIH6TK4/d5kMO1
 /ww32khexerF4EmfttsPK6IEubjlkxvsbV1NZrgKzY4l5FzqonI+/eBp6TEZTCPzs00A
 iGztN2ZPkPUH115D6+aBVICxtW0khGZIU2sJZUOV8N8XRiodrapKWOk78mTGZA+v90p/
 b9tPSxG9B9wJOzQO27Rq4m2HtAEoEfcxFb5MZ3rtqbe7YfLhS+cL9aan0PaflwhRfSnM
 dWXbhFH5Ia/KEA98zjYpIdoCmh+l55LuEdIoIAxUjARlKE626MTmrMQ2Uhdgb9RfG5Hw
 cXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsWMYnPd4Aw1CcoU1mvThLbX9TGaEGFP0Ia7fKCg/po=;
 b=YYOG/fmphzRGlNe1fHFrgCByT4pm4vq5CwHhM0KRaIjYm89pD7TX7wacqdbrgDUt4z
 zXB5hqsafuLGXrhMI1nrlVl0Sy+crfrWSm+qt4UmVLk7wkvX+V3TNgBD14PwxFn2W2ou
 Jqjn46lyT7t1W/ImhRM//4De08wFg2TGSLVU5iBg9WNA+3xR6MBmKGFXDe4HNzP6S3qm
 SycOl61dZ30z3zrp8aNaQlCw7gQJAFcTBqZsHvMDIN5/bIko9Txf2ay1RK5QXrlS5NHo
 2rJ2wqeqtN8RmGB7sQf9VsY4JfQZOOY/houHUxR/D/rZ3uXayqEjLehgUpk/5PFCRvZ7
 V2lQ==
X-Gm-Message-State: APjAAAUDwVubVagvoGwyFR1xT9jgGzF6asYcOWpxN2DPD31vHBVpBoDM
 jnmTOODhwHhRV3SDmr8Q2UJ5Iw==
X-Google-Smtp-Source: APXvYqzOzXSiMBon8QdPw00BMVJRl1tQsrr2noW3epgpCXkqmtMfVGaEK0hFffrZka1kAFUZhMO3RA==
X-Received: by 2002:a25:bd88:: with SMTP id f8mr28380318ybh.135.1572988257623; 
 Tue, 05 Nov 2019 13:10:57 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:10:57 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/7] drm/mediatek: Support reflect-y plane rotation
Date: Tue,  5 Nov 2019 16:10:22 -0500
Message-Id: <20191105211034.123937-6-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_131059_646135_DC2CBED0 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, p.zabel@pengutronix.de,
 frkoenig@chromium.org, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

Expose the rotation property and handle REFLECT_Y rotations.

Changes in v2:
- Move the check logic into mtk_disp_ovl.c since it doesn't apply to rdma

Link to v1: https://lists.freedesktop.org/archives/dri-devel/2019-November/242312.html

Cc: Fritz Koenig <frkoenig@chromium.org>
Cc: Daniele Castagna <dcastagna@chromium.org>
Cc: Miguel Casas <mcasas@chromium.org>
Cc: Mark Yacoub <markyacoub@google.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 14878ebf59d7..fae10aead3d5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
+#include <drm/drm_fourcc.h>
+
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/module.h>
@@ -50,6 +52,7 @@
 					OVL_CON_CLRFMT_RGB : 0)
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
+#define	OVL_CON_VIRT_FLIP	BIT(9)
 
 struct mtk_disp_ovl_data {
 	unsigned int addr;
@@ -137,6 +140,38 @@ static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
 	return ovl->data->layer_nr;
 }
 
+static unsigned int mtk_ovl_supported_rotations(struct mtk_ddp_comp *comp)
+{
+	return DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y;
+}
+
+static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,
+			       struct mtk_plane_state *mtk_state)
+{
+	struct drm_plane_state *state = &mtk_state->base;
+	unsigned int rotation = 0;
+
+	rotation = drm_rotation_simplify(state->rotation,
+					 DRM_MODE_ROTATE_0 |
+					 DRM_MODE_REFLECT_Y);
+	rotation &= ~DRM_MODE_ROTATE_0;
+
+	/* We can only do reflection, not rotation */
+	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
+		return -EINVAL;
+
+	/*
+	 * TODO: Rotating/reflecting YUV buffers is not supported at this time.
+	 *	 Only RGB[AX] variants are supported.
+	 */
+	if (state->fb->format->is_yuv && rotation != 0)
+		return -EINVAL;
+
+	state->rotation = rotation;
+
+	return 0;
+}
+
 static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx)
 {
 	unsigned int reg;
@@ -229,6 +264,11 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	if (idx != 0)
 		con |= OVL_CON_AEN | OVL_CON_ALPHA;
 
+	if (pending->rotation & DRM_MODE_REFLECT_Y) {
+		con |= OVL_CON_VIRT_FLIP;
+		addr += (pending->height - 1) * pending->pitch;
+	}
+
 	writel_relaxed(con, comp->regs + DISP_REG_OVL_CON(idx));
 	writel_relaxed(pitch, comp->regs + DISP_REG_OVL_PITCH(idx));
 	writel_relaxed(src_size, comp->regs + DISP_REG_OVL_SRC_SIZE(idx));
@@ -263,9 +303,11 @@ static const struct mtk_ddp_comp_funcs mtk_disp_ovl_funcs = {
 	.stop = mtk_ovl_stop,
 	.enable_vblank = mtk_ovl_enable_vblank,
 	.disable_vblank = mtk_ovl_disable_vblank,
+	.supported_rotations = mtk_ovl_supported_rotations,
 	.layer_nr = mtk_ovl_layer_nr,
 	.layer_on = mtk_ovl_layer_on,
 	.layer_off = mtk_ovl_layer_off,
+	.layer_check = mtk_ovl_layer_check,
 	.layer_config = mtk_ovl_layer_config,
 	.bgclr_in_on = mtk_ovl_bgclr_in_on,
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
