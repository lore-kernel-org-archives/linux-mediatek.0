Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBC1C7EE31
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=; b=p8vwzRGNKWULhRXtv+rooIwVVr
	Af2W3Hw3lcKTTMSR6IlxStFcyxFvbRTDw7Vpfg7NULJpD4CFgKnsbcXb2d01o38og6s3TSfF9OawW
	4dPH94h7bGq/y47dm/nhtMnnQLjLQ29WO6lJZMRuIYuq1hPyDaSPxiOa2SMaGHQ2nlRU8HIRKzEDb
	0xhoqd+90srVbsF/S3N86GH4B78tlOyo9Wv4zAWIMTG2Wz8RAHyl9OhQ1LVV3vL1gDG2Hwb+BWlZo
	Mmlmt8mCa4Zmv/atBwC9ymAh1kTWEaivL80DCCJwCV9qbRUZg5UO1EMkbvgNMOGhFgYa9aHFAVCBW
	rvG50Zuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NV-00G9hA-0O;
	Thu, 25 May 2023 09:35:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q4-00G0Nw-1o
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:34:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30a95ec7744so1767836f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003637; x=1687595637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=ZCGAbdgXCXYDsCVFtmnECOBT5WP2ADILUz9yT/5vEyRqykdrS5zfQQLcLie703Q2vw
         sxlmQh+trkLZBjESDlmT6/A77gjMjNP3+XAYCr1xrSa90A1Cut4KeNY+R+0/nHQ2BxIH
         gmvtnKBwS1nwSS8kPyvoK/V6a9PzwwmMT5EURpa9a12lbxp9jKqDeuWfmC6E7zjA61TB
         ukKYVsf/xZI60BZ57xAANm37s2jgmCUV/0ZPst+LBVtnyPeYCoY0FReF8bp/bgwqvU5g
         ouh6ccna/givG4NbwIhXaw4xjab98Fx+/IKMinEazT8WDFr6fR5hT9foXlzUem/Ppzyy
         sXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003637; x=1687595637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=hHD6ggcE8Yg+IKT89NJWDaMZHIe6ThaH3GA3rhf+nKOliDgo5eZ6V0Z6VROS5Pwmxf
         UZCVS+ohDoocJKho47y8GJLRCIM3XhrpRhzOLIkVgxzkQPTh5zq1TAy6EAvdXT4cRjOQ
         dZE4vZTpgwJ/OGehdg3e3zUEsP//KiMgIKtLB1gidEZOdKz2PHjzNCalUkwLhP58Bt1L
         23dSyiu9+Ois+LAEqNa7onvIfYgFeRxtVbbrLn5/lyubQeemaMgcKW7C5Szcgc6cGqoi
         KOOwFEbawWgC85vmbS9mYb9Y1B4DdJy3HbpknsPtQdjEarUpFutDOqcVtuI+LNWcPM9h
         RydA==
X-Gm-Message-State: AC+VfDwnytc21KMJjz2PmHzi5hibw9Y4SAJMDo5YXUvC9kuDbiTKAQSN
	NmoL5S/Ew5vbfrHfZYWHOHjoyg==
X-Google-Smtp-Source: ACHHUZ6NcwZ+FPVEwSPwGU4TT6xlYG7ghCbQwCjTXicvKcWpYEiHaPck+e+02FRlIex3qeCUIJsmCA==
X-Received: by 2002:adf:ec4d:0:b0:306:2db9:cc2c with SMTP id w13-20020adfec4d000000b003062db9cc2cmr1885209wrn.32.1685003636901;
        Thu, 25 May 2023 01:33:56 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:33:56 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:12 +0200
Subject: [PATCH v8 03/10] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-3-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9yZG6Lt2sYetnfjl+HHfU8vcDGstMCEZ7QfVbikE4Lw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1vNSdMsmnHxJfKXxkhkVDFUZdZstbXniZEAhSF
 PqyPPteJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURSHoD/
 4gN0l5X5LvAdG3O8LVaxW4hbi6wkoRPqNGSZNxWA2LNDNhvLypC84tflW1dqzYi6cHZE9e1QQGNYyp
 S81tq0Ya/Lz/+UEwmabof0XIRJqjp2XLGJC3keI7Lj+OycSXr/jz04/fB38VuxxNagstaArMzgOZUK
 Eq7n5Q4TVJsuL6Kmd4MvEC+8hrJP8T8p3nwMQa4cjtgYKlm84GdPto7kbE/2hrw1KQPtiuFLDyEDv8
 VGaTENuxs+foz8mAgrQ6KPpbrmke0GcwdALY5OTISsEM0xngrDB6aiZRcDuN1Q/EdAslMzQnZlwB0X
 ZNfoP/P0RzNU2hPiQNwcBgD/JH2+sbXd19/Acgqp2n0zJ+3uqtHO0lmpnkOsfuygMV0QER3cZDV8B4
 tdTOK6Chkuq1msbkdFQ+QF/hx2W+YduaCAEIjJ12Pt8XSlKyHl1/y6JBfnDFOZXiwm91Nie3mRGjhr
 Jcme7xRHxCDVO3Syhy6x7thJKZALDyqsxjggnNz+GtAsEvRSkpcXRSOwyOjZ5MYG7WT0HWu6S41PAG
 /TdD/ua3MvaZv0QkDp2yo1tA0ZxLIc6pfMOYFMZUeu4P01e4NTmHhdHEV/S+M1oM9FYVGh+93pA394
 v3muDrQ6mAXOfV3iHGsfql4i+ddMZja91BEwAYbyS8hqwQJ5I6gHaFf26E0g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013400_634150_D5C74704 
X-CRM114-Status: UNSURE (   9.29  )
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

Add watchdog support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 1f6b48359115..bb45aab2e6a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -162,6 +162,12 @@ syscfg_pctl: syscfg-pctl@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8365-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;

-- 
2.25.1


