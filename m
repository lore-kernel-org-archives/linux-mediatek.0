Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB3ACF855E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftwFn9ZLUuKCLPPu13/3mAe7bDdVNGDECC9c6Eq3ZPM=; b=rGRSXPyEJnOcqP
	7B6mIkq3bQrl2bG6YSt3WHeYLb3SSGtZoLSPzpnaEHEERMJx6FyHxUCayQHy5y+5gKJKWahFShKQN
	lNxBtvQsjoPwT0nm6ttt9HYYqXGQK13VsYY0GqC9de/LSeXlXqZcXrYy/7VOzdoxsgnMK8VFDHZlH
	DE3AOrMJcUBNTYIQK5xQMki+8gI9EyLnTckvs1BkUZz8xhTdrSxCnPHQw/CltG1WdB1SycKca8y+u
	2iw4d0gIHKlTQ9uL5BwuhgTnXwUESkYjSE0kOsJUtDPImy9VAQ/D1X18jkaUzd88W6G25uTQH2QgD
	AchPupz/zNxek9PfEtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swG2f-00000008N0r-0csz;
	Thu, 03 Oct 2024 07:14:29 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqk-00000008Kb3-2xcz
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:02:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71b8d10e990so415078b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938930; x=1728543730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftwFn9ZLUuKCLPPu13/3mAe7bDdVNGDECC9c6Eq3ZPM=;
        b=AROteUDAySe2zlVgtdnIxfGHV5TBe0Thag983Fb9jA6ZvsXvVdnCIbEy3//FrDP03D
         aWzKm+hgtKu3O+lh86WaTZZ+zD+9CuCQ2rph8g5498lr7g1g6j1KLWbXQCRDkWkCafPU
         h9h/J1cv0/+GTw1eez7NSbzuBmaWlXbGfLqBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938930; x=1728543730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftwFn9ZLUuKCLPPu13/3mAe7bDdVNGDECC9c6Eq3ZPM=;
        b=FshnYBgLJ+9sg+05FSoix9S8l41w/kt5miIzF/xKuCEQ5ypSxFjegyQtq3jKsUjvkj
         NuNTydQo3fIuI3AVCEn/agCwnB/pXPkXR72+e8feRbFs7VcLg5RAD2Pn/mpFfmhXTqPI
         ubcdf/2XqRFK7VH1bbMv9926FdZBCa1UgYHpcDCiiwzasM7fWMyf7E4vKS4v/Q1IcrVr
         Gidt5na8cZQnhD/L74StVHdiKLt3FcW3YJb7ktN7OGRECia11xTZR1vXJLfj2YFG5dit
         rmjsed1Eet9kwCOd+blUbpkhT0hSls6pLgDVLQQllyktX9wj6WkXDjRkqb8qUjC7plMF
         oXwg==
X-Forwarded-Encrypted: i=1; AJvYcCVcGOTnPBWy2C5Ej/NFCTpqWjUNcJjDJEEK+RG8VwFg4TL8NE83gM4KJNTpXGuMWI9rEpYzKq4cRkbscdP0CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfTJ9UtwYDtzWWbkxqgclz/0KozwyN6RdQPzjKE8+/OUaRuvnc
	uIe/c8CM/hM52rltCNr7pV0CMbfHPSeA+g8+rnUfXdfQiAWbxzUHJPWCIhMqAA==
X-Google-Smtp-Source: AGHT+IHE/CCPGFNgWjWh9e6CyqMHQZblij2trHaQLpVyyZLVEj0BO/xQcou38wPPpQh6mNnsYlGS5A==
X-Received: by 2002:a05:6a00:1829:b0:714:1a7c:b727 with SMTP id d2e1a72fcca58-71dc5c772bbmr9315186b3a.8.1727938930039;
        Thu, 03 Oct 2024 00:02:10 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:02:09 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 9/9] arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
Date: Thu,  3 Oct 2024 15:00:03 +0800
Message-ID: <20241003070139.1461472-10-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241003070139.1461472-1-fshao@chromium.org>
References: <20241003070139.1461472-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000210_772864_3BE0B270 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add edp-tx and dp-tx nodes for the Embedded DisplayPort (eDP) and
DisplayPort ports to connect to DP-INTF ports and panels, and add the
efuse cell for the DP calibration data.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index e77bd2b76128..92e71977c775 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2006,6 +2006,10 @@ efuse: efuse@11f20000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			dp_calib_data: dp-calib@1a0 {
+				reg = <0x1a0 0xc>;
+			};
+
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
@@ -2852,5 +2856,27 @@ padding7: padding@1c124000 {
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x4000 0x1000>;
 		};
+
+		edp_tx: edp-tx@1c500000 {
+			compatible = "mediatek,mt8188-edp-tx";
+			reg = <0 0x1c500000 0 0x8000>;
+			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_EDP_TX>;
+			max-linkrate-mhz = <8100>;
+			status = "disabled";
+		};
+
+		dp_tx: dp-tx@1c600000 {
+			compatible = "mediatek,mt8188-dp-tx";
+			reg = <0 0x1c600000 0 0x8000>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_DP_TX>;
+			max-linkrate-mhz = <5400>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.46.1.824.gd892dcdcdd-goog


