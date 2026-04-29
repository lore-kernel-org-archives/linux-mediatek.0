Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30774FF8864
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=; b=VXu/1o3BSC0gKpETRsNj4/KqDH
	Y0/IBbH1T+ir1HlQNdlr8Hr/OYnpb+EGBNwx/nxZIpDrhIzWglFqVown65MwxR4pMm45C8JYAWzZe
	6YICRQb624U06DBhbC3zRxXdN5qcGLbY8MVCdt4xQx58JBXJ6h3l5BRwdzOmG4S4qxmad8xUt2Q+z
	XwB7w5jIAWSm9Ob4IFGOUGQGQ5Ngz8X7cXlb2JqjV2cc93WXG7H8vIMo6UU5vA3zU/Jq6OeHazZ6a
	flegouZdEJ0xZPYuavJdlhZ4uJvTNGiKOMyjfqNEAFvDfCDT27hCtFjhuSuqqoEOvf/dj5ec9/2hw
	Z8pHIO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYB-00000003AmL-0YwW;
	Wed, 29 Apr 2026 07:41:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzY5-00000003Aii-108C
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-362ddc1de56so4157993a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Apr 2026 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448492; x=1778053292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=;
        b=ejEuvAAHChUyQwIN7uAkapbhxzbGfKaX+4xRAUU1zM8lsQLoXv+vslL07qD7YWvpqx
         Ioe+b3s81g24nzDvnBE90tSwFpBhrfxBo4I0F3VhUTGYYBA2xws44cYu+ABsg1mYyRUT
         Rrl7QzltCnfFdyCU4xVLfe/1//FCOR2wmkwOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448492; x=1778053292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=;
        b=ITTSG6GdhkWAQWwPUpjjc8tgyh9WCowcyW+Sw6yCPeLr2ZIs3+37nqeXU2pD3n1/bI
         TJtvo/WxDrxNcM2LKgPurx6HwQUUMFhFPAzIMyBSKT23YGUDBcdRnBfavekSZcZLsjAD
         0Vk80NeQL8Gae0ftRs1fBMo9GhPG21Th54vheLfu0LSrV3PVlYwILs8Tfea8JgXI8YdB
         J4xKymxxuTS0NFbN3GOiHvMxEZsrbWxa9Pupik+2YYTpJicw8aOgVP6/zsI+UlkOSLKl
         sYmZNEKdGCdDffhMFzfgBqxtEMFzS/A699A6xeaSNeG1bcSVxNgmwWn/PWNMSXgF3sKV
         O8CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kjUGPycfWlowpOTEg2Q+CbB1q1xV2adZanIYB4gtOreBfh0iu1CT9hN7LYVDSPC2sVfNT59lalsUCYfYU5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbpNlDffnW/jbRiEqQRLpDqP8DJKWwIE+Trw/WwbGMdus1DtnT
	1FnBRZUtg/vur2k+JkVtoVBS4m9617SILP5uXotk9zruk5tDLdQ31lcyDnOQqBb5AQ==
X-Gm-Gg: AeBDievGPPil1gCqGInbIPgtsEoSi+MnvTAvdeYk6DH1IEYBgzvQulY1IWjiOqsluUi
	8cVebRwX7AG9jo/ZaGKmTvnZOx2cBUP8IuipVpd+9aA5lMNXq3DgnNNxbFHZ/oQGFBVuxHthtXR
	uHmCspOvwwK2k73wAJJz8jtDDtw0PW+G123w8zAMq7BoyMOFvKWSP/u830Li3f8N+I04KY2jj8o
	x5Lbm1mNqUCTTnMg7M/GGXmLbFYEbFyFNq7H/NNKCCqIuDnXHITgVm9zAeEJJ9Lbnjjs0RSCGDT
	ypzvoNECGBheDCfHg1qyJWoMjYUkZsp8JNtR3LkZFUVjuxdHKGM9s7a3u0E1MiR7Ec+ZW3xCLat
	GGqpSHnF11QdTu+LFD75kSTSMcUON4rBZ4DeqX87/LV/ug5d2q8zWK5sosF2IkQvAIXUvCDLwNr
	NuxXhg3uVHn2hQ9v5ptLGqwxqXUNhPziatt71fMFL6qQe6XjEBC/u7eRSqJYlXx+K4F+4qzyRgu
	lfgXFlDWCi9yGHFsYo=
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7208188a91.13.1777448492355;
        Wed, 29 Apr 2026 00:41:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:31 -0700 (PDT)
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
Subject: [PATCH v2 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Wed, 29 Apr 2026 15:41:07 +0800
Message-ID: <20260429074113.3720271-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004133_282464_60455D33 
X-CRM114-Status: GOOD (  11.00  )
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

On the MT6397 family each buck regulator has a separate supply. LDOs are
split into various groups with independent supplies. There is also a
supply for the regulator control logic.

Add descriptions for all of the supplies for the MT6359.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use regular expression to describe vcn33_* names
- Moved regulator supplies to top level PMIC node
- Moved changes to mfd binding
- Dropped ack from Krzysztof
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..7fbf07208d0f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -225,12 +225,62 @@ properties:
     description:
       Pin controller
 
+  vsmps-supply:
+    description: Supply for regulator control logic
+
+patternProperties:
+  "^vsys-v[a-z]+[0-9]*-supply$":
+    description: Supplies for PMIC buck regulators
+  "^vs(ys|[12])-ldo[1-9]-supply$":
+    description: Supplies for PMIC LDO regulators
+
 required:
   - compatible
   - regulators
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        "compatible":
+          contains:
+            const: mediatek,mt6359
+    then:
+      properties:
+        vsys-ldo1-supply:
+          description: Supply for LDOs vcn33_[12], vio28, vfe28, vibr
+        vsys-ldo2-supply:
+          description: Supply for LDOs va09, vaux18, vbif28, vxo22, vrfck, vrfck_1,
+            vemc, vsim1, vsim2, vusb
+        vsys-vcore-supply:
+          description: Supply for buck regulator vcore
+        vsys-vgpu11-supply:
+          description: Supply for buck regulator vgpu11
+        vsys-vmodem-supply:
+          description: Supply for buck regulator vmodem
+        vsys-vpa-supply:
+          description: Supply for buck regulator vpa
+        vsys-vproc1-supply:
+          description: Supply for buck regulator vproc1
+        vsys-vproc2-supply:
+          description: Supply for buck regulator vproc2
+        vsys-vpu-supply:
+          description: Supply for buck regulator vpu
+        vsys-vs1-supply:
+          description: Supply for buck regulator vs1
+        vsys-vs2-supply:
+          description: Supply for buck regulator vs2
+        vs1-ldo1-supply:
+          description: Supply for LDOs vaud18, vcamio, vm18, vufs
+        vs1-ldo2-supply:
+          description: Supply for LDOs vcn18, vefuse, vio18, vrf18
+        vs2-ldo1-supply:
+          description:
+            Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsram_md
+        vs2-ldo2-supply:
+          description: Supply for LDOs va09, va12, vcn13, vrf12
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.54.0.545.g6539524ca2-goog


