Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76727C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOvvIgARuUNVOHHyr7VzHKfHYezsSTPwGh1H17rwJns=; b=ClET6tj27I8715
	BcxYKXRwyv8hWKFnGSD6CaUWA7CsNpXAMv2qFDFQd3yXWlSuiMz2P0+PF3c9C9IdcEpLbmdnpG6y0
	o3rjjjqmaEd4tmxZt5iNL2dv95Gaoc5jheAvwCt5BPfd14AUWtHb+X80VWhIiWzw/Z/2ZLlmZxMSF
	qjgcP9kJrdfSZxcNEwcOvI8tm8buuQ3mHY369XtUOjc88Cyl5Ls6dLAxEL9QVwlsDJrT5HzrWv+mH
	TdwKql5/vhZ8PsPO6G/STTbreUd9qR5YAoFc4Emw2BHpj7el/e99Sg8j8tx1HPbWMSTUdfajeY8o0
	6LnxP7ybNrOf6X3Nx5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVHz-0067N4-FS; Tue, 07 Jun 2022 09:14:15 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVAC-0063E8-MI
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:06:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so14875952pjq.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=URQgL2yUP1UPEGjFj3Vtkw+GlIVy5pPiHox/tAieZas=;
        b=KkdhkZR0WaPbNGFjnV5JiCzsW/4Td/Y1uAFcoXb7bs6qedkwYqr4useNkOhECnjn51
         Aq3h7Q9o6cOxgUZHsiYDmtF1268mVFmhpOCB/F3QQ8y02faY5NkR3KYqvXQzUO7cqmiO
         2nqtwa7AfOlK/1DOFkxqwBsRQTuz59g/WYL28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=URQgL2yUP1UPEGjFj3Vtkw+GlIVy5pPiHox/tAieZas=;
        b=PQh/dJ4IqOS68m+3J6LLeIRyj4BlOY87eICi+YRpyKcF7Au10/LdYMJ9aBvhwYAtRW
         5zSm/2hMJQ3FC4KiO7mx9KUR0z98dW4TJDMB7haJdMkLN6seSwurhTfU4DYzy0D90euP
         qkb6iELhQiaY8ED7SOFZSwjabB8LYvcAfq7VBFSRafV1ArqNHETgonkPP6KFdQ2VGye7
         wq9nrJOiGhN+kJbyuO1fBo8Z3DGBWX8FIp7iND/mRbLFyQ5poDrH6/Fg9KSIPzsUTzLd
         x7Nu3EQ2isMP1QdyITDFYRJM7Nj6nd4fkOzEFJucoWIjhg0I0MpRsaqCtL7OhvZbk2eU
         rnKg==
X-Gm-Message-State: AOAM533tGR0JW9/Jb1lhldQJ4AC6h6FsH6K/Xq0NyhDuPUYqzVAYsQqB
	54GN9MPOCVBPL27xK2sSv3T3YQ==
X-Google-Smtp-Source: ABdhPJxUb/prMt/A7sRaNQTJtn9oWDj3rVo1IOvfLfcAgTaDday8s3jr1NXmj+cqqrwS88WfrUyMFA==
X-Received: by 2002:a17:90a:8b93:b0:1e2:728b:1fa9 with SMTP id z19-20020a17090a8b9300b001e2728b1fa9mr31329972pjn.167.1654592769235;
        Tue, 07 Jun 2022 02:06:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:06:08 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:45 +0800
Message-Id: <20220607090549.2345795-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020612_786553_8132AEE1 
X-CRM114-Status: GOOD (  12.01  )
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

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-lvds.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index f11252fb00fe..7a4fedc63e8e 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -99,15 +99,28 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
+
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
