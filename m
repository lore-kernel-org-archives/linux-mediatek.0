Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF22C4452B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=; b=eNWNMtUtoRyMR0/baSMuLkvXyL
	zPS7G4jwiwwc57zRvQL97tlDB5g32An08HNRD8CUIDf2U9KADmA0c85maPh4Stxd4ZKZg9vfXofB5
	jPlauK9jOLZoG8iNpmPrCQCr+TUFAyySx/RssHC4kwzwjt/++REGBDVGGBML65crUrRoRed1ZaYf0
	JwP3GKQGNb+cIzRzSVFNnNlIvs6U1UKXScd4W3vVETCbxPTq6ub5xZCVKU8fXx9BuDvW56Z55zIGo
	bxBLLce/XmKFAAPN7vx1YYnOK6jD2E/wbauO/dZKD4HW7tk0rZfZ1XB06P1zoziGAGmPEa9WT3bwT
	Ls5R0+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OA-00000008auz-2RnA;
	Tue, 21 Jul 2026 06:55:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O0-00000008ah8-28NP
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cacf197759so124515705ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616928; x=1785221728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=ALGUKbOHpcqQmpb5jy3Uvp+O+G3i4kzMeB95IJDLFwKyqOg1sLhQ+AH4rPzDXnIFpQ
         SF/lQ0PAc22N6lUOyfmUR1pHDscQKocuxBO/YNxfc/06S2hFUcHyXHI0GyDMmlBij7B7
         cBlXmcffBhtlCF88UOKT0nR4PeQZruuX/0eiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616928; x=1785221728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=DZAKDr3nDOU5xpLkE4jeRLF0XXnYirVNDCC60Br2qPXq8wszMFJMfKBUEa8sd1Iofy
         sjDlND4G4lCcXrFt1EJpEMH4tqQY8lf8psEEtk/KlK0b3oT3Sdf9DhJfZcuSJvkifo8f
         TBztWG8WgKG5ZWXwZqGaLiY06k2S3HP/s43f4iszBjiIdXVHSrgmbASh2W19Fc1Pgzlw
         X6RoMtmGLrjSjd14VY3Ci/7qWqrXYhot5Xc33kI6tR/7M0kXlO8OtW3pW4NmZDQxd8z3
         NTnbTF15JDiTp5f3ISccVJGT2nKqcNgQnV81DIsD580DxhOKvMDj2hfAmKRhHb4qYanL
         5Dig==
X-Forwarded-Encrypted: i=1; AHgh+RoBPNpDo8rkqXV84AKmdvmSombg+Xmzz1dPrLrPNTIggYQLbsCqksdtm/XwqeyBRyDD0TU9Zj8h3r28kYSFDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk7IMuW7IjnDssj4S+buMajLceWizgoFNGV4cNcmGrEFFx+v1p
	+kmDHht+2rx6C2J5GCMSsMTOVU4CNSnTIU0veN4FqKBIsjiCP/1u8vodvboBtq+Adw==
X-Gm-Gg: AR+sD13r1FOgw4ZmvnnBrmsRJdB6K0srMVjRZwFy/fCKIFdw4rlhyrJnmH9qPKhq12d
	yb+CuL1J4yEItNiLnhiEPmkSwmP1cY49KpMiMc2aDFAltDS9N0HZ0ykgCetSxmiUpqcNyoDyJtB
	asC1eyzcb5oaJGmooWCaUe5uUCmTx1m0m/fti5fajumyo4kaw6PsElXS1D5kXgwf9sEAK0+xTNa
	KMIPQCTLrsLkGAwjRLWPeQfplaFH6pt6TBqJKfuSldrMXr1lRflJSzPyAKj2fQ8rOb/A1K5Sl+z
	x7wZVthAymmE1Ui62cTWsWAF+u/i6bakI6fpdpLnjes1UXHM/UHOuvNkI/rlcJaCEGNYj+3YLeC
	/Wtfgfk7bMApxnr8Mu+JDNPpmjwmE+7loph+LbZbGWiCfZafBzVO74u7IniMp7YknAM5GMMeU3e
	dV0iGWo3r2bKWtJ9E08Q+88XVdPPYvWoLWHXXMgbUKvIDCN/wyn/wQqlgdGWw=
X-Received: by 2002:a17:902:ef49:b0:2cc:ee78:3236 with SMTP id d9443c01a7336-2cf34997125mr195766485ad.33.1784616927898;
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Tue, 21 Jul 2026 14:54:06 +0800
Message-ID: <20260721065413.2306137-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235528_571914_AFD22905 
X-CRM114-Status: GOOD (  12.45  )
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
2.55.0.229.g6434b31f56-goog


