Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D63C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swPZatRmU5IAV5ZeCQ4kXkKbN4f+jKft+68xvypLEqM=; b=1zfZ+lwRZc9CDVJ+zehLPBw4+o
	lw87LnrCGUkNTj/NEJM1gj985kKIuhQ1tySMN9mc4l2D3PmK42uaZuDDcquhYr3TYhAzxq4Uacx11
	tbXU5jFdHuX3ovihSAQZtnAsilWnSMK1nH6KHLgklYiiFzjcXjS662dNlpUeNpJduCPaIX3ZK7LN8
	XMDmZ5dHMbC95SLW7YkbD4GFLSk6tXCE7BUTb0O6RdAicM3osh6wXTvB46qUr0OYjZviMeMnl0yS0
	PmHPbWePJ3uqN9WqKXwzuSgp59Mj45dYUXBrYemWbS5lxB5yPxb8JjBh35D52Ag00Cg5RbqFCg+6I
	2329j3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEe-006fbg-31;
	Thu, 10 Aug 2023 06:33:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEV-006fQf-31
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe655796faso764102e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649196; x=1692253996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swPZatRmU5IAV5ZeCQ4kXkKbN4f+jKft+68xvypLEqM=;
        b=LsM/h3KPobzkTcoOxI5RPb0T84ud0ZGa4N6jmsjPveiCQzV7GU6U3za5q2AyO4B+5n
         wo+am54GWZdmEQr7eZszZcWrHM3Xd2eu3AQfdqqekomh4lTA7GwaFrZBJw9iaTmYenmS
         N9vy8Kgq357VzueL7xAclqjL1GRsGamNq57RexwJV8w8/d6hWz9J9vcqxzQ9nkGbuR4M
         MNxVek3Fl72nyvkPUlRrBizy1HpDb9unAgTEwUnaWQ4MYuoI9oA1svnj3wqg/G7/3iJA
         IBhXL09whKGx2e5We4vwU1V1BFTHYcs0bXXhIPRz/tROEOoMjMtQtvpZ27Wa/0hxEud1
         8kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649196; x=1692253996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swPZatRmU5IAV5ZeCQ4kXkKbN4f+jKft+68xvypLEqM=;
        b=epr/G+YUfCDaBC6OOmOaWsmSV9Hzt5YGja7qe6stc8ED0OVrxJK3o5K21lX3g5fM9l
         1W6jl1Rb2LxT7YRbwZI6CkF6kaIlLJ8F7/RXYFTatvOL9GgI98laTqNq4egLVoIkS64k
         Jg/KrLrVAV3ikixs1PnV6lLKq4ovlTt+dCWnoOroPhUemrt/KVl4SAxXCOEWo+lb9Z5l
         vSCR1r19JS0Z9pQ6wcqXzpkOl/dj+Z15M+xnU2UfkKaxoYm7++UFCRuSBOEKc4k9+eyG
         Y0CQQmIbh/RHZD6SWCi/CbwZ9H6eeRCwzIesb2ti7zKxeWbX0NE6WN7JFZMX6L5UVchk
         saXg==
X-Gm-Message-State: AOJu0YxOsbRbOzQONOsGEVKysHA9tV8byBhTbE7LAK5vBwRoogVuTJ0w
	0Ku27HWgm5OfrzY1pO89aNuv/Q==
X-Google-Smtp-Source: AGHT+IFSMwcqRWrUYV9irC56xpJoWb74ftanQaLP6RyThzYdg+w2lYlHHTaLxfomYlbHvWOWiHg8fw==
X-Received: by 2002:a05:6512:3e1f:b0:4fe:5795:35ed with SMTP id i31-20020a0565123e1f00b004fe579535edmr1082315lfv.6.1691649195909;
        Wed, 09 Aug 2023 23:33:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:15 -0700 (PDT)
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
Subject: [PATCH v2 06/11] ASoC: dt-bindings: samsung,tm2: use common sound card
Date: Thu, 10 Aug 2023 08:32:54 +0200
Message-Id: <20230810063300.20151-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233320_006885_7B8F6EFD 
X-CRM114-Status: GOOD (  11.32  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/samsung,tm2.yaml   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
index 491e08019c04..760592599143 100644
--- a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: samsung,tm2-audio
@@ -32,6 +35,8 @@ properties:
       being the connection's source; valid names for sources and sinks are the
       WM5110's and MAX98504's pins and the jacks on the board: HP, SPK, Main
       Mic, Sub Mic, Third Mic, Headset Mic.
+      Deprecated, use audio-routing.
+    deprecated: true
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
 
   i2s-controller:
@@ -44,20 +49,15 @@ properties:
   mic-bias-gpios:
     description: GPIO pin that enables the Main Mic bias regulator.
 
-  model:
-    description: The user-visible name of this sound complex.
-    $ref: /schemas/types.yaml#/definitions/string
-
 required:
   - compatible
   - audio-amplifier
   - audio-codec
-  - samsung,audio-routing
+  - audio-routing
   - i2s-controller
   - mic-bias-gpios
-  - model
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -70,7 +70,7 @@ examples:
         audio-amplifier = <&max98504>;
         mic-bias-gpios = <&gpr3 2 GPIO_ACTIVE_HIGH>;
         model = "wm5110";
-        samsung,audio-routing = "HP", "HPOUT1L",
+        audio-routing = "HP", "HPOUT1L",
                                 "HP", "HPOUT1R",
                                 "SPK", "SPKOUT",
                                 "SPKOUT", "HPOUT2L",
-- 
2.34.1


