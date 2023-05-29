Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFD4C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2Sh4+A1b+81wZLAVdTRbrmRS09i1jRPbv5H6IWS80Q=; b=UvjvuX2Co2F8mvsy1V3q6RRNr1
	51XawFlr+hSogYGR4oDbd3c2mFnxyGDlOFTKdJz/fbiy+yj+BK+3DU5dDFVymgzdnAVU5Hgikrl91
	PSETzrut5JqhO0nP54PVpZj0okqhCkWTvfM2a9eYfRfRn2tSz5qasY5qR7uX3K2FoDKfm6t4cuDid
	hAQETdoTkiENfgif8G+UaPGIEJejZpnPPSdO4SYZojrlay4Ntt0JVc5mRqGDS8Xs1nt2otGxLoikV
	OgBE7wa6p2hT6YLuLxhnahhdz33yZhIEktiZBW/g1Fyj4uX/TqiQ6EUcrf5LMdyrTn5PizSbs0Wzk
	6JZtaQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fuw-00B9QF-0l;
	Mon, 29 May 2023 16:40:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fut-00B9P7-22
	for linux-mediatek@bombadil.infradead.org;
	Mon, 29 May 2023 16:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c2Sh4+A1b+81wZLAVdTRbrmRS09i1jRPbv5H6IWS80Q=; b=lmRvxo1sxEH+7bVlur1jNlsce9
	kU5GYhwgttZ2XA4bz9ijvrROdf2mjypmnH0L9egtX1W6QabCIg4oHGPVROVnavs0KzdQRAQ/VhKYL
	vYVwc8DqrmiSdUFhSzweaLVZfpNuNIVp++0I7YKJzPG/w+dlySadSW0vOxWHTvKEDi79KL/U+4hUW
	Ovd00/TA0GF3aC28Kt5sIY4hJDHT6pEUBJDheQsf9DN5TJq0YK9Bd3R8d05BMnmiN9ZDq0MmzcZkF
	957xPOJHrKL0/NLNp1iQRuYZdmBv3oNDCCmE52sBgYY04d4pwCQUqr44DQWucn0W8/itYI8EzDJq1
	ep3hx/ag==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dzJ-00BudK-2M
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 14:36:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso6080077a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685371003; x=1687963003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2Sh4+A1b+81wZLAVdTRbrmRS09i1jRPbv5H6IWS80Q=;
        b=hiSqot5Z0TVVzkwYkmdjRaFYGpVkqZ/2l7Z8d2ugq5qKwMiONQBL1+GBaWbf/yIP7z
         CUE1CBJ5ZqXFY9WXRrUezsKC9Wwr8XoT2GKDadeS36vWTMSqxPY4v4SEjYGwJry/LaVq
         /o/qOzl/CNrpF9Or/4l+K6JF4xQQu/hUD3RvCC9UB/2uJ9LOCiZf6xO7Gn4v1hweuYrb
         kRI31ThOkvK8k/B7vfN1rk58gZ+tR0XvafgFGcBCa6m61qLXsXYrYOPFkxnxOZ7IiIE8
         tzUUttynUa0Iqjps+GkZo9CoNZ1Y6KAVVMmAkQ9oB5EyCrBJgYl0n/WOL3A0GatmdRxm
         zVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685371003; x=1687963003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2Sh4+A1b+81wZLAVdTRbrmRS09i1jRPbv5H6IWS80Q=;
        b=Qjv8CPYh+lIv+AMJ162t8WVjEZqXjORDri93Yx2xxeTzCGbumj0RMrK7sxLNB5OYnE
         S8c1E58kkWX7emkChBkTx+SIlfdYq/YVdGPYs10Ssfp3kFMfduasM54Dh3PGLg6NRJa1
         0AyUboWqFSRFSQ3jizBAEqitY1Pkyv+ldrojkANVYo0d6tjocFKBQGKGCJ0TyYsUv4E9
         bnoSYdwmtgk1mC+/eZ2TBSjURWpm4lev6F++qWZHayX9LGdl2GRkjPEPCd6Yf3GAbrTS
         31R0/TJuwEHuUzGunChmam/ZyLqlETcRcXyCT3U4GSliw7Bk/KCuUUgit0vvBbYB5Vqn
         Jadw==
