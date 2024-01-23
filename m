Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ABEC47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nJe/bb99wvZWtQpEHBH6bF+41ulPQ5p1NzMnmqiIsdI=; b=bfGzJNIl0ZcXtei8hDzThylbnX
	ZHC3yfysVOup9jI+JIWb2W000f8M8xk9uwrmsmPEApdUySrXAtOCvAjfEc24YDuAWegbFi/S+SuM2
	65uneATdTh6f6YGi2T1OzGiQCvTBlOP9y6+WzF+QS/FLWY3maKHmb2iMYPEM8rDpQI/MsdGBTrgwP
	olHtMQGI3olI0wiUT8SeTGYB70IxRWmHblwB4GWqlLImUUK/lUqW1j9EiVrXH+oBEFqvD9XcfGktF
	jesIUUVIfbBjh60Rrk1VllXysG0Xj51YqqlTIcVJd3sxPtl9Afgiz6bTnAWJGw640zspEzXXblqzN
	BM5Y5B1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGFJ-00GSMm-0J;
	Tue, 23 Jan 2024 12:51:17 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGFG-00GSLZ-1A;
	Tue, 23 Jan 2024 12:51:16 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2cdeb80fdfdso47698961fa.2;
        Tue, 23 Jan 2024 04:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706014270; x=1706619070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJe/bb99wvZWtQpEHBH6bF+41ulPQ5p1NzMnmqiIsdI=;
        b=TcgI10TrhIgWznTfE3cDTCDSrVFO57yuZ2/Z3Mdhz+P+R99oMHJ6zWfhyKpz9NK0Zf
         PgplKld1U1GFWzNkbWMKbQYok/Rwxb7ryrIZ1/XDtTaI56Ou/jh0QEoNAC3tvUFtgQQq
         YNtCBLHu/vpQ2TpAgRHsRF6VeJ1Q92tSS9tsVrEB4UIVgne/ZqggP5QYLAwaOV4gdL0G
         3IdUDi5VWfDrF8HYpnoLQKcuKjb/BYCuN4LjTLI3oGMfqWhMrIqh4TTbr7nw687OEcI9
         jG2H3wm6a7tuqTidN3sxQKHsFRYC3+y6mBoOGOj9FInegkxkvt3mzneWQZLgdSkxBO+a
         rzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014270; x=1706619070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJe/bb99wvZWtQpEHBH6bF+41ulPQ5p1NzMnmqiIsdI=;
        b=n1WeQ9+zZJJurw5upkn7yoo/k+fjmksOS1nXI7iMPPSQiKTXBEBcW1mEm/IyXCeDMi
         kXoYlhBdNcnY7k8O8kC0qqpRqiG8aafS9qCyxExCy/xm2ImfT8rkljSOkvbpVi5imDe8
         lx0s5BqAEmSIK3fwYuB4m2I6o2+uYQjuDVha03S4NDtHkMywzpoATS83UXtwThCf5LK5
         sj0+dtMdT+ltWurstsRS7cwHKslKp/XtG8OiXaC6DXmbduoRybbwY3Vwb5DD8mCsKsuw
         DuCODFE3KUNAQfBnEBPkn1xy/613ic1nQkNQvY2kIXB4CI3optghxksq9bDmeQHLoN/y
         FSUw==
X-Gm-Message-State: AOJu0YyvvXo8ui5LiuT8Uku/uPNelx/Z47CR/OHQT1FpVF4SOSWwZaG3
	yJq6FJd9NDL2YiAkEu3EnDI6zv4D8DTWBb2tHZ2rvyFYmgBvPaD+
X-Google-Smtp-Source: AGHT+IE44jLIuMt0FErwF7fvN3/iEOcUP3ePoa0CnFnMxIeACCJzIuIjOLKh+Miwuc2mjnbUaKmN5Q==
X-Received: by 2002:ac2:4642:0:b0:50e:6332:8083 with SMTP id s2-20020ac24642000000b0050e63328083mr1436862lfo.183.1706014269761;
        Tue, 23 Jan 2024 04:51:09 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id p6-20020a05640210c600b0055c500158b4sm1871944edu.23.2024.01.23.04.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:51:09 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: rtc: convert MT7622 RTC to the json-schema
Date: Tue, 23 Jan 2024 13:50:43 +0100
Message-Id: <20240123125043.27192-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_045114_400261_B1AD46E5 
X-CRM114-Status: GOOD (  15.32  )
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

This helps validating DTS files. Introduced changes:
1. Reworded title
2. Dropper redundant properties descriptions
3. Added required #include-s and adjusted "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/rtc/mediatek,mt7622-rtc.yaml     | 52 +++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-mt7622.txt    | 21 --------
 2 files changed, 52 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt7622-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt7622.txt

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt7622-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt7622-rtc.yaml
new file mode 100644
index 000000000000..e74dfc161cfc
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt7622-rtc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mediatek,mt7622-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7622 on-SoC RTC
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt7622-rtc
+      - const: mediatek,soc-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: rtc
+
+required:
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt7622-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rtc@10212800 {
+        compatible = "mediatek,mt7622-rtc", "mediatek,soc-rtc";
+        reg = <0x10212800 0x200>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&topckgen CLK_TOP_RTC>;
+        clock-names = "rtc";
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt7622.txt b/Documentation/devicetree/bindings/rtc/rtc-mt7622.txt
deleted file mode 100644
index 09fe8f51476f..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-mt7622.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Device-Tree bindings for MediaTek SoC based RTC
-
-Required properties:
-- compatible	    : Should be
-			"mediatek,mt7622-rtc", "mediatek,soc-rtc" : for MT7622 SoC
-- reg 		    : Specifies base physical address and size of the registers;
-- interrupts	    : Should contain the interrupt for RTC alarm;
-- clocks	    : Specifies list of clock specifiers, corresponding to
-		      entries in clock-names property;
-- clock-names	    : Should contain "rtc" entries
-
-Example:
-
-rtc: rtc@10212800 {
-	compatible = "mediatek,mt7622-rtc",
-		     "mediatek,soc-rtc";
-	reg = <0 0x10212800 0 0x200>;
-	interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&topckgen CLK_TOP_RTC>;
-	clock-names = "rtc";
-};
-- 
2.35.3


