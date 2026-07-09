Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D9CC44506
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=; b=NPFJNO43rghbz53hc75OtyJm1O
	yxxg6BGfrw3aSvz8WsxEUeutN4CrCG6ucKWQ2UfIo72palx/9JC/UtBKJMPISZ/d6FZos/iEgfk2W
	sjjOIlsAgzWFKU44QCS0/vuTGQcf0PZoUm6BZNwiE/An2WRUI7pMWbBTvdwtyMEGiGS2S9HZzYs3N
	XFH0TYY0zsJnm/WxbqVWBzxySvXZ6dQdrZCL+LC1r7LEA4YvxVwauBnnfWc2VnFLrq83GvDoB/fGK
	stWZKg1QLVwiUuYnLH6OsrD9+RrEGRlAMXjVanCpu/tzk1+X2bE782D3R+aNNFBPG+SsCzbEWUoF0
	Fh1LsUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWa-00000001piG-3Ebz;
	Thu, 09 Jul 2026 09:58:32 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWY-00000001pfJ-3biV
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1362030a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591110; x=1784195910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=c+/qzv17559PB1S/QLmUJvmKAkZgGRpg8uFPTYEmrj4XZ8T3qBDMQB5ZepajmE4aje
         xk9g941Ea+chcD8ow6aXqdYvcmGtoYXNKgVhzoYYRXPrZ34CnYvz85HryVatXPAqKG32
         hAqZvqIqBQWN7Ud6A3+FeOf6W1U7fUG5OVsTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591110; x=1784195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=WXdD6/u7xGbiwMcwyvKSMKnHd52pb1+guIlpt7stzr63ciRVbIjx8ztksja2ybl0lQ
         5EDEDiJawoDEzaBS2RqboScJcU5Wm1t9/PPuXA+HBm1WlpT+F6MrrROwyC1Y5s1lawP5
         qowklMCZfScnhLE9zUc4NKefL7vE1zt6ctfh8SlFJX2Lr2hzi7W52/W9QdJd/4Q0kZ0C
         IY3C6ioVvJIHPnz0VpgGoQchIIPRuwc2JVi/oEGzLGV/OD+sZ4Z1yNcgrw0SdCUBZPDe
         z3aaJrIeEooIhDrV79LWU6MQuotUGTjuO5E0GdkM0LOGiskQyO5faP6rfki5TGH1YBX4
         2fnA==
X-Forwarded-Encrypted: i=1; AHgh+Rohhy1Pq3N9CvnAj6/jx5y6Dv13459QCNQaKKD9yze0lUlY1lU5XFC4c8yZP8Bklc+Fx+sXhLvcv+C4vDCKZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZwBb2rCKyls/K/l4nzHdfAj6+xYsgSXXlkLKVaOXisytCRS9M
	J/SYMSBMx8JERIq3us6DOWDmuCSmrZQNST6A9ShWttDFDL2sn0QCcMU4qjNOKE0FgQ==
X-Gm-Gg: AfdE7cnOIfeS2DVCsStOGtqoLCGdmFgfN9T5sPOIXasyHZ+3STkow5TMY8VlFmk6sef
	ucWYM3LQRgRkejKKJuFAt1/8pYsxOz8SphJ9g6sP5qjuqQnXWh9HO+WmSQqllYqGcxabIEEQbOJ
	YjM2iM+UxhAXS7sOhfV6eaOMXkIfW75Ms3kdPHAeHqO7R3edTgOXdEjWm3Hlk80BY4XOUJlHf7b
	ldzQGMTOyuANlExc3qYgm+elWgfW3B8goEFz3UppK8lL9mFApXrgfhYkp4Y7jSnHXVd2mxpUi1w
	4fOKGsFK3nWqzODEfuwnTvV9fRcdnWYvzHXQt8LKjwCp2t6VMZfQ1zhJabvbm3QwHYpxIikGlbl
	gHgsxqcatjy03ev8WiCmJEgsPzOz+lRgaGPD+Hxurm9s1KRUU7gMKYJ42gllp131LBRng2ihAQg
	V93gmZx0qM0sjtxtYRYeaYOyaUPobo1nUGhFGaOrhTgraR52q7rAwQIYpNJ4dSHcimI2X5dA==
X-Received: by 2002:a17:90b:3ccb:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3893d81f4f6mr6100304a91.0.1783591110117;
        Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:29 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 10/14] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Thu,  9 Jul 2026 17:57:15 +0800
Message-ID: <20260709095726.704448-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025830_914963_35644C61 
X-CRM114-Status: GOOD (  12.10  )
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
2.55.0.795.g602f6c329a-goog


