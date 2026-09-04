Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B50C624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=; b=qCq/Lh/CWWtcK4ZN8fex/0/OW2
	GOeQxHLUH12v8x+ioa3Z0tvbR0YBP2MMAcbiGKVsV3PvH2apUmLbULIr6AG0TxhDjaYBdtiB/xIBV
	Pq9qMj8Gu+etZq2KO4j7wZ4ELAcpboM0fyjzT0EyJM1JDeU7RWg6XnV2w093XG9hIX3ZS0kOjc4K3
	M3XzqlWji29nLr/a0g3GGR9CnpNOJXF1yR0f/RmiJZBUCcXhqrPrmS9GDfGUepl+2Kkx6dA/L/Fgd
	zy9AX2jvV2XgfZceIihpQVMrwX+nVmxWoU0X2ud3cx3tZ01QwvbLA50JHAM/TJaEhkEkVhi5PuL2u
	PxuRNYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX2-00000001QSh-0Rtm;
	Fri, 04 Sep 2026 08:44:20 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX0-00000001QQA-174D
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e58034d05so601351a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511457; x=1789116257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=nk1awieF4VMSJ7hRuXmD9f/fYHlLnvpR0JdmLE8RGMxrkNDlLkGkelBSYL8xpF7+PL
         887/I7oCd96ur3cB8+0qdeXCF420oSPfbY7qlAL1ZXG/CV0l4+b0A/kz2jsTEWQ2ktPG
         Agwgu5CMO9lVNuMKuA5AYRvPX8SOcrsBGZ+Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511457; x=1789116257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=ONE7DSYFRptYUMfHBbaw6BzG0qRQzfdazK3qk9o8wdx52lGgNXX5J/mnSQSE5cAxjz
         5bZ81WZOuaLz/pJaSoO/1l66ew/Xl57lyJHlXpl0Pat446x+sgZj13lOTMhA/A4YcZ4p
         PXwZlNxGcv3Iv7Rg3eH4YtCLC88YdSTrBKvuHzG9jZWZ7qQtHey3rDJwhcgmDeq+Q0fL
         IOqG5hHjk2nQwWcPP427a89IN/+FU3Cy1BCbyz4Rarlm1fiYftjb/oOhYNJl8uhqfair
         7fgaaUxlDq+yaUvQoRSG4n8qHH1Y2lKkeOZ6ipjbq4wcyvbeNxTiaSSC4M65sT5j5qcK
         tMtw==
X-Forwarded-Encrypted: i=1; AKwUvBzK5G44E2Sw79yppl6yBhXnVP1gkkxE9qAFJiD2fGrHHau8bkAB4Ag3khPAhgTo/JUCvwyWiUFkClkqtyaaOQ==@lists.infradead.org
X-Gm-Message-State: AFuF++noNI8RSw2q6OjqwH7dJr6MPdsKrgB7d8A6xPXVpVxaULSaQ47O
	xqCftwjddQM+r5QgkXOk1/+WWkS6DQlhke2oUAcyG6fVKZLuSbHtTf2/H1ngIFnltw==
X-Gm-Gg: AYBFou0EY0h6kuWFH+rzSnaqMZYxNwVtdg4L8tRxSvtO9ER66iDUrQ4AAGl1tUY848G
	BSqqu5iXIed+MhhiJZNUReyhmoT9z9pfIK3abs9cYTw8H3ZogK39Iw/21k5PLnQ+UBDktAkGN1/
	JdUAFPbgY/1scEw//cRem+kpMQQTE0A8Rdo7jK1hD0ZiYC2t+6WzXY/ayIlik8TZ46aiwnb8r9q
	xZdWKWzCLmpQLzq8VECIEWPHMkoBikkdc9f6EfhUxzFtD7tm2BNOVvtTjnzaP3R3Jj8bnmxGauU
	7onWqpsrbAlT1nI0bagkGVlAgRbKrmFH+CM0JydDaI8G2LEvRii71nh+T7WdSB7U6kSEhCaZREn
	wRjCrzOv83rg9Xb+yVSeN/JWurGRYqYDUXtTOj0qYE6rY/3VTaJ6cij5XNkDg9XMO2/m/kFk3hZ
	TGtnLi0M8zQm7258V21VZkG7N93Xp567rbdjGiZ2L6Gr1O/1iRdOVxYMRDQWDLXPKD3i5vDnuVD
	/dI2/75GeTNqrL98P2l3EBdApZZ0Y27i01jxAKYvRLH
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr7039451a91.18.1788511457565;
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri,  4 Sep 2026 16:41:50 +0800
Message-ID: <20260904084158.1341550-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014418_306041_10604DBB 
X-CRM114-Status: GOOD (  12.12  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
2.55.0.979.g7e5102b832-goog


