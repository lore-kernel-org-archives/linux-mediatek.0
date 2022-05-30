Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jh0cZDzxey7sMB2YHYxpuX3OoDuCWKfzt/KKsTtQqBk=; b=hGNhYhPojmXh9M
	AU5VPHGmyiYwRIp39aWZLhsNtojMn+Rbj5C1QaLSwwHq5ofWqD4tBuU8LLKckGtgzNmYV+ElyTc5r
	CrKJgewEZD21VnStxWGtl5gOsplCcPYhf09UaoerwQtgWZyYe0+Ll7cVJK+g2OIzMad99ElS44Jm9
	dip0UdeAy2sW4cLyrC87A+yLtRSMVg55E06Oh78VZOmeC/nhxHzCD8RuirKm6zNS4IyoZMBlcXJU+
	+Gp6obzG7doGLfJZ7ZqctXFQpybePw5LLEaX0UxIG7NfowXrI5NfSw7YcK54Tz4LvSJLMCJCffWBA
	VSan+YZTDFNTGHSHBizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvloQ-0089ne-92; Mon, 30 May 2022 20:16:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvln8-0089BD-4z
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:15:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d26so10410180wrb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSb7UJsPw6fMK+gU6mTIYkwhoB6cAnQoeEgSTcX6/b8=;
        b=ueLCtT8HrcGEyzdRDJmnkTKVUsCJvfppcoiRujOdqjJ6m+mcEENWGPW1E1dQV8M9Q9
         zA5C8YoLjTwZpAqaCXYpf75KEZLoxBV7kxjlL28SQBbWmWJrG8TnBXzL+Dk7FTuzNpF3
         Kn09zUv7N9xWjsLZQhUMXjxLZ2dGpq87apiiLcA/g7EsoCS/sYD7ajo1O1/1vqdUugqr
         9sO1ZPXTBwxSuv6CarfFQS8tFJ1G1m+0+RwDZdIIF0TRG+Kd8pEjXiqdKdza6zdtn4TG
         A5BXQY0WEPEjOre5d8ebOqo4QUISRsDGzzevA5fR9SXe5ai2Oo9w4RLguoDgyDujQ8cP
         Qhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSb7UJsPw6fMK+gU6mTIYkwhoB6cAnQoeEgSTcX6/b8=;
        b=v8S1k1e59t7xUxDpccuN2YTXyD2UtzGyZfSzBL1Nl4jSYMsKARTIGuL9J9tinW5v9X
         LkTAdrMVd85K3UvvxRQeZb1JA6Wt8QqKXHI8E3pf+6LeEVc1CWI4ObjEDBd7lyOv2y/6
         EN/maAFmtwBMoF2ZpXx7AHIiKTI7IASugVc8DG1a4H+9MruwWTcIsXOjfJ0DZencjgaY
         oRUa7lwpSVPgPyu28lw1ApbaO9Jm+zj4iyvERIE61/DiwdkW0/F5d0y9UkiAXOHEoZcP
         AGR9oJe2xZa4S9n0H6WR/J/jmmfh6w57RMIx2ocfUimjCnx7gwh/zeziWT2yzMnejro0
         9TAQ==
X-Gm-Message-State: AOAM532sOXi3N6AXejWXhre6NbS6q+53ybJzh2SK262G8FOQQ9KbVc+R
	mX/Sno3q4k6zrKNjxNSdwQH02w==
X-Google-Smtp-Source: ABdhPJwiSzKSg4qkJcPG/0zZ8t9Q6QeHPF/daPy2MXTaCiYXpMfO/YtIWydybS5kvNowbkqSfI9riA==
X-Received: by 2002:a5d:648e:0:b0:210:18f6:f954 with SMTP id o14-20020a5d648e000000b0021018f6f954mr11230877wri.323.1653941703895;
        Mon, 30 May 2022 13:15:03 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:15:03 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 4/7] soc: mediatek: mutex: add MT8365 support
Date: Mon, 30 May 2022 22:14:33 +0200
Message-Id: <20220530201436.902505-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_131506_242790_FE188CC3 
X-CRM114-Status: GOOD (  11.10  )
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

Add mutex support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 981d56967e7a..b8d5c4a62542 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -110,6 +110,20 @@
 #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
 #define MT8195_MUTEX_MOD_DISP_PWM0		27
 
+#define MT8365_MUTEX_MOD_DISP_OVL0		7
+#define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
+#define MT8365_MUTEX_MOD_DISP_RDMA0		9
+#define MT8365_MUTEX_MOD_DISP_RDMA1		10
+#define MT8365_MUTEX_MOD_DISP_WDMA0		11
+#define MT8365_MUTEX_MOD_DISP_COLOR0		12
+#define MT8365_MUTEX_MOD_DISP_CCORR		13
+#define MT8365_MUTEX_MOD_DISP_AAL		14
+#define MT8365_MUTEX_MOD_DISP_GAMMA		15
+#define MT8365_MUTEX_MOD_DISP_DITHER		16
+#define MT8365_MUTEX_MOD_DISP_DSI0		17
+#define MT8365_MUTEX_MOD_DISP_PWM0		20
+#define MT8365_MUTEX_MOD_DISP_DPI0		22
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		10
 #define MT2712_MUTEX_MOD_DISP_OVL0		11
 #define MT2712_MUTEX_MOD_DISP_OVL1		12
@@ -315,6 +329,22 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
 };
 
+static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
+	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
+	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
+	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
+	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
+	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
+	[DDP_COMPONENT_OVL0] = MT8365_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL_2L0] = MT8365_MUTEX_MOD_DISP_OVL0_2L,
+	[DDP_COMPONENT_PWM0] = MT8365_MUTEX_MOD_DISP_PWM0,
+	[DDP_COMPONENT_RDMA0] = MT8365_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA1] = MT8365_MUTEX_MOD_DISP_RDMA1,
+	[DDP_COMPONENT_WDMA0] = MT8365_MUTEX_MOD_DISP_WDMA0,
+};
+
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -423,6 +453,14 @@ static const struct mtk_mutex_data mt8195_mutex_driver_data = {
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8365_mutex_driver_data = {
+	.mutex_mod = mt8365_mutex_mod,
+	.mutex_sof = mt8183_mutex_sof,
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.no_clk = true,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -665,6 +703,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = &mt8195_mutex_driver_data},
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = &mt8365_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
