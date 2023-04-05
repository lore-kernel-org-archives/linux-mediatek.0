Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2197C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=; b=47IwDaON+iro5hcY3k+eBSkBlW
	GnbFc36oR7VcPaBVR/Tuh6UeWDGmlCY05o3RZ90RFrEDCHNeGby1qYuEfmsmxYM3ragliuS1SyxxV
	XHEkUS+bYHOzFyXQfLdFKGI+mERRPmay9c4JTW9coxy/En9Pxw5qmZ30aOYKv1lBWes0OBJjdTCBj
	BQIU2FDTIOb8n6431JutBQudfq3Vr2+noxB27xfrNBtSGPgmTDYd2F5py3j+rUHvShL/gOKaX6VZ0
	s+e7bwUJIQZwxgnNw4OWzZADTDC9xQlVEj15yX2BYOGoPPCVhGUI85yklfkdXaLIDyTeew4gi0UUf
	wRAP19Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjylt-003pkn-17;
	Wed, 05 Apr 2023 08:45:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjylo-003pgN-1h
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Apr 2023 08:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=; b=ocU7Z2LB6dRTFqv0qvDlay6Fgj
	gc0FFVRN3uSO9QTf3OKgPmRx9lv8pT/j8fvimH6urCtvMiw9/7ELZEu+UoFvEQga/8adZ0RQXncCE
	l+XNGyC41568a8by+p+KYkUvY/I++HzdS6An3jRobpePZfWoETXbYS11UPgviaTSpmMKdvJTrgdGR
	ne+ufCJP/3zcHN9SB3YXPpC64L50I+xCdDU2KluVr61Ekk/P0BNoObyrsrMSY5+ym6CTrMiaGSmsg
	yrXdyYdsi0NBOPde7S8Ck1GVuZ/SdMK5BIBbDmeh92n3xu0Jgis7Dtn/Z86HsSHsukzZsoIhPlp4R
	vA3wO6Sg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBT-009pUS-1b
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so21461399wms.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=;
        b=eeP894lK8vDYZvEdMPg/go0rW2JiNyxXyguTSdzNsHYp8A7Jd/nbTTbyUya4Yos2hp
         BUttqMhu7Ir9RNscSKTDxc33+4QkWcNBxkei+DmYtrtOVR9GahoxWf+wm2W7LF0lf/0O
         Jnia2bnqv0uXIdrROJI/Ve2IC11dXJI3jJohPe+dl3DvYaM3rf79PzjHXVCghZFSgku2
         y5FeYl4NsRYWG1KIm6Lq9zMUmnIB+xh6Rfq+alO5G7rh6EoH55gcN2TaFlAMXAVt3xTS
         Lv6+9/Ms/Ps0ZaAekcXwXKIASZIF7NkAmKjndd0PRJi2X0rxW6A+FZubqWK+Ef/xSigA
         /QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tORp1I37+JIRNlLfmuNLwniBkIh0XbsRy1El1Qwfh5w=;
        b=si2G7mWD0FBbSGM/nzjk8bSmgSd5n/5wdcTySUD+Nm2whVxIcWXgZGjxqw5/+kuhW0
         ZZf6Qf4mutgiIaDklYFD+vNNSRO7oHN29sftM0hB/R1KumIt9O+itFDuFe/C2aKaWtza
         639KEslSeNvtwDHCoSyYsz4a5OCXm2W8+srf5+k6iVBPJrY0MlO3PkG7J1fiAHGQ34QH
         pyX0+Om3pmYlW/zNLZFzL6bY6dQMVZwKnItnSRYbuwQ5o/qATOamMPoeX/25HjTIeGeP
         +Z2hFu8QqyTDkHrSa24fAAwiHpY7ec6z+ZajtwPnw5HCzXZ3g0saNBEzXLAgXJXVu1FV
         gFaA==
X-Gm-Message-State: AAQBX9dsKWUJZT36Tx33PeCakl2/gI/il2dpMUpC1ciWqrJMRbCN2J1s
	2864E6d33MkDWZHjCjqkLUqN+w==
X-Google-Smtp-Source: AKy350azRPXwLmeuJ9HfGFndgnxQIBgT/MvaBdrj/nuQm3xqNxg2dd5pm8+rxs1hnFyGYbhtiLAZ1Q==
X-Received: by 2002:a7b:c85a:0:b0:3ef:7594:48cc with SMTP id c26-20020a7bc85a000000b003ef759448ccmr3977617wml.23.1680682075524;
        Wed, 05 Apr 2023 01:07:55 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:55 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:49 +0200
Subject: [PATCH v2 07/10] arm64: dts: mediatek: add smi support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-7-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=J4LWefgCJNgBuhY1OJrPCpnKJtdzqFO3621y4agMuJ0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxTwyToUcCkEHjH8F8sUZh9X6+owHowBT7aSF+F
 7lPhpA+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUwAKCRArRkmdfjHURQzhD/
 4uBQiqBMwYx23RqLaC+0SBJRWWJN627CQImPNf7tP2RS7dyG2Nw8XMgZXBIVKCFgo+kzUHllX/iRiD
 JhZg8HMjto6Q6CAMDCXWWl5nSsd1VdK7qJpJNEQc88kCrMSSPVSkzrw5fthDnWvqBaXzmxrwUMoBT8
 4wLc+mja32gUQDBCjLLXxUBc/EfVHY8TH+8KoZeJ3sMIT+7Cur4nV0t9DboE5J26RLcmkc06REARH/
 n53/YDmRNrUXs0mtDlRgwuj0DJTH4faSO77slamIUvwRIuRtuYC5ruOS8KyMTNngQs3vs9f3r35DqC
 Qnh0gpN+LSd5vhyZaTiAL7uO3RXfdQGVQmS/4+GyGidH2aoMT5Jr3JIO9TABz7fVaTAVrT9LKR/Tij
 BMj30JKm6iabeZBDBg4Ah3ivT9Oico1DZayOdR5LU8BKtzjf66MpUlsWNRCoJUGoyf/bLv97ty06jN
 WrbNC6iuR/3om98bPgz8ILT9sSzWgv6N+1v6FrXRzDhXNTG6YVSI9p9t/XK3i/kNeospvF/GKXvkMq
 WaztOQJCReoxY0q5+FUtal1FF+dUWYCvkFuKMaPJhgWrMbDpXotFe2+L5LXHuhb2HqrCzxMA9HP8Xh
 NTPHy1BN/371OJ9pmEfPL97qwABcmJfvJVB++O0DONrHN8jIf9G2Bji/YBMg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090759_877113_A4380E25 
X-CRM114-Status: UNSURE (   9.65  )
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
index 0e4fa69a2415..70915beb513c 100644
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
 
@@ -709,6 +713,17 @@ mmsys: syscon@14000000 {
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


