Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4372C77B71
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hT0dzvsXvb7f698PuX8ThKiPZDrN3+S4Z3pmgV6QSpo=; b=EQ0aCbGggVx+oxL4AmExMpD1ko
	z7ri2AkrAz62uzs5aO84CgqDkNBcpj5FruRcwF8m/pGh1zPIRmLs9lO4oMe5YjXT1kFs8n9cymK/d
	+GhDUvHcn/gjp2zwdbmFAPGqFFC2mRhZ1WtTWJNbxMvENnmeJDuv5pp+dt6XR3q1kelesavU5yCVg
	E0GERtHu4V8fNvg3VMRfcTGQLc+SC2RJx1y62jGWZHKaNHMt91VeJj+din45Bitvik3v/5gk486h2
	3Iu0Xkc2S+JG6fllvrCaW9cl47YOWl2KxzxLYO460tN6BYvV6NUMvSqvy2eBGXYjEUk0e7GiwO2HX
	Ju9vs8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfp-00Bm5Y-2N;
	Sat, 15 Apr 2023 09:58:25 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfk-00Bm1B-2b
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Apr 2023 09:58:22 +0000
Received: by mail-ej1-x632.google.com with SMTP id dx24so7653163ejb.11
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Apr 2023 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552698; x=1684144698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT0dzvsXvb7f698PuX8ThKiPZDrN3+S4Z3pmgV6QSpo=;
        b=bTJHqYbGlp4UGrO9oKw8Bghu6wDHkK/qnJECB0OENhFCw2eZ/EZszvWSjj70/YPJYt
         e+SbWG3F0D4EqrDyxt6GxI8XihIfzTdjOTHapVRqqT6cKzhUCJtTQ3r0G4h44nzNLWWQ
         ux2Kjc8ytqLSZQAEKogyli0FMWqt/vZNMr9SEyUA2YTNUpD7/nItuVCDjwdg+MiJuJW1
         vANBOgpdSnvkdN9ZVr1N13DrgR+Gp4mx0gNHxIXIeJLfdX7IeqmgcSTF9N/UZTh/L0Ry
         wxJlWA70/mXfUjCxjF7exBcKLFTWKawIgeepbswAsogQGBefk2Bd6BbI99WZQHoonpcn
         J1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552698; x=1684144698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT0dzvsXvb7f698PuX8ThKiPZDrN3+S4Z3pmgV6QSpo=;
        b=ERrQD+a9Y+dInPJKhBAf7HpPu3lfhKPlgUB2a8IFK4HJukmNjrNO7HG6Ov36vf3+nC
         4HHq4BDxb6IRpDqVKRYUd5zFdWLkVxyj1x0LtST/FH1RC8idKcmzhv/t6iiwNxf0tAD7
         Y4xGI5xACCS/MGHXLl6F6lnQO8H5O9bCuNMwQ4XrXhBmyWQ1Ra7V8uL94hM9cBkMSAzD
         2DoVfGe+T+gPun4p8JaPgU04cZYCKKb6hlpe8MvP6ZM6/Hyz5Yt7uDOcZ5CJWl2hBjMq
         s5tCW9tftKF3cV/zD0ilQ85tpPfYJcF50g3ZN/KXlc+55LR1Wbvo1uQFcfrRxZ817K+a
         ZiRg==
X-Gm-Message-State: AAQBX9fJf/dgrCfXsmvBA9fL8+D2PiIOR72EAbuCoSJ/MS51R0VCyvtE
	4ThSBW6IwmkJN1k9KfjzghyNGw==
X-Google-Smtp-Source: AKy350aa/SbsRtF67gLeFejSr20s5v+RMrFrIbspoXpE7GmfmW1U/LDuriV5iYIvkKV83gJzv44SFQ==
X-Received: by 2002:a17:907:77cc:b0:94e:e30e:7245 with SMTP id kz12-20020a17090777cc00b0094ee30e7245mr1380769ejc.8.1681552698443;
        Sat, 15 Apr 2023 02:58:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:17 -0700 (PDT)
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
Subject: [PATCH 3/6] dt-bindings: watchdog: arm,sp805: drop unneeded minItems
Date: Sat, 15 Apr 2023 11:51:09 +0200
Message-Id: <20230415095112.51257-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_025820_848548_48A0EB4E 
X-CRM114-Status: GOOD (  11.20  )
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

There is no need to specify minItems when they are equal to maxItems,
because it is implied by maxItems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
index a69cac8ec208..7aea255b301b 100644
--- a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
@@ -43,7 +43,6 @@ properties:
       Clocks driving the watchdog timer hardware. The first clock is used
       for the actual watchdog counter. The second clock drives the register
       interface.
-    minItems: 2
     maxItems: 2
 
   clock-names:
-- 
2.34.1


