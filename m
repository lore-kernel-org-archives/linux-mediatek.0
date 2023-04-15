Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C2EC77B78
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mICjLWmF/LNoSL6NvsOb+8lhWw0UJh5jOmm9qwOxptg=; b=TFQFgWK4Idzb9LehbXlBKy33IP
	4lutJP5aoILSvnXva/wws8Jxxw3B0BckJ2rcbB3rNvfKC/0IGuAUWpHX1DOWnaj0HrP+P9n+cuhl3
	1M0euOSK2L1EK0ZURo7BT+eDorC3CeRRdVun9Uh2tksTZ8FsCsGTs2WRetK2kqGK/B/moVrBa0Ls/
	ySQuu4nsd2cbEsmEyWvuiTA1fLLBo3OSz7M47QtwhSgTjiSAGuFAESNCRGXeQRtEWImRuEMJRC8J+
	epbxYzr25w2fE14BS6MyYEbZ9gH0x4XXzDEGKXTSzwsTic26FV9CQy7nn8b2vA0vIwQWm6OvlJKIk
	dx08q38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfu-00BmAQ-1I;
	Sat, 15 Apr 2023 09:58:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfo-00Bm45-1v
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Apr 2023 09:58:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id fy21so8733025ejb.9
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Apr 2023 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552703; x=1684144703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mICjLWmF/LNoSL6NvsOb+8lhWw0UJh5jOmm9qwOxptg=;
        b=F+IR/off6Tme4IZyE6DN1+wfs9kbpla6jlIL3VVwih9UcpOCWzUJ71w7RdKLDqiLoQ
         2kGpTLz3bjJtdYCshc4S/lDbmWsST2QG/9tjtRhQGt/Om7N3ANXxHCn+JpA6njFeqswV
         ZoJjNJktUl6tcrtSFp/+9Cp1jM0AJW73F/y9ecu8nljzuHhEqC5t/MRjOCXv8ISYWK0B
         THmdrRsv8fLjkOn+vhU+597RuD21pqBJUgn9aXHwOIavjJdzf6TD+iDJJN2DmtQsEm4u
         3f2eRGld4bEiRAsq4kqLoMy1WMV1vpixqzacgCMOsrAJCL0QOGMRibGUQQAqrXhA5Ydf
         YFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552703; x=1684144703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mICjLWmF/LNoSL6NvsOb+8lhWw0UJh5jOmm9qwOxptg=;
        b=AzSttAeHaTe+KwjcE34Xisuq6lsnUuFU7PDl8gfb8Kv2up9JGw+/T3p0Li56iK2snr
         1/eRhURR0AmxvqmgaNm2C4j2xLjwnbjZU3c1SxhVPlVucZF47X1FU7iCUhQ01YMRue8p
         uT3lzrFSI3VYWwqrQR4b9A7ZZR0nZBW1Dy1hujZfvx1mpPKCFPUS1wLdaPZ3I8I0ZweL
         UIJR/+CaagIZjiMNLnUol32IW2yALWvBQAhF6powG8bQt6fxz1du5aR/EPaEFHHLPId8
         j+0OD0q6XhSKd/AnpRiiL+3+hzwwqKmrZhgnpUmFFqKjXtPLe+6t+XPiQSJR92tIgu2S
         YF+w==
X-Gm-Message-State: AAQBX9fpJLAYpsjMV6/6yRBU+w9gjDtEJjvJRbCN+TZmMmZHWVs64UNM
	Z2I6c5tL+4JoxgBjFKIgnbU2rQ==
X-Google-Smtp-Source: AKy350Yl7r7VuDqDzLWQRNAgcjR0HSlTkvOCXUrie3RgrYqoOlXErvIpYyC3N6eYoIbrvn50xJkc1Q==
X-Received: by 2002:a17:906:824e:b0:94f:31da:8c38 with SMTP id f14-20020a170906824e00b0094f31da8c38mr195996ejx.24.1681552703329;
        Sat, 15 Apr 2023 02:58:23 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sander Vanheule <sander@svanheule.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fu Wei <fu.wei@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Justin Chen <justinpopo6@gmail.com>,
	=?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	Srinivas Neeli <srinivas.neeli@xilinx.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/6] dt-bindings: watchdog: toshiba,visconti-wdt: simplify with unevaluatedProperties
Date: Sat, 15 Apr 2023 11:51:11 +0200
Message-Id: <20230415095112.51257-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_025824_633590_A8B4B09A 
X-CRM114-Status: UNSURE (   9.46  )
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

Allow generic watchdog properties by using unevaluatedProperties: false.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
index eba083822d1f..51d03d5b08ad 100644
--- a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
@@ -24,14 +24,12 @@ properties:
   clocks:
     maxItems: 1
 
-  timeout-sec: true
-
 required:
   - compatible
   - reg
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


