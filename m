Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D098C77B60
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBNri8YkynclVYwoBklQprwBa6iRmkrRnEEZ57sGW7s=; b=42QJLarVp/jOH0P6SIjKDLdMSo
	ajegpeLXkcADx3i+cCsT/sMovVVjcRdHS1cAzHCIkCYiRxr8c0lqi6E4bKGT5DptpTu7rEy4YUtSJ
	RRCaxpWGog6vVhzyHSB8qD3JtlSjS9nSMjXEK3pzchVg0cNSgvoybx5hkikTZRled/JSpFy33uk0m
	PWNarQR+eeF3GpiWs3Cqp+kvCrvaUYMGKPorrFha5Uo/skJBEhnwi2B9yur6QnkmE+ywGVoankYhE
	Sodlu0To6mlVJJnweDxvlRj/yRpQ3lhGnqwM/A18K3u30ofcds1DBkVXmJL8HM6reoZzyUVAuJdxQ
	uKTy+uCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjXz-002Crd-2d;
	Tue, 04 Apr 2023 16:30:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjXu-002Co5-0Z
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 16:30:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id l12so33428790wrm.10
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680625807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBNri8YkynclVYwoBklQprwBa6iRmkrRnEEZ57sGW7s=;
        b=b7QPSFIRLZWuSwErIjXPg8XFGT2FBNUXe5LCta9x8zNLcel6vlGHrVw0LsChCTCVsj
         AtTFrdZfbxSS5g1PQyhzqrY/O1HIi+TO59Mm564sv/lWAJIge0EJWk1JOmmw08YH9oXj
         2miV83a179yRVjzgH8z5pVcSjykDfpno6MOmQ0zWl1ulDj6DmPvN2Vk0udCd6d6egFp0
         TuJBwe8fGF4qmOArdi61E8O4oN0tsC7RHkXDTiOHyQn5Eslc/dAs6wDJmOPqFX0UA9XP
         IOQfgnoeZ9gBVi9123H/OGtgu3V1HpZrTvBP6B9h9cPavd5JfwO5xre9HJ2JIj9lzyCy
         D6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBNri8YkynclVYwoBklQprwBa6iRmkrRnEEZ57sGW7s=;
        b=I/5NbEDbLFwMcnIX1t53Q2ql+2ZTG2uAfWlTdMxiDg7noB5aHvab0q7Rerp4Y+pdck
         mtsjCHIP5FmvOe2IsBlvzDm2xXVw4WNQptg667WgkVd667b4jFvx8Iv1SYTCiqXOu8Th
         AYNVMjhVbpLV2neuT6rIAmti0pRz8nE645BcDhTIaUVmauRGF8jcISFTRbPCXOZsVFng
         qvlJip1Zf65uCeqmhsjMeQdffwIosyelC79mcU4WvaYxbVUXDNler//3kRS+h3427b/J
         cWcqWG3n91BYA1NzK5jyluwHZ8F3RFZWITt5XP1ljBttywZ4acrg9iFOVLDv0+JjmbBZ
         oqpA==
X-Gm-Message-State: AAQBX9e9Vwf68CjEKC5qgTBzSdBOqse9Btgi6sgY5L8wRw/M5VA/d+jW
	uJBnL4UMJ87olxItqV2kcJIS3g==
X-Google-Smtp-Source: AKy350aZrkStOHE3/rNCMGCA7ZZbrEZnj5QmJpF6x+bIHaF/DIglv94GiA0cPOPu5E/jCP3+B8wZZw==
X-Received: by 2002:adf:f504:0:b0:2d8:1a74:9b94 with SMTP id q4-20020adff504000000b002d81a749b94mr2271019wro.68.1680625807739;
        Tue, 04 Apr 2023 09:30:07 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o7-20020adfe807000000b002e4cd2ec5c7sm12694528wrm.86.2023.04.04.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:30:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 04 Apr 2023 18:29:49 +0200
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: mediatek: deprecate custom
 drive strength property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-cleanup-pinctrl-binding-v3-1-6f56d5c7a8de@baylibre.com>
