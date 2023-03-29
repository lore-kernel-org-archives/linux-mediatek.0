Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8C5C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITsXYmWdm8bbIlPl+WjhWF1RolkMvLm/Ssz9gxboyio=; b=KjHrYIm+JzcY7MUQ5wRUzGxOC5
	dNtCFHhW+TQGrU6FHWvYvT87s3ypirkbrzjP8M+gw5zDkvaLkTh7NbKPUzLsDP1I6CEpSyO92RVjK
	TO1JPTHbpbcPdTLwi9uD7rEYQY7ZsvV9wupAtIw6OTXVejHWnMPxQC43YDIuPM4pLb6LD1tvCUCnz
	8THo8Z6skGxSoBz6eXjmU5xH5U0baEF8vkRZrcboe7x8g0A8GB/oGEoQ8R0rYPgXO5mT0Dzm7CA9z
	7KmMatbmGhvIfQaZ1u4dxQbNDaxdFWhpMPfL98PlLdNOyUKOn5tNEuYD9/OEQKswlfOZ8cUUy8L5a
	uNCVhMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSUA-00HNBz-19;
	Wed, 29 Mar 2023 09:52:54 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSTt-00HN4s-0G
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 09:52:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id y14so15022990wrq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680083556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITsXYmWdm8bbIlPl+WjhWF1RolkMvLm/Ssz9gxboyio=;
        b=vyHg6d1Mka0j0t+v/2rS+UlUcsu3DFXIRh9CJ1gm/mvVuZphiOZq25TSRMZoMPsdA4
         +T87uD15LK3tU1b/WCsAfBwu4ZqzKomb75OSbJY99CiZM80aW3oRSW4Oprq6newF8uX8
         vMSB0TTkLoJ6D7ba1B1jahqBth8LgDm3vyvPx5uLN5A5LAFoSNMi10gTEQm/GWttijSH
         ZZN4PCc41RSdzdKjuk6sE38gRcCOpUn2H0SLtGN0xD5t74MQgDP2K8AVigBJTGDAPGQt
         Stgl4WbFVv4p2Q5cJYx8zBExtMuukj9PFxk7wXV45q0IX+7QuHIW2Zv/tDoL0/EgK3E1
         JaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680083556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITsXYmWdm8bbIlPl+WjhWF1RolkMvLm/Ssz9gxboyio=;
        b=PiaMbGvjfNw8yWKpPv5wXSOrSrmK1oPndPT7p9+0oXUYDYw1RTEHM0l4uYOtkVoajq
         qJccWVgwVB2cBg4vjElL0yvhvD+gdBpSB+xQxUFSCaLBu+FSjd6pIFZJid0BTfJXfgfT
         Q/6LBx0fFDN/gEPOV+JRhfwgStb/qyZeaf8E7JkdNtFe90ut8mFCtMi70hzJuTavHVMe
         Jl2BhnaqyXYpn+U8ALs88SThAENAgztMK86Ue6TrbyfVHiErMSn8NsXu2C6FUug8/2WQ
         YpTER+pdbjY+MwfmxR3dAroxcFl2D0N/dyGN0iILDMupBuPMHhT7fF4tyysX6ipYEWQH
         WNnA==
X-Gm-Message-State: AAQBX9fH8AJDphSJrpPgVVQ5Pq5DLJTHGs+mYf5Mhx4AC4r7ksVGLmYQ
	JfNsIHhYAJyLdRltWRqzr7Jidw==
X-Google-Smtp-Source: AKy350aW13UbN8B088JwKLmgCmgH5KfnTJVskMiGbea27enBo9BkH1Gl0rpSin7h24t+JNM3gCeZPw==
X-Received: by 2002:a5d:4dcb:0:b0:2ca:8da1:db96 with SMTP id f11-20020a5d4dcb000000b002ca8da1db96mr13854363wru.50.1680083555852;
        Wed, 29 Mar 2023 02:52:35 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a18-20020a5d4d52000000b002d1e49cff35sm29667158wru.40.2023.03.29.02.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 02:52:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 11:52:23 +0200
Subject: [PATCH RESEND 4/6] arm64: dts: mediatek: add smi support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v1-4-4a902f9aa412@baylibre.com>
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oTviy6aar/3azmPvk4PWpNpnaMyShkhx+Aj3IrIsAQE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJApfVGbQXStEbLyxJZZ2heAAFQwrZKjJYK+BtSsA
 93Jwec6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCQKXwAKCRArRkmdfjHURRwtD/
 9lz9/Xq7V8FM/c2aDIcxwEKCj95C9+ZMNpUXfSJ30grI0WKp6zMPdEd3apg9nfB7+BEjW9Zl5A5aeV
 qvLqK39wzzw6DxxvCRqyaoisk0OlKGXL92SrEUaejRyXjh78JFOxEKRm2WrWD6wKbwa7Km7e6ZNbc8
 xMB5UCc0J6JehS79xn8US9xiO+Sbs7ZSwGMZ15lra7NNfYlZNHgj81sxOAx6KSJqXbg1Dyp9tTV1wJ
 cM1FRnrPYsufMQuCQ6fF9fhpU3zPOTqKhVSZFkz27kNOXgNieGy+xLr8tOXBL9rY0VMeyIzGYqqhOi
 M4po2lWQkIHX40fszfCrfCLNqhvTmzzvrMiLo3lCgijRUGieZp3VR+TNd2FKwQWWVtI4Utr87zGNYJ
 lJNnCd4SmHZFUDJrbAHtux+SEuqM784uJXXF4zvIQSUGZrjD255X0Cm1Orv3HEAhwh1OgDf7F+r875
 4xbHCZsxVMKTtOPLmxwwe6Dxr+zGBD0KoM7m/6FVj8Rts4/wKBZQAKVNwUp2x8MVX9T5ITI26nbfIC
 dIAM+VjOoh0Y4A+I/ayIHuwNn7jEHaxlxP++BRxL2m7Q2w32sDjUMgDvN9+h7vCUBUpqt0Hcs8rEgi
 TB+++i/PsIkm0jC7qu35aQZHG1zOa9AYH2gT3Qkhhh3UU6/FgV5tBmgrVO8g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_025237_140578_3AAB497F 
X-CRM114-Status: GOOD (  11.18  )
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
memory requests from multi-media engines. Add SMI in the MT8365 DTS will allow
to add local ARBiter (LARB), use by IOMMU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 67b375fe2020..61333800ff4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -324,16 +324,19 @@ power-domain@MT8365_POWER_DOMAIN_CAM {
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
@@ -351,6 +354,7 @@ power-domain@MT8365_POWER_DOMAIN_APU {
 							      "apu-5";
 						#power-domain-cells = <0>;
 						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
 					};
 				};
 
@@ -709,6 +713,18 @@ mmsys: syscon@14000000 {
 			#clock-cells = <1>;
 		};
 
+		smi_common: smi@14002000 {
+			compatible = "mediatek,mt8365-smi-common",
+				     "mediatek,mt8186-smi-common";
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
@@ -720,7 +736,6 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-
 	};
 
 	timer {

-- 
2.25.1


