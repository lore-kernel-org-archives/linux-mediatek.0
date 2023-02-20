Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5016C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFDJegi5uTYwdkZXr42aNBwxRD/vvuGUyK4suapHfLE=; b=iJykzWoRZSWEzs3LgkfqaLp6ga
	mXlWwdD8HYYVKyPdBPr/BWB7CvDBc5zGOqvrHr4nPmOtfS2dHnQnyjndaNdxB/7EAapqyookehofF
	1ZeG/JFS5Mt7qvD6iKaByl8c2zz9CvS9eQh04ZcwADWPTo8ag7O5YoKyZNPctE1WxdY8tUbiLEh0z
	mtutKL4BbfGBsvvdQAlwt/CaIFrvEU5Hx+JPtr+4L1g9BbjmcK/dtvRMo+OEemdfQG03F/DkuO6M9
	ilcDebm6eheI+36LfnExJBxhTATi/uswXsvkEEUADf//kvMmEnRNJPZBmG/LUD1jc9WKCqXsuVrOK
	jrwu2O6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUAIh-0056np-Dd; Mon, 20 Feb 2023 17:50:07 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUAIJ-0056gF-Fq; Mon, 20 Feb 2023 17:49:45 +0000
Received: by mail-lj1-x22d.google.com with SMTP id x41so2113291ljq.13;
        Mon, 20 Feb 2023 09:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFDJegi5uTYwdkZXr42aNBwxRD/vvuGUyK4suapHfLE=;
        b=pNp4F+WC3OYbrn5ogI5MzgDCG/M7DsThUP1JveuJQchDIP5pr5gJjrONCAEm5MCqJ6
         0mBiEWGY46umgI+IlFdYRaS5MTRSpJUFNUe+xvnDAl+8vDi99y8Q2A1AZG1xHQzYz2x3
         hR6HOaZ1fdpqnGjv9Sm46+HtmEffVa4Be2BeaVcJw/5LHmzf61gj0dY+KkLayoJkSyNa
         oyfyQCi+vLKoWyAqNd6ZSxZ6+z2jrLoW9p3dBXdVm+zc6ddqsGfAp8zkX7utEKpQ4MIp
         KpYDrFrUx4v9+fRGS/N3FEAHWFq1KIKJ9pr6VVjYuhjomasoHeKG0VDVwE94iWwKTEMh
         QHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFDJegi5uTYwdkZXr42aNBwxRD/vvuGUyK4suapHfLE=;
        b=eg0dcGFvYTVncF/eVssXHXRvUi0gASiCJYY/LltNvfbOQIpYtSwetmqqiRd+Nxe7AA
         GW/zTDrpfAjj70AL2wzEPvPkJYtcufG4Ic07lVzKfSojoX8BMYBH6+ArxxsOLo8m+VLp
         +s9reKBkOXNs7i80ru6a1IiOL2667FxmypPOfiq2omQeiz8ZYZ1We89DU7Ool+MSoVv3
         Vw/aHPbuQVhaUZF2Vjt22DqY4aAZ04o34H4As6MlNcMok4y6/umeLDgKwoWR7Zxsm448
         E2kSirDnbKO5vpJjvZDY9m9PQSB+FbbZxCFvybJIxhGRqAVWuyGTbGkqO5xS/2wkLbhl
         h1Dw==
X-Gm-Message-State: AO0yUKX7y3yLnUW+lVIkIzIhfyomx43OtGNvLY4oeJvCRXXUXok0aFu5
	ZvG+MNp3COnUH5iCXkKALVM=
X-Google-Smtp-Source: AK7set+Sh6RcNPNBI8AkSmYzzOk7NOMz/GoQ61Hr+5GGqp7LrngcaXhxl712WiDfdg5IZOKgCEhe0w==
X-Received: by 2002:a05:651c:10aa:b0:28e:a8aa:6f95 with SMTP id k10-20020a05651c10aa00b0028ea8aa6f95mr832063ljn.8.1676915380580;
        Mon, 20 Feb 2023 09:49:40 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id u22-20020a2e9f16000000b0029353491df6sm294695ljk.48.2023.02.20.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:49:40 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 1/2] dt-bindings: nvmem: mmio: new binding for MMIO accessible NVMEM devices
Date: Mon, 20 Feb 2023 18:49:29 +0100
Message-Id: <20230220174930.7440-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220174930.7440-1-zajec5@gmail.com>
References: <20230220174930.7440-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_094943_557509_7C88469F 
X-CRM114-Status: GOOD (  17.02  )
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

Content of some NVMEM devices can be read using MMIO. Some of them
(probably very few though) may be also programmable that way. Add
generic binding to allow describing such hardware.

This *doesn't* apply to any more complicated devices that need more
complex interface e.g. for writing. While such devices could be
supported for reading purposes by the same driver - they should get
their own binding.

This binding will gain even more usability once we fully support NVMEM
layouts (describing content of NVMEM devices in an independent way).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V3: Make it clear this binding should NOT be used for more complex devices
---
 .../devicetree/bindings/nvmem/mmio.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mmio.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/mmio.yaml b/Documentation/devicetree/bindings/nvmem/mmio.yaml
new file mode 100644
index 000000000000..9ca96b7a4856
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/mmio.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/mmio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMIO access based NVMEM
+
+description: |
+  This binding describes simple NVMEM devices with content that can be accessed
+  using MMIO (memory-mapped I/O access).
+
+  More complex devices that support any other access than a simple memory
+  mapping should use a custom binding. In such cases this binding's compatible
+  should NOT be used even as a fallback.
+
+  This binding is designed to describe just an NVMEM content access method. The
+  way of handling actual content should be described independently (on top of
+  this binding).
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: mmio-nvmem
+
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    description: |
+      The size (in bytes) of the IO accesses that should be performed
+      on the device.
+    enum: [1, 2, 4, 8]
+
+required:
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvmem@10000 {
+        compatible = "mmio-nvmem";
+        reg = <0x10000000 0x10000>;
+    };
-- 
2.34.1


