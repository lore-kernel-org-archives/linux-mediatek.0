Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 07:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouQnfMJo1CzXYkmmlUtYU0LD2amGMRW8DMKSiE4Y14g=; b=T4xWTzzO5XPXLT
	wEsvkCzCuRK2dos421Hjx0lJejEupuaqFLY+hpq6sxwcqYxYODZPhxg6fkOoaT9NXGv+BBQUEpIsl
	PKDaRhU0u8iYD0wmsaqogJ4LqVHNcwP42RoXc4wubnJlhxgt7Pw8O21o+Jc9VWL4TAG5th3l4+Ptx
	JGcVVhfFRYXjIM5JAyLR1lECxU3aBJFBC8V24bQUd3RNtFCcMb+Wandqq8n56pznvTRQzEz+5nyRl
	ljORvA6SeQpuf5tY9FXnuyyBrCFuDBwboCO/YPLLNl9A0qLPMb0nUoLuvkWQ11mTz/E9oMbCBW0pR
	P1K+J4sG8E8b2ouIsGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHL4O-00Cn7v-DL; Tue, 08 Feb 2022 07:37:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHL41-00Cmw9-6h
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 07:37:26 +0000
Received: by mail-pj1-x1034.google.com with SMTP id y9so7798673pjf.1
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Feb 2022 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B51vztbAqanx3odcGYslN+f+8QXuSl3IGdZkOcgCEP4=;
 b=B11JIsqRugzE1lPzLbVrLBxQRW5fnSgxLSLKgwr1IROc+g9ZzYhWrC1z2DTdGwYxxc
 zTZC5C6/ehGlzMo1J6qtuwveXNMaFeY7njbnbEiu43w4jwaanMcHAXwYob4oTe4haPpH
 OSqw2rNF9vvlgVMfdSEmvclOIi10EZASOCcpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B51vztbAqanx3odcGYslN+f+8QXuSl3IGdZkOcgCEP4=;
 b=KmNiHPkd/EjaduVTyr0Fkzfp9yyDG56FAYt/dxsMh843yp15ZhJ8vJmn6ISO2pHzQ2
 rNwpcjrw4DFtSQsPxcdmcphoBT6K0okcDj5EewiyzgY/zMqmxcxi+WcsNh4AtNF6Zbsa
 P4JSQUoHrKY8XNBPzy2pPUzhjfDCgRDxzljTCKh6ItY1MsEujsE48C3gvHRoSpBQ0ahF
 zmlSgyGUyioFe4wTDvoQfR4bWwTA20bFvDhq2/K/gpq57c3DQSHmqZMORd5CV6Qpmw8u
 TP4zYvmkzjZitZX4dH2YohKPsalUOLcEn8Xj70Ul63HaSqaopjRiD82EGrsjp8l+EE8s
 q3zA==
X-Gm-Message-State: AOAM532fPtqqiVZCGw/aQgQ2d2R5GHTdfNBb8nj+U+IcTwEH0Dgs4rSg
 HYv7pegsalLVz5M9TAM7CNs4oA==
X-Google-Smtp-Source: ABdhPJxwrTpJBtY7yw1Sd0APOFBVLEGy3Kepc+/jvxRR/t7rzd5FBc9Yf4VRdbT05jYEsKVObL+Oiw==
X-Received: by 2002:a17:902:7609:: with SMTP id
 k9mr2997567pll.143.1644305843446; 
 Mon, 07 Feb 2022 23:37:23 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7d9a:166e:9d34:ff4f])
 by smtp.gmail.com with ESMTPSA id ip5sm1677243pjb.13.2022.02.07.23.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:37:23 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v7 2/3] drm/mediatek: init panel orientation property
Date: Tue,  8 Feb 2022 15:37:13 +0800
Message-Id: <20220208073714.1540390-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208073714.1540390-1-hsinyi@chromium.org>
References: <20220208073714.1540390-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_233725_251482_043E9E34 
X-CRM114-Status: GOOD (  11.16  )
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

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb001935..491bf5b0a2b984 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -965,6 +965,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
