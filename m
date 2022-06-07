Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jVThZwmtm2YB3WtcT8xAdBqFQFtLTgOaxw6SM3Bc/k=; b=WvWzjF/+E05Lud
	5zqK+0qoV0s3uWEhSzkl7OO4qvVejvSLJKVwJyLFinYZXqg958Qlp4z2NyhHEicBq/pSmicmlCVhP
	IvTLVxHdnM8rLtqgGRr8TGaiqBUvo1xTzfk5ErxTvq/P+jRuE7tqPBtqZKeglmPJXiufVAL7Dsaum
	k+ZyLfFNQJ28bEXhKX8JQDULi7oiF+3954RsuxvGDa9is6tmwIo7lb27rdZ9AtF9X1KP0VJV9GxKp
	jgYOiEYj1coOrjDC9FN+lxl7e+jDQqpt2jq+INFYsKKg8srvZVFLuSH7L8HPH+6PClHWC/WR9lpb8
	2tWtD6vOxaW7DT7FmpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVHv-0067La-Mx; Tue, 07 Jun 2022 09:14:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVAD-00636l-9d
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:06:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so20290309pjo.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hkt2l/tO7WYacCl3ivjTi6HGPHGi5NrMwDGXS9zHi3w=;
        b=HKI56lq5igyQeKgyyIqASr2VCu3+pT9siwjRtEo3q3xCuBFlEAce2uIG1aG3NqbRxx
         Bi3f+3QlYQIFoTudRE/CoNXXS60RYvhisuyogmtBpm8JNYPyLJm93E7hUNq0bPE7E3wr
         MzH+y1JYIRGuCPOgZlP7fGUe+7MJkLeNMCFkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hkt2l/tO7WYacCl3ivjTi6HGPHGi5NrMwDGXS9zHi3w=;
        b=6wwpf41ucNJr3GxMAFkEvXc5JsuxZtH6MC8nGhljwGpoksugZ+Jl7SIOyfa0J8qpPy
         6GtiFdxzyyJ6/0EkS50rhLfaVhZSBOsC55/vL8jRmdikfnVFiNTcrBUFPQkMCPNDQKwp
         6k0O67iTIttDO4rxdNNOkXgLeuNeFQ5ti8QczbVIcIo0h9cAQHwd5nyzIhXi7tRuIVj0
         sIH3nLE2B5u4xaBVV0KGWcyg30dGIXfmJjlqLnEWK9L3u0lPXQLcrJCwuY9yUtmnZZgF
         lrrEtMyuoyqPmwNl2bG6SjOx9HbPzzYaUCdyJaVpFbsKoI42pmkyli6/aIONORsx74lh
         2drg==
X-Gm-Message-State: AOAM530O5J9fIDd2kmXUgb5c93ALS7x2YOjxr5fH3VRs00Xdsj4CX0nW
	E5Bmt/ywXgXc93TQCTZQQoJ1nw==
X-Google-Smtp-Source: ABdhPJwQgiNLMIZtppqeYqzT8XKH3y3+vFRRwA/niksJDMFoL3S6gwS/5deq8RA1segUx7+d/t8x4A==
X-Received: by 2002:a17:902:d4cf:b0:167:735a:e7a1 with SMTP id o15-20020a170902d4cf00b00167735ae7a1mr12121479plg.161.1654592772767;
        Tue, 07 Jun 2022 02:06:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:06:12 -0700 (PDT)
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
Subject: [PATCH v5 5/8] drm/panel: panel-simple: Implement .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:46 +0800
Message-Id: <20220607090549.2345795-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020613_369563_727C9C36 
X-CRM114-Status: GOOD (  13.03  )
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
v4->v5:
sort callbacks.
---
 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b..b4b919525189 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,7 +411,10 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -434,12 +437,21 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
 	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
+	.get_orientation = panel_simple_get_orientation,
 	.get_timings = panel_simple_get_timings,
 };
 
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
