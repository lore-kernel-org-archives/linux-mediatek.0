Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E5CF31B7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2J6IAMekTb4vqO9a374pLD/X7ddMa658jNggvdKpP9o=; b=BBwlOPCq+rZGVn
	Ry0++PJ9suvUuThSsa1dRoBnwJhBALI1Ft/hV87apSTlAGB6W/MhZuuIqHnAhEJVa03TvKloJpJ+i
	S3hTXB3DED693SLCFlX/OFl9HzaprN4vGty4J4/QDN19xAUsloxOwrvE1dcaYzcQ54FyD4gMbOu0z
	VsxDXXgBtbnFQiGmWZ4yRDtPoVPh7d/eU39OFEevLj/Z/WahjH13CxRdd6bU4Ve1AdGCjZz2WVTMJ
	7jviUQ1AMxgIqDqEnDntQ491Us8ws1RFKWrnrI+9GOKidDxZ46nV/IluOJdrLEWsbpR1n3xhyZ27R
	7j3FQS48RaiSFoidxUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svy0q-00000005kwl-0EGm;
	Wed, 02 Oct 2024 11:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxp5-00000005hzQ-3Ewu
	for linux-mediatek@bombadil.infradead.org;
	Wed, 02 Oct 2024 11:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2J6IAMekTb4vqO9a374pLD/X7ddMa658jNggvdKpP9o=; b=ZzcAZde88/yRa65v1waPBfO7aj
	8MHFgiHTOU1loISilC2+Mr1eYF6sQAisWHenP8fsAfXMf2x1pAXeKdsMyqkDTlU7w3izOSJRczMnE
	l5gVaW/ymknE4LPUVM1HqnUHhuGVWBWsOavldve6NqJWmAqKKuQW8a7FYeVB/6335N2lzwDY5BOSq
	bTWADxxjIM3LS4nZ3wj+/usqCH6ZaOhyi3xOfLqvnyj4xTXED0nw/rxVTMOxQpzArxHazZPqq9MA8
	a5cYYWw0poHG93wOeZ0x5iWxEwGBA1p5UwlS3kg8wBfkzoL3njhhX/bRKfB1EuxLEU4ZWZPkNWbD3
	3JhuDoeA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxp2-00000003TmC-3Evo
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:47:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7198de684a7so4647732b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869630; x=1728474430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J6IAMekTb4vqO9a374pLD/X7ddMa658jNggvdKpP9o=;
        b=LDTtF6D2R38BhIlzyTOLoIPaxiP788ny5vztVRJQHqgjsuBK4PeQo1ErcKIb/nTdWE
         C9rvhvC5VXgJaFrAFTL927DitN/8L02J4fEzf1c9Pdn/G6Onr1YNlbOrRjLFVmJDeCuE
         BNJ9C+orDgUiwE/qhErNkZ+LLhP3C+RiYvy4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869630; x=1728474430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2J6IAMekTb4vqO9a374pLD/X7ddMa658jNggvdKpP9o=;
        b=OAt4yzpMROxAP+CtOfJKROMsk6SJ9iU3Z5C9wLsjZNn+zKANPsl9ck/u0bOQEBYjEA
         laiqrudAmGzaMl+glwzOM3d0vnhxEMvJuHgxLJ9AaV072gOz+WXsapM21en0ZWS/q8oZ
         B3hvafOwghItFKIEMZv8468jd72i4/HrtyIeLLz54sWKL6mL1AwsZg2dvWtKdLm6KpGH
         V81Mcz6TnS/nXkqvRobsK5ARUpNo7vXNQ5yZjd1ukERqq11xl3PukqgdCHWt979mNh4M
         Vcqm/sFUwwcnegY2Hbe9AQOhFggxiN5KaiAKw5Oh2qsREmHKd53CgmtnPCRkkMR9tBd2
         Wizg==
X-Forwarded-Encrypted: i=1; AJvYcCV5gL7mh39/WNPjEon5nAxJD0fqilijhvo2iw2MQj/CcLad5oSZBhYgb8pXABsGxDs15GJ1vCHJkiROt/vYJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8OEqfz08v+MInxCXV4w23Q31Qln4jhYQBcN52AGMhEbav1O4x
	5p6nHOLaNJ6UHkyl4y9EkYFWN4Fqc7Ztj+mcjCdzhFUEdJ51NofU/kQPOCMALw==
X-Google-Smtp-Source: AGHT+IHxoSxlQF4L8vnk+9d+dcrFTwh2sgZBeoesnLzs4EQ03w9gCUtKP/Slm2w+wQYV4T7a2uPNvA==
X-Received: by 2002:a05:6a00:4615:b0:719:1df6:c0fe with SMTP id d2e1a72fcca58-71dc5d5443cmr4531512b3a.21.1727869630106;
        Wed, 02 Oct 2024 04:47:10 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:47:09 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 8/9] arm64: dts: mediatek: mt8188: Add DP-INTF nodes
Date: Wed,  2 Oct 2024 19:41:48 +0800
Message-ID: <20241002114614.847553-9-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_124712_924595_E0731A10 
X-CRM114-Status: UNSURE (   9.76  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the primary and secondary dp-intf nodes.
These DP-INTF hardware IPs are the sink of the vdosys0 and vdosys1
display pipelines for the internal and external displays, respectively.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 5410469e5fd8..943333d2567f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -24,6 +24,8 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dp-intf0 = &dp_intf0;
+		dp-intf1 = &dp_intf1;
 		ethdr0 = &ethdr0;
 		gce0 = &gce0;
 		gce1 = &gce1;
@@ -2448,6 +2450,18 @@ disp_dsi: dsi@1c008000 {
 			status = "disabled";
 		};
 
+		dp_intf0: dp-intf@1c015000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c015000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				 <&vdosys0 CLK_VDO0_DP_INTF0>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			status = "disabled";
+		};
+
 		mutex0: mutex@1c016000 {
 			compatible = "mediatek,mt8188-disp-mutex";
 			reg = <0 0x1c016000 0 0x1000>;
@@ -2713,6 +2727,18 @@ merge4: merge@1c110000 {
 			mediatek,merge-fifo-en;
 		};
 
+		dp_intf1: dp-intf@1c113000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c113000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DPINTF>,
+				 <&vdosys1 CLK_VDO1_DP_INTF0_MMCK>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			status = "disabled";
+		};
+
 		ethdr0: ethdr@1c114000 {
 			compatible = "mediatek,mt8188-disp-ethdr", "mediatek,mt8195-disp-ethdr";
 			reg = <0 0x1c114000 0 0x1000>,
-- 
2.46.1.824.gd892dcdcdd-goog


