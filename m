Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AA3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fPrekUaTFIVOj7rekMo+cgyWoyvy/Es2EoWpjr57P0=; b=cMo7O+7RdPcex9
	fC0BIlH0Lbhl/h36bbqLh0aa1a1SW3GdcDkJ54iLrPFTzgACq04MZkckRwp6o/RmRiTJJTArKf8z2
	e6/sOFrsKjIq/EFt6Ikc2W+i8yK9rwCklD4z0tlwmNIJM+Mxx/1FnBB7T1NjUefjOqGttH/vYGwmr
	wmvRCt8Ks2+hQhdiKPgogVC7CugCZa9GJ3k8+m76/+9ltNI9uUSyBY8rvp4Za60vX5dsLlgxf9E+r
	C+ock5idIacl65cAZ3jfGlxL44twNSgNPXXazsJZ0oFCupuqsOyXr17SyYDZTw53ryVDsSBCPKv5L
	F3V7APc6evJTSlU7niMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL7h-00F5fB-JY; Wed, 01 Jun 2022 09:58:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwI-00F1GZ-Pb
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:46:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id w3so1270053plp.13
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZBqJiw5iICb15XSMEIziFVB5wuNumdiuBxaQCMR6NjU=;
        b=AQSKii1jvRtBpq0Lrpj8ovAJqJPE2589nykaQe03mHf8JaCrY3Z4O1XawIEbsR/4UU
         PxLNY93/gtlAHrORYa+QAoX+Tb6aPH+1e2spp2tc7pfScCEf8S8gOf1+2pzvef6Lvi4o
         Vs3SdULDuc7uOWfaH/zRnk8xF0Wbjb+VseM+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBqJiw5iICb15XSMEIziFVB5wuNumdiuBxaQCMR6NjU=;
        b=W99K5Ta/bW/vmQVkpxWI8vfhqH+1dzwvLSFrB/arOaBcmxZkZ0/juJzsI81NgjLj0S
         el2akRBZxRhENehtXrlbWhyD3twfJm6BGG2aVRyTJJf6XX+CgZ0A+S1RAhxnUD6PaJGo
         3VZ6pg9PCCbBYP8Bex9ZW+uJEKNnmXkNZkQDBaC58WVIugwkXW3J0qy4gYR+Wr1X4k0n
         WcFv2a+hOxQQYK7mJvCwBWHF2KfpfB5RrwMuy4yIISO2g9BdLXEb30Ibu+r9VzeQIBll
         Y7bflShKH3nevBhoQ/fsPrM9xPjo9sm74ROUL0OPub4Y0A9oRAqVdZscIeaaLaSBQhFR
         07Og==
X-Gm-Message-State: AOAM533aQ38K3D226TTu28Gbr0i8lq2u4W2lZv4klhuF0T8majfzOu2R
	3PUmr+9xFz7QOYP2TTRjXPGOcA==
X-Google-Smtp-Source: ABdhPJw72ka+6aqP/KnDSsfh0kJMmqQ6I49pRZC2aCEKoh72sgZsPQ9ORjmrG0OhkVOV4FFUNg74Gg==
X-Received: by 2002:a17:90a:6308:b0:1de:fb6c:5944 with SMTP id e8-20020a17090a630800b001defb6c5944mr33599246pjj.60.1654076814431;
        Wed, 01 Jun 2022 02:46:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:46:54 -0700 (PDT)
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
Subject: [PATCH v2 3/8] drm/panel: panel-edp: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:32 +0800
Message-Id: <20220601094637.1200634-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024654_877537_8962D251 
X-CRM114-Status: GOOD (  12.31  )
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
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..a2133581a72d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+
+       return p->orientation;
+}
+
 static int detected_panel_show(struct seq_file *s, void *data)
 {
 	struct drm_panel *panel = s->private;
@@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.prepare = panel_edp_prepare,
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
+	.get_orientation = panel_edp_get_orientation,
 	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
