Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571F8C47073
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jan 2024 20:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aE1J9ZdSIsaif3IEOtDgCaGNtPVNpbYHzuk9B6CwMoA=; b=M+C0Qf9YBEO3+YK+iLRqXo1+NG
	4awLBqF4ko973UQz+QYy1lBLnuHZm2tqMH5DKVFgrk7xxriC2D1AcoNopAYnKJ9KzoslPZuUK/3Fi
	2i8s9OR/q2YkRAQN+IRj7OXHvSRBm4CQQjPMINLhzVbdoYWml/RZiTkycgbv5NYWeJWqQGndFMt9a
	xWS38sq9nWe8A5ZUYkgvsGbd9GllkBlqqmp8x7DexAP0ewYdHSjcqvvsZq2cdQB4yPB22ttQC69p+
	UIeLKI08W0J+FaAbw2MRgisIQBYFbDLaAFfKSdshN/uzVaSWYiE9884QER1PzDsRXr1pNryYf6I2u
	MmGNBOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKPGj-006ibd-1K;
	Mon, 01 Jan 2024 20:52:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKPGg-006ibC-0d;
	Mon, 01 Jan 2024 20:52:15 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-552d39ac3ccso16973821a12.0;
        Mon, 01 Jan 2024 12:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704142331; x=1704747131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aE1J9ZdSIsaif3IEOtDgCaGNtPVNpbYHzuk9B6CwMoA=;
        b=Zx3+gilrY4s3rGzZ64hVHg+fyZtnepdxK062G9vjSAZN+UrEjeJi4IfD16QnvhB3nu
         oVuoIJvEpnu11Bkkhq1l3SQuQRvssXVXkaNY0Hp4ZyVi8cGnL20nDkF7KZE3bX+Ig+hq
         Umwa/q+cpNZ69fZU0KPHkFmXW5Ug7kcTtW/+M8Dk7hpg3ZRjJ+P7339aa2VgOKL4F7Ey
         qolqlomjKvz5MgF8e8Y3OOKoNWw1FbGdOpjeVN2pVKgVvQCLO5HaNBHVopYIDYurN7+L
         JZX765DUXOgwBgFbkJNISQcAh2AoYSFo0y1QH0IlSeacRsprtGnp1GnD968FvSP7LrWb
         fWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704142331; x=1704747131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE1J9ZdSIsaif3IEOtDgCaGNtPVNpbYHzuk9B6CwMoA=;
        b=KEkZlP2vmOHF3abl8l2UxBvn94SMsEjd40I166BeskMpogQMoDyelvkbvxM19ElN1s
         kCh76sZmwSsUbzVR53tcCIK5qFeimawB6b0Dcoh+r/FnPC34TKOnfNctxPOb7QopUIse
         Gfw5NeJce1opgxUEMzS9IAoLjZSXhZi9eYhyfke0BHFMBTCqHBi/FK8RBxV0BI9QZ43A
         DsNAWJ1a3ZYva4xQiGkp0pf7rfk/sF4FDVv1iK+su/ew55ZsB9HUUzm7FcHuLVPZXgnr
         hTeYA9hE1TmiKDlTv9tOVWYEu6NEiW8GdK+i0ajPTdwHaWfP1izGMBPLG/uFf66i/lyt
         jZeA==
X-Gm-Message-State: AOJu0YzSEKnm9UTah3zK/Ie34OnHt5zw5ICPGYWmGtYPLIJqIhYOiZAz
	2JgCCSFL25W4qZKQwpP3AIE=
X-Google-Smtp-Source: AGHT+IF8AMKWQ1GDq0sqtcPmdt0bqmeWcWfh4R3E1F8LuUh6BJQgqEEASeIR5ke3EP3K+0QxNyC3dw==
X-Received: by 2002:a17:906:c7c6:b0:a1c:a542:2fcb with SMTP id dc6-20020a170906c7c600b00a1ca5422fcbmr12456721ejb.31.1704142330488;
        Mon, 01 Jan 2024 12:52:10 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ft33-20020a170907802100b00a26a5632d8fsm11029227ejc.13.2024.01.01.12.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 12:52:10 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH] dt-bindings: thermal: mediatek,thermal: document AUXADC 32k clock
Date: Mon,  1 Jan 2024 21:51:34 +0100
Message-Id: <20240101205134.9886-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_125214_259424_A82F0503 
X-CRM114-Status: GOOD (  11.48  )
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

From: Rafał Miłecki <rafal@milecki.pl>

SoCs MT7981 and MT7986 include a newer thermal block (V3) that requires
enabling one more clock called AUXADC 32k. Require it in binding.

Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/thermal/mediatek,thermal.yaml    | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
index d96a2e32bd8f..a76be9c47fb5 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
@@ -15,9 +15,6 @@ description:
   controls a mux in the apmixedsys register space via AHB bus accesses, so a
   phandle to the APMIXEDSYS is also needed.
 
-allOf:
-  - $ref: thermal-sensor.yaml#
-
 properties:
   compatible:
     enum:
@@ -38,14 +35,18 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Main clock needed for register access
       - description: The AUXADC clock
+      - description: AUXADC 32k clock
 
   clock-names:
+    minItems: 2
     items:
       - const: therm
       - const: auxadc
+      - const: adc_32k
 
   mediatek,auxadc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -76,6 +77,23 @@ required:
   - mediatek,auxadc
   - mediatek,apmixedsys
 
+allOf:
+  - $ref: thermal-sensor.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7981-thermal
+              - mediatek,mt7986-thermal
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          minItems: 3
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.3


