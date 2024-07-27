Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA0FC3DA61
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jul 2024 11:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKCRLjbQA6RvyM/1xlZDuHSO8eeRysapt2U7o6q2WV8=; b=uLvEDzBqzLc4jozZ/tlsNfG0Qm
	Dg5IrrVG/XHhPFM+5ZsTZWl2Uk7n2+sAtU0a6IaWE+NZ1aHdbEgSCeiZKUC12Zo7dmhWhpjIqqFh/
	TMUVJI/kjKQPNQo04fyotL6VGB/kHAXSgUJ0kMgAbE9+kX/csxifb+NW6YlU7PMbaT6vosvEWHi6G
	/YzqI1ViQiSRsMayupEIHJ3fHaR5DVakWeeNKtGfOx4+eboJR7XtXsUCsnsYFodeeQZeTeFxM7jFb
	nm7G8F5pOXm3rJF4D+W8KXWpYmphnftpGmsSNYnx2KXkWueIqBV0LwKbQwyoIuRyJWc60+tXrcsi7
	Pq1Ge5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXfvY-00000006dUc-0h2m;
	Sat, 27 Jul 2024 11:49:32 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXfun-00000006dO0-08AS;
	Sat, 27 Jul 2024 11:48:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52efd8807aaso3214437e87.3;
        Sat, 27 Jul 2024 04:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722080923; x=1722685723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKCRLjbQA6RvyM/1xlZDuHSO8eeRysapt2U7o6q2WV8=;
        b=ODI15UO1LJOyrYad4ylNTzUdSpwkz0GHUwvfdJx+hxfdvaQhEpwijrR3LgeUyUOuW1
         i9zZWXdljO41bolI1qe1hkDIVlaY4KUMVhTgFVveWofvmEIYvo8za0XX2XUb0jHAdiW4
         38fYvKTQTNBNG35rKE6p5kgHUAgbkeLEV/xA3wrSq/OM+3BEbNfsHk2uOb1iE9TozSdD
         Bjcu6TVBa8v7BhE4A9NfH///mERciWXLERuiqkvjZTFTb2xmjgn0CoCAATyLl7BHqpDp
         flz5s2STmE9HWiQ0bsB1/rgLwI8TfEeT93aORcmhDqejCFfO3/Koi83cqAwAOTnHFbb0
         wfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722080923; x=1722685723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKCRLjbQA6RvyM/1xlZDuHSO8eeRysapt2U7o6q2WV8=;
        b=gMyp34ZUt70LOTekRnp77+SdzdOi81wPx3O/BXLxZ5L4AtIcaeWFabs9jW0eTIhQAZ
         MnPO0bbIvGuy8aDfWMlHfhP+XgRRqLMFfs7HNmBjgiuGhV7Ejaqd+N/bHJ4zJUdPOU6R
         kHBMDw+lsXjDyb3qkJ830IiU8n7wy+Nfajqzs9aCBmF27/IJPogzG+o+SAH6tMJVbdvI
         QDYR2EBZwnOZO8dSeeim5iWY5crWi0HuieByuwneYbNj7AkyWThXmLjrtrW96GRzmrcO
         r4kvpVO4N/pTyQZgCjGijlXdaP4IS8WKE8xiEBkujCcMOoTP9C58dquErD6CcYkFtSzq
         ikmA==
X-Forwarded-Encrypted: i=1; AJvYcCXbs4QULWzWBwi/UWVVGQ+GmAIrmTlEJvD4QfRMgOc6rtedODdas40H0ZtI1e+9O8ZvBXzw+zrEWCoVZpOW8wvLnVXTjK6XPcqg/6sGCDxm8xbWbtPTI6G2zzz/LytG7T/B2yZTTh0wN0OrXwPfWlFse7Uh0Toqn+s=
X-Gm-Message-State: AOJu0YzB3ldIRZ8Eao+TBmWNfQGJ+tVP0hN95uiTHZ5zQhMzIA9MVD1v
	HJyYdu1hoW+LFQ9zQkn4w+LpNtpf/VeoSSD+OxaudQlxSKpGsk9J
X-Google-Smtp-Source: AGHT+IHztZvH8zOyLXhWrkFxbk6bDQdmH6x989Bk067SMCu0neN94/uYnvBqs0sXqUfogLOjVpDGZw==
X-Received: by 2002:ac2:54a1:0:b0:52f:eb:aaca with SMTP id 2adb3069b0e04-5309b299206mr1338536e87.32.1722080922910;
        Sat, 27 Jul 2024 04:48:42 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad9316csm272646166b.186.2024.07.27.04.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 04:48:42 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	John Crispin <john@phrozen.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7981: add SPI controllers
Date: Sat, 27 Jul 2024 13:48:28 +0200
Message-Id: <20240727114828.29558-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240727114828.29558-1-zajec5@gmail.com>
References: <20240727114828.29558-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_044845_104091_D7FDB1A1 
X-CRM114-Status: GOOD (  10.14  )
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

MT7981 (Filogic 820) has three on-SoC SPI controllers.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 42 +++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 64aeeb24efac..b096009ef99c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -109,6 +109,48 @@ i2c@11007000 {
 			status = "disabled";
 		};
 
+		spi@11009000 {
+			compatible = "mediatek,mt7981-spi-ipm", "mediatek,spi-ipm";
+			reg = <0 0x11009000 0 0x1000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_CB_M_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI2_CK>,
+				 <&infracfg CLK_INFRA_SPI2_HCK_CK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi@1100a000 {
+			compatible = "mediatek,mt7981-spi-ipm", "mediatek,spi-ipm";
+			reg = <0 0x1100a000 0 0x1000>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_CB_M_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI0_CK>,
+				 <&infracfg CLK_INFRA_SPI0_HCK_CK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi@1100b000 {
+			compatible = "mediatek,mt7981-spi-ipm", "mediatek,spi-ipm";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_CB_M_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI1_CK>,
+				 <&infracfg CLK_INFRA_SPI1_HCK_CK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@11d00000 {
 			compatible = "mediatek,mt7981-pinctrl";
 			reg = <0 0x11d00000 0 0x1000>,
-- 
2.35.3


