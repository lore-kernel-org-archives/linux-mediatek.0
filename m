Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B9EFF8873
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=; b=AWkt+CJ1xYqHcedtZp1trJ8E9L
	zhcGwMRl8psdgEyQUpcxAktnzv7YKo+5/Q4gPiLLug0n1syJLVZnNuTGqsERkuSfUCqnMxjNnK4Hf
	cqyvO5qrx+zlyCgb5dhZADP6K8FfPZ7md8D0IHV9Pd/6tarYL382MU37mpTwGrtFR5bEcwfwWnYHv
	luIXVqjM5iJWk4xWfatTOg8/hU0GfCEW2fGVOJCdUAAVR0smETB5Wz3wBaf8f+s59mmooFVAJFh1a
	JO4yS8WS/MGB1BNSDEZBv2DDjpD7d4ucTIPG6txo0qiFlZXMG1d8Y3CLu/2rFdB2N1V3tiKsYUm9H
	OwTwRelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYB-00000003AnS-3TBr;
	Wed, 29 Apr 2026 07:41:39 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzY8-00000003Ak9-0UtW
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so266425a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Apr 2026 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448495; x=1778053295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=;
        b=k0QyrihA2ggDznmmX2SLN5SlWus1yko0aYaRT3kgdvEx0fa3yMr5ZkPco07AAboXql
         l4BI0x8jkWOX0tR8jULraxim4Nb+cDi6RVHM/P4PrU5qqecgAfYJl8d2ZjjB7xc15poT
         q3NtVi9fCiMZcOBPwVYW4iYXsfGkVQ0VQ/Skk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448495; x=1778053295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=;
        b=AAeeS6BiinwcemtaYe9Ym49DI40QlhsBTS1LOFKQhYWj9M1oYLb1hD3KnRXFT3ScMu
         6kQhw3bNQ3A3KKe6T6xrxOtDI4nI+Y4cHW+NJ5g+7u7V9skmVPR9oNg774aB50h+b6gQ
         sJ5zBtHdxvQpHewJ1FPijPTSC1j9ozXzNSc7C6zRQQ9b4nUh8qp9ba8IcEN1G4mIYrkD
         AuVuDYC2xt/CtbMVFBVm6qx4JOdPd1i/UJScFjhZZ6lXXCl17HxOQt9ugImfG6JjIOmG
         9gQeiAJNLEL63W2DPLswWmMYal6Uu72iyPaLdme/Z/z4CItupMYMp6AEu5JMJiH5RJhI
         EUvg==
X-Forwarded-Encrypted: i=1; AFNElJ9Dn314z6vhikszKplJwVlnG6BBr27+mjRHvEwLX5YimKqwsTbgL9/uaTGF8AJ2X8/iyq98TJo9X8yTKxLz1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhPZ2WN+MBccLxRNY9sPSgQYq1ctQGWVLasXh+M214CTBo+Br9
	TTCn55vi6ojkjzbbAJ/fCuiSVX7t1cKZA7Ggt/YDPIkNItOzqI2waNuG786c5t1kQw==
X-Gm-Gg: AeBDievPZQ80w5NxzeAnXemdXdvXcD2I48jWWTXPL8OwIzQi9/mud0qhVI6AD/dqOl9
	rlMC5pOdrZwVb89nUZPYtGNkD3Le4Lfzi+IycqBgR0MvtVooGsCXzkp/g0nTYIJlzAZd6/8ut9i
	MiEXMU/R9tyydy5NBDdwbgtThLFhWEHGU+KZrMm3JDWCilLKT6zhzFjJScYtLCPFoOijj05OmRE
	9QGhSwc0urL4uTtoL1HadGdeIKj9t03D/HXOjLQyhTKs6P5EaFYOj82D7p/CAdB3gDoz/ucgnAd
	qGUHyaqwyvkboMB+jFJPjzQqVCtIcjDk7C2VRvNwgboUAIHXhXvT1mfVr9hUBXOFjjaIsMrcUui
	p7Y32xn9hT2ekSpPPXXmd0oSQRuAYRAJrgr5vgy3J2h+iiq2+r2BjHxRTTsFDjHuAE2nw+Z1LNr
	XpXyvYiQrjMVGc75Clv79+tVXbaLCiHUOqpn1Vy0NV3sQNCYSlfXIzAIgr3wJzyVJbnX5UXl1co
	g0gzmsdnfuyBuk9+5w=
X-Received: by 2002:a17:90b:3d88:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-364a26320ddmr1570113a91.8.1777448495047;
        Wed, 29 Apr 2026 00:41:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Wed, 29 Apr 2026 15:41:08 +0800
Message-ID: <20260429074113.3720271-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004136_156958_FD5F0458 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always follow the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.54.0.545.g6539524ca2-goog


