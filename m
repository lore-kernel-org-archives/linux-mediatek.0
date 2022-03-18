Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A67C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFcIIgaCJG4cNKUXl9oR9VvVoa6OvN/ZEC0U5NTPIwY=; b=jrkgd1+6epZFPa
	nWKnUTWvrw4s7Sy3IFR/8xx3kR7IkWhNN0iifjH5TZftk4Y3tC2tw72ydHBI0FfAPaDIlC79RljuV
	LiCq3/g/f8CG2y+QsZCkgaQVTCJ6MS0dFzga1mJZ4GpOVf6UNprLlCGDAjQCEnUAhCR3XrhzsE24z
	MkDyXSGVqDtz0/cLstj8bXYRgZVpRijzLjopPiD5CjHb1DyTZN1ZMqVLMG8nDkPM4VzPrgXUe0RbI
	POKAaYjCcetmeGQ7NBfIivZGcsWJ3j1vZpbNvJlLEmRT2sDAx4cIO06NQChCEel5PZGo0ozUiCdBl
	lliUBcdbysFe7Hh8HMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV7zq-000mzm-LB; Fri, 18 Mar 2022 08:30:06 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV7z9-000maW-Po
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 08:29:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id e3so6900229pjm.5
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Mar 2022 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wk/pqrVyJD3dZfuBlDvR3gvRx5qETAjydlq9k9fo89I=;
 b=MBv2nbtC77uuFP6FO9vF3JJunvP31eEWqLFqoiGIM3/E0+IkznfVBrTBIuGgXWfVv9
 5TBZHlNgegYmt3aqmPENYo8GhMqjeRQgRc3d1sr5+ApsSsOS0LqCL96pxslRickdXpwV
 ZNw9ExgEXTLbAqCs2ncXkhyskWqy7wd4OrW7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wk/pqrVyJD3dZfuBlDvR3gvRx5qETAjydlq9k9fo89I=;
 b=kC4CYKQLnk69Rkf7vzDg70dH87XlSYd6QYkI6s0nXAsbUM4ElW2pX5a7Gf9hbhJOWy
 ViewARiPS8Z5DqnP48I701kKn+lCWZ5XfNTl+J3aD7LQ5B10l6E4I0HoRrvBABKQmdX2
 4c2DlWaQt594nt6UOt8y2RWuRxfFGeFfiuVn3dCqzage/Wh29UKrbusU6qLr3LbxNklk
 SAcWu90ENkBspwSpJUS6NgnmBzvtOk41gFIyg0KmbwM1moOLVPE/qPXcgIqq+D9fKS4+
 EHzBYp9OTIdh4JESL8F5XL6xj0YHJvVQqlR1RaU/jR//pyLiSSQhxWwzEaK9Y0gRHBeV
 zzhg==
X-Gm-Message-State: AOAM533JzrwmrlrVfLha1JuPN1cH3D1l4372hF4KpHMI2VAkx0BzJz5Y
 fZ6oKEIRB1IHgphjyYgyxBYmuA==
X-Google-Smtp-Source: ABdhPJxZr+WrsVRD3EBe7ULBmlgFiXmGvjfKG8gVhn0pmPIZv9TgokVPdh4o8x0PeMOmdu3PzI1t6Q==
X-Received: by 2002:a17:902:e944:b0:14e:dc4f:f099 with SMTP id
 b4-20020a170902e94400b0014edc4ff099mr9105752pll.161.1647592161915; 
 Fri, 18 Mar 2022 01:29:21 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:435a:ce78:7223:1e88])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm9404044pfk.131.2022.03.18.01.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:29:21 -0700 (PDT)
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
 Jani Nikula <jani.nikula@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v9 3/4] drm/msm: init panel orientation property
Date: Fri, 18 Mar 2022 15:48:24 +0800
Message-Id: <20220318074825.3359978-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318074825.3359978-1-hsinyi@chromium.org>
References: <20220318074825.3359978-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_012923_897854_5FD6305D 
X-CRM114-Status: GOOD (  11.01  )
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
index 0c1b7dde377c..b5dc86ebcab9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -627,6 +627,10 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
+	ret = drm_connector_init_panel_orientation_property(connector);
+	if (ret)
+		goto fail;
+
 	drm_connector_attach_encoder(connector, msm_dsi->encoder);
 
 	ret = msm_dsi_manager_panel_init(connector, id);
-- 
2.35.1.894.gb6a874cedc-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
