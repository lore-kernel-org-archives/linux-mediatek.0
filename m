Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30ECC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=; b=fkpXb3fqc3hLOYxXKSGwB/NlgN
	QEU6x7PwkyOj58iD3iNyTn47sge8z1z7LmIazdVC9qPsrtRq6AKtSslsX1IrqxN1hFndNNsSVAdKy
	u3gemFUECfWZZn9ES0IaIl670TrchK+HxijhOVT4/omwaizUA8/48W0193PdWj3Hc9D5GvK9Q2jeK
	aBd4doPOYvEi5+sNOBSvzH04TWi0y+DZe8bb9dFq56CurCF9+51G0U39I9MzFuR2Zx9B0Eu2g/XOh
	DeNEjhN85xEQrOBCk70PDSa1luCLmvAS+7t5YsX9oMBGQcm+lyR4f1vzNwpQMaQL9brwrjTDhq/VE
	9IFAKAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUj-009gE6-0P;
	Fri, 07 Apr 2023 09:34:57 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUY-009g96-2C
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Apr 2023 09:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=; b=bDfn1ciR6s0y8Yq67d0FQSzVe1
	BbnIEI/g4zJjdqfqdlunZlUfH8Fs5hnj7Mnte9RtSVJo78cDG92HTMPP82+jvC0smXVaLuk4t8w3B
	TLRcS4moZioTcdNgTSkk7pk520j4fyXNTB65OCWudV30q3KbwevOSmM+Qhfx7taEOeWpmog9+wu+k
	301WK80PHDgQ3bkkEjXfLMZ9k4VJZqvWd8pqAcx8jo7DEmJ9jsdgQNXDMzPtnkIZllnn1aXnIyUv8
	jwWiZkJftt2xUDmYGde4hyE0K/eMPpS6HYi7w0ButapcgwjP8TLUqFnliZfBNRqC8swx0cn2ndkKx
	xDAHRQYw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUQ-00AzDX-2a
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:34:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id v1so41849747wrv.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680860072; x=1683452072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=;
        b=G+fKrs4Rnok+T9yu2dpYxTmWAs3dOQ7vbOz5QdPnis+h4koToGr8bX6tycleAtiA37
         7ugBnFSk8S2CGL6/QOAkQgm/oZdsXBQtqGNeQ6C9AXvJ6N2lcrmeXyPm5+mS4Ia4KnVC
         Of7ZxgiUyQRbBbs+XXMrt0lGmmPXFthSRGZCmbAwWgUWmgLBXwF58sWPTjVSuQSQb1NH
         9IDgUDsjGkZIV77mG8sJDUrmRd+7xsm8NJmkEQrKMgAnC8iEGbPzgJV8M9ZPlZcdGPSn
         7lTbsufFJoAfOcF6v6LOqo9zdihkTcloXVRrPWhSV7O6inRolkh3Kx6Pk0hdbkZHlQH4
         OKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680860073; x=1683452073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=;
        b=TjB/6n7OZPAZ+nRKM4np0Xl6KH9kGVOIt9WSDeJZByvok/5kp3jPw2oWHjxQUwpZcx
         OcjpqF3HDiNVZoA9u1leJunk8cw5k/8xPCeTBBO5TbJgFjAfRazRlqyzBBpt67/lkqT2
         Me4NoSHDrKMSb7m4KBY20O2NEHUiQwP6wusnh5JoCROeBBexjG5x5r53o0DDe7o17GaD
         hvMKRvfLXP1em3wjd0T30nguMOiOK2L7xk3e5xoxRPxFNcPiRUlFLJjUPwEENBhGpkxv
         LpZ29SDL2MxonNcQGkzKPxPotMTZLkAJ3L9++UPtSD8bJ3nrMFr3KbtwN9vvUqcurfJP
         5Ulw==
X-Gm-Message-State: AAQBX9cZ2zr9EEfQsO0FqL79ahjrSS9BBRQrNp97lf70Pj4ogn4wz302
	kenBRWLkeLL66oJlfufGui6bxA==
