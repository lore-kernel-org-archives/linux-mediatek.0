Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A229FC77B73
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X++FhK1t/fMQBncyu3FeTc1IPRncKd5sGne3lbXD1HA=; b=EWTOyCpbIyP11GI1Zagk7HSw+T
	jzftsr9t4ESLpDJhm3UxIiWYAi1/meZCULpmbgoKJh3hfrejhNl9tBx6pKyef55J5mFRvMMkyHpNT
	HVVS6HGg1f5R2Y22hCuvfnA2tR6l5Hh6bVZg+xVHFIt06/V5P+8/5yPMFDgncFeVxgRFWc6CcnoDp
	/6wnSAQcDYem092BmcECWZpGFt2ZRXPFHz4me1KOcA3u0FZZjfsGgrBZ5mW78KXBa04f01RYuPZ4u
	mVyGOdynTlSY/HG+9/BH9z8jHto9+o30psK2Zq0OclHCJaIMAGTk2MZtSVdngermuMOGEwt1MBBgF
	QyYgRPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pncft-00Bm9y-2x;
	Sat, 15 Apr 2023 09:58:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfm-00Bm2T-0S
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Apr 2023 09:58:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id qb20so51294356ejc.6
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Apr 2023 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552701; x=1684144701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X++FhK1t/fMQBncyu3FeTc1IPRncKd5sGne3lbXD1HA=;
        b=ElHS0DixfV4Wx0/NRCOiZ3tsYfPcSyO/g1j7g/FJw5/YfXipUfJBvmFPzXl13E2Tvf
         SlSdK+EcP2/VLC4TtP1izTSZh2TYXhQwqrEHTP4zmLknPDHuF6W0Ez3oOwri2AO4Ln8J
         DKM/IsZIxge+Q36axXN56jyjNpGR6y1DekpVmrGRzkbCcPf8lzZTffR5fyyV3yf3kqgU
         XY3Jr5gNhHwtScMoax+woXvPJV+LbcS1d3mQ8aHbvrtS9cqK7eNuaskGH+C3p4x28hPk
         gE0r2qXpKKwQao2swDA6m552WDpf1EkvhZhgjtn7/+5P2CZIcSXmPfyymhrvI2osVwKR
         mSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552701; x=1684144701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X++FhK1t/fMQBncyu3FeTc1IPRncKd5sGne3lbXD1HA=;
        b=cPMlO5n2KLBYgiaD70r4y6mQ4e61Eqc3EbCzQ5Sh4MN9oARUBVpJeTxKngNPoMuUki
         rf7MGvse384ZmXfe8MAo6WLos2DbZaMyGlzrZDYUNPrRfKqfE2bZWxJNmm237rGIF5uM
         r/AKGCbTyIs5XC4dUxLSNdDNHBTKVFZ/XMA2vaURct0o2SvrbMwYL5BpIOvDDsyd/O8m
         GHQwCJQ45r4yCj0aYXG9wm2NWIdKH0/nO3phpQn16qg6l0WFV2A3rRkygFIAjmx6QpVw
         aL9QZBOcW4W6H3eOSFlVsgTxFZJ0Jr2NrjG1Gr3SLat9a/IZlpUBnrW4ERUsFlOth5Pb
         H4NA==
X-Gm-Message-State: AAQBX9c1TtN6I88oGtdoCeBdPeu/Q1OLUZk9MDEtYIyYZoZX7fwZNBSS
	A1+a8+bTObBtOy5oP+IMekqngQ==
X-Google-Smtp-Source: AKy350Yav0SQe0tEvR6ZtIMRzAj9K6H8406yqb7Hzclv9sLARZM1w9Vr1g/iMuC5RnPGGtv3bjO69Q==
X-Received: by 2002:a17:906:149b:b0:948:b9ea:3302 with SMTP id x27-20020a170906149b00b00948b9ea3302mr1901974ejc.1.1681552700850;
        Sat, 15 Apr 2023 02:58:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:20 -0700 (PDT)
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
Subject: [PATCH 4/6] dt-bindings: watchdog: fsl-imx7ulp-wdt: simplify with unevaluatedProperties
Date: Sat, 15 Apr 2023 11:51:10 +0200
Message-Id: <20230415095112.51257-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_025822_246991_B0F4CBF5 
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
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index d3790f1a96a2..4b7ed1355701 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -30,15 +30,13 @@ properties:
   clocks:
     maxItems: 1
 
-  timeout-sec: true
-
 required:
   - compatible
   - interrupts
   - reg
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


