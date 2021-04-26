Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0953CC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:19:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780906008E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780906008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+T/UAQtBlxp4fey187KePHLnpVCZr45GOKAm55dOYwU=; b=nptanZagFXX+lcE8YFboQktSOZ
	upuNeu7Jf8gVaTD7nHDGJt4agKdvFKo/wySjuO7lSUjui9dMvrtujsccYT5eDmiO5gVsJAvX3A8CF
	waC8upUD3lrrrrTM5hFQ3BeqfKr7xZZ4rOrUf3XAO/HBzz7XN0AK96LWxy8lGASzEGI4RPuzThB6S
	T0oLBHaCztWsr0FAE6r3dTUEVCjy2GIvUC8kIGKwU/AAHo47Prd9uvj5c3umjzTRhvl9u4kMlcB0e
	BdmyGs9KQHwZ0ON39XuVKpSY7sMdLweaQrqQdSgfHIUha1cFKCYu9ksJyR3g9AvP2ILgRdno4wJ4O
	FH0qL8yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lateJ-006vh1-3C; Mon, 26 Apr 2021 05:19:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1late6-006vfH-RX
 for linux-mediatek@desiato.infradead.org; Mon, 26 Apr 2021 05:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rywd4hnCU7/9HbcJL7DvcHVAqfAUpeGMenv4sbpVbPg=; b=aEiq58ZQBDLUcdt/QzmpjwOAJ5
 XFP/wSi7W7yGgkrfaDcdbu1J3OuYAmSMapLfNCr8lL23ICcMlYCCG4XKj0FkX6lj5DVxio+htN47r
 bFv1EbbffaiO29bUZDx6zUDJbm+ORwemebsA0BS9oy6yo4PpZKSA58Q7W22Xx6LQc+1PBa7szxHM8
 t1zgFbLRiQQm0O5M9sq/18+FhbKRSTm1Wrh6lzRZcYfyIEGhz1qpkxQqXchfIz/jLJK+cGGYJlHRj
 o9WV15kFFbZALLnW/dCODt6WtbtMc8U3ngh5ilBeUIZpqEZtxXTfIqrKnih6UFxLObxhAak8ebSjb
 CpRyWIQg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1late3-00Fjfs-Gl
 for linux-mediatek@lists.infradead.org; Mon, 26 Apr 2021 05:18:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id a12so38174675pfc.7
 for <linux-mediatek@lists.infradead.org>; Sun, 25 Apr 2021 22:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rywd4hnCU7/9HbcJL7DvcHVAqfAUpeGMenv4sbpVbPg=;
 b=CMuN3mkwvDeBeo432fJqHbMLRzEVmCttlBmiosgZBn6YtxAtX3SdqsA/L1SMRjW9ur
 9XWuMBU85KPQFbaIp9agcRrNzYz+6GDBENoGt+eLtSlOGlCVX7M/PgZ9Ubulq3afmzix
 hqgf+PNXSL2SsYA+i4P1wf/yD2MUmmz5/AgHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rywd4hnCU7/9HbcJL7DvcHVAqfAUpeGMenv4sbpVbPg=;
 b=KHVMf8WO/IBZVPDjZihNPiSIzevCNGcZegHLXPjHyHRA+Ajcbt1d3UeEB774mtliTS
 dWlNQ6Gz31KBnv29pB3sFnSrk9DyHwCRWTPMbKd9Oxo5K9/9luIiiNW+carXzSrotURw
 KMm+A90kRi70J6kQL82Y9ntftTM0zOUq7KZs9Kub+E3atoU2QO1Bw1O73dBAX16sPFcu
 Ies9ZIzVu/BD69vR4ypFlQK4JIlX5c0F7mkIY/giJsvWQHgr/R6QoPiRJUTbs69SqXxN
 EyEHLeYmYKgBPzMfVU75KsTnmLxBVF6Us45xahE+5bFE5oMcFg+Qy9W6X6DncJxUKPK1
 5+KA==
X-Gm-Message-State: AOAM530e0Pdqm2CJ59B72gAmYQQxgLqFWYmeEaClUxGtDgp7UWpPG+zB
 guFOK5IVwSKMgvw1xALyI86h5a/1TvoOeQ==
X-Google-Smtp-Source: ABdhPJxFS+sK39f/LfL1MlXA47wSW7gVZjlZJquRa9ML43FqezaUaeqZhJtTKM3L+YRD6QTNPxsgbg==
X-Received: by 2002:aa7:860f:0:b029:265:4428:3104 with SMTP id
 p15-20020aa7860f0000b029026544283104mr15822916pfn.75.1619414333766; 
 Sun, 25 Apr 2021 22:18:53 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:49dc:8519:4648:67e])
 by smtp.gmail.com with ESMTPSA id h9sm9928420pgl.67.2021.04.25.22.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 22:18:53 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] gpu: drm: init set panel orientation property earlier
Date: Mon, 26 Apr 2021 13:18:47 +0800
Message-Id: <20210426051848.2600890-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_221856_021924_3BA2154B 
X-CRM114-Status: GOOD (  14.76  )
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

