Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AB4CD98D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=; b=UTCczPi12KXC8ZekZb+iwkgTqd
	MGI1YJxrhnQreSIE8QXtpc0m6Vtd3B21WwQchhqeAbi4xfgf9cWchhCtTFH7tugdtbY4/KpVIxkNy
	hP5ccsfpkmk2FKaTU7XBFcMLvRziqIMKMAjwZtkUeVL3ehM1MLuhh0BhGlS2RcPMISl3DlA246+VC
	N0+6nbapO1ueGAUaJBGVGVw0bh6x6VCbij3sxVtP5leynQE+2cE6hyBEQNbNLuHTDaq9zKwbI2uk8
	JxMCu4CCRW/pDnnOQjh6YbKwoAvA3yB+qPmovMRgv3tQR3HcLMePw5DWPT7wfqvtjR13OA3vV6/XL
	UPmahXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVf-0000000763S-1vEe;
	Wed, 10 Jun 2026 08:42:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVb-000000075z1-1QEn
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so43524345ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080919; x=1781685719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=Dd1ILMz8R933gNRVO1xu43Re4Rwhaw7sG0HOCwza03JtVa8wGj2UyTMJLkZqT9ceJo
         +gVFgmvIyCFwT6r2DrXRVDVZU9fF3FFEBNYRnv6ck5otU7zd/LUd499TxqXfxRgJJzb6
         zVXOc6bhMvn4ZXDmzlCYqojVZfYFm7S5pZ0u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080919; x=1781685719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=QB+h740rpy3CUCQKMWJUg1Bj4tMsS72QiUSqKmfgEEZGVakJuR2gv1SintSI6ppHvJ
         OhRaCJ76Z9y7St0kZg8DyKwxIOUjxR4bO7kETlLuKlHDfWW4ByWiriqHKnWh1onhxQiA
         7h+lvTN4kD7y8UKJV5BhcGirU2ZP2+zY4qdosegjmfKF2aUv/SOcAtn2lqWJ8k0RQr0A
         8PzA5IBjdLAUe6X75qYfXhdCJAMk8sEeQAB3tdR8zpPd3UV34sPCB0GAJQIFXwmMvllR
         BK7TgUpXFlvU5wH5lkFUQ86pLToF7IvWddwiT06wMsyE0vof9yNq/C3k9gthCwaVoXtJ
         zQRw==
X-Forwarded-Encrypted: i=1; AFNElJ/jzGVnx3U3BBzO3KIDJ6NXLUbm2ZMBzuT/gi/lLSCWKz2EPTicraorICdWieDwLatzhxdH5RrtKrRmaVlGBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMQXiAqQCFRkKZk//QXa330x6xHV6HOgJk5d/EwvYlViwxnoSq
	ffn2A90F66gyxdbBlGPuffqiQ5X9jHSRnvCfnNdXaWNPt3JYHGRp+PM3heMdcWjY6Q==
X-Gm-Gg: Acq92OFpRZkUZsOqm6mztXdPn133NJv+203c+wTfk13bKwE3pVEw8J41KuuQNo291lD
	ggdD/tmoRcGdHxjGLBOGChhDkFnQBAkpEE1zcRZv0AXFXEywqrQIaq+Zum1NefX8waX5uprv1cl
	zwjz45TuUPLG+7vAMKoKHEbfh690Zssay4pNma631cmmlbh9vU+tiN5gCyjhu4mjxrF0s0Muuj9
	a0UPJxK7rADDNezkdLc1sHaIBfdno3HUcuqunA+APjYyhzsyAR1aBmRwexNX4X4M+vjb2Hs/6fz
	UE/edu0t2shh9ahkXGbPrMHDUml5vfss9YSx2Vm7qiNRi3UB8aCIOGL11x3G4fQ8J0n0HRNC+Ub
	VrqXA4NePzE4hr/3dUp8PYLGiDlk2R247sg38Z1Suuuh3t/qzfN2mdLByZBODZ+gEKoP5PhRDaa
	YfM9ZoEc5oC2BCsqQovi3ymSkiUmunxLkMeX93DemTJQDrZbcrrynawG/IIm2yRQyAoy4j0svpU
	JTNDfNFZaBsKXgPFcwtbISBirXL
X-Received: by 2002:a17:903:3bc5:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c2a1bafec0mr80534305ad.3.1781080918758;
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 09/16] dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
Date: Wed, 10 Jun 2026 16:40:43 +0800
Message-ID: <20260610084053.2059858-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014159_404770_E93504E4 
X-CRM114-Status: GOOD (  11.56  )
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

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Allow a ports sub-node for describing USB connections. Port 1 is Super
Speed if the controller is SS-capable, otherwise it is High Speed. Port
2 is High Speed if SS-capable. This port mapping scheme directly matches
what the hardware returns in its capability registers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 75ecce3bdc7a..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -184,6 +184,19 @@ properties:
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
2.54.0.1099.g489fc7bff1-goog


