Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19B7C04A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwoyTPSO3cjBsRDQcDo5mpbjNKMn5OZoqnqGWdyjQow=; b=w1rBQfpFjA6tBIb/oflaOI4fhq
	mxGY6Xe2b1p210L9s2lpNmFh1HDS5NtF9JmnxeoUBTWO0Brhy2Kgi4OLUbi9ZHN+6pW6Xf8SbNu0t
	t4iyUQOfsT3O6JSctkcwxfkL9DmCCP+WM+sP8WsC41vx42KzNvB9pkiPk0gu5O6FeNW1PrixYUPsn
	5j1SAAdQ9AtggKEtqrfR4XNmrvD26mbxTTxVsotoHEB8mOYmn5xi7GJGPJXrE7y09LQKbvKPKEIsg
	d7x7E5O506vb5f0ffmux/aEH2GoBjlh3MyBeKWGsf32ZHhFOkf/2+ZYfdfVAqsncutKqT9BBV07H7
	I6DPnsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRL-00EnvJ-1r;
	Mon, 31 Jul 2023 09:43:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPR3-00EniK-0g
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bcc0adab4so686091366b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796608; x=1691401408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwoyTPSO3cjBsRDQcDo5mpbjNKMn5OZoqnqGWdyjQow=;
        b=mBBfShQZv6XkwK8DnO85tXUWcVxUGA70V8N35lmh4HqedyJgROliBumCPfl4HCc7kZ
         ZCiRe3k62XNvWAeb7DquDbRAEx8I8tdOT7FsETyG0ubi+s4xm3Tf6ddfaEgtpSaQ4xsA
         QtbMe6OaGPb66nAkX8cz0CsQhgeSvuntlD4l8wW4cIe5eWVVuTFWRToaGWaJ3ihg9DcF
         oQVPpdEB7MSm4H6KpxQdW/JXZP0eH6h4GhbOTLpjBa9FpJZMT1w+67c90pYhqEnVnwxL
         bGI6uFmMUVdTD+q43fD1KjEdyMRZl4LSqwYcXUZVw56Oxr5mNEDZjBXuYWgYM6fVIQgk
         98UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796608; x=1691401408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwoyTPSO3cjBsRDQcDo5mpbjNKMn5OZoqnqGWdyjQow=;
        b=aWLHGRhRkG2uu078kxTVvHFf2nVcwC5aKPEQIPAT/5dTzpb9v8L25kpfOWcoG9b1EZ
         oxAPImcCCT/+SKza3CQJRfQZ/Db6abebMk9K2p9Nx1cozpBVV0rFG6WD47LXEPB7gmJk
         DkrWmKqwHjD3+NG9ZSM352lYMvC7Q4gmxPM4VqRYipDdGA5TMAkDrSDKgaDHViCu8MVR
         4RMvWUG7Z5I2+npu283NH96P2FlNRBhDVOobCE+hTJOmzz+lz36eEFnkRis1qwqKxOTW
         nk2m6/1RbLohbp5EnoE1xWj4ryJy1bkMuDP1LHeUQ1067gr/2ztz8gPM675oW28rAHV7
         F78Q==
X-Gm-Message-State: ABy/qLbS+wNhNBKKd6d2V9x5SMxB+lEbtdr9XIejJx3Z7xjvvPhwyNzH
	ZtBJaPcqTHEHXqBfkojQwNtejw==
X-Google-Smtp-Source: APBJJlHnjE7lUFjr1kQuePn5Ep3sLsZ6zzGI1CqSZq88oGyF32DzMVr0h+kgor4ak965TKVsqVQgiA==
X-Received: by 2002:a17:906:5d:b0:99b:4b4f:c9de with SMTP id 29-20020a170906005d00b0099b4b4fc9demr6736292ejg.36.1690796608017;
        Mon, 31 Jul 2023 02:43:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:27 -0700 (PDT)
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
Subject: [PATCH 06/12] ASoC: dt-bindings: samsung,odroid: use common sound card
Date: Mon, 31 Jul 2023 11:42:57 +0200
Message-Id: <20230731094303.185067-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024329_250328_CEAB952D 
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

Reference the common sound card properties and deprecate the
custom "samsung,audio-routing" in favor of generic one.  This allows to
remove "model" property and make the binding closer to other sounds
cards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/samsung,odroid.yaml  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index c6751c40e63f..b77284e3e26a 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -24,10 +27,6 @@ properties:
       - const: samsung,odroid-xu4-audio
         deprecated: true
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
   assigned-clock-parents: true
   assigned-clock-rates: true
   assigned-clocks: true
@@ -52,6 +51,7 @@ properties:
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    deprecated: true
     description: |
       List of the connections between audio
       components;  each entry is a pair of strings, the first being the
@@ -61,6 +61,7 @@ properties:
       For Odroid X2: "Headphone Jack", "Mic Jack", "DMIC"
       For Odroid U3, XU3: "Headphone Jack", "Speakers"
       For Odroid XU4: no entries
+      Deprecated, use audio-routing.
 
   samsung,audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -70,18 +71,17 @@ properties:
 
 required:
   - compatible
-  - model
   - cpu
   - codec
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sound {
         compatible = "hardkernel,odroid-xu3-audio";
         model = "Odroid-XU3";
-        samsung,audio-routing =
+        audio-routing =
                 "Headphone Jack", "HPL",
                 "Headphone Jack", "HPR",
                 "IN1", "Mic Jack",
-- 
2.34.1


