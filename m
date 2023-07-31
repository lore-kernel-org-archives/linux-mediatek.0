Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A72CC04A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMkdpsehTQiUEk5WvbiE/NK1y+1H3B3yrpjwlG6gOYw=; b=sd01CbXUj0N8DI7sz36asT8AeY
	7v93tgTc9nezGEUDqUtrEObRUeRJUETpJ0kuYsGmwbxV+iXpwqYY72OjW7PrhXdWTz4kQBvPkzPXy
	QQfQ3iaDbPz0u7kiCeGsB3ZWOO4esR+SSxt4gyOOqlkNbeXYO+cz6IENtVnDcWjlPwNFEZ9PP/9MT
	sMQPtdF8rfstOmE92IqTQqiIdTS74g+dduGIUTB4NXI8wg+ldylkpUlHAkKwY5JYIWDGrMcNo9q7f
	cKB+/K9GhXNXxTPYVXn8F8OE0MFv6IYOr8bp6GSM7qxDnfGYHgfthx6RK7qAHWXSf4kbTV9pRVU8k
	M/j2J7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPQy-00Enev-1E;
	Mon, 31 Jul 2023 09:43:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPQu-00Enc5-2y
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so903451266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796599; x=1691401399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMkdpsehTQiUEk5WvbiE/NK1y+1H3B3yrpjwlG6gOYw=;
        b=tn4w2YQmJTk0uY8ChJCamrtd1NcK7DH3BQF48MS47k8eGNen03b0H8BrqpxyZcEvWK
         TPXsdcjEnmC3fTAo3UDqvw+henD34TO1onisgORuIUrwequZeMPv+n4uHfY13ORotoiv
         rLN4hAb0lP69zVN/jHC6pzdlKqoort8C/+dXokjQYsHxgXt3tOsQCl2anHisRU5ep80I
         RwGS8Pj1HR0lFBDLxSDNQeJZ/KbUg1sttYQb4MsMbazqmlM2tlYaauEfC/Z/7ycQHL+i
         b7Tpp2/WI5HuL5GbF+kt7pzxeXCyFL3aUWSs5UGq6gO8A6RiVb4h03SE/3b8kEceXusx
         XMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796599; x=1691401399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMkdpsehTQiUEk5WvbiE/NK1y+1H3B3yrpjwlG6gOYw=;
        b=OEPkkWytB2wr2gF38ubj4cWuyEgG77z+nZM21zLBEfPSn40ijbry4B9V+h6ZxEPX1f
         UCVMAJv3dq5Xewlgs+cdPUNipQ/okx37vMn4DEc3Htf8PWjtTn4gSaPhd6xkcfj7v40/
         iWfw9AOz4rVXzTJK+lg58/KOuUsCLCEfd+cj/hAKB6IDAU9Bw7Nw/4U8p+BrF9oEjSEd
         TY71oF38+PjhF2PRUiawptCKpeCEUzGo1UvW+oIS7JN9uilv1zDRL44oz5rXg3Csxfyv
         MLiVyssw3PBcZGjJqf5SC1D4uDXxq2dGtBL6bHqLXoPfkqd3Asrq911fldDzPypJuRuk
         xTEQ==
X-Gm-Message-State: ABy/qLYvBCLWBuwlE1cHZ2s+RuM9skQNcfV5PhkvZURz/1NRTP91Ta5p
	nq0ct7apODv2sEWDp6fLNhvOTA==
X-Google-Smtp-Source: APBJJlEHS8HRS+DJX1TaYBtav0YDH5TTIyB34YjlvE4tjVqyDckc7nADYmMtp8qDuz0QDDXeqOSJhQ==
X-Received: by 2002:a17:906:309b:b0:993:da87:1c81 with SMTP id 27-20020a170906309b00b00993da871c81mr6791657ejv.20.1690796599396;
        Mon, 31 Jul 2023 02:43:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:19 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/12] ASoC: dt-bindings: mediatek,mt8188-mt6359: use common sound card
Date: Mon, 31 Jul 2023 11:42:54 +0200
Message-Id: <20230731094303.185067-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024320_957629_9D234ECB 
X-CRM114-Status: GOOD (  12.24  )
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


