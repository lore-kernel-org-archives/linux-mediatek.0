Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25AFC28B2F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=; b=mb0GtWnl5cFROBowVjsnxP00JG
	41dQyuIj9QhM3RlBFEiCeto0Tqxq0MSu++76EKvdTRvu+S2TEtMCF1uO6WRN2b4BcNh0tS69jsXQo
	ToE0mg2GMgg8UxWIZ6gIz4qg2zHy5CHLQKlwB/ScdccB27hDzk6L3X/wSuKyGx5lfhIkCKp1dUDrG
	5lBUOg1b/EHFAhzK20dGnNKUVxilZLYvINRDLvx/504z2QrLTzXUea/C00iEY734/fqEE0wBh+kYA
	mPNVvvZsnH9qdKkpNYb8qh4kNRE+QIvXoAq4/SEDO0EnVABS9QMKRa8DYh3PG31Wk6B1HfzetlQpj
	pCJyiW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJmj-00000008Bs0-0YKF;
	Wed, 12 Mar 2025 10:58:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZ6-000000088fs-0fln
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 10:43:57 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fef5c978ccso9900840a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776235; x=1742381035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=bmaHnE0tBBXdBvSDMRlX/SlbHkBL6/Kg4AdOvEAA163c9v90AQsyqq/CNcvXhk17mx
         +OYRppPE5l/jTVcz8IrMeFMByHePYjBP4lM/KjWmo24g5nINDyxRqNL5Gt3YXjCFP8DJ
         leUwbFh0iwZTVtbyqhP1oe1sLu2p9ANsdlQJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776235; x=1742381035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=maeTF9Kq75pbRRJ9XggGR7NEuxGIaFQFsZP/71vcAxp3oIF8fct7pMuneP7hNgKChX
         XVOWu2hJI4zrkvGIB+oERe2IhhkBLsWiaJa1vzs1cnTDN0GcZ5iTIvnMZZR6CIZRJfDZ
         alBMO2iOEkF1idWCrrLJtQVga4C4jubYJUASrhDQZeC/EZEfbp6soJUCt1z6MIFtTd3b
         e52EUVxVkw7Fc1PkqsPErY5i+LK2GjaGA3oD8aeSWWSFRByaGXMvreKcoK1hwchQRzJz
         bq7U3PZvFnze1NB9FLwZy43+ehNh6ZtKVjPsY4+gFXKHV74tsfxQ4Z1U5XrfSSEB3352
         drzw==
X-Forwarded-Encrypted: i=1; AJvYcCX7160QEFYOsk9lAv7JOe56zUgYYX85lpEkSQvGGsRb+H/kDvV1NPztP5o6ISQC594OXvWxpVRM8AWFs/V1CA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ewv/FtONnbMebuvNByIqZa4wy/3cuPIryX6NeHLOvxUCov1+
	YCBl7mxO7Ttt5mmC4QUVVu/6tOO2VKnN6Rj0sJwneG5ClTd91KtiVvP9nqSK6g==
X-Gm-Gg: ASbGncu7T5v4q+Sa0Eui0ge9yevxEwHbbD9SRHi1A80QeX0KSapGdR2KbqOH4xWdOMi
	vMHhD/fQdyTTyGy96HSVGm3quFt2yJxUi68u/vVJD9fXfda6CJ73W0Hay7QXC9rx7lorXtohMpV
	7DZED21PT+Mx/eP+5HrmIDOx306dc43GJaKsjeuRwcsg6cyWgp51MKf0vJX4INaw9OGRv82gMyH
	fbTGgsRVIm2pHmvOjcFueh57ASdKL2rYc4q5CgAtyXOgzl1TqW6VqcK+MKdFtS31ckGTQY88qAL
	mGNUtIaOf9mXRKaoc4gEFPPcDKmizqu0K25oFkJhBDNF3NTVZ1+KOmcTZdBf9dRik4fVrlOBuA=
	=
X-Google-Smtp-Source: AGHT+IHVXoxHlRkSlosQqT/eYj9vz6fvVJZ92k/ncUOz6qh5Nk9iYgHkhQ9d0PdxTZIJWqbKDgo8qA==
X-Received: by 2002:a17:90b:2d83:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2ff7cf22df2mr28755341a91.30.1741776235345;
        Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Wed, 12 Mar 2025 18:43:35 +0800
Message-ID: <20250312104344.3084425-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034356_198947_D228D681 
X-CRM114-Status: GOOD (  10.35  )
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

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration. Enumeration and subsequent operation follows the I2C HID
standard. The eKTH6A12NAY requires longer times for both parts.

Add a compatible string for it with the ekth6a12nay one as a fallback.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..81c391952ccc 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,18 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - enum:
+              - elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
   reg:
-    const: 0x10
+    enum:
+      - 0x10
+      - 0x16
 
   interrupts:
     maxItems: 1
@@ -58,6 +64,21 @@ required:
   - interrupts
   - vcc33-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - elan,ekth8d18
+then:
+  properties:
+    reg:
+      const: 0x16
+else:
+  properties:
+    reg:
+      const: 0x10
+
 additionalProperties: false
 
 examples:
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


