Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F4FC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 17:30:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7505613B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 17:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7505613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gh99qUDpvzKJmsi8vSWbZqx1QDTJxYdGO3DWcRH4Bf8=; b=ndGxZ4/pj7jnf5UfTRAzfLIavp
	mBiRXnRXxH0TimeShygzXwVyTQiwU5D2IUdbeuvqKOeyAqY9gJLwzuRiqBVqPSczhzGsqvYXzq+7i
	5Q+jjFkqhd92cragbXgNgxBXQiyjkQEKaq0cJxtWhUGPchc9rMslmwgaWzA5l/h6sM/PY3fMHyBRf
	OmwwT89CQdg+8SXCmKuI1T0UekZn2OL4zLZRdgdKuDenXfzwGaVaZb6gAkY98lsEG2vXCGGdUrTu0
	iaj5z2lm+v5l9pprDmZ9qdxzHpYpXTxOzXza47lfYnrJdP7v+78dk3M7KK97m1upJRujxspg841ls
	n1nSMkIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTT3G-000GA7-Re; Mon, 05 Apr 2021 17:30:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTT3C-000G96-Ot
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 17:30:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so7569494wma.0
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KtPIiHPfOqnzwnxwCorCCqGP8b4aS/KPLx0LhcOzbDk=;
 b=CEHT7kyoNucSMYVF+Tm63gNFX+ECthdy242sgJJH1EUKmoxoBzn8jWRQo1e0mdNJq/
 yTqwidOWMTPnxMAUzHUpBp5X6WhoiXZlSwxktIf1qQgkHpHg8opJsMa6Fc3xuO1JktHK
 YZzyOibiE868TykALkQGMK97g9UQ4AFupyHZupdd/avIaUEHMHnrILCx6YsovNWxV5CP
 VNKWWm022YrSzO1uzVrrbMtXo32b+LUnNTgOt2ysN+/2BxTrRKhnVsB0CMAlXDddlAXJ
 0B+bI5uRRL09dPgzQWsxsxPbah8xrUzvlAPoJyjmeOryha8DNPJP/uM82ggESOTu76R/
 GS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KtPIiHPfOqnzwnxwCorCCqGP8b4aS/KPLx0LhcOzbDk=;
 b=TTYdE1rS8PO79/nAs/1NoH8dUV86x0hTpMenhO2ADeODGa3Q3rbpvajIc1sp617H6s
 xbWbTFUIWGoJdTAtRWlj9CkorBKA8//xNjrj+89C8vNQMTfAYMyREAukoO8b6H4hqp4N
 fFvo7EWVda3aO5gvFEAKnDlYfLTOf2jKhThkrfcnUY0ySWQG7MEHgwGsjyhou2K8NjQA
 WAey/1c8rxeHs10zoUawFsLgoZQ6gJvvffwrZN6QLN6/Jq43HZ86u8jFnjeVYUeNFUNV
 bZY4Vi4oU/ayJyZgyDClCi7JCGUgI6j3Cr0Zjx3ZLV07jWKnVCGSNBrGAsbvCcukCmKr
 YR+Q==
X-Gm-Message-State: AOAM531CLJx/KejM3u7Sy8//DgqG+1oJomFQh3p73HNwWLhwqTPhH8bd
 9SXIpoQ8zoQczApbxmd8VXA0Nw==
X-Google-Smtp-Source: ABdhPJxbVGjcsfXPFYQNi8ot6IoFkpqWTXWV8DfubPZJDVL9awlPz5ZK5P6T+ddDYSUIFjURm1u81w==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr215318wmk.24.1617643809661; 
 Mon, 05 Apr 2021 10:30:09 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id x11sm211900wmi.3.2021.04.05.10.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:30:09 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8167: add power domains
Date: Mon,  5 Apr 2021 19:28:36 +0200
Message-Id: <20210405172836.2038526-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_183010_891569_AC302A4E 
X-CRM114-Status: GOOD (  10.43  )
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

Add support for the MT8167 power domains.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 1c5639ead622..156fbdad01fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
+#include <dt-bindings/power/mt8167-power.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -34,6 +35,73 @@ apmixedsys: apmixedsys@10018000 {
 			#clock-cells = <1>;
 		};
 
+		scpsys: syscon@10006000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+
+			spm: power-controller {
+				compatible = "mediatek,mt8167-power-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				/* power domains of the SoC */
+				power-domain@MT8167_POWER_DOMAIN_MM {
+					reg = <MT8167_POWER_DOMAIN_MM>;
+					clocks = <&topckgen CLK_TOP_SMI_MM>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT8167_POWER_DOMAIN_VDEC {
+					reg = <MT8167_POWER_DOMAIN_VDEC>;
+					clocks = <&topckgen CLK_TOP_SMI_MM>,
+						 <&topckgen CLK_TOP_RG_VDEC>;
+					clock-names = "mm", "vdec";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8167_POWER_DOMAIN_ISP {
+					reg = <MT8167_POWER_DOMAIN_ISP>;
+					clocks = <&topckgen CLK_TOP_SMI_MM>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8167_POWER_DOMAIN_MFG_ASYNC {
+					reg = <MT8167_POWER_DOMAIN_MFG_ASYNC>;
+					clocks = <&topckgen CLK_TOP_RG_AXI_MFG>,
+						 <&topckgen CLK_TOP_RG_SLOW_MFG>;
+					clock-names = "axi_mfg", "mfg";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+					mediatek,infracfg = <&infracfg>;
+
+					power-domain@MT8167_POWER_DOMAIN_MFG_2D {
+						reg = <MT8167_POWER_DOMAIN_MFG_2D>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT8167_POWER_DOMAIN_MFG {
+							reg = <MT8167_POWER_DOMAIN_MFG>;
+							#power-domain-cells = <0>;
+							mediatek,infracfg = <&infracfg>;
+						};
+					};
+				};
+
+				power-domain@MT8167_POWER_DOMAIN_CONN {
+					reg = <MT8167_POWER_DOMAIN_CONN>;
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+			};
+		};
+
 		imgsys: syscon@15000000 {
 			compatible = "mediatek,mt8167-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
