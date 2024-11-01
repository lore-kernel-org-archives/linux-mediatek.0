Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1DEE6B240
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2024 10:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSyJnhqtzNGB7l1kz5uHZfxocs7V67foS6FdivcD7DM=; b=3wUNNHB5zofGYbZkH1HTHCRway
	LhCSgaOia11GIqG/OFYIp9G9CODBsCwTUbBuDVheDd3v0VPn50SGnyGfw281lBH2DC4LPVIH6EaPO
	TZxJp16hR/XLAelpQWGcerM5mE4ZBH3Sp9XgktgWxGevfsr/2oVNESFrFls2hPII50bfMBBFObWJB
	DQES3+sSinQUWllirfJ3AMKZhbl6VqPYOOo2vsygkQqHGwiHwpruQkl8+pcyGjaMRAia4gbsnR3jI
	/Q2/FSm3hXxRK4l+1tTd9+lQ8633e7hlbcuCLQAXNsNbVLhwUiNttXiVL3BShXHtsdoyMvm33N+/e
	Lv+nYkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6p27-00000006bW0-21PD;
	Fri, 01 Nov 2024 10:37:35 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6okb-00000006Y4S-0gm3
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Nov 2024 10:19:32 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so13719551fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Nov 2024 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456367; x=1731061167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSyJnhqtzNGB7l1kz5uHZfxocs7V67foS6FdivcD7DM=;
        b=mBAZ3wT/HOzNeNHzK2LlloCYIRNYw1VuInTb/7jTj22voWTOpkuRuGcUDCisvd8Fyg
         uHVTv8HpHiaSFfVY51ZFBIgifS0C0EJXqoxQf5BMJEosntEY0bC3v5bWYrcSjHv2Dqq2
         hggyamFBHgzWc/vKWUGCRdKWA6lIrVeKD7rgWaPyrDY81bP3UrKGd8xGYvYBSGrpSWG+
         0jLaogpsXnZV6g5cTmArwTz6FJ9zuVwlhifk1KTsRnGmi+LAeM5Rx3oYVli1vtxz90qf
         +4Yvu3uBqCXEeU8WEWYAmibAzdMBNMtAuk//vtD8iCwyC1WDGmoibRxNPfCnvzlnquVU
         GC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456367; x=1731061167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSyJnhqtzNGB7l1kz5uHZfxocs7V67foS6FdivcD7DM=;
        b=Sf6sgNiMifjmHGV2Mz+5Z5lUatnAV0QjSXaItgp+b5FWJg55Atfj/xTt9Q15qvp9He
         fk+SvH4yxQfWXndcU771sCjBVvSg/L9hccZ2J4PHNXwyZjyT3FejpsE74/+UjQHw6img
         ZdKQ5+Xc81n3eiQcgygcUsKyaTvqzobs4XoKW47+SgdvJq0+nO6u5EgS2UaHMzlcUekB
         xgdpwoIfEgAMh7ITOwbWwf0xIthaII/Yo6s8CQlGFg6C6krLG/5kdZEFj0O3ozrJBJ3x
         sHCNoeg03G8w2xBOHxMUnDUEG8YUBYNjO85bonvpMhT0hAdbONy9iny/3RjVIohZZyoq
         zAjA==
X-Forwarded-Encrypted: i=1; AJvYcCU71b0A+MQ8rmvBuWk1mcnrr6XI7K8SCRT8NXP5fa/OZi1n7RPOXP3ymHtilKhx6lHO9DdKZEd7X41bRzfcDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Hr50ved33gxE36nqrgXXSjcm3T9E7iEPOtu9t1xP7tHCyJoU
	l99T3DFuvV3vFX/6LGg3Pw4DrCrwVVJASlyhg29/P/Ek9dZ6IcS5patsz7MqEZo=
X-Google-Smtp-Source: AGHT+IGhSWfH6euhYW2znlkFK+r3govgY1LuFIe7fOuMV+C37e3QgH0MbPED7GtFqocAeau78Vvz7w==
X-Received: by 2002:a2e:4c12:0:b0:2f6:6074:db71 with SMTP id 38308e7fff4ca-2fdec5f831amr26624951fa.17.1730456367449;
        Fri, 01 Nov 2024 03:19:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:08 +0200
Subject: [PATCH RFC v2 7/7] drm/bridge_connector: hook
 __drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-7-739ef9addf9e@linaro.org>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4075;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pbf6ekV+i45DFn0vAhN81yq5JTl3TzjpRpOOR4scnrw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsZAyyzFUbIF1GNuLd1ZpLZ1B2KWEi1m5jD4
 rBI+bHjpFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGQAKCRCLPIo+Aiko
 1bv9B/9aAzBx6TyAdD0HiTY84ACPnO30AoIMqz4lY2qeZr1j/AXgrWjWY+hZqDi6N6X6s8F7ArV
 QOhiCSvJ/wBqX2oIw4oG6kn/StwLHzUzjvdq5q4vVKjwGKIh6cc8LzyoJi5L1/eI7L59vUDpn0U
 qHPk1TWzpjbuGNKpe/rT/Ds0c7458AmhADW48RgNU0NAjvbZYvcLT1IKTfs0ZTNtJlqnZnGSnA4
 KD+5OOhfX5lF5o9KH9K9DnZFeaL7wehWOzHLWlqjaWakWwIgCQzluX4lK5NCstgZnkT9XyOHW0q
 YWrQ6YVSm+zTkO8F578PtuXJBzB9WY50mHLRzLH1cDQL1qdN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031929_640429_D4D5E81E 
X-CRM114-Status: GOOD (  17.81  )
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

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 65 ++++++++++++++++++++------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..4069e0f972d5fcabf7e07238583fc9ea89ab113f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -175,17 +176,53 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector,
+			       enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	const struct drm_edid *drm_edid;
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	if (status != connector_status_connected)
+		return NULL;
+
+	drm_edid = drm_bridge_edid_read(bridge, connector);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_edid_free(drm_edid);
+		return NULL;
+	}
+
+	return drm_edid;
+}
+
 static enum drm_connector_status
 drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid = drm_bridge_connector_read_edid(connector,
+											 status);
+			int ret;
+
+			ret = __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -246,29 +283,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
-	int n;
 
 	status = drm_bridge_connector_detect(connector, false);
 	if (status != connector_status_connected)
-		goto no_edid;
+		return 0;
 
-	drm_edid = drm_bridge_edid_read(bridge, connector);
-	if (!drm_edid_valid(drm_edid)) {
+	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
+	if (!hdmi) {
+		drm_edid = drm_bridge_connector_read_edid(connector, status);
+		if (!drm_edid) {
+			drm_edid_connector_update(connector, NULL);
+			return 0;
+		}
+
+		drm_edid_connector_update(connector, drm_edid);
 		drm_edid_free(drm_edid);
-		goto no_edid;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
-	n = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-	return n;
-
-no_edid:
-	drm_edid_connector_update(connector, NULL);
-	return 0;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
2.39.5


