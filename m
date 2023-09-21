Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A633EE71080
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qqq71BmglqPdWoPEtToCLWEFpVEun8ESIoG7WuZgwYc=; b=JONRW/c3dMfVX9MgMSDEhdBv2g
	hpmYnYMD1X7otM0VQ5++4lhJ4yq+t9puqKhTy2avFD8g0q4sTzRNDZuFaD9exWXIygSPeVJNWGywi
	CV+usQThqEXzGX817pCD8d4MapDa2oCeNYQHayv8l74MZpu091Bss18Q0Z98b254Feuj27RXrmP/q
	dPwa5HjTez1G7g2qUbb1vhhCn2bECv+HnmHr87yNXuBEJ5Gu6WrT22skdPfQp7eaxPilfyqnAifS4
	6eYYrk96EXxbfBq8z5KiztfZr/v/Q06YxX9zT6lIkJhiXKslZXNGjBG0E5TDOQF+R5Eq4XY32eCGl
	BMEgfK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKkE-006IA8-1z;
	Thu, 21 Sep 2023 14:33:30 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjj-006HtZ-2m
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:33:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c136ee106so128494266b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306776; x=1695911576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqq71BmglqPdWoPEtToCLWEFpVEun8ESIoG7WuZgwYc=;
        b=tHAnIy1ek2MP9h9TqyGFsrvtVNCNz/PIxYgoF+xL3Gp0ssBPA38uRnR5Ru9EDZU4R6
         KloaPkY1Tr9CprB63FiACEfD2kA9RpjLuK7cAMXfqp7VktbyGPkrm6JuZYoN2PuE8L2A
         HLxKQ784gLb8kElusGe/0y9zEKbkkDx/0sTmmZIfN5wlKMeq1QLN7qyzxAoHnbik4BMk
         oGVp44kmX1hMGfU0ZgEcew9v8cqn1DO/pTRDwcLt13HsCJ1hjjsdjvgGBzEz6rqsf12G
         zZeY3pxJL3az6b3FGSB6zeTcQY0xAuPmPSXW+MVXhZh47yIGznrvwa4X09gzuRqLsZxj
         Y08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306776; x=1695911576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qqq71BmglqPdWoPEtToCLWEFpVEun8ESIoG7WuZgwYc=;
        b=dAVU85VneQ3TBpHhk6LpJr0/KthWul73yvBpJJWOZu/9aR4w/i0syB7+h6oClgKJ1A
         +gEPBIuxOg+TyiLnPlqG24lVhy6alazjdgnMNTynU8HwrHsxUOMf+GGW1wFdeeJB2jnH
         join/jErNwi//oORmko6TSfB/kpchSBMDstFxCU8YKmcIRQpaRtae3rNi4L/D/a+TJ3f
         zGsVjX1VWfnU8fPPA4F6LJKne+UD9LEANpLNEGlq806Q7cUTcMJM666Y7ORDLxwRcVGN
         DHVb21NS5RbXejvgwWEZesl5DHH9v603/PURy1BcD9hJC05atbyrpk5xbG8/Cywx9Z12
         aN0Q==
X-Gm-Message-State: AOJu0Yz9Bn9PN4bdF2icH6szUSpaaptCA93MsTKJymK0lzx2LHn2VkFo
	xhuvsnwAGkcUHCkzwIEKmtixCg==
X-Google-Smtp-Source: AGHT+IFR1kbbxTRWEH9mw/Vp5hxxeIOn40wseoaICuj9UqBtVI3f3zQkL5poxy1AfUdKYxKM6xtXUg==
X-Received: by 2002:a17:906:314b:b0:994:555a:e49f with SMTP id e11-20020a170906314b00b00994555ae49fmr5565998eje.31.1695306776297;
        Thu, 21 Sep 2023 07:32:56 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:55 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 21 Sep 2023 16:32:44 +0200
