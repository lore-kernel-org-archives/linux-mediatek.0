Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85363CD54B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfsDvbPSiwYQ6ykzK/+9gGTqaEflNO3ef5+ehoxsuns=; b=ODGY6sRJZ10sC2/1fVVpaGP6et
	2YP5DPF6DuprnfEKVdWDbGz+N3wnc5/nGYtBgFc9vA0gAA1GrtDNaX+JhAPRImobG0LtzP+z4V203
	Bm7/+GZ/o+gt1Q9lTcO71Y5U7H7ZvgoSKvcL5Z71Bg1/8skoyQpB4jfQCehSpNFfrQJfV1Gm8PiIx
	t7Q6lsVOb+8jnr6IFAROXik+FMX1anRRAuVx55Aif3yWktfGtqFCEG7BuitW3mEG4XiPpVxNGOVhm
	lCqsUmKVqjZ6YC0olYtOu6iR08LW68pEiyuXHZXPDc3HlR6+FnYxMTNUZ3V1/l99xRNnUqcMNHHHc
	MbDhjoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGn-0004rT-2P;
	Tue, 19 Sep 2023 10:47:53 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGV-0004U9-1n
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:47:41 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-565e54cb93aso3183832a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695120452; x=1695725252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfsDvbPSiwYQ6ykzK/+9gGTqaEflNO3ef5+ehoxsuns=;
        b=LAWD/PeFbK0UzgTc+rx+EQHfV+p6qV6ZQLhYiNi+IQ58NdEh9v8ZsEzIv2NBOw6Q+D
         +Wp72M+Yyz1EjYOzM1le0sWeYjozKZqDB0Y2q1vbRyL1ltDq6qtFJnqOR5oQPb3PThTx
         0VI7y6MHoxxLagGoHrAec7FBBv2Va53yYWcH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120452; x=1695725252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfsDvbPSiwYQ6ykzK/+9gGTqaEflNO3ef5+ehoxsuns=;
        b=CgwZZlYKOFKBeG0M+xhZl33723Tv3gMT4SjkS45EX8OYVxHcejr8VWO1wWfaXdweDA
         jhkbYJnjgw2s4JISwEqT/t23BnmgorRnmPHlO1xCQlrJyznP2Huz2a0xmOH3EwoTMJbl
         hdJUA2UZD33+Hbvnn08U5HKAvUCW32MCrCexVU78jCPZs6st4oyGQa3qRM0PjpCBQqkN
         w3+4AHCcw455clXKymNfvMpdsZTUsVK220jAO9xk4uV3XxnZK8qaPI+BIcv1kTPgJQuC
         +oiudI/8Q1NYPSQ+ii4ISkYcq9ACG1KUgV9rU2Px6TGNm7hlO1Yql6GBqktWYga+nHl3
         sxZA==
X-Gm-Message-State: AOJu0YxlkGkXQBg9xF86kLaFHU1EBs2vm59wFy+EbH4tiZbSUEtj4i8N
	15FWLSLV9iDemjkka9oAv4+IJw==
X-Google-Smtp-Source: AGHT+IE5Vei5aZs2np5Axe2YBgPyKwPoboQ8aw1zKo4wXP/xj7KGpl92oYuS6GOzCirq4QXhP1nLtg==
X-Received: by 2002:a05:6a21:498e:b0:142:aced:c643 with SMTP id ax14-20020a056a21498e00b00142acedc643mr10956371pzc.31.1695120451840;
        Tue, 19 Sep 2023 03:47:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bc445e249asm6719578plg.124.2023.09.19.03.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:47:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 03/12] regulator: dt-bindings: mt6358: Add regulator-allowed-modes property
Date: Tue, 19 Sep 2023 18:43:46 +0800
Message-ID: <20230919104357.3971512-4-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
In-Reply-To: <20230919104357.3971512-1-wenst@chromium.org>
References: <20230919104357.3971512-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_034735_639279_123DE9F1 
X-CRM114-Status: GOOD (  15.56  )
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

The MT6358 PMIC allows changing operating modes for the buck regulators,
but not the LDOs. Existing device trees and the Linux implementation
already utilize this through the standard regulator-allowed-modes
property.

The values currently used in existing device trees are simply raw
numbers. The values in the Linux driver are matching numbers defined
with macros denoting the two supported modes. Turns out these two
modes are common across parts of the larger MT63xx PMIC family. The
MT6397 regulator binding already has macros for the two modes, with
matching numbers.

Codify the supported values for regulator-allowed-modes for the MT6358
in the device tree binding: 0 and 1 are supported for buck regulators,
and the property should not be present for LDO regulators. Users should
use the dt-bindings/regulator/mediatek,mt6397-regulator.h header for
the macros, instead of using raw numbers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- new patch

 .../regulator/mediatek,mt6358-regulator.yaml  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
index 5daef024de3e..62e8fa6b4306 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
@@ -23,48 +23,71 @@ patternProperties:
     description: Buck regulators
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Buck regulatpr operating modes allowed. Valid values below.
+          Users should use the macros from dt-bindings/regulator/mediatek,mt6397-regulator.h
+            0 (MT6397_BUCK_MODE_AUTO): Auto PFM/PWM mode
+            1 (MT6397_BUCK_MODE_FORCE_PWM): Forced PWM mode
+        items:
+          enum: [0, 1]
     unevaluatedProperties: false
 
   "^ldo_v(a|rf)12$":
     description: LDOs with fixed 1.2V output and 0~100/10mV tuning
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
     unevaluatedProperties: false
 
   "^ldo_v((aux|cn|io|rf)18|camio)$":
     description: LDOs with fixed 1.8V output and 0~100/10mV tuning
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
     unevaluatedProperties: false
 
   "^ldo_vxo22$":
     description: LDOs with fixed 2.2V output and 0~100/10mV tuning
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
     unevaluatedProperties: false
 
   "^ldo_v(aud|bif|cn|fe|io)28$":
     description: LDOs with fixed 2.8V output and 0~100/10mV tuning
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
     unevaluatedProperties: false
 
   "^ldo_vusb$":
     description: LDOs with fixed 3.0V output and 0~100/10mV tuning
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
     unevaluatedProperties: false
 
   "^ldo_vsram_(gpu|others|proc1[12])$":
     description: LDOs with variable output
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
     unevaluatedProperties: false
 
   "^ldo_v(cama[12]|camd|cn33|dram2|efuse|emc|ibr|ldo28|mc|mch|sim[12])$":
     description: LDOs with variable output and 0~100/10mV tuning
     type: object
     $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
     unevaluatedProperties: false
 
 required:
@@ -74,6 +97,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
+
     regulator {
         compatible = "mediatek,mt6358-regulator";
 
@@ -83,6 +108,8 @@ examples:
             regulator-max-microvolt = <900000>;
             regulator-ramp-delay = <6250>;
             regulator-enable-ramp-delay = <200>;
+            regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
+                                       MT6397_BUCK_MODE_FORCE_PWM>;
         };
 
         ldo_vsram_gpu {
-- 
2.42.0.459.ge4e396fd5e-goog


