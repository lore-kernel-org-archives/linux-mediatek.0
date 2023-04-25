Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAB3C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eh4GXBQTeeN3DdxaOs5pVxlWxuVqOqd+rT6j8+6l8sE=; b=fjcxCEDaSy7Pt8H+I6BJDP+f2e
	FtPJRABouu4tLeAKBnNkbGZ7huPDeg2IaEK+gt3FD7T/4A+F/WNayLRkHTOfvdVDB4erWab0+HKbk
	VhW8/ebqTMkuWUId9iYlNK6K7iF9DuKIyVAGVb4kdCLWVXijFm5mpjx+YqNjmFz5ayg8GE3Q3CWO2
	SyHYrbAxn0HJlBj+I32XHhW+QVr7gmeQYZPxt817lSMeAGyNHhpdXbczro3G87p/b/WQwLP5ehQj3
	l0JvM5AqsVl3W5Wz5wAG7BE1IuSMuLcbXvAEK4ibqcJEhDgCXSccyqANyM2qt66imAQtqcUcEdqeS
	etkvZRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prIl8-001EeH-2I;
	Tue, 25 Apr 2023 13:31:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prIl3-001EWa-1r
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 13:31:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f19afc4fd8so21955195e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682429458; x=1685021458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh4GXBQTeeN3DdxaOs5pVxlWxuVqOqd+rT6j8+6l8sE=;
        b=i5QsdqollPNfcncQQEct9tIVIBdnrKJeZc3eFnysExlh3i4xDszbMag5cktSnxtV2p
         sbuXBvzAfsOtLCIjIRQft0OEriAEzdSsneG1l/zY9VSduSznZ1RTHqBDw4d3ffPomGRm
         xBqgGeYSZZ6QJbE1svq2CFPyY48SCMdoOQ2R5/CB21o2D+LssoCHHI9P9Yt9TM6ch7Zs
         IMXhm0DmQwACXr1vQ6Pr1U6ba9QyK0oVGHLkD3y4fQ2Y2676V89e23qCg0YZWMyFATEu
         mb2WYuarZ/mpKl7FG5aYqJTZm4L+/Lpg/o0EkcM02iek47DZevrkPmPz07EiYeQFbxc5
         Pn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429458; x=1685021458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eh4GXBQTeeN3DdxaOs5pVxlWxuVqOqd+rT6j8+6l8sE=;
        b=lge6Iresj6nz4aXg7Iyzh89ntXefL0bSk14NTQ4G66XiunVaQTDdIIv0BEBtkmWEAT
         0cwjHYYaeEThDR/V97jtBn/0x9W5qGKSWdzqHhlYmK0oMWUtTy//5CemG9/mgLFM9fQu
         DF+NJf+8iBlp0Rwtk/8y+xMldiEsGn5mO9eQ5u3pmYVTAPVXmIZtCvzUwaqzWInTuGj2
         MIXMYZcpr2dTdTF6xpbJqfxy80GUkiony/VyskO1i9OFnuwV1Ro7F1aVKkwoljJA2l3m
         QqHRz4X1e0YFZXITooHi1xmF1p6+kt6lCwYrkD/VFBNDdrHW/fbxwxdAUi6/hBh0oFp7
         qSqQ==
X-Gm-Message-State: AAQBX9eiWaf/SwKC1sD56TULMXBY5bCRzOsCiT8Qsg3vwxTCqRA8gFPX
	TqzSEpk6lWJ4LRr5ejOIXmLYKw==
X-Google-Smtp-Source: AKy350ZKZyuO0Sg9TwdCmnSzf+Gqp7U+OucY+l2AQvE7H7aj7k8OrWIxVGzwl7JhuxzVDKWSWUlZwg==
X-Received: by 2002:a7b:ca47:0:b0:3f1:9acf:8670 with SMTP id m7-20020a7bca47000000b003f19acf8670mr7954690wml.22.1682429457838;
        Tue, 25 Apr 2023 06:30:57 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b003f16932fe7dsm18575434wmq.38.2023.04.25.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:30:57 -0700 (PDT)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v2 2/5] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for mt8192
Date: Tue, 25 Apr 2023 15:30:49 +0200
Message-Id: <20230425133052.199767-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425133052.199767-1-bchihi@baylibre.com>
References: <20230425133052.199767-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_063101_613914_910EDB30 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add LVTS thermal controller definition for MT8192.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../thermal/mediatek,lvts-thermal.h           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index 8fa5a46675c46..5e9eb62174268 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -26,4 +26,23 @@
 #define MT8195_AP_CAM0  15
 #define MT8195_AP_CAM1  16
 
+#define MT8192_MCU_BIG_CPU0     0
+#define MT8192_MCU_BIG_CPU1     1
+#define MT8192_MCU_BIG_CPU2     2
+#define MT8192_MCU_BIG_CPU3     3
+#define MT8192_MCU_LITTLE_CPU0  4
+#define MT8192_MCU_LITTLE_CPU1  5
+#define MT8192_MCU_LITTLE_CPU2  6
+#define MT8192_MCU_LITTLE_CPU3  7
+
+#define MT8192_AP_VPU0  8
+#define MT8192_AP_VPU1  9
+#define MT8192_AP_GPU0  10
+#define MT8192_AP_GPU1  11
+#define MT8192_AP_INFRA 12
+#define MT8192_AP_CAM   13
+#define MT8192_AP_MD0   14
+#define MT8192_AP_MD1   15
+#define MT8192_AP_MD2   16
+
 #endif /* __MEDIATEK_LVTS_DT_H */
-- 
2.34.1


