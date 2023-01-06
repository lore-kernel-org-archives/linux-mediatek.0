Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C6C4708E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 03:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FLEA2wQkQBIO15nu3HyGaLDd58pUqyHA63e/BahflBg=; b=ddiVAkFbW4GpeCDtzo5kSBmxCS
	zsUC7iS0N1OiIpDC3m77pHlQ4XQv2co7LKHr4kje6gq8eDbYbQsvj1GKGTzaoPvIXt4jEwQmzDulm
	1/M3LJjNnFIlWRlbNAsq9jn+AqnfZticbcIGlF4p7OQu9lzd2tufQTeTTKxM3m/KVC37FmShCW2Ms
	xQmS0ZwZQS2hj+zW5I/KnC628wLINewPFlddxmn+DF4JALPlkQSAft0QrvbDrFSknVa+PiwkYoXSk
	YlbTKFvRTTl0/S5CTlleUunD00T8SiG7zpjcPR/CMRC1O9aoxomqmr0F+nwHQK5OIDhC8eBydqOXj
	JQ2aqkjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyr-00HN11-KL; Fri, 06 Jan 2023 03:01:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyn-00HMtC-TJ
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 03:01:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d15so367934pls.6
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 19:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLEA2wQkQBIO15nu3HyGaLDd58pUqyHA63e/BahflBg=;
        b=gr1lwpg+ZbMVA7VcYOW5YvvzRvyk56qGEw34yRLVGhuBq+su/XvHWcwtgeYG5Q5API
         kQWl20V6HCSzhC+y3lpli6F+e5NnCI736lNGtNY3CR7LWYw9K1WOVN8CmTdTLHH/VHT1
         /UbBKNWAAha3z8idSR8hR8tlBNBJY87nnTfCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLEA2wQkQBIO15nu3HyGaLDd58pUqyHA63e/BahflBg=;
        b=n/EA6QTu1RDBi2m4f36RaglkVlQvKwilRrwxED86MNrHo5ra/OdhxlM59aRoGz7603
         6QPF9DWKxhcJyMdE5DQ7iYLJxhpraTxdW5/k4fzRvIbT6/9i4HBdTvlPmGDjwUBZqgad
         K0v5oU/Xk5L8lQXeaeScD+Tq5NOHwvp/qUnaF4NbBX9jhb/+qPa6BRQPe1fOE3wKHvxx
         dLrI2clXPwY49bZeIdBRMja3ASHxzs2pJQD4lBa3t7lIsvLGBB6s6h1JmYlNdEyEqiTF
         qlINwamisu6zpiNL49OVy+bwhSyOrK7KVx+dRZ5UkGwgLpMC/5HeZkI+OzSBt8edtXDm
         A56w==
X-Gm-Message-State: AFqh2kpOZlwOOId4Igt1UttkP7sAEu8zGIDvNhw5xmLkR+IvAoUphfAz
	45c1mmf2+coVbXZjlDZV1aMNtw==
X-Google-Smtp-Source: AMrXdXsomxVgbccv1usflDMgeLmsRP7BhyBVOMFDU6WowU+xXCKfXlkP0R8LnNIfb1r5yNksWji+AQ==
X-Received: by 2002:a05:6a20:cb44:b0:af:e129:cc4 with SMTP id hd4-20020a056a20cb4400b000afe1290cc4mr51387940pzb.41.1672974071148;
        Thu, 05 Jan 2023 19:01:11 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:11a:201:d024:f69:ad7c:2653])
        by smtp.gmail.com with ESMTPSA id g38-20020a635666000000b004768b74f208sm21320pgm.4.2023.01.05.19.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 19:01:10 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	yangcong <yangcong5@huaqin.corp-partner.google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable
Date: Thu,  5 Jan 2023 19:01:08 -0800
Message-Id: <20230106030108.2542081-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_190113_992835_BC313FD2 
X-CRM114-Status: GOOD (  17.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The unprepare sequence has started to fail after moving to panel bridge
code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:

   panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22

This is because boe_panel_enter_sleep_mode() needs an operating DSI link
to set the panel into sleep mode. Performing those writes in the
unprepare phase of bridge ops is too late, because the link has already
been torn down by the DSI controller in post_disable, i.e. the PHY has
been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
on the DSI .

Split the unprepare function into a disable part and an unprepare part.
For now, just the DSI writes to enter sleep mode are put in the disable
function. This fixes the panel off routine and keeps the panel happy.

My Wormdingler has an integrated touchscreen that stops responding to
touch if the panel is only half disabled too. This patch fixes it. And
finally, this saves power when the screen is off because without this
fix the regulators for the panel are left enabled when nothing is being
displayed on the screen.

Fixes: 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 857a2f0420d7..c924f1124ebc 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1193,14 +1193,11 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
 	return 0;
 }
 
-static int boe_panel_unprepare(struct drm_panel *panel)
+static int boe_panel_disable(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (!boe->prepared)
-		return 0;
-
 	ret = boe_panel_enter_sleep_mode(boe);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -1209,6 +1206,16 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 
 	msleep(150);
 
+	return 0;
+}
+
+static int boe_panel_unprepare(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+
+	if (!boe->prepared)
+		return 0;
+
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -1528,6 +1535,7 @@ static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *pa
 }
 
 static const struct drm_panel_funcs boe_panel_funcs = {
+	.disable = boe_panel_disable,
 	.unprepare = boe_panel_unprepare,
 	.prepare = boe_panel_prepare,
 	.enable = boe_panel_enable,

base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
-- 
https://chromeos.dev


