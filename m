Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3562DC76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=; b=T2mArrPUJr24iMpy2vQkR7YUcK
	UGBfvUPv3yIHz7TDpQORomiTk8etSq8iOdc7ehNlZ7gWWTvij6xUtJ2AAr5lZYi5Cbi6l5SIPb0ed
	q47juvgB4NjkY7dmdmZ2VD7oh2tEBtG6cOi5wxr1KhQTsCJkVtAugUZr/7OjXt71nBCV7VJ43Abbt
	wdfAIOgY44FpkTTWTEvK4NqJjvOl/7491WIuD0aSTgCIfUovgc3rssliobyGpXHOKrR19PS1youGF
	+R1DPZBQZNwjuZ9hkxxi1sWjGPOKUJyNRLJNaD9DLW1+LZo9w/MVztn1LsXsn3mTZJUat54MrfgCM
	8ldqoUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjylp-003piE-1o;
	Wed, 05 Apr 2023 08:45:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjylm-003pgN-1r
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Apr 2023 08:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=; b=DwgZwuUNII/80sNyeKNFkl4OQI
	KfddZh/+xXvi4EIxKCu51bkGwNvgB44gVPz/tD2y3QoktnPqdW5gaO5sdM+Da/8kDPnX/mvVb6FuL
	v/M4OlWwciioF1F3KwRjf2Dc/AXl/cqDlrBa0EZHu3PM0kPjmmq8UwgNqQjtv8KjaOpng5UwRnJHJ
	RlqpboysPU9/u/3nRYDBCceGljywQJl9R7pvW69xeazYAD8znJ2IsO281OW65A6n3092hr4qOAOrj
	HQo8o8imeKF5SffroW1k274saVz4y/dsiFOFUYYbGuXP762BzG4AdIBgAC1LvOwpPj0B6LujVLQim
	oJZyigOw==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBT-009pUU-2O
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso640678wmr.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=;
        b=CSOBRqhTmPBUzsDZEaT7hholheXVaNotdlc0AvXTHADQUFBxE8YPydRe3cgXPcRWXr
         9jiE4XazeTmr05+108byJinD02Aa+rU4nNlA3kDdP7NOLR++2MmDi4unXU63/AT8Rc0+
         2wU0ElK+iBhhVk2P2ITCOdS7vHrvo27RJuXCnTJSWhC7AZX/bTDFRqTqFytD4zKki4Go
         k6/mGa+PHe4q3lsOeCN+HHY8PDib8MAIhP2TvA17y3d5HDcQRdCRNw8+SJEuaBpJaGa2
         UE2jWwbhmw3uus8k26LwBnF7JFLmLNnACsjvjnQ4NlvwaaRpZyQVQ2cKrTZzoDHZjlUM
         gcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8wkncoEW3UcSZNKmP1QjzM0HpYGIsR05ILVR35YRK0=;
        b=3cdfKU9QS2ozftW6yrGxoyjYRpnciyp9n40fMOWjqBJ6Tqt7Sybn4xm0pK5Gpv35k+
         AGOxtlK8gCGBbEpMs8NSc0muNJOQZnjbUhw8dSzKHMj7mzxYxkK7Kdlc90ZU8o+1FWwq
         tAcuhgrsL07K0ytE23CNurWiEBCLIzs5Nbdw6rwCkcrZ7p9jGN/e8whpVdW4eOpSrSS2
         xtOlqSrE2osqEkY+1leWJL4VyF7hP9WRkoOs26olTZohDx4ojwT7Sz5Vf5b35PSeejNH
         PzTf2i+FEZzWVPxYw+gzZx03r9Cdpl/1H0GceqFko7gO570ihFtOrZa15TBWdS6mxeZt
         hcLw==
X-Gm-Message-State: AAQBX9ePbKdpuIhJOWVa7dibUEg7vLRXlgdzAQ/ez9d6C69JC7svtdvm
	FwaA5pYakwPsT9yrgevNv7ZRww==
X-Google-Smtp-Source: AKy350Z+woD8WDWtBtXgo35l62NNOLL6b+qZotySU5zCVUgIvzbiH8gCcU7fYavFDXSkx2LBVAWZag==
X-Received: by 2002:a1c:7406:0:b0:3ee:18e:a1ef with SMTP id p6-20020a1c7406000000b003ee018ea1efmr3693282wmc.1.1680682076428;
        Wed, 05 Apr 2023 01:07:56 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:56 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:50 +0200
Subject: [PATCH v2 08/10] arm64: dts: mediatek: add larb support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-8-60d5fa00e4e5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/eg96dGEgFTbseacSYltO+tu8R5mtjKMtqf32ClmdXM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxT/kwfmQuz1cs8/FnyVaH3Vl63Ko2+7dIkEyJ6
 oStPF+6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUwAKCRArRkmdfjHURaFTD/
 0RNpVWhe/E8a4yB9QePEcr5olvPNzP3WhMyM1F/PksjGuSEXpt/e5dcoZJZLoLUsN/jOvbONV5xKEl
 KSFuokyVaghFvBCI0qqr5iIXTKFuK/VRsGXDBLzONwE9VT4q3SarN8bjOJrOvqcbaKDXwWa80pCjYy
 PKb4dV55LexdhZsY+xGoUI3iRmkDkZfvrJVl0VE0THp0SAVyo0UYv/JCuicesxWKovTBcr6K7s1z9L
 rxqoupOnOvql6rDslMWoLwG3UZao2A21/7e3Py2zRZYfu652An8ro1JxGGHevN4rXXZDfezP1m1QAn
 J5MmpETamxmHyKXZR6YeD0R0iUNKk0wmOsrIn5eaxgtLipUojxkukDx7sqxv7Nc66QrR5ZeCU130XZ
 VX0Zsh/whM+7ZZ/11MnOOBVXfJ6jKPuRzLpNmuP2uckGqtIltv9c0DppsfwpFzJnItOusOUouPRrMj
 dfNZNjKE8TgbbSrlMzOOviKXQKpRwd63Xgc2fsxdDB8cRAJbmW9xhLjZ43/ftpiVWwt8wdufT3FACB
 LEePTYUSnQz6ECDUNLVqG7qtAlhQzjyPqGdEnKVhGljex1/+2WMONMdc/zvsRfW9oVEndPxAfiBKV2
 ywnePbS+JWGDpudxFZjeWYmJHfo0KCUXNRdA+PErSPF2xD5N+f/sm25fiUAA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090800_090952_71FA8C17 
X-CRM114-Status: UNSURE (   9.83  )
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


