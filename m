Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5174C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:31:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1CEF2086A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:31:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QRvpkoSm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSBYefrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1CEF2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22TmyOdbAhMo6amuqY/fJLQai86YdhkJlzUgkYq6U4Q=; b=QRvpkoSma/rF9S7mfkV6AqLXva
	VNGW+q6qK1UmN8KTVg695anEYulv8Hi1qB/0SHMIimd4MuFO2DbkMGRDGRyizPuG3F59DoHIpS9Fq
	7F7Z66tMoR3sSd+iEszl63esk630cR150BOx7ChWiRzV2oeCkEO+3b3HFBbM1ZtCdzilniCn/wd2t
	nQPwE2f4JxunyRmSRVAs0Jb8CclCKGcY1T43uyhvdH2IRMS1QmryPr+NESZTigojth822wLYTpsIn
	2Nn+ZqH/e1Jt9fxx6WwNkfd286DxwQO8tfTcGdvdXcsGJuFUMs/wCy3+Aa7MFivHrpe7TpMJTK0Hf
	v7RE+QFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBbew-0006ng-Tn; Fri, 28 Aug 2020 10:31:02 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBbem-0006kl-Ay; Fri, 28 Aug 2020 10:30:53 +0000
Received: by mail-pg1-x541.google.com with SMTP id l191so256555pgd.5;
 Fri, 28 Aug 2020 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=htXOCVPrq8HdJeur07eO9bXCbnwDHC4OtbEI9rP9Tn4=;
 b=jSBYefrAZXpv+3xnFQAVI3JPtpbLw5e930QLjDyJDlEkHKYU2qNN12+NjMaQQzrdhQ
 fdX6N3fidTAAbijg9JQiMFWxIUcc3HVVueSN6wzz9SPfw4uiExWh6sznbWhsU/Fcu3KM
 R20xoHhTwxxlJ0aX2p8ly+aJYWVGThFICBRCqj/xEspdxM8KdfNk92AIRQZ9NmydSJ81
 dOtxXTo9mkC3FY+NqlDGvv/ePYMpgKGMukDsFJJxYTSCPYdjbK0P1gk9DCCzj3Vnzd98
 O5zhLjChK8mr5lIrUoXUs9vrpIdA/M94HcRFLeLMaEfA7MimARXiG7Z11228tIuv2kNr
 1reQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=htXOCVPrq8HdJeur07eO9bXCbnwDHC4OtbEI9rP9Tn4=;
 b=PMoYZxp8AHtbKh6b2renZrPsACIIvkpOQkgRnvxiRRtetOtuvxpq26r1Jblbj+rDDm
 kM8B1oG7CZmYzdkaSCYmARXX6yL2fCdX+4bJooCjNu+BPagpxLfTNEI4/UCdQ5gziXR1
 qMSw6wpzchHSiAj6OQNPqR/vq7uKUO3exgmks3RdXw3Eh5HwvNvifD587xfcJIEn34ZA
 iH7XzF3ldR18jI5tFZs2GRjcN2TJlRPCZdIMJImGSqrjBV7T2lwCUtPwVpmDaxiaK2Ox
 OBAqUx9vJqGQkFCBbofl8h87Xn9IdRRU8Crbh2exV4w2Qjx1NM8q1m7qE23TSoIOqoP6
 5uOA==
X-Gm-Message-State: AOAM532urAogDRUO4oYs6HGse4EhSR16Fz8gE1M4ycv0WlWL0N9pcL87
 LaxPwhKlDJfd668uoNcolL8=
X-Google-Smtp-Source: ABdhPJzAikASnfF5fhZ0b1hQfPKicQB/myOGamaEIpzFEbCmIe0pEQH3qzKz0PISqby+vMHZzrUaeQ==
X-Received: by 2002:a62:4ed4:: with SMTP id c203mr688174pfb.151.1598610649951; 
 Fri, 28 Aug 2020 03:30:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:912:790c:5a03:60b5:8987])
 by smtp.gmail.com with ESMTPSA id
 g25sm1232224pfk.37.2020.08.28.03.30.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Aug 2020 03:30:49 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Date: Fri, 28 Aug 2020 18:30:36 +0800
Message-Id: <1598610636-4939-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_063052_412193_FE949F9D 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add a devicetree binding documentation for the MT6360 Type-C driver.

usb typec: mt6360: Rename DT binding doument from mt6360 to mt636x

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt6360-tcpc.yaml         | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
new file mode 100644
index 00000000..9e8ab0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6360 Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6360 is a multi-functional device. It integrates charger, ADC, flash, RGB indicators,
+  regulators (BUCKs/LDOs), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6360 Type-C Port Switch and Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6360-tcpc
+
+  interrupts-extended:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: PD_IRQB
+
+patternProperties:
+  "connector":
+    type: object
+    $ref: ../connector/usb-connector.yaml#
+    description:
+      Properties for usb c connector.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts-extended
+  - interrupt-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mt6360@34 {
+            compatible = "mediatek,mt6360";
+            reg = <0x34>;
+
+            tcpc {
+                compatible = "mediatek,mt6360-tcpc";
+                interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+                interrupt-names = "PD_IRQB";
+
+                connector {
+                        compatible = "usb-c-connector";
+                        label = "USB-C";
+                        data-role = "dual";
+                        power-role = "dual";
+                        try-power-role = "sink";
+                        source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+                        sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+                        op-sink-microwatt = <10000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
