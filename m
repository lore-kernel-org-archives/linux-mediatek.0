Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5B8CD1297
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTWafwAOSteWZK+IF8K+ySu+NLy3Zj+VooWrs6puuRE=; b=EVDxe2PRC7LfjGCBUhEcB7/GU/
	kXCqR+Q089a1sb4VsIdpO8K4tNl4r4lETIBwNEJUrVNQMA+gm2EBhyX+8IEFQM+6uyFhkbo2gfUmR
	13GftvKf9Nvuiy9/IEGi10xgaG0NI4gBSb+iRAKhFqmLuvuCRmxNf2eD9OEscZW5upwXedg6DMyAE
	/o+MYWNcMiEEexcZz58rcEN0mT7y8vjBdI81Z849BLJDCp5NJwqDM7FEqIRUK2Ib1S31HBhpffi4x
	WIolTtPVDq4D6MCCTk2U3ROeKLn8X4FYfgKukmqMtqC7Ja3Ed3JBZeXXM3NcfjSOhx/gmkdO0uN7D
	XvufCb7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucUF-00000008Rbh-0jTR;
	Wed, 10 Apr 2024 18:15:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucU2-00000008RQC-1LDo
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 18:15:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-416920b1a2aso19638185e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772940; x=1713377740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTWafwAOSteWZK+IF8K+ySu+NLy3Zj+VooWrs6puuRE=;
        b=tnQGWJjfhSxuAr9QoV0lpWlGbATRmF+QXLHFoJ1iWYvsDvBgLMKBTgFLtZx/uu+t8a
         oOKABW/rTyPL9GgiDw4FiFnFh2NYOrB3aX4EP1WrJi3NvchNFOWlCvJC2H7n2S4brmdM
         QhAsbCQYUZV8x0RRiMaKNjvN91PLPa670cSkgj3ZsnwCjyizm0Yh7yGixqIL2vZ2jiEP
         z7IWqIaz2+UvCwj/0omvjuny7bGeSha3P5UKTc/UiOlJPEu9c9xIMBhkaxLk567sk3Br
         sz3HiNeQGm4rhzDmp1MprRY0nhB9CAfgTYzd4DF8Y5ADhJCFhNu0r0SQhpN9jjfJqzP0
         XTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772940; x=1713377740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTWafwAOSteWZK+IF8K+ySu+NLy3Zj+VooWrs6puuRE=;
        b=CnYVHwP/Zpma/vbkfeQbp7b6Yq/u86x9J3M8y1FIMRnnKrEzpv0KhzKeGM+PNgfxz2
         bdQbVk6XqRqlgqXiRu5xph2x030GyMz622UJC08ECkSWwfbvorqWG5tQZoU/JJ61VA2+
         JREatsCSq1N1kR9gq3R6mmKJsYNhoIS/30drW6u6cJJWym7kJ5m8ZLJxP9BEQZ8IQjtq
         LUu+gRHacJMZUQhOww3/djVPi+lpxFTt8UgkKqqm5wl9mELaZcAFSbIUmUtR7wY//gxZ
         mhKS2CcnnaAR2sIHyrqnRgvk9onR1Kr5sZwUVQLH+bp03QdnqSQcgaTSIapu2EBv1dRJ
         /vAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4XBvqHL6fTOouJcYqrF+ry1aqOAKQwWRcuxnS1npMMBslwqrALpbJ3sXFYt4rQHIRiA7WN/VJkdxBHWHJtGCzNwDqyzMyEVZGQG3faAm+UqSB
X-Gm-Message-State: AOJu0YxuJk6yooI5q2Pe194RtlQui3qzv/eLkZqLcJ5N53xvs3T8W4Q8
	8UfcYMBF/NuP/s4I/Q1h+Hhj+1ldDRb6B8bpgFbaRQgX5CUDIQvOxHOmFeBltVY=
X-Google-Smtp-Source: AGHT+IF48RGmHk8pl2ow/KjC14k8yrkxBwd5xymh3LOhP56MyaRgm1/Xm1jdP8c96wTN/A1i8OYwaw==
X-Received: by 2002:a05:600c:3b98:b0:416:2629:bbaf with SMTP id n24-20020a05600c3b9800b004162629bbafmr2751097wms.29.1712772940126;
        Wed, 10 Apr 2024 11:15:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c3acd00b004161bffa48csm3026487wms.40.2024.04.10.11.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 11:15:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/4] dt-bindings: PCI: mediatek,mt7621-pcie: switch from deprecated pci-bus.yaml
Date: Wed, 10 Apr 2024 20:15:21 +0200
Message-Id: <20240410181521.269431-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410181521.269431-1-krzysztof.kozlowski@linaro.org>
References: <20240410181521.269431-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_111542_588111_448A4283 
X-CRM114-Status: GOOD (  13.15  )
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

dtschema package with core schemas deprecated pci-bus.yaml schema in
favor of individual schemas per host, device and pci-pci.

Switch Mediatek MT7621 PCIe host bridge binding to this new schema.

This requires dtschema package newer than v2024.02 to work fully.
v2024.02 will partially work: with a warning.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Important: v2024.03 (said dtschema newer than v2024.02) was not yet
released, therefore this patch probably should wait a bit. Previous
patches do not depend anyhow on future release, so they can be taken as
is.

Changes in v2:
1. New patch
2. Split mediatek,mt7621-pcie to separate patch as it uses
   pci-pci-bridge schema.
---
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index 61d027239910..6fba42156db6 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -14,7 +14,7 @@ description: |+
   with 3 Root Ports. Each Root Port supports a Gen1 1-lane Link
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
@@ -33,7 +33,7 @@ properties:
 patternProperties:
   '^pcie@[0-2],0$':
     type: object
-    $ref: /schemas/pci/pci-bus.yaml#
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
 
     properties:
       reg:
-- 
2.34.1


