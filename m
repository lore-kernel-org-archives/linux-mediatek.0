Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF3606A333
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IXap17Ty;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JzNlx/Bt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=; b=IXap17TySe6MPo
	j3nVSgs5bRRwFJEjN82EhBXmQXHd4SO6mXzaTqnXm3WER/AEHv8CcwLmmg2kCg4jmcv6d2xhd72Y8
	Q5TROOdRSQRWULEOhLPks4QZl1AcjlMZNSthdhzn5Ed2ZedI8iMJNlx0S03hCBu6nicx/YsH6z47q
	A5W3aqBp+wHpEq6qmv90N+SLUa5ZyVyKt+KbRPC5twhInW6MvWOMa2dnYUOjIsIs8TY3vlhxcR9sn
	Rh4sc2w9Yp/CvAnK5H1xCURJPJmd4tc4NVohTf9WcsniQc/iow7UVxU+ba+t6TO0CnmZlrhCIsBFe
	d4Izx1JJ0b7wAau1/MYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1m-00000006a34-129c;
	Tue, 17 Nov 2026 17:31:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1c-00000006Zxe-2Qak
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 17:31:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so1068105e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936679; x=1795541479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=JzNlx/Bt+oZEh4xGkNxW9EojO9qMV4+dO3sfF96JkxAoOrW8zY3PNix55Q42q1XMEm
         BZMYubLozMvAAlTWQeJwVVxpx2UucTYfwL8lyouyCeMoCxVxMklSHRGT7YiHR2Zk4/tY
         dTkEBGunojCKc/ZZ/G0sS2Eo9UDRkbyvQm2AtGmy4HIiaR5nADdenvlcmsfFZXKw452M
         THAEf/Ks4PM6lxUqAWHdxW1xA/A6o8HpFNmCeCUT6cSTcJvElQ6TWfWc81Bvsp3njaco
         qVKpfnMbutiAeya7T2u1qB+7cS8ZMOBWZ+HxVGFarEEo7f62oc15+jEtBwWbH1SfK9JM
         c9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936679; x=1795541479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=wP6mNj3kHc8S33J0Im9PSziQCvqEni+uCR5s+dkJvT/L2DuS9BmdhjzdU8XmQCyYNl
         wA3Zme0nLM+zKtbUG0/lqHUYQuleDZHlwsRrY3mkPkUxvSYaGsLrzSeEtsCPY1tENfTo
         LojDjHz/5lPE6NzkgJe09rh43xtJMEVxfdbEYLyMsebnMzRPGi5W+nhfGRv4G5Q0OQ2y
         a/lCQTiW3MB22YFo4SrskXi5SamvL5AJ9lwYimhJFHUmkq4oxXiJ4UbeFZ5lZNNyhmYr
         jTAABj2j0lIyJIA+VvFBcnHQgdX2sNE3NMmQaWeOj1KeLOWXCUzh519Rp1aC4O5MsGlM
         Tt8g==
X-Forwarded-Encrypted: i=1; AL+hErGCh8YZ140lydBn4Xh68mJ7gIj+R2re1pLfR/B04bGC9oOQi3wVyh/eZAPfiknJaBWApLFHXIXfK2/zkZngLw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9E4qx4PztkhQsUI/uCtyj5OW3qVyfyVuTLNawUUcooRa3WwSmH
	rD3zm5A9ZHYUrPEJUHyDjA7ZLtb5RqDLUEEdyEFonET0uhDhEo3TmEqTvc9jfVNm9Jw=
X-Gm-Gg: AYBFou1Dpa3/tQuvg5sdYHGrlljeGn+7J3pvAtZSA1VbNi/o3NQHMxc5AfNKDm35l+8
	+k0ENKLXspOhcMgei09+CQDBlNRKHwyq6HVft7WA7n8zE2KE7TWa8nfZXmISYzqa0cwT9n179ql
	bs4Z2bvQRUaZG+q1ETFndn3tW4O7u6ZSzkRzCusSL2Mg1KTBioWpdBUAnTh4Aur506fRGwYmQ7Y
	IX1bu8y5rhICOy9Ia7uUh5ZNPjO+gTtvJmDrgtSl4Q+aNa8f5oNQhuS1Ojl4byLszjfN6RcLiDs
	BJzRRNAywcItsFRCGaArdpje/ty8P2IZ1DDemcDwZ2WLLa9Vj9VBe6pSc/2nmU+zLbNlLRMQSAi
	8dFl90ywFAfnA8siJpP2yIjm1FSG5+pW1rZW6g8MNtMb7iv2Nu7JldlVMGuJbuapJLKH0SniHzL
	J3PQIAnm7cJcSaxaxaTiFXHLRgCU0SB0X9t3C5Lobsapaj337oKELeR+dBt3wKIq/aY+gLJiZ1p
	IybYqFHHdRnK34spZJhQnoygT7JT7uYQqduJPqaanzB01H15wXfbe7PKBcPDK88wtZOlaThML6T
	28bQvpPibGzGGwh18ZU/o4AOLYu6HSkcnKDeFea46ejgjhU5Ou7bDIf8
X-Received: by 2002:a05:600c:3547:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb55a8a402mr298153595e9.28.1794936678575;
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 17:31:04 +0000
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: Add MT8196 SMMU
 wrapper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-smmu-wrapper-v1-1-229f04d9f693@baylibre.com>
References: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
In-Reply-To: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093120_654867_EC99E4DC 
X-CRM114-Status: GOOD (  15.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT8196, a MediaTek wrapper holds the integration settings of the
multimedia SMMUv3 and merges its interrupts into one GIC line.

Describe it as an interrupt controller, in its own node next to
the SMMU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../mediatek,mt8196-smmu-wp.yaml                   | 70 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
new file mode 100644
index 000000000000..b841d9d0e3fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt8196-smmu-wp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 SMMU Wrapper Interrupt Controller
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description:
+  The multimedia SMMUv3 of MT8196 is integrated with a wrapper block that
+  collects the interrupt outputs of the SMMU into a single interrupt line.
+  The wrapper latches each SMMU interrupt and keeps that line asserted
+  until the latched interrupts are acknowledged in the wrapper. The
+  wrapper also holds integration settings of the SMMU, such as clock
+  gating and system level cache attributes.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-mm-smmu-wp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: |
+      The SMMU interrupt source:
+        0 - Global error
+        1 - CMD_SYNC complete
+        2 - Event queue not empty
+        3 - PRI queue not empty
+        4 - Performance monitor
+        5 - RAS critical error
+        6 - RAS error recovery
+        7 - RAS fault handling
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    interrupt-controller@309e0000 {
+        compatible = "mediatek,mt8196-mm-smmu-wp";
+        reg = <0x309e0000 0x1000>;
+        interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        power-domains = <&hfrpsys_hwv MT8196_POWER_DOMAIN_MM_INFRA1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe23913b1e43..5cc65a753ad2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17223,6 +17223,12 @@ F:	Documentation/devicetree/bindings/memory-controllers/mediatek,smi*
 F:	drivers/memory/mtk-smi.c
 F:	include/soc/mediatek/smi.h
 
+MEDIATEK SMMU WRAPPER INTERRUPT CONTROLLER DRIVER
+M:	Alexandre Mergnat <amergnat@baylibre.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
+
 MEDIATEK SWITCH DRIVER
 M:	Chester A. Unal <chester.a.unal@arinc9.com>
 M:	Daniel Golle <daniel@makrotopia.org>

-- 
2.43.0


