Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E323CD4853
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSdigwnv6RgG85RLkxEQM6OYgPlcYxXywtYyeU3tLN4=; b=uononyL6DtKjM5XLgfPUfcn73q
	FqWeCifJHCjP2xJjNkQpoG7ZDSwZuIGxIkaUw5pW5lXE+TlwQsFXrAHtAa2Q9lURGOI/u4+UlhWL6
	p7RqOaLVU3isa2rN1c9AHIESpkGaa1jimoBLMQ8tptyY3jJfN6tAl8/drOqcHAWGIJse22PHLZJ21
	6ZkWgpmRfgXuRcpD0NpMODi+ZgiH21QsxDYZ+oWTJQGlmNiB3iaH/7VDrahyBHZDY1Dm+rOuQvfen
	2fwKRpzm3CObiBwIv3T1t+gf2jbCqZ9i3Dl/UmkE0IArp+FvEkTjo/KaW3Qf5T82ac4DY7EtwEvz4
	7U7desjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9p-00EomL-0g;
	Mon, 25 Sep 2023 18:18:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9V-00EoYZ-1l
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3231df68584so3227365f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665867; x=1696270667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSdigwnv6RgG85RLkxEQM6OYgPlcYxXywtYyeU3tLN4=;
        b=G4WZsoyKDp/NycO/ZoUHRywi+INkYPg7t9bivlbqfj0jCwJutqE+uilmeqheryxkxb
         2ngK5yQ1Ue6X1Sds0ILMJsB2sspfc7YSUBuBFRYWEMl438Fdz3xXS4i4kMjQh5tWisns
         ArEuoU2FAuCIYapDWEbv9pBsBPs6RKIiIjFIxTcWtTp1zexNh/frbPKJTa6SK7QG79Ww
         foSaMUluQN6Og2hldx236mcK349g/TFLoRH5nMn726ETL+cF3PM4YDF2GqYzSCI+B9Q1
         Eh6vYpM3+w1W/qA/tGt9mbxTk2ZWJc+W69DuZvvUsNfbntxy3t67bHlAgn6XnXBnt3Ey
         DmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665867; x=1696270667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSdigwnv6RgG85RLkxEQM6OYgPlcYxXywtYyeU3tLN4=;
        b=o1sKPvGmbSwWWhQc+FaNGXRsJGO4DBsWfEuIQGrHKsz6WQF8knJci658JNvD+ulY81
         LV41ogqnr/E43r4GBISHIm+i5Md7ZXB72Fp1g/rzXYbnUQenVQQyZxKJTjR31UY92LxF
         oEaovHJtfuosQuomDToZcNQr+gU10QQ3hphE9Nwyf3Z8YGWn5DOPboyDjxNsIpCzFHuQ
         Sxb4mAcM9K0ZAYDmZQNyg17fVAFcQIB5tDI6HkmzMOVCANcSCMAbBApuNOqXUSm7+qws
         FOfV5xpnHgSw5Fq9JaUN9wB6StochfzJpWfUs4ta87MjfBcn4x4E4Am3siNoRAgQGAaU
         gMtQ==
X-Gm-Message-State: AOJu0YxSiTRjThKjo5LB8xTjmjJaTJ+o02AG8gh+ii9kvhte+VPtMQ8l
	lNunK+4AoV6VzhlWSQ2BT4VIIw==
X-Google-Smtp-Source: AGHT+IHYBE2IuQNCq1Gt/vn7Wz846Rak3F4Vhdj8pjePlol8AQ8j+B+6CylLiG+V70368axjPWWF2g==
X-Received: by 2002:a5d:6084:0:b0:320:7fa:c71e with SMTP id w4-20020a5d6084000000b0032007fac71emr7331834wrt.15.1695665867378;
        Mon, 25 Sep 2023 11:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 25 Sep 2023 20:17:37 +0200
Subject: [PATCH v6 3/7] arm64: dts: mediatek: add apu support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v6-3-24453c8625b3@baylibre.com>
References: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
In-Reply-To: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=CPSRatML/h/herC8Ies/GAwzWIDM+NFutvJF7JB3RkQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7F95BVIXjRxwsMjDXaJ93Z9uiEPOMTZe4Dv8av
 uxZJVnWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURRh9D/
 4l2SKbqEelg7PLcaIrgtjVSeftxwmzStEOiWfil8pu5QyA8ZcyePOpBRkI039ECNClYWt4CuTUFVYd
 m+SJf+1Yy43dxPOtWgTqL52++b5ZZW3fYRCNqUKNlMaeFlK1XQqWme9Hciopf+RHXTLU6/21aW2Yzf
 A/sFVGtT6CXRmfr6M1UzlcILF8xsseJUn0tK8mfM1+zfn04fkVLGx3F/fMJWKbMXteEG4pch1wZY0F
 /9ZYfgs7PB70sbZ7s09yiSP1eiBJC7VLAJtWCdi6b4Lbfq2t6O4ZtZsxmP2v0Qh+UYbjIVVmZ+2Uip
 zybgELeq/bSX0FPIeOOjCJzCSyFBXkulrL56ozabF6NFnUXFTLM3N2VIN55VeUucvn7BV73GvpnYaU
 4d4FHLwB92g4+OgwqhhsTIAmNHBDrYsxkO4+qDTBkh3my9ZS9MypgNxfWX9iLKMzIcc7SltQ3nyLnH
 Ojq8KdoqHRrCU+fcgMb4rnfQLEojHERf4n5AOctZSxBu6rEZ9wq4cwVYQEI2PFWvp+i8zxXhNhYs7j
 gEvqT9+tBWux1BJIuttIKPKY9j+xPjWWhKeHGj7c4UXUrxSwZ8uwahk/L1hAa1Mu9NJg/t5QPPOWXW
 tWUnwyIthZWdUE4pl9QsIsmKfWlfzhZg6r4/WQGCjNaQLcWL48W1y+3NToiA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111749_591272_7EDB23E3 
X-CRM114-Status: GOOD (  10.02  )
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

AI Processor Unit System (APUSYS) is a highly efficient computing unit
system which is most suitable for AI/CV algorithms. It includes one
programmable AI processor (Cadence VP6) for both AI and CV algorithms,
and an eDMA engine for data movement between external DRAM and VP6
internal memory.

For more detail, ask Mediatek for the MT8365 IoT application processor
functional specification.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index f9cddce5bd9d..c3ad7cbc89ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -615,6 +615,12 @@ camsys: syscon@15000000 {
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		apu: syscon@19020000 {
+			compatible = "mediatek,mt8365-apu", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


