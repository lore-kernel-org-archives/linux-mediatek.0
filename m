Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB95C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb1+fNdQynOjNq5qyDBFPOoDTlpkOLrs2Li4tbdPy90=; b=TUKGWvVW0S2Qhx
	lF7EHoGrOyBPsAcX7/8UFL2vNty11sKCgkq6r+dG/jpRDDBR9qhGDF4lyJjssbBdf4y38Hhs5ebmM
	qNTC7vTWnJaRgpxsQQYlKFLWkzaYxMKDZJBNx7B2+XHwwWOYD6TDUSAw7Yj+SNhz9Z6d+7k4nVRTU
	Ism5hDRBSpI5yxSM6qj1VNcYN6UktYS0Q21pgABUQmQSsk0OcgjYTQ20N2v3NIg5ESBrY04bRAHds
	slNT0+UX2sTcHYIuShx1kc0VYgOl7lnyVpgitmCYfHKrnh/QQwSgxylrME/Jnba/qMb+adN69cX7P
	C/NK07t9nFb368jvqRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvadG-005t51-80; Mon, 30 May 2022 08:20:10 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvacd-005smD-DP
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 08:19:32 +0000
Received: by mail-pg1-x533.google.com with SMTP id j21so9492521pga.13
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aXGQfQ7lsNUfjhcCcz/m8HUah1p/vDnEfDkpaJXX40Q=;
        b=j7HdUtSWpyZjY31tsETWgaBomYbcUL4NPjLRCEhLhcJhNgIJMPG4h8aVerkAWtdhJA
         6xH+tfkb3bQV9uMkXvjv7squthw5m7QHVK9FPoxGwWesDXlxRpcFVzLVr8fh8Qp0i1Oy
         Cqr4umRydtfoIGytttZl5eX60xAiPR+cvlQfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aXGQfQ7lsNUfjhcCcz/m8HUah1p/vDnEfDkpaJXX40Q=;
        b=0XrJwSQTei7813Ref47FdGI+/9IKxyNTa3UL+iSDRzo3OLKtl+eodtqFm1E/lySpuo
         I/UFANrEEAIeFqkwR0kM1Pg0DyhSO+nQCGDj610T+bNmBC9eM0DO43hI3qaDGDk72Ij+
         hH3pMNamb8vLf/cx2DwofVbiY5WRkoUyc9x1W07WTs/tca+IBUPv4UJ5xfnl4q+J2DwG
         Br3eBf84B+JgrQ5n1j03jOPSn3tUkE4kAidVYZUyjkqqY9OihlCgKUrXO5TNQ2eqHcdH
         f4YszFjeHKPbi3ZWkLUaoVLz7LCjpgKRn8GDKeqd2QXX1XNN9+WXjc2DtiA3JnKHs4K/
         gjWQ==
X-Gm-Message-State: AOAM531JV2sUOW7/8u6wVZoqHFEp79/nrM1B6zKpAV60xnMye39qhgX9
	3DAuiK6MfadmxTK6i70a3Uf/QA==
X-Google-Smtp-Source: ABdhPJznWw2scunjHm2cr/VTVq8k2dY3+xmqHFPQlQtp4K4hBNUYcOpZOCvf/PBzDXdbEYlNMCt0bA==
X-Received: by 2002:a63:2107:0:b0:3fb:ac79:50ed with SMTP id h7-20020a632107000000b003fbac7950edmr12877684pgh.105.1653898769559;
        Mon, 30 May 2022 01:19:29 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ae1c:3d63:abec:1097])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902f64100b001618b70dcc9sm8537900plg.101.2022.05.30.01.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 01:19:29 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Emil Velikov <emil.l.velikov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v10 2/4] drm/mediatek: init panel orientation property
Date: Mon, 30 May 2022 16:19:08 +0800
Message-Id: <20220530081910.3947168-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220530081910.3947168-1-hsinyi@chromium.org>
References: <20220530081910.3947168-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_011931_484225_F53F9B38 
X-CRM114-Status: GOOD (  11.68  )
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
index d9f10a33e6fa..3db44d9b161a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -822,6 +822,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
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
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