Subject: [PATCH v5 5/7] arm64: dts: mediatek: add smi support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v5-5-fa6f03680832@baylibre.com>
References: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
In-Reply-To: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=lJi09wmfuA1CnXJrdr2+qCC0CVBcfrZwevdWJeNOAo0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQPeEVAosQevQAqB7DoM0uAAPVMlpfJ/ukAvN/9
 bwraReqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURaBED/
 9eQyPJqcaKtboU6kfg6hZoH67UPapjGCGlzPX+xN+cp/AidAM2WYleo1XPoIXxOcKmAeuXc3t+Riqk
 Jf9KAYa+FVlFWxo6o4et8YVILM2za8IBVlX/YvMFxDQqd3n13pdxaNf2Y+m8misSokZV6QZaNso/J+
 j8JVdwu/MpisGqVHHTyNa0xcUkm4cXj7Q0vxwX5KnONMvD976B3zZ3nNjCWxsMMpeCG6qMsXILJr53
 BXbZjkP3LvdzxVDTdmeAelVFG9vzFCDR2PIYKqUcZoyUyiAJ55CA79a1QcECE9voFPZQhT1yTMb4xg
 AxvT/C1KQH0JLIlN1+N/5RuNQYyeSCGulEdhdMsCGvk0UJlCtb7GUF1rO/LVujU8X493BHp95rqAS1
 bJXtF0AeSfp1sldVPNb+8BTNMNYhX9xXtqUehSBBHHULhV9dIvJR+Kv3SaF7cPpqVf0+8T+8NjfSd1
 Nb7pBdlZxMenbZlec/2EzaPvyGzHeeg5S4XIh0KIccn70OnaSK4hLrkW9jG5rATgyH6eo7LT8gdYOz
 Oe5kmSkiIBKyG0REtL1u3wZID1KitQFJeStZLw8Dy0H/+gN94gM2/qi1c2gCh5Mw+/hOo5HqC5M4TG
 Gp9/t+mnQ+hzYN/7IM2nTEKP1mea5sjxYsga5c8EeNn0nHddqwE33d/vL7fQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_073259_895277_7E84E73B 
X-CRM114-Status: UNSURE (   9.94  )
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

Smart Multimedia Interface (SMI) local arbiter does the arbitration for
memory requests from multi-media engines. Add SMI in the MT8365 DTS will
allow to add local ARBiter (LARB), use by IOMMU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index c2f88d153dee..a03b8c0da68b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -340,16 +340,19 @@ power-domain@MT8365_POWER_DOMAIN_CAM {
 							      "cam-4", "cam-5";
 						#power-domain-cells = <0>;
 						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
 					};
 
 					power-domain@MT8365_POWER_DOMAIN_VDEC {
 						reg = <MT8365_POWER_DOMAIN_VDEC>;
 						#power-domain-cells = <0>;
+						mediatek,smi = <&smi_common>;
 					};
 
 					power-domain@MT8365_POWER_DOMAIN_VENC {
 						reg = <MT8365_POWER_DOMAIN_VENC>;
 						#power-domain-cells = <0>;
+						mediatek,smi = <&smi_common>;
 					};
 
 					power-domain@MT8365_POWER_DOMAIN_APU {
@@ -367,6 +370,7 @@ power-domain@MT8365_POWER_DOMAIN_APU {
 							      "apu-5";
 						#power-domain-cells = <0>;
 						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
 					};
 				};
 
@@ -720,6 +724,17 @@ mmsys: syscon@14000000 {
 			#clock-cells = <1>;
 		};
 
+		smi_common: smi@14002000 {
+			compatible = "mediatek,mt8365-smi-common";
+			reg = <0 0x14002000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_MM_SMI_COMM0>,
+				 <&mmsys CLK_MM_MM_SMI_COMM1>;
+			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
 		camsys: syscon@15000000 {
 			compatible = "mediatek,mt8365-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;

-- 
2.25.1


