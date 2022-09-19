Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C9EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8hZh96h7kcVe0FwyV/2fd9otBYm0/NItAoi3rrV5Yw=; b=ewqql8zVBhYL+xXu1yWne2bRnC
	79Te/+K4oqOq/n/EGAd8nJUO0+HUXWCYd3ObPetwR7calgOSRCCUFdKNMH2TMa42L8lJuFjFF7sO6
	BFeXqF9Heyf7V/XOar2UjMpEpxyGcqsQ7kLnWh0/M/LYkQRdN5DmFGyb4+C1DAENXgRjL14pyS5pk
	MvbEGM95x79w6dbmiI4qv7sJop9xKzsnvuqDs9ABo+9kaiZlr93YiUbYfX6LEFAN1Gp/4m+fBgx4y
	IwPWyg7KeOGxk3XTnDXM3I3dZd0tWijX3xzRiOCS4xGxY1ORQGIRIB5zoEElOuh5U7GOHM7EMCYBE
	s0Dkni/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL8G-00DXEx-N9; Mon, 19 Sep 2022 18:04:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL7I-00DW7g-NY
	for linux-mediatek@bombadil.infradead.org; Mon, 19 Sep 2022 18:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g8hZh96h7kcVe0FwyV/2fd9otBYm0/NItAoi3rrV5Yw=; b=OC3CNM3EtJjYBw9/raIL8SP1Jc
	vDZG+lyRoR1DdZDVLbpkwKgrqDeaD4IMrD2p5UdMBuZ4AAPv8eYvRxC+qrzFvhdoN5u9ATtTViS5w
	maVcbz14mqOmbYmpu8BJLFDsU6g5uCNPnNm/4CggDKca2Wg9bTC01saKyP391rtfkK7cUmZOVEcTp
	itzJ9LzcvXJc55uz7yjN9Mta9+il20qM1Q4WnleYpDnO71Jkt6U9DlnwurZdey2eoIBPlYMLceFBU
	sXKmANfwyboz/NvS7Z4SvTyKVLQz6+c6cEA00AybAEheuQEt/mPc+8+5YVYVgiEw0HQqvz6Lx4y5i
	7aGALKFw==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7o-00E8GY-La
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 17:00:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lc7so260317ejb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=g8hZh96h7kcVe0FwyV/2fd9otBYm0/NItAoi3rrV5Yw=;
        b=xLxEGxkLE9ts8PrWjFZFQCdOiglt2QkS+aUCn873bVHln5LsU0bvqAVn5LFP05/Yyr
         Q3qRpEst57E9SGRzI8qpwLl2n81lnV7mXZ8ciDQ4f+3wWKaYsFb2M2yp0JVu14Rkzx4t
         imIkYqSNoVVEaxFbAdujyag9f5p4E4p5mOkIQP3u5LxjGS3mUDhFyoxzELq+k/uubc9L
         MZrTbOobCprscw8nBrp+kaWxRcV20dNkKLyny7J28BijqGfXNFdD0jNIoHenj01MLEvJ
         CyJJL8ZP5n7MOZGHu2N9lqRQedIinPzfrVndKqNhcJdYpXLaOzgQFoR/WoFNLT2htXpU
         HC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=g8hZh96h7kcVe0FwyV/2fd9otBYm0/NItAoi3rrV5Yw=;
        b=pe0IT/jG1guICjrLCunrmp/MZLyq8QPuk9LV0abA1JxNRgRjWHyOpjt4laeh6VWfEP
         aaIlQjLsnuIFvGYYQwdsDfVN8IEfUkOO7t8AO3fdWo4SDfv/BjaQu6k2SQ3mTM9griPt
         zXGGxzb78D610nkyULeIlPVTZ4gwOe+swyxjE9OhRbhs4MD3HNU1jyNxDBzqiVSfJd2L
         NuN8vp3Y2oKmMgUpkwv11mfJkouyjT7Tpz/byPL/X3aSY3ZJsNDxnU+VtT52T24JhULM
         LRy1UuvSYZ0c7RYaVrpEpdzXfwG4R6RtaMMDrePea8fbXXtG4EkphBkLYxftFiwR/skM
         311w==
X-Gm-Message-State: ACrzQf3KEuFLliysrNa9532pHzmMkB5qOxBkqXbO23IzZ7dcqynKu1L8
	1s2nHh24bD3yZDQwfzF50U2MLw==
X-Google-Smtp-Source: AMsMyM4DJI7JfhQLtMN2LYTOhc8B3W1+i58GmxhTOF/MVrCsnqMqyiepx3Iq5rhTvArkC9ga2QF9Xg==
X-Received: by 2002:a17:907:1ded:b0:76f:af8f:942e with SMTP id og45-20020a1709071ded00b0076faf8f942emr13451537ejc.120.1663606802567;
        Mon, 19 Sep 2022 10:00:02 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:00:01 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:07 +0200
Subject: [PATCH v1 09/17] drm/mediatek: hdmi: add connector flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-9-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_180005_628677_5A75E064 
X-CRM114-Status: GOOD (  11.48  )
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

Add a flag to indicate support for an external connector

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 86653ebaacfd..30407603d693 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -199,20 +199,22 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 		goto put_device;
 	}
 
-	remote = of_graph_get_remote_node(np, 1, 0);
-	if (!remote) {
-		ret = -EINVAL;
-		goto put_device;
-	}
-
-	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
-		if (!hdmi->next_bridge) {
-			dev_err(dev, "Waiting for external bridge\n");
-			of_node_put(remote);
-			ret = -EPROBE_DEFER;
+	if (hdmi->conf->has_connector) {
+		remote = of_graph_get_remote_node(np, 1, 0);
+		if (!remote) {
+			ret = -EINVAL;
 			goto put_device;
 		}
+
+		if (!of_device_is_compatible(remote, "hdmi-connector")) {
+			hdmi->next_bridge = of_drm_find_bridge(remote);
+			if (!hdmi->next_bridge) {
+				dev_err(dev, "Waiting for external bridge\n");
+				of_node_put(remote);
+				ret = -EPROBE_DEFER;
+				goto put_device;
+			}
+		}
 	}
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
@@ -325,6 +327,7 @@ int mtk_drm_hdmi_remove(struct platform_device *pdev)
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
 	.has_cec = true,
+	.has_connector = true,
 	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
 	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8183,
 	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_audio_mt8183,
@@ -338,6 +341,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
 	.max_mode_clock = 148500,
 	.cea_modes_only = true,
 	.has_cec = true,
+	.has_connector = true,
 	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
 	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8183,
 	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_audio_mt8183,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index 921bde150e11..62a14435be69 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -32,6 +32,7 @@ struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
 	bool has_cec;
+	bool has_connector;
 	unsigned long max_mode_clock;
 	const struct drm_bridge_funcs *bridge_funcs;
 	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);

-- 
b4 0.10.0-dev

