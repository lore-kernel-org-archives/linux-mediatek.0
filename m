Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7353DC04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRK4u/u6GjShtJ9g8bcUM1XPaEOsUKZUUqbfqiifYIs=; b=uHfush9DSuYdrW+oIEYoDv9KSk
	Vo4ZxeMPqhQ2AijVaM0r25MZjIJnDsGfwQ/KFtK7kR2h5JuMLDMu0ylMTBsNX1CbwV2TEpd9FLLNX
	ZlfFWW/yMRM88/hgxRMjHD+/yIl/qHtzKMYN8s32ziLFSI+lMWgCzbRyvFquPcqHNtFZgVNltspwZ
	5xpu7SMC6fHMEieVK+16AQI8lNvpSuJatfZjisKS+KZfCn9bjhHcegKbF3Cc3PzIoGxCDDdhf5YeJ
	pN8AHyNFPzbDzTYl7GSiaQ1pZPVA6bhUx5DzL7IS82YsCIexGE3P6RU4YfIrtALQdWzPvEjzrnho+
	iMTSPcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEU-006fRt-17;
	Thu, 10 Aug 2023 06:33:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEM-006fLs-0S
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe4a89e7efso4357325e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649186; x=1692253986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRK4u/u6GjShtJ9g8bcUM1XPaEOsUKZUUqbfqiifYIs=;
        b=EKOLsf+ykA5qIQjzzOus1wbbzFq81JXaJvdLkG0mm3Ei/C2xTDE/Wu8pEO3Adhv1sB
         a8fYpYw1hxGihI1MFUifamdPmJH45ZV8HDggIKT3v396ZMr2JyDRdg4/D9PmrKPpCvPL
         8EA8uAJyzKgvFa/yGogo535vvEIkekTvq5q7u0arTD8e0FY1RGFxH2bC/gCqRI9mbS9Z
         aXWnnIogjDkXyOz9T65Ds170m+XMLrSZ4mQOUEJGTsXUZGNMpMsdTEyBALGWponNQ0nj
         a+D3erhbaW+s3A1Ll/jbyvpMMzlDhOPzMTwzJf18WEgJkTn53cmJNV7nVbKISH4GEA3+
         zMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649186; x=1692253986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRK4u/u6GjShtJ9g8bcUM1XPaEOsUKZUUqbfqiifYIs=;
        b=kTwXEqalXEep1WqTsi+Jgkj+vYH7XrLYKHutpYQIhr4ETKR21AbYFPdAmTz504KQhO
         L0Lqb4ufyqjwBLthbE9zhmtbB1426oqVD+VKzxdASd46eTCqkEkOLlbPy9OmqEvZqn45
         yEegoabobxXo5wn0h+gj2Vi5MYhcBc4Bire9DHE2YJdhTTX0FgypXLma8XCKuuO+QV2+
         PLVYRJe8Ho8FyvuChqm6q5CWhListxFPMZ8hGwH8hhuizsE6h8Wtjfxb16vUP3+KQPCK
         2RPcJDhdTNPwKv39KiTZ5Qeiuw1fWqCIEFivJiaTHhtjEixgWeb2GtFE78x6Dn+1wAZb
         oOFg==
X-Gm-Message-State: AOJu0YyT2CGVSZYWkb8P/avu74hio6skKl1f+1/o2H/5DhoTybY492JS
	EepSBuo4j3Y9jmPU2KDUcRC3Ow==
X-Google-Smtp-Source: AGHT+IF3jK0RC64l2dE7mBJal346hXqt7G4hF0HjJMrFLuF9HMUsWWO06rStb8U1TvYEIzfEW6pMQQ==
X-Received: by 2002:a1c:4b0a:0:b0:3fe:212c:f790 with SMTP id y10-20020a1c4b0a000000b003fe212cf790mr962281wma.36.1691649186466;
        Wed, 09 Aug 2023 23:33:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use common sound card
Date: Thu, 10 Aug 2023 08:32:50 +0200
Message-Id: <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233310_178945_E9280432 
X-CRM114-Status: GOOD (  11.59  )
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

The mediatek,mt8188-mt6359 Linux sound machine driver requires the
"model" property, so binding was incomplete.  Reference the common sound
card properties to fix that which also allows to remove duplicated
property definitions.  Leave the relevant parts of "audio-routing"
description.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/mediatek,mt8188-mt6359.yaml  | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 05e532b5d50a..43b3b67bdf3b 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -9,23 +9,19 @@ title: MediaTek MT8188 ASoC sound card
 maintainers:
   - Trevor Wu <trevor.wu@mediatek.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     description:
-      A list of the connections between audio components. Each entry is a
-      sink/source pair of strings. Valid names could be the input or output
-      widgets of audio components, power supplies, MicBias of codec and the
-      software switch.
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
 
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -86,7 +82,7 @@ patternProperties:
     required:
       - link-name
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
@@ -96,6 +92,7 @@ examples:
   - |
     sound {
         compatible = "mediatek,mt8188-mt6359-evb";
+        model = "MT6359-EVB";
         mediatek,platform = <&afe>;
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
-- 
2.34.1