References: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3361; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=4xeMETQ7de8kyAEZcE0zaBq7ZmTpxY4WtvuqGUwV7yE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLFCNdWrj6CahMuPiWgdQAJwKwga4xOpbZOc6aCRP
 Om+lme2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCxQjQAKCRArRkmdfjHURU8mEA
 CeaF9knaja2TNK9zBPlYjowTWhAiATJgs49BPXeDsISohsxk5daDywxWNhJvUjgvHeOQBzc7Yq1rW0
 Pg1rRLdPeMvHmw5XJ6mOcQNDA0Cx31nYE8wWVNH08jWQWuKRAD0i54eYvvl86Pzkg3htfbAjS3Br7T
 8tYa/L8eFxDCq8PLNk7eBfQqWLiPyk8UQhL0ieRBWJajUlYFjgAYWmw0ZksCY6JZPQBIdFX+HKolt0
 yG+yr/xJOxueTvxUxHSfk96x8Vr7eqfoNo7YF9DZA2BlvuLz4DLg92UeWuQ6VMS8m2HpmNquutggB6
 touIkJscb84k2PyTD19Zmps1aexjake7OTalGQDbjTbERe04HD5H1swoZDrKpSCLonypbWcRo8Jyhb
 Dtcq5OhQqMAEwSOn0RYixV4kZVVE1IYo1cfZZOp6flImb9E7Yj062mvZ0XgVIVNLMjmVFTcnckO4N1
 8swSJ7caqZkTaHjtoVNtSGGoRzpnqp1gGdm1RGDr14ZwEia96DNV6lkxrh+ZdlV43ZLVhj04vRGseY
 DE7dcRgVjCgKuaVXk1gwOGwHxHNVbeHt5ZLjbWw82XWzDrCQDQzYn3W/3Z6QEtYndMXM9weL1XaJvZ
 NXhJ+93tVeCLoKBjQa8bKG+k0x+v8UK+H69eljGQ2BPvtCtvE8dk2Y0neq3Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093010_214750_3C60BA90 
X-CRM114-Status: GOOD (  11.05  )
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

Deprecate mediatek,drive-strength-adv which shall not exist, that was an
unnecessary property that leaked upstream from downstream kernels and
there's no reason to use it.

The generic property drive-strength-microamp should be used instead.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      | 8 ++++++--
 .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml      | 6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index bf67d4672455..ff24cf29eea7 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -110,8 +110,13 @@ patternProperties:
           drive-strength:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
 
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
           mediatek,drive-strength-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use drive-strength-microamp instead.
               Describe the specific driving setup property.
               For I2C pins, the existing generic driving setup can only support
               2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
@@ -217,7 +222,7 @@ examples:
               pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
                 <PINMUX_GPIO49__FUNC_SDA5>;
               mediatek,pull-up-adv = <3>;
-              mediatek,drive-strength-adv = <7>;
+              drive-strength-microamp = <1000>;
             };
           };
 
@@ -226,7 +231,6 @@ examples:
               pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
                 <PINMUX_GPIO51__FUNC_SDA3>;
               mediatek,pull-down-adv = <2>;
-              mediatek,drive-strength-adv = <4>;
             };
           };
         };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 5aa8ba4cb547..dce9fd1a6a72 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -91,8 +91,13 @@ patternProperties:
 
           input-schmitt-disable: true
 
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
           mediatek,drive-strength-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use drive-strength-microamp instead.
               Describe the specific driving setup property.
               For I2C pins, the existing generic driving setup can only support
               2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
@@ -191,7 +196,6 @@ examples:
           pins {
             pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>, <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
             mediatek,pull-up-adv = <3>;
-            mediatek,drive-strength-adv = <00>;
             bias-pull-up;
           };
         };

-- 
2.25.1


