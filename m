Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9517EC64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anJfvBlE+shc2bmOxourHefmds/BtxwdudHBi4fTMDE=; b=bJTU2/WJ0L1wo9ZjDBwf59TA/t
	y/2MhWj3IuZ0zehtLuc613UA4c26RERKsrS8fUQEniTOwpZnYJCWvuXnAurgNjxwrTFXnbbUnzje9
	6QZsraUfIjR9TZ4CndBfFaPQlxPn6GVAsyowXuw6+UfXSo19n8Tv0JxdwjpDThzi1AsOUwDwTnoHC
	LLmT91JzS5flfld6E60Z4W1m7ANFVNWWLQqtoSLKuvWhcreT/L60BhVnXGdRQSdRgCr+fmZk5lYML
	Ys9QCBdZ9yTbLKYsy/B4OdwRTLcfA/OiiuZQttkS4QuAmTG7z/7XIFHewi6IjleYDYl5yp/Xdn9mo
	uysTS9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuRG-00CFrp-Bo; Tue, 28 Feb 2023 07:30:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuQo-00CFeL-Gr; Tue, 28 Feb 2023 07:29:52 +0000
Received: by mail-lf1-x12d.google.com with SMTP id s20so11870835lfb.11;
        Mon, 27 Feb 2023 23:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anJfvBlE+shc2bmOxourHefmds/BtxwdudHBi4fTMDE=;
        b=EJeNyNiEouLJCSo+lYCJumat2GRI7N0vyjv8gKfz5S/MY6+HDt6Sh5XFI1LczHt3oV
         X1jKFx3jWBMjMIJJmSe4+pF73SGPCR4t3n/DQmb7XpDsQJt7V4YywVYSHV2bpn4fgIef
         w35lEOCB1eeUBYKpsjlbUtjBvceAB7+sgHaOHs3WqLIrdQ4Xx6XfscB0G6d5MFDgqZEi
         RLDJnDfPsaLqDq10l1EHb/c4XEgrORIJ+WnLIiCb/WdGCobFNM5tghacSO7jXxSiOuw5
         hIcpqxXeoZ6HkP/HY1YdRx5P2EMtTwXJnlb5r3ZIF29YHB1KRrff4r2KnvwwKXgnEHse
         xPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anJfvBlE+shc2bmOxourHefmds/BtxwdudHBi4fTMDE=;
        b=5f9GidocenPVJIeq/XDtFU6vM6t9ntJUCXC/aF5jOOzWYmDuoEoxdonZlD9fA2b+hW
         JFhZEPzhfb77IxYlyDmnnBazVufbIN4n8XWaGrqQwecdUbRa2EcIRMRPPlk9mfS7TbVC
         enQYOVJ6H3/4G5/xtr+8ScF9EXevGX+NZLz7fZ2rg0QekSRsxaPztDoODQobVIX1J6XU
         HA8LMEExDgnZpAduBSHhd04j5/HcA3wdakMuPMwLKCnB3RdabdZ7+3FUlRoJlYi5qcdc
         FbE3lXb/PoYQQBDxEGCQwkSjgU/yaK2eBg7yYQuejgS0htKox056xBM6pOFi4Ku8M3no
         7v4w==
X-Gm-Message-State: AO0yUKUlW+mXkYjq/WJ935HDcE1y+v/qTK3DUohdRJkKdxdyxVaVft5g
	WZjo4t7IFtv5TPQl27+PE5g=
X-Google-Smtp-Source: AK7set/QtguLI5ukTkiUykG2VdzDxDgGFtQnX9xt1e+GexfGmgk3wXArPR+umYOM4/Qgy/igZSM+Sg==
X-Received: by 2002:ac2:5215:0:b0:4e1:7209:c09f with SMTP id a21-20020ac25215000000b004e17209c09fmr476595lfl.66.1677569386447;
        Mon, 27 Feb 2023 23:29:46 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id l2-20020ac25542000000b004d85a7e8b17sm1229550lfk.269.2023.02.27.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 23:29:46 -0800 (PST)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH V4 1/2] dt-bindings: nvmem: mmio: new binding for MMIO accessible NVMEM devices
Date: Tue, 28 Feb 2023 08:29:35 +0100
Message-Id: <20230228072936.1108-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228072936.1108-1-zajec5@gmail.com>
References: <20230228072936.1108-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_232950_585386_48701D42 
X-CRM114-Status: GOOD (  17.17  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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


