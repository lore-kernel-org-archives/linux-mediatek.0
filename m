Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E07CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wIIgCwWsXgtg5bruLAQKszp23oXas8PwjnbukW1ABVE=; b=Qqi5GXtVCBdeID6KA0ujINI3FU
	DMQ2/N3DpCsAR6YTYdcW+SS7kY0UNfURvRB/53RqafnrA1Im/th0sySLu+OjteNXpIVAv0X5x7H3T
	Y0QlRPGaqobfJ/i2Tef7vWxpSFCsNxd3IpGo9a4fTecj01O8sKqHdDHG68bSMuIcDk5Ktr3kJok2M
	zfRyQBs92Ub5qCe4H3DXIREO06aPjWMTel8Z5uKIR8gMlOPzKyEzZUTJbNB/nBqUQjPRguBf2ui9p
	tl+lG9aczlk3wGQVrM1rBUF6wMzhJMHLRseju8pN/8zFxvJuLWnBpy0FBZkfKXdKR7lM7kEYWFNy6
	k24x6PNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucTy-00000008RPS-3Tgv;
	Wed, 10 Apr 2024 18:15:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucTt-00000008RKu-2m7G
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 18:15:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-417d092f39aso178815e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 11:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772930; x=1713377730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIIgCwWsXgtg5bruLAQKszp23oXas8PwjnbukW1ABVE=;
        b=oEUqMfKrXHgSbpKkJpHus2seal+jLUKPI2tFSICscuZ5nFG2UcppZPwgjFFO28Sh0G
         GKN4SvuWUAkizVnzs/TwCumtRY8xj+24OujzGNxiRBPbp5zjAxJW6Mg1BBCZFTYQtcVs
         YkPcda4607ByLv0hBcZnevRs8hR8YZpzAazXJ+8LRwPm+dKtSkrstjqCoh9bBW8fGtSq
         2zX480peLEvvDhq6TDs2ND+XMHlEv5UbEimZDhgUroHeircN4vQXv+MNd8IZEPFlD20e
         nYf+QL8PksGAwPFyD83al4PeZSq83Q3lKoiUmIgbzxrbgaU+8lf283B024ke3RHdnIIa
         te/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772930; x=1713377730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIIgCwWsXgtg5bruLAQKszp23oXas8PwjnbukW1ABVE=;
        b=Can98BsQ7Om/TtY7lJIE2OOslDFfCavBpkICEfqovFbZCiKEosY/S17mph3wx2pNI3
         Ze0gXij9syQuCIEApuuHMNGRDwhWy5QNZe4gTk07ehIqZOPvRTqEnlz/70sKgB4O1PDT
         8w+zgZ5RSAnpVEcOJFGWjwIW6oeUdMB4BqCWPw8OmCujhSB+kLzxszzamZcQYbmcWKN1
         EZI4Ph/Yzhluc3xh/Xjyx5HE4tePYCrlsk1dVPAqOsJANXLeyhrN1Aku/UKrP62lpvVd
         77RDn4icC9T1+NchWGGB/K5+Rrxfuu+qlQLcW03HURIiODVN6SB+QrS4nzy+Z4fGiKQb
         CWjw==
X-Forwarded-Encrypted: i=1; AJvYcCVM+W7N6ZleXXGHLLF6Cw6QY3WWyhDBlRu2jHUUrDLwhAPc1bGj9WmIlztfXWVgY3uIWwZjvv8qlZJmLTdtIOlfB/MAjaaEJqzsfB/8em4Uuj1w
X-Gm-Message-State: AOJu0YyJj7gFurbOL25Y1aq/I/rTbplE0C64krkwgQhqyiJCbaaMMUUP
	2QD59C+58nRnVV5/3EnNahNSvvC5TSRPh2xCkVJeE17oU25oPBzzYaFtSM9eEeI=
X-Google-Smtp-Source: AGHT+IHa3VzJvP4OihmkofwN3t83NfQ7iiOhP0nYKsaImp6PQcjJKVMYMSyyVk8er1agY3VX8l3E6g==
X-Received: by 2002:a05:600c:4e93:b0:415:431d:7747 with SMTP id f19-20020a05600c4e9300b00415431d7747mr358784wmq.7.1712772929771;
        Wed, 10 Apr 2024 11:15:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c3acd00b004161bffa48csm3026487wms.40.2024.04.10.11.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 11:15:29 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
Date: Wed, 10 Apr 2024 20:15:18 +0200
Message-Id: <20240410181521.269431-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_111533_708764_A30B45F0 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

The binding reference common cdns-pcie-host.yaml, which already defines
msi-parent and has a reference to pci-bus.yaml schema.  Drop redundant
pieces here to make it a bit smaller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tags.
---
 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
index bc3c48f60fff..a8190d9b100f 100644
--- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
@@ -10,7 +10,6 @@ maintainers:
   - Tom Joseph <tjoseph@cadence.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
   - $ref: cdns-pcie-host.yaml#
 
 properties:
@@ -25,8 +24,6 @@ properties:
       - const: reg
       - const: cfg
 
-  msi-parent: true
-
 required:
   - reg
   - reg-names
-- 
2.34.1


