Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB12C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZC5qBAJSZoc9F7aAJWQir3KEki0DQ4UHR0bP3Rd8Do=; b=Nf/x7gZmXArmP2YNrAKFT9l7kS
	d8aOovREcmcP2bbic859KGxm9mN5HQK5IlJOSbI8UiNXGvyNdwOnooVTC+S2o8JprIxlqwidcc2pu
	JO1467nUAu+qd51MlU81OfLLfcF8SK5z7ysBWPJFQfnD6OO2usK0yueCCRpnnI/ptTQrDbUT7RTdi
	7xruQjT8nFwbJpD78jYt6OW4TcFcm83+GgoZYrBEBuTBHy32tHra77YeoZu7A4D1uffZiDrdnxXFR
	PqHcTLopc59gJEgF6cXBOQ3YcexJcrDuTSFfpZ6Rk3kedLwHpPvMxqTdpMf+Kh+xwvSURwf/TPGww
	HzhSd2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHER-00AVpF-Mf; Thu, 09 Mar 2023 14:26:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAe-00ATk8-3C
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id az36so1274564wmb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZC5qBAJSZoc9F7aAJWQir3KEki0DQ4UHR0bP3Rd8Do=;
        b=oP0/Lrrq4QP7wG1xGKH1MmJdPBYEDwgyHwrwkjyr2Tq5EczUgB+S8p5ir7hnn4bkoe
         txH9Cu7PzrPdW++3Cr4Jh5Sx8c49BQ5o6QRE9lNrq/yehjO+ZYKxaDXqlZQKlLE63fbw
         Q/euy6mNPh7YutiFYWDCBxhy2x50NVFwvO3tHBcTM3Z5bhNSMwUo6Mg2sgqbV5fB0SUA
         BJ1pxJvHbJKw2Sa1YB/7xxqz9+/aNK6yR45z1OioaqkmIaAgMS3Cpl4Jl1Igypk6kSq1
         n68EIZF6kEk04/oTKS/zau+SXTvEjviqfnTJiK7+7jBR2UILSZmSB1wgSew0RzqKT27v
         7YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZC5qBAJSZoc9F7aAJWQir3KEki0DQ4UHR0bP3Rd8Do=;
        b=Th2wwoyOaZqMVxxi9BpMyVL4SL+VIfqnVDAxBD7O4LxFXA6MmNCdEsRoRcqxzC2Trv
         wK6DypS10+2KaZ3MYFLl4stTOdUbSwSEXV1qZTd+jXU8yhZbFWieTg3HuN5Lh81XUklq
         V+WYa2w0/yE0Wo3uliEhrCn+0EQG5O+OYZ5cOXndJAwL1ElbtYsGRVpFF+3t80VtPW2m
         87KCX24deIwC/GJGy2wYXzk6a2BDG4A4jfA1Ay500XMn6uxf6dPwxZx7OF7MieoAvE84
         C8S9hNHjDm2ZH2CicsQFPb0lXKEWVt29rrodTWnVM6nh0PYF93/qW2w0EfYBH1vZG8g4
         NKig==
X-Gm-Message-State: AO0yUKWAYgrGLH2R5ijQ8ebeKn7PvFj+OlBqBYinhGBx85RTLfAgKOey
	boPxXBoQwc+Sy+41pWm7hRgPFw==
X-Google-Smtp-Source: AK7set+xR4QnuyIEHutoKQUxDYs1BLAEQW1vv2GUMN/llQrli+vHu9zVnxMe8Jp+XhFb5k0pIeKO+w==
X-Received: by 2002:a05:600c:154d:b0:3e2:f80:3df1 with SMTP id f13-20020a05600c154d00b003e20f803df1mr19947002wmg.19.1678371782245;
        Thu, 09 Mar 2023 06:23:02 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:01 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:54 +0100
Subject: [PATCH 05/21] dt-bindings: display: mediatek: dsi: add binding for MT8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-5-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Z+PD/HG3NE11BJ2mTh036njJugWMt2nd1u2eHOQBoCM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+GCL8xvWFL+ptlpV3sehG4PpJ38RbAQS5rbt1
 +Ile0c+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURSWOD/
 9RfuBFai2OHgcbNDhBzV0pUToxawUcIM3OnPZa0zVRov//1BJKpVqfY5nB3uMzU7aUXdTFXILuEV3Y
 XMk6nGH/5WIoS/TXKdPQKAKItedpW9wJWMg9YycRwSgObQVHiqtbDYwPxueBiWcGr5cNTuzegKCQdd
 nHqP0LzC4lQtM8swPcR7yTVL8d6o1SDIl9/3jSLzfDm32lwOt16s/MjjRFSddVisyGhoRm0oa+DYA8
 uFsY2Vc7ZwRN+iQk9uSGjvirfJwR10NhMC64IcsEcZcGlTO8nWnmENG8IOX2FLOwC8n4O5G91bYeOf
 H+d2lMt3ASfXD1ag93MJKISomTdNek7is8WhVqvsq3UTFuepZfZyZFSpnP0nEl7uOCjgGsAu/QkisQ
 gWhI9IoW+nw39HKpiyYLVJpIFXgxp2YHTAv7jMPZZVcbqvS2jPeWh7550ejhGVYM1mQ6vZp2zqrbOz
 Dif9LCNYN7Cm8QKZHVdZ1U6I+/oxaChwQDdto+TitOT7YUfi3dQpnMG0kYQwun5aFedwVscYdb3t88
 kC6eJ28KWE35E/k6FrIkEP+nTZPi33eBFRKRGWbj0ye+e3YBNKtsWfkT5deDzJv+Q7lWGemrWREABe
 2QfQw9AbCo9mgtDvpa7aTIfyx//JKOTRJ+imxN14T1j17fenhKSfRrzuFqRQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062304_169426_1862745D 
X-CRM114-Status: UNSURE (   8.43  )
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

Display Serial Interface for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,dsi.yaml       | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 4707b60238b0..b6579d3effc5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -22,13 +22,18 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dsi
-      - mediatek,mt7623-dsi
-      - mediatek,mt8167-dsi
-      - mediatek,mt8173-dsi
-      - mediatek,mt8183-dsi
-      - mediatek,mt8186-dsi
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dsi
+          - mediatek,mt7623-dsi
+          - mediatek,mt8167-dsi
+          - mediatek,mt8173-dsi
+          - mediatek,mt8183-dsi
+          - mediatek,mt8186-dsi
+      - items:
+          - enum:
+              - mediatek,mt8365-dsi
+          - const: mediatek,mt8183-dsi
 
   reg:
     maxItems: 1

-- 
b4 0.10.1

