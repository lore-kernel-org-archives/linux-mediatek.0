Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D64C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5d3BR6yQVWCxpwmOIUnDiJsLb5JzVD7mOeqhjV3Nkk=; b=oiEh3npC7Abb8I
	o2xzdfRYMcUjbdN2g67cS7hrktHtiXmU7D4MXazNjOxhynizfoRSk+8rMe/dh87hZXL/sV1IakEip
	sJTdrw4k8ut2oepNU95D6tS+ZDZSJbAtkWe5W73owoonhWDfGif0NlJhiQYJZvB1s0w0qV6ZVC9xR
	kd3LOo2LyDh8sp19SB/rSGeplNfDmD/Dpq+syecefonGquwLyMb/VnSOdwjf4rvBx0O9VJA+IizQt
	VPpdXRC0eY2+d8zaPZPaLZLdOMrckyVx03JFLPt+RT1Lozpt77DV5cIgkWdb0OD/wjcCveGwIP81y
	25PiWGg/XdxOQWfLVWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLG9-00F9VA-IZ; Wed, 01 Jun 2022 10:07:25 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwY-00F1Ue-Al
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:47:11 +0000
Received: by mail-pg1-x52c.google.com with SMTP id x12so1414330pgj.7
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bk6C27QNmt1+4+7KncB4viIiej/sMiUgOSBQvF7TcyY=;
        b=K5lzcMPBYc5vuIuvnrMLXcNHgjTQKop5EOpt+HwdgnFoFJa+hd9QbbKDaVebbKacZL
         OSwO3h44qdUkHgpNO01ZFKqIrpb7gnBjvepEql6SNrM5QPse6iv7B8DP6j5GEimsSfcl
         7rLDinsDAlwVs0ZKykx56OzMFZvwhVG+tu1e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bk6C27QNmt1+4+7KncB4viIiej/sMiUgOSBQvF7TcyY=;
        b=WlUOjS0Q4Iu2BNEA9hC0FMIQOX5OSgcKXbHSXhtairZzWR5AkJ/X3WZF6rLnNqqRa0
         u56kZV0t4tKy+lLkJpnFkA58+Yfo8mzKM+AJjvvMgWFcHS/6GV6J+nWnNL0uSdD0uzvC
         aOSlL2IZTrX/NMwNagK4gQUmE/AEsOvKAGrucBO1KFnaPnCHmywuynV43+YS20Cont9y
         whvlDLSvRA17fnayBSdQprO9dBDDWdhQBfmSWGC9kqDoAHb5xYsWew5C79djExVcOpyB
         c2qxeNEfNiKRByhLl+CSfdXQ615IgMZ+VpV5g525lUPPA+/pT90NG84L3cWGGdBQBROX
         JVkg==
X-Gm-Message-State: AOAM530y24Jbep9frM67qWq0p4pM/jsZjLXIwRemD9ZDJCROrbro22ea
	Nw8O3cJ+8rfpo3bnNfVQLyzeGg==
X-Google-Smtp-Source: ABdhPJy780kRALjc91F0vxW4FURBQqFFfjKK3ZprK5u2ZLrMWSj311aX4pckzJCj6vHag0BcmbL/+Q==
X-Received: by 2002:a05:6a00:2386:b0:519:1ff1:d723 with SMTP id f6-20020a056a00238600b005191ff1d723mr28880889pfc.21.1654076827998;
        Wed, 01 Jun 2022 02:47:07 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:47:07 -0700 (PDT)
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
Subject: [PATCH v2 7/8] drm/panel: elida-kd35t133: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:36 +0800
Message-Id: <20220601094637.1200634-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024710_440072_7846BCAE 
X-CRM114-Status: GOOD (  11.76  )
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