X-Gm-Message-State: AC+VfDw7YdfngNDG65nSoJ31UmW1nU+p6w9MjzUfDDiGPvk33g6R3zwA
	rJK09DyI6r/9FRm+ImFQIGtHxA==
X-Google-Smtp-Source: ACHHUZ5waXscvjoYNWcuy+rA2rbzsNFah4xpic6XPGtTh3EC757yb2ISi5VAAB9m/SKenAeW2NEWag==
X-Received: by 2002:a17:907:c1a:b0:973:84af:66e5 with SMTP id ga26-20020a1709070c1a00b0097384af66e5mr11058579ejc.40.1685371003383;
        Mon, 29 May 2023 07:36:43 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 07:36:42 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 29 May 2023 16:31:01 +0200
Subject: [PATCH v4 4/8] drm/mediatek: hdmi: make the cec dev optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v4-4-687f09a06dd9@baylibre.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-0-687f09a06dd9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mac.shen@mediatek.com, stuart.lee@mediatek.com, 
 Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_153645_980103_D68780AA 
X-CRM114-Status: GOOD (  17.46  )
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

Make cec device optional in order to support newer versions of the
hdmi IP which doesn't require it

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c        |  8 +++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 52 +++++++++++++++++++-----------
 2 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 41a7593887fb..4c382aeb94c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -925,10 +925,11 @@ void mtk_hdmi_clk_disable_audio_mt8183(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected;
+	bool connected = true;
 
 	mutex_lock(&hdmi->update_plugged_status_lock);
-	connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	if (hdmi->cec_dev)
+		connected = mtk_cec_hpd_high(hdmi->cec_dev);
 	if (hdmi->plugged_cb && hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
 	mutex_unlock(&hdmi->update_plugged_status_lock);
@@ -1024,7 +1025,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
+	if (hdmi->cec_dev)
+		mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index ead0c30f55b7..d7f3d29138d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -110,28 +110,18 @@ void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz
 	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
 }
 
-int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
-			    const char *const *clk_names, size_t num_clocks)
+static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *remote, *i2c_np;
+	int ret;
+	struct device_node *cec_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
-	if (ret) {
-		dev_err(dev, "Failed to get all clks\n");
-		return ret;
-	}
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
 	if (!cec_np) {
 		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
+		return -ENOTSUPP;
 	}
 
 	cec_pdev = of_find_device_by_node(cec_np);
@@ -141,7 +131,6 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 		return -EPROBE_DEFER;
 	}
 	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
 	/*
 	 * The mediatek,syscon-hdmi property contains a phandle link to the
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
@@ -150,12 +139,39 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
 	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
 	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
+		return PTR_ERR(regmap);
 	if (ret) {
-		dev_err(dev, "Failed to get system configuration registers: %d\n", ret);
-		goto put_device;
+		dev_err(dev,
+				"Failed to get system configuration registers: %d\n", ret);
+		return ret;
 	}
+
 	hdmi->sys_regmap = regmap;
+	hdmi->cec_dev = &cec_pdev->dev;
+
+	return 0;
+}
+
+int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
+			    const char *const *clk_names, size_t num_clocks)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote, *i2c_np;
+	struct resource *mem;
+	int ret;
+
+	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
+	if (ret) {
+		dev_err(dev, "Failed to get all clks\n");
+		return ret;
+	}
+
+	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
+	if (ret == -ENOTSUPP)
+		dev_info(dev, "No CEC node found, continuing without");
+	else if(ret)
+		goto put_device;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {

-- 
2.40.0


