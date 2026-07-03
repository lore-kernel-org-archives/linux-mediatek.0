Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D6C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4WWH0bleuNmTAqXa1RwaMnEajgDvtrfpYNFP62ibWI=; b=Q3acD8rMWjLgS4GBjQajPEGcCj
	DH9QOLNT/JTTmxL4+BoWKJitge62CzVNko8BAPhucIZaYlqKU/dCoi5itfj4e+YPJlt7djw8xgRDA
	KsRlie7qF7/k14dBdfj1A20j3kw5VBq0/DX9pZTkFeIYZ6wV2cvaRrwCP8HfnxohoqAK5Nhb08XVs
	Gkeb0tDMnaLhor3Njpa0wkuO/TCAnjsKhuTRuFP7v+evyI2MSemHfsr97PltTIWvDWIsLur1dZKCS
	RROUQMvoRRwJliv+lRXl5qw9tcq0GE8yqD4He/trtbgCbYxnSakEMsg3hNHTQxohnO+4OGhWIcV1A
	T4cGyNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgy-00000006lfy-0uHa;
	Fri, 03 Jul 2026 11:04:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgu-00000006lZW-1y3c
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cab973140bso5203175ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076655; x=1783681455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4WWH0bleuNmTAqXa1RwaMnEajgDvtrfpYNFP62ibWI=;
        b=oCiB9cUbRbHyt21X0/XbdJRJKFtEqG693P8YhSi8mrqgwpR6o4gN3Fpw7bwWf7ZIFc
         B+aKB+fC/VwI+YKfCVCJOAxI3KC74Bb6/1bOyDadCDK8Jv87SmnO1+6XfcrksB+3tq6x
         pnEhsVkEc9CMpLuk/B0SFxCWK5MeK3EOYDvaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076655; x=1783681455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4WWH0bleuNmTAqXa1RwaMnEajgDvtrfpYNFP62ibWI=;
        b=iwjINXcaN/TslrQmb/Lq8qz8gE48P1ouG9Q+leuu4JeYP1l/YrjweWtI6U+joGXn6J
         RTjSaCxnSgJWIB0ZFk2BK54Tlpq+OCgMNfgpKp9hnbCxr+u7WklvrBGjJ1+5NHQ/knxB
         WKt0zclRQvpLpD/I+vxb5AjC1zffx8fJZkIcSjo5tXKUzAMNAbjqB+UOu/XTbjo1VGRy
         V0jT0YdapNu1yUhhFiXRf/nKCPSAZwEQxyY5gvPXwD6UWrn173DFC92Zxe3k3g/RYFIK
         +Z5CeufK0S65sXsy9AH2MixTf1WcxY7YHIjIN+qmpK1rN312Rsgc2muTrZe51YdMhCwh
         zSoA==
X-Forwarded-Encrypted: i=1; AHgh+Rqp7zkEW7Jf2boyJ9BAI0Ff00RfQAsEejmLQ4ULUITqpswDNc6mT/XtVPLV1FXo0Qorq/b3UDB0hHcZNy8ehA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMkeIayNi8JnAfCfUDYQvqdIbX6fy6X2+CqtOpRDS1t/FuUc8
	JTvgYsG04meXKTh+GMuIIn4mji5Hy5XgYj6wLaZKUeHSRB8EdnGw18DT+d+LqMSnng==
X-Gm-Gg: AfdE7clR+L5zNexKCIRxb/sn2NkcLMlUMAVYNQ57HuwNI5JNh6rbiylK3QQSITiXNXN
	xLoiO7Vp4M9cLWrPTg6aw6Pipgtx9aN7ZMnzwH2u2X3qUR6hudxOcRmb/wKaeNN2qA6HjoBGEEy
	cqYrJSnn0nDHlENXeYN+zCILeCLzbFQ/ssqErNuy43rJDZkSJeaZh9XvF2exvbu5zu81lukGcLq
	yiV6wU3+hc2pvv3s9hpH0vmTqwBxdMefsTjH/TWBVyuGXrnG//+PAmg60/SGXCfsoiJUDaSpq1j
	J2I2wEmEfxeHJbpm/R6WOlc7C4FuYEtAXYxZe6KicGwN1pK8bSwXdaun0D54CG0uvajmmgu+nao
	5JIQoV5djBuFIjcVzlgt1V8webuUTAwt8z3Vgl4a+u9c0Hn+50KHVBDB9rYfphDXsR6iYqfPGqR
	MiuEP0Ry5Tnp4pG54ULT4y6XE0nctrykXob7EWWF6V/xPeV1dt4wZkQavvMe91WUMnQ6tUtA==
X-Received: by 2002:a17:902:d58d:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2cad7a013f5mr21135815ad.25.1783076655443;
        Fri, 03 Jul 2026 04:04:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 09/13] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri,  3 Jul 2026 19:03:10 +0800
Message-ID: <20260703110317.1283411-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040416_558967_4BC820C7 
X-CRM114-Status: GOOD (  11.69  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.rc0.799.gd6f94ed593-goog


