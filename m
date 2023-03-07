Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6F1C6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiD1jGNfmWPjdfgXlaXHwcnvI1OsqFwof1Wcy6nVM2I=; b=V/LPHb96ZOQw4pArVIQrupd9NB
	gNL3f/5b8/1lL+tSwnee2ggmulIegihJVYedtm09sy8y4pZcaEXCPXmz3AL6e6IzKnOdBjd+xIVV/
	O81xnqDol43YEsPULl5ijB3WUPt1YwcOda6zB1Bl8jumzDKm5cz4TSxHG+cQnpPRiMCrBpvVTeJR1
	EQBb2prb9f4riNBzq8tlHfj0Cf+BDtzGmKfwhKtPTSRcVL3GtwlfOb0rrx0IqJwMUVlYQkmAuBkmc
	D/J+nY4X4HpUJPBDzOYB8uEhRclK7tfF/VyLHicAycRWtF1GOit/M7FZItoA5CZi7VB+RxBpD1nB4
	0sBr4ZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXvA-000cRX-Nf; Tue, 07 Mar 2023 14:04:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXeN-000V4j-EP
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:46:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id bx12so12147000wrb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678196800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiD1jGNfmWPjdfgXlaXHwcnvI1OsqFwof1Wcy6nVM2I=;
        b=sF/Usli7kkaMJg9fqNQR2RN3tExZk4+8j2vwRRHt99Ct3EPd9Cbi12QgJcdkDQqsMV
         BENMPAuud2wUkK24443HBtEjc48OkthydjGXsUcJJ4v5Oa2B0IXAxgSoJizz5RczacbZ
         XPCNML3KhL4ODv+VYt0NeGiiuvO41WR1STG3+sRTvNTtTfZ+hR1kNyiPJMroSBQVwsZJ
         g6tsoPkvecMJDvMCj1pvgsbOSz2xXtSvAxWcM0dwDhePufD3XhFWB/KSsRn/1bbvhLAQ
         S5Lj2X9mDdve0K9a0O7L0s8peJU4s2cSaFrYS2H2DqXkA8oNwXXBeZjSU+nikLb0abtl
         TvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiD1jGNfmWPjdfgXlaXHwcnvI1OsqFwof1Wcy6nVM2I=;
        b=n6gpvApYtCvr0c04gFIvPaTAeZhinS+KBRptkKgYhayVMaLWsZ6rSnzOBJfKljjhpE
         0/nUccYSWfMcCUOiv7TZZUME0W2G+OU7CCCtSAQuZLJNQhLq3uSTyBRkhfizQJZB/hEV
         9niPqPpDh4wsH09TvDs7vSdlbRnTxPfK9uYijbh1NbLEqndA5+fCHuVZO4gwqLnH5IeY
         4zm04U+IC3zRynZWZnjET0eUQ66e7EcgA3ComI7GYi6WChNx5cY6SBZAUvs3U+J+R3UP
         P3X4+EIb1u2E87V2dNyXo8WU4xkRSp3i77MiUcSYByWFXR7ATOjIj3dXeaKWxO9v5DaD
         9eTA==
X-Gm-Message-State: AO0yUKWbG4k8FZDUmADrtUjh5wb6gr/VCuY7IR9jB1qOT/s8FwRFihqC
	EL4GB8+Kcf4t4tJf9PufZVNGag==
X-Google-Smtp-Source: AK7set+4LLeARHWHlJ21fLaACA85Yg6NVqJ++jzgrq+VvBOyk7RHx/KY6buV77yrNV3twwbOh2HC/g==
X-Received: by 2002:adf:f448:0:b0:2ca:e8c2:6d29 with SMTP id f8-20020adff448000000b002cae8c26d29mr9228862wrp.7.1678196800148;
        Tue, 07 Mar 2023 05:46:40 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm12657607wru.114.2023.03.07.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:46:39 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:46:29 +0100
Subject: [PATCH 4/6] arm64: dts: mediatek: add smi support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230207-iommu-support-v1-4-4f0c81fd52c1@baylibre.com>
References: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=8Utuzf8vnkkr4HLSj6tVwRat45+MSGUxWim3O+x8mr0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkB0A7ZT3peawJygVrc7zIOmQK2eu2/NkUJKAXx44O
 NcT7aE2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAdAOwAKCRArRkmdfjHUReLVD/
 4lojGGLFnZrYGkcB0rp+6wSSgVkNlIDEaTmRBtCB08m417n1STAtRI3sET3VknYAqzm2C+8BVxWTd+
 o6eWt09OTxUMAT/mxZ+29GbNkzqOZKv8EVjbAnFnCWln2+nodvXZDsE1VOUnj/ll0OqNtK2D8wB0TU
 Z6DSNZy3VvraHoly8gz96u+CW0ZP3ImikyFWWJB9kB5kkGZ1xORMMKeMsC0tQgj2Itu0gbmk6QO+n9
 enmIm55j4rdDWIkrRNrjmdrtClXq0W9BoTvPLkeX7anmciBdhBpzG91V20N0fpwIkwEESGZn/apQ0V
 tnyVVVDXlaFfV87ynZlS5Zvv+0v8f0VwsN1w79IS5zrYvPD0WAg+l8miSCDfrnfOrTCG5FzzhctCjh
 kC44gf5kRimqk/TK078eJUVjuJAADC94j6A8/ZgzZpXu8NPpWrik6ERWcKaYwPRCRJXEYdITIuKmqB
 QBS6Nhlt6K+yBEluIqcwJC73Q3un6DfY9FgyQG6VRTTkMUi8wY+m6Ahx4INcEq/5YmJzGBjD3xi/xi
 A5N93wRyiCGoe9VKJKRrg/qyYi7MELFU/M4N3aprDR8hzqGEZguetV9IasqmOEjGkvYE2j8pgTBVfC
 y7EINJuyoh4sKZKMXU9SisziJTeRpDxAZSqIoL8jTy956zaGRaZBh+NdhJCg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_054643_570199_F7626BF7 
X-CRM114-Status: GOOD (  10.48  )
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
b4 0.10.1

