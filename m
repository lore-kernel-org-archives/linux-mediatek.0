Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD03C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w7GVZuWR+axjsCFF/DSyrvOAnKxVsByJzTCz3fyv4jU=; b=HQG2UMxW2DRN6g
	94eQ/8CBRt7fFwLNFVrkAE0G6w1qjfg6o5iMCCzUx5+vcgge0pMiCW3kTDu+MkIggwZDjc/nIhFUn
	FqQr56isRLR5LRCTEdfevTd0yfVpfWCCdmAlHkHaQmzN1M8/U3eO5kK0PbRy53yjgZAAEA0+v+SPH
	XEC4CHYcZfsGcjWK7LGdPer40hjgzAPCcA951Inks7bRvA9hkpBejxd/69Gn1sa8a9kWvQIz8Uusw
	Z/lxgHRS+os4JJojyvdtOI2iSx2kt4StsQuuwUJy10WBbYXgk+dM7HI8CNz9MsoJcaAq3/1d4S1lR
	twC2Wt/CzauXPFVT04dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv2KE-00DzR8-6L; Wed, 08 Dec 2021 19:09:58 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv2K2-00DzNn-2t
 for linux-mediatek@lists.infradead.org; Wed, 08 Dec 2021 19:09:47 +0000
Received: by mail-qt1-x82c.google.com with SMTP id o17so3173666qtk.1
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Dec 2021 11:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ji1mvPknDhdOmYpOyzWQYdOGcoOMkKQYqnM5UxcNn1k=;
 b=ePGN+fQlX9ZDIDadtyh99MJ3jIvTxzM7/e+8xxksGts1MB+YbRwB7PtErJtgiJRZUj
 7sVewD/SARtWcJruveNmgDsYVgpggb3vP8zYClqZhlU008yWZTGp5bKP68sBXSVSu95O
 cbPI245hJgs0z42jAvVCw6WSxuVQe/r2Yp+To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ji1mvPknDhdOmYpOyzWQYdOGcoOMkKQYqnM5UxcNn1k=;
 b=lUYrFu9P0V9156kXInoifGPs0QQ8Sked7SLlbNY6FnqIIs1OV+k7tdf+ZdsscQ28lo
 lA+xWsl2E0jSnRticJ3NDfOZT+1tx2E67jRMXMLybYXYNWjSBNSxYfGcWcXwBrMOUBlQ
 vI7xfAk8ZR6M+PA5mrxB6pO/GF5e7R2lcGZbGXBG5MpYdkSqwZUrwaAUIy8Kem5+slSI
 7PUuQfZa3e1/6DwwlrpC6fBFno9Oa/ho6RkcfoqmQJCKt44UDdE3kGwy/CfmrMQkJtRr
 L9NG25jLzqxhEO/LOa8sGbrgcOmyThu/WZpE7j5TbBImrDqazz54+AwpDY/jGyLpSgsX
 FPGw==
X-Gm-Message-State: AOAM53294kt7/+/dIiCD/3o9OE+KjYi47/NBM0SaBAF94/J4sHMhVTEJ
 O7tRikSHGvLe4NDz9fTcQHj6Qbkieg78O0+Y
X-Google-Smtp-Source: ABdhPJwfE5wTjaJrI7YGlf6iH+HGfN7+U8y+ErYNboRLOLubGkSlxTFlPcGBO7bO0YjTYP1fRWb5Nw==
X-Received: by 2002:a05:622a:1c6:: with SMTP id
 t6mr10311770qtw.211.1638990584025; 
 Wed, 08 Dec 2021 11:09:44 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:eb6e:9a77:7a91:9461])
 by smtp.gmail.com with ESMTPSA id o21sm2142939qta.89.2021.12.08.11.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 11:09:43 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: seanpaul@chromium.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, tzungbi@google.com,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Validate the CRTC LUT size.
Date: Wed,  8 Dec 2021 14:09:13 -0500
Message-Id: <20211208190921.128702-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_110946_197007_AF4CAE82 
X-CRM114-Status: GOOD (  11.21  )
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

From: Mark Yacoub <markyacoub@google.com>

[Why]
The user space can allocate a LUT of any size. We must validate that it
is the expected MTK_LUT_SIZE.

[How]
Bring the .atomic_check function internal to mediatek driver and check
that the new CRTC state LUT size is equal to MTK_LUT_SIZE.

Fixes igt@kms_color@pipe-A-invalid-gamma-lut-sizes
Tested on Jacuzzi (MTK)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 40 +++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index f47801737b88f..82de83656d159 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -54,9 +54,47 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
 	return drm_gem_fb_create(dev, file, cmd);
 }
 
+static bool is_lut_size_expected(const struct drm_device *dev,
+				 const struct drm_property_blob *lut)
+{
+	int len;
+
+	if (!lut)
+		return true;
+
+	len = drm_color_lut_size(lut);
+	if (len != MTK_LUT_SIZE) {
+		drm_dbg_state(dev, "Invalid LUT size; got %d, expected %d\n",
+			      len, MTK_LUT_SIZE);
+		return false;
+	}
+
+	return true;
+}
+
+static int mtk_drm_atomic_check(struct drm_device *dev,
+				struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+	int ret, i;
+
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (!is_lut_size_expected(dev, new_crtc_state->degamma_lut) ||
+		    !is_lut_size_expected(dev, new_crtc_state->gamma_lut))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.fb_create = mtk_drm_mode_fb_create,
-	.atomic_check = drm_atomic_helper_check,
+	.atomic_check = mtk_drm_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-- 
2.34.1.400.ga245620fadb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
