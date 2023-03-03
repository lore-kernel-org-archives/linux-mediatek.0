Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64FFC678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ct2y6EoMrN+HJxQD2RfUFZp0XRCxO4iCVehUYgYijVs=; b=Eld/Yax78bgpqP
	0ZXn638ZqrrbrnfLmcBwo0rh79WVluNMXqLXe/YAngbHuA+LFDtdybGbKfc/AY4Uqo3NJY93gEJBu
	cJ7wTWflhxKlD7jEO+gxSYMqZX/t17d2AuragkfWWp+7O7ZyjqRT3eLfT0I7fymkdfuUwGjk09SrW
	1zy6rOMSLEUjtXSkRSPV2p1WUk63gsAXtD0AFyIhCI/llxxYKfPKZno25PG4IxC6M0txMnwGadin9
	7h84iTkFiwhjhAfCnE9H7++u+5m3/wku6+9/CJG6IUiCkA/UmZX+4dxsZ8u6qMgNPp8tfloKpPkU/
	PhmHXxQpuemZQXIOSOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtLl-003sHH-TO; Fri, 03 Mar 2023 00:32:41 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJM-003qeP-2A; Fri, 03 Mar 2023 00:30:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id f16so734761ljq.10;
        Thu, 02 Mar 2023 16:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct2y6EoMrN+HJxQD2RfUFZp0XRCxO4iCVehUYgYijVs=;
        b=FwM7QY25lZengJrJwyQSjL5E6EosTaG/+eugSo4UGZwRYY8gKfpS9IxSeMotKhKENz
         biglUWtHjccGIf9oq0UngdlPPqw1v/YPEobXNbQ+ZgSjR0EzCtHX3pkszkI+g5JKCm0R
         yJWwrt0BmYv9MBtO1HPmDRBY5Qi1EjFNSSAYUbCnfmpUN87UC3QSwWkTpRYmWhsQ7HTo
         hdg8QBpC9f3W+dZ5Q3q9x9tcGaI02jQW8LxIzA7n/QhHDJpZB7RGt+KR+sw5MkXN1ycr
         m377JWoET6qxAf4D+0mrGk2Z91C8B0BUWMh6FMnyPgBXBf3KErnTXdBx0fQIGyn8NGEj
         Gr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ct2y6EoMrN+HJxQD2RfUFZp0XRCxO4iCVehUYgYijVs=;
        b=MivfmMtrYLbmShGCMPyRV7hXLBKGgXHTEh/13CuO9eMXYrx80uhXj9Shqv3c2nyS31
         CMIXzutIfm3HJxE/2749BrA5QBWAwc2JXheOjgCYQcbC6TWZFyDCpFQndDdwwxjc7El4
         dANC7WRU7EEWVmncd80+NN+/XucsOGlsOV9TiIFBHOskpewGW1qxVPwovUNOY/2bYe+r
         FvlTQs7zi4o4fXQZ/zcfJs2pJpx8QOkOy4VvxhR/tAe8gN1U9DfX0eKRWCMOpsusrJDK
         hh9oRh4By1hiPcD6vdyHNMD/jA7QC5pWESWyqsQmh/HR8yrbOrWDEu1DdTA2DI9sSS3j
         Y5TA==
X-Gm-Message-State: AO0yUKUlkYGxK6Mc4Ly1usIFrgs7VPyzH1G8FaNVUx9lFztPUVBP94I8
	c+vJvx1thr+YAXjIThGhBwk=
X-Google-Smtp-Source: AK7set+7dqKolQq1dLdyJinry05b+SRKAJDd4GYsDcYXoX757fWcDh/aP+KdZ3FWHQIOUWKVHYhvDw==
X-Received: by 2002:a2e:7810:0:b0:295:94f4:c22c with SMTP id t16-20020a2e7810000000b0029594f4c22cmr3635070ljc.49.1677803411429;
        Thu, 02 Mar 2023 16:30:11 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:11 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 08/20] dt-bindings: pinctrl: ralink: add new compatible strings
Date: Fri,  3 Mar 2023 03:28:37 +0300
Message-Id: <20230303002850.51858-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163012_134306_536A6144 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add the new mediatek compatible strings. Change the compatible string on
the examples with the mediatek compatible strings.

Add the new compatible strings for mt7620, mt76x8, and rt305x to be able to
properly document the pin muxing information of each SoC, or SoCs that use
the same pinmux data.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
 .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 6 ++++--
 .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 5 ++++-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index cde6de77e228..a94d2e7a5f37 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -17,7 +17,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,mt7620-pinctrl
+    enum:
+      - mediatek,mt7620-pinctrl
+      - mediatek,mt76x8-pinctrl
+      - ralink,mt7620-pinctrl
 
 patternProperties:
   '-pins$':
@@ -646,7 +649,7 @@ additionalProperties: false
 examples:
   - |
     pinctrl {
-      compatible = "ralink,mt7620-pinctrl";
+      compatible = "mediatek,mt7620-pinctrl";
 
       i2c_pins: i2c0-pins {
         pinmux {
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index fb8c5459ea93..eb0746cfc6d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -17,7 +17,9 @@ description:
 
 properties:
   compatible:
-    const: ralink,mt7621-pinctrl
+    enum:
+      - mediatek,mt7621-pinctrl
+      - ralink,mt7621-pinctrl
 
 patternProperties:
   '-pins$':
@@ -250,7 +252,7 @@ additionalProperties: false
 examples:
   - |
     pinctrl {
-      compatible = "ralink,mt7621-pinctrl";
+      compatible = "mediatek,mt7621-pinctrl";
 
       i2c_pins: i2c0-pins {
         pinmux {
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 8b1256af09c3..23fb82f9959c 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -18,7 +18,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,rt305x-pinctrl
+    enum:
+      - ralink,rt305x-pinctrl
+      - ralink,rt3352-pinctrl
+      - ralink,rt5350-pinctrl
 
 patternProperties:
   '-pins$':
-- 
2.37.2


