Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFF8C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DG0b/DfAuQ0lpoAh7wbcZZOZxcaD5fpXedR92n3Ro8=; b=ynGk85O+BZjuGg0NY+Ty7jIf+7
	EQV9M1AEC+asO3z5AU4nBQxEoOHDF/ihesRftd55W5Kwq2ei1tcAKnQwUhGZx9d3/SG4ZfrOafhro
	x167P5btACaIYKyY1rVuz6oaNjRnEYMKLyzGj2tQgL0k9xswXBjeTDaA7ShIDqXyZCe+T21yhrmEA
	HU3ScCJBMnHwuQKz1BpT5jJFDFMZxHo5N4yT/lUSrHDQOHy8Xjrktfb2lKIcwCGXLunbTTYm8qB9w
	YnmOWZC8YF5+7D80yXUUatPgXGMSyomYVPc5DJHzV4OXIMbZW1BG/Uf55aQQhDn0H2oD8Vn5/FFiX
	ctydBkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjX-00000002njZ-37qv;
	Thu, 18 Apr 2024 15:31:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZl-00000002Yal-1JXo
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-418effbc70cso3843405e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449839; x=1714054639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DG0b/DfAuQ0lpoAh7wbcZZOZxcaD5fpXedR92n3Ro8=;
        b=cihFDl69z3wsuIacyjRfLI/wVPShGJl0X+gE7lv4TcWeJoXbHODpWOLlu6RbPh9hSa
         IjhqhoUvGo4/a7h7Pv0MEoq/351Yyq4qw39BPGWHio7cQkWwAzFViI6rSNdZWD7BDdSu
         7Ha5pXe7QSJjHd/UfS4DrIsAA+bjt7pn73RUnNr73ETSf+KzzpN5MJwm876UZYtJhtzR
         MMjcS9STGT2A6GE3xLumZkvgjVS0p2rz4x2szSnkdEXMaweXP2Q+uUNSREEmdy1WCjd7
         9JumjkK9YTiZ4kjs0LOyy4E4rtIzmtWosY42O5FJWt4uwPU5jDYc3Z+iuJQI1FqW9RTj
         spgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449839; x=1714054639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DG0b/DfAuQ0lpoAh7wbcZZOZxcaD5fpXedR92n3Ro8=;
        b=ESsdb2LnQIF+M1kGnvflQc+oTuCCE2gyh7AaBJ/b0SLrha4pqYYR5y8vvd7PAJrVk1
         atd/p1YcLxpox9V8O5olupenIqME2dzZX2nj/Tj1dthc7flRZHfJHSO5JsogJF+Z8M2o
         UV1hT+tWZ1wfk7R857KiGNokKbGmkL9hDbcr7AFlgu/LisuXXqvNLsVNT5g8qVmEnJ9T
         l+UMmEm3WPJrNk09YFRIUrewBf1Rvx4TJf9PxLQlmt6nM2KFbZZa9b8WqVgC0CZjbjky
         N52JXX20pwHHjHkwC/RbzZTiLeIQ6pYW2xp5sUqOY7C+lK/qvopNkIz+u1tqM1k7TYRA
         gwug==
X-Forwarded-Encrypted: i=1; AJvYcCUuKN0tL+sf728XzouHgTEhPnsFWe/S1lwOnEf//88jidpW2rccT9pV89hTXe9GJ/YDSdZ5X+Xx+EAJUy8GCt/KoxRJAXSMG5672v2KtFEh/CC1
X-Gm-Message-State: AOJu0Yxw+pvampGKjx5GRV21rPvwDc98tLdZMmY8hBhoUcQgcVvNo2cg
	IKrGE/rv2D0P8TEKzsGyh7VBwBRB26uGjOv0Dog3PeICWn0pmIDmi7Z2kDTmC9k=
X-Google-Smtp-Source: AGHT+IGc8UkY5hUU0SOlQ+WIGwXJnRwFCQFFnKe6zffCNG3YDmpTofKmmzPBVeBk6KtCqcf7OWNn7Q==
X-Received: by 2002:a05:600c:3ac9:b0:418:d3b3:3188 with SMTP id d9-20020a05600c3ac900b00418d3b33188mr2065709wms.27.1713449839274;
        Thu, 18 Apr 2024 07:17:19 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:18 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 18 Apr 2024 16:16:54 +0200
Subject: [PATCH v3 06/17] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-6-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=l0R/nimPplfZesZQ5psmzigcqOrK2Svu7sgk1YEc9To=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStidrUSXn2C+2OPoqTCEjrSs1uAvZ65nuZ80U5B
 +oCvAVKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURXPdD/
 9udyeGAimjp0d/Gvu/tp2AHHzp9p4lotNsBdYQo+coQVnqgTR+wMNASNy7Pxt7p9VYRl+Yk8W/H8cl
 NulRyeef2F1tZPU6nE3gazrF3fGfYmQSe67RTNOp+2mPp7ajGRXJ3MDqabyRxd/qIK/+1W1IsFIYk1
 lQuwS4SYghHk4zjZbnVCchG41jsC+O1QzZubAQBmK5HhYWlC/taQ4kWm9oOS/BxDNeuR2yy+jWG7fV
 gw80gssGmUjFytjwnUERWo9oOnHcAVkCUGxy1uXeyAZ+URnebbF0kz6as9XU0jIBrVnTIP7fRv5byf
 yWsTpdf9AzdPBQRTXIxIpbWatMvwpPqx2PFWrYmCrRDQc3UY9jA1xDiI6sG1Q5KZ1x4ioqobcPCesy
 LGzYk59OaS8jSz2CV3saEWvQY8fBrmXhVDUmIL0FkHjSiJzRGOyTU5UaZ/jHVp9tGjWIXu+GxDwb+T
 RsDgKIzWTpT7Zo/TG0zX1Nbz2CClnooX7PGI5+Vm2CpzQ3ZDPhE/JDdsbnitH/1CLTM3BVKXHJnpWQ
 iQzNRo2m/H6vOSjrtYOcTXhQWUkDX/l8mTEOlyxfNH+DOyBiMf0w2CrXWp8Q6l07whJnb11QdvciWm
 pxZCrSkDVuLRY1uvTSbKhR43wBa9+fVtMKoPU9V3C3DhvaC+AcICx3aEC6bA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_071721_549685_AAFD7A5C 
X-CRM114-Status: GOOD (  10.40  )
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

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 803c00f26206..e126486e8eac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -64,6 +64,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -78,11 +81,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1


