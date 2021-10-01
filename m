Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77868C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4206961A3A
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4206961A3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onsxQd9msZpR3r7mucUTfhjiOnWG3J9kV1nLwVGReDQ=; b=lu449s4R9RUoj6
	2+ug59ArEMbEi2pBrJlS6WjaetUB8yevJe04r26Ee1iHLTthHpcYRyyWg6kmrBACcTcOHoUrz8HIv
	Xz8oxH1EXOYd08zFMaG8ERGi40JiOQPf6WvoYJYjDHeTWfXcKPmmtiYu41tU/9Gu8u5mxifYJp9vm
	/0JKDW0hEixQGqwSqgV3OJbFDBySoPIDHWdEEK+pQ8kZ27zvgVkYoVuwDyDnVi+NInDo7ymiVKr43
	Kdgi4Wk8o8C+i/wIy9jq95Gaw5uwh8y4dO26A50/bDi6fqG7o9xFapPNFmgFRb/If7HwIzUbr/Z/W
	l1SIOunLbUPB9Hj2REsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF8w-00HK4i-Bi; Fri, 01 Oct 2021 09:47:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF66-00HIj7-Pr
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:44:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 a131-20020a1c7f89000000b0030d4c90fa87so1095282wmd.2
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Oct 2021 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=lXwykb1Xk3s4b8etdfX3WIi7GxCXgHQ/b6wf4w3CzP8zFf7GXe9h/Z3USg97ZKIOSW
 xNFDtLbzXFsXHsdUwuRKpdhdLv8WOydkcRsn+5VCQ6iFPLxR1ltzB6CCyO5QLeRdnYXL
 jVxiqJ/DJGgVLUK+X2cLnYqMBp2G2kekylp1YnnD6HjhYvlgeXy13dEAeHFgpx5zMgt8
 F9fTxCP8p2X9fZoXWKlnqRJDXayMGOZ1/NYOYAX3CregQNtS5xPxE1ZXOw1vj5DWHZzv
 5dSLP8Rd+AvWci+nbR1dXeFBUIVTlisuS5kTmw8CJHmYQHBfUNs/XceWF7KqlB2UcY9O
 aqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=NlpgBAulwPcap2IOEr8+iai/R7RPxNusN+qyQN5Rujj8JwOdGz2QrNbdQCTY5RqxTI
 7oIHqc19QRDsM65d9fOOm5MMTmilDGe08qB9F0YoyJ2HfE1J3k7FOiMxnDPh3IIS5h9V
 mrWA79RHT9R086wm2cwkaMBvfq5GkJGNkW8h4pN59G6VVtWJdNK/bkNaoOjykM/8L4/t
 c2G+QJGluzbkPzKGyCaXQ/WmS5NEa4/H6kx1h5PjafmuWYmvR+SPsYmSl4Pw137jAKOs
 2MPQtUGrtgTppCHnljdCChZrfbIe1sYRCmJsgtZZ55nd0udrAI5oeby7cwGDQ1y1BbNC
 53sA==
X-Gm-Message-State: AOAM532nDeF5yS2yZZP3ydbAxmwqpEmykG8S/J5QuufUHGIa1ZyNJ6r6
 kWQU00T3uPjTNUdfMlDBtXQOMA==
X-Google-Smtp-Source: ABdhPJz1ksC2R5ut/PanYMRc8GXcB7KUTLMvQyXmKOBz3CgUITze1QD5ZsVhgUA233CLvPsbzRf5iw==
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr3487374wme.22.1633081492800; 
 Fri, 01 Oct 2021 02:44:52 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:51 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 1/6] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Date: Fri,  1 Oct 2021 11:44:38 +0200
Message-Id: <20211001094443.2770169-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001094443.2770169-1-msp@baylibre.com>
References: <20211001094443.2770169-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024454_897628_D5A00E74 
X-CRM114-Status: GOOD (  13.64  )
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

DP_INTF is a similar functional block to mediatek,dpi but is different
in that it serves the DisplayPort controller on mediatek SoCs and uses
different clocks. Therefore this patch creates a new binding file for
this functional block.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes v1 -> v2:
    - Move the devicetree binding from mediatek,dpi into its own binding file.

 .../display/mediatek/mediatek,dpintf.yaml     | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
new file mode 100644
index 000000000000..ac1fd93327e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpintf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek DP_INTF Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek DP_INTF function block is a sink of the display subsystem
+  connected to the display port controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dpintf
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: hf_fmm Clock
+      - description: hf_fdp Clock
+      - description: Pixel Clock
+      - description: DP_INTF PLL
+
+  clock-names:
+    items:
+      - const: hf_fmm
+      - const: hf_fdp
+      - const: pixel
+      - const: pll
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port should be connected to the input port of an
+      attached display port controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+
+	dp_intf1: dp_intf1@1c113000 {
+		compatible = "mediatek,mt8195-dpintf";
+		reg = <0 0x1c113000 0 0x1000>;
+		interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
+			 <&vdosys1 CLK_VDO1_DPINTF>,
+			 <&topckgen CLK_TOP_DP_SEL>,
+			 <&topckgen CLK_TOP_TVDPLL2>;
+		clock-names = "hf_fmm",
+			      "hf_fdp",
+			      "pixel",
+			      "pll";
+	};
+
+...
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
