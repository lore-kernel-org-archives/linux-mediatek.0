Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB0C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkN86TIGDYJR+4nG2fHZ23r9O15jnUv5Y7OgjldbOWg=; b=bJ/LWOnAXhJ0Lf3EmdWsn17f8g
	nKhI562tfOmfihgVT40MamDWp1BedqNCx0AHR57vB257uWI7kDsKEj+H7VtfUN7kmZx4cG1Wh+NUW
	y68PfrLNWB+QRSjsQnahtSyYTwcHR2xnJn73AqZIUc0+/2EGQXfKBre384YVf2MCkNcspmub6ihLt
	BiwobTFFkJUEV5EAZLNH2vlc2tXiRzZtTFUJaTJg7L8tB0D/is6bj8veWmCYn3Rt6XnNPQiY2LwEY
	vIetl4Y8JkcyrvkKaE7qOYsSQ3IdJEbh2T+/s0s+Ya+FFqeZ1+ZsADR1hvWvlBnUTBO6JWFcX/SQ3
	NF0isTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6z4-00AVm5-QJ; Wed, 01 Feb 2023 06:52:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6yt-00AVhW-VV; Wed, 01 Feb 2023 06:52:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id dr8so26881048ejc.12;
        Tue, 31 Jan 2023 22:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkN86TIGDYJR+4nG2fHZ23r9O15jnUv5Y7OgjldbOWg=;
        b=XQIBijkI8+OKqPlP1sL19SlqXbWw60maYM9giAx3GHyaI8sTJzjRmp2DolRMnASr0y
         KN+uzR6MaFeH/IuHZUnl3SEco9dEAigoohMzr0+VR8jnKTbFs1fCxFNC7IK019wWt8OY
         QlzYoAHwljH2DooyMDx5L6kYW21Py4D8vjJ6cfSynz3h51BrFBttejiOKfgd1GgTw0dZ
         nvzLHSsmvPeJHRhlskiqcv2KfYB/dmNUWPK4L88y9+WMg/F2dS1qJkXnsz7aGsFYHnUn
         JUswLiy7imzInpudmE6IkD6zZJt8FYlpLUtjMa3u4G3B8tWtvyaAACqDkuz6q4JX0ttc
         zRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkN86TIGDYJR+4nG2fHZ23r9O15jnUv5Y7OgjldbOWg=;
        b=wpceln8iZA6MWrKoj5PuFQM8EhwOJgTLBsjsDKbW1JKsB/qLfAiTOeBYyPA32Drb4n
         OCwlofDYVoWQCEd29THlnmV8SGlqlDwSDIYELLRAnCzzqb0hGZt59YbSuWA6WVdl4JDh
         9zWoq64ei48o9MHVcPUzlRDKkYDz4w+L/KXn/pPCv4fPEl5LLcAcYTPTMFBq+yfFSLwc
         Um1P079aNCWr4JmQOVFrOjSuvBo08qRbokgnAI75v4ZNzwR6A+chXVip1lfF/Me7WZ8V
         UsBu+HzdivSRI30Kom2PR0CG9V5UIoxTGk51nto2NzBM2iJBdPg5ItBjV39fuFU1IuGZ
         f9fA==
X-Gm-Message-State: AO0yUKXXtRYA/ffsQLnFNS+GFuw6R8VHT/Bmc+LQYWuLvmNua0h5fKLY
	eTiSiqpt+tYKwARBNyd04g4=
X-Google-Smtp-Source: AK7set9RlXgjOXhXlIkZpvFu0cd4Wj6DSXLwpe5l9TlAygwD+iwHH++wtMJmQg75MNEL1biWwmOg+w==
X-Received: by 2002:a17:906:b7d7:b0:88d:fe1:1aca with SMTP id fy23-20020a170906b7d700b0088d0fe11acamr1102961ejb.34.1675234348849;
        Tue, 31 Jan 2023 22:52:28 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906218100b008720c458bd4sm9509608eju.3.2023.01.31.22.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 22:52:28 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: nvmem: mmio: new binding for MMIO accessible NVMEM devices
Date: Wed,  1 Feb 2023 07:47:14 +0100
Message-Id: <20230201064717.18410-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201064717.18410-1-zajec5@gmail.com>
References: <20230201064717.18410-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225232_037908_9E4D51DF 
X-CRM114-Status: GOOD (  15.68  )
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

With the NVMEM layouts binding in place we should now use:
1. NVMEM device access bindings
2. NVMEM content description bindings

This binding allows describing NVMEM devices that can be MMIO accessed.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/nvmem/mmio.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mmio.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/mmio.yaml b/Documentation/devicetree/bindings/nvmem/mmio.yaml
new file mode 100644
index 000000000000..27e3f6142769
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/mmio.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/mmio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMIO access based NVMEM
+
+description: |
+  This binding describes simple NVMEM devices that can be accessed by using MMIO
+  (memory-mapped I/O access).
+
+  It's a generic solution for providing NVMEM content access. The way of
+  handling actual content may be device specific and can be described using a
+  proper layout.
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


