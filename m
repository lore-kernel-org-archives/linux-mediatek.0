Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F1AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSYD3hSXr5dSGBwwFhgmPY+Jg1epD5ze6gJ/T99kUGE=; b=46bj2gwj5pf/XF5yYRhjpgHPD/
	mX5dBiD4Atlfnvby2gGlWatL9S+0Z+BswLHl8yfLtyhUvqOxIUkzUNs/5lxmZP/EVqxIbvwHgsUDU
	T8VHWpB/6O3AJiGnOgneOu7/QUyA2hb4+tPYa4VT5PygRVHQywKSNB2WI7mwU/veCDWefxUeX006L
	WufdDTLteVFaPOJd7bNa3MHowcme9SypWi1lyABsTd0WHhPIC7sEM+EE+c1cVqU9zJlgNbS+vGdLn
	ZlF9SXORhTkkgXv7UbOe9KZMFp8LoPlyfvOlnnCSCfbUyqsSDyOM4WG1tDofjU5I0NpqMTbP6x5Ds
	B0kGg5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNAW-00FGpA-6n; Fri, 14 Oct 2022 16:04:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9t-00FGKd-5B
	for linux-mediatek@bombadil.infradead.org; Fri, 14 Oct 2022 16:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DSYD3hSXr5dSGBwwFhgmPY+Jg1epD5ze6gJ/T99kUGE=; b=O0w/J3NECIzPEm9qEfrfi9k203
	iVFOnd6Rd5iZWiDxzl1nXYHt337QTfN/oQ/LobCZzPYFxzbuos1fphfM0WAYhbbbSmrPCYaxBy+yv
	5MC7P+H6VZ+aG6JpExMGSd6wI77W1A8hRErqSczcOl8ruzu3sbKwhut/dh0IwwpFqCq5NkRpPXmHj
	WoZCMgDVWnGmyRzzlLpDZDY8ZqOpZTTs5s1un5IS6CE9QebJZl5mtpRK08tLcxPJa2oA6J5S52xwK
	oZDCLwJnRb0L8GsJzvXdfbN27zl4YHDWXjJnYANEv73xSBa+X3Plpt5+5jNTUql5irDTMLMRaAxQp
	mmgMALKw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMTv-003RGZ-Ny
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 15:20:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id c7-20020a05600c0ac700b003c6cad86f38so5590066wmr.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 08:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSYD3hSXr5dSGBwwFhgmPY+Jg1epD5ze6gJ/T99kUGE=;
        b=ekqWtXslf7At5Ea6OpJQLQVV7s78wmP9onNaVuxJ3jjwJzCyCK1WVwQ5H4sxdVKRDF
         caFQ8kO3SYuJvxYea71BwUF6uYy8GYsWwLo/6mmQOWj2L+bsRz6k9mhvbPecYjOEA9Xg
         Pq9zQD6J76O9oX1Pw2ataew4ZUnj8esopyd/vDEVfN0jR1eEoSo9fKGXw3kECjRy/Faj
         k2oauWgT+j/8aus8zy2SCIULtrOHyTyhPjcrciYPHvwcEwKRfqlgETLUxd4WL1b9Ekba
         J0lfgNFDLRqr7AEYqmLYEKfMn2uQBjD8b9kRQZY2umPihAuN1/jyhfN3HlR7sbyBNePz
         KDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSYD3hSXr5dSGBwwFhgmPY+Jg1epD5ze6gJ/T99kUGE=;
        b=DfvxgJVJsq5C8k4ZnvO7006htwP0jjfdcgJh19dLpmJSWRikoK8OwBaW0k0jEiMzXx
         K3TIDsfHuHh+HwgwcdW3etaWT5mbQNMLMeJ+9GkCNlSinnGiFgeqT6QKgdTXxMVm8M/x
         taXgpMAfZSnfAmAxwyewWkp/N8DUuElihNdT/TBEmp7UQ8JYNIs9QSLw8XbkM+e1OV2i
         w0Xz2ZA8QYT2ImvUt+gQlEmXStqQC4/j3j2wDATqgdF24LO0hE87/hawef/cDhrdAQ/J
         tg+wjjYsyIB6uxI51GXeGvqb1aZFCsGz5t9cPFStaMHTpkwp1VsbIn+5FFWgJcodS52e
         +Vag==
X-Gm-Message-State: ACrzQf18nsKOhKI9F7shvXiqOJvp1497olp/KL4XO2eQMkujuakcHjII
	iOy5B/Aa3NyaaXOwriFVyykieQ==
X-Google-Smtp-Source: AMsMyM5XuHi7AW9wwUe6mQ82tH2bVQm0eF90ywEnv+rb0RPIPcUHbvH6OzD+beMuhBr2PVbLwyrZWw==
X-Received: by 2002:a05:600c:4e01:b0:3c6:eba6:75a3 with SMTP id b1-20020a05600c4e0100b003c6eba675a3mr1574023wmq.4.1665760811060;
        Fri, 14 Oct 2022 08:20:11 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net. [2a02:8440:6241:7429:3074:96af:9642:4])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:20:10 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:15:58 +0200
Subject: [PATCH v2 05/12] drm/mediatek: hdmi: make the cec dev optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-5-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, stuart.lee@mediatek.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mac.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_162016_247245_5B49E0D5 
X-CRM114-Status: GOOD (  17.88  )
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
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 54 ++++++++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h |  1 +
 3 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 73bda2849196..85c6ebca36dd 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -927,10 +927,11 @@ void mtk_hdmi_clk_disable_audio_mt8183(struct mtk_hdmi *hdmi)
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
@@ -1025,7 +1026,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
+	if (hdmi->cec_dev)
+		mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 3f08d37b1af0..3635ca66817b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -137,28 +137,18 @@ void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz
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
@@ -168,7 +158,6 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 		return -EPROBE_DEFER;
 	}
 	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
 	/*
 	 * The mediatek,syscon-hdmi property contains a phandle link to the
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
@@ -177,12 +166,41 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
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
+	if (ret) {
+		if (ret == -ENOTSUPP)
+			dev_info(dev, "No CEC node found, continuing without");
+		else
+			goto put_device;
+	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index 7452bea91f9e..921bde150e11 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -31,6 +31,7 @@
 struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
+	bool has_cec;
 	unsigned long max_mode_clock;
 	const struct drm_bridge_funcs *bridge_funcs;
 	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);

-- 
b4 0.11.0-dev

