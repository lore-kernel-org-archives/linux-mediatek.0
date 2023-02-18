Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF44AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUC5VpRQ+Ac+lj9Yg4rT6e7fy64d+1PZ95QiUW9T0f0=; b=mnG4UhTwzDm0V4SD6RSErQmDK8
	myL2Uw16QaG+TKdk0ZtbYpMf31AUURjhSXpndhcCsG9hWcaBg0pt0uTBAIFE+X8dfKXRVRHzubwV1
	5MASaIcZBlvBZUMoUc0bbEKthmf1WS9Ma6JGtsxkEp6cq1sZf1t9qOc3VnBvtvIlNBBYc4Wl9MPPE
	kdhhVe9nbwPvivXg74BpatVU5FcCG6JnubY5vv7DN3Yewh9JDZl12A2QQpzIRhqzuZ8iTlofafoTg
	lmGwlkilWHS5aJboy6ZKDyTaEMlnpfI6j8ljk1NP9D2vnmWHo9ZFSU1fZaOm43HEmM/W6yjgKLdob
	rT/4HsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLEa-00Gqzq-Gu; Sat, 18 Feb 2023 11:18:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDr-00Gqaf-O7
	for linux-mediatek@lists.infradead.org; Sat, 18 Feb 2023 11:17:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id dc6so269715pfb.7
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Feb 2023 03:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUC5VpRQ+Ac+lj9Yg4rT6e7fy64d+1PZ95QiUW9T0f0=;
        b=L6RS2NfSIeSXxStr65xeKi50qynabbVHyn1UXxRcFOQufPLZtK08i1OiLJEp9hJQ7K
         rUKjpKY0g3r8yXPkvsop7ktcGvX2zSGJcNmdq9qMQfKgrmyyEm3AEfdHnRXlsJ/p2H0S
         EVUvsiSqyjhofHzgHpHBcKINd4JPvlks4JsmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUC5VpRQ+Ac+lj9Yg4rT6e7fy64d+1PZ95QiUW9T0f0=;
        b=m0YA3p5TYDQIeewUQ1sFq4fF4+F/eGRjfbHZTMNmSGF1R3DCvWM0RZshtyFgoDv977
         /MnEEE/iNjC50u/fbvvaIcRVTouQbaWnIbtyw7IH03bsbCAhDwgAzkZH0j3jjr9JqIiU
         0u6Xh6+/2D//NzSdz5WqkQgZ0qmlmi7we0bll2TI/1GqKHu+1aqwkozUy9OLOdeX1V+I
         r1vskpkB2hYupX36E3RYvbUVa4xg/dh+kxfrXOsMY5X0JwlP2mNl03xSeIlmsIsQ+mVA
         DVqOTuXrioZNbwtDZutnFqAL6TmtrNSMGQzaB71o981DDAoIUeuWRFCVBlKS8IJ8OFAX
         ehWQ==
X-Gm-Message-State: AO0yUKU0tKuRE7gZXQjZ8sCE9md9wYsX0dU4GyW8yCp3DR1DgaDqcBrT
	/l9o3tKdKlVcB9YJ2Qu9rN3pag==
X-Google-Smtp-Source: AK7set/DVZJFasYpEc2/i7C4jXudZU0Ni1NtI2PEwLI8N4heb0cpLrlwrxj4855uNK5y7WV7aIRFHw==
X-Received: by 2002:a62:5f86:0:b0:5a9:cb37:cfb7 with SMTP id t128-20020a625f86000000b005a9cb37cfb7mr5172705pfb.25.1676719060719;
        Sat, 18 Feb 2023 03:17:40 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:40 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 3/5] drm/mediatek: Remove .get_edid callback
Date: Sat, 18 Feb 2023 19:17:10 +0800
Message-Id: <20230218111712.2380225-4-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_031743_826892_4551B5CA 
X-CRM114-Status: GOOD (  16.79  )
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

The original implementation peaking into the remote nodes to get the
ddc bus fwnode, which is not a good practice. Remove the callback from
this driver and rely on drm_connector helpers to read EDID.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- New in v3

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 53 +++++++----------------------
 1 file changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..44952e539059 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -159,7 +159,6 @@ struct mtk_hdmi {
 	const struct mtk_hdmi_conf *conf;
 	struct phy *phy;
 	struct device *cec_dev;
-	struct i2c_adapter *ddc_adpt;
 	struct clk *clk[MTK_HDMI_CLK_COUNT];
 	struct drm_display_mode mode;
 	bool dvi_mode;
@@ -1265,21 +1264,6 @@ static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridg
 	return mtk_hdmi_detect(hdmi);
 }
 
-static struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
-					     struct drm_connector *connector)
-{
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-	struct edid *edid;
-
-	if (!hdmi->ddc_adpt)
-		return NULL;
-	edid = drm_get_edid(connector, hdmi->ddc_adpt);
-	if (!edid)
-		return NULL;
-	hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
-	return edid;
-}
-
 static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 				  enum drm_bridge_attach_flags flags)
 {
@@ -1390,10 +1374,19 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 {
 	struct drm_atomic_state *state = old_state->base.state;
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	struct edid *edid;
 
 	/* Retrieve the connector through the atomic state. */
-	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
-								   bridge->encoder);
+	if (!hdmi->curr_conn)
+		hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(
+			state, bridge->encoder);
+
+	if (hdmi->curr_conn->edid_blob_ptr) {
+		edid = (struct edid *)hdmi->curr_conn->edid_blob_ptr->data;
+		hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
+	} else {
+		dev_err(hdmi->dev, "No edid in drm_connector object\n");
+	}
 
 	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
 	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
@@ -1417,7 +1410,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
 	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
 	.detect = mtk_hdmi_bridge_detect,
-	.get_edid = mtk_hdmi_bridge_get_edid,
 };
 
 static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
@@ -1425,7 +1417,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *remote, *i2c_np;
+	struct device_node *cec_np, *remote;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
 	struct resource *mem;
@@ -1497,24 +1489,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 		}
 	}
 
-	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
-	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
-		of_node_put(remote);
-		ret = -EINVAL;
-		goto put_device;
-	}
-	of_node_put(remote);
-
-	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
-	of_node_put(i2c_np);
-	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
-		goto put_device;
-	}
-
 	return 0;
 put_device:
 	put_device(hdmi->cec_dev);
@@ -1728,8 +1702,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
-	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
-			 | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	drm_bridge_add(&hdmi->bridge);
 
-- 
2.39.2.637.g21b0678d19-goog


