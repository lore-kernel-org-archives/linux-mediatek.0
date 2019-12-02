Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E4CC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBA8320833
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRcIIGe2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7uMpYQX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBA8320833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSLIusqvm1YFgVOLe/taiMHBcyZJalPfairJt0UDVJ8=; b=CRcIIGe2Kcdd4j
	DSQ4KhGtHShM1LAkq43LNLM1akyVGd4l42Z8pVzTqVVan79PwFPLmZIRbQUtPsJOHTXwRXWX3A8i0
	ACOG4pMJj39EuCd0m8s/iENKFkrSG/GZTfr4EcLDGySRS+TnhvythSSb3Hy3bb6FXKnJieS4niWvO
	CRpvRQCAxDOfFeMfgUPW7VPU2ZotkP2t9HI6t+uH+55I4A0y0VdUenTH9bUDdfLgFpC1Wlz1L4Aw1
	ASg/BIfXASucCW99v06yurqdDiNDdpcgfsLgNHz/jsSSt8nf5d0v0+Is0tI7kwrIf24xBt8jRFhYU
	xQOCqb/8QwPf/1U58olg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrSV-0008EY-VI; Mon, 02 Dec 2019 19:34:11 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrRT-0007JM-7l; Mon, 02 Dec 2019 19:33:09 +0000
Received: by mail-lj1-x242.google.com with SMTP id e10so829215ljj.6;
 Mon, 02 Dec 2019 11:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LGOgtva2q0s1MxBZFBlNQnZLc92S/tb/mTErWAKqBVc=;
 b=h7uMpYQXU8nqH68TzydRnhCOy45ksFGq28L6tPaxa9aEiPfo5jSOpVakkWN+0K9IK7
 1qclRlZSneydfgb76u5Ne20nNLk1wsQj7Cj3Z64NUtI+I5OintjAleMXZo4ugNCWp8cR
 TIJ2NPk5BEhgyBCMlG9HktzmqwwZDSKf95YjiSNXJqGur69kbxDYG6cpihUCHnCAnA9c
 FwdPExbDCZ0VRivGRZ3sHk6QYNEYi4Xtmw7nn9Oqqkg5edr6javNtcxYL2hagI7YMyrp
 K4DxbC0F1zZ4WICEWZPbLWQ4xrh18gufaVK0s5f6vAXNDlFps/DBo/4ma1VXmzNRXKkX
 YoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LGOgtva2q0s1MxBZFBlNQnZLc92S/tb/mTErWAKqBVc=;
 b=nNyT46MtBnmZAk0yw5hfxCCDObLfBfBMnG4uxun0f/Bxc266uU0l7azeytn1MntNsT
 H7rZVo6q0VxDP0o/jy7a2V7FtEXf3trbm90lxyr+Pg3iSzFCQGgzrsRY4yChQkMksdvR
 XwM5a96AiaftEk8BD8NF97pyY2f9niFJrAm/KlXVkLSEWo61tVnEuc8bQSfM7gpxU8f+
 ZGcHFwhoZHkC/1Ixu8mHek/C2yYlASVI58uZ36x9lL+jWZjH2ZdX8/zB39pni+YvEfaS
 MyQ0gdxcF3xD3vXNNDYI7Ary0ITz7X2vaIPDzHKguouNSnr8wWRDCxeWZG2/JVYLfauZ
 oKEQ==
X-Gm-Message-State: APjAAAUhAdYcEkPgL7fDSIaILxEYwvCwIZWB6GQotp/j6NUpB6M8+G+S
 DLZT7lvOv3eXB7VhWwTiTy0=
X-Google-Smtp-Source: APXvYqxqWDVM+ppo9LUJvIL0zSPxHW/xwhiU6h6G2FvCLak5I1Hn77t5p5FArs7DmDjbO05gcgebKA==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr219541ljj.207.1575315185572;
 Mon, 02 Dec 2019 11:33:05 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:04 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 01/26] drm/drm_panel: no error when no callback
Date: Mon,  2 Dec 2019 20:32:05 +0100
Message-Id: <20191202193230.21310-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113307_485762_499ADD05 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The callbacks in drm_panel_funcs are optional, so do not
return an error just because no callback is assigned.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ed7985c0535a..2d59cdd05e50 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -151,10 +151,13 @@ EXPORT_SYMBOL(drm_panel_detach);
  */
 int drm_panel_prepare(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->prepare)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->prepare)
 		return panel->funcs->prepare(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
@@ -171,10 +174,13 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 int drm_panel_unprepare(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->unprepare)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->unprepare)
 		return panel->funcs->unprepare(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
@@ -190,10 +196,13 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 int drm_panel_enable(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->enable)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->enable)
 		return panel->funcs->enable(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -209,10 +218,13 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 int drm_panel_disable(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->disable)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->disable)
 		return panel->funcs->disable(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_disable);
 
@@ -228,10 +240,13 @@ EXPORT_SYMBOL(drm_panel_disable);
  */
 int drm_panel_get_modes(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->get_modes)
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->get_modes)
 		return panel->funcs->get_modes(panel);
 
-	return panel ? -ENOSYS : -EINVAL;
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