X-Google-Smtp-Source: AKy350aJyj0LUObDGF6QkURIbj/dclVOrpykWjc8RqbTL5P++90kDPYRhFUSx9890NzrvYhvhiUokg==
X-Received: by 2002:adf:ee03:0:b0:2ce:b7a1:c1a3 with SMTP id y3-20020adfee03000000b002ceb7a1c1a3mr998008wrn.3.1680860072739;
        Fri, 07 Apr 2023 02:34:32 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d510d000000b002d64fcb362dsm4020432wrt.111.2023.04.07.02.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:34:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:34:17 +0200
Subject: [PATCH v3 6/7] arm64: dts: mediatek: add larb support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v3-6-97e19ad4e85d@baylibre.com>
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
In-Reply-To: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/eg96dGEgFTbseacSYltO+tu8R5mtjKMtqf32ClmdXM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL+OhAHQ1FqZYfC72oBjPFXJ5fQNLH9cxIalmzV/J
 ZfLtvduJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/joQAKCRArRkmdfjHURWsEEA
 DE/WrZfKEfR7OQxQ2VlvgVUR/0jjuKcg7X2Cgh9UAltf6sQT+Hbj66w1Ty9fv3rTvNU4N7Anhzv5pE
 hy4NXMYoRO/+qVnfkIMQLQDLZffN799KGzWbh/xNfhH3exmfCuTQ2emeDGrAUZ8bFXJH/v0RGp45S2
 9e2UBjmy5ib0xKBi9P8lKmx2mS50YhNTAaihC1jitXfALrfc6HP/FikAQSlY+BFiX9hDYwwYURaX2i
 o60+B+ymNVmUsCw0SLtWdN4YN0uClPbaYdVCIFYMmlqJVAAaPCfqLiF1YxPViWaLVuTmS3Ylw/Cq/v
 KFClmwOEVxo49P//NQWu0n/7K5+i+XAwo6SvDWucr5O42YnXJDD5w7YMk2nqzeC5mb7ctyjBZkkXlg
 KxQQ44dn6DHX+XY29ATDNwKdBcEWYpTxqWYNB+ZxE0fiuVkQTpLvMARpRp9S4ortu5CvNitzvgp9wx
 zvCZXu/aQfkSP2juKeiqqD/4il65nNPd00U1/a8ioixNEMOMcfyvj4QSLSkj75thT1VXNAvIx4XZrF
 dP7KV5tABzRJ7eOEWw9iyjS4YgdMRIjaAEMrXCHAxMiQkDwN0EqrOrrq+3kCf/y3Okdfq/bAP5jk5P
 LnDm9fAeFPQoj/KGk9XZg24wAJLMMInusHgU7H2pfxLZ9zC4DPQYcZpqutLg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_103440_629226_BE668D35 
X-CRM114-Status: UNSURE (   9.68  )
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

Local arbiter (LARB) is a component of Smart Multimedia Interface (SMI),
used to help the memory management (IOMMU).
This patch add 4 LARBs and 2 clocks for the larb1 and larb3 support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 59 ++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 70915beb513c..07a7267f338e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -724,12 +724,71 @@ smi_common: smi@14002000 {
 			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
 		};
 
+		larb0: larb@14003000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			mediatek,larb-id = <0>;
+		};
+
 		camsys: syscon@15000000 {
 			compatible = "mediatek,mt8365-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb2: larb@15001000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_IMG>,
+				 <&camsys CLK_CAM_LARB2>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			mediatek,larb-id = <2>;
+		};
+
+		vdecsys: syscon@16000000 {
+			compatible = "mediatek,mt8365-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb3: larb@16010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_LARB1>,
+				 <&vdecsys CLK_VDEC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VDEC>;
+			mediatek,larb-id = <3>;
+		};
+
+		vencsys: syscon@17000000 {
+			compatible = "mediatek,mt8365-vencsys", "syscon";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb1: larb@17010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC>, <&vencsys CLK_VENC>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VENC>;
+			mediatek,larb-id = <1>;
+		};
+
 		apu: syscon@19020000 {
 			compatible = "mediatek,mt8365-apu", "syscon";
 			reg = <0 0x19020000 0 0x1000>;

-- 
2.25.1


