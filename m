Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76521C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRUarQyWTXy/UaQ+aTCiS9aEshqx6SrntwaJME4vnY0=; b=o+owAsZe5cMD/55WO/F9pAgWen
	lyy7+33VQmSG7lIoWqlRzl02VGSkhZPOiqZ4ocvtZMja3CjWD+ONbtj4hik59GO3Heo+XlmdHeMOt
	oz40yMeZW9ged56rA+GY3LtYNLmOjylJnQR2DovmlHf1ARVhxCoHPytAjWWZJ3zS0C+NrF6fjrppq
	VWV2lFwPsxR9oPvvvSEaGxuv6sOKgYtXZfou6onTmxVqm/6qrsgQg7y+oUzaD8/s4QihJeJLcf+z6
	SnLJ8nQJCNMYWwVkaoyui6hTapGL71nYgfXGwqmMvWaJ7Vy1asCGrV2LOJbH3zxwt5YNm3OhmbaoR
	CE7XBMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDs-00Gqco-I7; Sat, 18 Feb 2023 11:17:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDf-00GqVp-TM
	for linux-mediatek@lists.infradead.org; Sat, 18 Feb 2023 11:17:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id e14so1831321plg.8
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Feb 2023 03:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRUarQyWTXy/UaQ+aTCiS9aEshqx6SrntwaJME4vnY0=;
        b=FhaH7iwlgirzBhkctvbPIaE33nUBelcGHAF8fq0lsjOkQ+cusRFz/4cccjVw6NEftK
         PpoX0TZ8w3vqQVGe5P/lYxblKHcsFlSVpBKNCV54TFjvgawSpSzJc1EE02sPm2cIp82b
         392DVfxuznUnL2wiI4prL2FfCxja2ElN7chAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRUarQyWTXy/UaQ+aTCiS9aEshqx6SrntwaJME4vnY0=;
        b=3i9FYov8PeBoCXHcSrhJC+DVsHUZJgZhaJSnj7+6Kme/8WH61E3CSFYPurUDIKQqbG
         X0ILwnqybLdsARFjI84gJlmMDPc2/Fh6ejZ1Hb+lTlkKUxtFFg5WkKVjKSKO9xDnDvRf
         55Yz+hKFFPLSLzP08dR4Pr538CljWEp3hGtJ6nlI/yUhR8R8B2rVtqpTuFFjxXwIUy0d
         oDUIzAfU5AwAAqRvuXzippaVxlis4cfAinQ6mX3PMhN1GYe6kOuVD1C3kZ4b/AJ052p9
         20o0s7ZzuQxDROtoo7f+bZCy/SJ0MDgLSkGYZ+FMVAEsW6/nCrx7sGsoTbuCeP5fLWg0
         h7HA==
X-Gm-Message-State: AO0yUKVAUUxqug9m3yoEWq0QsfIKee5ovWwpBzNV8MGRPultwRgSbgkL
	8n/Lpe5USZg8D9Q37OVycuV0Yg==
X-Google-Smtp-Source: AK7set+FohWYixBOFWTvodfYG9ONEn4rCbUp2cY1CE91qYHZ6E0/D4C1ES2aYaY6oImj8VUL+8mG8A==
X-Received: by 2002:a05:6a20:1610:b0:c7:5983:7a82 with SMTP id l16-20020a056a20161000b000c759837a82mr7002881pzj.27.1676719049830;
        Sat, 18 Feb 2023 03:17:29 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:29 -0800 (PST)
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
Subject: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for anx7688
Date: Sat, 18 Feb 2023 19:17:08 +0800
Message-Id: <20230218111712.2380225-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_031732_787062_8EC14819 
X-CRM114-Status: GOOD (  10.28  )
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

Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
allows the bridge to register a .get_edid callback.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- New in v3

 .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
index a44d025d33bd..9d5ce8172e88 100644
--- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
@@ -25,6 +25,10 @@ properties:
     maxItems: 1
     description: I2C address of the device.
 
+  ddc-i2c-bus:
+    description: phandle link to the I2C controller used for DDC EDID probing
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -59,6 +63,7 @@ examples:
         anx7688: anx7688@2c {
             compatible = "google,cros-ec-anx7688";
             reg = <0x2c>;
+            ddc-i2c-bus = <&hdmiddc0>;
 
             ports {
                 #address-cells = <1>;
-- 
2.39.2.637.g21b0678d19-goog


