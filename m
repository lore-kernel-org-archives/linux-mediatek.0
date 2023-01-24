Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D273C25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfjek5I1oI6I+fvZ0/B32LKubURkbISmBCkZ0YpdN10=; b=UmfSxwbB8oewdzFsNkl5Mr4AzD
	/ib+eTolJRZr5mbBlpIdJl2UVS+OP+urFQtiRRbrG/c756SvcDkJaiskzX3TapPROARS0s/f7JFwk
	lYp4yvROQ0gQ41xAgh5h59ICEzrGp0O4dFeoTFjVxLFUD1UbFSeCUyko02CE1ftilYSbrx1ZCcXqn
	crmrxNxzhQkOO4E5jag8Vdhvq/s/fEqmd7/IJEslISM34OQa4M1YgRQmje/UO8Aqf0UsyV8JgFNfS
	uyyoQqIDMxDSWupIcQ3OtFPx3SaAMvHpPSXxt33pr3eoF8MpTBFFuySc+wO2ubay9Lxhj07iXDgv8
	wbTPharA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEP0-002hdj-WE; Tue, 24 Jan 2023 08:11:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEOw-002haQ-Ng
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 08:11:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so10305739wmq.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 00:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfjek5I1oI6I+fvZ0/B32LKubURkbISmBCkZ0YpdN10=;
        b=eDb2eUaNmqc6RJ4X2WI2l7rWHFeOluRyE/kcnDtOWp+0DqwtA38WsnV48j3ePYzbFP
         EQYQxNv9ZXhvWuZbMtoLxRjrcC6np4eQaLKmXzt1SB1j2qi6KqWvzw97Qqw8q9Tcj/kJ
         jRkpTATMw5OIV0lre30D8pKGEEkyeXkw4ljIHPMQNEyAhtrIzYwPkv7vOSeHKGF5iD40
         wci0xsCQgObSm9c0bqJUw7B42/Mi/epy4pqCgUifQQemyne16Fh2aeGwJHrQWfBPLLGF
         eXMXqllG6GWAuOS6znc7YpeyMd2iydmUqqH51FyZvDoPgN/LAPAB5nC35L/n6/NSluM4
         ynWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfjek5I1oI6I+fvZ0/B32LKubURkbISmBCkZ0YpdN10=;
        b=FJBXyUNlmTqhYYUvXlWMwjb+dxgQLdWAkz/Sub2/sRLfGV9v7uvIIFBCwUFeBRgzxH
         2VxMkzbHgzpJSyTn21+bAkBe6RC8PS9+TvwDeUz6tW67efKl25Dl61EHsFhOQnfZ/bkL
         HxSHUF3PEjotlMP5eb7S2xUayUtiNc8nf6oXZQJothzogMnsoRJOnyNq/CxYcVAgfE+l
         7A1zx3IbHByjvSx4lE3nbL+aAPylFp/0O0nFZKI/5Hu1hKmrCNfPe+4s0pTQeqOQ0w/4
         bFNwb+SMywITHMcElyu6JlelTbGT99n87239svB/iNKKEmlk7ONTRuJ1Nyfk+d/H6l6i
         F9TA==
X-Gm-Message-State: AFqh2kpO7tmmn04H6Tz610MzEtWem1aFzUKXi3+RypHlHAKwUloIGxIf
	MZcNG9xPmiOiGtSmv8pdHICFPw==
X-Google-Smtp-Source: AMrXdXsAy5Fj0pQUlmUK2moB+gPQM3akwPZ40HQiL5qb7z319tG/FrGiJd4D178rigOr93uyKBy5+Q==
X-Received: by 2002:a05:600c:4928:b0:3d2:2043:9cb7 with SMTP id f40-20020a05600c492800b003d220439cb7mr26935434wmp.5.1674547888579;
        Tue, 24 Jan 2023 00:11:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c511100b003dc0d5b4fa6sm1387338wms.3.2023.01.24.00.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:11:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Green Wan <green.wan@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?=A1er?= <povik+lin@cutebit.org>,
	Peng Fan <peng.fan@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	- <chuanhua.lei@intel.com>,
	Long Cheng <long.cheng@mediatek.com>,
	Rajesh Gumasta <rgumasta@nvidia.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Palmer Debbelt <palmer@sifive.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: dma: cleanup examples - indentation, lowercase hex
Date: Tue, 24 Jan 2023 09:11:17 +0100
Message-Id: <20230124081117.31186-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
References: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_001130_792627_8D9AA54E 
X-CRM114-Status: GOOD (  12.22  )
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

Cleanup examples:
 - use 4-space indentation (for cases when it is neither 4 not 2 space),
 - use lowercase hex,
 - drop unused node's label.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Drop unused label, correct indentation.
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
 .../bindings/dma/stericsson,dma40.yaml        | 16 ++++-----
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 2bedab1f74e0..5c81194e2300 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -113,21 +113,21 @@ additionalProperties: false
 
 examples:
   - |
-     #include <dt-bindings/interrupt-controller/arm-gic.h>
-     #include <dt-bindings/interrupt-controller/irq.h>
-     /* example with snps,dw-axi-dmac */
-     dmac: dma-controller@80000 {
-         compatible = "snps,axi-dma-1.01a";
-         reg = <0x80000 0x400>;
-         clocks = <&core_clk>, <&cfgr_clk>;
-         clock-names = "core-clk", "cfgr-clk";
-         interrupt-parent = <&intc>;
-         interrupts = <27>;
-         #dma-cells = <1>;
-         dma-channels = <4>;
-         snps,dma-masters = <2>;
-         snps,data-width = <3>;
-         snps,block-size = <4096 4096 4096 4096>;
-         snps,priority = <0 1 2 3>;
-         snps,axi-max-burst-len = <16>;
-     };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    /* example with snps,dw-axi-dmac */
+    dma-controller@80000 {
+        compatible = "snps,axi-dma-1.01a";
+        reg = <0x80000 0x400>;
+        clocks = <&core_clk>, <&cfgr_clk>;
+        clock-names = "core-clk", "cfgr-clk";
+        interrupt-parent = <&intc>;
+        interrupts = <27>;
+        #dma-cells = <1>;
+        dma-channels = <4>;
+        snps,dma-masters = <2>;
+        snps,data-width = <3>;
+        snps,block-size = <4096 4096 4096 4096>;
+        snps,priority = <0 1 2 3>;
+        snps,axi-max-burst-len = <16>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
index 664ee61a00d8..64845347f44d 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -147,13 +147,13 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mfd/dbx500-prcmu.h>
-    dma-controller@801C0000 {
-      compatible = "stericsson,db8500-dma40", "stericsson,dma40";
-      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
-      reg-names = "base", "lcpa";
-      interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-      #dma-cells = <3>;
-      memcpy-channels = <56 57 58 59 60>;
-      clocks = <&prcmu_clk PRCMU_DMACLK>;
+    dma-controller@801c0000 {
+        compatible = "stericsson,db8500-dma40", "stericsson,dma40";
+        reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
+        reg-names = "base", "lcpa";
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        #dma-cells = <3>;
+        memcpy-channels = <56 57 58 59 60>;
+        clocks = <&prcmu_clk PRCMU_DMACLK>;
     };
 ...
-- 
2.34.1


