Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2092C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xr7cwjYrMW5ep136lzms1pQWDP9TsnyV5p9TyRYV5WE=; b=XP2rzy1m8jgU1y
	OwlI0quvthOnzY6QL146c2EVP3ppunehTQLIXMni/RJbFY7wDVAFD02OBHsPUq1yESsqJKgCndbLR
	TVpyx0Mo4YyyVcgRrT5xWlH7EArT5i3ioiD4KVz95AU7syGiW89Fhmdhq2lupO50Y8FEYL5+OiCQo
	HXVT+cv8Dx3wF9Q7Lfz5aXhmtlAJdxi24bWbMM1APZg5N+FhhgvxFyMLrmIkC0ublYlm/yoHqrs81
	gtKu7Z6CUOVH/qE23CRpBGW/lGTa3nh4oTIZF5joFjOqTUnYuK48KZkEe7/aUYpnebwcrsIBgi6No
	rie1F/CLtJlZ9OF93A2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niXx7-006AAK-UX; Sun, 24 Apr 2022 08:50:45 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niXx0-006A6T-NQ; Sun, 24 Apr 2022 08:50:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id a21so2981244edb.1;
 Sun, 24 Apr 2022 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8W5+Z8xfgLRyM84vERTjWIAUY1i0+LAcAHaXYj8ooeI=;
 b=HJVWKxSRlzwEzSVJHhutKBP5YESaIhaHsOm1yHH1zoXuYdANXyi5CYFsyyjoS0Io7F
 6KMGQFIiDqaztWWrI5n2/l71KCG3en34KF7Cy7E3DTCMZb2NZXoc8brPMNPwYPTIM9c0
 UtbB2zeFfLRMOKhH85AYwgcAbpiogLbrs+XnRpaftzE2FspRyIREhPAjn/VbxElB/A6i
 ZcavS0FjE0ZylygFWZpSO4/QVz/2FG7sQT0PgohsL5YM/NvmG5sWlIqlSiHea25e7DYE
 dMocobgbtDCT6+mZOHQFqPK1kqceHUVmR7Y8G7pa/jAAJZyV9AqYQExXMpfYS/wJcybs
 QOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8W5+Z8xfgLRyM84vERTjWIAUY1i0+LAcAHaXYj8ooeI=;
 b=qZM4M16NVColRZTb5nnZx/HJyp1dB97wxIN9FIllQDxfh6Ui8m+7R0AiJLTcr+k9Z7
 cYP0SRrB6B95UCR0boeqGdWUd5VduktmA9rgCHIjzB8KW94og9o6X83EWydWi9vq5Ar6
 ppsqcylI1eVxnv75OrRvRQgudHvAL1pZOUjVl349h+DmlHW5yU1le3U5SdxJd1c2Yz9k
 vvneUCapL/I8caFLI8w2hl2Jm0DI7LNi1yVF0wJ6VPv4IWb811yibC6+y2QFZHcGYqgx
 3tkamRssSK0hSVXOIyw2e92Iwmq7dEfta4PN6B95moAClrRZ6hgi96YhnisiMbsosbT4
 20IA==
X-Gm-Message-State: AOAM530AVxjCN+PVMRGDDLh4t24ImVhEbbMKNLUebFshtxzTMK4KdN3N
 BM+nTbp8mMh906kClznVGMI=
X-Google-Smtp-Source: ABdhPJxCHoStiGRdxwMSQct0lwtQdbcFNX3mNwhWPi/jWgi/9gF+dy8m5VkfSZr+vzy2KVFkMVuC7g==
X-Received: by 2002:a50:f69c:0:b0:425:c96a:5c09 with SMTP id
 d28-20020a50f69c000000b00425c96a5c09mr7964237edn.256.1650790236424; 
 Sun, 24 Apr 2022 01:50:36 -0700 (PDT)
Received: from localhost.localdomain ([138.199.7.245])
 by smtp.gmail.com with ESMTPSA id
 gy10-20020a170906f24a00b006e894144707sm2435971ejb.53.2022.04.24.01.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 01:50:36 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: mediatek: apmixedsys: Convert to DT
 schema
Date: Sun, 24 Apr 2022 12:46:46 +0400
Message-Id: <20220424084647.76577-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424084647.76577-1-y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_015038_812040_06384EA9 
X-CRM114-Status: GOOD (  16.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

Convert apmixedsys bindings to DT schema format. MT2701, MT7623 and
MT7629 device trees currently have the syscon compatible without
it being mentioned in the old DT bindings file which introduces
dtbs_check errors when converting to DT schema as-is, so
mediatek,mt2701-apmixedsys and mediatek,mt7629-apmixedsys are placed
in the last items list with the syscon compatible, and syscon is
added to the mediatek,mt7623-apmixedsys list.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../arm/mediatek/mediatek,apmixedsys.txt      | 35 -----------
 .../bindings/clock/mediatek,apmixedsys.yaml   | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
deleted file mode 100644
index 3fa755866528..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek apmixedsys controller
-==============================
-
-The Mediatek apmixedsys controller provides the PLLs to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-apmixedsys"
-	- "mediatek,mt2712-apmixedsys", "syscon"
-	- "mediatek,mt6765-apmixedsys", "syscon"
-	- "mediatek,mt6779-apmixedsys", "syscon"
-	- "mediatek,mt6797-apmixedsys"
-	- "mediatek,mt7622-apmixedsys"
-	- "mediatek,mt7623-apmixedsys", "mediatek,mt2701-apmixedsys"
-	- "mediatek,mt7629-apmixedsys"
-	- "mediatek,mt7986-apmixedsys"
-	- "mediatek,mt8135-apmixedsys"
-	- "mediatek,mt8167-apmixedsys", "syscon"
-	- "mediatek,mt8173-apmixedsys"
-	- "mediatek,mt8183-apmixedsys", "syscon"
-	- "mediatek,mt8516-apmixedsys"
-- #clock-cells: Must be 1
-
-The apmixedsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-apmixedsys: clock-controller@10209000 {
-	compatible = "mediatek,mt8173-apmixedsys";
-	reg = <0 0x10209000 0 0x1000>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
new file mode 100644
index 000000000000..770546195fb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/mediatek,apmixedsys.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek AP Mixedsys Controller
+
+maintainers:
+  - Michael Turquette <mturquette@baylibre.com>
+  - Stephen Boyd <sboyd@kernel.org>
+
+description:
+  The Mediatek apmixedsys controller provides PLLs to the system.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt6797-apmixedsys
+          - mediatek,mt7622-apmixedsys
+          - mediatek,mt7986-apmixedsys
+          - mediatek,mt8135-apmixedsys
+          - mediatek,mt8173-apmixedsys
+          - mediatek,mt8516-apmixedsys
+      - items:
+          - const: mediatek,mt7623-apmixedsys
+          - const: mediatek,mt2701-apmixedsys
+          - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt2701-apmixedsys
+              - mediatek,mt2712-apmixedsys
+              - mediatek,mt6765-apmixedsys
+              - mediatek,mt6779-apmixedsys
+              - mediatek,mt7629-apmixedsys
+              - mediatek,mt8167-apmixedsys
+              - mediatek,mt8183-apmixedsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    apmixedsys: clock-controller@10209000 {
+        compatible = "mediatek,mt8173-apmixedsys";
+        reg = <0x10209000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