drm_dev_register() sets connector->registration_state to
DRM_CONNECTOR_REGISTERED and dev->registered to true. If
drm_connector_set_panel_orientation() is first called after
drm_dev_register(), it will fail several checks and results in following
warning.

Create panel orientation property in drm_connector_init()
and set default value to UNKNOWN. Let the panel set the real value
later.

[    4.480976] ------------[ cut here ]------------
[    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
<snip>
[    4.609772] Call trace:
[    4.612208]  __drm_mode_object_add+0xb4/0xbc
[    4.616466]  drm_mode_object_add+0x20/0x2c
[    4.620552]  drm_property_create+0xdc/0x174
[    4.624723]  drm_property_create_enum+0x34/0x98
[    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
[    4.634716]  boe_panel_get_modes+0x88/0xd8
[    4.638802]  drm_panel_get_modes+0x2c/0x48
[    4.642887]  panel_bridge_get_modes+0x1c/0x28
[    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
[    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
[    4.658266]  drm_mode_getconnector+0x1b4/0x45c
[    4.662699]  drm_ioctl_kernel+0xac/0x128
[    4.666611]  drm_ioctl+0x268/0x410
[    4.670002]  drm_compat_ioctl+0xdc/0xf0
[    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
[    4.678436]  el0_svc_common+0xf4/0x1c0
[    4.682174]  do_el0_svc_compat+0x28/0x3c
[    4.686088]  el0_svc_compat+0x10/0x1c
[    4.689738]  el0_sync_compat_handler+0xa8/0xcc
[    4.694171]  el0_sync_compat+0x178/0x180
[    4.698082] ---[ end trace b4f2db9d9c88610b ]---
[    4.702721] ------------[ cut here ]------------
[    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
<snip>
[    4.833830] Call trace:
[    4.836266]  drm_object_attach_property+0x48/0xb8
[    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
[    4.846432]  boe_panel_get_modes+0x88/0xd8
[    4.850516]  drm_panel_get_modes+0x2c/0x48
[    4.854600]  panel_bridge_get_modes+0x1c/0x28
[    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
[    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
[    4.869978]  drm_mode_getconnector+0x1b4/0x45c
[    4.874410]  drm_ioctl_kernel+0xac/0x128
[    4.878320]  drm_ioctl+0x268/0x410
[    4.881711]  drm_compat_ioctl+0xdc/0xf0
[    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
[    4.890142]  el0_svc_common+0xf4/0x1c0
[    4.893879]  do_el0_svc_compat+0x28/0x3c
[    4.897791]  el0_svc_compat+0x10/0x1c
[    4.901441]  el0_sync_compat_handler+0xa8/0xcc
[    4.905873]  el0_sync_compat+0x178/0x180
[    4.909783] ---[ end trace b4f2db9d9c88610c ]---

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v1:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210409045314.3420733-1-hsinyi@chromium.org/
---
 drivers/gpu/drm/drm_connector.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7631f76e7f34..a1acb4af0ef4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -303,6 +303,10 @@ int drm_connector_init(struct drm_device *dev,
 				   config->tile_property,
 				   0);
 
+	drm_object_attach_property(&connector->base,
+				   config->panel_orientation_property,
+				   DRM_MODE_PANEL_ORIENTATION_UNKNOWN);
+
 	if (drm_core_check_feature(dev, DRIVER_ATOMIC)) {
 		drm_object_attach_property(&connector->base, config->prop_crtc_id, 0);
 	}
@@ -1210,7 +1214,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
  *	coordinates, so if userspace rotates the picture to adjust for
  *	the orientation it must also apply the same transformation to the
- *	touchscreen input coordinates. This property is initialized by calling
+ *	touchscreen input coordinates. This property value is set by calling
  *	drm_connector_set_panel_orientation() or
  *	drm_connector_set_panel_orientation_with_quirk()
  *
@@ -1298,6 +1302,14 @@ int drm_connector_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.hdr_output_metadata_property = prop;
 
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
+					"panel orientation",
+					drm_panel_orientation_enum_list,
+					ARRAY_SIZE(drm_panel_orientation_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.panel_orientation_property = prop;
+
 	return 0;
 }
 
@@ -2205,19 +2217,9 @@ int drm_connector_set_panel_orientation(
 	info->panel_orientation = panel_orientation;
 
 	prop = dev->mode_config.panel_orientation_property;
-	if (!prop) {
-		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
-				"panel orientation",
-				drm_panel_orientation_enum_list,
-				ARRAY_SIZE(drm_panel_orientation_enum_list));
-		if (!prop)
-			return -ENOMEM;
-
-		dev->mode_config.panel_orientation_property = prop;
-	}
 
-	drm_object_attach_property(&connector->base, prop,
-				   info->panel_orientation);
+	drm_object_property_set_value(&connector->base, prop,
+				      info->panel_orientation);
 	return 0;
 }
 EXPORT_SYMBOL(drm_connector_set_panel_orientation);
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
