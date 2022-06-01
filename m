Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40B8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wH+yWYku1TLr47atrHh5NvMibwLUpnmAiOOuhwQRBFE=; b=pspUvR4em2u558
	Uy9zdYtGp8gThoClRdtaiK94PeKDEMljR4jNYk9r43m4WgoGwc+2N2hxTUHfDqhZ5l5h0R+hM6uWL
	BUtLuLO21IJNQJG0Rj0KrgGHAwQ7aMMOGTNArwMOeSEkLKN0Lv/pKakLzEDFRnZ05cr7ALdDOv305
	ijKNimZZmZEPbb+nmXRcQz5L2+SY992+8wmfhyjZd0kE0/qtirk0rN1Bw9u1Zx+WlfrQPWoEbx9Bz
	CNzB3iN4yKc3aZrDGgkk7Vo6KWkHDsfQvOjYAFaaBerg0PY6gZOfplg/JJRqr+mSOQuvi/bZnTP8h
	mZezqTCMZo65OCPkCiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLCH-00F7fU-Ox; Wed, 01 Jun 2022 10:03:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwT-00F1P7-1C
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:47:06 +0000
Received: by mail-pj1-x102a.google.com with SMTP id a10so1522972pju.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jVLAPZRG5UqIkFmmis3uM10FnfT5Ljau+xefKKOpEpE=;
        b=OE93Xi6fuFvNjrUPzVoJX4DICUjzwZ0FrNbASk4QhkljwjjdO/t0+U9bsHLt3Nq16+
         2jXyFGb9vQV2JODWz1J1HY7MqWvFdGQfxoZCRMPGD0flte9sS8xfM5OvEXrqzlCd8Bhi
         wM7/e6IqFwZwACP7InwILEx1YGycyNgsKSh5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jVLAPZRG5UqIkFmmis3uM10FnfT5Ljau+xefKKOpEpE=;
        b=jLYoGciXTFBM2oGU3TWvJmb9uhZGubSEYP4xEbTzZjF5boBlJ/LIr8wjqqMtSYpguF
         bydBicGY3dOQ+IvavJ/2qJ6y3BZZg2v9KFS8ppkgMa0uN5o/7jUnbaFQYVwIrzq4Drv9
         5gV5YfQ/E8AC+isCqDalDCGVIe9CWrUyjCuPJosn8m6RA/LfjFnRd+TXj/WOMmOG8ps/
         MKhwbZ7hxQnEkfPx+9sWziqxm33kXpXN3SChaSwYXOMKrD+6mfUe+htK1zm7wcAnLXUT
         JZHrBLNC1iNET1E/LC7MaTWbfa8T08kbfEgPHTRmgdM64+ZOfj5m/5yYncelN5/D0eQW
         RA8w==
X-Gm-Message-State: AOAM531l0HymGj882yiXKdTHXKTR9+NyQjYr6+4mETd4ANh4fX7JfPPf
	bQJBQ4I7fHdAkq2fadeZBeupsA==
X-Google-Smtp-Source: ABdhPJxax220Y+zg4h1kp6XXN13EyER3sz3MXL01acYe3CvWec7xBmexQhbBRgOQrByQ7j3lpjfQeQ==
X-Received: by 2002:a17:902:7045:b0:163:9c45:e330 with SMTP id h5-20020a170902704500b001639c45e330mr25430866plt.32.1654076821222;
        Wed, 01 Jun 2022 02:47:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:47:00 -0700 (PDT)
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
Subject: [PATCH v2 5/8] drm/panel: panel-simple: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:34 +0800
Message-Id: <20220601094637.1200634-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024705_163139_CD1B34DA 
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..54e78d978dcb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -434,6 +434,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
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
@@ -441,6 +449,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 	.get_timings = panel_simple_get_timings,
+	.get_orientation = panel_simple_get_orientation,
 };
 
 static struct panel_desc panel_dpi;
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
