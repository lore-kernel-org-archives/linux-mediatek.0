Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B94BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dVSQO1a7mgd1BClHt8yPjeNZXa1hyaaNV6tcyEhwO8=; b=akv4Ptv5CO1ahs
	VAaAMON7e7WWcwrBMe6oy5GG+HrixXpBvUFcH3cvl+exYJ4x8UFiW41i3EJvzH71ykkbTkJ5t5bg8
	Eg53f2k0obtFjoub6C+inCQe7U5rw0hrnFZ0BfinLW+PkHOijuJxb8ZlR2QGi7tmPj1jiSsVuWLQc
	LGGFIwuGesuNesr5Z48tDdEtiy+dpD6VYX6ld164F1vdeDA/AQJh2/1xKXxO7jwwC0AvOj9eVdjRr
	fbgXAe7A3HYZlLBgRgjWxCw5/8wdGGXe5ZUFZ0VwTNmFpTlziJdl2+rTHU1ueGGKSe+z5/wvHlJXu
	FjVolI+uNEJlqrT6v+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvade-005tEH-Jn; Mon, 30 May 2022 08:20:34 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaci-005sp1-Qa
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 08:19:38 +0000
Received: by mail-pj1-x102f.google.com with SMTP id n13-20020a17090a394d00b001e30a60f82dso1346888pjf.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DngeuiJs1gkZdqFRMCVvHoL93k8N7yG0MeWJK9ZEK3k=;
        b=IqL1Mg8WnZDtXb3yyaSQRaeibgzLzDCSjzxs2JJ81/LU/mT9HMq1woD+CE/FphDXTH
         GnabHy2Ip2oVOYcPjiQ1WwYT2VtY4CQG3boKYbVWHxYOBjBrj1GEcBMoB1z1qeA4GCV1
         8WB0hTYwZDmiOgIt5tnLdJsOq3i7hVAzVDu9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DngeuiJs1gkZdqFRMCVvHoL93k8N7yG0MeWJK9ZEK3k=;
        b=SLR+OXnIXt2MmRIpzKx1eDk4/ggTuvS1/emeEhl3WxZxxmlOmn3GiL8jXz3jU04Etj
         jh+q4nSwXllw5L33L0WiDI53zdu/fNzEjOpZtYiLUxk5vB50SwmyvBtv7+TcquP9u+zq
         6ozehMad4p+lnC3TRWjHx0n9yaVF6lXSbyxEEmR0lEspoQsoqD7uZnK0+3otFjynuZkU
         rWlnTyh6hehs8PRhVHIu4GIXtH7CgKaCoLNVvrlPYRvJX4k7fIo7kMVj890xdm+eeoDJ
         s7GJn6o+fmxgAyUOhPJt2Czx7UbgyYxe+fuElQPbarghIHJGXl+xlizhl2M0H0BPbu0i
         EqaA==
X-Gm-Message-State: AOAM532FrRWk1Si9Em+6RH9c7AqKlXIQ5zS6auT6IUS8OvQRr8zd2X3A
	KdOOC4nHL+vfPWWGMr0YGUfFnw==
X-Google-Smtp-Source: ABdhPJwMisSwwoUx/1CnfaxFxra5CHlr+0BrN6Jv+hKSLKGk6/BuFuOZ6hgtXERtcSsiW+uir2UNtw==
X-Received: by 2002:a17:90a:6941:b0:1e2:f37a:f889 with SMTP id j1-20020a17090a694100b001e2f37af889mr5209221pjm.160.1653898773678;
        Mon, 30 May 2022 01:19:33 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ae1c:3d63:abec:1097])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902f64100b001618b70dcc9sm8537900plg.101.2022.05.30.01.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 01:19:33 -0700 (PDT)
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
Subject: [PATCH v10 3/4] drm/msm: init panel orientation property
Date: Mon, 30 May 2022 16:19:09 +0800
Message-Id: <20220530081910.3947168-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220530081910.3947168-1-hsinyi@chromium.org>
References: <20220530081910.3947168-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_011936_889017_448B29C0 
X-CRM114-Status: GOOD (  11.77  )
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
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cb84d185d73a..16ad3d8fab4d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -669,6 +669,10 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
+	ret = drm_connector_init_panel_orientation_property(connector);
+	if (ret)
+		goto fail;
+
 	drm_connector_attach_encoder(connector, msm_dsi->encoder);
 
 	ret = msm_dsi_manager_panel_init(connector, id);
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
