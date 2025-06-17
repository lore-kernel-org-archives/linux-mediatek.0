Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401EAC71136
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=; b=Q3Jky3yMybydN9F8ooi6LGtCvh
	kJdoeZJZK081CT8YIVDhWd1tvRw2N0f9jnFWOxSnyCMwbq6NUIG4dDaaZTes17Rk713S1JfhLHTNE
	d6543QrDYVZp9ZcZPHcSedPkFDrKWj87IXEIwTsQmk3gGbjOPd3HFXKnqi8ZuOCXfcc056K9la3jm
	k33GIfXYtr8Ldv5gvKF3/WP+1NSJ41/3SocRydDXs9+W1ndTv8+I+lDYb4NaX5wQp7sBTL+jTPnEG
	ZdggfCDp3IPiqyYENKSygBmlxta4a1P0znsdoAnxitQvLqrc9954Oq8jBDxX8VPltpkoxH7nFYtQb
	fAkASNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRf4-00000006bBN-3A07;
	Tue, 17 Jun 2025 08:27:18 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYC-00000006Zv0-2LhW
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso2982057a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 01:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148412; x=1750753212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=CVXvHnngawOMl0X0jp8KakFgokNc1f3IUHRtbVV62v0/cRP63bE74o8MXhYXQPBplz
         o6vrySTbpFy2ddocIjATi6M95iYdDv2PXWiz12rgUe0i0vFNSlFG9QIt+3eYzSQuqnc4
         tK6SwWRmb+Q2Jq4O/zGBbrcOe5rxslWmin5bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148412; x=1750753212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=m8cm08PJfd3zIPZ6Qvk5oIh3nvFRJMAEp6o5UknrVtOMS2oAwhQhg3HrMbvL0xvu1/
         fqYZ3bFA+WMJAJgDO6n1ugwWN+ArmO6fQJpnT4moYeXH2QmNi9thwTP7uL8th/GjemJf
         JqIoR+7370M30OgyRMPDbdXPdglopv89KftrifH9qWHHJxsEiaHZ21+C4hMICW04j0Vl
         onydU+liSf7OqX1W3q0wgb4TmvngcWHSSZXWJNrQD2k1A73Ebd2N6aV98naGQoOiDWhp
         IdqvIiz3kBiQtAP7y5mhapt5WZr3UoxuYkHJ5fXVyWhDGFrLzWtGv8uWfNlPANgKr1yX
         Ut0g==
X-Forwarded-Encrypted: i=1; AJvYcCXfRtyiorMoynlW19ORQ6BZl8Gm7t4VpgtsG0a9fZhx1X8SS6bxx+ELBve+S97zE2G5vju5M3hGXNwp3kGZCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdYPSZi8CX1Gwmt7Ke5TxyXCobPbGNGre7zky+JfXFfQQZ9Mai
	N1VXf8f3ZQadIy0/5e3qtGPP9Uda5b4uaxMv0nj3qzqsjY1kw9vwcw0mHYnw/rKpLA==
X-Gm-Gg: ASbGncudsjh/Wz4hlcpPJB7EKluQiGuYurA6m5gsrZlaY5kC1eYDwvRcnUE4GX5gU1+
	ugj+Lsu3gy/rcjetY3yWkWVdsemsg3Jqhb4+nwfMxQWkEdnbCMcuLEpzSTKphvsBCZIG6Upigl1
	nF1ChNQDhiRWKsT8zcENF34mLk5F1/9qpWoG2nXkhyDFgYvBOVFRKfys3gPwCDGxiUB3wGmMwS6
	viyC2IIlIhbFSf9yH35Mg2XAeOIkMpYaN2Il6De9QnKdZh2TkiHCy6gN/j4pSiZydVDegian/SS
	XaYtlYG31GrAz95AW9Fxwt5co3msgRrhXeUZT6+zLACU/JcICf/hvBakG07ifSn6I4IkqkcbBsj
	dUUum
X-Google-Smtp-Source: AGHT+IG3KNV6ixPiJvUtBGaYxn8qmkk4lCQcaXYtEk6THCxE8V+YIcx+EzSCVTlQvmABQC9D1Nc91Q==
X-Received: by 2002:a17:90b:4e84:b0:313:dcf4:37bc with SMTP id 98e67ed59e1d1-313f1dd74acmr15712251a91.34.1750148411484;
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Tue, 17 Jun 2025 16:19:58 +0800
Message-ID: <20250617082004.1653492-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_012012_606987_87C2F072 
X-CRM114-Status: GOOD (  13.64  )
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
enumeration, both shorter than what the eKTH6A12NAY requires.
Enumeration and subsequent operation follows the I2C HID standard.

Add a compatible string for it with the ekth6a12nay one as a fallback.
No enum was used as it is rare to actually add new entries. These
chips are commonly completely backward compatible, and unless the
power sequencing delays change, there is no real effort being made to
keep track of new parts, which come out constantly.

Also drop the constraints on the I2C address since it's not really
part of the binding.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reworded commit message
- Dropped the enum for the new compatible string entry
- Dropped constraint on I2C address completely
---
 .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..0840e4ab28b7 100644
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
@@ -23,12 +23,14 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - const: elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
-  reg:
-    const: 0x10
+  reg: true
 
   interrupts:
     maxItems: 1
-- 
2.50.0.rc2.692.g299adb8693-goog


