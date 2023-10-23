Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754B1C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZz9i6ImFQmqM4y5QrZ6koA95MCCt5tnF575J5PorR0=; b=p/ofRBwnErM83K26kFmUzMz6S1
	Vj2O4j5sQqPJiwWA+ePO2h5CKppiBYuAVhK+2AK/afjV9GCLctCymdznn5pXHtqJHKIbLTC9BJSJ0
	wWGuCmIFr7HLB+XqUGxq3LywtEEeMnwwVzwI68LcWutVOn0fT2P2hBVhjO9Dh7uJ09F0T5MNPaC6k
	t0NX7udMVH6s1ecP2UcVijv5tZIwFJGM7r+Vi7kjsScvLr5LMKfLQGoHTxkRsQAz8sS8iPaXaUHK3
	uAnFPOXQgOAIrv1Dx3yLtPhI2ZKELIX8FWSbQqDiK/frr2yARO0tqUlBKJUKn4VdLfWF1GPNNSVw3
	ARXujnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7J-007a0V-1L;
	Mon, 23 Oct 2023 14:41:17 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6m-007ZZ7-00
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:45 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-77386822cfbso216552385a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072043; x=1698676843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZz9i6ImFQmqM4y5QrZ6koA95MCCt5tnF575J5PorR0=;
        b=gkE0OgFUI0nB6wBXtNnIBhmd7CUGOQGyItBPWP8v4us98PkyeiyrhkZ0RN7dViZPnN
         O2CaLrBBCOeGGnE5f9ol2nNNsNZBi78os5XI3AHTo6XlZ2cUg/CaXFX02YQ2fFuW1gdr
         7by5KrJV3+GmVqHfZH3s8CgBnOJxKGO6bbDTMoYT9v6CaqSMeLH+fWKUKE/zEL1hs7AQ
         kV4ZAqbTFw445Hikt0TLCqDy47VFqeBuJsQSAx+PKiodnne98wCByThjCpPxpHQjug1l
         lFK7G8eYZDXBk5eEj2b60ewyUuSEG5oQVyEVDrIeYa8PMrv73RzBqOPCwZJSdRn9Tuci
         E23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072043; x=1698676843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZz9i6ImFQmqM4y5QrZ6koA95MCCt5tnF575J5PorR0=;
        b=usnOfb/c+K6CjH6WwPOjOkbF3yH/5OxNRUXOcKLl9dJWBYojFQDZVIY1EbxQUGHNJO
         Mgiigw+5LXBAhNU7ETP8bBnUlvZYMrYXEBIrfAOk2H8NC1etJLm816UGv530DLm74xiP
         SMSxelZ3zNKktdlu2B6NMhveALFjO+a9oTWTVh2yclEGLcX/+fnqL37MpRhHfMuHFXkD
         lhP0ueKvm5n7SdcWQCEeet6rK/skI5w54eTGxA/uGFrJ1yYs55MgXI++9gPhJ+MWZsKp
         rOvxinktStZqb5P3TMBBU50Nr4bIqGXJeCRTyQcIdaXSvXlj4KhyEFdPHwn7w5H4UGck
         RK4g==
X-Gm-Message-State: AOJu0YxaFXxN9CW+LlHX0rZB2YQJ4qT6WWhNTskKEKFyZ2RVyx8fV1uO
	/XFR9JUqhgiV73CEqtmmD81lAQ==
X-Google-Smtp-Source: AGHT+IHbPwl6Xj7okP15FlZMJetuD29qDDNSXkimIr93x9jaXLYk5EpuaT+glnhtgHxMvP6epra6AA==
X-Received: by 2002:a05:620a:4308:b0:778:8fee:e863 with SMTP id u8-20020a05620a430800b007788feee863mr10472895qko.75.1698072043216;
        Mon, 23 Oct 2023 07:40:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:42 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:07 +0200
Subject: [PATCH 07/18] dt-bindings: display: mediatek: dpi: add binding for
 MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-7-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jKTgLJ7tZRm38ANNnWtNI/u763F2Jj1UVc7V+THD25Q=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPxIX1QNuRobZW6u5aV9tmmhhr5yqPuC817lI4
 62W3Xv6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURQE3D/
 9gh0ybUwT+mSx5ZgcOKs8AfJtTZow7les4rs5WdR/ORkQzY6kXCEPQHJGwSm0pR6fHVeLntm2PWxpi
 78A3aSvnwtOhVtVJoriEEqc3VPTXLDGdncGNzxQgHjIaJf/qf0g3vXhMbQvnMcTGQKq0P7ofP70yRS
 yp3iq2ADrr+onPPVI9x5OqNqqrgou/rGorFRI3j6YUcUVuRk0eTZw2mvQPpRvhPou7cvlatR+mcOQd
 berg1tg3/mYPJutWXRz5ap4f1oflMYsg3i9spOCvvx7hjuYxBpU1hHWorYsM9gg0IcXml/oWyQKiQM
 17TD0yEEYJ/kIkt+1+FITaxqJIiV1yZC2y7/mWDR9lnavla8+8MVs7z/ISJu+CDzxrBIQyiBnSQ9Dd
 nEexfUsenm4xIu0EvfZMG1E3iAHqfb84Y4Pm8Ot7gLwQ0Ng2dN5kKXmT5Y0RgVOoRgtNmNyJmJiJ0Z
 SL6XNuTP80brDNxMxods4dmBecGPUVrhSMLc+2jle6uyNYeODCCeLeCW9AqK4oBI+BgchKhuIOoHCl
 +ER5rAlg0xyfWbsj1xq00CDmneG0+on57XQ++jBfGnGN6Ia/00PiXrCamZVX8HYu5PLJa1oS/DykiZ
 RsA4SIdFr0mQ+fJ9a1qydzvN8kxnhcf4lPkehbldTFcp7ns0U5UFtjtzHABQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074044_049633_31FD8108 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Fabien Parent <fparent@baylibre.com>

DPI for MT8365 is compatible with MT8192 but requires an additional
clock. Modify the documentation to requires this clock only on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index e126486e8eac..c86527c33acf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-dp-intf
           - mediatek,mt8192-dpi
           - mediatek,mt8195-dp-intf
+          - mediatek,mt8365-dpi
       - items:
           - enum:
               - mediatek,mt6795-dpi
@@ -39,16 +40,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: Pixel Clock
       - description: Engine Clock
       - description: DPI PLL
+      - description: DPI Clock
 
   clock-names:
+    minItems: 3
     items:
       - const: pixel
       - const: engine
       - const: pll
+      - const: dpi
 
   pinctrl-0: true
   pinctrl-1: true
@@ -77,6 +82,20 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8365-dpi
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>

-- 
2.25.1


