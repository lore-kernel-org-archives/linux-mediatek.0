Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D2CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 03:20:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32179224DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 03:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32179224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AUOOuSbUb3u56G/CAOBBg0rPFTEL9PHlNzS9k4CcMUE=; b=Snvu+7qPC1JgO6TmS9awN7IA2n
	Qh5C5roKiz7OJKBHJPtJ/MxfZyfjdE/EaTYB/G5YEvKevsFs6gC2cfoS85UwhSFDLgEPZLpbNYeND
	0BpoXD2VnKHFYg5e7ZlnaJW8SHBAppVOSRK1MZ3FT0HFJKoFOqz/c2zrcL7bC/NvF2ZztsZXMGNIb
	/NJ5UotW65HKMAW5QTArWolFhPUepcNJ/YrhV+Ci4KFAtdEDi5AnggMKirebJ7lPAoBmmByeWqFxF
	rFDAkUKgdqifQYgeq5NWzYvLuWFE+n24mn7jWHZ7XawCGUnNDA3fWTLIgpQ2mi0dUv3kOm1Mem26t
	OnZgrvGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksHAY-0006AN-9F; Thu, 24 Dec 2020 03:20:02 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksHAT-00069c-LO; Thu, 24 Dec 2020 03:19:58 +0000
Received: by mail-pg1-x52f.google.com with SMTP id c22so761177pgg.13;
 Wed, 23 Dec 2020 19:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bY2URhtHpp2ViDApeX+WMIac4xic2Nz10mLXPafWH1I=;
 b=fHyv89jHI3dvjcUjJ5lDVSRFWiq7bg4lXHOZaHco8FGPSzoysvYMsH5QN46IE07wN6
 N1VBz6eO1Z88HabORkNJIAk9uC4BrVvoRvWsb/U+63cEU6c2Q/cKcxKDba//TwXhsZ6c
 RMhfriyb8HXJSZcCJsBrIUo4FZjrsvdIjcuRSWBkCaozQdwJ12I8bswaW+9ZjUzVu/vN
 yGppvjevALg4k/zpy5VLsGqgz3p5vbmAYeNOimNbVFQRBe7JdLIRVwWW2hRLyhK3jPfs
 phURXB7SZtpfgLz4C0AdnGL/kf00r2Jx0WNjNXJ2AG8iujqx/fNGTrlRk/iRX9CpcVrM
 ZdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bY2URhtHpp2ViDApeX+WMIac4xic2Nz10mLXPafWH1I=;
 b=jY5Y57z3yPFQjTLYZpog3K6QaW5aumvKn5m8vDJt2HpgTwCISD05JFnrczwE+ya3Yo
 1MReQ9IAfvOCF0UN3yubC9HFG/A+IBBv4veApNonA8Ele496HlCJse3cu/ivurjHUYQa
 gyfUjrCgKjXwVsaZdnfIkNo4ETyeCBMAiZcgfbATpF0D8KbzlRlILwwJGfqTbj+EdaL/
 2+cW0D2bV7+5zDTPJCl48Ks7rENsp8Ln2u3/0mLxao7wHZHhrPjrEGcbJhfOayD9ur2X
 b6QchVStMhw4xEjpIhn4Ou5PK9+qM8Gf+z0WOQQeQ0fta5ZAJl8KRKP40O2/shgSuJ9Q
 BEwQ==
X-Gm-Message-State: AOAM532tzyn1ogk2MCSR7bGEHkpYx3eVMnnZBh5VXUybJfM2TwWSB1q1
 pS3qlt3PslG+w49GVYmuVRs=
X-Google-Smtp-Source: ABdhPJzOHu37HvEexERhFvYlu0dNsAb8MQw+8bVf1KJVfFh+HzHPTgXC/j3Bixig7v1Mb5gHdfYpsw==
X-Received: by 2002:a63:480f:: with SMTP id v15mr13457906pga.341.1608779995916; 
 Wed, 23 Dec 2020 19:19:55 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
 by smtp.gmail.com with ESMTPSA id b19sm23842540pfo.24.2020.12.23.19.19.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 19:19:55 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH resend] dt-bindings: mfd: mediatek: Add bindings for MT6360
 PMIC
Date: Thu, 24 Dec 2020 11:19:49 +0800
Message-Id: <1608779989-9641-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_221957_769416_2E670DAA 
X-CRM114-Status: GOOD (  14.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, Wilma.Wu@mediatek.com, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings for MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/mfd/mt6360.yaml | 69 +++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mt6360.yaml b/Documentation/devicetree/bindings/mfd/mt6360.yaml
new file mode 100644
index 0000000..2781c31
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mt6360.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6360 PMIC from MediaTek Integrated
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  MT6360 is a PMIC device with the following sub modules.
+  It is interfaced to host controller using I2C interface.
+
+  This document describes the binding for PMIC device and its sub module.
+
+properties:
+  compatible:
+    const: mediatek,mt6360
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+      enum:
+        - IRQB
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The first cell is the IRQ number.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mt6360@34 {
+            compatible = "mediatek,mt6360";
+            reg = <0x34>;
+            wakeup-source;
+            interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "IRQB";
+            interrupt-controller;
+            #interrupt-cells = <1>;
+        };
+    };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
