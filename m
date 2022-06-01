Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C264C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn7HHoNe6nWwOn2umy4mA/NBVEdFq8PCYckBOpiZw1Y=; b=sDd7cGubfeeb67
	9hf+vHWY/ffByl0u8y/L7qB6hub3zl8IgFlpbKux42e5T4l9kC3pNNTp99S+pYJcKmWaC/mTtTtaZ
	/wMMvhiOBBCrOz/jqZo3d8i6NKC/IMb/843oFllmIYGlvtijTDwI4WF6YKlQ+zZ8x/c5E/VC8l7cV
	J7z6sFevPsLgwLwHc3hk4TrYBZK0Q2WKkmjDCgFA8ApjhOJsnOvXLWPVLNrPRs78x0w3JdVUo04hv
	3ga6LwpayDWjy+JLkXn4nd9Of4JFQb9MtKL+LrGW+BSkn8avl1mtTGVIbcL01DOJhtONCm4TZrxzi
	GJWwOgaMKj1Cgl/tOHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJbg-00Eblr-01; Wed, 01 Jun 2022 08:21:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZA-00EaQU-0G
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id u18so1111545plb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xeMLg+35N7hSrKTKnxWGY/ydjeaKMZYeAKhgclNfW00=;
        b=QnX8EAqj1NdSiodi34RQfAUVxRFwDNNVr9xsWDQow2cE5INydMl18CERAzjA7RQN9L
         iyrE/btER8fTucQ5/nH8nOa+GoOQ9wwDukPAOPagcGYHZmiKcSWDkDl3u3+Kw0OY8n8L
         b9x8pOz1UR8mWvMu4W3ha9pWcmlyQb2tDBHP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xeMLg+35N7hSrKTKnxWGY/ydjeaKMZYeAKhgclNfW00=;
        b=o9VrLhobxWOMzJLyX3gg/QOZs0655FdYH7OF1y0faKEi1yt6ys4iotmP2hcbsIsEfF
         zmIdSFc+FQ2hUMy0lDzWwlQOCHnmrZuZS39ggUbS21CNWQxhBs2gzztw1QurEaeiww8e
         CcenFiVrHGhrzQalK7gmbc1fuYpTk6rSWnkooSj92dzWrXiXfCRuu65jGNl3pZ9xs1Xq
         hsWBMT81g+b+F8QomxVVzFaNcShIUJcUTjUhYj08UGyBIi27YC7QqStnjRAl6YaJhIhj
         qhBFeJnZwE8C8OaQpIJuawelz8XR7E3SjXiEjIwCGUS4g8Dg6BGhFyXbsZUd3cbrxjuk
         StvQ==
X-Gm-Message-State: AOAM531GqvVr+Po3PGvbIq3KuPc9/2JpPrtfDtPgmAnWAoq3OkXbKiPM
	e7yKIS+xsXQ+jsXWafXsCdLdYw==
X-Google-Smtp-Source: ABdhPJzLVGMo42m5euNK4kp07ZocNgWlb4mGFb+T8VtJCH8enEAQQ9fbe9dx6N+5RtJX12cxrzs+SA==
X-Received: by 2002:a17:90b:4ac9:b0:1e3:1dca:d995 with SMTP id mh9-20020a17090b4ac900b001e31dcad995mr11560854pjb.111.1654071535681;
        Wed, 01 Jun 2022 01:18:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:55 -0700 (PDT)
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
Subject: [PATCH 7/8] drm/panel: elida-kd35t133: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:22 +0800
Message-Id: <20220601081823.1038797-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011856_086371_1CF752A8 
X-CRM114-Status: GOOD (  11.86  )
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
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..079ed71f660c 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -222,10 +222,18 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation kd35t133_get_orientation(struct drm_panel *panel)
+{
+       struct kd35t133 *ctx = panel_to_kd35t133(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs kd35t133_funcs = {
 	.unprepare	= kd35t133_unprepare,
 	.prepare	= kd35t133_prepare,
 	.get_modes	= kd35t133_get_modes,
+	.get_orientation = kd35t133_get_orientation,
 };
 
 static int kd35t133_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
